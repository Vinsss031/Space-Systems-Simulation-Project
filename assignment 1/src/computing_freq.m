function [freq, pwd_peak_freq, pwd_max] = computing_freq(simout, RW, plot_flag)
arguments
    simout 
    RW
    plot_flag = 1
end
    % Computing the analytical frequency
    J_combined = 1/(1/RW.rotor_inertia+1/RW.flywheel_inertia);
    nat_freq = sqrt(RW.shaft_spring_rate/J_combined);
    freq = nat_freq/2/pi;

    % Extract signals from the Simulink output
    tout1 = simout.tout;
    rotor_omega1_2 = simout.rotor_omega1_2;
    flywheel_omega1_2 = simout.flywheel_omega1_2;
    flywheel_omega_wrt_rotor1_2 = simout.flywheel_omega_wrt_rotor1_2;
    
    % Create a fixed-step time vector and resample 
    dt = 1/2000; 
    t_fixed = tout1(1):dt:tout1(end);
    
    rotor_fixed = interp1(tout1, rotor_omega1_2, t_fixed, 'previous');
    flywheel_fixed = interp1(tout1, flywheel_omega1_2, t_fixed, 'spline');
    rel_fixed = interp1(tout1, flywheel_omega_wrt_rotor1_2, t_fixed, 'previous');
    
    % Calculate power spectra
    [p_rotor, f_rotor] = pspectrum(rotor_fixed, t_fixed);
    [p_flywheel, f_flywheel] = pspectrum(flywheel_fixed, t_fixed);
    [p_rel, f_rel] = pspectrum(rel_fixed, t_fixed);
    
    % Define a low-frequency threshold to bypass the DC leakage zone
    dc_cutoff = 60; % Hz
    
    % Rotor
    valid_idx_rotor = f_rotor > dc_cutoff;
    [pwd_max.rotor, idx_rotor] = max(p_rotor(valid_idx_rotor));
    f_valid_rotor = f_rotor(valid_idx_rotor);
    pwd_peak_freq.rotor = f_valid_rotor(idx_rotor);
    
    % Flywheel
    valid_idx_flywheel = f_flywheel > dc_cutoff;
    [pwd_max.flywheel, idx_flywheel] = max(p_flywheel(valid_idx_flywheel));
    f_valid_flywheel = f_flywheel(valid_idx_flywheel);
    pwd_peak_freq.flywheel = f_valid_flywheel(idx_flywheel);
    
    % Relative
    [pwd_max.rel, idx_rel] = max(p_rel);
    pwd_peak_freq.rel = f_rel(idx_rel);
    
    
    if plot_flag

        % Leakage attenuation just for graphical purposes
        hann_filter = 1;

        % Plotting
        figure("Name", "Power Spectral Density of Angular Rates");
        
        % Plot Rotor Spectrum
        subplot(3, 1, 1);
        pspectrum(rotor_fixed.*hann_filter, t_fixed, "FrequencyLimits", [0, 1e3]);
        
        % Plot Flywheel Spectrum
        subplot(3, 1, 2);
        pspectrum(flywheel_fixed.*hann_filter, t_fixed, "FrequencyLimits", [0, 1e3])
        
        % Plot Relative Omega Spectrum
        subplot(3, 1, 3);
        pspectrum(rel_fixed.*hann_filter, t_fixed, "FrequencyLimits", [0, 1e3])
    end
end
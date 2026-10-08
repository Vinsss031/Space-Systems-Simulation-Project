function [E_elec, E_kin] = compute_energies(simout, RW)
    % Extract time, velocity, and commanded motor torque
    t = simout.tout;
    rotor_omega = simout.rotor_omega1_4;
    flywheel_omega = simout.flywheel_omega1_4;
    
    % 1. Kinetic Energy
    E_kin = 0.5 * (RW.rotor_inertia    .* rotor_omega.^2 + ...
                   RW.flywheel_inertia .* flywheel_omega.^2);
    
    % 2. Electrical Energy
    voltage = simout.voltage1_4;
    current = simout.current1_4;

    P_elec = voltage.*current;
    
    % Numerically integrate electrical power over time to get Joules
    E_elec = cumtrapz(t, P_elec);
end
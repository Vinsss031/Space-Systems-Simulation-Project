%% RW parameters definition

% ----------------- MOTOR & DRIVE -----------------
RW.maxTorque             = 3.2;                                             % [mN*m] Reaction wheel maximum torque
RW.maxSpeed              = 680.6784;                                        % [rad/s] Reaction wheel maximum angular velocity
RW.torque_control_tc     = 0.01;                                            % [s] Torque control time constant

% Maximum torque envelope (1-D interpolation breakpoints)
% Angular velocity
RW.torque_envelope_omega = [0, ...
    RW.maxSpeed / 3, ...
    RW.maxSpeed * (2/3), ...
    RW.maxSpeed];  % [rad/s]

% Torque values
RW.torque_envelope_val   = [RW.maxTorque, ...
                         RW.maxTorque, ...
                         RW.maxTorque / 2, ...
                                        0];                                 % [mN*m]


% Efficiency curve (1-D interpolation breakpoints)
% Angular velocity
RW.efficiency_omega      = [0, ...
                         0.25 * RW.maxSpeed, ...
                         0.50 * RW.maxSpeed, ...
                         0.75 * RW.maxSpeed, ...
                         1.00 * RW.maxSpeed];                               % [rad/s]

% Torque value
RW.efficiency_torque    = [0, ...
                           RW.maxTorque/2, ...
                           RW.maxTorque];                                   % [mN*m]
% Efficiency values
RW.efficiency_val        = [0.70, ...
                         0.85, ...
                         0.90, ...
                         0.85, ...
                         0.70]*100;                                         % [-]

RW.efficiency_mat        = repmat(RW.efficiency_val(:), 1, length(RW.efficiency_torque));


% Motor Rotor Parameters
RW.rotor_inertia_motor      = 0;                                            % [kg*m^2] Rotor inertia (under MOTOR & DRIVE)
RW.rotor_damping            = 0;                                            % [N*m*s/rad] Rotor damping


% --------------- ROTATIONAL INERTIAS ---------------
RW.Inertia               = 2.94e-5;                                        % [kg*m^2] Reaction Wheel total inertia
RW.flywheel_inertia         = 0.90 * RW.Inertia;                            % [kg*m^2] 90% of RW Inertia
RW.rotor_inertia            = 0.10 * RW.Inertia;                            % [kg*m^2] 10% of RW Inertia


% --------------------- SHAFT ----------------------
RW.shaft_spring_rate        = 4.13;                                         % [N*m/rad] Shaft spring rate
RW.shaft_damping_coeff      = 0.00033048;                                   % [N*m*s/rad] Shaft damping coefficient


% -------------------- BEARING ---------------------
RW.breakaway_friction_torque   = 5.00e-6;                                  % [N*m] Breakaway friction torque
RW.breakaway_friction_velocity = 1.00e-1;                                  % [rad/s] Breakaway friction velocity
RW.coulomb_friction_torque     = RW.breakaway_friction_torque;              % [N*m] Coulomb friction torque
RW.viscous_friction_coeff      = 2.00e-9;                                  % [N*m*s/rad] Viscous friction coefficient
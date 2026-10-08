function plot_assignment_results1(simout, E_elec, E_kin)
    % Extracts the time vector from the commanded torque signal
    t = simout.tout;
    cmd_torque = simout.torque_req;
    
    % TASK 2: No bearing, no shaft damping[cite: 33]
    
    % Task 2.a - torques
    figure('Name', 'Task 2.a: Torques (No Damping, No Bearing)');
    hold on; grid on;
    plot(t, cmd_torque, 'LineWidth', 1.5);
    plot(t, simout.total_torque1_2, 'LineWidth', 1.5);
    plot(t, simout.flywheel_torque_wrt_rotor1_2, 'LineWidth', 1.5);
    xlabel('Time [s]');
    ylabel('Torque [mN*m]');
    legend('Commanded Torque', 'Total Reaction Torque', 'Shaft/Flywheel Torque', 'Location', 'best');
    
    % Task 2.b - angular velocities
    figure('Name', 'Task 2.b: Angular Velocities (No Damping, No Bearing)');
    hold on; grid on;
    plot(t, simout.rotor_omega1_2, 'LineWidth', 1.5);
    plot(t, simout.flywheel_omega1_2, 'LineWidth', 1.5);
    xlabel('Time [s]');
    ylabel('Angular Velocity [rad/s]');
    legend('Rotor Velocity', 'Flywheel Velocity', 'Location', 'best');

    % Task 2.b - angular velocities difference
    figure('Name', 'Task 2.b: Angular Velocities Difference (No Damping, No Bearing)');
    grid on;
    plot(t, simout.flywheel_omega_wrt_rotor1_2, 'LineWidth', 1.5);
    xlabel('Time [s]');
    ylabel('Angular Velocity Difference (flywheel-rotor) [rad/s]');
    legend('Difference (Flywheel wrt Rotor)', 'Location', 'best');

    % TASK 3: Shaft damping added, no bearing[cite: 33, 34]
    
    % Task 3.a - Torques
    figure('Name', 'Task 3.a: Torques (With Damping, No Bearing)');
    hold on; grid on;
    plot(t, cmd_torque, 'LineWidth', 1.5);
    plot(t, simout.total_torque1_3, 'LineWidth', 1.5);
    plot(t, simout.flywheel_torque_wrt_rotor1_3, 'LineWidth', 1.5);
    xlabel('Time [s]');
    ylabel('Torque [mN*m]');
    legend('Commanded Torque', 'Total Reaction Torque', 'Shaft/Flywheel Torque', 'Location', 'best');
    
    % Task 3.b - Angular Velocities
    figure('Name', 'Task 3.b: Angular Velocities (With Damping, No Bearing)');
    hold on; grid on;
    plot(t, simout.rotor_omega1_3, 'LineWidth', 1.5);
    plot(t, simout.flywheel_omega1_3, 'LineWidth', 1.5);
    xlabel('Time [s]');
    ylabel('Angular Velocity [rad/s]');
    legend('Rotor Velocity', 'Flywheel Velocity', 'Location', 'best');

    % Task 3.b - angular velocities difference
    figure('Name', 'Task 2.b: Angular Velocities Difference (No Damping, No Bearing)');
    grid on;
    plot(t, simout.flywheel_omega_wrt_rotor1_3, 'LineWidth', 1.5);
    xlabel('Time [s]');
    ylabel('Angular Velocity Difference (flywheel-rotor) [rad/s]');
    legend('Difference (Flywheel wrt Rotor)', 'Location', 'best');
    
    % TASK 4: Bearing enabled

    % Task 4.a - Torques including friction
    figure('Name', 'Task 4.a: Torques (Full Model with Bearing)');
    hold on; grid on;
    plot(t, cmd_torque, 'LineWidth', 1.5);
    plot(t, simout.total_torque1_4, 'LineWidth', 1.5);
    plot(t, simout.flywheel_torque_wrt_rotor1_4, 'LineWidth', 1.5);
    xlabel('Time [s]');
    ylabel('Torque [mN*m]');
    legend('Commanded Torque', 'Total Reaction Torque', 'Shaft/Flywheel Torque', 'Location', 'best');

    % Task 4.a - Friction Torque
    figure('Name', 'Task 4.a: Bearing Friction Torque (Full Model with Bearing)');
    grid on;
    plot(t, simout.friction_torque1_4, 'LineWidth', 1.5);
    xlabel('Time [s]');
    ylabel('Torque [mN*m]');
    legend('Bearing Friction Torque', 'Location','best');

    % Task 4.b - Energies
    figure('Name', 'Task 4.b: Reaction Wheel Energies');
    hold on; grid on;
    plot(t, E_elec, 'LineWidth', 1.5);
    plot(t, E_kin, 'LineWidth', 1.5);
    xlabel('Time [s]');
    ylabel('Energy [J]');
    legend('Electrical Energy', 'Kinetic Energy', 'Location', 'best');
end
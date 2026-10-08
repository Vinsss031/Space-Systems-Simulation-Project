function plot_assignment_results2(simout, RW)

    % Extract the time vector
    t = simout.tout;
    
    % TASK 2.a: Commanded vs Produced Torques
    
    % Reaction Wheel 1 Torques
    figure('Name', 'Part 2.a: RW1 Torques');
    hold on; grid on;
    plot(t, simout.Tc_RW_comp1, 'LineWidth', 1.5);
    plot(t, simout.torque_produced1, '--', 'LineWidth', 1.5);
    title('Reaction Wheel 1: Commanded vs Produced Torque');
    xlabel('Time [s]');
    ylabel('Torque [N*m]');
    legend('Commanded Torque', 'Produced Torque', 'Location', 'best');
    
    % Reaction Wheel 2 Torques
    figure('Name', 'Part 2.a: RW2 Torques');
    hold on; grid on;
    plot(t, simout.Tc_RW_comp2, 'LineWidth', 1.5);
    plot(t, simout.torque_produced2, '--', 'LineWidth', 1.5);
    title('Reaction Wheel 2: Commanded vs Produced Torque');
    xlabel('Time [s]');
    ylabel('Torque [N*m]');
    legend('Commanded Torque', 'Produced Torque', 'Location', 'best');
    
    % Figure 3: Reaction Wheel 3 Torques
    figure('Name', 'Part 2.a: RW3 Torques');
    hold on; grid on;
    plot(t, simout.Tc_RW_comp3, 'LineWidth', 1.5);
    plot(t, simout.torque_produced3, '--', 'LineWidth', 1.5);
    title('Reaction Wheel 3: Commanded vs Produced Torque');
    xlabel('Time [s]');
    ylabel('Torque [N*m]');
    legend('Commanded Torque', 'Produced Torque', 'Location', 'best');
    
    %% TASK 2.b: Reaction Wheels Angular Velocities[cite: 66]
    
    % Figure 4: All RW Angular Velocities
    figure('Name', 'Part 2.b: Reaction Wheels Angular Velocities');
    hold on; grid on;
    plot(t, simout.rotor_angular_speed1, 'LineWidth', 1.5);
    plot(t, simout.rotor_angular_speed2, 'LineWidth', 1.5);
    plot(t, simout.rotor_angular_speed3, 'LineWidth', 1.5);
    
    % Add horizontal threshold lines to easily visually answer the assignment question: 
    % "Does any of the RW reach its maximum angular velocity?"
    yline(RW.maxSpeed, 'r--', 'Max Velocity (+680.68 rad/s)', ...
                                        'LineWidth', 1.5, ...
                                        'LabelHorizontalAlignment','left');
    yline(-RW.maxSpeed, 'r--', 'Max Velocity (-680.68 rad/s)', ...
                                        'LineWidth', 1.5, ...
                                        'LabelHorizontalAlignment','left');
    
    title('Reaction Wheels Angular Velocities');
    xlabel('Time [s]');
    ylabel('Angular Velocity [rad/s]');
    legend('RW 1', 'RW 2', 'RW 3', 'Limit Threshold', 'Location', 'best');
end
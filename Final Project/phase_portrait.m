function phase_portrait()
    clc; clear all;

    tspan = [0 10];
    figure();
    hold on;

    % Initial conditions for the phase portrait
    for x0 = -2*pi:0.2:2*pi
        for xdot0 = -0.2:0.01:0.2
            xinit = [x0; xdot0]; % Initial state [theta2; theta2dot]
            [tout, stateout] = ode45(@ddt, tspan, xinit);

            xout = stateout(:, 1);
            xdotout = stateout(:, 2);

            plot(xout, xdotout, 'LineWidth', 1.5);
        end
    end

    % Plot formatting
    xlabel('\theta_2 (rad)');
    ylabel('\theta_2 dot (rad/s)');
    title('Phase Portrait: Satellite Pitch Dynamics');
    grid on;
    hold off;
end


function dstatedt = ddt(t, state)
    % State variables
    theta2 = state(1);
    theta2dot = state(2);

    w_c_val = 0.05;
    k2 = 0.9;

    theta2dotdot = -3*w_c_val^2 * sin(theta2);

    % Return derivatives
    dstatedt = [theta2dot; theta2dotdot];
end

function phase_portrait()

    tspan = linspace(0, 1000, 1000);
    figure();
    hold on;
    
    num_points = 25;

    % Initial conditions for the phase portrait
    xinit = [ones(num_points, 1)*-2*pi [linspace(-0.2, 0.2, num_points)]'];
    xinit(end+1, :) = [-5/2*pi, -0.00000000001];
    xinit(end+1, :) = [-5/2*pi, 0.00000000001];
    xinit(end+1:end+7, :) = [-pi*ones(7, 1), [linspace(0, 0.1, 7)]'];
    xinit(end+1:end+7, :) = [zeros(7, 1), [linspace(0, 0.1, 7)]'];
    xinit(end+1:end+7, :) = [pi*ones(7, 1), [linspace(0, 0.1, 7)]'];

    for i = 1:length(xinit)
        if xinit(i, 2) < 0
            xinit(i, 1) = -xinit(i, 1);
        end
    end

    for i = 1 : length(xinit)
        [tout, stateout] = ode45(@ddt, tspan, xinit(i, :));

        xout = stateout(:, 1);
        xdotout = stateout(:, 2);

        plot(rad2deg(xout), rad2deg(xdotout)/60, 'LineWidth', 1.5);
    end

    % Plot formatting
    xlabel('\theta_2 (deg)');
    ylabel('\theta_2 dot (deg/s)');
    title('Phase Portrait: Satellite Pitch Dynamics');
    xlim([rad2deg(-2*pi) rad2deg(2*pi)])
    ylim([rad2deg(-0.3)/60 rad2deg(0.3)/60])
    grid on;
    hold off;
    
end


function dstatedt = ddt(t, state)

    global k2 w_c_val

    dstatedt = [state(2);
        -3*(w_c_val*60)^2*k2*sin(state(1))*cos(state(1))];

end

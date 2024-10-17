function animateVector(vec, tout)

figure
hold on
x = 1.5*max(sum(vec, 2));
axis([-x x -x x -x x]);
plot3([0 x + 0.5],[0 0],[0 0],'k<')
plot3([0 x + 0.5],[0 0],[0 0],'k-')
plot3([0 0],[0 x + 0.5],[0 0],'k-')
plot3([0 0],[0 x + 0.5],[0 0],'k>')
plot3([0 0],[0 0],[0 x + 0.5],'k-')
plot3([0 0],[0 0],[0 x + 0.5],'k^')
% set the view perspective
view(135,20)

% Initialize the vector as a quiver plot (arrows in 3D)
num_steps = size(vec, 1);
h = quiver3(0, 0, 0, vec(1, 1), vec(1, 2), vec(1, 3), 'MaxHeadSize', 0.5, 'LineWidth', 2);

% Animation loop
for t = 2:num_steps
    % Update the vector with new data for this time step
    set(h, 'UData', vec(t, 1), 'VData', vec(t, 2), 'WData', vec(t, 3));
    
    % Pause to control the speed of the animation
    pause(tout(2)-tout(1));  % Adjust pause duration to change animation speed
end
hold off
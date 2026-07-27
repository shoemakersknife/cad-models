clear; clc; close all;

%% 1. Define the Data (Mercury replaced with Acetone)
fluids = {'Water (liquid)', 'Engine oil', 'Ethylene glycol', 'Ammonia (liquid)', 'Acetone (liquid)'};

% Thermal Diffusivity (m^2/s)
alpha = [1.44e-7, 8.84e-8, 9.39e-8, 1.70e-7, 1.05e-7];

% Convergent Wire Heat Transfer Rate (W)
Q = [424.81702, 128.44569, 217.10587, 332.71158, 147.75275];

%% 2. Create the Figure and Plot Data
figure('Color', 'w', 'Position', [100, 100, 750, 500]);
hold on;

% Plot the trendline (Linear scale trend)
% We sort the data first so the line draws smoothly from left to right
[alpha_sorted, idx] = sort(alpha);
Q_sorted = Q(idx);
plot(alpha_sorted, Q_sorted, '--', 'Color', [0.5, 0.5, 0.5], 'LineWidth', 1.5);

% Plot individual data points with custom styling
scatter_handle = scatter(alpha, Q, 120, 'filled', ...
    'MarkerFaceColor', [0, 0.4470, 0.7410], ...
    'MarkerEdgeColor', 'k');

%% 3. Apply Linear Scaling and Labels
set(gca, 'XScale', 'linear'); % Switched to linear since Mercury is removed
grid on;
set(gca, 'XGrid', 'on', 'YGrid', 'on', 'MinorGridLineStyle', ':');

xlabel('Thermal Diffusivity, \alpha (m^2/s)', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('Convergent Wire Heat Transfer Rate, Q (W)', 'FontSize', 12, 'FontWeight', 'bold');
title('Wire Heat Transfer Rate vs. Thermal Diffusivity', 'FontSize', 14, 'FontWeight', 'bold');

%% 4. Proactively Annotate Each Data Point
% Dynamically positions the text labels so they don't overlap the markers
for i = 1:length(fluids)
    % Using a small linear shift instead of a multiplier for text spacing
    text(alpha(i) + 3e-9, Q(i), fluids{i}, ...
        'FontSize', 10, ...
        'FontWeight', 'bold', ...
        'VerticalAlignment', 'middle', ...
        'HorizontalAlignment', 'left');
end

%% 5. Clean up Axis Limits for Presentation
xlim([7e-8, 1.9e-7]); % Zoomed in on the 10^-8 to 10^-7 range
ylim([100, 500]);     % Zoomed in around your 128W to 424W range

hold off;

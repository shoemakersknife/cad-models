clc; clear; close all;

fluid = {'Water','Engine Oil','Ethylene Glycol','Ammonia','Acetone'};

viscosity = [0.001003, 1.06, 0.0157, 0.000152, 0.000331];

Q_open = [424.81702, 128.44569, 217.10587, 332.71158, 147.75275];
Q_narrow = [385.63931, 125.59502, 210.93665, 286.63275, 141.09576];


percent_reduction = (Q_open - Q_narrow) ./ Q_open * 100;


[viscosity_sorted, idx] = sort(viscosity);

percent_sorted = percent_reduction(idx);
fluid_sorted = fluid(idx);

figure;
semilogx(viscosity_sorted, percent_sorted, '-o', ...
    'LineWidth', 2, 'MarkerSize', 8);

grid on;

xlabel('Dynamic Viscosity (Pa·s) - Log Scale');
ylabel('Heat Transfer Reduction (%)');
title('Viscosity Effect on Heat Transfer Reduction (Log Scale)');

for i = 1:length(fluid_sorted)
    text(viscosity_sorted(i), percent_sorted(i), ...
        ['  ' fluid_sorted{i}], 'FontSize', 10);
end

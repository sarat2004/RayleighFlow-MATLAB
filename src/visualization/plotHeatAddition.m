function ax = plotHeatAddition(M, gamma)
%PLOTHEATADDITION Plot normalized Rayleigh-flow heat addition.
%
%   ax = plotHeatAddition(M, gamma)
%
%   Plots:
%
%       q / (cp*T*)
%
%   where:
%
%       q/(cp*T*) = T0/T* - (gamma+1)/2
%
%   The sonic reference state M* = 1 corresponds to:
%
%       q/(cp*T*) = 0
%
%   Inputs:
%       M      - Mach number vector
%       gamma  - Specific-heat ratio
%
%   Output:
%       ax     - Axes handle

    narginchk(2, 2);

    validateInput(M, gamma);

    M = M(:);

    heat = heatAddition(M, gamma);

    figure;

    ax = axes;

    plot(ax, M, heat, 'LineWidth', 1.5);
    hold(ax, 'on');

    xline(ax, 1, '--', 'M^* = 1');
    yline(ax, 0, ':', 'q/(c_p T^*) = 0');

    grid(ax, 'on');
    box(ax, 'on');

    xlabel(ax, 'Mach Number, M');
    ylabel(ax, 'q / (c_p T^*)');

    title(ax, sprintf( ...
        'Rayleigh Flow Heat Addition, \\gamma = %.3g', ...
        gamma));

    legend(ax, ...
        'q / (c_p T^*)', ...
        'M^* = 1', ...
        'q/(c_p T^*) = 0', ...
        'Location', 'best');

    hold(ax, 'off');

end
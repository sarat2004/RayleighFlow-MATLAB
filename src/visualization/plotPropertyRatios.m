function ax = plotPropertyRatios(M, gamma)
%PLOTPROPERTYRATIOS Plot Rayleigh-flow static property ratios.
%
%   ax = plotPropertyRatios(M, gamma)
%
%   Plots:
%       p/p*
%       T/T*
%       rho/rho*
%       V/V*
%
%   Reference state:
%       M* = 1

    narginchk(2, 2);

    validateInput(M, gamma);

    M = M(:);

    pRatio = pressureRatio(M, gamma);
    TRatio = temperatureRatio(M, gamma);
    rhoRatio = densityRatio(M, gamma);
    VRatio = velocityRatio(M, gamma);

    figure;

    ax = axes;

    plot(ax, M, pRatio, 'LineWidth', 1.5);
    hold(ax, 'on');

    plot(ax, M, TRatio, 'LineWidth', 1.5);
    plot(ax, M, rhoRatio, 'LineWidth', 1.5);
    plot(ax, M, VRatio, 'LineWidth', 1.5);

    xline(ax, 1, '--', 'M^* = 1');

    grid(ax, 'on');
    box(ax, 'on');

    xlabel(ax, 'Mach Number, M');
    ylabel(ax, 'Property Ratio');

    title(ax, sprintf( ...
        'Rayleigh Flow Static Property Ratios, \\gamma = %.3g', ...
        gamma));

    legend(ax, ...
        'p/p^*', ...
        'T/T^*', ...
        '\rho/\rho^*', ...
        'V/V^*', ...
        'Location', 'best');

    hold(ax, 'off');

end
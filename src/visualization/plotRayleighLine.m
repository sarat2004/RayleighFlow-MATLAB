function ax = plotRayleighLine(M, gamma)
%PLOTRAYLEIGHLINE Plot the principal Rayleigh-flow property ratios.
%
%   ax = plotRayleighLine(M, gamma)
%
%   Plots the normalized Rayleigh-flow properties:
%       p/p*
%       T/T*
%       rho/rho*
%       V/V*
%
%   Inputs:
%       M      - Mach number vector
%       gamma  - Specific-heat ratio
%
%   Output:
%       ax     - Axes handle
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

    plot(M, pRatio, 'LineWidth', 1.5);
    hold on;

    plot(M, TRatio, 'LineWidth', 1.5);
    plot(M, rhoRatio, 'LineWidth', 1.5);
    plot(M, VRatio, 'LineWidth', 1.5);

    xline(1, '--', 'M^* = 1');

    grid on;

    xlabel('Mach Number, M');
    ylabel('Normalized Property');

    title(sprintf('Rayleigh Flow Property Ratios, \\gamma = %.3g', gamma));

    legend( ...
        'p/p^*', ...
        'T/T^*', ...
        '\rho/\rho^*', ...
        'V/V^*', ...
        'Location', 'best');

    ax = gca;

    hold off;

end
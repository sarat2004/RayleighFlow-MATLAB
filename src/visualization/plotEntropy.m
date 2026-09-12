function ax = plotEntropy(M, gamma)
%PLOTENTROPY Plot Rayleigh-flow entropy change.
%
%   ax = plotEntropy(M, gamma)
%
%   Plots the normalized entropy change:
%
%       (s - s*) / R
%
%   The sonic reference state M* = 1 corresponds to:
%
%       (s - s*) / R = 0
%
%   For the Rayleigh-flow formulation, entropy reaches its
%   maximum at the sonic state.
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

    entropy = entropyChange(M, gamma);

    figure;

    ax = axes;

    plot(ax, M, entropy, 'LineWidth', 1.5);
    hold(ax, 'on');

    xline(ax, 1, '--', 'M^* = 1');
    yline(ax, 0, ':', 's - s^* = 0');

    grid(ax, 'on');
    box(ax, 'on');

    xlabel(ax, 'Mach Number, M');
    ylabel(ax, '(s - s^*) / R');

    title(ax, sprintf( ...
        'Rayleigh Flow Entropy Change, \\gamma = %.3g', ...
        gamma));

    legend(ax, ...
        '(s - s^*) / R', ...
        'M^* = 1', ...
        's - s^* = 0', ...
        'Location', 'best');

    hold(ax, 'off');

end
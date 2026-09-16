function fig = plotCombine(M, gamma)
%PLOTCOMBINE Display all Rayleigh-flow plots in one figure.
%
%   fig = plotCombine(M, gamma)
%
%   If M and gamma are not supplied, the default configuration is:
%       gamma = 1.4
%       M     = linspace(0.2, 5.0, 300)

    %% Configuration

    if nargin < 1 || isempty(M)
        M = linspace(0.2, 5.0, 300);
    end

    if nargin < 2 || isempty(gamma)
        gamma = 1.4;
    end


    %% Display configuration

    fprintf('Rayleigh Flow Visualization Example\n');
    fprintf('------------------------------------\n');
    fprintf('Specific-heat ratio: gamma = %.3f\n', gamma);
    fprintf('Mach range: %.2f <= M <= %.2f\n\n', ...
        min(M), max(M));


    %% Generate individual plots

    ax1 = plotPropertyRatios(M, gamma);
    ax2 = plotRayleighLine(M, gamma);
    ax3 = plotHeatAddition(M, gamma);
    ax4 = plotEntropy(M, gamma);


    %% Create combined figure

    fig = figure( ...
        'Name', 'Rayleigh Flow Properties', ...
        'NumberTitle', 'off', ...
        'Color', 'white');


    t = tiledlayout(fig, 2, 2, ...
        'TileSpacing', 'compact', ...
        'Padding', 'compact');


    %% Plot 1 - Property Ratios

    newAx1 = nexttile(t, 1);

    copyobj(allchild(ax1), newAx1);

    title(newAx1, 'Property Ratios');
    xlabel(newAx1, ax1.XLabel.String);
    ylabel(newAx1, ax1.YLabel.String);

    grid(newAx1, 'on');

    xlim(newAx1, xlim(ax1));
    ylim(newAx1, ylim(ax1));


    %% Plot 2 - Rayleigh Line

    newAx2 = nexttile(t, 2);

    copyobj(allchild(ax2), newAx2);

    title(newAx2, 'Rayleigh Line');
    xlabel(newAx2, ax2.XLabel.String);
    ylabel(newAx2, ax2.YLabel.String);

    grid(newAx2, 'on');

    xlim(newAx2, xlim(ax2));
    ylim(newAx2, ylim(ax2));


    %% Plot 3 - Heat Addition

    newAx3 = nexttile(t, 3);

    copyobj(allchild(ax3), newAx3);

    title(newAx3, 'Heat Addition');
    xlabel(newAx3, ax3.XLabel.String);
    ylabel(newAx3, ax3.YLabel.String);

    grid(newAx3, 'on');

    xlim(newAx3, xlim(ax3));
    ylim(newAx3, ylim(ax3));


    %% Plot 4 - Entropy

    newAx4 = nexttile(t, 4);

    copyobj(allchild(ax4), newAx4);

    title(newAx4, 'Entropy');
    xlabel(newAx4, ax4.XLabel.String);
    ylabel(newAx4, ax4.YLabel.String);

    grid(newAx4, 'on');

    xlim(newAx4, xlim(ax4));
    ylim(newAx4, ylim(ax4));


    %% Overall title

    title(t, 'Rayleigh Flow Analysis');


    %% Close temporary source figures

    close(ax1.Parent);
    close(ax2.Parent);
    close(ax3.Parent);
    close(ax4.Parent);


end
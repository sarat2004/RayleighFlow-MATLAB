%% EXAMPLE_VISUALIZATION
% Generate standard Rayleigh-flow visualization plots.
%
% This example demonstrates the visualization layer for:
%   1. Static property ratios
%   2. Entropy change
%   3. Normalized heat addition
%
% The example uses air with:
%
%       gamma = 1.4
%
% and a representative Mach-number range.

clear;
clc;
close all;

%% Configuration

gamma = 1.4;

M = linspace(0.2, 5.0, 300);

%% Display configuration

fprintf('Rayleigh Flow Visualization Example\n');
fprintf('------------------------------------\n');
fprintf('Specific-heat ratio: gamma = %.3f\n', gamma);
fprintf('Mach range: %.2f <= M <= %.2f\n\n', ...
    min(M), max(M));

%% 1. Principal Rayleigh-flow visualization

plotRayleighLine(M, gamma);

%% 2. Static property ratios

plotPropertyRatios(M, gamma);

%% 3. Entropy change

plotEntropy(M, gamma);

%% 4. Heat addition

plotHeatAddition(M, gamma);

fprintf('Visualization generation completed successfully.\n');
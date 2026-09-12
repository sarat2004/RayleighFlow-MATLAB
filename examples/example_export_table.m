%% EXAMPLE_EXPORT_TABLE
% Generate and export a Rayleigh-flow property table.

clear;
clc;

%% Configuration

gamma = 1.4;

M = [ ...
    0.2 ...
    0.5 ...
    0.8 ...
    1.0 ...
    1.2 ...
    1.5 ...
    2.0 ...
    3.0 ...
    5.0];

%% Generate table

data = generateRayleighTable(M, gamma);

disp(data);

%% Create formatted table

formattedData = createTable(M, gamma);

disp(formattedData);

%% Output directory

outputDirectory = fullfile( ...
    'output', ...
    'tables');

%% Export CSV

csvFile = fullfile( ...
    outputDirectory, ...
    'rayleigh_table.csv');

exportTable(formattedData, csvFile);

%% Export XLSX

xlsxFile = fullfile( ...
    outputDirectory, ...
    'rayleigh_table.xlsx');

exportTable(formattedData, xlsxFile);

%% Completion message

fprintf('\nExport completed successfully.\n');
fprintf('CSV : %s\n', csvFile);
fprintf('XLSX: %s\n', xlsxFile);
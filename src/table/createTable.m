function formattedTable = createTable(M, gamma)
%CREATETABLE Create a formatted Rayleigh-flow property table.
%
%   formattedTable = createTable(M, gamma)
%
%   Generates and formats a Rayleigh-flow property table.

    narginchk(2, 2);

    data = generateRayleighTable(M, gamma);

    formattedTable = data;

    % Round numerical values for engineering presentation.
    formattedTable.Mach = round(formattedTable.Mach, 6);
    formattedTable.PressureRatio = round(formattedTable.PressureRatio, 8);
    formattedTable.TemperatureRatio = round(formattedTable.TemperatureRatio, 8);
    formattedTable.DensityRatio = round(formattedTable.DensityRatio, 8);
    formattedTable.VelocityRatio = round(formattedTable.VelocityRatio, 8);
    formattedTable.StagnationTemperatureRatio = ...
        round(formattedTable.StagnationTemperatureRatio, 8);
    formattedTable.StagnationPressureRatio = ...
        round(formattedTable.StagnationPressureRatio, 8);
    formattedTable.EntropyOverR = ...
        round(formattedTable.EntropyOverR, 8);
    formattedTable.HeatAdditionOverCpTstar = ...
        round(formattedTable.HeatAdditionOverCpTstar, 8);

end
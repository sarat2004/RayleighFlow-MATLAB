function report = validateSonicState(gamma, tolerance)
%VALIDATESONICSTATE Validate the Rayleigh-flow sonic reference state.
%
%   report = validateSonicState(gamma)
%   report = validateSonicState(gamma, tolerance)
%
%   Validates that M* = 1 produces unity normalized properties.

    narginchk(1, 2);

    if nargin < 2
        tolerance = 1e-12;
    end

    M = 1;

    validateInput(M, gamma, tolerance);

    pressure = pressureRatio(M, gamma);
    temperature = temperatureRatio(M, gamma);
    density = densityRatio(M, gamma);
    velocity = velocityRatio(M, gamma);
    stagnationTemperature = stagnationTemperatureRatio(M, gamma);
    stagnationPressure = stagnationPressureRatio(M, gamma);
    entropy = entropyChange(M, gamma);
    heatAdditionValue = heatAddition(M, gamma);

    pressureResidual = abs(pressure - 1);
    temperatureResidual = abs(temperature - 1);
    densityResidual = abs(density - 1);
    velocityResidual = abs(velocity - 1);

    stagnationTemperatureResidual = ...
        abs(stagnationTemperature - 1);

    stagnationPressureResidual = ...
        abs(stagnationPressure - 1);

    entropyResidual = abs(entropy);
    heatAdditionResidual = abs(heatAdditionValue);

    pressurePass = pressureResidual <= tolerance;
    temperaturePass = temperatureResidual <= tolerance;
    densityPass = densityResidual <= tolerance;
    velocityPass = velocityResidual <= tolerance;

    stagnationTemperaturePass = ...
        stagnationTemperatureResidual <= tolerance;

    stagnationPressurePass = ...
        stagnationPressureResidual <= tolerance;

    entropyPass = entropyResidual <= tolerance;
    heatAdditionPass = heatAdditionResidual <= tolerance;

    overallPass = all([ ...
        pressurePass, ...
        temperaturePass, ...
        densityPass, ...
        velocityPass, ...
        stagnationTemperaturePass, ...
        stagnationPressurePass, ...
        entropyPass, ...
        heatAdditionPass]);

    report = struct();

    report.Mach = M;
    report.gamma = gamma;
    report.tolerance = tolerance;

    report.pressureRatio = pressure;
    report.temperatureRatio = temperature;
    report.densityRatio = density;
    report.velocityRatio = velocity;

    report.stagnationTemperatureRatio = ...
        stagnationTemperature;

    report.stagnationPressureRatio = ...
        stagnationPressure;

    report.entropyOverR = entropy;
    report.heatAdditionOverCpTstar = heatAdditionValue;

    report.pressurePass = pressurePass;
    report.temperaturePass = temperaturePass;
    report.densityPass = densityPass;
    report.velocityPass = velocityPass;

    report.stagnationTemperaturePass = ...
        stagnationTemperaturePass;

    report.stagnationPressurePass = ...
        stagnationPressurePass;

    report.entropyPass = entropyPass;
    report.heatAdditionPass = heatAdditionPass;

    report.overallPass = overallPass;

end
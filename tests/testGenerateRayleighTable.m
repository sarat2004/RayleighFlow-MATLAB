function tests = testGenerateRayleighTable
    tests = functiontests(localfunctions);
end

function testTableSize(testCase)

    M = [0.2 0.5 0.8 1.0 1.2 2.0 5.0];
    gamma = 1.4;

    data = generateRayleighTable(M, gamma);

    verifySize(testCase, data, [7 9]);

end

function testVariableNames(testCase)

    M = [0.5 1.0 2.0];
    gamma = 1.4;

    data = generateRayleighTable(M, gamma);

    expectedNames = { ...
        'Mach', ...
        'PressureRatio', ...
        'TemperatureRatio', ...
        'DensityRatio', ...
        'VelocityRatio', ...
        'StagnationTemperatureRatio', ...
        'StagnationPressureRatio', ...
        'EntropyOverR', ...
        'HeatAdditionOverCpTstar'};

    verifyEqual(testCase, data.Properties.VariableNames, ...
        expectedNames);

end

function testSonicRow(testCase)

    M = 1.0;
    gamma = 1.4;

    data = generateRayleighTable(M, gamma);

    verifyEqual(testCase, data.PressureRatio, 1, ...
        'AbsTol', 1e-12);

    verifyEqual(testCase, data.TemperatureRatio, 1, ...
        'AbsTol', 1e-12);

    verifyEqual(testCase, data.DensityRatio, 1, ...
        'AbsTol', 1e-12);

    verifyEqual(testCase, data.VelocityRatio, 1, ...
        'AbsTol', 1e-12);

    verifyEqual(testCase, data.StagnationTemperatureRatio, 1, ...
        'AbsTol', 1e-12);

    verifyEqual(testCase, data.StagnationPressureRatio, 1, ...
        'AbsTol', 1e-12);

    verifyEqual(testCase, data.EntropyOverR, 0, ...
        'AbsTol', 1e-12);

    verifyEqual(testCase, data.HeatAdditionOverCpTstar, 0, ...
        'AbsTol', 1e-12);

end

function testVectorInput(testCase)

    M = [0.2 0.5 0.8 1.0 1.2 2.0];
    gamma = 1.4;

    data = generateRayleighTable(M, gamma);

    verifyEqual(testCase, data.Mach, M(:));

end

function testInvalidMach(testCase)

    verifyError(testCase, ...
        @() generateRayleighTable(0, 1.4), ...
        'validateInput:InvalidMach');

end

function testInvalidGamma(testCase)

    verifyError(testCase, ...
        @() generateRayleighTable(1, 1), ...
        'validateInput:InvalidGamma');

end
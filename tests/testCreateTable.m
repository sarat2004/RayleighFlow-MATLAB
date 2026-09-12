function tests = testCreateTable
    tests = functiontests(localfunctions);
end

function testTableCreation(testCase)

    M = [0.2 0.5 1.0 2.0];
    gamma = 1.4;

    data = createTable(M, gamma);

    verifySize(testCase, data, [4 9]);

end

function testSonicState(testCase)

    data = createTable(1.0, 1.4);

    verifyEqual(testCase, data.PressureRatio, 1);
    verifyEqual(testCase, data.TemperatureRatio, 1);
    verifyEqual(testCase, data.DensityRatio, 1);
    verifyEqual(testCase, data.VelocityRatio, 1);

end

function testDataConsistency(testCase)

    M = [0.2 0.5 0.8 1.0 1.2 2.0];
    gamma = 1.4;

    data = createTable(M, gamma);

    expectedPressure = pressureRatio(M(:), gamma);

    verifyEqual(testCase, ...
        data.PressureRatio, ...
        round(expectedPressure, 8));

end
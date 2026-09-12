function tests = testValidateSonicState
    tests = functiontests(localfunctions);
end

function testSonicStatePasses(testCase)

    report = validateSonicState(1.4);

    verifyTrue(testCase, report.overallPass);

end

function testAllPropertiesPass(testCase)

    report = validateSonicState(1.4);

    verifyTrue(testCase, report.pressurePass);
    verifyTrue(testCase, report.temperaturePass);
    verifyTrue(testCase, report.densityPass);
    verifyTrue(testCase, report.velocityPass);

    verifyTrue(testCase, ...
        report.stagnationTemperaturePass);

    verifyTrue(testCase, ...
        report.stagnationPressurePass);

    verifyTrue(testCase, report.entropyPass);
    verifyTrue(testCase, report.heatAdditionPass);

end

function testSonicValues(testCase)

    report = validateSonicState(1.4);

    verifyEqual(testCase, report.pressureRatio, 1, ...
        'AbsTol', 1e-12);

    verifyEqual(testCase, report.temperatureRatio, 1, ...
        'AbsTol', 1e-12);

    verifyEqual(testCase, report.densityRatio, 1, ...
        'AbsTol', 1e-12);

    verifyEqual(testCase, report.velocityRatio, 1, ...
        'AbsTol', 1e-12);

    verifyEqual(testCase, ...
        report.stagnationTemperatureRatio, 1, ...
        'AbsTol', 1e-12);

    verifyEqual(testCase, ...
        report.stagnationPressureRatio, 1, ...
        'AbsTol', 1e-12);

    verifyEqual(testCase, report.entropyOverR, 0, ...
        'AbsTol', 1e-12);

    verifyEqual(testCase, ...
        report.heatAdditionOverCpTstar, 0, ...
        'AbsTol', 1e-12);

end

function testDifferentGamma(testCase)

    gammaValues = [1.3 1.4 1.67];

    for gamma = gammaValues

        report = validateSonicState(gamma);

        verifyTrue(testCase, report.overallPass);

    end

end

function testInvalidGamma(testCase)

    verifyError(testCase, ...
        @() validateSonicState(1), ...
        'validateInput:InvalidGamma');

end

function testInvalidTolerance(testCase)

    verifyError(testCase, ...
        @() validateSonicState(1.4, 0), ...
        'validateInput:InvalidTolerance');

end
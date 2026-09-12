function tests = testValidatePhysics
    tests = functiontests(localfunctions);
end

function testCompletePhysicsValidation(testCase)

    M = [0.2 0.5 0.8 1.0 1.2 2.0 5.0];
    gamma = 1.4;

    report = validatePhysics(M, gamma);

    verifyTrue(testCase, report.overallPass);

end

function testFiniteProperties(testCase)

    M = [0.2 0.5 0.8 1.0 1.2 2.0 5.0];
    gamma = 1.4;

    report = validatePhysics(M, gamma);

    verifyTrue(testCase, ...
        report.finiteProperties);

end

function testPositiveProperties(testCase)

    M = [0.2 0.5 0.8 1.0 1.2 2.0 5.0];
    gamma = 1.4;

    report = validatePhysics(M, gamma);

    verifyTrue(testCase, ...
        report.positiveProperties);

end

function testEntropyBehavior(testCase)

    M = [0.2 0.5 0.8 1.0 1.2 2.0 5.0];
    gamma = 1.4;

    report = validatePhysics(M, gamma);

    verifyTrue(testCase, ...
        report.entropyBehaviorPass);

end

function testHeatBehavior(testCase)

    M = [0.2 0.5 0.8 1.0 1.2 2.0 5.0];
    gamma = 1.4;

    report = validatePhysics(M, gamma);

    verifyTrue(testCase, ...
        report.heatBehaviorPass);

end

function testSonicIncluded(testCase)

    M = [0.2 0.5 0.8 1.0 1.2 2.0 5.0];
    gamma = 1.4;

    report = validatePhysics(M, gamma);

    verifyTrue(testCase, ...
        report.sonicIncluded);

end

function testDifferentGamma(testCase)

    M = [0.2 0.5 0.8 1.0 1.2 2.0 5.0];

    gammaValues = [1.3 1.4 1.67];

    for gamma = gammaValues

        report = validatePhysics(M, gamma);

        verifyTrue(testCase, ...
            report.overallPass);

    end

end

function testInvalidMach(testCase)

    verifyError(testCase, ...
        @() validatePhysics(0, 1.4), ...
        'validateInput:InvalidMach');

end

function testInvalidGamma(testCase)

    verifyError(testCase, ...
        @() validatePhysics(1, 1), ...
        'validateInput:InvalidGamma');

end

function testInvalidTolerance(testCase)

    verifyError(testCase, ...
        @() validatePhysics(1, 1.4, 0), ...
        'validateInput:InvalidTolerance');

end
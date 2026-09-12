function tests = testValidateConservation
    tests = functiontests(localfunctions);
end

function testConservationPasses(testCase)

    M = [0.2 0.5 0.8 1.0 1.2 2.0 5.0];
    gamma = 1.4;

    report = validateConservation(M, gamma);

    verifyTrue(testCase, report.overallPass);

end

function testMassConservation(testCase)

    M = [0.2 0.5 0.8 1.0 1.2 2.0 5.0];
    gamma = 1.4;

    report = validateConservation(M, gamma);

    verifyTrue(testCase, ...
        all(report.massPass));

    verifyLessThanOrEqual(testCase, ...
        max(abs(report.massResidual)), 1e-12);

end

function testPerfectGasConsistency(testCase)

    M = [0.2 0.5 0.8 1.0 1.2 2.0 5.0];
    gamma = 1.4;

    report = validateConservation(M, gamma);

    verifyTrue(testCase, ...
        all(report.perfectGasPass));

end

function testMomentumConservation(testCase)

    M = [0.2 0.5 0.8 1.0 1.2 2.0 5.0];
    gamma = 1.4;

    report = validateConservation(M, gamma);

    verifyTrue(testCase, ...
        all(report.momentumPass));

end

function testVelocityConsistency(testCase)

    M = [0.2 0.5 0.8 1.0 1.2 2.0 5.0];
    gamma = 1.4;

    report = validateConservation(M, gamma);

    verifyTrue(testCase, ...
        all(report.velocityPass));

end

function testDifferentGamma(testCase)

    M = [0.2 0.5 0.8 1.0 1.2 2.0 5.0];

    gammaValues = [1.3 1.4 1.67];

    for gamma = gammaValues

        report = validateConservation(M, gamma);

        verifyTrue(testCase, ...
            report.overallPass);

    end

end

function testInvalidMach(testCase)

    verifyError(testCase, ...
        @() validateConservation(0, 1.4), ...
        'validateInput:InvalidMach');

end

function testInvalidGamma(testCase)

    verifyError(testCase, ...
        @() validateConservation(1, 1), ...
        'validateInput:InvalidGamma');

end

function testInvalidTolerance(testCase)

    verifyError(testCase, ...
        @() validateConservation(1, 1.4, 0), ...
        'validateInput:InvalidTolerance');

end
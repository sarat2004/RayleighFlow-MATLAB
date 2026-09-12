function tests = testConservation
    tests = functiontests(localfunctions);
end

function testMassConservation(testCase)

    M = [0.2 0.5 0.8 1.0 1.2 2.0 5.0];
    gamma = 1.4;

    rho = densityRatio(M, gamma);
    V   = velocityRatio(M, gamma);

    massResidual = rho .* V - 1;

    verifyLessThanOrEqual(testCase, ...
        abs(massResidual), 1e-12);

end

function testPerfectGasConsistency(testCase)

    M = [0.2 0.5 0.8 1.0 1.2 2.0 5.0];
    gamma = 1.4;

    p   = pressureRatio(M, gamma);
    rho = densityRatio(M, gamma);
    T   = temperatureRatio(M, gamma);

    residual = p - rho .* T;

    verifyLessThanOrEqual(testCase, ...
        abs(residual), 1e-12);

end

function testMomentumConservation(testCase)

    M = [0.2 0.5 0.8 1.0 1.2 2.0 5.0];
    gamma = 1.4;

    p = pressureRatio(M, gamma);

    residual = p .* (1 + gamma .* M.^2) - (1 + gamma);

    verifyLessThanOrEqual(testCase, ...
        abs(residual), 1e-12);

end
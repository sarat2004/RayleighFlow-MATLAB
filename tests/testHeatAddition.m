function tests = testHeatAddition
    tests = functiontests(localfunctions);
end

function testSonicState(testCase)

    q = heatAddition(1, 1.4);

    verifyEqual(testCase, q, 0, ...
        'AbsTol', 1e-12);

end

function testKnownValue(testCase)

    M = 0.5;
    gamma = 1.4;

    T = temperatureRatio(M, gamma);

    T0OverT = 1 + ((gamma - 1) / 2) * M^2;

    T0OverTstar = T * T0OverT;

    expected = T0OverTstar - (gamma + 1) / 2;

    actual = heatAddition(M, gamma);

    verifyEqual(testCase, actual, expected, ...
        'AbsTol', 1e-12);

end

function testVectorInput(testCase)

    M = [0.2 0.5 0.8 1.0 1.2 2.0 5.0];
    gamma = 1.4;

    q = heatAddition(M, gamma);

    verifySize(testCase, q, size(M));
    verifyTrue(testCase, all(isfinite(q)));

end

function testInvalidMach(testCase)

    verifyError(testCase, ...
        @() heatAddition(0, 1.4), ...
        'heatAddition:InvalidMach');

end

function testInvalidGamma(testCase)

    verifyError(testCase, ...
        @() heatAddition(1, 1), ...
        'heatAddition:InvalidGamma');

end
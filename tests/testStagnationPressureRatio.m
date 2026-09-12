function tests = testStagnationPressureRatio
    tests = functiontests(localfunctions);
end

function testSonicState(testCase)

    ratio = stagnationPressureRatio(1, 1.4);

    verifyEqual(testCase, ratio, 1, ...
        'AbsTol', 1e-12);

end

function testKnownValue(testCase)

    M = 0.5;
    gamma = 1.4;

    pRatio = (1 + gamma) / ...
        (1 + gamma * M^2);

    isentropicFactor = ...
        (1 + ((gamma - 1) / 2) * M^2) / ...
        ((gamma + 1) / 2);

    expected = pRatio * ...
        isentropicFactor^(gamma / (gamma - 1));

    actual = stagnationPressureRatio(M, gamma);

    verifyEqual(testCase, actual, expected, ...
        'AbsTol', 1e-12);

end

function testVectorInput(testCase)

    M = [0.2 0.5 0.8 1.0 1.2 2.0 5.0];
    gamma = 1.4;

    ratio = stagnationPressureRatio(M, gamma);

    verifySize(testCase, ratio, size(M));
    verifyTrue(testCase, all(isfinite(ratio)));

end

function testInvalidMach(testCase)

    verifyError(testCase, ...
        @() stagnationPressureRatio(0, 1.4), ...
        'stagnationPressureRatio:InvalidMach');

end

function testInvalidGamma(testCase)

    verifyError(testCase, ...
        @() stagnationPressureRatio(1, 1), ...
        'stagnationPressureRatio:InvalidGamma');

end
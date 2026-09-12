function tests = testStagnationTemperatureRatio
    tests = functiontests(localfunctions);
end

function testSonicState(testCase)

    ratio = stagnationTemperatureRatio(1, 1.4);

    verifyEqual(testCase, ratio, 1, ...
        'AbsTol', 1e-12);

end

function testKnownValue(testCase)

    M = 0.5;
    gamma = 1.4;

    expected = ...
        (M^2 * (1 + gamma) * ...
        (2 + (gamma - 1) * M^2)) / ...
        (1 + gamma * M^2)^2;

    actual = stagnationTemperatureRatio(M, gamma);

    verifyEqual(testCase, actual, expected, ...
        'AbsTol', 1e-12);

end

function testVectorInput(testCase)

    M = [0.2 0.5 0.8 1.0 1.2 2.0 5.0];
    gamma = 1.4;

    ratio = stagnationTemperatureRatio(M, gamma);

    verifySize(testCase, ratio, size(M));
    verifyTrue(testCase, all(isfinite(ratio)));

end

function testInvalidMach(testCase)

    verifyError(testCase, ...
        @() stagnationTemperatureRatio(0, 1.4), ...
        'stagnationTemperatureRatio:InvalidMach');

end

function testInvalidGamma(testCase)

    verifyError(testCase, ...
        @() stagnationTemperatureRatio(1, 1), ...
        'stagnationTemperatureRatio:InvalidGamma');

end
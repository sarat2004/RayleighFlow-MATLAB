function tests = testEntropyChange
    tests = functiontests(localfunctions);
end

function testSonicState(testCase)

    dsOverR = entropyChange(1, 1.4);

    verifyEqual(testCase, dsOverR, 0, ...
        'AbsTol', 1e-12);

end

function testKnownValue(testCase)

    M = 0.5;
    gamma = 1.4;

    T = temperatureRatio(M, gamma);
    p = pressureRatio(M, gamma);

    expected = ...
        (gamma / (gamma - 1)) * log(T) - log(p);

    actual = entropyChange(M, gamma);

    verifyEqual(testCase, actual, expected, ...
        'AbsTol', 1e-12);

end

function testVectorInput(testCase)

    M = [0.2 0.5 0.8 1.0 1.2 2.0 5.0];
    gamma = 1.4;

    dsOverR = entropyChange(M, gamma);

    verifySize(testCase, dsOverR, size(M));
    verifyTrue(testCase, all(isfinite(dsOverR)));

end

function testInvalidMach(testCase)

    verifyError(testCase, ...
        @() entropyChange(0, 1.4), ...
        'entropyChange:InvalidMach');

end

function testInvalidGamma(testCase)

    verifyError(testCase, ...
        @() entropyChange(1, 1), ...
        'entropyChange:InvalidGamma');

end
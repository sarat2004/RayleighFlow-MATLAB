function tests = testDensityRatio
%TESTDENSITYRATIO Unit tests for densityRatio.

    tests = functiontests(localfunctions);

end


function testSonicState(testCase)
% At M = 1, rho/rho* must equal 1.

    M = 1.0;
    gamma = 1.4;

    result = densityRatio(M, gamma);

    verifyEqual(testCase, result, 1.0, ...
        'AbsTol', 1e-12);

end


function testKnownValue(testCase)
% Verify the analytical equation for M = 0.5, gamma = 1.4.

    M = 0.5;
    gamma = 1.4;

    expected = (1 + gamma * M^2) / ...
               (M^2 * (1 + gamma));

    result = densityRatio(M, gamma);

    verifyEqual(testCase, result, expected, ...
        'AbsTol', 1e-12);

end


function testVectorInput(testCase)
% Verify vectorized Mach-number input.

    M = [0.2 0.5 0.8 1.0 1.2 2.0];
    gamma = 1.4;

    expected = (1 + gamma .* M.^2) ./ ...
               (M.^2 .* (1 + gamma));

    result = densityRatio(M, gamma);

    verifyEqual(testCase, result, expected, ...
        'AbsTol', 1e-12);

end


function testInvalidMach(testCase)
% Mach number must be greater than zero.

    verifyError(testCase, ...
        @() densityRatio(0, 1.4), ...
        'densityRatio:InvalidMach');

end


function testInvalidGamma(testCase)
% Specific heat ratio must be greater than one.

    verifyError(testCase, ...
        @() densityRatio(0.5, 1.0), ...
        'densityRatio:InvalidGamma');

end
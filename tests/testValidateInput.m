function tests = testValidateInput
    tests = functiontests(localfunctions);
end

function testValidScalarMach(testCase)

    verifyWarningFree(testCase, ...
        @() validateInput(1.0, 1.4));

end

function testValidVectorMach(testCase)

    M = [0.2 0.5 0.8 1.0 1.2 2.0 5.0];

    verifyWarningFree(testCase, ...
        @() validateInput(M, 1.4));

end

function testDifferentGamma(testCase)

    gammaValues = [1.3 1.4 1.67];

    for gamma = gammaValues

        verifyWarningFree(testCase, ...
            @() validateInput(1.0, gamma));

    end

end

function testInvalidMachZero(testCase)

    verifyError(testCase, ...
        @() validateInput(0, 1.4), ...
        'validateInput:InvalidMach');

end

function testInvalidMachNegative(testCase)

    verifyError(testCase, ...
        @() validateInput(-1, 1.4), ...
        'validateInput:InvalidMach');

end

function testInvalidMachNaN(testCase)

    verifyError(testCase, ...
        @() validateInput(NaN, 1.4), ...
        'validateInput:InvalidMach');

end

function testInvalidMachInf(testCase)

    verifyError(testCase, ...
        @() validateInput(Inf, 1.4), ...
        'validateInput:InvalidMach');

end

function testInvalidGammaOne(testCase)

    verifyError(testCase, ...
        @() validateInput(1.0, 1.0), ...
        'validateInput:InvalidGamma');

end

function testInvalidGammaNegative(testCase)

    verifyError(testCase, ...
        @() validateInput(1.0, -1.4), ...
        'validateInput:InvalidGamma');

end

function testInvalidGammaNonScalar(testCase)

    verifyError(testCase, ...
        @() validateInput(1.0, [1.3 1.4]), ...
        'validateInput:InvalidGamma');

end

function testInvalidGammaNaN(testCase)

    verifyError(testCase, ...
        @() validateInput(1.0, NaN), ...
        'validateInput:InvalidGamma');

end

function testInvalidToleranceZero(testCase)

    verifyError(testCase, ...
        @() validateInput(1.0, 1.4, 0), ...
        'validateInput:InvalidTolerance');

end

function testInvalidToleranceNegative(testCase)

    verifyError(testCase, ...
        @() validateInput(1.0, 1.4, -1e-12), ...
        'validateInput:InvalidTolerance');

end

function testInvalidToleranceNaN(testCase)

    verifyError(testCase, ...
        @() validateInput(1.0, 1.4, NaN), ...
        'validateInput:InvalidTolerance');

end
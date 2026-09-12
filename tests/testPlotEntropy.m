function tests = testPlotEntropy
%TESTPLOTENTROPY Test plotEntropy.

    tests = functiontests(localfunctions);

end


function teardown(testCase) %#ok<INUSD>

    figs = findall(0, 'Type', 'figure');
    close(figs);

end


function testReturnsValidAxes(testCase)

    M = linspace(0.2, 5, 100);
    gamma = 1.4;

    ax = plotEntropy(M, gamma);

    verifyTrue(testCase, isgraphics(ax, 'axes'));

end


function testContainsEntropyCurve(testCase)

    M = linspace(0.2, 5, 100);
    gamma = 1.4;

    ax = plotEntropy(M, gamma);

    lines = findobj(ax, 'Type', 'line');

    verifyEqual(testCase, numel(lines), 1);

end


function testVectorInput(testCase)

    M = [0.2 0.5 0.8 1.0 1.2 2.0 5.0];
    gamma = 1.4;

    ax = plotEntropy(M, gamma);

    verifyTrue(testCase, isgraphics(ax, 'axes'));

end


function testInvalidMachRejected(testCase)

    verifyError(testCase, ...
        @() plotEntropy([0.2 0 1.0], 1.4), ...
        'validateInput:InvalidMach');

end


function testNegativeMachRejected(testCase)

    verifyError(testCase, ...
        @() plotEntropy([0.2 -0.5 1.0], 1.4), ...
        'validateInput:InvalidMach');

end


function testInvalidGammaRejected(testCase)

    verifyError(testCase, ...
        @() plotEntropy([0.2 0.5 1.0], 1.0), ...
        'validateInput:InvalidGamma');

end


function testNonScalarGammaRejected(testCase)

    verifyError(testCase, ...
        @() plotEntropy([0.2 0.5 1.0], [1.3 1.4]), ...
        'validateInput:InvalidGamma');

end


function testMissingInputRejected(testCase)

    verifyError(testCase, ...
        @() plotEntropy(1.4), ...
        'MATLAB:narginchk:notEnoughInputs');

end
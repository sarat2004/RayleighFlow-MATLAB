function tests = testPlotRayleighLine
%TESTPLOTRAYLEIGHLINES Test plotRayleighLine.

    tests = functiontests(localfunctions);

end


function setupOnce(testCase)
    testCase.TestData.FigureHandles = gobjects(0);
end


function teardown(testCase)
    figs = findall(0, 'Type', 'figure');
    close(figs);
end


function testReturnsValidAxes(testCase)

    M = linspace(0.2, 5, 100);
    gamma = 1.4;

    ax = plotRayleighLine(M, gamma);

    verifyTrue(testCase, isgraphics(ax, 'axes'));

end


function testVectorInput(testCase)

    M = [0.2 0.5 0.8 1.0 1.2 2.0 5.0];
    gamma = 1.4;

    ax = plotRayleighLine(M, gamma);

    verifyTrue(testCase, isgraphics(ax, 'axes'));

    lines = findobj(ax, 'Type', 'line');

    verifyGreaterThanOrEqual(testCase, numel(lines), 4);

end


function testInvalidMachRejected(testCase)

    M = [0.2 0.5 0];

    verifyError(testCase, ...
        @() plotRayleighLine(M, 1.4), ...
        'validateInput:InvalidMach');

end


function testNegativeMachRejected(testCase)

    M = [0.2 -1.0 2.0];

    verifyError(testCase, ...
        @() plotRayleighLine(M, 1.4), ...
        'validateInput:InvalidMach');

end


function testInvalidGammaRejected(testCase)

    M = [0.2 0.5 1.0];

    verifyError(testCase, ...
        @() plotRayleighLine(M, 1.0), ...
        'validateInput:InvalidGamma');

end


function testNonScalarGammaRejected(testCase)

    M = [0.2 0.5 1.0];

    verifyError(testCase, ...
        @() plotRayleighLine(M, [1.3 1.4]), ...
        'validateInput:InvalidGamma');

end


function testMissingInputRejected(testCase)

    verifyError(testCase, ...
        @() plotRayleighLine(1.4), ...
        'MATLAB:narginchk:notEnoughInputs');

end
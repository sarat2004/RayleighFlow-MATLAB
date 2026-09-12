function tests = testExportTable
%TESTEXPORTTABLE Test exportTable.

    tests = functiontests(localfunctions);

end


function setup(testCase)

    testCase.TestData.OutputDirectory = ...
        fullfile(tempdir, ...
        'RayleighFlowMATLAB_ExportTests');

    if isfolder(testCase.TestData.OutputDirectory)
        rmdir(testCase.TestData.OutputDirectory, 's');
    end

    mkdir(testCase.TestData.OutputDirectory);

    testCase.TestData.Data = ...
        generateRayleighTable( ...
        [0.2 0.5 1.0 2.0], 1.4);

end


function teardown(testCase)

    outputDirectory = ...
        testCase.TestData.OutputDirectory;

    if isfolder(outputDirectory)
        rmdir(outputDirectory, 's');
    end

end


function testCSVExport(testCase)

    filename = fullfile( ...
        testCase.TestData.OutputDirectory, ...
        'rayleigh_test.csv');

    exportTable(testCase.TestData.Data, filename);

    verifyTrue(testCase, isfile(filename));

end


function testXLSXExport(testCase)

    filename = fullfile( ...
        testCase.TestData.OutputDirectory, ...
        'rayleigh_test.xlsx');

    exportTable(testCase.TestData.Data, filename);

    verifyTrue(testCase, isfile(filename));

end


function testCSVDataConsistency(testCase)

    filename = fullfile( ...
        testCase.TestData.OutputDirectory, ...
        'rayleigh_consistency.csv');

    exportTable(testCase.TestData.Data, filename);

    importedData = readtable(filename);

    verifyEqual(testCase, ...
        importedData.Mach, ...
        testCase.TestData.Data.Mach);

    verifyEqual(testCase, ...
        importedData.PressureRatio, ...
        testCase.TestData.Data.PressureRatio, ...
        'AbsTol', 1e-12);

end


function testXLSXDataConsistency(testCase)

    filename = fullfile( ...
        testCase.TestData.OutputDirectory, ...
        'rayleigh_consistency.xlsx');

    exportTable(testCase.TestData.Data, filename);

    importedData = readtable(filename);

    verifyEqual(testCase, ...
        importedData.Mach, ...
        testCase.TestData.Data.Mach);

    verifyEqual(testCase, ...
        importedData.TemperatureRatio, ...
        testCase.TestData.Data.TemperatureRatio, ...
        'AbsTol', 1e-12);

end


function testAutomaticDirectoryCreation(testCase)

    nestedDirectory = fullfile( ...
        testCase.TestData.OutputDirectory, ...
        'nested', ...
        'tables');

    filename = fullfile( ...
        nestedDirectory, ...
        'rayleigh.csv');

    verifyFalse(testCase, isfolder(nestedDirectory));

    exportTable(testCase.TestData.Data, filename);

    verifyTrue(testCase, isfolder(nestedDirectory));
    verifyTrue(testCase, isfile(filename));

end


function testInvalidTableRejected(testCase)

    filename = fullfile( ...
        testCase.TestData.OutputDirectory, ...
        'invalid.csv');

    verifyError(testCase, ...
        @() exportTable([1 2 3], filename), ...
        'exportTable:InvalidTable');

end


function testInvalidFilenameTypeRejected(testCase)

    verifyError(testCase, ...
        @() exportTable( ...
        testCase.TestData.Data, ...
        123), ...
        'exportTable:InvalidFilename');

end


function testEmptyFilenameRejected(testCase)

    verifyError(testCase, ...
        @() exportTable( ...
        testCase.TestData.Data, ...
        ""), ...
        'exportTable:InvalidFilename');

end


function testMissingExtensionRejected(testCase)

    filename = fullfile( ...
        testCase.TestData.OutputDirectory, ...
        'rayleigh_table');

    verifyError(testCase, ...
        @() exportTable( ...
        testCase.TestData.Data, ...
        filename), ...
        'exportTable:MissingExtension');

end


function testUnsupportedExtensionRejected(testCase)

    filename = fullfile( ...
        testCase.TestData.OutputDirectory, ...
        'rayleigh_table.txt');

    verifyError(testCase, ...
        @() exportTable( ...
        testCase.TestData.Data, ...
        filename), ...
        'exportTable:UnsupportedFormat');

end


function testMissingInputRejected(testCase)

    verifyError(testCase, ...
        @() exportTable(testCase.TestData.Data), ...
        'MATLAB:narginchk:notEnoughInputs');

end
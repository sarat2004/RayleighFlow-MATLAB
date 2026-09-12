function tests = testExportTable
    tests = functiontests(localfunctions);
end

function testInvalidTable(testCase)

    verifyError(testCase, ...
        @() exportTable([1 2 3], "test.csv"), ...
        'exportTable:InvalidTable');

end

function testInvalidFilename(testCase)

    data = table([1; 2], [3; 4]);

    verifyError(testCase, ...
        @() exportTable(data, 123), ...
        'exportTable:InvalidFilename');

end

function testMissingExtension(testCase)

    data = table([1; 2], [3; 4]);

    verifyError(testCase, ...
        @() exportTable(data, "test"), ...
        'exportTable:MissingExtension');

end

function testUnsupportedFormat(testCase)

    data = table([1; 2], [3; 4]);

    verifyError(testCase, ...
        @() exportTable(data, "test.txt"), ...
        'exportTable:UnsupportedFormat');

end

function testCSVExport(testCase)

    data = table([1; 2], [3; 4]);

    filename = fullfile(tempdir, ...
        "rayleigh_test.csv");

    cleanup = onCleanup(@() deleteIfExists(filename));

    exportTable(data, filename);

    verifyTrue(testCase, isfile(filename));

end

function testXLSXExport(testCase)

    data = table([1; 2], [3; 4]);

    filename = fullfile(tempdir, ...
        "rayleigh_test.xlsx");

    cleanup = onCleanup(@() deleteIfExists(filename));

    exportTable(data, filename);

    verifyTrue(testCase, isfile(filename));

end

function deleteIfExists(filename)

    if isfile(filename)
        delete(filename);
    end

end
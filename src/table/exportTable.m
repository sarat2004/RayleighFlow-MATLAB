function exportTable(data, filename)
%EXPORTTABLE Export a Rayleigh-flow table to CSV or XLSX.
%
%   exportTable(data, filename)
%
%   Inputs:
%       data     - MATLAB table
%       filename - Output filename
%
%   Supported formats:
%       .csv
%       .xlsx
%
%   The destination directory is created automatically if required.
%
%   Example:
%       data = generateRayleighTable([0.2 0.5 1.0 2.0], 1.4);
%       exportTable(data, "output/tables/rayleigh_table.csv");

    narginchk(2, 2);

    if ~istable(data)
        error('exportTable:InvalidTable', ...
            'Input data must be a MATLAB table.');
    end

    if ~(ischar(filename) || isstring(filename))
        error('exportTable:InvalidFilename', ...
            'Filename must be a character vector or string.');
    end

    filename = string(filename);

    if isempty(filename) || strlength(strtrim(filename)) == 0
        error('exportTable:InvalidFilename', ...
            'Filename must not be empty.');
    end

    [folder, ~, extension] = fileparts(filename);

    extension = lower(string(extension));

    if extension == ""
        error('exportTable:MissingExtension', ...
            'Filename must have a .csv or .xlsx extension.');
    end

    if extension ~= ".csv" && extension ~= ".xlsx"
        error('exportTable:UnsupportedFormat', ...
            'Only CSV and XLSX formats are supported.');
    end

    if folder ~= ""
        if ~isfolder(folder)
            [success, message] = mkdir(folder);

            if ~success
                error('exportTable:DirectoryCreationFailed', ...
                    'Unable to create output directory: %s', ...
                    message);
            end
        end
    end

    writetable(data, filename);

end
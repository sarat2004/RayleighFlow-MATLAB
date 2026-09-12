function validateInput(M, gamma, tolerance)
%VALIDATEINPUT Validate common Rayleigh-flow inputs.
%
%   validateInput(M, gamma)
%   validateInput(M, gamma, tolerance)
%
%   Validates:
%       M         - Positive, finite, real Mach number(s)
%       gamma     - Finite real scalar greater than 1
%       tolerance - Positive, finite real scalar
%
%   This function performs validation only. It does not return data.

    narginchk(2, 3);

    %--------------------------------------------------------------
    % Default tolerance
    %--------------------------------------------------------------

    if nargin < 3
        tolerance = 1e-12;
    end

    %--------------------------------------------------------------
    % Mach-number validation
    %--------------------------------------------------------------

    if ~isnumeric(M) || ~isreal(M) || any(~isfinite(M(:)))
        error('validateInput:InvalidMach', ...
            'Mach number M must be finite and real.');
    end

    if any(M(:) <= 0)
        error('validateInput:InvalidMach', ...
            'Mach number M must be greater than zero.');
    end

    %--------------------------------------------------------------
    % Specific-heat ratio validation
    %--------------------------------------------------------------

    if ~isnumeric(gamma) || ~isscalar(gamma) || ...
            ~isreal(gamma) || ~isfinite(gamma)

        error('validateInput:InvalidGamma', ...
            'gamma must be a finite real scalar.');
    end

    if gamma <= 1
        error('validateInput:InvalidGamma', ...
            'gamma must be greater than 1.');
    end

    %--------------------------------------------------------------
    % Tolerance validation
    %--------------------------------------------------------------

    if ~isnumeric(tolerance) || ~isscalar(tolerance) || ...
            ~isreal(tolerance) || ~isfinite(tolerance)

        error('validateInput:InvalidTolerance', ...
            'tolerance must be a finite real scalar.');
    end

    if tolerance <= 0
        error('validateInput:InvalidTolerance', ...
            'tolerance must be greater than zero.');
    end

end
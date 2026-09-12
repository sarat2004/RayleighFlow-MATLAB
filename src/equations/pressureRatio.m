function ratio = pressureRatio(M, gamma)
%PRESSURERATIO Rayleigh-flow static pressure ratio p/p*.
%
%   ratio = pressureRatio(M, gamma)
%
%   Calculates the Rayleigh-flow static pressure ratio relative
%   to the sonic reference state, M* = 1.
%
%   Equation:
%       p/p* = (1 + gamma) / (1 + gamma*M^2)

    narginchk(2, 2);

    % Validate Mach number
    if ~isnumeric(M) || ~isreal(M) || any(~isfinite(M(:)))
        error('pressureRatio:InvalidMach', ...
            'Mach number M must be finite and real.');
    end

    if any(M(:) <= 0)
        error('pressureRatio:InvalidMach', ...
            'Mach number M must be greater than zero.');
    end

    % Validate specific heat ratio
    if ~isnumeric(gamma) || ~isscalar(gamma) || ...
            ~isreal(gamma) || ~isfinite(gamma)
        error('pressureRatio:InvalidGamma', ...
            'gamma must be a finite real scalar.');
    end

    if gamma <= 1
        error('pressureRatio:InvalidGamma', ...
            'gamma must be greater than 1.');
    end

    % Rayleigh-flow pressure ratio
    ratio = (1 + gamma) ./ (1 + gamma .* M.^2);

end

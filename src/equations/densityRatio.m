function ratio = densityRatio(M, gamma)
%DENSITYRATIO Rayleigh-flow density ratio rho/rho*.
%
%   ratio = densityRatio(M, gamma)
%
%   Calculates the static density ratio relative to the
%   sonic reference state, M* = 1.
%
%   Equation:
%
%       rho/rho* = (1 + gamma*M^2) / ...
%                  (M^2*(1 + gamma))
%
%   Inputs:
%       M      - Mach number, M > 0
%       gamma  - Specific heat ratio, gamma > 1
%
%   Output:
%       ratio  - Static density ratio rho/rho*

    narginchk(2, 2);

    % Validate Mach number
    if ~isnumeric(M) || ~isreal(M) || any(~isfinite(M(:)))
        error('densityRatio:InvalidMach', ...
            'Mach number M must be finite and real.');
    end

    if any(M(:) <= 0)
        error('densityRatio:InvalidMach', ...
            'Mach number M must be greater than zero.');
    end

    % Validate specific heat ratio
    if ~isnumeric(gamma) || ~isscalar(gamma) || ...
            ~isreal(gamma) || ~isfinite(gamma)
        error('densityRatio:InvalidGamma', ...
            'gamma must be a finite real scalar.');
    end

    if gamma <= 1
        error('densityRatio:InvalidGamma', ...
            'gamma must be greater than 1.');
    end

    % Rayleigh-flow density ratio
    ratio = (1 + gamma .* M.^2) ./ ...
            (M.^2 .* (1 + gamma));

end
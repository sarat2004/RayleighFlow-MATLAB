function ratio = velocityRatio(M, gamma)
%VELOCITYRATIO Rayleigh-flow velocity ratio V/V*.
%
%   ratio = velocityRatio(M, gamma)
%
%   Calculates the flow velocity ratio relative to the
%   sonic reference state, M* = 1.
%
%   Equation:
%
%       V/V* = M^2*(1 + gamma) / (1 + gamma*M^2)
%
%   Inputs:
%       M      - Mach number, M > 0
%       gamma  - Specific heat ratio, gamma > 1
%
%   Output:
%       ratio  - Velocity ratio V/V*

    narginchk(2, 2);

    % Validate Mach number
    if ~isnumeric(M) || ~isreal(M) || any(~isfinite(M(:)))
        error('velocityRatio:InvalidMach', ...
            'Mach number M must be finite and real.');
    end

    if any(M(:) <= 0)
        error('velocityRatio:InvalidMach', ...
            'Mach number M must be greater than zero.');
    end

    % Validate specific heat ratio
    if ~isnumeric(gamma) || ~isscalar(gamma) || ...
            ~isreal(gamma) || ~isfinite(gamma)
        error('velocityRatio:InvalidGamma', ...
            'gamma must be a finite real scalar.');
    end

    if gamma <= 1
        error('velocityRatio:InvalidGamma', ...
            'gamma must be greater than 1.');
    end

    % Rayleigh-flow velocity ratio
    ratio = (M.^2 .* (1 + gamma)) ./ ...
            (1 + gamma .* M.^2);

end
function ratio = temperatureRatio(M, gamma)
%TEMPERATURERATIO Rayleigh-flow static temperature ratio T/T*.
%
%   ratio = temperatureRatio(M, gamma)
%
%   Calculates the static temperature ratio relative to the
%   sonic reference state, M* = 1.
%
%   Equation:
%
%       T/T* = M^2*(1 + gamma)^2 / (1 + gamma*M^2)^2
%
%   Inputs:
%       M      - Mach number, M > 0
%       gamma  - Specific heat ratio, gamma > 1
%
%   Output:
%       ratio  - Static temperature ratio T/T*

    narginchk(2, 2);

    % Validate Mach number
    if ~isnumeric(M) || ~isreal(M) || any(~isfinite(M(:)))
        error('temperatureRatio:InvalidMach', ...
            'Mach number M must be finite and real.');
    end

    if any(M(:) <= 0)
        error('temperatureRatio:InvalidMach', ...
            'Mach number M must be greater than zero.');
    end

    % Validate specific heat ratio
    if ~isnumeric(gamma) || ~isscalar(gamma) || ...
            ~isreal(gamma) || ~isfinite(gamma)
        error('temperatureRatio:InvalidGamma', ...
            'gamma must be a finite real scalar.');
    end

    if gamma <= 1
        error('temperatureRatio:InvalidGamma', ...
            'gamma must be greater than 1.');
    end

    % Rayleigh-flow temperature ratio
    ratio = (M.^2 .* (1 + gamma).^2) ./ ...
            (1 + gamma .* M.^2).^2;

end
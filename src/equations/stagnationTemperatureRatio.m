function ratio = stagnationTemperatureRatio(M, gamma)
%STAGNATIONTEMPERATURERATIO Rayleigh-flow stagnation temperature ratio.
%
%   ratio = stagnationTemperatureRatio(M, gamma)
%
%   Calculates T0/T0* relative to the sonic reference state, M* = 1.
%
%   Equation:
%       T0/T0* =
%       M^2*(1 + gamma)*(2 + (gamma-1)*M^2)
%       ------------------------------------------------
%                  (1 + gamma*M^2)^2

    narginchk(2, 2);

    if ~isnumeric(M) || ~isreal(M) || any(~isfinite(M(:)))
        error('stagnationTemperatureRatio:InvalidMach', ...
            'Mach number M must be finite and real.');
    end

    if any(M(:) <= 0)
        error('stagnationTemperatureRatio:InvalidMach', ...
            'Mach number M must be greater than zero.');
    end

    if ~isnumeric(gamma) || ~isscalar(gamma) || ...
            ~isreal(gamma) || ~isfinite(gamma)
        error('stagnationTemperatureRatio:InvalidGamma', ...
            'gamma must be a finite real scalar.');
    end

    if gamma <= 1
        error('stagnationTemperatureRatio:InvalidGamma', ...
            'gamma must be greater than 1.');
    end

    ratio = (M.^2 .* (1 + gamma) .* ...
            (2 + (gamma - 1) .* M.^2)) ./ ...
            (1 + gamma .* M.^2).^2;

end
function dsOverR = entropyChange(M, gamma)
%ENTROPYCHANGE Rayleigh-flow entropy change normalized by gas constant.
%
%   dsOverR = entropyChange(M, gamma)
%
%   Calculates the entropy difference:
%
%       (s - s*) / R
%
%   using the perfect-gas relation:
%
%       (s - s*)/R =
%       gamma/(gamma-1) * ln(T/T*) - ln(p/p*)

    narginchk(2, 2);

    if ~isnumeric(M) || ~isreal(M) || any(~isfinite(M(:)))
        error('entropyChange:InvalidMach', ...
            'Mach number M must be finite and real.');
    end

    if any(M(:) <= 0)
        error('entropyChange:InvalidMach', ...
            'Mach number M must be greater than zero.');
    end

    if ~isnumeric(gamma) || ~isscalar(gamma) || ...
            ~isreal(gamma) || ~isfinite(gamma)
        error('entropyChange:InvalidGamma', ...
            'gamma must be a finite real scalar.');
    end

    if gamma <= 1
        error('entropyChange:InvalidGamma', ...
            'gamma must be greater than 1.');
    end

    T = temperatureRatio(M, gamma);
    p = pressureRatio(M, gamma);

    dsOverR = (gamma / (gamma - 1)) .* log(T) - log(p);

end
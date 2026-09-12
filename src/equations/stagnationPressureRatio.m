function ratio = stagnationPressureRatio(M, gamma)
%STAGNATIONPRESSURERATIO Rayleigh-flow stagnation pressure ratio.
%
%   ratio = stagnationPressureRatio(M, gamma)
%
%   Calculates p0/p0* relative to the sonic reference state, M* = 1.
%
%   Equation:
%       p0/p0* = (p/p*) *
%           [ (1 + (gamma-1)/2*M^2) / ((gamma+1)/2) ]
%           ^(gamma/(gamma-1))

    narginchk(2, 2);

    if ~isnumeric(M) || ~isreal(M) || any(~isfinite(M(:)))
        error('stagnationPressureRatio:InvalidMach', ...
            'Mach number M must be finite and real.');
    end

    if any(M(:) <= 0)
        error('stagnationPressureRatio:InvalidMach', ...
            'Mach number M must be greater than zero.');
    end

    if ~isnumeric(gamma) || ~isscalar(gamma) || ...
            ~isreal(gamma) || ~isfinite(gamma)
        error('stagnationPressureRatio:InvalidGamma', ...
            'gamma must be a finite real scalar.');
    end

    if gamma <= 1
        error('stagnationPressureRatio:InvalidGamma', ...
            'gamma must be greater than 1.');
    end

    pRatio = pressureRatio(M, gamma);

    isentropicFactor = ...
        (1 + ((gamma - 1) / 2) .* M.^2) ./ ...
        ((gamma + 1) / 2);

    ratio = pRatio .* ...
        isentropicFactor.^(gamma / (gamma - 1));

end
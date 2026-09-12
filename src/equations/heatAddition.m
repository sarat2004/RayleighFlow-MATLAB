function qOverCpTstar = heatAddition(M, gamma)
%HEATADDITION Rayleigh-flow heat addition normalized by cp*T*.
%
%   qOverCpTstar = heatAddition(M, gamma)
%
%   Calculates the nondimensional heat transfer:
%
%       q/(cp*T*)
%
%   using:
%
%       q/(cp*T*) = T0/T* - (gamma+1)/2

    narginchk(2, 2);

    if ~isnumeric(M) || ~isreal(M) || any(~isfinite(M(:)))
        error('heatAddition:InvalidMach', ...
            'Mach number M must be finite and real.');
    end

    if any(M(:) <= 0)
        error('heatAddition:InvalidMach', ...
            'Mach number M must be greater than zero.');
    end

    if ~isnumeric(gamma) || ~isscalar(gamma) || ...
            ~isreal(gamma) || ~isfinite(gamma)
        error('heatAddition:InvalidGamma', ...
            'gamma must be a finite real scalar.');
    end

    if gamma <= 1
        error('heatAddition:InvalidGamma', ...
            'gamma must be greater than 1.');
    end

    T = temperatureRatio(M, gamma);
    T0OverT = 1 + ((gamma - 1) / 2) .* M.^2;

    T0OverTstar = T .* T0OverT;

    qOverCpTstar = T0OverTstar - (gamma + 1) / 2;

end
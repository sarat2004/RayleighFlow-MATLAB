function report = validateConservation(M, gamma, tolerance)
%VALIDATECONSERVATION Validate Rayleigh-flow conservation identities.
%
%   report = validateConservation(M, gamma)
%   report = validateConservation(M, gamma, tolerance)
%
%   Validates:
%       1. Mass conservation
%       2. Perfect-gas consistency
%       3. Momentum conservation
%       4. Velocity-Mach-temperature consistency

    narginchk(2, 3);

    if nargin < 3
        tolerance = 1e-12;
    end

    validateInput(M, gamma, tolerance);

    M = M(:);

    p = pressureRatio(M, gamma);
    T = temperatureRatio(M, gamma);
    rho = densityRatio(M, gamma);
    V = velocityRatio(M, gamma);

    massResidual = rho .* V - 1;

    perfectGasResidual = p - rho .* T;

    momentumResidual = ...
        p .* (1 + gamma .* M.^2) - (1 + gamma);

    velocityResidual = ...
        V - M .* sqrt(T);

    massPass = abs(massResidual) <= tolerance;
    perfectGasPass = abs(perfectGasResidual) <= tolerance;
    momentumPass = abs(momentumResidual) <= tolerance;
    velocityPass = abs(velocityResidual) <= tolerance;

    overallPass = all([ ...
        massPass; ...
        perfectGasPass; ...
        momentumPass; ...
        velocityPass]);

    report = struct();

    report.Mach = M;
    report.gamma = gamma;
    report.tolerance = tolerance;

    report.massResidual = massResidual;
    report.perfectGasResidual = perfectGasResidual;
    report.momentumResidual = momentumResidual;
    report.velocityResidual = velocityResidual;

    report.massPass = massPass;
    report.perfectGasPass = perfectGasPass;
    report.momentumPass = momentumPass;
    report.velocityPass = velocityPass;

    report.overallPass = overallPass;

end
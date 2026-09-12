function report = validatePhysics(M, gamma, tolerance)
%VALIDATEPHYSICS Perform integrated Rayleigh-flow physics validation.
%
%   report = validatePhysics(M, gamma)
%   report = validatePhysics(M, gamma, tolerance)
%
%   Performs integrated validation of:
%       1. Sonic reference state
%       2. Conservation identities
%       3. Property finiteness
%       4. Property positivity
%       5. Entropy behavior
%       6. Heat-addition behavior

    narginchk(2, 3);

    if nargin < 3
        tolerance = 1e-12;
    end

    validateInput(M, gamma, tolerance);

    M = M(:);

    sonicReport = validateSonicState(gamma, tolerance);
    conservationReport = ...
        validateConservation(M, gamma, tolerance);

    p = pressureRatio(M, gamma);
    T = temperatureRatio(M, gamma);
    rho = densityRatio(M, gamma);
    V = velocityRatio(M, gamma);
    T0 = stagnationTemperatureRatio(M, gamma);
    p0 = stagnationPressureRatio(M, gamma);
    entropy = entropyChange(M, gamma);
    heat = heatAddition(M, gamma);

    finiteProperties = all(isfinite([ ...
        p; T; rho; V; T0; p0; entropy; heat]));

    positiveProperties = all([ ...
        p > 0; ...
        T > 0; ...
        rho > 0; ...
        V > 0; ...
        T0 > 0; ...
        p0 > 0]);

    entropyBehaviorPass = all(entropy <= tolerance);
    heatBehaviorPass = all(heat <= tolerance);

    sonicIncluded = any(abs(M - 1) <= tolerance);

    overallPass = ...
        sonicReport.overallPass && ...
        conservationReport.overallPass && ...
        finiteProperties && ...
        positiveProperties && ...
        entropyBehaviorPass && ...
        heatBehaviorPass;

    report = struct();

    report.Mach = M;
    report.gamma = gamma;
    report.tolerance = tolerance;

    report.sonicReport = sonicReport;
    report.conservationReport = conservationReport;

    report.finiteProperties = finiteProperties;
    report.positiveProperties = positiveProperties;

    report.entropyBehaviorPass = entropyBehaviorPass;
    report.heatBehaviorPass = heatBehaviorPass;

    report.sonicIncluded = sonicIncluded;
    report.overallPass = overallPass;

end
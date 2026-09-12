function summary = validationReport(M, gamma, tolerance)
%VALIDATIONREPORT Generate a Rayleigh-flow validation summary.
%
%   summary = validationReport(M, gamma)
%   summary = validationReport(M, gamma, tolerance)
%
%   Generates a concise verification and validation summary.

    narginchk(2, 3);

    if nargin < 3
        tolerance = 1e-12;
    end

    validateInput(M, gamma, tolerance);

    physics = validatePhysics(M, gamma, tolerance);

    summary = struct();

    summary.gamma = gamma;
    summary.tolerance = tolerance;

    summary.inputPass = true;

    summary.sonicStatePass = ...
        physics.sonicReport.overallPass;

    summary.massConservationPass = ...
        physics.conservationReport.massPass;

    summary.perfectGasPass = ...
        physics.conservationReport.perfectGasPass;

    summary.momentumPass = ...
        physics.conservationReport.momentumPass;

    summary.velocityConsistencyPass = ...
        physics.conservationReport.velocityPass;

    summary.propertyFinitenessPass = ...
        physics.finiteProperties;

    summary.propertyPositivityPass = ...
        physics.positiveProperties;

    summary.entropyBehaviorPass = ...
        physics.entropyBehaviorPass;

    summary.heatBehaviorPass = ...
        physics.heatBehaviorPass;

    summary.overallPass = physics.overallPass;

    summary.physicsReport = physics;

end
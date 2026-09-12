%% EXAMPLE_VALIDATION
% Demonstration of the Rayleigh-flow V&V system.

clear;
clc;

%--------------------------------------------------------------
% Inputs
%--------------------------------------------------------------

gamma = 1.4;

M = [ ...
    0.2
    0.5
    0.8
    1.0
    1.2
    2.0
    5.0
];

%--------------------------------------------------------------
% Generate validation report
%--------------------------------------------------------------

summary = validationReport(M, gamma);

%--------------------------------------------------------------
% Display report
%--------------------------------------------------------------

disp("==============================================");
disp(" RAYLEIGH FLOW VALIDATION REPORT");
disp("==============================================");

fprintf("Gamma:     %.4f\n", summary.gamma);
fprintf("Tolerance: %.2e\n\n", summary.tolerance);

fprintf("Sonic State                 : %s\n", ...
    passFail(summary.sonicStatePass));

fprintf("Mass Conservation            : %s\n", ...
    passFail(summary.massConservationPass));

fprintf("Perfect Gas Consistency      : %s\n", ...
    passFail(summary.perfectGasPass));

fprintf("Momentum Conservation        : %s\n", ...
    passFail(summary.momentumPass));

fprintf("Velocity Consistency         : %s\n", ...
    passFail(summary.velocityConsistencyPass));

fprintf("Property Finiteness          : %s\n", ...
    passFail(summary.propertyFinitenessPass));

fprintf("Property Positivity          : %s\n", ...
    passFail(summary.propertyPositivityPass));

fprintf("Entropy Behavior             : %s\n", ...
    passFail(summary.entropyBehaviorPass));

fprintf("Heat Addition Behavior       : %s\n", ...
    passFail(summary.heatBehaviorPass));

disp("----------------------------------------------");

fprintf("OVERALL VALIDATION           : %s\n", ...
    passFail(summary.overallPass));

disp("==============================================");


function result = passFail(status)

    if status
        result = "PASS";
    else
        result = "FAIL";
    end

end
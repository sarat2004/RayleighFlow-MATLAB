# RayleighFlow-MATLAB — Engineering Requirements Specification

## 1. Purpose

RayleighFlow-MATLAB is a professional MATLAB-based engineering software tool for the analysis of one-dimensional Rayleigh flow and generation of normalized Rayleigh-flow property tables.

The software shall calculate thermodynamic and flow-property ratios relative to the sonic reference state and provide automated mathematical, physical, and numerical validation.

---

## 2. Scope

The software shall support:

* Rayleigh-flow property calculations
* Subsonic and supersonic flow analysis
* Sonic reference-state calculations
* Normalized property-table generation
* Heat-transfer calculations
* Entropy-change calculations
* Conservation-law verification
* Automated unit testing
* Engineering plots
* CSV, Excel, and MATLAB data export
* Validation reports
* MATLAB App Designer interface in a later development phase

---

## 3. Physical Model

The baseline model shall assume:

1. Steady flow
2. One-dimensional flow
3. Constant duct cross-sectional area
4. Inviscid flow
5. No wall friction
6. No mass addition or removal
7. Heat transfer is permitted
8. Perfect gas
9. Constant specific-heat ratio `gamma`
10. Constant gas constant `R`
11. Thermodynamic equilibrium
12. Sonic reference state defined by `M = 1`

---

## 4. Required Inputs

The software shall accept:

### 4.1 Gas Properties

* Specific-heat ratio, `gamma`
* Specific gas constant, `R`

### 4.2 Flow Range

* Minimum Mach number
* Maximum Mach number
* Mach-number increment

### 4.3 Optional Dimensional State

* Static pressure, `p`
* Static temperature, `T`
* Density, `rho`
* Velocity, `V`
* Mass-flow rate, `mdot`
* Duct area, `A`

Dimensional inputs shall be optional when only normalized Rayleigh properties are required.

---

## 5. Required Outputs

For each Mach number, the software shall calculate:

* Mach number, `M`
* Pressure ratio, `p/p*`
* Temperature ratio, `T/T*`
* Density ratio, `rho/rho*`
* Velocity ratio, `V/V*`
* Stagnation-temperature ratio, `T0/T0*`
* Stagnation-pressure ratio, `p0/p0*`
* Entropy change, `Delta-s/R`
* Heat-transfer parameter

where `*` denotes the sonic reference state.

---

## 6. Governing Conservation Laws

### 6.1 Mass Conservation

For constant area:

`rho V = constant`

or

`rho* V* = rho V`

### 6.2 Momentum Conservation

For frictionless constant-area flow:

`p + rho V^2 = constant`

### 6.3 Energy Conservation

For a calorically perfect gas:

`q = cp (T0,2 - T0,1)`

where:

`cp = gamma R / (gamma - 1)`

---

## 7. Rayleigh Reference State

The reference state shall be the sonic state:

`M* = 1`

All normalized Rayleigh-flow properties shall be calculated relative to this state.

The principal computational domain is:

* `0 < M < 1` — subsonic
* `M = 1` — sonic
* `M > 1` — supersonic

---

## 8. Functional Requirements

### FR-001 — Input Validation

The software shall reject physically invalid inputs.

Examples:

* `gamma <= 1`
* `R <= 0`
* `M <= 0`
* negative temperature
* negative pressure
* invalid Mach-number ranges
* zero Mach-number increment

### FR-002 — Property Calculation

The software shall calculate all required Rayleigh-flow property ratios for a supplied Mach number.

### FR-003 — Table Generation

The software shall generate a complete property table over a user-defined Mach-number range.

### FR-004 — Sonic-State Validation

At `M = 1`, calculated normalized properties shall satisfy the expected sonic-reference conditions.

### FR-005 — Conservation Validation

The software shall verify mass and momentum conservation for calculated states.

### FR-006 — Numerical Validation

The software shall detect:

* NaN values
* Inf values
* invalid numerical ranges
* discontinuities
* unexpected numerical errors

### FR-007 — Automated Testing

All major equation functions shall have automated MATLAB unit tests.

### FR-008 — Visualization

The software shall provide plots for major Rayleigh-flow properties versus Mach number.

### FR-009 — Data Export

Generated tables shall be exportable to:

* CSV
* Excel
* MATLAB `.mat`

### FR-010 — Validation Report

The software shall generate a validation summary containing:

* test status
* failed checks
* maximum numerical error
* conservation errors
* sonic-state errors

---

## 9. Non-Functional Requirements

### NFR-001 — Accuracy

The implementation shall maintain numerical accuracy appropriate for engineering calculations.

### NFR-002 — Reproducibility

Identical inputs shall produce identical results.

### NFR-003 — Modularity

Equations, validation, table generation, visualization, and user-interface components shall remain separated.

### NFR-004 — Maintainability

MATLAB functions shall use clear names, documented inputs/outputs, and consistent coding conventions.

### NFR-005 — Testability

Core mathematical functions shall be independently testable.

### NFR-006 — Traceability

Each implemented equation shall be traceable to the governing Rayleigh-flow theory documented in `docs/equations.md`.

---

## 10. Validation Requirements

The software shall perform validation at multiple levels:

### Level 1 — Input Validation

Check whether supplied inputs are mathematically and physically valid.

### Level 2 — Equation Validation

Check individual Rayleigh-flow equations against known analytical relationships.

### Level 3 — Conservation Validation

Verify mass and momentum conservation.

### Level 4 — Sonic-State Validation

Verify the limiting/reference state at:

`M = 1`

### Level 5 — Numerical Validation

Check numerical stability, finite values, and acceptable errors.

### Level 6 — Regression Testing

Ensure future software modifications do not change previously validated results unexpectedly.

---

## 11. Performance Requirements

For normal engineering table generation, the software should calculate hundreds to thousands of Mach-number states without significant delay.

The implementation shall prioritize:

1. Correctness
2. Numerical stability
3. Maintainability
4. Performance

---

## 12. Software Architecture

The implementation shall follow:

`Input → Core Equations → State Calculation → Validation → Table Generation → Visualization → Export`

The architecture shall separate:

* Core physics
* Mathematical equations
* Validation
* Table generation
* Visualization
* User interface
* Testing

---

## 13. Future Extensions

The architecture should permit future addition of:

* Variable specific heats
* High-temperature gas models
* Real-gas models
* Chemical nonequilibrium
* Hypersonic applications
* Automated optimization
* Uncertainty quantification
* Monte Carlo analysis
* MATLAB App Designer GUI
* Additional compressible-flow models

These features are outside the initial release.

---

## 14. Acceptance Criteria

Version 1.0 shall be considered acceptable when:

1. All required Rayleigh-flow equations are implemented.
2. Input validation is operational.
3. Property tables are generated correctly.
4. Sonic-state checks pass.
5. Conservation checks pass within defined numerical tolerance.
6. Automated unit tests pass.
7. Numerical validation passes.
8. Tables can be exported.
9. Engineering plots can be generated.
10. Documentation is complete.
11. The complete project can be reproduced from the GitHub repository.

---

## 15. Initial Release Target

The first production release shall be:

**RayleighFlow-MATLAB v1.0.0**

The software shall provide a validated MATLAB implementation suitable for academic engineering analysis, research, and further extension.

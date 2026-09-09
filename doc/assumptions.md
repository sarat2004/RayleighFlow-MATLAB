# RayleighFlow-MATLAB — Engineering Assumptions

## 1. Purpose

This document defines the physical, thermodynamic, mathematical, and numerical assumptions used by RayleighFlow-MATLAB.

These assumptions establish the validity and limitations of the initial Rayleigh-flow model.

---

## 2. Flow Assumptions

The initial implementation assumes:

* Steady flow
* One-dimensional flow
* Constant cross-sectional area
* No mass accumulation
* No mass addition
* No mass removal
* No wall friction
* No shaft work
* Heat transfer may occur
* Flow variables vary primarily in the streamwise direction

The governing model is therefore a one-dimensional constant-area flow with heat addition or removal.

---

## 3. Gas Assumptions

The working fluid is modeled as a perfect gas.

The equation of state is:

`p = rho R T`

where:

* `p` = static pressure
* `rho` = density
* `R` = specific gas constant
* `T` = static temperature

---

## 4. Specific-Heat Assumptions

The initial release uses a calorically perfect gas model.

Therefore:

`cp = constant`

`cv = constant`

and:

`gamma = cp/cv = constant`

The relationship between `cp`, `R`, and `gamma` is:

`cp = gamma R/(gamma - 1)`

The initial implementation does not account for temperature-dependent specific heats.

---

## 5. Mach Number

Mach number is defined as:

`M = V/a`

where the speed of sound is:

`a = sqrt(gamma R T)`

Therefore:

`M = V/sqrt(gamma R T)`

Only positive Mach numbers are physically considered.

---

## 6. Sonic Reference State

Rayleigh-flow properties are normalized using the sonic reference state.

The reference condition is:

`M* = 1`

The symbol `*` represents the corresponding sonic-state property.

Examples:

`p/p*`

`T/T*`

`rho/rho*`

`V/V*`

`T0/T0*`

`p0/p0*`

The sonic state is a critical reference condition for Rayleigh flow.

---

## 7. Conservation Assumptions

### 7.1 Mass Conservation

For steady one-dimensional constant-area flow:

`rho V = constant`

Therefore:

`rho V = rho* V*`

### 7.2 Momentum Conservation

For a frictionless constant-area duct:

`p + rho V^2 = constant`

Therefore:

`p + rho V^2 = p* + rho* V*^2`

### 7.3 Energy Conservation

Heat transfer changes the stagnation enthalpy.

For a calorically perfect gas:

`q = cp (T0,2 - T0,1)`

where `q` is heat transferred per unit mass.

---

## 8. Thermal Assumptions

Heat transfer is treated as the mechanism responsible for changing the flow state.

The model does not explicitly simulate:

* Wall temperature distribution
* Heat-transfer coefficient
* Thermal conductivity of the wall
* Radiation
* Conduction through the duct wall
* Detailed transient heat-transfer behavior

The initial model focuses on the resulting thermodynamic flow properties.

---

## 9. Entropy Assumptions

Entropy changes are evaluated using perfect-gas thermodynamic relations.

For constant specific heats:

`Delta-s = cp ln(T2/T1) - R ln(p2/p1)`

The normalized entropy quantity may be expressed as:

`Delta-s/R`

Entropy generation associated with viscous effects is outside the baseline model because wall friction is neglected.

However, heat transfer can produce entropy changes depending on the thermodynamic process.

---

## 10. Flow Regimes

The software shall recognize three regimes:

### Subsonic

`0 < M < 1`

### Sonic

`M = 1`

### Supersonic

`M > 1`

The sonic state represents the limiting condition toward which Rayleigh flow approaches under appropriate heat addition or removal.

---

## 11. Choking Assumption

The initial model treats:

`M = 1`

as the Rayleigh choking condition.

The software shall therefore identify the sonic state and provide validation checks around the choking condition.

---

## 12. Numerical Assumptions

The initial implementation shall use double-precision floating-point arithmetic.

Numerical tolerances shall be defined explicitly rather than relying on uncontrolled comparison of floating-point values.

For example, sonic-state comparisons should use a tolerance:

`abs(M - 1) < tolerance`

rather than requiring exact floating-point equality.

---

## 13. Mach-Number Domain

The table generator shall allow the user to define:

* Minimum Mach number
* Maximum Mach number
* Mach-number increment

The implementation shall reject:

`M <= 0`

unless a future model explicitly defines a different mathematical treatment.

---

## 14. Singular and Limiting Regions

Special attention shall be given to:

* `M → 0`
* `M → 1`
* Very large `M`
* Very small property ratios
* Very large property ratios

Near limiting conditions, numerical errors may become significant.

The validation system shall therefore identify non-finite or numerically unstable results.

---

## 15. Dimensional and Normalized Modes

The software shall distinguish between:

### Normalized Mode

Properties are reported relative to the sonic state.

Example:

`T/T*`

### Dimensional Mode

Where sufficient reference information is provided, dimensional properties may be calculated.

Example:

`T [K]`

`p [Pa]`

`rho [kg/m^3]`

`V [m/s]`

The normalized formulation is the primary functionality of the initial release.

---

## 16. Excluded Physics

The following effects are outside the baseline model:

* Boundary-layer development
* Wall friction
* Fanno flow
* Shock waves
* Expansion fans
* Multidimensional flow
* Chemical reactions
* Combustion chemistry
* Dissociation
* Ionization
* Vibrational nonequilibrium
* Real-gas effects
* Variable specific heats
* Radiation heat transfer
* Turbulence modeling
* Unsteady flow
* Fluid-structure interaction

These may be introduced in future versions.

---

## 17. Engineering Limitations

The Rayleigh-flow model is an idealized analytical model.

It should not automatically be interpreted as a complete model of a real aerospace propulsion or hypersonic-flow system.

Real systems may involve:

* Friction
* Boundary layers
* Nonuniform heating
* Variable gas properties
* Chemical reactions
* Three-dimensional effects
* Turbulence
* Shock-boundary-layer interaction

Therefore, the software shall clearly document its modeling assumptions when presenting results.

---

## 18. Verification Philosophy

The implementation shall follow the hierarchy:

`Equation → Function → Unit Test → Conservation Test → Reference Comparison → System Validation`

Every major mathematical relation should be independently verified before being used by the table generator.

---

## 19. Future Model Extensions

The architecture shall permit future implementation of:

* Variable-`gamma` gas models
* Temperature-dependent `cp`
* High-temperature air
* Real-gas thermodynamics
* Chemical equilibrium
* Nonequilibrium chemistry
* Frictional effects
* Combined Rayleigh-Fanno flow
* Hypersonic reacting flow
* Uncertainty quantification
* Monte Carlo analysis
* Stochastic Rayleigh-flow analysis

These extensions are not part of the baseline `v1.0.0` model.

---

## 20. Baseline Model Definition

The baseline RayleighFlow-MATLAB model can therefore be summarized as:

**Steady + 1-D + constant area + frictionless + perfect gas + constant specific heats + heat transfer + sonic reference state.**

This definition shall be used consistently throughout the equations, MATLAB implementation, validation procedures, tests, and documentation.

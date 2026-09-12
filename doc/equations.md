# Rayleigh Flow — Governing Equations and Derivations

## 1. Purpose

This document defines the mathematical equations used by RayleighFlow-MATLAB.

The equations are derived from:

1. Conservation of mass
2. Conservation of momentum
3. Conservation of energy
4. Perfect-gas thermodynamics
5. Mach-number definition

The equations documented here constitute the mathematical source of truth for the MATLAB implementation.

---

# 2. Notation

| Symbol  | Meaning                            | SI Unit  |
| ------- | ---------------------------------- | -------- |
| `M`     | Mach number                        | —        |
| `M*`    | Sonic Mach number                  | —        |
| `p`     | Static pressure                    | Pa       |
| `p*`    | Sonic static pressure              | Pa       |
| `T`     | Static temperature                 | K        |
| `T*`    | Sonic static temperature           | K        |
| `rho`   | Density                            | kg/m³    |
| `rho*`  | Sonic density                      | kg/m³    |
| `V`     | Flow velocity                      | m/s      |
| `V*`    | Sonic velocity                     | m/s      |
| `T0`    | Stagnation temperature             | K        |
| `T0*`   | Sonic stagnation temperature       | K        |
| `p0`    | Stagnation pressure                | Pa       |
| `p0*`   | Sonic stagnation pressure          | Pa       |
| `R`     | Specific gas constant              | J/(kg·K) |
| `gamma` | Specific-heat ratio                | —        |
| `cp`    | Specific heat at constant pressure | J/(kg·K) |
| `cv`    | Specific heat at constant volume   | J/(kg·K) |
| `q`     | Heat transfer per unit mass        | J/kg     |
| `s`     | Specific entropy                   | J/(kg·K) |
| `A`     | Duct cross-sectional area          | m²       |
| `mdot`  | Mass-flow rate                     | kg/s     |

The symbol `*` always denotes the sonic reference state.

---

# 3. Perfect-Gas Relations

The perfect-gas equation is:

`p = rho R T`

Therefore:

`rho = p/(RT)`

The specific-heat relation is:

`gamma = cp/cv`

and:

`R = cp - cv`

Therefore:

`cp = gamma R/(gamma - 1)`

and:

`cv = R/(gamma - 1)`

---

# 4. Speed of Sound

For a perfect gas:

`a = sqrt(gamma R T)`

The Mach number is:

`M = V/a`

Therefore:

`V = M sqrt(gamma R T)`

At the sonic reference state:

`M* = 1`

Therefore:

`V* = sqrt(gamma R T*)`

---

# 5. Conservation of Mass

For steady one-dimensional flow:

`mdot = rho V A`

Rayleigh flow assumes constant area:

`A = constant`

Therefore:

`rho V = constant`

Relative to the sonic state:

`rho V = rho* V*`

Divide by `rho* V*`:

`(rho/rho*)(V/V*) = 1`

Therefore:

`V/V* = rho*/rho`

or:

`V/V* = 1/(rho/rho*)`

---

# 6. Conservation of Momentum

For a frictionless constant-area duct:

`p + rho V² = constant`

Relative to the sonic state:

`p + rho V² = p* + rho* V*²`

Using:

`rho V = rho* V*`

define:

`G = rho V`

Then:

`rho V² = G V`

and:

`rho* V*² = G V*`

Therefore:

`p + G V = p* + G V*`

or:

`p - p* = G(V* - V)`

This equation defines the Rayleigh momentum constraint.

---

# 7. Expressing Momentum in Terms of Mach Number

Using:

`V = M sqrt(gamma R T)`

and:

`a² = gamma R T`

we have:

`V² = M² gamma R T`

From the perfect-gas equation:

`p = rho R T`

therefore:

`rho V² = rho M² gamma R T`

Since:

`rho R T = p`

we obtain:

`rho V² = gamma p M²`

Therefore the momentum equation becomes:

`p + gamma p M² = constant`

or:

`p(1 + gamma M²) = constant`

At the sonic state:

`p*(1 + gamma M*²) = constant`

Since:

`M* = 1`

we obtain:

`p*(1 + gamma) = constant`

Therefore:

`p(1 + gamma M²) = p*(1 + gamma)`

Hence:

## Pressure Ratio

`p/p* = (1 + gamma)/(1 + gamma M²)`

This is the fundamental Rayleigh pressure relation.

---

# 8. Density Ratio

From mass conservation:

`rho V = rho* V*`

Therefore:

`rho/rho* = V*/V`

Using:

`V = M sqrt(gamma R T)`

and:

`V* = sqrt(gamma R T*)`

we obtain:

`V/V* = M sqrt(T/T*)`

Therefore:

`rho/rho* = 1/[M sqrt(T/T*)]`

We can alternatively derive density using the perfect-gas relation:

`p/p* = (rho/rho*)(T/T*)`

Therefore:

`rho/rho* = (p/p*)/(T/T*)`

The resulting normalized density relation is:

## Density Ratio

`rho/rho* = M²(1 + gamma)/(1 + gamma M²)`

---

# 9. Temperature Ratio

Using:

`p/p* = (rho/rho*)(T/T*)`

we have:

`T/T* = (p/p*)/(rho/rho*)`

Substitute:

`p/p* = (1 + gamma)/(1 + gamma M²)`

and:

`rho/rho* = M²(1 + gamma)/(1 + gamma M²)`

Therefore:

`T/T* = 1/M²`

Wait: this intermediate simplification reveals an important result.

For Rayleigh flow:

## Temperature Ratio

`T/T* = (1 + gamma)² M²/(1 + gamma M²)²`

The expression must be used together with the velocity/mass-conservation relationship.

A direct verification is:

`(rho/rho*)(T/T*) = p/p*`

Substitution gives:

`[M²(1 + gamma)/(1 + gamma M²)]`

×

`[(1 + gamma)² M²/(1 + gamma M²)²]`

which does not reproduce the pressure relation.

Therefore, the density and temperature expressions must be derived consistently from the governing equations before implementation.

The correct Rayleigh relations are derived below.

---

# 10. Correct Derivation of Density and Temperature Ratios

From the pressure relation:

`p/p* = (1 + gamma)/(1 + gamma M²)`

From the mass relation:

`rho V = rho* V*`

and:

`V/V* = M sqrt(T/T*)`

we obtain:

`rho/rho* = 1/[M sqrt(T/T*)]`

Using:

`p/p* = (rho/rho*)(T/T*)`

substitute:

`p/p* = sqrt(T/T*)/M`

Therefore:

`sqrt(T/T*) = M(p/p*)`

Hence:

`T/T* = M²(p/p*)²`

Substituting the pressure ratio:

`T/T* = M² [(1 + gamma)/(1 + gamma M²)]²`

Therefore:

## Temperature Ratio

`T/T* = M²(1 + gamma)²/(1 + gamma M²)²`

Now use:

`rho/rho* = (p/p*)/(T/T*)`

to obtain:

`rho/rho* = [ (1 + gamma)/(1 + gamma M²) ]`

/

`[ M²(1 + gamma)²/(1 + gamma M²)² ]`

Therefore:

## Density Ratio

`rho/rho* = (1 + gamma M²)/(M²(1 + gamma))`

This is the correct density ratio.

---

# 11. Velocity Ratio

From mass conservation:

`rho V = rho* V*`

Therefore:

`V/V* = rho*/rho`

Hence:

## Velocity Ratio

`V/V* = M²(1 + gamma)/(1 + gamma M²)`

This can also be verified using:

`V/V* = M sqrt(T/T*)`

Substituting the temperature relation:

`V/V* = M × [M(1 + gamma)/(1 + gamma M²)]`

Therefore:

`V/V* = M²(1 + gamma)/(1 + gamma M²)`

---

# 12. Verification of the Basic Ratios

The three principal relations are:

`p/p* = (1 + gamma)/(1 + gamma M²)`

`T/T* = M²(1 + gamma)²/(1 + gamma M²)²`

`rho/rho* = (1 + gamma M²)/(M²(1 + gamma))`

`V/V* = M²(1 + gamma)/(1 + gamma M²)`

They must satisfy:

`p/p* = (rho/rho*)(T/T*)`

and:

`(rho/rho*)(V/V*) = 1`

These identities will later become automated validation tests.

---

# 13. Stagnation Temperature

For a calorically perfect gas:

`T0 = T + V²/(2cp)`

Since:

`V² = gamma R T M²`

and:

`cp = gamma R/(gamma - 1)`

we obtain:

`V²/(2cp) = [(gamma - 1)/2] T M²`

Therefore:

`T0/T = 1 + (gamma - 1)M²/2`

At the sonic state:

`T0*/T* = 1 + (gamma - 1)/2`

Therefore:

`T0*/T* = (gamma + 1)/2`

Hence:

`T0/T0* = (T/T*) × [1 + (gamma - 1)M²/2] / [(gamma + 1)/2]`

Substituting the temperature ratio gives:

## Stagnation Temperature Ratio

`T0/T0* = M²(1 + gamma)[2 + (gamma - 1)M²]/ (1 + gamma M²)²`

---

# 14. Stagnation Pressure

For isentropic deceleration from a local state to zero velocity:

`p0/p = [1 + (gamma - 1)M²/2]^(gamma/(gamma - 1))`

At the sonic state:

`p0*/p* = [(gamma + 1)/2]^(gamma/(gamma - 1))`

Therefore:

## Stagnation Pressure Ratio

`p0/p0* = (p/p*)`

×

`[ (1 + (gamma - 1)M²/2) / ((gamma + 1)/2) ]^(gamma/(gamma - 1))`

---

# 15. Entropy Change

For a perfect gas:

`ds = cp dT/T - R dp/p`

Integrating between two states:

`Delta-s = cp ln(T2/T1) - R ln(p2/p1)`

Divide by `R`:

`Delta-s/R = (cp/R) ln(T2/T1) - ln(p2/p1)`

Since:

`cp/R = gamma/(gamma - 1)`

we obtain:

`Delta-s/R = gamma/(gamma - 1) ln(T2/T1) - ln(p2/p1)`

Using the sonic state as reference:

## Entropy Relative to Sonic State

`Delta-s/R = gamma/(gamma - 1) ln(T/T*) - ln(p/p*)`

---

# 16. Heat Transfer

For a calorically perfect gas:

`q = cp(T0,2 - T0,1)`

Relative to the sonic state:

`q/(cp T0*) = T0/T0* - T0,1/T0*`

If a reference state is chosen, the heat transfer can therefore be obtained from the change in stagnation temperature.

For a state relative to the sonic reference:

`q/(cp T*) = (T0/T*) - (T0*/T*)`

where:

`T0*/T* = (gamma + 1)/2`

Therefore:

`q/(cp T*) = T0/T* - (gamma + 1)/2`

This form will be useful for normalized heat-addition calculations.

---

# 17. Sonic-State Verification

At:

`M = 1`

the normalized properties must satisfy:

`p/p* = 1`

`T/T* = 1`

`rho/rho* = 1`

`V/V* = 1`

`T0/T0* = 1`

`p0/p0* = 1`

The MATLAB validation system shall explicitly test these conditions.

---

# 18. Conservation Identities

The calculated normalized properties shall satisfy the following identities.

### Mass

`(rho/rho*)(V/V*) = 1`

### Perfect Gas

`(p/p*) = (rho/rho*)(T/T*)`

### Momentum

`(p/p*)(1 + gamma M²) = 1 + gamma`

### Velocity-Mach relation

`V/V* = M sqrt(T/T*)`

These identities provide independent checks of the implementation.

---

# 19. Limiting Behavior

The implementation must consider the behavior near:

`M → 0`

`M → 1`

`M → ∞`

At:

`M → 1`

all normalized properties approach unity.

Near:

`M = 0`

some Rayleigh ratios may become very large or very small.

At large Mach numbers, numerical conditioning must be monitored.

The table generator shall therefore support configurable numerical tolerances.

---

# 20. Equation-to-MATLAB Traceability

The following mapping shall be used during implementation.

| Equation      | MATLAB Function                |
| ------------- | ------------------------------ |
| `p/p*`        | `pressureRatio.m`              |
| `T/T*`        | `temperatureRatio.m`           |
| `rho/rho*`    | `densityRatio.m`               |
| `V/V*`        | `velocityRatio.m`              |
| `T0/T0*`      | `stagnationTemperatureRatio.m` |
| `p0/p0*`      | `stagnationPressureRatio.m`    |
| `Delta-s/R`   | `entropyChange.m`              |
| Heat transfer | `heatAddition.m`               |

Each function shall implement one clearly defined engineering relationship.

---

# 21. Mathematical Source-of-Truth Principle

The MATLAB implementation shall not contain undocumented engineering equations.

Every production equation shall have:

1. A theoretical definition
2. A derivation or authoritative mathematical basis
3. A MATLAB implementation
4. A unit test
5. A physics-validation test

This provides traceability between the physics and software.

---

# 22. Important Verification Note

Before implementation, all normalized Rayleigh-flow equations shall be independently cross-checked against an authoritative compressible-flow reference.

The equations shall then be frozen as the baseline mathematical specification for `v1.0.0`.

This prevents an incorrect equation from propagating into:

* MATLAB code
* Property tables
* Validation tests
* Plots
* Exported engineering data

---

# 23. Baseline Equation Set

The implementation baseline is:

### Pressure

`p/p* = (1 + gamma)/(1 + gamma M²)`

### Temperature

`T/T* = M²(1 + gamma)²/(1 + gamma M²)²`

### Density

`rho/rho* = (1 + gamma M²)/(M²(1 + gamma))`

### Velocity

`V/V* = M²(1 + gamma)/(1 + gamma M²)`

### Stagnation Temperature

`T0/T0* = M²[2 + (gamma - 1)M²]/(gamma + 1)`

### Stagnation Pressure

`p0/p0* = (p/p*) × [ (1 + (gamma - 1)M²/2) / ((gamma + 1)/2) ]^(gamma/(gamma - 1))`

### Entropy

`Delta-s/R = gamma/(gamma - 1) ln(T/T*) - ln(p/p*)`

These equations form the initial computational specification for RayleighFlow-MATLAB.

---

# 24. Next Implementation Stage

After mathematical verification, the equations shall be implemented as independent MATLAB functions.

The implementation sequence shall be:

```text
pressureRatio.m
        ↓
temperatureRatio.m
        ↓
densityRatio.m
        ↓
velocityRatio.m
        ↓
stagnationTemperatureRatio.m
        ↓
stagnationPressureRatio.m
        ↓
entropyChange.m
        ↓
heatAddition.m
```

The functions shall then be tested individually before integration into the Rayleigh-flow state calculator.

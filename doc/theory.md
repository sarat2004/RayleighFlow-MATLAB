# Rayleigh Flow Theory

## 1. Introduction

Rayleigh flow is an idealized model of compressible fluid flow through a constant-area duct in which heat transfer occurs.

The model assumes:

* Steady flow
* One-dimensional flow
* Constant duct area
* No friction
* No mass addition or removal
* Heat transfer between the fluid and surroundings
* Perfect-gas behavior

Rayleigh flow is primarily used to understand how heat addition or heat removal changes the thermodynamic and aerodynamic state of a compressible flow.

---

## 2. Physical Model

Consider a constant-area duct:

```text
        Heat transfer q
             ↓↓↓
    ┌───────────────────┐
 →  │                   │  →
    │   Compressible    │
    │      flow         │
    │                   │
    └───────────────────┘
        A = constant
```

The flow variables can change along the duct:

* Pressure `p`
* Temperature `T`
* Density `rho`
* Velocity `V`
* Mach number `M`
* Stagnation temperature `T0`
* Stagnation pressure `p0`
* Entropy `s`

Although the area remains constant, heat transfer causes the flow to accelerate or decelerate.

---

## 3. Control Volume

For steady one-dimensional flow, consider a control volume between stations 1 and 2.

```text
       q
       ↓
 ┌───────────────┐
 │               │
 │  Station 1    │    Station 2
 → │       FLOW    │ →
 │               │
 └───────────────┘
```

The conservation equations governing the flow are:

1. Conservation of mass
2. Conservation of momentum
3. Conservation of energy

Together with the perfect-gas equation of state, these equations define the Rayleigh-flow solution.

---

## 4. Conservation of Mass

The general steady-flow mass equation is:

`mdot = rho V A`

For constant area:

`A = constant`

Therefore:

`rho V = constant`

Hence:

`rho_1 V_1 = rho_2 V_2`

Using the sonic reference state:

`rho V = rho* V*`

This is one of the fundamental Rayleigh-flow relations.

---

## 5. Conservation of Momentum

For a frictionless constant-area duct, the momentum equation becomes:

`p + rho V^2 = constant`

Therefore:

`p_1 + rho_1 V_1^2 = p_2 + rho_2 V_2^2`

At the sonic reference state:

`p + rho V^2 = p* + rho* V*^2`

This equation is responsible for the characteristic pressure-Mach-number relationship of Rayleigh flow.

---

## 6. Conservation of Energy

Heat transfer changes the stagnation enthalpy.

For a calorically perfect gas:

`h0 = h + V^2/2`

Since:

`h = cp T`

and:

`h0 = cp T0`

we obtain:

`cp T0 = cp T + V^2/2`

Therefore:

`T0 = T + V^2/(2cp)`

Using the Mach-number relation:

`V = M sqrt(gamma R T)`

the stagnation temperature becomes:

`T0/T = 1 + (gamma - 1)/2 M^2`

Heat transfer per unit mass between two states is:

`q = h0,2 - h0,1`

or:

`q = cp(T0,2 - T0,1)`

Thus, unlike an adiabatic flow, Rayleigh flow allows the stagnation temperature to change.

---

## 7. Perfect-Gas Equation

The equation of state is:

`p = rho R T`

Therefore:

`rho = p/(RT)`

This relation connects pressure, density, and temperature.

For two states:

`p_1/(rho_1 T_1) = p_2/(rho_2 T_2) = R`

---

## 8. Mach Number

Mach number is defined as:

`M = V/a`

where the speed of sound is:

`a = sqrt(gamma R T)`

Therefore:

`V = M sqrt(gamma R T)`

The Mach number determines whether the flow is:

### Subsonic

`0 < M < 1`

### Sonic

`M = 1`

### Supersonic

`M > 1`

---

## 9. Sonic Reference State

Rayleigh-flow properties are conventionally normalized using the sonic state.

The sonic reference condition is:

`M* = 1`

The superscript or symbol `*` denotes the corresponding sonic-state property.

Examples include:

`p/p*`

`T/T*`

`rho/rho*`

`V/V*`

`T0/T0*`

`p0/p0*`

The sonic state provides a common reference for generating Rayleigh-flow tables.

---

## 10. Derivation of Pressure Ratio

From momentum conservation:

`p + rho V^2 = p* + rho* V*^2`

From mass conservation:

`rho V = rho* V*`

Therefore:

`rho V^2 = (rho V)V`

and:

`rho* V*^2 = (rho V)V*`

Hence:

`p + rho V V = p* + rho V V*`

Using:

`rho V = constant`

and:

`V/V*` related to the Mach and temperature ratios, the normalized pressure relation can be derived.

The standard Rayleigh pressure relation is:

`p/p* = (1 + gamma)/(1 + gamma M^2)`

This equation is fundamental to the Rayleigh-flow property table.

---

## 11. Density Ratio

Using the perfect-gas equation:

`p = rho R T`

Therefore:

`rho/rho* = (p/p*)/(T/T*)`

The resulting normalized density relation is:

`rho/rho* = M^2(1 + gamma)/(1 + gamma M^2)`

---

## 12. Temperature Ratio

Using the pressure and density relationships:

`T/T* = (p/p*)/(rho/rho*)`

The standard result is:

`T/T* = M^2(1 + gamma)^2/(1 + gamma M^2)^2`

This relation determines how static temperature varies along the Rayleigh line.

---

## 13. Velocity Ratio

From mass conservation:

`rho V = rho* V*`

Therefore:

`V/V* = rho*/rho`

Hence:

`V/V* = (1 + gamma M^2)/(M^2(1 + gamma))`

---

## 14. Stagnation Temperature Ratio

For a perfect gas:

`T0/T = 1 + (gamma - 1)/2 M^2`

Using the Rayleigh static-temperature relationship and normalizing by the sonic state gives:

`T0/T0* = 2(1 + gamma)M^2 / (1 + gamma M^2)^2`

This quantity is important for determining heat addition or removal.

---

## 15. Stagnation Pressure Ratio

The stagnation pressure for isentropic conversion from a local static state is:

`p0/p = [1 + (gamma - 1)/2 M^2]^(gamma/(gamma - 1))`

Therefore, relative to the sonic reference state:

`p0/p0* = (p/p*) ×`

`[ (1 + (gamma - 1)/2 M^2) / ((gamma + 1)/2) ]^(gamma/(gamma - 1))`

This provides the normalized stagnation-pressure relationship.

---

## 16. Entropy Change

For a perfect gas with constant specific heats:

`Delta-s = cp ln(T2/T1) - R ln(p2/p1)`

Dividing by `R`:

`Delta-s/R = [gamma/(gamma - 1)] ln(T2/T1) - ln(p2/p1)`

Using the sonic state as reference:

`Delta-s/R = [gamma/(gamma - 1)] ln(T/T*) - ln(p/p*)`

This allows entropy variation along the Rayleigh line to be calculated.

---

## 17. Rayleigh Line

The momentum equation:

`p + rho V^2 = constant`

combined with the equation of state and mass conservation produces a locus of possible thermodynamic states known as the **Rayleigh line**.

On a pressure-specific-volume diagram, the Rayleigh line represents the states satisfying momentum conservation for a constant-area flow.

Heat transfer moves the flow from one state on the Rayleigh line to another.

---

## 18. Subsonic Flow with Heat Addition

For subsonic flow:

`M < 1`

Heat addition generally causes:

* Mach number to increase
* Velocity to increase
* Flow to move toward `M = 1`
* The flow to approach the sonic choking condition

Thus:

`Subsonic + Heat Addition → M → 1`

The sonic state represents the maximum-entropy state along the Rayleigh line.

---

## 19. Supersonic Flow with Heat Addition

For supersonic flow:

`M > 1`

Heat addition causes:

* Mach number to decrease
* Flow to move toward `M = 1`
* The flow to approach the sonic condition

Thus:

`Supersonic + Heat Addition → M → 1`

Therefore, heat addition drives both subsonic and supersonic Rayleigh flow toward the sonic state, although the direction of Mach-number change differs.

---

## 20. Heat Removal

Heat removal produces the opposite movement along the Rayleigh line.

For subsonic flow, heat removal generally drives the Mach number away from unity toward lower Mach numbers.

For supersonic flow, heat removal generally drives the Mach number away from unity toward higher Mach numbers.

Therefore:

```text
Subsonic:
Heat addition  → M increases → M → 1
Heat removal   → M decreases → M ← away from 1

Supersonic:
Heat addition  → M decreases → M → 1
Heat removal   → M increases → M → away from 1
```

---

## 21. Rayleigh Choking

The sonic condition:

`M = 1`

represents the Rayleigh choking condition.

As heat is added to a subsonic or supersonic flow, the flow approaches this condition.

At the sonic state:

`M* = 1`

and the normalized properties become unity:

`p/p* = 1`

`T/T* = 1`

`rho/rho* = 1`

`V/V* = 1`

`T0/T0* = 1`

`p0/p0* = 1`

This provides a powerful internal validation condition for the software.

---

## 22. Maximum Entropy State

The sonic state corresponds to the maximum entropy state on the Rayleigh line.

Therefore, as heat is added appropriately:

`Delta-s → maximum`

at:

`M = 1`

This behavior provides an important physical validation criterion.

---

## 23. Thermodynamic Interpretation

Rayleigh flow demonstrates the strong coupling between:

* Heat transfer
* Momentum
* Pressure
* Temperature
* Density
* Velocity
* Mach number
* Entropy

The duct area remains constant, yet the velocity changes because heat transfer changes the thermodynamic state while mass and momentum conservation continue to apply.

This makes Rayleigh flow fundamentally different from:

* Isentropic flow
* Fanno flow
* Normal shock flow

---

## 24. Comparison with Other Compressible-Flow Models

| Model           | Area              | Friction     | Heat Transfer     | Mass Addition |
| --------------- | ----------------- | ------------ | ----------------- | ------------- |
| Isentropic flow | Variable/constant | No           | No                | No            |
| Fanno flow      | Constant          | Yes          | No                | No            |
| Rayleigh flow   | Constant          | No           | Yes               | No            |
| Normal shock    | Constant          | Shock losses | Usually adiabatic | No            |

Rayleigh flow is therefore the appropriate idealized model when **heat transfer is the dominant non-isentropic mechanism** in a constant-area duct.

---

## 25. Engineering Applications

Rayleigh-flow concepts are relevant to:

* Gas-turbine combustors
* Ramjet combustors
* Scramjet analysis
* Afterburners
* Heated wind tunnels
* High-speed propulsion
* Constant-area heat-addition ducts
* Compressible-flow research
* Hypersonic propulsion studies

For real aerospace systems, additional physical effects must generally be considered.

---

## 26. Baseline Mathematical Model

The complete baseline model is built from:

### Conservation equations

`rho V A = constant`

`p + rho V^2 = constant`

`q = cp(T0,2 - T0,1)`

### Thermodynamic relations

`p = rho R T`

`a = sqrt(gamma R T)`

`M = V/a`

`T0/T = 1 + (gamma - 1)M^2/2`

### Rayleigh normalized relations

`p/p* = (1 + gamma)/(1 + gamma M^2)`

`rho/rho* = M^2(1 + gamma)/(1 + gamma M^2)`

`T/T* = M^2(1 + gamma)^2/(1 + gamma M^2)^2`

`V/V* = (1 + gamma M^2)/(M^2(1 + gamma))`

These equations form the mathematical foundation of the MATLAB implementation.

---

## 27. Software Traceability

The implementation shall maintain the following relationship:

```text
Physical Model
      ↓
Conservation Laws
      ↓
Thermodynamic Relations
      ↓
Normalized Rayleigh Relations
      ↓
MATLAB Equation Functions
      ↓
Unit Tests
      ↓
Physics Validation
      ↓
Property Table
      ↓
Visualization / Export
```

No production MATLAB calculation shall be introduced without identifying its governing physical or mathematical relationship.

---

## 28. Limitations

The baseline Rayleigh-flow model does not represent:

* Wall friction
* Boundary-layer effects
* Turbulence
* Chemical reactions
* Combustion kinetics
* Dissociation
* Ionization
* Real-gas behavior
* Variable specific heats
* Three-dimensional flow
* Unsteady flow
* Non-equilibrium thermodynamics

These effects require more advanced physical models.

---

## 29. Summary

Rayleigh flow is a one-dimensional, steady, constant-area, frictionless compressible-flow model with heat transfer.

Its fundamental behavior is governed by:

`Mass + Momentum + Energy + Perfect-Gas Thermodynamics`

The sonic state:

`M = 1`

is used as the normalized reference state.

The resulting property relations form the mathematical foundation of the **RayleighFlow-MATLAB** property-table generator.

The next stage of the project is to convert these theoretical relationships into independently testable MATLAB functions.

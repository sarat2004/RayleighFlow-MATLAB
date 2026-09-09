# Rayleigh Flow MATLAB — Validation Specification

## 1. Purpose

This document defines the validation strategy for the Rayleigh Flow MATLAB engineering software.

The objective is to demonstrate that the software:

* Implements the Rayleigh-flow equations correctly.
* Produces physically meaningful thermodynamic states.
* Satisfies mass, momentum, and thermodynamic consistency.
* Correctly identifies the sonic reference state.
* Produces numerically stable results within the intended operating domain.
* Agrees with trusted analytical/reference data.
* Remains stable after future software modifications.

Validation is treated as a continuous engineering activity rather than a final project step.

---

# 2. Validation Philosophy

The software shall follow the hierarchy:

```text
Requirements
     ↓
Analytical equations
     ↓
Individual MATLAB functions
     ↓
Equation identity tests
     ↓
Physical conservation tests
     ↓
Sonic-state tests
     ↓
Reference-data comparison
     ↓
Regression tests
     ↓
Final validation report
```

A calculation shall not be considered validated merely because MATLAB executes without an error.

The validation process must demonstrate both:

1. **Mathematical correctness**
2. **Physical correctness**

---

# 3. Validation Levels

The project uses five primary validation levels.

## Level 1 — Input Validation

Checks whether user-provided parameters are mathematically and physically acceptable.

Examples:

* `gamma > 1`
* `R > 0`
* `M > 0`
* Mach range is valid.
* Mach increment is positive.
* Dimensional properties are positive when supplied.

---

## Level 2 — Mathematical Validation

Checks individual equations and mathematical relationships.

Examples:

```text
rho/rho* × V/V* = 1
```

```text
(p/p*) = (rho/rho*) × (T/T*)
```

```text
(p/p*) × (1 + gamma M²) = 1 + gamma
```

---

## Level 3 — Physical Validation

Checks conservation laws and physical behavior.

The primary conservation equations are:

### Mass conservation

For constant-area Rayleigh flow:

$$
\rho V = constant
$$

Therefore,

$$
\frac{\rho}{\rho^*}
\frac{V}{V^*}=1
$$

### Momentum conservation

$$
p+\rho V^2=constant
$$

Using the sonic reference state:

$$
\frac{p}{p^*}
+
\gamma M^2
\frac{p}{p^*}
=
1+\gamma
$$

or

$$
\boxed{
\frac{p}{p^*}(1+\gamma M^2)=1+\gamma
}
$$

---

## Level 4 — Reference Validation

Calculated values shall be compared against trusted analytical equations and authoritative Rayleigh-flow reference tables.

The project shall maintain reference data separately under:

```text
data/reference/
```

Reference values may include:

* Pressure ratio
* Temperature ratio
* Density ratio
* Velocity ratio
* Stagnation temperature ratio
* Stagnation pressure ratio
* Entropy change
* Heat-transfer parameter

---

## Level 5 — Regression Validation

Previously validated results shall be stored as regression baselines.

After software modifications, the current results shall be compared with the approved baseline.

A change that modifies validated results must be investigated and documented.

---

# 4. Input Validation

The following conditions shall be checked before performing Rayleigh-flow calculations.

| Parameter      | Requirement    |
| -------------- | -------------- |
| \(\gamma\)     | \(\gamma > 1\) |
| \(R\)          | \(R > 0\)      |
| \(M\)          | \(M > 0\)      |
| Mach increment | \(>0\)         |
| Temperature    | \(T>0\)        |
| Pressure       | \(p>0\)        |
| Density        | \(\rho>0\)     |
| Velocity       | \(V>0\)        |
| Area           | \(A>0\)        |
| Mass flow rate | \(\dot m>0\)   |

Invalid inputs shall produce controlled MATLAB errors rather than silently generating invalid results.

---

# 5. Domain Validation

The primary Rayleigh-flow domain is:

$$
0<M<\infty
$$

with three important regions.

### Subsonic region

$$
0<M<1
$$

### Sonic reference

$$
M=1
$$

### Supersonic region

$$
M>1
$$

The software shall explicitly identify the region associated with each calculated state.

Example:

```text
M = 0.50 → Subsonic
M = 1.00 → Sonic
M = 2.00 → Supersonic
```

---

# 6. Sonic-State Validation

The sonic state is the fundamental reference condition for normalized Rayleigh-flow properties.

At:

$$
M^*=1
$$

the following conditions must hold:

$$
\frac{p}{p^*}=1
$$

$$
\frac{T}{T^*}=1
$$

$$
\frac{\rho}{\rho^*}=1
$$

$$
\frac{V}{V^*}=1
$$

$$
\frac{T_0}{T_0^*}=1
$$

$$
\frac{p_0}{p_0^*}=1
$$

$$
\frac{\Delta s}{R}=0
$$

and

$$
\frac{q}{c_pT^*}=0
$$

The MATLAB implementation shall automatically test these conditions.

---

# 7. Pressure-Ratio Validation

The analytical pressure ratio is:

$$
\boxed{
\frac{p}{p^*}
=
\frac{1+\gamma}
{1+\gamma M^2}
}
$$

Validation shall confirm:

1. Correct value at \(M=1\).
2. Positive pressure ratio.
3. Correct subsonic behavior.
4. Correct supersonic behavior.
5. Agreement with independent calculation.

The independent validation expression shall not rely exclusively on the same MATLAB function being tested.

---

# 8. Temperature-Ratio Validation

The temperature ratio is:

$$
\boxed{
\frac{T}{T^*}
=
\frac{
M^2(1+\gamma)^2
}{
(1+\gamma M^2)^2
}
}
$$

The implementation shall verify:

$$
\frac{T}{T^*}=1
$$

at:

$$
M=1
$$

and shall verify that:

$$
\frac{T}{T^*}>0
$$

throughout the valid Mach domain.

---

# 9. Density-Ratio Validation

The density ratio is:

$$
\boxed{
\frac{\rho}{\rho^*}
=
\frac{1+\gamma M^2}
{M^2(1+\gamma)}
}
$$

It shall satisfy:

$$
\frac{\rho}{\rho^*}>0
$$

for all valid \(M>0\).

At the sonic condition:

$$
\boxed{
\frac{\rho}{\rho^*}=1
}
$$

---

# 10. Velocity-Ratio Validation

The velocity ratio is:

$$
\boxed{
\frac{V}{V^*}
=
\frac{
M^2(1+\gamma)
}{
1+\gamma M^2
}
}
$$

Mass conservation requires:

$$
\boxed{
\frac{\rho}{\rho^*}
\frac{V}{V^*}=1
}
$$

This identity shall be used as an automated validation test.

---

# 11. Perfect-Gas Consistency Validation

The perfect-gas relation is:

$$
p=\rho RT
$$

Therefore, normalized quantities must satisfy:

$$
\boxed{
\frac{p}{p^*}
=
\frac{\rho}{\rho^*}
\frac{T}{T^*}
}
$$

The software shall calculate the residual:

$$
R_{PG}
=
\frac{p}{p^*}
-
\left(
\frac{\rho}{\rho^*}
\frac{T}{T^*}
\right)
$$

The residual shall remain within the defined numerical tolerance.

---

# 12. Momentum-Conservation Validation

The Rayleigh momentum equation is:

$$
p+\rho V^2=constant
$$

Using the sonic reference state gives:

$$
\boxed{
\frac{p}{p^*}(1+\gamma M^2)
=
1+\gamma
}
$$

The momentum residual shall be calculated as:

$$
R_{mom}
=
\frac{p}{p^*}(1+\gamma M^2)
-
(1+\gamma)
$$

The result shall satisfy:

$$
|R_{mom}|<\epsilon
$$

where \(\epsilon\) is the selected numerical tolerance.

---

# 13. Stagnation-Temperature Validation

For a perfect gas:

$$
\frac{T_0}{T}
=
1+
\frac{\gamma-1}{2}M^2
$$

At the sonic reference:

$$
\frac{T_0^*}{T^*}
=
\frac{\gamma+1}{2}
$$

Therefore:

$$
\boxed{
\frac{T_0}{T_0^*}
=
\frac{
M^2(1+\gamma)
[2+(\gamma-1)M^2]
}{
(1+\gamma M^2)^2
}
}
$$

The MATLAB result shall be independently reconstructed from:

$$
\frac{T_0}{T_0^*}
=
\frac{T}{T^*}
\frac{T_0/T}{T_0^*/T^*}
$$

and both results shall agree within tolerance.

---

# 14. Stagnation-Pressure Validation

For a perfect gas:

$$
p_0
=
p
\left[
1+
\frac{\gamma-1}{2}M^2
\right]^{\gamma/(\gamma-1)}
$$

The normalized stagnation-pressure ratio is:

$$
\boxed{
\frac{p_0}{p_0^*}
=
\frac{p}{p^*}
\left[
\frac{
1+\frac{\gamma-1}{2}M^2
}{
(\gamma+1)/2
}
\right]^{\gamma/(\gamma-1)}
}
$$

Validation shall compare the dedicated function against independent reconstruction from the static pressure ratio.

---

# 15. Entropy Validation

For a perfect gas:

$$
ds
=
c_p\frac{dT}{T}
-
R\frac{dp}{p}
$$

For normalized Rayleigh states:

$$
\boxed{
\frac{\Delta s}{R}
=
\frac{\gamma}{\gamma-1}
\ln\left(\frac{T}{T^*}\right)
-
\ln\left(\frac{p}{p^*}\right)
}
$$

At the sonic reference:

$$
\boxed{
\Delta s=0
}
$$

The entropy function shall also demonstrate the Rayleigh-flow property that the sonic state corresponds to the maximum entropy state along the Rayleigh line.

Numerical validation should therefore examine states on both sides of:

$$
M=1
$$

and verify the expected entropy trend.

---

# 16. Heat-Addition Validation

The energy equation gives:

$$
q=h_{0,2}-h_{0,1}
$$

For a calorically perfect gas:

$$
q=c_p(T_{0,2}-T_{0,1})
$$

Using the sonic reference:

$$
\boxed{
\frac{q}{c_pT^*}
=
\frac{T_0}{T^*}
-
\frac{\gamma+1}{2}
}
$$

At the sonic reference:

$$
\boxed{
\frac{q}{c_pT^*}=0
}
$$

The implementation shall verify this condition.

---

# 17. Conservation-Identity Test Suite

The following identities shall be tested automatically.

### Mass identity

$$
\boxed{
\left(\frac{\rho}{\rho^*}\right)
\left(\frac{V}{V^*}\right)=1
}
$$

### Perfect-gas identity

$$
\boxed{
\frac{p}{p^*}
=
\frac{\rho}{\rho^*}
\frac{T}{T^*}
}
$$

### Momentum identity

$$
\boxed{
\frac{p}{p^*}
(1+\gamma M^2)
=
1+\gamma
}
$$

### Mach-temperature-velocity identity

Since:

$$
V=M\sqrt{\gamma RT}
$$

the normalized velocity must satisfy:

$$
\boxed{
\frac{V}{V^*}
=
M\sqrt{\frac{T}{T^*}}
}
$$

All four identities shall be included in automated validation.

---

# 18. Representative Test Cases

The initial automated test suite shall include representative Mach numbers:

```text
M = 0.2
M = 0.5
M = 0.8
M = 1.0
M = 1.2
M = 2.0
M = 5.0
```

The baseline gas-property case shall use:

```text
gamma = 1.4
```

Additional gamma values may be tested to ensure that the implementation is not accidentally hard-coded for air:

```text
gamma = 1.3
gamma = 1.4
gamma = 1.67
```

---

# 19. Numerical Tolerance

MATLAB uses floating-point double precision for the primary implementation.

Exact equality shall not normally be used for numerical validation.

Instead, the comparison shall use:

$$
|a-b|
\le
a_{tol}
+
r_{tol}
\max(|a|,|b|)
$$

where:

* \(a_{tol}\) = absolute tolerance
* \(r_{tol}\) = relative tolerance

Initial engineering defaults:

```text
Absolute tolerance = 1e-12
Relative tolerance = 1e-10
```

These values may be adjusted after numerical conditioning tests.

For extreme Mach-number limits, relative or scaled residuals should be preferred because some quantities may approach zero or become very large.

---

# 20. Finite-Value Validation

Every public calculation function shall be checked for:

```text
NaN
Inf
complex values
negative values where physically impossible
```

For example:

```matlab
assert(all(isfinite(result)));
```

Dimensionless thermodynamic ratios that represent positive physical properties shall satisfy:

```matlab
assert(all(result > 0));
```

where applicable.

---

# 21. Limiting-Behavior Validation

The implementation shall be tested near important physical limits.

### Near sonic condition

Examples:

```text
M = 0.999
M = 1.000
M = 1.001
```

The implementation shall remain numerically stable and converge smoothly toward the sonic reference state.

### Low Mach number

Examples:

```text
M = 0.1
M = 0.05
```

The implementation shall remain finite for practical nonzero Mach numbers.

### High Mach number

Examples:

```text
M = 3
M = 5
M = 10
```

The implementation shall remain numerically stable within the intended engineering domain.

Extremely large or extremely small Mach numbers shall be treated as numerical-conditioning tests rather than normal operating points.

---

# 22. Reference-Data Validation

Trusted Rayleigh-flow reference data shall eventually be stored under:

```text
data/reference/
```

The comparison procedure shall be:

```text
Reference value
      ↓
MATLAB calculation
      ↓
Difference
      ↓
Relative error
      ↓
Acceptance decision
```

Relative error:

$$
\text{Error}_{rel}
=
\frac{|x_{MATLAB}-x_{ref}|}
{\max(|x_{ref}|,\epsilon)}
$$

Reference tables should preferably originate from authoritative compressible-flow literature such as NACA/NASA technical references.

---

# 23. Automated Unit Testing

MATLAB's unit-testing framework shall be used.

Example test organization:

```text
tests/
├── testPressureRatio.m
├── testTemperatureRatio.m
├── testSonicState.m
├── testConservation.m
└── testRegression.m
```

Each test file shall contain focused tests rather than one large test function.

Example conceptual test:

```matlab
function testSonicPressureRatio(testCase)

    gamma = 1.4;
    M = 1.0;

    result = pressureRatio(M,gamma);

    verifyEqual(testCase,result,1,'AbsTol',1e-12);

end
```

The exact implementation may evolve as the software architecture is developed.

---

# 24. Regression Testing

Regression testing protects previously validated results.

A regression dataset may contain:

```text
Mach
gamma
p/p*
T/T*
rho/rho*
V/V*
T0/T0*
p0/p0*
entropy
heat addition
```

After software modifications:

```text
Current result
      ↓
Compare with baseline
      ↓
Difference detected?
      ↓
Yes → investigate
No  → pass
```

A regression failure shall not automatically be treated as a software bug.

The change may be:

* A bug fix
* An intentional physics correction
* An improved numerical method
* A changed requirement
* An accidental regression

Every intentional baseline change must be documented.

---

# 25. Validation Severity Classification

Validation failures shall be classified as follows.

### Critical

Examples:

* Conservation violation.
* Incorrect sonic state.
* Incorrect fundamental Rayleigh equation.
* NaN/Inf during normal operating conditions.

A critical failure blocks release.

### Major

Examples:

* Reference-table disagreement.
* Significant numerical error.
* Incorrect export values.
* Incorrect visualization of validated quantities.

A major failure blocks the affected release feature.

### Minor

Examples:

* Formatting discrepancy.
* Small documentation inconsistency.
* Non-critical plotting issue.

Minor issues may be fixed in a subsequent development cycle.

---

# 26. Validation Report

The final validation report shall contain:

```text
1. Software version
2. MATLAB version
3. Test date
4. Test environment
5. Input parameters
6. Test cases
7. Analytical reference values
8. MATLAB results
9. Absolute errors
10. Relative errors
11. Conservation residuals
12. Sonic-state residuals
13. Regression results
14. Failed tests
15. Corrective actions
16. Final validation status
```

The report shall be exportable to:

```text
output/reports/
```

---

# 27. Acceptance Criteria

The Rayleigh Flow MATLAB software shall be considered validated when:

* All required unit tests pass.
* Fundamental Rayleigh equations agree with independent analytical calculations.
* Mass conservation passes.
* Momentum conservation passes.
* Perfect-gas consistency passes.
* Sonic-state properties converge to unity.
* Entropy behavior is physically consistent.
* Heat-transfer calculations satisfy the energy relation.
* No unexpected NaN or Inf values occur within the validated domain.
* Reference-data comparisons satisfy the approved tolerance.
* Regression tests pass.
* Validation results are documented.
* No unresolved critical validation failures remain.

---

# 28. Traceability Matrix

| Requirement            | Validation Method          | MATLAB Test                 |
| ---------------------- | -------------------------- | --------------------------- |
| Input validation       | Boundary tests             | `validateInput`             |
| Pressure equation      | Analytical comparison      | `testPressureRatio`         |
| Temperature equation   | Analytical comparison      | `testTemperatureRatio`      |
| Density equation       | Analytical comparison      | `testDensityRatio`          |
| Velocity equation      | Analytical comparison      | `testVelocityRatio`         |
| Sonic state            | \(M=1\) test               | `testSonicState`            |
| Mass conservation      | Identity residual          | `testConservation`          |
| Momentum conservation  | Identity residual          | `testConservation`          |
| Perfect-gas relation   | Identity residual          | `testConservation`          |
| Stagnation temperature | Independent reconstruction | `testStagnationTemperature` |
| Stagnation pressure    | Independent reconstruction | `testStagnationPressure`    |
| Entropy                | Analytical relation        | `testEntropy`               |
| Heat addition          | Energy relation            | `testHeatAddition`          |
| Reference data         | Table comparison           | `testRegression`            |
| Numerical stability    | Boundary/limit tests       | `testNumericalStability`    |

---

# 29. Validation Development Principle

Validation shall be implemented alongside the corresponding engineering equations.

The preferred development sequence is:

```text
Write equation
     ↓
Implement MATLAB function
     ↓
Create unit test
     ↓
Validate analytical identity
     ↓
Validate physical behavior
     ↓
Integrate into larger system
```

This prevents errors from propagating through the project.

The final software should therefore be regarded not simply as a MATLAB calculator, but as a **verified engineering computation tool** with traceable equations, automated tests, conservation checks, reference comparisons, and documented assumptions.

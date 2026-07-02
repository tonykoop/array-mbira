# Design Intent — array-mbira rev A

- Master CAD: none. This packet has no `cad/*.scad` (see `evolution/master/manifest.json` notes) — design.md
  withholds all tine/resonator dimensions pending a measured tine mule.
- Function: A plucked metal-tine idiophone arranged as a chromatic, isomorphic grid so a musical
  interval maps to the same physical movement anywhere on the array (design.md "Concept" / "Playing Surface").
  Each tine is a tuned cantilever clamped at a bridge and plucked at the free end (design.md "Tine Mechanics").
- Environment: hand-held or table-played; resonator layer reinforces selected frequency regions
  under a body that must also support tine-replacement service access.
- Target qty: 1 (prototype). Deadline: TBD. Budget/unit ceiling: TBD.

## Critical dimensions (carry tolerances)

| Feature | Nominal | Tolerance | Why critical | Source |
| --- | --- | --- | --- | --- |
| Tine length/width/thickness | TBD — pending_measurement | tine-mule gate | pitch/tuning | design.md "Tine Mechanics" (no values released) |
| Interval mapping (grid direction -> interval) | TBD — open design question | ergonomic layout mockup | playability/transposability | design.md "Playing Surface" |
| Bridge clamp pressure | TBD — pending_measurement | mule gate | pitch stability, buzz | design.md "Tine Mechanics" |
| Resonator topology (shared/grouped/removable) | TBD — undecided | resonator comparison gate | loudness balance, dead notes | design.md "Resonator System" |
| Body support mode (lap/table/strap) | TBD — pending mockup | body interface gate | ergonomics | design.md "Body And Ergonomics" |

## Incidental (free for DFM)

- Cosmetic labeling/marking system for isomorphic navigation (bom.csv AM-BOM-007, concept_only).
- Case/frame styling once support mode is selected.

## Must-nots (DFM may never violate)

- Never publish a tine-scale/tuning chart, DXF, or CAD geometry until the tine mule and layout
  mockup gates in design.md "L2 Packet Gates" are measured and reviewed (risks.md).
- Never assign resonator cavity volumes or port sizes before the resonator-comparison gate.
- Never treat estimate placeholders in bom.csv/cut-list.csv/sourcing.csv as fabrication dimensions.

## Material intent

- Tine stock: spring-temper metal strip, alloy/gauge TBD pending mule (bom.csv AM-BOM-001).
- Resonator body: shared or modular system, material TBD pending topology decision (bom.csv AM-BOM-004).
- Damping: felt/foam/gasket family, TBD placement (bom.csv AM-BOM-006).

## Stage status

Stage 0 intake complete 2026-07-01, concept-level only (no CAD master to intake). Gate A (Alpha
shop compile) cannot run without a CAD master and has NOT been started.

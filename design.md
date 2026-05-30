<!-- SPDX-License-Identifier: CC-BY-4.0 -->
---
instrument: Array Mbira
slug: array-mbira
family: idiophone
class: plucked lamellophone with isomorphic chromatic tine array
readiness: L2 V5 build-packet candidate
authority: concept_only / pending_measurement
---

# Array Mbira Design

## Concept

The array mbira is a plucked metal-tine instrument organized as a chromatic isomorphic grid. Each tine is a tuned cantilever. The grid layout is chosen so the same musical interval maps to the same physical movement anywhere on the array, making patterns transposable by position rather than by new fingering.

This L2 packet captures mechanism, review gates, and planned test surfaces. It
does not define a final tuning, scale, tine length, tine width, tine thickness,
resonator size, bridge geometry, or case size.

## Playing Surface

The playing surface is a regular tine array rather than a traditional left-right kalimba fan. Neighboring rows or columns would represent consistent musical intervals, but the actual interval mapping is still a design decision. The intended player experience is pattern-based: chords, scales, and arpeggios keep their shape when moved across the field.

Open questions for the layout:

- Which interval should each grid direction represent?
- Should duplicated notes appear to improve hand ergonomics?
- Should the array favor two-thumb playing, multi-finger table playing, or a hybrid?
- How much spacing is needed before adjacent tines are playable without accidental contact?

L2 evidence target: a paper or non-sounding ergonomic layout mockup that records
reach, hand mode, labeling strategy, accidental-contact risks, and duplicated
note needs without claiming final spacing.

## Tine Mechanics

Each tine behaves like a springy metal cantilever clamped at a bridge and plucked at the free end. Tuning depends on material, unsupported length, thickness, width, clamp pressure, end mass, surface finish, and local damping. This packet intentionally avoids equations and dimensions until a measured tine mule exists.

The bridge system should allow controlled experiments with:

- tine seating and repeatable clamp force;
- small tuning adjustments without damaging the tine;
- isolation between neighboring tines;
- serviceable replacement of individual tines;
- quiet mechanical damping where sympathetic buzz appears.

L2 evidence target: a removable tine mule with adjustable clamp pressure,
replaceable tine stock, buzz notes, sustain observations, pitch stability, and
serviceability notes. No tine scale or tuning chart should be released until the
mule is measured.

## Resonator System

The resonator layer should reinforce selected frequency regions without pretending to individually tune every cavity in this L2 pass. Candidate approaches include a shared hollow body, grouped chamber zones, or removable resonator modules below the array. The design must watch for uneven loudness, dead notes, excessive sympathetic ringing, and resonance shifts when the player holds the instrument.

No resonator volume, mouth size, port geometry, or coupling target is specified here. Those belong in a measured L2 packet after the tine mule reveals actual response.

L2 evidence target: interchangeable resonator comparison notes using the same
tine mule so loudness balance, dead notes, sympathetic coupling, and hand-held
versus table-supported behavior can be separated from layout speculation.

## Body And Ergonomics

The body has to support the tine bridge, protect the resonators, and place the array where the hands can navigate interval shapes. A future build-packet candidate should test whether the instrument is best held in the lap, set on a table, or worn/strapped. The playing angle, wrist clearance, and visual note labeling are all pending physical mockup.

L2 evidence target: body interface requirements that separate bridge load,
resonator volume, access for tine replacement, wrist clearance, and labeling
visibility before CAD is produced.

## Parametric Intent

Future design tables should separate:

- pitch map and isomorphic interval mapping;
- tine material and stock provenance;
- tine geometry and clamp settings;
- bridge and pressure-bar design;
- resonator topology and coupling observations;
- body support mode and ergonomic constraints;
- measured sustain, pitch stability, loudness balance, and buzz notes.

Every numeric field in those future tables should be marked by provenance: measured mule, reviewed CAD parameter, supplier specification, or `estimate_pending_measurement`.

## L2 Packet Gates

| Gate | Current authority | Promotion evidence |
| --- | --- | --- |
| Layout mockup | pending_measurement | Ergonomic review of interval directions, duplicated notes, hand mode, and accidental-contact risk. |
| Tine mule | pending_measurement | Measured removable-tine response with stock provenance, clamp state, sustain, buzz, and pitch stability observations. |
| Bridge and pressure bar | pending_measurement | Reviewed clamp method and serviceability notes from the mule. |
| Resonator comparison | pending_measurement | Notes comparing shared, grouped, or removable resonators without claiming tuned volumes. |
| Body interface | pending_measurement | Requirements map for bridge support, resonator clearance, hand position, and service access. |
| CAD/drawings | pending_measurement | Reviewed CAD, DXF, or drawing authority after measured parameters exist. |

## V5 Boundary

This is an L2 build-packet candidate. It is not a tuning plan, tine-cutting
chart, resonator design, CAD source, DXF release, or fabrication package.

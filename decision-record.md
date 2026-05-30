<!-- SPDX-License-Identifier: CC-BY-4.0 -->

# Decision Record

## qmd Step 0

- `timeout 30 qmd query "array-mbira Array mbira - a chromatic isomorphic array of tuned metal tines over resonators, laid out so intervals are spatially consistent; tine tuning, array geometry, resonator coupling"` started with local node-llama CPU fallback and then crashed in Bun with segmentation faults.
- Result: no usable qmd content was returned. This packet is grounded in the round 7 contract and real array-mbira mechanics, while keeping all dimensions, tuning, and resonator claims at concept or pending-measurement authority.

## Key Decisions

- Place the repo at `instruments/idiophones/array-mbira` because the sound source is plucked tuned tines, a lamellophone/idiophone mechanism.
- Promote readiness to `L2 V5 build-packet candidate` by naming review gates,
  test surfaces, and authority boundaries while keeping all physical values
  pending measurement.
- Treat the instrument as a chromatic isomorphic array, not a traditional fan kalimba layout.
- Keep interval mapping as an open design variable until ergonomics and note duplication are tested.
- Model each tine conceptually as a tuned metal cantilever, but do not publish tine scale, pitch table, or cut data in L2.
- Treat resonators as a coupled body or modular layer to be tested, not as tuned cavities with claimed values.
- Use a removable tine mule and a non-sounding layout mockup before any full
  body CAD or DXF is produced.

## Open Questions

- Which grid directions should carry the primary interval steps?
- Should notes be duplicated to reduce awkward reaches?
- Should the first mule be thumb-played, table-played, or multi-finger playable?
- Which tine stock gives stable pitch, useful sustain, and low breakage risk?
- Does a shared resonator body help balance the array, or does it create uneven coupling?
- What evidence should promote this packet beyond L2: measured tine mule, ergonomic layout mockup, resonator comparison, or all three?

## L2 Promotion Gates

- Layout mockup records hand mode, interval directions, note duplication,
  labeling, and accidental-contact risks.
- Tine mule records stock provenance, clamp state, sustain, buzz, pitch
  stability, loudness, and serviceability.
- Bridge and pressure-bar review records clamp repeatability and tine
  replacement behavior.
- Resonator comparison records shared, grouped, and removable module behavior
  without assigning tuned volumes.
- Body interface review separates bridge load, resonator clearance, hand
  position, labeling visibility, and service access.
- CAD, DXF, and tine-scale tables remain blocked until measured or reviewed
  parameters exist.

## Authority Boundary

No dimensions, tine lengths, tuning values, resonator volumes, CAD geometry, DXF coordinates, or measured performance claims are made in this repo. Promotion beyond L2 requires measured tine response, layout ergonomics, resonator coupling evidence, and reviewed design tables.

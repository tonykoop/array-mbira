<!-- SPDX-License-Identifier: CC-BY-4.0 -->

# Array Mbira

Status: L2 V5 build-packet candidate

This repository is a V5 L2 build-packet candidate for an array mbira: a
chromatic, isomorphic layout of tuned metal tines mounted over resonators so
interval relationships remain spatially consistent across the playing surface.

This packet is not build-ready. It contains no fabricated dimensions, tine lengths, tuning table, resonator volumes, CAD geometry, DXF coordinates, or measured validation data. All geometry, pitch layout, tine scaling, bridge details, resonator coupling, and ergonomics remain pending measurement and prototype review.

## Packet Map

- `design.md` - real mechanism, layout intent, tine and resonator reasoning.
- `bom.csv` - estimated parts families only.
- `cut-list.csv` - planned test and fabrication classes with all dimensions
  blocked pending measurement.
- `visual-output-register.csv` - V5 authority register; every row is
  concept-only or pending measurement.
- `cad/mcp-session-log.md` - provenance stub; no MCP or CAD session was run.
- `decision-record.md` - qmd Step 0, decisions, open questions, and promotion gates.
- `sourcing.csv`, `validation.csv`, `risks.md`, `drawing-brief.md` - V5 baseline
  packet tables; all fields TBD/pending_measurement (no CAD/tine dimensions yet).
- `evolution/` - evolution-pipeline Stage 0 intake of the current concept-level
  design docs (no CAD master exists yet; Gate A not started).

## L2 Review Boundary

The next useful step is a small non-public mule: a few removable tines,
adjustable bridge pressure, and interchangeable resonator tests. L2 names those
test surfaces and their authority boundaries. Promotion to L3 requires measured
tine response, reviewed layout spacing, bridge/clamp evidence, resonator
comparison data, and CAD or drawing authority for every fabricated part.

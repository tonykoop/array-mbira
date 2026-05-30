<!-- SPDX-License-Identifier: CC-BY-4.0 -->

# Array Mbira

Status: L1 concept packet

This repository is a V5 L1 concept packet for an array mbira: a chromatic, isomorphic layout of tuned metal tines mounted over resonators so interval relationships remain spatially consistent across the playing surface.

This packet is not build-ready. It contains no fabricated dimensions, tine lengths, tuning table, resonator volumes, CAD geometry, DXF coordinates, or measured validation data. All geometry, pitch layout, tine scaling, bridge details, resonator coupling, and ergonomics remain pending measurement and prototype review.

## Packet Map

- `design.md` - real mechanism, layout intent, tine and resonator reasoning.
- `bom.csv` - estimated parts families only.
- `visual-output-register.csv` - V5 authority register; every row is concept-only or pending measurement.
- `cad/mcp-session-log.md` - provenance stub; no MCP or CAD session was run.
- `decision-record.md` - qmd Step 0, decisions, open questions, and promotion gates.

## Readiness Boundary

The next useful step is a small non-public mule: a few removable tines, adjustable bridge pressure, and interchangeable resonator tests. Only measured tine response, damping, sustain, loudness, and cross-coupling should promote this repo beyond L1.

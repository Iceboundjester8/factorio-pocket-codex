# OPS.TRIAGE.001 — Crash triage (fast isolation)

**Type:** C  
**Scope:** OPS  
**Effective:** 2026-02-24  
**Applies to:** V / M / LIB

## Purpose
Identify the minimum set of mods/patches that triggers a crash, then fix via patch-lib.

## Ladder
1) **Crash on startup (data stage)**  
   - Suspect prototype/tech conflicts or missing optional deps.
2) **Crash loading save**  
   - Suspect removed/renamed prototypes/entities.
3) **No crash, but broken gameplay**  
   - Suspect recipe/tech reorder or unintended overrides.

## Bisect method (modpack)
- Disable the newest mod(s) first.
- If still crashing: disable half the remaining mods.
- Keep halving until you isolate the smallest crashing set.

## Fix discipline
- Fix in **modpack-lib** using guarded lookups/fallbacks.
- Log patch ID + rollback steps.

**See also:** OPS.NOFORKS.001
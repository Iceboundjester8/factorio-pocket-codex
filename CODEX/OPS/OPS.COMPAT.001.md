# OPS.COMPAT.001 — Compatibility policy (official-feel)

**Type:** C  
**Scope:** OPS  
**Effective:** 2026-02-24  
**Applies to:** M / LIB

## Policy
- Never fork or edit upstream mods.
- Prefer minimal, reversible patches.
- Soft integrations only unless required for stability.

## Priorities
1) **Stability** (no crashes)
2) **Save integrity** (migrations don’t brick worlds)
3) **Performance** (MP-safe, low tick)
4) **UX clarity** (official-feel)
5) **Balance** (only after the above)

## Patch discipline
Every change must have:
- Patch ID
- Why
- Scope
- Risk
- Rollback
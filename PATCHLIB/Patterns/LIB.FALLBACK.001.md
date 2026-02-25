# LIB.FALLBACK.001 — Guarded lookups + fallbacks (data stage)

**Type:** C  
**Scope:** LIB  
**Applies to:** LIB

## Problem
Mods may rename/remove prototypes (items, tools, recipes). Hard references crash at data stage.

## Rule
Always *guard* lookups and provide a fallback path.

## Pattern (pseudocode)
- Try the preferred prototype name.
- If missing, try known alternates.
- If still missing, pick a safe default or skip the patch.

## Logging
If a fallback path is used, note it in the patch log so it’s visible later.

**See also:** OPS.TRIAGE.001
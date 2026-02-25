# Patch Standards (LIB.STD.001)

## Hard rules
- Do not edit upstream mods. Patch in **modpack-lib** only.
- Prefer conditional lookups and fallbacks; never hard-crash on missing prototypes.
- One patch = one logged ID + rollback note.

## Patch header template
**Patch ID:** PATCH.<AREA>.###  
**Why:**  
**Scope:** (mods affected)  
**Risk:** Low/Med/High  
**Rollback:** (exact steps)

## Patterns
- Use `data.raw[...]` guarded lookups (data stage)
- Use optional dependencies where supported
- Keep changes minimal and isolated

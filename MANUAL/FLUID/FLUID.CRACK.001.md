# FLUID.CRACK.001 — Cracking control (keep refineries flowing)

**Type:** E  
**Scope:** V  
**Stage:** Mid  
**Tags:** #oil #cracking #fluids  
**Applies to:** V / M

## Why cracking exists
Refineries can stall if **any output** backs up. Cracking converts “excess” fluids into what you need so the system keeps moving.

## Core conversions
- **Heavy → Light** (Heavy oil cracking)
- **Light → Petroleum** (Light oil cracking)

## Simple operator control (good enough)
- If **Heavy** storage is high, enable Heavy→Light.
- If **Light** storage is high, enable Light→Petroleum.
- Keep **some** Heavy available for lube (don’t crack it all).

## Common stable policy
- Heavy tank: crack above ~70%
- Light tank: crack above ~70%
(Exact numbers can be tuned; the concept is “only crack surplus”.)

**See also:** FLUID.OIL.001
# TRAINS.SIGNALS.001 — Signal basics (block vs chain)

**Type:** E  
**Scope:** V  
**Stage:** Mid  
**Tags:** #rail #signals #throughput  
**Applies to:** V / M

## Core idea
- **Rail signal** splits track into **blocks**; only one train per block.
- **Chain signal** looks ahead; use it **before intersections** so trains don’t enter unless they can exit.

## Rule of thumb
- Put **chain signals on every entrance to a junction**.
- Put **rail signals on every exit** (right after the junction).

## Common failure
If trains stop inside the intersection, you used a rail signal where a chain signal should be.

**See also:** TRAINS.JUNCTIONS.001 (when created)

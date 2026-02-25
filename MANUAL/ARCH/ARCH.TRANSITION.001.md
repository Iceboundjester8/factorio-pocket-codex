# ARCH.TRANSITION.001 — Bus → Rail grid transition (minimize pain)

**Type:** C  
**Scope:** OPS  
**Stage:** Mid/Late  
**Tags:** #architecture #bus #cityblocks #rails  
**Applies to:** V / M

## Trigger
Start transitioning when:
- adding new lanes becomes constant friction, or
- the bus is forcing long belt runs and constant rerouting, or
- throughput upgrades require rebuilding half the base.

## Transition plan (safe)
1) Keep the bus running. Do **not** rip it out first.
2) Build a rail spine + one starter block.
3) Move one subsystem at a time (e.g., circuits, then modules).
4) Feed the bus from rail blocks until the bus becomes “starter production”.

## Rule
Never migrate more than one major dependency chain at once.

**See also:** ARCH.BUS.001, TRAINS.SIGNALS.001
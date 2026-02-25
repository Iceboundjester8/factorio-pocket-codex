# TRAINS.JUNCTIONS.001 — Junction rules (your standard)

**Type:** E  
**Scope:** V  
**Stage:** Mid/Late  
**Tags:** #rail #junctions #signals #throughput  
**Applies to:** V / M

## Goal
Keep intersections **clear**. A train must never stop inside a junction unless it is guaranteed to exit immediately.

## Signal placement (standard)
- **Chain signal** on *every* entrance into the junction.
- **Rail signal** on *every* exit *after* the junction.
- If the junction is large, chain-signal internal decision points so trains reserve only what they can clear.

## Spacing rules
- Leave enough space after each exit rail signal for your longest train to fully clear the junction.
- Avoid stations too close to junction exits (they create “exit blocking”).

## Debug checklist
- Train stopped inside junction → replace the last **rail** before the junction with **chain**.
- Trains won’t enter at all → check there is a valid **exit** block and that exit signals are not mis-placed.

**See also:** TRAINS.SIGNALS.001
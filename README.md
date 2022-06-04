# No Trainers #

This is a mod for Skyrim Special Edition, that prevents trainer NPCs from offering their training services to the player.

![Certified trainer](resources/trainer.jpg)

### Requirements ###

* [SKSE](http://skse.silverlock.org)

### How it works ###

When the player begins dialogue with an NPC, an event is triggered which removes that NPC from all trainer factions 
(`JobTrainerFaction` and `JobTrainerXFaction`, where 'X' is the name of a skill). This means that they cannot offer 
the player any trainer services during the dialogue. When the dialogue ends, we restore the removed factions. 

### Why?

I play with a mod called Gold Is XP, which disables normal skill leveling. Instead, the player earns XP whenever they acquire 
gold. When the player sleeps, that XP can be spent to level up skills.

At high skill levels, trainer NPC costs are much lower than the XP costs in the mod. Therefore trainers become an easy way 
to bypass the whole gold-based leveling system.

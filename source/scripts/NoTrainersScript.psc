Scriptname NoTrainersScript extends ReferenceAlias  

Faction property JobTrainerFaction auto
Faction property JobTrainerArcheryFaction auto
Faction property JobTrainerAlchemyFaction auto
Faction property JobTrainerAlterationFaction auto
Faction property JobTrainerBlockFaction auto
Faction property JobTrainerConjurationFaction auto
Faction property JobTrainerDestructionFaction auto
Faction property JobTrainerEnchantingFaction auto
Faction property JobTrainerHeavyArmorFaction auto
Faction property JobTrainerIllusionFaction auto
Faction property JobTrainerLightArmorFaction auto
Faction property JobTrainerLockpickingFaction auto
Faction property JobTrainerOneHandedFaction auto
Faction property JobTrainerPickpocketFaction auto
Faction property JobTrainerRestorationFaction auto
Faction property JobTrainerSmithingFaction auto
Faction property JobTrainerSneakFaction auto
Faction property JobTrainerSpeechFaction auto
Faction property JobTrainerTwoHandedFaction auto

Actor trainerNPC
Faction[] trainerNPCFactions

; outdoor locations can be several cells, so if a trainer is encountered in generic wilderness cells this may
; not catch them.

Event OnInit()
	RegisterForMenu("Dialogue Menu")
EndEvent

Event OnPlayerLoadGame()
	RegisterForMenu("Dialogue Menu")
EndEvent


; The event below works, but faction removal is PERMANENT even if the mod is uninstalled.
; Event OnLocationChange(Location oldLoc, Location newLoc)
	; Actor[] npcs = MiscUtil.ScanCellNPCsByFaction(JobTrainerFaction, Game.GetPlayer(), 0.0, IgnoreDead=true)
	; int npcIndex = 0
	; while (npcIndex < npcs.Length)
		; RemoveFromTrainerFactions(npcs[npcIndex])
		; debug.notification("Removed " + npcs[npcIndex].GetBaseObject().GetName() + " from trainer factions")
		; npcIndex += 1
	; endwhile
; EndEvent


Event OnMenuOpen(string menuName)
	if menuName == "Dialogue Menu"
		Actor[] npcs = MiscUtil.ScanCellNPCs(Game.GetPlayer(), 200.0)
		int npcIndex = 0
		while npcIndex < npcs.Length
			if npcs[npcIndex].IsInDialogueWithPlayer()
				;debug.notification(trainerNPC.GetBaseObject().GetName() + " is in dialogue with player")
			endif
			if npcs[npcIndex].IsInDialogueWithPlayer() && npcs[npcIndex].IsInFaction(JobTrainerFaction)
				trainerNPC = npcs[npcIndex]
				trainerNPCFactions = trainerNPC.GetFactions(-128,127)
				RemoveFromTrainerFactions(trainerNPC)
				;debug.notification("Removed " + trainerNPC.GetBaseObject().GetName() + " from trainer factions")
				return
			endif
			npcIndex += 1
		endwhile
		;debug.notification("Found no trainer NPCs in dialogue with player")
	endif
EndEvent


Event OnMenuClose(string menuName)
	if menuName == "Dialogue Menu"
		Actor[] npcs = MiscUtil.ScanCellNPCs(Game.GetPlayer(), 200.0)
		int npcIndex = 0
		while npcIndex < npcs.Length
			if npcs[npcIndex] == trainerNPC
				int factionIndex = 0
				while factionIndex < trainerNPCFactions.Length
					trainerNPC.AddToFaction(trainerNPCFactions[factionIndex])
					factionIndex += 1
				endwhile
				;debug.notification("Restored trainer factions to " + trainerNPC.GetBaseObject().GetName())
				trainerNPC = none
				return
			endif
			npcIndex += 1
		endwhile
		;debug.notification("Found no trainer NPCs in dialogue with player")
	endif
EndEvent


Function RemoveFromTrainerFactions(Actor npc)
	npc.RemoveFromFaction(JobTrainerFaction)
	npc.RemoveFromFaction(JobTrainerArcheryFaction)
	npc.RemoveFromFaction(JobTrainerAlchemyFaction)
	npc.RemoveFromFaction(JobTrainerAlterationFaction)
	npc.RemoveFromFaction(JobTrainerBlockFaction)
	npc.RemoveFromFaction(JobTrainerConjurationFaction)
	npc.RemoveFromFaction(JobTrainerDestructionFaction)
	npc.RemoveFromFaction(JobTrainerEnchantingFaction)
	npc.RemoveFromFaction(JobTrainerHeavyArmorFaction)
	npc.RemoveFromFaction(JobTrainerIllusionFaction)
	npc.RemoveFromFaction(JobTrainerLightArmorFaction)
	npc.RemoveFromFaction(JobTrainerLockpickingFaction)
	npc.RemoveFromFaction(JobTrainerOneHandedFaction)
	npc.RemoveFromFaction(JobTrainerPickpocketFaction)
	npc.RemoveFromFaction(JobTrainerRestorationFaction)
	npc.RemoveFromFaction(JobTrainerSmithingFaction)
	npc.RemoveFromFaction(JobTrainerSneakFaction)
	npc.RemoveFromFaction(JobTrainerSpeechFaction)
	npc.RemoveFromFaction(JobTrainerTwoHandedFaction)
EndFunction

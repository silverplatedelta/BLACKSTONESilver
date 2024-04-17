/mob/living/carbon/human/species/dwarf/minion
	race = /datum/species/dwarf/minion

/datum/species/dwarf/minion
	name = "Minion"
	id = "minion"
	max_age = 200
	enflamed_icon = "widefire"
	hairyness = "t3"
	skinned_type = /obj/item/stack/sheet/animalhide/human
	custom_clothes = TRUE
	offset_features = list(OFFSET_ID = list(0,0), OFFSET_GLOVES = list(0,0), OFFSET_WRISTS = list(0,0),\
	OFFSET_CLOAK = list(0,0), OFFSET_FACEMASK = list(0,-4), OFFSET_HEAD = list(0,-4), \
	OFFSET_FACE = list(0,-4), OFFSET_BELT = list(0,-5), OFFSET_BACK = list(0,-4), \
	OFFSET_NECK = list(0,-4), OFFSET_MOUTH = list(0,-4), OFFSET_PANTS = list(0,0), \
	OFFSET_SHIRT = list(0,0), OFFSET_ARMOR = list(0,0), OFFSET_HANDS = list(0,-3), \
	OFFSET_ID_F = list(0,-4), OFFSET_GLOVES_F = list(0,-4), OFFSET_WRISTS_F = list(0,-4), OFFSET_HANDS_F = list(0,-4), \
	OFFSET_CLOAK_F = list(0,0), OFFSET_FACEMASK_F = list(0,-5), OFFSET_HEAD_F = list(0,-5), \
	OFFSET_FACE_F = list(0,-5), OFFSET_BELT_F = list(0,-5), OFFSET_BACK_F = list(0,-5), \
	OFFSET_NECK_F = list(0,-5), OFFSET_MOUTH_F = list(0,-5), OFFSET_PANTS_F = list(0,0), \
	OFFSET_SHIRT_F = list(0,0), OFFSET_ARMOR_F = list(0,0), OFFSET_UNDIES = list(0,0), OFFSET_UNDIES_F = list(0,0))
	soundpack_m = /datum/voicepack/male/dwarf
	soundpack_f = /datum/voicepack/female/dwarf
	limbs_icon_m = 'icons/roguetown/mob/bodies/m/minion.dmi'
	limbs_icon_f = 'icons/roguetown/mob/bodies/m/minion.dmi'
	dam_icon = 'icons/roguetown/mob/bodies/dam/dam_male.dmi'
	dam_icon_f = 'icons/roguetown/mob/bodies/dam/dam_female.dmi'
	default_color = "FFFFFF"
	default_features = list("mcolor" = "FFF", "wings" = "None")
	use_skintones = 1

/datum/species/dwarf/minion/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	..()
	RegisterSignal(C, COMSIG_MOB_SAY, .proc/handle_speech)
	C.remove_language(/datum/language/common)
	C.remove_language(/datum/language/dwarvish)
	C.grant_language(/datum/language/hellspeak/minion)

/datum/species/dwarf/minion/check_roundstart_eligible()
	return FALSE

/datum/species/dwarf/minion/after_creation(mob/living/carbon/C)
	..()
	C.grant_language(/datum/language/hellspeak/minion)
	to_chat(C, "<span class='info'>I can only speak the tounge of the damned now.</span>")

/datum/species/dwarf/on_species_loss(mob/living/carbon/C)
	. = ..()
	UnregisterSignal(C, COMSIG_MOB_SAY)
	C.remove_language(/datum/language/hellspeak/minion)
	C.grant_language(/datum/language/common)

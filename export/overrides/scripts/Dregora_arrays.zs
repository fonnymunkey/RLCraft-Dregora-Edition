#priority 1000

import crafttweaker.events.IEventManager;
import crafttweaker.event.BlockHarvestDropsEvent;
import crafttweaker.event.BlockBreakEvent;
import crafttweaker.event.IBlockEvent;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.block.IBlock;
import crafttweaker.item.IItemStack;
import crafttweaker.event.IEventCancelable;
import crafttweaker.event.IEventHasResult;
import crafttweaker.event.IEventPositionable;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.event.PlayerTickEvent;
import crafttweaker.entity.IEntity;
import crafttweaker.world.IBlockAccess;
import crafttweaker.world.IWorld;
import crafttweaker.block.IBlockProperties;
import crafttweaker.util.Position3f;
import crafttweaker.potions.IPotion;
import crafttweaker.potions.IPotionEffect;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.player.IPlayer;
import crafttweaker.event.EntityLivingDamageEvent;
import crafttweaker.event.ILivingEvent;
import crafttweaker.event.EntityLivingUpdateEvent;
import crafttweaker.command.ICommandManager;
import crafttweaker.command.ICommandSender;
import crafttweaker.event.EntityLivingDeathDropsEvent;
import crafttweaker.event.EntityLivingSpawnEvent;
import crafttweaker.event.EntityLivingExtendedSpawnEvent;
import crafttweaker.event.ProjectileImpactThrowableEvent;
import crafttweaker.event.EntityLivingUseItemEvent.All;
import crafttweaker.event.EntityLivingUseItemEvent.Finish;
import crafttweaker.tileentity.IMobSpawnerBaseLogic;
import crafttweaker.event.EntityLivingDeathEvent;
import crafttweaker.data.IData;
import crafttweaker.entity.IEntityEquipmentSlot;
import mods.ctintegration.baubles.IBaubleInventory;
import crafttweaker.entity.AttributeInstance;
import crafttweaker.world.IBiomeType;
import crafttweaker.world.IBiome;
import crafttweaker.block.IBlockDefinition;
import crafttweaker.event.ProjectileImpactArrowEvent;
import crafttweaker.potions.IPotionType;
import crafttweaker.event.PlayerRespawnEvent;
import crafttweaker.event.CommandEvent;
import crafttweaker.event.PlayerRightClickItemEvent;
import crafttweaker.entity.IEntityDefinition;
import crafttweaker.util.IAxisAlignedBB;
import crafttweaker.event.EntityLivingAttackedEvent;
import crafttweaker.damage.IDamageSource;
import crafttweaker.event.PlayerInteractEntityEvent;
import crafttweaker.util.Math;
import crafttweaker.event.PlayerCraftedEvent;
import crafttweaker.item.IItemTransformer;
import crafttweaker.world.IRayTraceResult;
import crafttweaker.event.EntityMountEvent;
import crafttweaker.event.PlayerSleepInBedEvent;
import mods.ctutils.world.World;
import crafttweaker.event.PlayerInteractBlockEvent;
import crafttweaker.event.LivingExperienceDropEvent;


global ParasiteBuffBiomes as string[] = [
  "Lair of the Thing",
  "Nuclear Ruins",
  "Ruins of Blight"
];

global RandomLightningMessageArray as string[] = [
  "Zzzrrt zzzap zskrt",
  "You feel a tingling sensation...",
  "What's that crackling sound...?",
  "Your hair suddenly stands on end",
  "Brrzzz kerack zrpp zrrrktttt",
  "Bliksement blawargh zrrrktt",
  "Did you know the chance of getting hit by lightning is 1 in 1,222,000?",
  "There's a hint of ozone in the air..."
];

global ArrowArrayLong as IItemStack[] = [
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:long_klutz"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:long_weight"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:long_broken_armor"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:long_spin"}),
	<minecraft:tipped_arrow>.withTag({Potion: "quark:long_mining_fatigue"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:long_magic_inhibition"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:long_drown"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:long_vulnerable"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:long_rust"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:long_perplexity"}),
	<minecraft:tipped_arrow>.withTag({Potion: "minecraft:long_slowness"}),
	<minecraft:tipped_arrow>.withTag({Potion: "mujmajnkraftsbettersurvival:long_antiwarp"}),
	<minecraft:tipped_arrow>.withTag({Potion: "mujmajnkraftsbettersurvival:long_decay"}),
	<minecraft:tipped_arrow>.withTag({Potion: "mujmajnkraftsbettersurvival:long_blindness"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:long_blindness"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:long_nausea"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:long_levitation"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:long_hunger"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:long_wither"}),
	<minecraft:tipped_arrow>.withTag({Potion: "elenaidodge:long_sluggish"}),
	<minecraft:tipped_arrow>.withTag({Potion: "minecraft:long_poison"}),
	<minecraft:tipped_arrow>.withTag({Potion: "minecraft:long_weakness"}),
	<minecraft:tipped_arrow>.withTag({Potion: "elenaidodge:long_feeble"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:long_broken_magic_shield"})
	];

global ArrowArray as IItemStack[] = [
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:strong_broken_armor"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:broken_armor"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:strong_klutz"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:klutz"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:dispel"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:strong_launch"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:launch"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:spin"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:strong_spin"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:curse"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:strong_curse"}),
	<minecraft:tipped_arrow>.withTag({Potion: "quark:mining_fatigue"}),
	<minecraft:tipped_arrow>.withTag({Potion: "quark:strong_mining_fatigue"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:disorganization"}),
	<minecraft:tipped_arrow>.withTag({Potion: "srparasites:foster"}),
	<minecraft:tipped_arrow>.withTag({Potion: "srparasites:coth"}),
	<minecraft:tipped_arrow>.withTag({Potion: "srparasites:fear"}),
	<minecraft:tipped_arrow>.withTag({Potion: "srparasites:res"}),
	<minecraft:tipped_arrow>.withTag({Potion: "srparasites:corro"}),
	<minecraft:tipped_arrow>.withTag({Potion: "srparasites:vira"}),
	<minecraft:tipped_arrow>.withTag({Potion: "srparasites:rage"}),
	<minecraft:tipped_arrow>.withTag({Potion: "srparasites:debar"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:magic_inhibition"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:weight"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:lightning"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:strong_explode"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:teleport"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:strong_teleport"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:teleport_surface"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:drown"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:teleport_spawn"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:strong_vulnerable"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:vulnerable"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:strong_rust"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:rust"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:perplexity"}),
	<minecraft:tipped_arrow>.withTag({Potion: "minecraft:slowness"}),
	<minecraft:tipped_arrow>.withTag({Potion: "mujmajnkraftsbettersurvival:milk"}),
	<minecraft:tipped_arrow>.withTag({Potion: "mujmajnkraftsbettersurvival:antiwarp"}),
	<minecraft:tipped_arrow>.withTag({Potion: "mujmajnkraftsbettersurvival:strong_decay"}),
	<minecraft:tipped_arrow>.withTag({Potion: "mujmajnkraftsbettersurvival:decay"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:nausea"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:levitation"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:strong_levitation"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:unluck"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:strong_hunger"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:hunger"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:strong_wither"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:wither"}),
	<minecraft:tipped_arrow>.withTag({Potion: "elenaidodge:sluggish"}),
	<minecraft:tipped_arrow>.withTag({Potion: "elenaidodge:strong_feeble"}),
	<minecraft:tipped_arrow>.withTag({Potion: "minecraft:harming"}),
	<minecraft:tipped_arrow>.withTag({Potion: "minecraft:strong_harming"}),
	<minecraft:tipped_arrow>.withTag({Potion: "minecraft:poison"}),
	<minecraft:tipped_arrow>.withTag({Potion: "minecraft:strong_poison"}),
	<minecraft:tipped_arrow>.withTag({Potion: "mujmajnkraftsbettersurvival:blindness"}),
	<minecraft:tipped_arrow>.withTag({Potion: "elenaidodge:feeble"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:strong_magic_inhibition"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:strong_weight"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:fire"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:invert"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:broken_magic_shield"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:strong_broken_magic_shield"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:strong_blindness"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:blindness"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:explode"}),
	<minecraft:tipped_arrow>.withTag({Potion: "xat:extended_goblin"}),
	<minecraft:tipped_arrow>.withTag({Potion: "xat:goblin"})
	];

global MentalPotions as IPotion[] = [
    <potion:lycanitesmobs:paralysis>,
    <potion:lycanitesmobs:insomnia>,
    <potion:lycanitesmobs:fear>,
    <potion:potioncore:klutz>,
    <potion:rustic:tipsy>,
    <potion:minecraft:nausea>,
    <potion:elenaidodge:sluggish>,
    <potion:potioncore:spin>,
    <potion:minecraft:mining_fatigue>,
    <potion:lycanitesmobs:aphagia>,
    <potion:minecraft:blindness>,
    <potion:minecraft:unluck>,
    <potion:srparasites:fear>,
    <potion:potioncore:disorganization>
    ];

global SussyPotions as IPotion[] = [
    <potion:potioncore:lightning>,
    <potion:potioncore:explode>,
    <potion:potioncore:launch>,
    <potion:potioncore:explode>,
    <potion:potioncore:launch>,
    <potion:potioncore:explode>,
    <potion:potioncore:launch>,
    <potion:potioncore:explode>,
    <potion:potioncore:launch>,
    <potion:potioncore:explode>,
    <potion:potioncore:launch>,
    <potion:potioncore:explode>,
    <potion:potioncore:launch>
	];

global BlackListEntitiesNameChangeVillager as string[] = [
    "Mentalberian",
    "Sussyberian"
	];

global BlackListEntitiesNameChangeAny as string[] = [
    "Dismounting",
    "Dismounter",
    "Dispel",
    "Sarevok",
    "Jester"
	];

global BlackListEntitiesNameChangePlayerbosses as string[] = [
    "Blighted Shivaxi"
	];

global BlackListEntitiesNameChangeParasite as string[] = [
    "Sentient Horror",
    "Degrading Overseer",
    "Malformed Observer",
    "Shivaxi",
    "Corrupted Carrier",
    "Necrotic Blight"
	];

global Mod_LavacowParasites as string[] = [
    "minecraft:zombie",
    "minecraft:husk",
    "mod_lavacow:zombiefrozen",
    "mod_lavacow:zombiemushroom",
    "mod_lavacow:unburied",
    "mod_lavacow:mummy"
    ];

global conductivity_1 as IItemStack[] = [
    <mujmajnkraftsbettersurvival:itemironspear>,
    <mujmajnkraftsbettersurvival:itemirondagger>,
    <mujmajnkraftsbettersurvival:itemironbattleaxe>,
    <mujmajnkraftsbettersurvival:itemironnunchaku>,
    <mujmajnkraftsbettersurvival:itemsteelhammer>,
    <mujmajnkraftsbettersurvival:itemsteelspear>,
    <mujmajnkraftsbettersurvival:itemsteeldagger>,
    <mujmajnkraftsbettersurvival:itemsteelbattleaxe>,
    <mujmajnkraftsbettersurvival:itemsteelnunchaku>,
    <minecraft:iron_shovel>,
    <minecraft:iron_pickaxe>,
    <minecraft:iron_axe>,
    <minecraft:flint_and_steel>,
    <minecraft:iron_sword>,
    <minecraft:iron_hoe>,
    <minecraft:chainmail_helmet>,
    <minecraft:chainmail_chestplate>,
    <minecraft:chainmail_leggings>,
    <minecraft:chainmail_boots>,
    <minecraft:iron_helmet>,
    <minecraft:iron_chestplate>,
    <minecraft:iron_leggings>,
    <minecraft:iron_boots>,
    <minecraft:bucket>,
    <minecraft:water_bucket>,
    <minecraft:lava_bucket>,
    <minecraft:milk_bucket>,
    <minecraft:compass>,
    <minecraft:shears>,
    <minecraft:shield>,
    <mujmajnkraftsbettersurvival:itemcrossbow>,
    <mujmajnkraftsbettersurvival:itemsmallshield>,
    <mujmajnkraftsbettersurvival:itembigshield>,
    <mujmajnkraftsbettersurvival:itemironhammer>,
    <charm:iron_lantern>,
    <forge:bucketfilled>,
    <fishingmadebetter:fishing_rod_iron>,
    <fishingmadebetter:fillet_knife_iron>,
    <fishingmadebetter:scaling_knife_iron>,
    <fishingmadebetter:fish_tracker_iron>,
    <forgottenitems:bound_pickaxe>,
    <forgottenitems:bound_axe>,
    <forgottenitems:bound_shovel>,
    <grapplemod:grapplinghook>,
    <iceandfire:dread_sword>,
    <iceandfire:dread_knight_sword>,
    <iceandfire:troll_weapon.axe>,
    <iceandfire:troll_weapon.hammer>,
    <locks:iron_lock_pick>,
    <locks:steel_lock_pick>,
    <notreepunching:knife/iron>,
    <notreepunching:mattock/iron>,
    <notreepunching:saw/iron>,
    <rlmixins:steel_helmet>,
    <rlmixins:steel_chestplate>,
    <rlmixins:steel_leggings>,
    <rlmixins:steel_boots>,
    <rustic:candle>,
    <rustic:candle_lever>,
    <rustic:iron_lantern>,
    <simpledifficulty:iron_canteen>,
    <spartanshields:shield_basic_iron>,
    <spartanshields:shield_tower_iron>,
    <spartanshields:shield_basic_steel>,
    <spartanshields:shield_tower_steel>,
    <spartanweaponry:dagger_iron>,
    <spartanweaponry:longsword_iron>,
    <spartanweaponry:katana_iron>,
    <spartanweaponry:scythe_iron>,
    <spartanweaponry:saber_iron>,
    <spartanweaponry:rapier_iron>,
    <spartanweaponry:greatsword_iron>,
    <spartanweaponry:caestus_studded>,
    <spartanweaponry:hammer_iron>,
    <spartanweaponry:warhammer_iron>,
    <spartanweaponry:spear_iron>,
    <spartanweaponry:halberd_iron>,
    <spartanweaponry:throwing_knife_steel>,
    <spartanweaponry:throwing_axe_steel>,
    <spartanweaponry:javelin_steel>,
    <spartanweaponry:boomerang_steel>,
    <spartanweaponry:battleaxe_steel>,
    <spartanweaponry:mace_steel>,
    <spartanweaponry:glaive_steel>,
    <spartanweaponry:staff_steel>,
    <switchbow:switchcrossbow>,
    <spartanweaponry:pike_iron>,
    <spartanweaponry:lance_iron>,
    <spartanweaponry:longbow_iron>,
    <spartanweaponry:crossbow_iron>,
    <spartanweaponry:throwing_knife_iron>,
    <spartanweaponry:throwing_axe_iron>,
    <spartanweaponry:javelin_iron>,
    <spartanweaponry:boomerang_iron>,
    <spartanweaponry:battleaxe_iron>,
    <spartanweaponry:mace_iron>,
    <spartanweaponry:glaive_iron>,
    <spartanweaponry:staff_iron>,
    <spartanweaponry:dagger_steel>,
    <spartanweaponry:longsword_steel>,
    <spartanweaponry:katana_steel>,
    <spartanweaponry:scythe_steel>,
    <spartanweaponry:saber_steel>,
    <spartanweaponry:rapier_steel>,
    <spartanweaponry:greatsword_steel>,
    <spartanweaponry:hammer_steel>,
    <spartanweaponry:warhammer_steel>,
    <spartanweaponry:spear_steel>,
    <spartanweaponry:halberd_steel>,
    <spartanweaponry:pike_steel>,
    <spartanweaponry:lance_steel>,
    <spartanweaponry:longbow_steel>,
    <spartanweaponry:crossbow_steel>,
    <variedcommodities:hammer>,
    <variedcommodities:lead_pipe>,
    <variedcommodities:crowbar>,
    <variedcommodities:pipe_wrench>,
    <variedcommodities:wrench>,
    <variedcommodities:candle>,
    <variedcommodities:lamp>,
    <variedcommodities:chain_skirt>,
    <variedcommodities:iron_skirt>
];

global conductivity_2 as IItemStack[] = [
    <spartanweaponry:mace_bronze>,
    <spartanweaponry:glaive_bronze>,
    <spartanweaponry:staff_bronze>,
    <variedcommodities:bronze_sword>,
    <mujmajnkraftsbettersurvival:itembronzehammer>,
    <mujmajnkraftsbettersurvival:itembronzespear>,
    <mujmajnkraftsbettersurvival:itembronzedagger>,
    <mujmajnkraftsbettersurvival:itembronzebattleaxe>,
    <mujmajnkraftsbettersurvival:itembronzenunchaku>,
    <spartanshields:shield_basic_bronze>,
    <spartanshields:shield_tower_bronze>,
    <spartanweaponry:dagger_bronze>,
    <spartanweaponry:longsword_bronze>,
    <spartanweaponry:katana_bronze>,
    <spartanweaponry:scythe_bronze>,
    <spartanweaponry:saber_bronze>,
    <spartanweaponry:rapier_bronze>,
    <spartanweaponry:greatsword_bronze>,
    <spartanweaponry:hammer_bronze>,
    <spartanweaponry:warhammer_bronze>,
    <spartanweaponry:spear_bronze>,
    <spartanweaponry:halberd_bronze>,
    <spartanweaponry:pike_bronze>,
    <spartanweaponry:lance_bronze>,
    <spartanweaponry:longbow_bronze>,
    <spartanweaponry:crossbow_bronze>,
    <spartanweaponry:throwing_knife_bronze>,
    <spartanweaponry:throwing_axe_bronze>,
    <spartanweaponry:javelin_bronze>,
    <spartanweaponry:boomerang_bronze>,
    <spartanweaponry:battleaxe_bronze>
];

global conductivity_3 as IItemStack[] = [

    <spartanweaponry:longsword_gold>,
    <spartanweaponry:katana_gold>,
    <spartanweaponry:scythe_gold>,
    <spartanweaponry:saber_gold>,
    <spartanweaponry:rapier_gold>,
    <spartanweaponry:greatsword_gold>,
    <spartanweaponry:hammer_gold>,
    <spartanweaponry:warhammer_gold>,
    <spartanweaponry:spear_gold>,
    <minecraft:golden_sword>,
    <minecraft:golden_shovel>,
    <minecraft:golden_pickaxe>,
    <minecraft:golden_axe>,
    <minecraft:golden_hoe>,
    <minecraft:golden_helmet>,
    <minecraft:golden_chestplate>,
    <minecraft:golden_leggings>,
    <minecraft:golden_boots>,
    <mujmajnkraftsbettersurvival:itemgoldhammer>,
    <mujmajnkraftsbettersurvival:itemgoldspear>,
    <mujmajnkraftsbettersurvival:itemgolddagger>,
    <mujmajnkraftsbettersurvival:itemgoldbattleaxe>,
    <mujmajnkraftsbettersurvival:itemgoldnunchaku>,
    <bountifulbaubles:crowngold>,
    <charm:gold_lantern>,
    <fishingmadebetter:fish_tracker_gold>,
    <locks:gold_lock_pick>,
    <notreepunching:knife/gold>,
    <notreepunching:mattock/gold>,
    <notreepunching:saw/gold>,
    <rustic:candle_gold>,
    <rustic:candle_lever_gold>,
    <rustic:golden_lantern>,
    <spartanshields:shield_basic_gold>,
    <spartanshields:shield_tower_gold>,
    <spartanweaponry:dagger_gold>,
    <spartanweaponry:halberd_gold>,
    <spartanweaponry:pike_gold>,
    <spartanweaponry:throwing_knife_gold>,
    <spartanweaponry:throwing_axe_gold>,
    <spartanweaponry:javelin_gold>,
    <spartanweaponry:boomerang_gold>,
    <spartanweaponry:battleaxe_gold>,
    <spartanweaponry:mace_gold>,
    <spartanweaponry:glaive_gold>,
    <spartanweaponry:staff_gold>,
    <variedcommodities:golden_skirt>,
    <forgottenitems:hasty_pickaxe>,
    <betternether:cincinnasite_pickaxe_diamond>,
    <betternether:cincinnasite_pickaxe>,
    <lycanitesmobs:sturdysummoningstaff>,
    <variedcommodities:holyhandgrenade>,
    <variedcommodities:pendant>,
    <lycanitesmobs:stablesummoningstaff>,
    <lycanitesmobs:savagesummoningstaff>,
    <mod_lavacow:holy_grenade>,
    <mod_lavacow:kings_crown>,
    <minecraft:clock>,
    <inspirations:redstone_charger>,
    <trumpetskeleton:trumpet>,
    <mod_lavacow:skeletonking_crown>,
    <mod_lavacow:kings_crown:1>,
    <lycanitesmobs:summoningstaff>,
    <betternether:cincinnasite_axe>,
    <locks:master_key>,
    <lycanitesmobs:bloodsummoningstaff>,
    <locks:key>,
    <armorunder:liner_snips>,
    <betternether:cincinnasite_axe_diamond>

];

global conductivity_4 as IItemStack[] = [
    <spartanweaponry:pike_copper>,
    <spartanweaponry:lance_copper>,
    <spartanweaponry:longbow_copper>,
    <spartanweaponry:crossbow_copper>,
    <spartanweaponry:throwing_knife_copper>,
    <spartanweaponry:throwing_axe_copper>,
    <spartanweaponry:javelin_copper>,
    <spartanweaponry:boomerang_copper>,
    <spartanweaponry:battleaxe_copper>,
    <mujmajnkraftsbettersurvival:itemcopperhammer>,
    <mujmajnkraftsbettersurvival:itemcopperspear>,
    <mujmajnkraftsbettersurvival:itemcopperdagger>,
    <mujmajnkraftsbettersurvival:itemcopperbattleaxe>,
    <mujmajnkraftsbettersurvival:itemcoppernunchaku>,
    <iceandfire:armor_copper_metal_helmet>,
    <iceandfire:armor_copper_metal_chestplate>,
    <iceandfire:armor_copper_metal_leggings>,
    <iceandfire:armor_copper_metal_boots>,
    <iceandfire:copper_sword>,
    <iceandfire:copper_shovel>,
    <iceandfire:copper_pickaxe>,
    <iceandfire:copper_axe>,
    <iceandfire:copper_hoe>,
    <spartanshields:shield_basic_copper>,
    <spartanshields:shield_tower_copper>,
    <spartanweaponry:dagger_copper>,
    <spartanweaponry:longsword_copper>,
    <spartanweaponry:scythe_copper>,
    <spartanweaponry:saber_copper>,
    <spartanweaponry:rapier_copper>,
    <spartanweaponry:greatsword_copper>,
    <spartanweaponry:hammer_copper>,
    <spartanweaponry:warhammer_copper>,
    <spartanweaponry:spear_copper>,
    <spartanweaponry:halberd_copper>,
    <spartanweaponry:katana_copper>,
    <spartanweaponry:mace_copper>,
    <spartanweaponry:glaive_copper>,
    <spartanweaponry:staff_copper>
];

global conductivity_5 as IItemStack[] = [
    <spartanweaponry:halberd_silver>,
    <spartanweaponry:pike_silver>,
    <spartanweaponry:lance_silver>,
    <spartanweaponry:longbow_silver>,
    <spartanweaponry:crossbow_silver>,
    <spartanweaponry:throwing_knife_silver>,
    <spartanweaponry:throwing_axe_silver>,
    <spartanweaponry:javelin_silver>,
    <spartanweaponry:boomerang_silver>,
    <mujmajnkraftsbettersurvival:itemsilverhammer>,
    <mujmajnkraftsbettersurvival:itemsilverspear>,
    <mujmajnkraftsbettersurvival:itemsilverdagger>,
    <mujmajnkraftsbettersurvival:itemsilverbattleaxe>,
    <mujmajnkraftsbettersurvival:itemsilvernunchaku>,
    <iceandfire:armor_silver_metal_helmet>,
    <iceandfire:armor_silver_metal_chestplate>,
    <iceandfire:armor_silver_metal_leggings>,
    <iceandfire:armor_silver_metal_boots>,
    <iceandfire:silver_sword>,
    <iceandfire:silver_shovel>,
    <iceandfire:silver_pickaxe>,
    <iceandfire:silver_axe>,
    <iceandfire:silver_hoe>,
    <rustic:silver_lantern>,
    <spartanshields:shield_basic_silver>,
    <spartanshields:shield_tower_silver>,
    <spartanweaponry:dagger_silver>,
    <spartanweaponry:longsword_silver>,
    <spartanweaponry:katana_silver>,
    <spartanweaponry:scythe_silver>,
    <spartanweaponry:saber_silver>,
    <spartanweaponry:rapier_silver>,
    <spartanweaponry:greatsword_silver>,
    <spartanweaponry:hammer_silver>,
    <spartanweaponry:warhammer_silver>,
    <spartanweaponry:spear_silver>,
    <spartanweaponry:battleaxe_silver>,
    <spartanweaponry:mace_silver>,
    <spartanweaponry:glaive_silver>,
    <spartanweaponry:staff_silver>,
    <rustic:candle_silver>,
    <rustic:candle_lever_silver>
];

global conductivity_10 as IItemStack[] = [
    <charm:charged_emerald>,
    <aquaculture:fish:21>,
    <advanced-fishing:fish:18>
];
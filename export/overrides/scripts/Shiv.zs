import crafttweaker.item.IItemStack;
import loottweaker.LootTweaker;
import loottweaker.vanilla.loot.LootTable;
import loottweaker.vanilla.loot.LootPool;

print("Script starting!");

var mobspawner as IItemStack = <minecraft:mob_spawner>;
mobspawner.hardness = 15;

//var bountyboard as IItemStack = <bountiful:bountyboarditem>;
//bountyboard.hardness = 9999;

val skelly = LootTweaker.getTable("minecraft:entities/skeleton");
val wut = skelly.addPool("wut", 0, 1, 0, 0);
wut.addItemEntry(<minecraft:skull>, 1);
wut.addItemEntry(<minecraft:bone>, 24);

val zomboy = LootTweaker.getTable("minecraft:entities/zombie");
val lul = zomboy.addPool("lul", 0, 1, 0, 0);
lul.addItemEntry(<minecraft:skull:2>, 1);
lul.addItemEntry(<minecraft:rotten_flesh>, 24);

val creepy = LootTweaker.getTable("minecraft:entities/creeper");
val yep = creepy.addPool("yep", 0, 1, 0, 0);
yep.addItemEntry(<minecraft:skull:4>, 1);
yep.addItemEntry(<minecraft:gunpowder>, 24);

val shivdrop = LootTweaker.getTable("playerbosses:entity/player_boss");
val mkey = shivdrop.addPool("mkey", 1, 1, 0, 0);
mkey.addItemEntry(<locks:master_key>, 1);

events.onPlayerTick(function(event as crafttweaker.event.PlayerTickEvent) {
  var player = event.player;
  var potionToRemove = <potion:minecraft:jump_boost>;
  var maxAmplifierAllowed = 200;
  if player.isPotionActive(potionToRemove) {
    var active = player.getActivePotionEffect(potionToRemove);
    if active.amplifier > maxAmplifierAllowed {
      player.removePotionEffect(potionToRemove);
      player.addPotionEffect(<potion:lycanitesmobs:paralysis>.makePotionEffect(active.duration, 0));
    }
  }
});

events.onPlayerTick(function(event as crafttweaker.event.PlayerTickEvent) {
  var player = event.player;
  var potionToRemove = <potion:minecraft:resistance>;
  var maxAmplifierAllowed = 10;
  if player.isPotionActive(potionToRemove) {
    var active = player.getActivePotionEffect(potionToRemove);
    if active.amplifier > maxAmplifierAllowed {
      player.removePotionEffect(potionToRemove);
      player.addPotionEffect(<potion:minecraft:resistance>.makePotionEffect(active.duration, 0));
    }
  }
});

<rustic:chili_pepper_seeds>.addTooltip("Fertile Seasons:");
<rustic:chili_pepper_seeds>.addTooltip(format.yellow(" Summer"));
<rustic:tomato_seeds>.addTooltip("Fertile Seasons:");
<rustic:tomato_seeds>.addTooltip(format.yellow(" Summer"));
<rustic:tomato_seeds>.addTooltip(format.gold(" Autumn"));

<minecraft:fishing_rod:*>.displayName = "Ancient Fishing Rod";
<minecraft:fishing_rod:*>.addTooltip(format.darkRed("Only used for crafting!"));
<advanced-fishing:blazing_fishing_pole:*>.displayName = "Ancient Lava Fishing Rod";
<advanced-fishing:blazing_fishing_pole:*>.addTooltip(format.darkRed("Only used for crafting!"));
<iceandfire:fishing_spear:*>.displayName = "Ancient Fishing Spear";
<iceandfire:fishing_spear:*>.addTooltip(format.darkRed("Only used for crafting!"));

<simpledifficulty:heater>.displayName = "Heating Coil";
<simpledifficulty:chiller>.displayName = "Cooling Coil";
<simpledifficulty:wool_helmet:*>.displayName = "Wool Hood";
<simpledifficulty:wool_chestplate:*>.displayName = "Wool Coat";
<simpledifficulty:wool_leggings:*>.displayName = "Wool Leggings";
<simpledifficulty:wool_boots:*>.displayName = "Wool Boots";

<armorunder:auto_chestplate_liner>.addTooltip(format.darkRed(" Destroyed upon removal!"));
<armorunder:auto_leggings_liner>.addTooltip(format.darkRed(" Destroyed upon removal!"));

<notreepunching:rock/basalt>.displayName = "Basalt Rock";
<notreepunching:cobblestone/basalt>.displayName = "Basalt Cobblestone";

<betternether:bone_block>.displayName = "Smooth Bone Block";

<bountifulbaubles:reforger>.displayName = "Baubles Reforging Station";

<minecraft:fish:0>.displayName = "River Fish";
<minecraft:fish:1>.displayName = "Mountain Fish";
<minecraft:fish:2>.displayName = "Tropical Fish";
<minecraft:fish:3>.displayName = "Ocean Fish";
<minecraft:cooked_fish:0>.displayName = "Cooked River Fish";
<minecraft:cooked_fish:1>.displayName = "Cooked Mountain Fish";

<quark:ancient_tome:*>.addTooltip(format.gold("Use in off-hand to apply to matching enchanted item"));

<rlmixins:cleansing_talisman>.addTooltip(format.gold("Craft with any enchanted book to convert the book's enchantment to Curse Break"));

<bountifulbaubles:ringiron>.displayName = "Holy Ring";
<bountifulbaubles:amuletsinwrath>.addTooltip(format.darkPurple("A trophy lost to time, reminiscent of another world."));

//<locks:wood_lock>.addTooltip(format.green("Blast Resistance: Weak"));
//<locks:iron_lock>.addTooltip(format.green("Blast Resistance: Average"));
//<locks:gold_lock>.addTooltip(format.green("Blast Resistance: Weak"));
//<locks:steel_lock>.addTooltip(format.green("Blast Resistance: Strong"));
//<locks:diamond_lock>.addTooltip(format.green("Blast Resistance: Supreme"));

<variedcommodities:heart>.displayName = "Demonic Heart";
<variedcommodities:heart>.addTooltip(format.green("One of many hearts dropped by Rahovart, still beating with demonic energy."));
<variedcommodities:skull>.displayName = "Corrupted Skull";
<variedcommodities:skull>.addTooltip(format.green("One of many skulls dropped by Asmodeus, the lost souls inside can still be heard screaming."));

<minecraft:saddle>.displayName = "Basic Saddle";

//stupid dupe bug lmaoooooooooooooooooo

recipes.remove(<minecraft:coal_ore>);
recipes.remove(<minecraft:iron_ore>);
recipes.remove(<minecraft:gold_ore>);
recipes.remove(<minecraft:diamond_ore>);
recipes.remove(<minecraft:emerald_ore>);
recipes.remove(<minecraft:redstone_ore>);
recipes.remove(<minecraft:lapis_ore>);
recipes.removeByRecipeName("minecraft:stone_brick_slab");
recipes.removeByRecipeName("minecraft:stone_brick_stairs");

recipes.remove(<variedcommodities:diamond_gun>);
recipes.remove(<variedcommodities:emerald_gun>);
recipes.remove(<variedcommodities:iron_gun>);
recipes.remove(<variedcommodities:golden_gun>);
recipes.remove(<variedcommodities:stone_gun>);
recipes.remove(<variedcommodities:wooden_gun>);
recipes.remove(<variedcommodities:bronze_gun>);
recipes.remove(<variedcommodities:diamond_trident>);
recipes.remove(<variedcommodities:emerald_trident>);
recipes.remove(<variedcommodities:iron_trident>);
recipes.remove(<variedcommodities:golden_trident>);
recipes.remove(<variedcommodities:stone_trident>);
recipes.remove(<variedcommodities:wooden_trident>);
recipes.remove(<variedcommodities:frost_trident>);
recipes.remove(<variedcommodities:bronze_trident>);
recipes.remove(<variedcommodities:diamond_glaive>);
recipes.remove(<variedcommodities:emerald_glaive>);
recipes.remove(<variedcommodities:iron_glaive>);
recipes.remove(<variedcommodities:golden_glaive>);
recipes.remove(<variedcommodities:stone_glaive>);
recipes.remove(<variedcommodities:wooden_glaive>);
recipes.remove(<variedcommodities:frost_glaive>);
recipes.remove(<variedcommodities:bronze_glaive>);
recipes.remove(<variedcommodities:diamond_spear>);
recipes.remove(<variedcommodities:emerald_spear>);
recipes.remove(<variedcommodities:iron_spear>);
recipes.remove(<variedcommodities:golden_spear>);
recipes.remove(<variedcommodities:stone_spear>);
recipes.remove(<variedcommodities:wooden_spear>);
recipes.remove(<variedcommodities:frost_spear>);
recipes.remove(<variedcommodities:bronze_spear>);
recipes.remove(<variedcommodities:diamond_broadsword>);
recipes.remove(<variedcommodities:emerald_broadsword>);
recipes.remove(<variedcommodities:iron_broadsword>);
recipes.remove(<variedcommodities:golden_broadsword>);
recipes.remove(<variedcommodities:stone_broadsword>);
recipes.remove(<variedcommodities:wooden_broadsword>);
recipes.remove(<variedcommodities:frost_broadsword>);
recipes.remove(<variedcommodities:bronze_broadsword>);
recipes.remove(<variedcommodities:diamond_scythe>);
recipes.remove(<variedcommodities:emerald_scythe>);
recipes.remove(<variedcommodities:iron_scythe>);
recipes.remove(<variedcommodities:golden_scythe>);
recipes.remove(<variedcommodities:stone_scythe>);
recipes.remove(<variedcommodities:wooden_scythe>);
recipes.remove(<variedcommodities:frost_scythe>);
recipes.remove(<variedcommodities:bronze_scythe>);
recipes.remove(<variedcommodities:diamond_warhammer>);
recipes.remove(<variedcommodities:emerald_warhammer>);
recipes.remove(<variedcommodities:iron_warhammer>);
recipes.remove(<variedcommodities:golden_warhammer>);
recipes.remove(<variedcommodities:stone_warhammer>);
recipes.remove(<variedcommodities:wooden_warhammer>);
recipes.remove(<variedcommodities:frost_warhammer>);
recipes.remove(<variedcommodities:bronze_warhammer>);
recipes.remove(<variedcommodities:diamond_halberd>);
recipes.remove(<variedcommodities:emerald_halberd>);
recipes.remove(<variedcommodities:iron_halberd>);
recipes.remove(<variedcommodities:golden_halberd>);
recipes.remove(<variedcommodities:stone_halberd>);
recipes.remove(<variedcommodities:wooden_halberd>);
recipes.remove(<variedcommodities:frost_halberd>);
recipes.remove(<variedcommodities:bronze_halberd>);
recipes.remove(<variedcommodities:diamond_battleaxe>);
recipes.remove(<variedcommodities:emerald_battleaxe>);
recipes.remove(<variedcommodities:iron_battleaxe>);
recipes.remove(<variedcommodities:golden_battleaxe>);
recipes.remove(<variedcommodities:stone_battleaxe>);
recipes.remove(<variedcommodities:wooden_battleaxe>);
recipes.remove(<variedcommodities:frost_battleaxe>);
recipes.remove(<variedcommodities:bronze_battleaxe>);
recipes.remove(<variedcommodities:diamond_shield>);
recipes.remove(<variedcommodities:emerald_shield>);
recipes.remove(<variedcommodities:iron_shield>);
recipes.remove(<variedcommodities:golden_shield>);
recipes.remove(<variedcommodities:stone_shield>);
recipes.remove(<variedcommodities:wooden_shield>);
recipes.remove(<variedcommodities:frost_shield>);
recipes.remove(<variedcommodities:bronze_shield>);
recipes.remove(<variedcommodities:diamond_shield_round>);
recipes.remove(<variedcommodities:emerald_shield_round>);
recipes.remove(<variedcommodities:iron_shield_round>);
recipes.remove(<variedcommodities:golden_shield_round>);
recipes.remove(<variedcommodities:stone_shield_round>);
recipes.remove(<variedcommodities:wooden_shield_round>);
recipes.remove(<variedcommodities:bronze_shield_round>);
recipes.remove(<variedcommodities:diamond_skirt>);
recipes.remove(<variedcommodities:emerald_skirt>);
recipes.remove(<variedcommodities:iron_skirt>);
recipes.remove(<variedcommodities:golden_skirt>);
recipes.remove(<variedcommodities:leather_skirt>);
recipes.remove(<variedcommodities:bronze_skirt>);
recipes.remove(<variedcommodities:full_diamond_head>);
recipes.remove(<variedcommodities:full_emerald_head>);
recipes.remove(<variedcommodities:full_iron_head>);
recipes.remove(<variedcommodities:full_golden_head>);
recipes.remove(<variedcommodities:full_leather_head>);
recipes.remove(<variedcommodities:full_wooden_head>);
recipes.remove(<variedcommodities:full_diamond_chest>);
recipes.remove(<variedcommodities:full_emerald_chest>);
recipes.remove(<variedcommodities:full_iron_chest>);
recipes.remove(<variedcommodities:full_golden_chest>);
recipes.remove(<variedcommodities:full_leather_chest>);
recipes.remove(<variedcommodities:full_wooden_chest>);
recipes.remove(<variedcommodities:full_emerald_legs>);
recipes.remove(<variedcommodities:full_wooden_legs>);
recipes.remove(<variedcommodities:full_emerald_boots>);
recipes.remove(<variedcommodities:full_wooden_boots>);
recipes.remove(<variedcommodities:full_bronze_head>);
recipes.remove(<variedcommodities:full_bronze_chest>);
recipes.remove(<variedcommodities:full_bronze_legs>);
recipes.remove(<variedcommodities:full_bronze_boots>);
recipes.remove(<variedcommodities:diamond_dagger>);
recipes.remove(<variedcommodities:emerald_dagger>);
recipes.remove(<variedcommodities:iron_dagger>);
recipes.remove(<variedcommodities:golden_dagger>);
recipes.remove(<variedcommodities:stone_dagger>);
recipes.remove(<variedcommodities:wooden_dagger>);
recipes.remove(<variedcommodities:frost_dagger>);
recipes.remove(<variedcommodities:bronze_dagger>);
recipes.remove(<variedcommodities:bullet>);
recipes.remove(<variedcommodities:frost_sword>);
recipes.remove(<variedcommodities:emerald_sword>);
recipes.remove(<variedcommodities:mana>);
recipes.remove(<variedcommodities:candle>);
recipes.remove(<variedcommodities:holyhandgrenade>);

recipes.remove(<elenaidodge:golden_feather>);
recipes.remove(<elenaidodge:iron_feather>);

recipes.remove(<qualitytools:emerald_ring>);
recipes.remove(<qualitytools:emerald_amulet>);
recipes.remove(<antiqueatlas:empty_antique_atlas>);
recipes.remove(<waystones:waystone>);
recipes.remove(<waystones:warp_stone>);
recipes.remove(<firstaid:plaster>);
recipes.remove(<firstaid:bandage>);
recipes.remove(<roughtweaks:salve>);
recipes.remove(<roughtweaks:plaster>);
recipes.remove(<roughtweaks:bandage>);

recipes.remove(<xat:weightless_stone>);
recipes.remove(<xat:fairy_ring>);
recipes.remove(<xat:dwarf_ring>);
recipes.remove(<xat:titan_ring>);
recipes.remove(<xat:goblin_ring>);
recipes.remove(<xat:elf_ring>);
recipes.remove(<xat:faelis_ring>);
recipes.remove(<xat:dragon_ring>);
recipes.remove(<xat:fairy_dew>);
recipes.remove(<xat:dwarf_stout>);
recipes.remove(<xat:titan_spirit>);
recipes.remove(<xat:goblin_soup>);
recipes.remove(<xat:elf_sap>);
recipes.remove(<xat:faelis_food>);
recipes.remove(<xat:dragon_gem>);
recipes.remove(<xat:inertia_null_stone>);
recipes.remove(<xat:greater_inertia_stone>);
recipes.remove(<xat:damage_shield>);
recipes.remove(<xat:wither_ring>);
recipes.remove(<xat:glow_ring>);
recipes.remove(<xat:poison_stone>);
recipes.remove(<xat:sea_stone>);
recipes.remove(<xat:glowing_ingot>);
recipes.removeByRecipeName("xat:dragons_eye");

recipes.removeByRecipeName("bountifulbaubles:spectralsilt_flaregun");
recipes.removeByRecipeName("bountifulbaubles:flare_red");
recipes.removeByRecipeName("bountifulbaubles:phantomprism");
recipes.removeByRecipeName("bountifulbaubles:spectralsilt_magicmirror");
recipes.removeByRecipeName("bountifulbaubles:wormholemirror");
recipes.removeByRecipeName("bountifulbaubles:spectralsilt_luckyhorseshoe");
recipes.removeByRecipeName("bountifulbaubles:ringflywheel");
recipes.removeByRecipeName("bountifulbaubles:ringflywheeladvanced");
recipes.removeByRecipeName("bountifulbaubles:ringiron");
recipes.removeByRecipeName("bountifulbaubles:spectralsilt_sinpendantempty");
recipes.removeByRecipeName("bountifulbaubles:spectralsilt_shieldcobalt");
recipes.removeByRecipeName("bountifulbaubles:amuletsinwrath");
recipes.removeByRecipeName("bountifulbaubles:amuletsingluttony");
recipes.removeByRecipeName("bountifulbaubles:crowngold");

recipes.removeByRecipeName("foodexpansion:netherwartsoup");

recipes.remove(<classyhats:phantom_thread>);

//recipes.remove(<campfire:campfire>);

recipes.remove(<potionfingers:ring:1>);

//recipes.remove(<minecraft:snow_layer>);

recipes.remove(<switchbow:arrowdiamond>);
recipes.remove(<switchbow:arrowfire>);
recipes.remove(<switchbow:arrowfrost>);
recipes.remove(<switchbow:arrowwither>);
recipes.remove(<switchbow:arrowvampier>);
recipes.remove(<switchbow:arrowburial>);

recipes.removeByRecipeName("defiledlands:decoration/stone_defiled_stairs");
recipes.removeByRecipeName("defiledlands:decoration/sandstone_defiled_stairs");
recipes.removeByRecipeName("defiledlands:decoration/stone_defiled_bricks_stairs");
recipes.removeByRecipeName("defiledlands:decoration/tenebra_stairs");

recipes.remove(<grapplemod:block_grapple_modifier>);
recipes.remove(<grapplemod:launcheritem>);
recipes.remove(<grapplemod:repeller>);
recipes.remove(<grapplemod:baseupgradeitem>);
recipes.remove(<grapplemod:doubleupgradeitem>);
recipes.remove(<grapplemod:doubleupgradeitem>);
recipes.remove(<grapplemod:forcefieldupgradeitem>);
recipes.remove(<grapplemod:magnetupgradeitem>);
recipes.remove(<grapplemod:motorupgradeitem>);
recipes.remove(<grapplemod:ropeupgradeitem>);
recipes.remove(<grapplemod:staffupgradeitem>);
recipes.remove(<grapplemod:swingupgradeitem>);
recipes.remove(<grapplemod:throwupgradeitem>);
recipes.remove(<grapplemod:limitsupgradeitem>);
recipes.remove(<grapplemod:longfallboots>);

recipes.remove(<minecraft:web>);
recipes.remove(<sereneseasons:greenhouse_glass>);

recipes.remove(<mujmajnkraftsbettersurvival:itemwooddagger>);
recipes.remove(<mujmajnkraftsbettersurvival:itemstonedagger>);
recipes.remove(<mujmajnkraftsbettersurvival:itemirondagger>);
recipes.remove(<mujmajnkraftsbettersurvival:itemgolddagger>);
recipes.remove(<mujmajnkraftsbettersurvival:itemdiamonddagger>);
recipes.remove(<mujmajnkraftsbettersurvival:itemsilverdagger>);
recipes.remove(<mujmajnkraftsbettersurvival:itembronzedagger>);
recipes.remove(<mujmajnkraftsbettersurvival:itemdragonbonedagger>);
recipes.remove(<mujmajnkraftsbettersurvival:itemjunglechitindagger>);
recipes.remove(<mujmajnkraftsbettersurvival:itemdesertchitindagger>);
recipes.remove(<mujmajnkraftsbettersurvival:itemdragonbonenunchaku>);
recipes.remove(<mujmajnkraftsbettersurvival:itemfiredragonbonespear>);
recipes.remove(<mujmajnkraftsbettersurvival:itemicedragonbonespear>);

recipes.removeByRecipeName("grapplemod:block_grapple_modifier");
recipes.removeByRecipeName("grapplemod:launcheritem");
recipes.removeByRecipeName("grapplemod:repeller");
recipes.removeByRecipeName("grapplemod:baseupgradeitem");
recipes.removeByRecipeName("grapplemod:doubleupgradeitem");
recipes.removeByRecipeName("grapplemod:doubleupgradeitem");
recipes.removeByRecipeName("grapplemod:forcefieldupgradeitem");
recipes.removeByRecipeName("grapplemod:magnetupgradeitem");
recipes.removeByRecipeName("grapplemod:motorupgradeitem");
recipes.removeByRecipeName("grapplemod:ropeupgradeitem");
recipes.removeByRecipeName("grapplemod:staffupgradeitem");
recipes.removeByRecipeName("grapplemod:swingupgradeitem");
recipes.removeByRecipeName("grapplemod:throwupgradeitem");
recipes.removeByRecipeName("grapplemod:limitsupgradeitem");
recipes.removeByRecipeName("grapplemod:longfallboots");

recipes.removeByRecipeName("notreepunching:tools/fire_starter");
recipes.remove(<minecraft:sandstone>);
recipes.remove(<minecraft:red_sandstone>);

recipes.remove(<charm:crate:*>);
recipes.removeByRecipeName("charm:ender_pearl");

furnace.remove(<notreepunching:ceramic_small_vessel>);

furnace.remove(<minecraft:gold_nugget>);
furnace.remove(<minecraft:iron_nugget>);
furnace.remove(<defiledlands:umbrium_nugget>);
furnace.remove(<variedcommodities:ingot_steel>);

furnace.remove(<iceandfire:silver_ingot>);
furnace.remove(<iceandfire:sapphire_gem>);
recipes.remove(<iceandfire:earplugs>);
recipes.remove(<iceandfire:fire_stew>);
recipes.remove(<iceandfire:frost_stew>);

furnace.remove(<minecraft:hardened_clay>);
furnace.addRecipe(<minecraft:hardened_clay>, <minecraft:clay>, 99999);

recipes.remove(<wolfarmor:chainmail_wolf_armor>);

recipes.remove(<firstaid:bandage>);

recipes.remove(<simpledifficulty:heater>);
recipes.remove(<simpledifficulty:chiller>);
recipes.remove(<simpledifficulty:spit>);
recipes.remove(<simpledifficulty:campfire>);

recipes.remove(<lycanitesmobs:soulcubedemonic>);
recipes.remove(<lycanitesmobs:soulcubeaberrant>);
recipes.remove(<lycanitesmobs:soulcubeundead>);
recipes.remove(<lycanitesmobs:equipment_station>);
recipes.remove(<lycanitesmobs:woodenpaxel>);
recipes.remove(<lycanitesmobs:ironpaxel>);
recipes.remove(<lycanitesmobs:ironrod>);
recipes.remove(<lycanitesmobs:ironhilt>);
recipes.remove(<lycanitesmobs:ironaxehead>);
recipes.remove(<lycanitesmobs:ironpikejoint>);
recipes.remove(<lycanitesmobs:dragontreat>);
recipes.remove(<lycanitesmobs:aviantreat>);
recipes.remove(<lycanitesmobs:beasttreat>);
recipes.remove(<lycanitesmobs:planttreat>);
recipes.remove(<lycanitesmobs:undeadtreat>);
recipes.remove(<lycanitesmobs:arachnidtreat>);
recipes.remove(<lycanitesmobs:aquatictreat>);
recipes.remove(<lycanitesmobs:demontreat>);
recipes.remove(<lycanitesmobs:saddle_beast>);
recipes.remove(<lycanitesmobs:saddle_imp>);
recipes.remove(<lycanitesmobs:saddle_insect>);
recipes.remove(<lycanitesmobs:saddle_elemental>);
recipes.remove(<lycanitesmobs:saddle_plant>);
recipes.remove(<lycanitesmobs:saddle_dragon>);
recipes.remove(<lycanitesmobs:saddle_slime>);
recipes.remove(<lycanitesmobs:saddle_anthronian>);
recipes.remove(<lycanitesmobs:saddle_amphibian>);
recipes.remove(<lycanitesmobs:saddle_reptile>);
recipes.remove(<lycanitesmobs:saddle_worm>);
recipes.remove(<lycanitesmobs:saddle_arachnid>);
recipes.remove(<lycanitesmobs:saddle_undead>);
recipes.remove(<lycanitesmobs:saddle_angel>);
recipes.remove(<lycanitesmobs:saddle_avian>);
recipes.remove(<lycanitesmobs:saddle_aquatic>);
recipes.remove(<lycanitesmobs:saddle_aberration>);
recipes.remove(<lycanitesmobs:saddle_demon>);
recipes.remove(<lycanitesmobs:saddle_golem>);
recipes.removeByRecipeName("lycanitesmobs:paleosalad");

recipes.remove(<minecraft:mycelium>);
recipes.remove(<minecraft:stone:1>);
recipes.remove(<minecraft:stone:3>);
recipes.remove(<minecraft:stone:5>);

recipes.remove(<spartanweaponry:arrow_wood>);

recipes.remove(<quark:iron_plate>);
recipes.remove(<quark:iron_plate:1>);
recipes.remove(<quark:candle:*>);
recipes.remove(<quark:grate:*>);
recipes.removeByRecipeName("quark:duskbound_block");
recipes.removeByRecipeName("quark:midori_block");
recipes.removeByRecipeName("quark:wheat");

recipes.remove(<rustic:candle>);
recipes.remove(<rustic:candle_gold>);
recipes.remove(<rustic:candle_silver>);
recipes.remove(<rustic:iron_lantern>);
recipes.remove(<rustic:golden_lantern>);
recipes.remove(<rustic:silver_lantern>);
recipes.remove(<rustic:apiary>);
recipes.remove(<rustic:fertile_soil>);
recipes.remove(<rustic:stone_pillar>);
recipes.remove(<rustic:andesite_pillar>);
recipes.remove(<rustic:diorite_pillar>);
recipes.remove(<rustic:granite_pillar>);
furnace.remove(<rustic:beeswax>);

recipes.remove(<betterquesting:submit_station>);

recipes.remove(<armorunder:cooling_goo>);
recipes.remove(<armorunder:heating_goo>);

recipes.remove(<locks:wood_lock_pick>);
recipes.remove(<locks:iron_lock_pick>);
recipes.remove(<locks:gold_lock_pick>);
recipes.remove(<locks:steel_lock_pick>);
recipes.remove(<locks:diamond_lock_pick>);

recipes.remove(<betternether:cincinnasite_forge>);
recipes.removeByRecipeName("betternether:stalagnate_stick");

recipes.remove(<scalinghealth:heartdust>);

recipes.remove(<inspirations:rope:1>);

recipes.remove(<base:wrench>);

recipes.remove(<minecraft:fishing_rod>);

recipes.remove(<disenchanter:disenchantmenttable>);

recipes.removeByRecipeName("lycanitesmobs:sugar");

recipes.remove(<charm:suspicious_soup:*>);

recipes.remove(<testdummy:dummy>);

recipes.remove(<srparasites:evolutionlure:*>);
recipes.remove(<srparasites:parasitecanister:*>);
recipes.remove(<srparasites:biomepurifier>);
recipes.remove(<srparasites:evclock>);

recipes.remove(<spartandefiled:staff_umbrium>);

recipes.removeByRecipeName("aquaculture:leather_from_boots");
recipes.removeByRecipeName("variedcommodities:mithril_spear_0");
recipes.removeByRecipeName("variedcommodities:demonic_spear_0");
recipes.removeByRecipeName("variedcommodities:demonic_broadsword_0");
recipes.removeByRecipeName("variedcommodities:mithril_broadsword_0");
recipes.removeByRecipeName("variedcommodities:mithril_dagger_0");
recipes.removeByRecipeName("variedcommodities:demonic_dagger_0");
recipes.removeByRecipeName("variedcommodities:demonic_sword_0");
recipes.removeByRecipeName("variedcommodities:mithril_sword_0");
recipes.removeByRecipeName("grapplemod:rockethook");
recipes.removeByRecipeName("grapplemod:doublemotorhook");
recipes.removeByRecipeName("grapplemod:motorhook");
recipes.removeByRecipeName("grapplemod:magnethook");
recipes.removeByRecipeName("grapplemod:rocketdoublemotorhook");
recipes.removeByRecipeName("grapplemod:enderhook");
recipes.removeByRecipeName("grapplemod:smarthook");
recipes.removeByRecipeName("betterquesting:life_full_0");
recipes.removeByRecipeName("betterquesting:life_full_1");
recipes.removeByRecipeName("betterquesting:life_full_2");
recipes.removeByRecipeName("betterquesting:life_half_0");
recipes.removeByRecipeName("betterquesting:life_half_1");
recipes.removeByRecipeName("betterquesting:life_quarter_0");
recipes.removeByRecipeName("variedcommodities:mithril_head_0");
recipes.removeByRecipeName("variedcommodities:demonic_head_0");
recipes.removeByRecipeName("variedcommodities:demonic_chest_0");
recipes.removeByRecipeName("variedcommodities:mithril_chest_0");
recipes.removeByRecipeName("variedcommodities:mithril_legs_0");
recipes.removeByRecipeName("variedcommodities:demonic_legs_0");
recipes.removeByRecipeName("variedcommodities:mithril_boots_0");
recipes.removeByRecipeName("variedcommodities:demonic_boots_0");

furnace.addRecipe(<minecraft:diamond> * 2, <minecraft:diamond_helmet:*>, 99999);
furnace.addRecipe(<minecraft:diamond> * 3, <minecraft:diamond_chestplate:*>, 99999);
furnace.addRecipe(<minecraft:diamond> * 3, <minecraft:diamond_leggings:*>, 99999);
furnace.addRecipe(<minecraft:diamond> * 3, <variedcommodities:diamond_skirt:*>, 99999);
furnace.addRecipe(<minecraft:diamond> * 1, <minecraft:diamond_boots:*>, 99999);
furnace.addRecipe(<minecraft:iron_ingot> * 2, <minecraft:iron_helmet:*>, 99999);
furnace.addRecipe(<minecraft:iron_ingot> * 3, <minecraft:iron_chestplate:*>, 99999);
furnace.addRecipe(<minecraft:iron_ingot> * 3, <minecraft:iron_leggings:*>, 99999);
furnace.addRecipe(<minecraft:iron_ingot> * 3, <variedcommodities:iron_skirt:*>, 99999);
furnace.addRecipe(<minecraft:iron_ingot> * 1, <minecraft:iron_boots:*>, 99999);
furnace.addRecipe(<minecraft:gold_ingot> * 2, <minecraft:golden_helmet:*>, 99999);
furnace.addRecipe(<minecraft:gold_ingot> * 3, <minecraft:golden_chestplate:*>, 99999);
furnace.addRecipe(<minecraft:gold_ingot> * 3, <minecraft:golden_leggings:*>, 99999);
furnace.addRecipe(<minecraft:gold_ingot> * 3, <variedcommodities:golden_skirt:*>, 99999);
furnace.addRecipe(<minecraft:gold_ingot> * 1, <minecraft:golden_boots:*>, 99999);
furnace.addRecipe(<variedcommodities:coin_diamond> * 4, <minecraft:diamond_sword:*>, 99999);
furnace.addRecipe(<minecraft:diamond> * 1, <minecraft:diamond_pickaxe:*>, 99999);
furnace.addRecipe(<minecraft:diamond> * 1, <minecraft:diamond_axe:*>, 99999);
furnace.addRecipe(<variedcommodities:coin_diamond> * 4, <minecraft:diamond_hoe:*>, 99999);
furnace.addRecipe(<variedcommodities:coin_diamond> * 1, <minecraft:diamond_shovel:*>, 99999);
furnace.addRecipe(<minecraft:iron_nugget> * 4, <minecraft:iron_sword:*>, 99999);
furnace.addRecipe(<minecraft:iron_ingot> * 1, <minecraft:iron_pickaxe:*>, 99999);
furnace.addRecipe(<minecraft:iron_ingot> * 1, <minecraft:iron_axe:*>, 99999);
furnace.addRecipe(<minecraft:iron_nugget> * 4, <minecraft:iron_hoe:*>, 99999);
furnace.addRecipe(<minecraft:iron_nugget> * 1, <minecraft:iron_shovel:*>, 99999);
furnace.addRecipe(<minecraft:gold_nugget> * 4, <minecraft:golden_sword:*>, 99999);
furnace.addRecipe(<minecraft:gold_ingot> * 1, <minecraft:golden_pickaxe:*>, 99999);
furnace.addRecipe(<minecraft:gold_ingot> * 1, <minecraft:golden_axe:*>, 99999);
furnace.addRecipe(<minecraft:gold_nugget> * 4, <minecraft:golden_hoe:*>, 99999);
furnace.addRecipe(<minecraft:gold_nugget> * 1, <minecraft:golden_shovel:*>, 99999);
furnace.addRecipe(<minecraft:diamond> * 7, <minecraft:diamond_horse_armor:*>, 99999);
furnace.addRecipe(<minecraft:iron_ingot> * 7, <minecraft:iron_horse_armor:*>, 99999);
furnace.addRecipe(<minecraft:gold_ingot> * 7, <minecraft:golden_horse_armor:*>, 99999);
furnace.addRecipe(<minecraft:iron_nugget> * 6, <minecraft:chainmail_helmet:*>, 99999);
furnace.addRecipe(<minecraft:iron_nugget> * 12, <minecraft:chainmail_chestplate:*>, 99999);
furnace.addRecipe(<minecraft:iron_nugget> * 10, <minecraft:chainmail_leggings:*>, 99999);
furnace.addRecipe(<minecraft:iron_nugget> * 10, <variedcommodities:chain_skirt:*>, 99999);
furnace.addRecipe(<minecraft:iron_nugget> * 4, <minecraft:chainmail_boots:*>, 99999);
furnace.addRecipe(<variedcommodities:coin_bronze> * 4, <variedcommodities:bronze_sword:*>, 99999);

furnace.addRecipe(<contenttweaker:neptunium_nugget> * 4, <aquaculture:neptunium_sword:*>, 99999);
furnace.addRecipe(<aquaculture:loot:1> * 1, <aquaculture:neptunium_pickaxe:*>, 99999);
furnace.addRecipe(<aquaculture:loot:1> * 1, <aquaculture:neptunium_axe:*>, 99999);
furnace.addRecipe(<contenttweaker:neptunium_nugget> * 4, <aquaculture:neptunium_hoe:*>, 99999);
furnace.addRecipe(<contenttweaker:neptunium_nugget> * 1, <aquaculture:neptunium_shovel:*>, 99999);
furnace.addRecipe(<aquaculture:loot:1> * 2, <aquaculture:neptunium_helmet:*>, 99999);
furnace.addRecipe(<aquaculture:loot:1> * 3, <aquaculture:neptunium_chestplate:*>, 99999);
furnace.addRecipe(<aquaculture:loot:1> * 3, <aquaculture:neptunium_leggings:*>, 99999);
furnace.addRecipe(<aquaculture:loot:1> * 1, <aquaculture:neptunium_boots:*>, 99999);

furnace.addRecipe(<minecraft:diamond> * 2, <mujmajnkraftsbettersurvival:itemdiamondhammer:*>, 99999);
furnace.addRecipe(<minecraft:diamond> * 2, <mujmajnkraftsbettersurvival:itemdiamondbattleaxe:*>, 99999);
furnace.addRecipe(<variedcommodities:coin_diamond> * 1, <mujmajnkraftsbettersurvival:itemdiamonddagger:*>, 99999);
furnace.addRecipe(<variedcommodities:coin_diamond> * 4, <mujmajnkraftsbettersurvival:itemdiamondnunchaku:*>, 99999);
furnace.addRecipe(<minecraft:iron_ingot> * 2, <mujmajnkraftsbettersurvival:itemironhammer:*>, 99999);
furnace.addRecipe(<minecraft:iron_ingot> * 2, <mujmajnkraftsbettersurvival:itemironbattleaxe:*>, 99999);
furnace.addRecipe(<minecraft:iron_nugget> * 1, <mujmajnkraftsbettersurvival:itemirondagger:*>, 99999);
furnace.addRecipe(<minecraft:iron_nugget> * 4, <mujmajnkraftsbettersurvival:itemironnunchaku:*>, 99999);
furnace.addRecipe(<minecraft:gold_ingot> * 2, <mujmajnkraftsbettersurvival:itemgoldhammer:*>, 99999);
furnace.addRecipe(<minecraft:gold_ingot> * 2, <mujmajnkraftsbettersurvival:itemgoldbattleaxe:*>, 99999);
furnace.addRecipe(<minecraft:gold_nugget> * 1, <mujmajnkraftsbettersurvival:itemgolddagger:*>, 99999);
furnace.addRecipe(<minecraft:gold_nugget> * 4, <mujmajnkraftsbettersurvival:itemgoldnunchaku:*>, 99999);
furnace.addRecipe(<iceandfire:silver_ingot> * 2, <mujmajnkraftsbettersurvival:itemsilverhammer:*>, 99999);
furnace.addRecipe(<iceandfire:silver_ingot> * 2, <mujmajnkraftsbettersurvival:itemsilverbattleaxe:*>, 99999);
furnace.addRecipe(<iceandfire:silver_nugget> * 1, <mujmajnkraftsbettersurvival:itemsilverdagger:*>, 99999);
furnace.addRecipe(<iceandfire:silver_nugget> * 4, <mujmajnkraftsbettersurvival:itemsilvernunchaku:*>, 99999);
furnace.addRecipe(<variedcommodities:ingot_bronze> * 2, <mujmajnkraftsbettersurvival:itembronzehammer:*>, 99999);
furnace.addRecipe(<variedcommodities:ingot_bronze> * 2, <mujmajnkraftsbettersurvival:itembronzebattleaxe:*>, 99999);
furnace.addRecipe(<variedcommodities:coin_bronze> * 1, <mujmajnkraftsbettersurvival:itembronzedagger:*>, 99999);
furnace.addRecipe(<variedcommodities:coin_bronze> * 4, <mujmajnkraftsbettersurvival:itembronzenunchaku:*>, 99999);

furnace.addRecipe(<variedcommodities:ingot_steel> * 2, <mujmajnkraftsbettersurvival:itemsteelhammer:*>, 99999);
furnace.addRecipe(<variedcommodities:ingot_steel> * 2, <mujmajnkraftsbettersurvival:itemsteelbattleaxe:*>, 99999);
furnace.addRecipe(<contenttweaker:steel_nugget> * 1, <mujmajnkraftsbettersurvival:itemsteeldagger:*>, 99999);
furnace.addRecipe(<contenttweaker:steel_nugget> * 4, <mujmajnkraftsbettersurvival:itemsteelnunchaku:*>, 99999);

furnace.addRecipe(<minecraft:diamond> * 1, <spartanweaponry:longsword_diamond:*>, 99999);
furnace.addRecipe(<variedcommodities:coin_diamond> * 4, <spartanweaponry:katana_diamond:*>, 99999);
furnace.addRecipe(<minecraft:diamond> * 1, <spartanweaponry:saber_diamond:*>, 99999);
furnace.addRecipe(<minecraft:diamond> * 1, <spartanweaponry:rapier_diamond:*>, 99999);
furnace.addRecipe(<minecraft:diamond> * 2, <spartanweaponry:greatsword_diamond:*>, 99999);
furnace.addRecipe(<minecraft:diamond> * 2, <spartanweaponry:hammer_diamond:*>, 99999);
furnace.addRecipe(<minecraft:diamond> * 1, <spartanweaponry:warhammer_diamond:*>, 99999);
furnace.addRecipe(<minecraft:diamond> * 1, <spartanweaponry:halberd_diamond:*>, 99999);
//furnace.addRecipe(<minecraft:diamond> * 1, <spartanweaponry:throwing_axe_diamond:*>, 99999);
furnace.addRecipe(<minecraft:diamond> * 2, <spartanweaponry:battleaxe_diamond:*>, 99999);
furnace.addRecipe(<minecraft:diamond> * 1, <spartanweaponry:mace_diamond:*>, 99999);
furnace.addRecipe(<minecraft:diamond> * 1, <spartanweaponry:glaive_diamond:*>, 99999);
furnace.addRecipe(<variedcommodities:coin_diamond> * 4, <spartanweaponry:staff_diamond:*>, 99999);
furnace.addRecipe(<variedcommodities:ingot_steel> * 1, <spartanweaponry:longsword_steel:*>, 99999);
furnace.addRecipe(<contenttweaker:steel_nugget> * 4, <spartanweaponry:katana_steel:*>, 99999);
furnace.addRecipe(<variedcommodities:ingot_steel> * 1, <spartanweaponry:saber_steel:*>, 99999);
furnace.addRecipe(<variedcommodities:ingot_steel> * 1, <spartanweaponry:rapier_steel:*>, 99999);
furnace.addRecipe(<variedcommodities:ingot_steel> * 2, <spartanweaponry:greatsword_steel:*>, 99999);
furnace.addRecipe(<variedcommodities:ingot_steel> * 2, <spartanweaponry:hammer_steel:*>, 99999);
furnace.addRecipe(<variedcommodities:ingot_steel> * 1, <spartanweaponry:warhammer_steel:*>, 99999);
furnace.addRecipe(<variedcommodities:ingot_steel> * 1, <spartanweaponry:halberd_steel:*>, 99999);
//furnace.addRecipe(<contenttweaker:steel_nugget> * 9, <spartanweaponry:throwing_axe_steel:*>, 99999);
furnace.addRecipe(<variedcommodities:ingot_steel> * 2, <spartanweaponry:battleaxe_steel:*>, 99999);
furnace.addRecipe(<variedcommodities:ingot_steel> * 1, <spartanweaponry:mace_steel:*>, 99999);
furnace.addRecipe(<variedcommodities:ingot_steel> * 1, <spartanweaponry:glaive_steel:*>, 99999);
furnace.addRecipe(<contenttweaker:steel_nugget> * 4, <spartanweaponry:staff_steel:*>, 99999);
furnace.addRecipe(<defiledlands:umbrium_ingot> * 1, <spartandefiled:longsword_umbrium:*>, 99999);
furnace.addRecipe(<defiledlands:umbrium_nugget> * 4, <spartandefiled:katana_umbrium:*>, 99999);
furnace.addRecipe(<defiledlands:umbrium_ingot> * 1, <spartandefiled:saber_umbrium:*>, 99999);
furnace.addRecipe(<defiledlands:umbrium_ingot> * 1, <spartandefiled:rapier_umbrium:*>, 99999);
furnace.addRecipe(<defiledlands:umbrium_ingot> * 2, <spartandefiled:greatsword_umbrium:*>, 99999);
furnace.addRecipe(<defiledlands:umbrium_ingot> * 2, <spartandefiled:hammer_umbrium:*>, 99999);
furnace.addRecipe(<defiledlands:umbrium_ingot> * 1, <spartandefiled:warhammer_umbrium:*>, 99999);
furnace.addRecipe(<defiledlands:umbrium_ingot> * 1, <spartandefiled:halberd_umbrium:*>, 99999);
//furnace.addRecipe(<defiledlands:umbrium_ingot> * 1, <spartandefiled:throwing_axe_umbrium:*>, 99999);
furnace.addRecipe(<defiledlands:umbrium_ingot> * 2, <spartandefiled:battleaxe_umbrium:*>, 99999);
furnace.addRecipe(<defiledlands:umbrium_ingot> * 1, <spartandefiled:mace_umbrium:*>, 99999);
furnace.addRecipe(<defiledlands:umbrium_ingot> * 1, <spartandefiled:glaive_umbrium:*>, 99999);
furnace.addRecipe(<defiledlands:umbrium_nugget> * 4, <spartandefiled:staff_umbrium:*>, 99999);
furnace.addRecipe(<minecraft:iron_ingot> * 1, <spartanweaponry:longsword_iron:*>, 99999);
furnace.addRecipe(<minecraft:iron_nugget> * 4, <spartanweaponry:katana_iron:*>, 99999);
furnace.addRecipe(<minecraft:iron_ingot> * 1, <spartanweaponry:saber_iron:*>, 99999);
furnace.addRecipe(<minecraft:iron_ingot> * 1, <spartanweaponry:rapier_iron:*>, 99999);
furnace.addRecipe(<minecraft:iron_ingot> * 2, <spartanweaponry:greatsword_iron:*>, 99999);
furnace.addRecipe(<minecraft:iron_ingot> * 2, <spartanweaponry:hammer_iron:*>, 99999);
furnace.addRecipe(<minecraft:iron_ingot> * 1, <spartanweaponry:warhammer_iron:*>, 99999);
furnace.addRecipe(<minecraft:iron_ingot> * 1, <spartanweaponry:halberd_iron:*>, 99999);
//furnace.addRecipe(<minecraft:iron_ingot> * 1, <spartanweaponry:throwing_axe_iron:*>, 99999);
furnace.addRecipe(<minecraft:iron_ingot> * 2, <spartanweaponry:battleaxe_iron:*>, 99999);
furnace.addRecipe(<minecraft:iron_ingot> * 1, <spartanweaponry:mace_iron:*>, 99999);
furnace.addRecipe(<minecraft:iron_ingot> * 1, <spartanweaponry:glaive_iron:*>, 99999);
furnace.addRecipe(<minecraft:iron_nugget> * 4, <spartanweaponry:staff_iron:*>, 99999);
furnace.addRecipe(<minecraft:gold_ingot> * 1, <spartanweaponry:longsword_gold:*>, 99999);
furnace.addRecipe(<minecraft:gold_nugget> * 4, <spartanweaponry:katana_gold:*>, 99999);
furnace.addRecipe(<minecraft:gold_ingot> * 1, <spartanweaponry:saber_gold:*>, 99999);
furnace.addRecipe(<minecraft:gold_ingot> * 1, <spartanweaponry:rapier_gold:*>, 99999);
furnace.addRecipe(<minecraft:gold_ingot> * 2, <spartanweaponry:greatsword_gold:*>, 99999);
furnace.addRecipe(<minecraft:gold_ingot> * 2, <spartanweaponry:hammer_gold:*>, 99999);
furnace.addRecipe(<minecraft:gold_ingot> * 1, <spartanweaponry:warhammer_gold:*>, 99999);
furnace.addRecipe(<minecraft:gold_ingot> * 1, <spartanweaponry:halberd_gold:*>, 99999);
//furnace.addRecipe(<minecraft:gold_ingot> * 1, <spartanweaponry:throwing_axe_gold:*>, 99999);
furnace.addRecipe(<minecraft:gold_ingot> * 2, <spartanweaponry:battleaxe_gold:*>, 99999);
furnace.addRecipe(<minecraft:gold_ingot> * 1, <spartanweaponry:mace_gold:*>, 99999);
furnace.addRecipe(<minecraft:gold_ingot> * 1, <spartanweaponry:glaive_gold:*>, 99999);
furnace.addRecipe(<minecraft:gold_nugget> * 4, <spartanweaponry:staff_gold:*>, 99999);
furnace.addRecipe(<iceandfire:silver_ingot> * 1, <spartanweaponry:longsword_silver:*>, 99999);
furnace.addRecipe(<iceandfire:silver_nugget> * 4, <spartanweaponry:katana_silver:*>, 99999);
furnace.addRecipe(<iceandfire:silver_ingot> * 1, <spartanweaponry:saber_silver:*>, 99999);
furnace.addRecipe(<iceandfire:silver_ingot> * 1, <spartanweaponry:rapier_silver:*>, 99999);
furnace.addRecipe(<iceandfire:silver_ingot> * 2, <spartanweaponry:greatsword_silver:*>, 99999);
furnace.addRecipe(<iceandfire:silver_ingot> * 2, <spartanweaponry:hammer_silver:*>, 99999);
furnace.addRecipe(<iceandfire:silver_ingot> * 1, <spartanweaponry:warhammer_silver:*>, 99999);
furnace.addRecipe(<iceandfire:silver_ingot> * 1, <spartanweaponry:halberd_silver:*>, 99999);
//furnace.addRecipe(<iceandfire:silver_ingot> * 1, <spartanweaponry:throwing_axe_silver:*>, 99999);
furnace.addRecipe(<iceandfire:silver_ingot> * 2, <spartanweaponry:battleaxe_silver:*>, 99999);
furnace.addRecipe(<iceandfire:silver_ingot> * 1, <spartanweaponry:mace_silver:*>, 99999);
furnace.addRecipe(<iceandfire:silver_ingot> * 1, <spartanweaponry:glaive_silver:*>, 99999);
furnace.addRecipe(<iceandfire:silver_nugget> * 4, <spartanweaponry:staff_silver:*>, 99999);
furnace.addRecipe(<variedcommodities:ingot_bronze> * 1, <spartanweaponry:longsword_bronze:*>, 99999);
furnace.addRecipe(<variedcommodities:coin_bronze> * 4, <spartanweaponry:katana_bronze:*>, 99999);
furnace.addRecipe(<variedcommodities:ingot_bronze> * 1, <spartanweaponry:saber_bronze:*>, 99999);
furnace.addRecipe(<variedcommodities:ingot_bronze> * 1, <spartanweaponry:rapier_bronze:*>, 99999);
furnace.addRecipe(<variedcommodities:ingot_bronze> * 2, <spartanweaponry:greatsword_bronze:*>, 99999);
furnace.addRecipe(<variedcommodities:ingot_bronze> * 2, <spartanweaponry:hammer_bronze:*>, 99999);
furnace.addRecipe(<variedcommodities:ingot_bronze> * 1, <spartanweaponry:warhammer_bronze:*>, 99999);
furnace.addRecipe(<variedcommodities:ingot_bronze> * 1, <spartanweaponry:halberd_bronze:*>, 99999);
//furnace.addRecipe(<variedcommodities:ingot_bronze> * 1, <spartanweaponry:throwing_axe_bronze:*>, 99999);
furnace.addRecipe(<variedcommodities:ingot_bronze> * 2, <spartanweaponry:battleaxe_bronze:*>, 99999);
furnace.addRecipe(<variedcommodities:ingot_bronze> * 1, <spartanweaponry:mace_bronze:*>, 99999);
furnace.addRecipe(<variedcommodities:ingot_bronze> * 1, <spartanweaponry:glaive_bronze:*>, 99999);
furnace.addRecipe(<variedcommodities:coin_bronze> * 4, <spartanweaponry:staff_bronze:*>, 99999);

furnace.addRecipe(<variedcommodities:coin_diamond> * 1, <spartanweaponry:dagger_diamond:*>, 99999);
furnace.addRecipe(<variedcommodities:coin_diamond> * 1, <spartanweaponry:spear_diamond:*>, 99999);
furnace.addRecipe(<variedcommodities:coin_diamond> * 1, <spartanweaponry:pike_diamond:*>, 99999);
furnace.addRecipe(<variedcommodities:coin_diamond> * 1, <spartanweaponry:lance_diamond:*>, 99999);

furnace.addRecipe(<defiledlands:umbrium_nugget> * 1, <spartandefiled:dagger_umbrium:*>, 99999);
furnace.addRecipe(<defiledlands:umbrium_nugget> * 1, <spartandefiled:spear_umbrium:*>, 99999);
furnace.addRecipe(<defiledlands:umbrium_nugget> * 1, <spartandefiled:pike_umbrium:*>, 99999);
furnace.addRecipe(<defiledlands:umbrium_nugget> * 1, <spartandefiled:lance_umbrium:*>, 99999);

furnace.addRecipe(<minecraft:iron_nugget> * 1, <spartanweaponry:dagger_iron:*>, 99999);
furnace.addRecipe(<minecraft:iron_nugget> * 1, <spartanweaponry:spear_iron:*>, 99999);
furnace.addRecipe(<minecraft:iron_nugget> * 1, <spartanweaponry:pike_iron:*>, 99999);
furnace.addRecipe(<minecraft:iron_nugget> * 1, <spartanweaponry:lance_iron:*>, 99999);

furnace.addRecipe(<minecraft:gold_nugget> * 1, <spartanweaponry:dagger_gold:*>, 99999);
furnace.addRecipe(<minecraft:gold_nugget> * 1, <spartanweaponry:spear_gold:*>, 99999);
furnace.addRecipe(<minecraft:gold_nugget> * 1, <spartanweaponry:pike_gold:*>, 99999);
furnace.addRecipe(<minecraft:gold_nugget> * 1, <spartanweaponry:lance_gold:*>, 99999);

furnace.addRecipe(<iceandfire:silver_nugget> * 1, <spartanweaponry:dagger_silver:*>, 99999);
furnace.addRecipe(<iceandfire:silver_nugget> * 1, <spartanweaponry:spear_silver:*>, 99999);
furnace.addRecipe(<iceandfire:silver_nugget> * 1, <spartanweaponry:pike_silver:*>, 99999);
furnace.addRecipe(<iceandfire:silver_nugget> * 1, <spartanweaponry:lance_silver:*>, 99999);

furnace.addRecipe(<variedcommodities:coin_bronze> * 1, <spartanweaponry:dagger_bronze:*>, 99999);
furnace.addRecipe(<variedcommodities:coin_bronze> * 1, <spartanweaponry:spear_bronze:*>, 99999);
furnace.addRecipe(<variedcommodities:coin_bronze> * 1, <spartanweaponry:pike_bronze:*>, 99999);
furnace.addRecipe(<variedcommodities:coin_bronze> * 1, <spartanweaponry:lance_bronze:*>, 99999);

furnace.addRecipe(<contenttweaker:steel_nugget> * 1, <spartanweaponry:dagger_steel:*>, 99999);
furnace.addRecipe(<contenttweaker:steel_nugget> * 1, <spartanweaponry:spear_steel:*>, 99999);
furnace.addRecipe(<contenttweaker:steel_nugget> * 1, <spartanweaponry:pike_steel:*>, 99999);
furnace.addRecipe(<contenttweaker:steel_nugget> * 1, <spartanweaponry:lance_steel:*>, 99999);

furnace.addRecipe(<defiledlands:umbrium_nugget> * 4, <defiledlands:umbrium_sword:*>, 99999);
furnace.addRecipe(<defiledlands:umbrium_ingot> * 1, <defiledlands:umbrium_axe:*>, 99999);
furnace.addRecipe(<defiledlands:umbrium_ingot> * 1, <defiledlands:umbrium_pickaxe:*>, 99999);
furnace.addRecipe(<defiledlands:umbrium_nugget> * 4, <defiledlands:umbrium_hoe:*>, 99999);
furnace.addRecipe(<defiledlands:umbrium_nugget> * 1, <defiledlands:umbrium_shovel:*>, 99999);
furnace.addRecipe(<defiledlands:umbrium_ingot> * 2, <defiledlands:umbrium_helmet:*>, 99999);
furnace.addRecipe(<defiledlands:umbrium_ingot> * 3, <defiledlands:umbrium_chestplate:*>, 99999);
furnace.addRecipe(<defiledlands:umbrium_ingot> * 3, <defiledlands:umbrium_leggings:*>, 99999);
furnace.addRecipe(<defiledlands:umbrium_ingot> * 1, <defiledlands:umbrium_boots:*>, 99999);

furnace.addRecipe(<iceandfire:silver_ingot> * 2, <iceandfire:armor_silver_metal_helmet:*>, 99999);
furnace.addRecipe(<iceandfire:silver_ingot> * 3, <iceandfire:armor_silver_metal_chestplate:*>, 99999);
furnace.addRecipe(<iceandfire:silver_ingot> * 3, <iceandfire:armor_silver_metal_leggings:*>, 99999);
furnace.addRecipe(<iceandfire:silver_ingot> * 1, <iceandfire:armor_silver_metal_boots:*>, 99999);
furnace.addRecipe(<iceandfire:silver_nugget> * 4, <iceandfire:silver_sword:*>, 99999);
furnace.addRecipe(<iceandfire:silver_ingot> * 1, <iceandfire:silver_axe:*>, 99999);
furnace.addRecipe(<iceandfire:silver_ingot> * 1, <iceandfire:silver_pickaxe:*>, 99999);
furnace.addRecipe(<iceandfire:silver_nugget> * 4, <iceandfire:silver_hoe:*>, 99999);
furnace.addRecipe(<iceandfire:silver_nugget> * 1, <iceandfire:silver_shovel:*>, 99999);

furnace.addRecipe(<minecraft:iron_ingot> * 1, <spartanshields:shield_basic_iron:*>, 99999);
furnace.addRecipe(<minecraft:gold_ingot> * 1, <spartanshields:shield_basic_gold:*>, 99999);
furnace.addRecipe(<minecraft:diamond> * 1, <spartanshields:shield_basic_diamond:*>, 99999);
furnace.addRecipe(<minecraft:iron_ingot> * 1, <spartanshields:shield_tower_iron:*>, 99999);
furnace.addRecipe(<minecraft:gold_ingot> * 1, <spartanshields:shield_tower_gold:*>, 99999);
furnace.addRecipe(<minecraft:diamond> * 1, <spartanshields:shield_tower_diamond:*>, 99999);
furnace.addRecipe(<variedcommodities:ingot_bronze> * 1, <spartanshields:shield_basic_bronze:*>, 99999);
furnace.addRecipe(<variedcommodities:ingot_bronze> * 1, <spartanshields:shield_tower_bronze:*>, 99999);
furnace.addRecipe(<variedcommodities:ingot_steel> * 1, <spartanshields:shield_basic_steel:*>, 99999);
furnace.addRecipe(<variedcommodities:ingot_steel> * 1, <spartanshields:shield_tower_steel:*>, 99999);
furnace.addRecipe(<iceandfire:silver_ingot> * 1, <spartanshields:shield_basic_silver:*>, 99999);
furnace.addRecipe(<iceandfire:silver_ingot> * 1, <spartanshields:shield_tower_silver:*>, 99999);

furnace.addRecipe(<minecraft:iron_nugget> * 20, <wolfarmor:chainmail_wolf_armor:*>, 99999);
furnace.addRecipe(<minecraft:iron_ingot> * 5, <wolfarmor:iron_wolf_armor:*>, 99999);
furnace.addRecipe(<minecraft:gold_ingot> * 5, <wolfarmor:gold_wolf_armor:*>, 99999);
furnace.addRecipe(<minecraft:diamond> * 5, <wolfarmor:diamond_wolf_armor:*>, 99999);

furnace.addRecipe(<iceandfire:silver_ingot> * 1, <iceandfire:silver_ore:*>, 99999);
furnace.addRecipe(<iceandfire:sapphire_gem> * 1, <iceandfire:sapphire_ore:*>, 99999);

furnace.addRecipe(<minecraft:iron_nugget> * 4, <aquaculture:loot:2>, 99999);
furnace.addRecipe(<minecraft:dye:2> * 1, <aquaculture:food:1>, 99999);

furnace.addRecipe(<variedcommodities:ingot_steel> * 1, <contenttweaker:steel_alloy>, 99999);

furnace.addRecipe(<minecraft:iron_nugget> * 1, <rustic:dust_tiny_iron>, 99999);

furnace.addRecipe(<rustic:tallow> * 1, <quark:tallow>, 99999);

furnace.addRecipe(<rustic:beeswax> * 1, <lycanitesmobs:veswax>, 99999);

furnace.addRecipe(<iceandfire:myrmex_desert_resin_glass> * 1, <iceandfire:myrmex_desert_resin_block>, 99999);
furnace.addRecipe(<iceandfire:myrmex_jungle_resin_glass> * 1, <iceandfire:myrmex_jungle_resin_block>, 99999);

furnace.addRecipe(<minecraft:iron_nugget> * 3, <locks:iron_lock:*>, 99999);
furnace.addRecipe(<contenttweaker:steel_nugget> * 3, <locks:steel_lock:*>, 99999);
furnace.addRecipe(<minecraft:gold_nugget> * 3, <locks:gold_lock:*>, 99999);
furnace.addRecipe(<variedcommodities:coin_diamond> * 3, <locks:diamond_lock:*>, 99999);

furnace.addRecipe(<betternether:cincinnasite> * 1, <betternether:cincinnasite_ore>, 99999);
furnace.addRecipe(<scalinghealth:crystalshard> * 1, <scalinghealth:crystalore>, 99999);

brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "minecraft:water"}), <minecraft:glowstone_dust>);
brewing.removeRecipe(<minecraft:splash_potion>.withTag({Potion: "minecraft:water"}), <minecraft:glowstone_dust>);
brewing.removeRecipe(<minecraft:lingering_potion>.withTag({Potion: "minecraft:water"}), <minecraft:glowstone_dust>);
brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "minecraft:water"}), <minecraft:redstone>);
brewing.removeRecipe(<minecraft:splash_potion>.withTag({Potion: "minecraft:water"}), <minecraft:redstone>);
brewing.removeRecipe(<minecraft:lingering_potion>.withTag({Potion: "minecraft:water"}), <minecraft:redstone>);

brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "mujmajnkraftsbettersurvival:milk"}), <minecraft:golden_apple>);
brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "mujmajnkraftsbettersurvival:milk"}), <minecraft:fermented_spider_eye>);

brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "minecraft:awkward"}), <simpledifficulty:ice_chunk>);
brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "minecraft:awkward"}), <simpledifficulty:magma_chunk>);
brewing.removeRecipe(<minecraft:splash_potion>.withTag({Potion: "minecraft:awkward"}), <simpledifficulty:ice_chunk>);
brewing.removeRecipe(<minecraft:splash_potion>.withTag({Potion: "minecraft:awkward"}), <simpledifficulty:magma_chunk>);
brewing.removeRecipe(<minecraft:lingering_potion>.withTag({Potion: "minecraft:awkward"}), <simpledifficulty:ice_chunk>);
brewing.removeRecipe(<minecraft:lingering_potion>.withTag({Potion: "minecraft:awkward"}), <simpledifficulty:magma_chunk>);

brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "xat:sparkling"}), <minecraft:snow>);
brewing.removeRecipe(<minecraft:splash_potion>.withTag({Potion: "xat:sparkling"}), <minecraft:snow>);
brewing.removeRecipe(<minecraft:lingering_potion>.withTag({Potion: "xat:sparkling"}), <minecraft:snow>);

brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:awkward"}), <contenttweaker:glacier_cream>, <minecraft:potion>.withTag({Potion: "xat:ice_resistance"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "xat:ice_resistance"}), <minecraft:redstone>, <minecraft:potion>.withTag({Potion: "xat:extended_ice_resistance"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "xat:ice_resistance"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "xat:ice_resistance"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "xat:extended_ice_resistance"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "xat:extended_ice_resistance"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "xat:ice_resistance"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "xat:ice_resistance"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "xat:extended_ice_resistance"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "xat:extended_ice_resistance"}));

brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:awkward"}), <waystones:warp_scroll>, <bountifulbaubles:potionrecall>);
brewing.addBrew(<bountifulbaubles:potionrecall>, <minecraft:ender_eye>, <bountifulbaubles:potionwormhole>);

brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:water"}), <betternether:bone_mushroom>, <minecraft:potion>.withTag({Potion: "minecraft:thick"}));

//Potion Of Health Boost
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:thick"}), <scalinghealth:heartcontainer>, <minecraft:potion>.withTag({Potion: "potioncore:health_boost"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:health_boost"}), <minecraft:glowstone_dust>, <minecraft:potion>.withTag({Potion: "potioncore:strong_health_boost"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:health_boost"}), <minecraft:redstone>, <minecraft:potion>.withTag({Potion: "potioncore:long_health_boost"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:health_boost"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:health_boost"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:strong_health_boost"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:strong_health_boost"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:long_health_boost"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:long_health_boost"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:health_boost"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:health_boost"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:strong_health_boost"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:strong_health_boost"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:long_health_boost"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:long_health_boost"}));

//Potion Of Levitation
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:mundane"}), <minecraft:feather>, <minecraft:potion>.withTag({Potion: "potioncore:levitation"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:levitation"}), <minecraft:glowstone_dust>, <minecraft:potion>.withTag({Potion: "potioncore:strong_levitation"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:levitation"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:levitation"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:strong_levitation"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:strong_levitation"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:levitation"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:levitation"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:strong_levitation"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:strong_levitation"}));

//Potion Of Feather Falling
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:thick"}), <minecraft:feather>, <minecraft:potion>.withTag({Potion: "potioncore:slow_fall"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:slow_fall"}), <minecraft:glowstone_dust>, <minecraft:potion>.withTag({Potion: "potioncore:strong_slow_fall"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:slow_fall"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:slow_fall"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:strong_slow_fall"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:strong_slow_fall"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:slow_fall"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:slow_fall"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:strong_slow_fall"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:strong_slow_fall"}));

//Potion Of 1-Up
//brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:thick"}), <minecraft:totem_of_undying>, <minecraft:potion>.withTag({Potion: "potioncore:revival"}));
//brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:revival"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:revival"}));
//brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:revival"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:revival"}));

brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "potioncore:revival"}), <minecraft:gunpowder>);
brewing.removeRecipe(<minecraft:splash_potion>.withTag({Potion: "potioncore:revival"}), <minecraft:dragon_breath>);

//Potion Of Wings
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:thick"}), <familiarfauna:pixie_dust>, <minecraft:potion>.withTag({Potion: "potioncore:flight"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:flight"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:flight"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:flight"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:flight"}));

//Potion Of Mending
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:thick"}), <iceandfire:fire_dragon_heart>|<iceandfire:ice_dragon_heart>, <minecraft:potion>.withTag({Potion: "potioncore:repair"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:repair"}), <minecraft:glowstone_dust>, <minecraft:potion>.withTag({Potion: "potioncore:strong_repair"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:repair"}), <minecraft:redstone>, <minecraft:potion>.withTag({Potion: "potioncore:long_repair"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:repair"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:repair"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:strong_repair"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:strong_repair"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:long_repair"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:long_repair"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:repair"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:repair"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:strong_repair"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:strong_repair"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:long_repair"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:long_repair"}));

//Potion Of Knock Up
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:mundane"}), <minecraft:rabbit_foot>, <minecraft:potion>.withTag({Potion: "potioncore:launch"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:launch"}), <minecraft:glowstone_dust>, <minecraft:potion>.withTag({Potion: "potioncore:strong_launch"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:launch"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:launch"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:strong_launch"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:strong_launch"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:launch"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:launch"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:strong_launch"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:strong_launch"}));

//Potion Of Detonation
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:thick"}), <spartanweaponry:dynamite>, <minecraft:potion>.withTag({Potion: "potioncore:explode"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:explode"}), <minecraft:glowstone_dust>, <minecraft:potion>.withTag({Potion: "potioncore:strong_explode"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:explode"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:explode"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:strong_explode"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:strong_explode"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:explode"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:explode"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:strong_explode"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:strong_explode"}));

//Potion Of Thundering
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:thick"}), <aquaculture:fish:21>, <minecraft:potion>.withTag({Potion: "potioncore:lightning"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:lightning"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:lightning"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:lightning"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:lightning"}));

//Potion of Sponataneous Combustion
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:mundane"}), <lycanitesmobs:embercharge>, <minecraft:potion>.withTag({Potion: "potioncore:fire"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:fire"}), <minecraft:glowstone_dust>, <minecraft:potion>.withTag({Potion: "potioncore:strong_fire"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:fire"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:fire"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:strong_fire"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:strong_fire"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:fire"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:fire"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:strong_fire"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:strong_fire"}));

//Potion Of Guarding (Iron Skin)
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:thick"}), <iceandfire:fire_dragon_flesh>|<iceandfire:ice_dragon_flesh>, <minecraft:potion>.withTag({Potion: "potioncore:iron_skin"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:iron_skin"}), <minecraft:glowstone_dust>, <minecraft:potion>.withTag({Potion: "potioncore:strong_iron_skin"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:iron_skin"}), <minecraft:redstone>, <minecraft:potion>.withTag({Potion: "potioncore:long_iron_skin"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:iron_skin"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:iron_skin"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:strong_iron_skin"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:strong_iron_skin"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:long_iron_skin"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:long_iron_skin"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:iron_skin"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:iron_skin"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:strong_iron_skin"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:strong_iron_skin"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:long_iron_skin"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:long_iron_skin"}));

//Potion Of Diamond Skin
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:thick"}), <minecraft:diamond_block>, <minecraft:potion>.withTag({Potion: "potioncore:diamond_skin"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:diamond_skin"}), <minecraft:glowstone_dust>, <minecraft:potion>.withTag({Potion: "potioncore:strong_diamond_skin"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:diamond_skin"}), <minecraft:redstone>, <minecraft:potion>.withTag({Potion: "potioncore:long_diamond_skin"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:diamond_skin"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:diamond_skin"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:strong_diamond_skin"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:strong_diamond_skin"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:long_diamond_skin"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:long_diamond_skin"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:diamond_skin"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:diamond_skin"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:strong_diamond_skin"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:strong_diamond_skin"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:long_diamond_skin"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:long_diamond_skin"}));

//Potion Of Spines
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:thick"}), <defiledlands:vilespine>, <minecraft:potion>.withTag({Potion: "potioncore:recoil"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:recoil"}), <minecraft:glowstone_dust>, <minecraft:potion>.withTag({Potion: "potioncore:strong_recoil"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:recoil"}), <minecraft:redstone>, <minecraft:potion>.withTag({Potion: "potioncore:long_recoil"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:recoil"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:recoil"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:strong_recoil"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:strong_recoil"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:long_recoil"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:long_recoil"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:recoil"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:recoil"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:strong_recoil"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:strong_recoil"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:long_recoil"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:long_recoil"}));

//Potion Of Spiders
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:thick"}), <minecraft:web>, <minecraft:potion>.withTag({Potion: "potioncore:climb"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:climb"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:climb"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:climb"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:climb"}));

//Potion Of High Step
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:thick"}), <minecraft:rabbit_foot>, <minecraft:potion>.withTag({Potion: "potioncore:step_up"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:step_up"}), <minecraft:glowstone_dust>, <minecraft:potion>.withTag({Potion: "potioncore:strong_step_up"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:step_up"}), <minecraft:redstone>, <minecraft:potion>.withTag({Potion: "potioncore:long_step_up"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:step_up"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:step_up"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:strong_step_up"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:strong_step_up"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:long_step_up"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:long_step_up"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:step_up"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:step_up"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:strong_step_up"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:strong_step_up"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:long_step_up"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:long_step_up"}));

//Potion Of Immovability
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:thick"}), <advanced-fishing:fish:8>, <minecraft:potion>.withTag({Potion: "potioncore:solid_core"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:solid_core"}), <minecraft:redstone>, <minecraft:potion>.withTag({Potion: "potioncore:long_solid_core"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:solid_core"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:solid_core"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:long_solid_core"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:long_solid_core"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:solid_core"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:solid_core"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:long_solid_core"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:long_solid_core"}));

//Potion Of Cure
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:thick"}), <lycanitesmobs:immunizer>, <minecraft:potion>.withTag({Potion: "potioncore:cure"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:cure"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:cure"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:cure"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:cure"}));

//Potion Of Poison Antitode
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:mundane"}), <lycanitesmobs:immunizer>, <minecraft:potion>.withTag({Potion: "potioncore:antidote"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:antidote"}), <minecraft:redstone>, <minecraft:potion>.withTag({Potion: "potioncore:long_antidote"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:antidote"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:antidote"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:long_antidote"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:long_antidote"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:antidote"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:antidote"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:long_antidote"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:long_antidote"}));

//Potion Of Concussion
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:awkward"}), <defiledlands:blastem_fruit>, <minecraft:potion>.withTag({Potion: "potioncore:burst"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:burst"}), <minecraft:glowstone_dust>, <minecraft:potion>.withTag({Potion: "potioncore:strong_burst"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:burst"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:burst"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:strong_burst"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:strong_burst"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:burst"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:burst"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:strong_burst"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:strong_burst"}));

//Potion Of True Shot
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:thick"}), <minecraft:skull>, <minecraft:potion>.withTag({Potion: "potioncore:archery"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:archery"}), <minecraft:glowstone_dust>, <minecraft:potion>.withTag({Potion: "potioncore:strong_archery"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:archery"}), <minecraft:redstone>, <minecraft:potion>.withTag({Potion: "potioncore:long_archery"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:archery"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:archery"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:strong_archery"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:strong_archery"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:long_archery"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:long_archery"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:archery"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:archery"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:strong_archery"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:strong_archery"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:long_archery"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:long_archery"}));

//Potion Of Fumbling (Klutz)
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:mundane"}), <minecraft:skull>, <minecraft:potion>.withTag({Potion: "potioncore:klutz"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:klutz"}), <minecraft:glowstone_dust>, <minecraft:potion>.withTag({Potion: "potioncore:strong_klutz"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:klutz"}), <minecraft:redstone>, <minecraft:potion>.withTag({Potion: "potioncore:long_klutz"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:klutz"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:klutz"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:strong_klutz"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:strong_klutz"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:long_klutz"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:long_klutz"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:klutz"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:klutz"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:strong_klutz"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:strong_klutz"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:long_klutz"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:long_klutz"}));

//Potion Of Wither Purity
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:thick"}), <minecraft:skull:1>, <minecraft:potion>.withTag({Potion: "potioncore:purity"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:purity"}), <minecraft:redstone>, <minecraft:potion>.withTag({Potion: "potioncore:long_purity"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:purity"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:purity"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:long_purity"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:long_purity"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:purity"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:purity"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:long_purity"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:long_purity"}));

//Potion Of Long Arms
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:thick"}), <quark:crab_leg>, <minecraft:potion>.withTag({Potion: "potioncore:reach"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:reach"}), <minecraft:glowstone_dust>, <minecraft:potion>.withTag({Potion: "potioncore:strong_reach"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:reach"}), <minecraft:redstone>, <minecraft:potion>.withTag({Potion: "potioncore:long_reach"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:reach"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:reach"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:strong_reach"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:strong_reach"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:long_reach"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:long_reach"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:reach"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:reach"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:strong_reach"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:strong_reach"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:long_reach"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:long_reach"}));

//Potion Of Penetration
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:mundane"}), <iceandfire:sea_serpent_fang>, <minecraft:potion>.withTag({Potion: "potioncore:broken_armor"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:broken_armor"}), <minecraft:glowstone_dust>, <minecraft:potion>.withTag({Potion: "potioncore:strong_broken_armor"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:broken_armor"}), <minecraft:redstone>, <minecraft:potion>.withTag({Potion: "potioncore:long_broken_armor"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:broken_armor"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:broken_armor"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:strong_broken_armor"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:strong_broken_armor"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:long_broken_armor"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:long_broken_armor"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:broken_armor"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:broken_armor"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:strong_broken_armor"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:strong_broken_armor"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:long_broken_armor"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:long_broken_armor"}));

//Potion Of Magic Focus
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:thick"}), <iceandfire:fire_dragon_blood>|<iceandfire:ice_dragon_blood>, <minecraft:potion>.withTag({Potion: "potioncore:magic_focus"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:magic_focus"}), <minecraft:glowstone_dust>, <minecraft:potion>.withTag({Potion: "potioncore:strong_magic_focus"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:magic_focus"}), <minecraft:redstone>, <minecraft:potion>.withTag({Potion: "potioncore:long_magic_focus"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:magic_focus"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:magic_focus"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:strong_magic_focus"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:strong_magic_focus"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:long_magic_focus"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:long_magic_focus"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:magic_focus"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:magic_focus"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:strong_magic_focus"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:strong_magic_focus"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:long_magic_focus"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:long_magic_focus"}));

//Potion Of Magic Inhibition
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:mundane"}), <minecraft:fermented_spider_eye>, <minecraft:potion>.withTag({Potion: "potioncore:magic_inhibition"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:magic_inhibition"}), <minecraft:glowstone_dust>, <minecraft:potion>.withTag({Potion: "potioncore:strong_magic_inhibition"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:magic_inhibition"}), <minecraft:redstone>, <minecraft:potion>.withTag({Potion: "potioncore:long_magic_inhibition"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:magic_inhibition"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:magic_inhibition"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:strong_magic_inhibition"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:strong_magic_inhibition"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:long_magic_inhibition"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:long_magic_inhibition"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:magic_inhibition"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:magic_inhibition"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:strong_magic_inhibition"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:strong_magic_inhibition"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:long_magic_inhibition"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:long_magic_inhibition"}));

//Potion Of Vulnerability
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:mundane"}), <minecraft:totem_of_undying>, <minecraft:potion>.withTag({Potion: "potioncore:vulnerable"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:vulnerable"}), <minecraft:glowstone_dust>, <minecraft:potion>.withTag({Potion: "potioncore:strong_vulnerable"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:vulnerable"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:vulnerable"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:strong_vulnerable"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:strong_vulnerable"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:vulnerable"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:vulnerable"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:strong_vulnerable"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:strong_vulnerable"}));

//Potion Of Scattering
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:thick"}), <minecraft:ender_pearl>, <minecraft:potion>.withTag({Potion: "potioncore:teleport"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:teleport"}), <minecraft:glowstone_dust>, <minecraft:potion>.withTag({Potion: "potioncore:strong_teleport"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:teleport"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:teleport"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:strong_teleport"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:strong_teleport"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:teleport"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:teleport"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:strong_teleport"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:strong_teleport"}));

//Potion Of Escape
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:thick"}), <minecraft:ender_eye>, <minecraft:potion>.withTag({Potion: "potioncore:teleport_surface"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "potioncore:teleport_surface"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "potioncore:teleport_surface"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "potioncore:teleport_surface"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "potioncore:teleport_surface"}));

//Potion Of Decay (Better Survival)
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:mundane"}), <iceandfire:witherbone>, <minecraft:potion>.withTag({Potion: "mujmajnkraftsbettersurvival:decay"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "mujmajnkraftsbettersurvival:decay"}), <minecraft:glowstone_dust>, <minecraft:potion>.withTag({Potion: "mujmajnkraftsbettersurvival:strong_decay"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "mujmajnkraftsbettersurvival:decay"}), <minecraft:redstone>, <minecraft:potion>.withTag({Potion: "mujmajnkraftsbettersurvival:long_decay"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "mujmajnkraftsbettersurvival:decay"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "mujmajnkraftsbettersurvival:decay"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "mujmajnkraftsbettersurvival:strong_decay"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "mujmajnkraftsbettersurvival:strong_decay"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "mujmajnkraftsbettersurvival:long_decay"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "mujmajnkraftsbettersurvival:long_decay"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "mujmajnkraftsbettersurvival:decay"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "mujmajnkraftsbettersurvival:decay"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "mujmajnkraftsbettersurvival:strong_decay"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "mujmajnkraftsbettersurvival:strong_decay"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "mujmajnkraftsbettersurvival:long_decay"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "mujmajnkraftsbettersurvival:long_decay"}));

//Potion Of Heat Resist
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:mundane"}), <minecraft:blaze_powder>, <minecraft:potion>.withTag({Potion: "simpledifficulty:heat_resist_type"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "simpledifficulty:heat_resist_type"}), <minecraft:redstone>, <minecraft:potion>.withTag({Potion: "simpledifficulty:long_heat_resist_type"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "simpledifficulty:heat_resist_type"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "simpledifficulty:heat_resist_type"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "simpledifficulty:long_heat_resist_type"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "simpledifficulty:long_heat_resist_type"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "simpledifficulty:heat_resist_type"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "simpledifficulty:heat_resist_type"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "simpledifficulty:long_heat_resist_type"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "simpledifficulty:long_heat_resist_type"}));

//Potion Of Cold Resist
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:mundane"}), <simpledifficulty:frost_powder>, <minecraft:potion>.withTag({Potion: "simpledifficulty:cold_resist_type"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "simpledifficulty:cold_resist_type"}), <minecraft:redstone>, <minecraft:potion>.withTag({Potion: "simpledifficulty:long_cold_resist_type"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "simpledifficulty:cold_resist_type"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "simpledifficulty:cold_resist_type"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "simpledifficulty:long_cold_resist_type"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "simpledifficulty:long_cold_resist_type"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "simpledifficulty:cold_resist_type"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "simpledifficulty:cold_resist_type"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "simpledifficulty:long_cold_resist_type"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "simpledifficulty:long_cold_resist_type"}));

/*

Potion of Extension = 

Potion of Gills = 

Potion of Inversion????????
Potion of Dispel?? anti blight weapon

Potion of Magic Shielding = 
Potion of Broken Magic Shielding = 

*/

recipes.addShapeless("lolarecipe1",<antiqueatlas:empty_antique_atlas>,[<minecraft:writable_book>,<minecraft:compass>]);

recipes.addShapeless("lolarecipe2",<roughtweaks:salve>,[<minecraft:bowl>,<rustic:aloe_vera>,<minecraft:red_flower:*>,<minecraft:yellow_flower>]);

recipes.addShapeless("lolarecipe3",<roughtweaks:salve>,[<minecraft:bowl>,<rustic:aloe_vera>,<minecraft:cactus>]);

recipes.addShapeless("lolarecipe4",<roughtweaks:salve>,[<minecraft:bowl>,<rustic:aloe_vera>,<minecraft:vine>]);

recipes.addShapeless("lolarecipe5",<roughtweaks:plaster>,[<roughtweaks:salve>|<rustic:aloe_vera>,<ore:string>,<minecraft:paper>]);

recipes.addShaped("lolarecipe6",<roughtweaks:bandage>,
 [[null,null,null],
  [<ore:string>,<minecraft:wool:*>,<ore:string>],
  [null,<roughtweaks:salve>|<rustic:aloe_vera>,null]]);

recipes.addShaped("lolarecipe7",<minecraft:golden_apple:1>,
 [[<minecraft:gold_block>,<minecraft:gold_block>,<minecraft:gold_block>],
  [<minecraft:gold_block>,<minecraft:apple>,<minecraft:gold_block>],
  [<minecraft:gold_block>,<minecraft:gold_block>,<minecraft:gold_block>]]);

recipes.addShapeless("lolarecipe8",<minecraft:string>*4,[<minecraft:wool:*>]);

//recipes.addShaped("lolarecipe9",<minecraft:packed_ice>,
// [[<toughasnails:ice_cube>,<toughasnails:ice_cube>,<toughasnails:ice_cube>],
//  [<toughasnails:ice_cube>,<toughasnails:ice_cube>,<toughasnails:ice_cube>],
//  [<toughasnails:ice_cube>,<toughasnails:ice_cube>,<toughasnails:ice_cube>]]);

recipes.addShapeless("lolarecipe10",<firstaid:plaster>,[<ore:string>,<minecraft:paper>]);

recipes.addShaped("lolarecipe11",<firstaid:bandage>*2,
 [[<ore:string>,<minecraft:wool:*>,<ore:string>]]);

recipes.addShaped("lolarecipe12",<mujmajnkraftsbettersurvival:itemwooddagger>,
 [[null,<minecraft:planks:*>],
  [<minecraft:stick>]]);

recipes.addShaped("lolarecipe13",<mujmajnkraftsbettersurvival:itemstonedagger>,
 [[null,<ore:cobblestone>],
  [<minecraft:stick>]]);

recipes.addShaped("lolarecipe14",<mujmajnkraftsbettersurvival:itemgolddagger>,
 [[null,<minecraft:gold_ingot>],
  [<minecraft:stick>]]);

recipes.addShaped("lolarecipe15",<mujmajnkraftsbettersurvival:itemirondagger>,
 [[null,<minecraft:iron_ingot>],
  [<minecraft:stick>]]);

recipes.addShaped("lolarecipe16",<mujmajnkraftsbettersurvival:itemdiamonddagger>,
 [[null,<minecraft:diamond>],
  [<minecraft:stick>]]);
  
recipes.addShaped("lolarecipe16again",<mujmajnkraftsbettersurvival:itemsilverdagger>,
 [[null,<iceandfire:silver_ingot>],
  [<minecraft:stick>]]);
  
recipes.addShaped("lolarecipe16againagain",<mujmajnkraftsbettersurvival:itembronzedagger>,
 [[null,<variedcommodities:ingot_bronze>],
  [<minecraft:stick>]]);

recipes.addShaped("lolarecipe16dragonbonedagger",<mujmajnkraftsbettersurvival:itemdragonbonedagger>,
 [[null,<iceandfire:dragonbone>],
  [<iceandfire:witherbone>]]);

recipes.addShaped("lolarecipe16junglemyrmexdagger",<mujmajnkraftsbettersurvival:itemjunglechitindagger>,
 [[null,<iceandfire:myrmex_jungle_chitin>],
  [<iceandfire:witherbone>]]);

recipes.addShaped("lolarecipe16desertmyrmexdagger",<mujmajnkraftsbettersurvival:itemdesertchitindagger>,
 [[null,<iceandfire:myrmex_desert_chitin>],
  [<iceandfire:witherbone>]]);

recipes.addShaped("lolarecipe17",<mujmajnkraftsbettersurvival:itemstonespear>*4,
 [[null,null,<ore:cobblestone>],
  [null,<minecraft:stick>,null],
  [<minecraft:stick>,null,null]]);

recipes.addShaped("lolarecipe18",<mujmajnkraftsbettersurvival:itemstonebattleaxe>,
 [[null,<ore:cobblestone>,<ore:cobblestone>],
  [<minecraft:stick>,<minecraft:stick>,<ore:cobblestone>],
  [null,<ore:cobblestone>,<ore:cobblestone>]]);
  
recipes.addShaped("lolarecipe19",<mujmajnkraftsbettersurvival:itemstonenunchaku>,
 [[null,null,null],
  [null,<ore:string>,null],
  [<ore:cobblestone>,null,<ore:cobblestone>]]);
  
recipes.addShaped("lolarecipe20",<mujmajnkraftsbettersurvival:itemstonehammer>,
 [[null,<ore:cobblestone>,<ore:cobblestone>],
  [<minecraft:stick>,<ore:cobblestone>,<ore:cobblestone>],
  [null,<ore:cobblestone>,<ore:cobblestone>]]);

//recipes.addShapeless("lolarecipe21",<minecraft:paper>*3,[<minecraft:log:2>]);

recipes.addShapeless("lolarecipe21test",<minecraft:paper>*4,[<minecraft:log:2>,<minecraft:log:2>]);

recipes.addShaped("lolarecipe22",<qualitytools:emerald_ring>,
 [[null,<minecraft:emerald>,null],
  [<minecraft:gold_ingot>,null,<minecraft:gold_ingot>],
  [null,<minecraft:gold_ingot>,null]]);
  
recipes.addShaped("lolarecipe23",<qualitytools:emerald_amulet>,
 [[<minecraft:gold_ingot>,<minecraft:gold_ingot>,<minecraft:gold_ingot>],
  [<minecraft:gold_ingot>,null,<minecraft:gold_ingot>],
  [null,<minecraft:emerald>,null]]);
  
recipes.addShaped("lolarecipe25",<xat:wither_ring>,
 [[<xat:glowing_ingot>,<variedcommodities:ingot_steel>,<xat:glowing_ingot>],
  [<variedcommodities:ingot_steel>,<minecraft:skull:1>|<iceandfire:dragon_skull:1>,<variedcommodities:ingot_steel>],
  [<xat:glowing_ingot>,<variedcommodities:ingot_steel>,<xat:glowing_ingot>]]);

recipes.addShaped("lolarecipe25a",<xat:poison_stone>,
 [[<xat:glowing_ingot>,<minecraft:fermented_spider_eye>,<xat:glowing_ingot>],
  [<minecraft:fermented_spider_eye>,<bountifulbaubles:trinketbezoar>,<minecraft:fermented_spider_eye>],
  [<xat:glowing_ingot>,<minecraft:fermented_spider_eye>,<xat:glowing_ingot>]]);

recipes.addShaped("lolarecipe25b",<xat:sea_stone>,
 [[<minecraft:prismarine_crystals>,<xat:glowing_ingot>,<minecraft:prismarine_crystals>],
  [<xat:glowing_ingot>,<aquaculture:loot:1>,<xat:glowing_ingot>],
  [<minecraft:prismarine_crystals>,<xat:glowing_ingot>,<minecraft:prismarine_crystals>]]);
  
//recipes.addShaped("lolarecipe26",<campfire:campfire>,
// [[null,<realistictorches:matchbox>.anyDamage().transformDamage(),null],
//  [null,<ore:plankWood>,null],
//  [<ore:plankWood>,<ore:plankWood>,<ore:plankWood>]]);
  
recipes.addShaped("lolarecipe27",<bountifulbaubles:crowngold>,
 [[null,<defiledlands:scarlite>,null],
  [<minecraft:gold_ingot>,<minecraft:gold_ingot>,<minecraft:gold_ingot>],
  [<minecraft:gold_ingot>,null,<minecraft:gold_ingot>]]);
  
recipes.addShaped("lolarecipe28",<wolfarmor:chainmail_wolf_armor>,
 [[null,<minecraft:chainmail_helmet>,null],
  [<craftablechainmail:chainmail_plate>,<minecraft:chainmail_boots>,<craftablechainmail:chainmail_plate>],
  [null,<minecraft:chainmail_boots>,null]]);
  
recipes.addShapeless("z29",<minecraft:leather>*7,[<wolfarmor:leather_wolf_armor>]);
  
recipes.addShaped("lolarecipe29",<scalinghealth:crystalshard>,
 [[<scalinghealth:heartdust>,<scalinghealth:heartdust>,<scalinghealth:heartdust>],
  [<scalinghealth:heartdust>,<scalinghealth:heartdust>,<scalinghealth:heartdust>],
  [<scalinghealth:heartdust>,<scalinghealth:heartdust>,<scalinghealth:heartdust>]]);

recipes.addShaped("lolarecipe30",<bountifulbaubles:amuletsinempty>,
 [[<bountifulbaubles:spectralsilt>,<ore:string>,<bountifulbaubles:spectralsilt>],
  [<bountifulbaubles:spectralsilt>,<iceandfire:silver_ingot>,<bountifulbaubles:spectralsilt>],
  [<bountifulbaubles:spectralsilt>,<bountifulbaubles:spectralsilt>,<bountifulbaubles:spectralsilt>]]);
  
//recipes.addShapeless("lolarecipe31",<bountifulbaubles:spectralsilt>,[<bountifulbaubles:disintegrationtablet>,<minecraft:diamond_block>]);

//recipes.addShapeless("lolarecipe32",<bountifulbaubles:spectralsilt>,[<bountifulbaubles:disintegrationtablet>,<minecraft:emerald_block>]);

recipes.addShapeless("lolarecipe31x",<bountifulbaubles:spectralsilt>,[<bountifulbaubles:disintegrationtablet>,<bountifulbaubles:phantomprism>]);

recipes.addShapeless("lolarecipe31y",<bountifulbaubles:spectralsilt>,[<bountifulbaubles:disintegrationtablet>,<bountifulbaubles:trinketbezoar>]);

recipes.addShapeless("lolarecipe31z",<bountifulbaubles:spectralsilt>,[<bountifulbaubles:disintegrationtablet>,<bountifulbaubles:trinketvitamins>]);

recipes.addShapeless("lolarecipe31a",<bountifulbaubles:spectralsilt>,[<bountifulbaubles:disintegrationtablet>,<bountifulbaubles:trinketapple>]);

recipes.addShapeless("lolarecipe31s",<bountifulbaubles:spectralsilt>,[<bountifulbaubles:disintegrationtablet>,<bountifulbaubles:ringoverclocking>]);

recipes.addShapeless("lolarecipe31d",<bountifulbaubles:spectralsilt>,[<bountifulbaubles:disintegrationtablet>,<bountifulbaubles:ringfreeaction>]);

recipes.addShapeless("lolarecipe31f",<bountifulbaubles:spectralsilt>,[<bountifulbaubles:disintegrationtablet>,<bountifulbaubles:enderdragonscale>]);

recipes.addShapeless("lolarecipe31g",<bountifulbaubles:spectralsilt>,[<bountifulbaubles:disintegrationtablet>,<bountifulbaubles:trinketblackdragonscale>]);

recipes.addShapeless("lolarecipe31h",<bountifulbaubles:spectralsilt>,[<bountifulbaubles:disintegrationtablet>,<bountifulbaubles:trinketmixeddragonscale>]);

recipes.addShapeless("lolarecipe31j",<bountifulbaubles:spectralsilt>,[<bountifulbaubles:disintegrationtablet>,<bountifulbaubles:trinketankhcharm>]);

recipes.addShapeless("lolarecipe31k",<bountifulbaubles:spectralsilt>,[<bountifulbaubles:disintegrationtablet>,<bountifulbaubles:amuletsingluttony>]);

recipes.addShapeless("lolarecipe31l",<bountifulbaubles:spectralsilt>,[<bountifulbaubles:disintegrationtablet>,<bountifulbaubles:amuletsinpride>]);

recipes.addShapeless("lolarecipe31q",<bountifulbaubles:spectralsilt>,[<bountifulbaubles:disintegrationtablet>,<bountifulbaubles:amuletsinwrath>]);

recipes.addShapeless("lolarecipe31e",<bountifulbaubles:spectralsilt>,[<bountifulbaubles:disintegrationtablet>,<bountifulbaubles:trinketobsidianskull>]);

recipes.addShapeless("lolarecipe31w",<bountifulbaubles:spectralsilt>,[<bountifulbaubles:disintegrationtablet>,<quark:rune:16>]);

//recipes.addShaped("lolarecipe33",<advanced-fishing:blazing_fishing_pole>,
// [[null,null,<minecraft:blaze_rod>],
//  [null,<minecraft:blaze_rod>,<ore:string>],
//  [<minecraft:blaze_rod>,<minecraft:magma_cream>,<ore:string>]]);

recipes.addShaped("lolarecipe33carrotstick",<minecraft:carrot_on_a_stick>,
 [[null,null,<minecraft:stick>],
  [null,<minecraft:stick>,<ore:string>],
  [<minecraft:stick>,<minecraft:carrot>,<ore:string>]]);

recipes.addShapeless("lolarecipe33new",<fishingmadebetter:bobber_obsidian>,[<advanced-fishing:blazing_fishing_pole:*>]);
  
recipes.addShapeless("lolarecipe35",<armorunder:auto_chestplate_liner>,[<armorunder:warm_chestplate_liner>,<armorunder:cool_chestplate_liner>]);

recipes.addShapeless("lolarecipe36",<armorunder:auto_leggings_liner>,[<armorunder:warm_leggings_liner>,<armorunder:cool_leggings_liner>]);

recipes.addShaped("lolarecipe37",<minecraft:web>,
 [[<ore:string>,<ore:string>,<ore:string>],
  [<ore:string>,<ore:string>,<ore:string>],
  [<ore:string>,<ore:string>,<ore:string>]]);
  
recipes.addShaped("lolarecipe38",<sereneseasons:greenhouse_glass>*4,
 [[<ore:dyeCyan>,<ore:blockGlass>,<ore:dyeCyan>],
  [<ore:blockGlass>,<ore:plankWood>,<ore:blockGlass>],
  [<ore:dyeCyan>,<ore:blockGlass>,<ore:dyeCyan>]]);
  
recipes.addShapeless("lolarecipe39",<realistictorches:torch_lit>,[<realistictorches:torch_unlit>,<minecraft:flint_and_steel>.anyDamage().transformDamage()]);

recipes.addShapeless("lolarecipe40",<armorunder:flipflop_liner_material>,[<armorunder:warm_liner_material>,<armorunder:cool_liner_material>]);

recipes.addShaped("lolarecipe41",<armorunder:auto_chestplate_liner>,
 [[<armorunder:flipflop_liner_material>,null,<armorunder:flipflop_liner_material>],
  [<armorunder:flipflop_liner_material>,<armorunder:flipflop_liner_material>,<armorunder:flipflop_liner_material>],
  [<armorunder:flipflop_liner_material>,<armorunder:flipflop_liner_material>,<armorunder:flipflop_liner_material>]]);
  
recipes.addShaped("lolarecipe42",<armorunder:auto_leggings_liner>,
 [[<armorunder:flipflop_liner_material>,<armorunder:flipflop_liner_material>,<armorunder:flipflop_liner_material>],
  [<armorunder:flipflop_liner_material>,null,<armorunder:flipflop_liner_material>],
  [<armorunder:flipflop_liner_material>,null,<armorunder:flipflop_liner_material>]]);
  
recipes.addShaped("lolarecipe43",<waystones:waystone>,
 [[null,<minecraft:stonebrick>,null],
  [<minecraft:stonebrick>,<minecraft:nether_star>,<minecraft:stonebrick>],
  [<minecraft:obsidian>,<minecraft:obsidian>,<minecraft:obsidian>]]);
  
recipes.addShaped("lolarecipe44",<minecraft:diamond>,
 [[<variedcommodities:coin_diamond>,<variedcommodities:coin_diamond>,<variedcommodities:coin_diamond>],
  [<variedcommodities:coin_diamond>,<variedcommodities:coin_diamond>,<variedcommodities:coin_diamond>],
  [<variedcommodities:coin_diamond>,<variedcommodities:coin_diamond>,<variedcommodities:coin_diamond>]]);
  
recipes.addShapeless("lolarecipe45",<variedcommodities:coin_diamond> * 9,[<minecraft:diamond>]);

recipes.addShaped("lolarecipe44b",<variedcommodities:ingot_bronze>,
 [[<variedcommodities:coin_bronze>,<variedcommodities:coin_bronze>,<variedcommodities:coin_bronze>],
  [<variedcommodities:coin_bronze>,<variedcommodities:coin_bronze>,<variedcommodities:coin_bronze>],
  [<variedcommodities:coin_bronze>,<variedcommodities:coin_bronze>,<variedcommodities:coin_bronze>]]);
  
recipes.addShapeless("lolarecipe45b",<variedcommodities:coin_bronze> * 9,[<variedcommodities:ingot_bronze>]);

recipes.addShaped("lolarecipe40fak",<variedcommodities:ingot_steel>,
 [[<contenttweaker:steel_nugget>,<contenttweaker:steel_nugget>,<contenttweaker:steel_nugget>],
  [<contenttweaker:steel_nugget>,<contenttweaker:steel_nugget>,<contenttweaker:steel_nugget>],
  [<contenttweaker:steel_nugget>,<contenttweaker:steel_nugget>,<contenttweaker:steel_nugget>]]);
  
recipes.addShapeless("lolarecipe40fac",<contenttweaker:steel_nugget> * 9,[<variedcommodities:ingot_steel>]);

recipes.addShaped("lolarecipe40frick",<aquaculture:loot:1>,
 [[<contenttweaker:neptunium_nugget>,<contenttweaker:neptunium_nugget>,<contenttweaker:neptunium_nugget>],
  [<contenttweaker:neptunium_nugget>,<contenttweaker:neptunium_nugget>,<contenttweaker:neptunium_nugget>],
  [<contenttweaker:neptunium_nugget>,<contenttweaker:neptunium_nugget>,<contenttweaker:neptunium_nugget>]]);

recipes.addShapeless("lolarecipe40frack",<contenttweaker:neptunium_nugget> * 9,[<aquaculture:loot:1>]);

recipes.addShaped("lolarecipe46",<potionfingers:ring:1>.withTag({Quality: {}, effect: "minecraft:speed"}),
 [[<minecraft:redstone_block>, <minecraft:sugar>, null],
  [<minecraft:sugar>, <potionfingers:ring>, <minecraft:sugar>],
  [null, <minecraft:sugar>, null]]);
  
recipes.addShaped("lolarecipe47",<potionfingers:ring:1>.withTag({Quality: {}, effect: "minecraft:jump_boost"}),
 [[<minecraft:slime>, <minecraft:rabbit_foot>, null],
  [<minecraft:rabbit_foot>, <potionfingers:ring>, <minecraft:rabbit_foot>],
  [null, <minecraft:rabbit_foot>, null]]);

recipes.addShaped("lolarecipe48",<potionfingers:ring:1>.withTag({Quality: {}, effect: "minecraft:haste"}),
 [[<minecraft:prismarine:0>, <minecraft:prismarine_crystals>, null],
  [<minecraft:prismarine_crystals>, <potionfingers:ring>, <minecraft:prismarine_crystals>],
  [null, <minecraft:prismarine_crystals>, null]]);

recipes.addShaped("lolarecipe49",<potionfingers:ring:1>.withTag({Quality: {}, effect: "minecraft:strength"}),
 [[<minecraft:magma>, <minecraft:blaze_powder>, null],
  [<minecraft:blaze_powder>, <potionfingers:ring>, <minecraft:blaze_powder>],
  [null, <minecraft:blaze_powder>, null]]);

recipes.addShaped("lolarecipe50",<potionfingers:ring:1>.withTag({Quality: {}, effect: "minecraft:regeneration"}),
 [[<minecraft:nether_star>, <minecraft:ghast_tear>, null],
  [<minecraft:ghast_tear>, <potionfingers:ring>, <minecraft:ghast_tear>],
  [null, <minecraft:ghast_tear>, null]]);

recipes.addShaped("lolarecipe51",<potionfingers:ring:1>.withTag({Quality: {}, effect: "minecraft:resistance"}),
 [[<quark:diamond_heart>, <minecraft:diamond>, null],
  [<minecraft:diamond>, <potionfingers:ring>, <minecraft:diamond>],
  [null, <minecraft:diamond>, null]]);

//recipes.addShaped("lolarecipe51iron",<potionfingers:ring:1>.withTag({Quality: {}, effect: "potioncore:iron_skin"}),
// [[<betternether:cincinnasite_lantern>, <variedcommodities:ingot_steel>, null],
//  [<variedcommodities:ingot_steel>, <potionfingers:ring>, <variedcommodities:ingot_steel>],
//  [null, <variedcommodities:ingot_steel>, null]]);

//recipes.addShaped("lolarecipe51diamond",<potionfingers:ring:1>.withTag({Quality: {}, effect: "potioncore:diamond_skin"}),
// [[<quark:diamond_heart>, <minecraft:diamond>, null],
//  [<minecraft:diamond>, <potionfingers:ring>, <minecraft:diamond>],
//  [null, <minecraft:diamond>, null]]);
  
recipes.addShaped("lolaskirt52leather",<variedcommodities:leather_skirt>,
 [[<minecraft:leather>,<ore:string>,<minecraft:leather>],
  [<minecraft:leather>,null,<minecraft:leather>],
  [<minecraft:leather>,<minecraft:leather>,<minecraft:leather>]]);

recipes.addShaped("lolarecipe52",<variedcommodities:chain_skirt>,
 [[<craftablechainmail:chainmail_plate>,<ore:string>,<craftablechainmail:chainmail_plate>],
  [<craftablechainmail:chainmail_plate>,null,<craftablechainmail:chainmail_plate>],
  [<craftablechainmail:chainmail_plate>,<craftablechainmail:chainmail_plate>,<craftablechainmail:chainmail_plate>]]);
  
recipes.addShaped("lolarecipe53",<variedcommodities:golden_skirt>,
 [[<minecraft:gold_ingot>,<ore:string>,<minecraft:gold_ingot>],
  [<minecraft:gold_ingot>,null,<minecraft:gold_ingot>],
  [<minecraft:gold_ingot>,<minecraft:gold_ingot>,<minecraft:gold_ingot>]]);
  
recipes.addShaped("lolarecipe54",<variedcommodities:iron_skirt>,
 [[<minecraft:iron_ingot>,<ore:string>,<minecraft:iron_ingot>],
  [<minecraft:iron_ingot>,null,<minecraft:iron_ingot>],
  [<minecraft:iron_ingot>,<minecraft:iron_ingot>,<minecraft:iron_ingot>]]);
  
recipes.addShaped("lolarecipe55",<variedcommodities:diamond_skirt>,
 [[<minecraft:diamond>,<ore:string>,<minecraft:diamond>],
  [<minecraft:diamond>,null,<minecraft:diamond>],
  [<minecraft:diamond>,<minecraft:diamond>,<minecraft:diamond>]]);
  
recipes.addShaped("lolarecipe56",<xat:glowing_ingot>,
 [[<minecraft:glowstone_dust>,<minecraft:blaze_powder>,<minecraft:glowstone_dust>],
  [<minecraft:blaze_powder>,<iceandfire:silver_ingot>,<minecraft:blaze_powder>],
  [<minecraft:glowstone_dust>,<minecraft:blaze_powder>,<minecraft:glowstone_dust>]]);
  
recipes.addShaped("lolarecipe57",<xat:glowing_ingot>,
 [[<xat:glowing_powder>,<xat:glowing_powder>],
  [<xat:glowing_powder>,<xat:glowing_powder>]]);

recipes.addShapeless("lolarecipe59",<variedcommodities:trading_block>,[<minecraft:crafting_table>,<minecraft:crafting_table>]);

recipes.addShaped("lolarecipe60",<xat:damage_shield>,
 [[<xat:glowing_gem>,<quark:biotite>,<xat:glowing_gem>],
  [<quark:biotite>,<minecraft:dragon_egg>|<iceandfire:dragonegg_red>|<iceandfire:dragonegg_green>|<iceandfire:dragonegg_bronze>|<iceandfire:dragonegg_gray>|<iceandfire:dragonegg_blue>|<iceandfire:dragonegg_white>|<iceandfire:dragonegg_sapphire>|<iceandfire:dragonegg_silver>,<quark:biotite>],
  [<xat:glowing_gem>,<quark:biotite>,<xat:glowing_gem>]]);
  
recipes.addShaped("lolarecipe61",<bountifulbaubles:spectralsilt>,
 [[<bountifulbaubles:flare_red>,<bountifulbaubles:flare_red>,<bountifulbaubles:flare_red>],
  [<bountifulbaubles:flare_red>,<bountifulbaubles:disintegrationtablet>,<bountifulbaubles:flare_red>],
  [<bountifulbaubles:flare_red>,<bountifulbaubles:flare_red>,<bountifulbaubles:flare_red>]]);
  
recipes.addShaped("lolarecipe62",<minecraft:sandstone>,
 [[<notreepunching:rock/sandstone>,<notreepunching:rock/sandstone>],
  [<notreepunching:rock/sandstone>,<notreepunching:rock/sandstone>]]);
  
recipes.addShaped("lolarecipe63",<minecraft:red_sandstone>,
 [[<notreepunching:rock/red_sandstone>,<notreepunching:rock/red_sandstone>],
  [<notreepunching:rock/red_sandstone>,<notreepunching:rock/red_sandstone>]]);

recipes.addShaped("lolarecipe65",<quark:leaf_carpet:7>*2,
 [[<quark:variant_leaves:1>,<quark:variant_leaves:1>]]);

recipes.addShaped("lolarecipe66",<mujmajnkraftsbettersurvival:itemdragonbonenunchaku>,
 [[null,<quark:chain>,null],
  [<iceandfire:dragonbone>,null,<iceandfire:dragonbone>]]);

recipes.addShaped("lolarecipe67",<mujmajnkraftsbettersurvival:itemjunglechitinnunchaku>,
 [[null,<quark:chain>,null],
  [<iceandfire:myrmex_jungle_chitin>,null,<iceandfire:myrmex_jungle_chitin>]]);

recipes.addShaped("lolarecipe68",<mujmajnkraftsbettersurvival:itemdesertchitinnunchaku>,
 [[null,<quark:chain>,null],
  [<iceandfire:myrmex_desert_chitin>,null,<iceandfire:myrmex_desert_chitin>]]);

recipes.addShaped("lolarecipe69",<iceandfire:earplugs>,
 [[<minecraft:wooden_button>|<quark:spruce_button>|<quark:birch_button>|<quark:jungle_button>|<quark:acacia_button>|<quark:dark_oak_button>,<minecraft:wooden_button>|<quark:spruce_button>|<quark:birch_button>|<quark:jungle_button>|<quark:acacia_button>|<quark:dark_oak_button>]]);

recipes.addShapeless("lolarecipe69lmao",<minecraft:wooden_button>,[<traverse:fir_planks>|<defiledlands:tenebra_planks>|<rustic:planks:0>|<rustic:planks:1>]);

recipes.addShaped("lolarecipe70",<simpledifficulty:heater>,
 [[<minecraft:blaze_rod>,null,<minecraft:blaze_rod>],
  [<minecraft:blaze_rod>,<ore:cobblestone>,<minecraft:blaze_rod>],
  [<ore:cobblestone>,<minecraft:redstone>,<ore:cobblestone>]]);

recipes.addShaped("lolarecipe71",<simpledifficulty:chiller>,
 [[<simpledifficulty:frost_rod>,null,<simpledifficulty:frost_rod>],
  [<simpledifficulty:frost_rod>,<ore:cobblestone>,<simpledifficulty:frost_rod>],
  [<ore:cobblestone>,<minecraft:redstone>,<ore:cobblestone>]]);

recipes.addShaped("lolarecipe71a",<simpledifficulty:spit>,
 [[<minecraft:iron_ingot>,<minecraft:iron_ingot>,<minecraft:iron_ingot>],
  [<minecraft:stick>,null,<minecraft:stick>],
  [<minecraft:stick>,null,<minecraft:stick>]]);
  
recipes.addShaped("lolarecipe71b",<simpledifficulty:campfire>,
 [[null,<ore:logWood>,null],
  [<ore:logWood>,<ore:logWood>,<ore:logWood>],
  [<ore:cobblestone>,<ore:cobblestone>,<ore:cobblestone>]]);

recipes.addShaped("lolarecipe72",<lycanitesmobs:soulcubedemonic>,
 [[<lycanitesmobs:demonstone>,<quark:biotite>,<lycanitesmobs:demonstone>],
  [<quark:biotite>,<lycanitesmobs:soulstone_demon>,<quark:biotite>],
  [<lycanitesmobs:demonstone>,<quark:biotite>,<lycanitesmobs:demonstone>]]);

recipes.addShaped("lolarecipe73",<lycanitesmobs:soulcubeaberrant>,
 [[<lycanitesmobs:aberrantstone>,<variedcommodities:heart>,<lycanitesmobs:aberrantstone>],
  [<variedcommodities:heart>,<lycanitesmobs:soulstone_aberration>,<variedcommodities:heart>],
  [<lycanitesmobs:aberrantstone>,<variedcommodities:heart>,<lycanitesmobs:aberrantstone>]]);

recipes.addShaped("lolarecipe74",<lycanitesmobs:soulcubeundead>,
 [[<lycanitesmobs:shadowstone>,<variedcommodities:skull>,<lycanitesmobs:shadowstone>],
  [<variedcommodities:skull>,<lycanitesmobs:soulstone_undead>,<variedcommodities:skull>],
  [<lycanitesmobs:shadowstone>,<variedcommodities:skull>,<lycanitesmobs:shadowstone>]]);

recipes.addShaped("lolarecipe75",<spartanweaponry:arrow_wood>*4,
 [[<ore:plankWood>],
  [<minecraft:stick>],
  [<minecraft:paper>]]);

recipes.addShaped("lolarecipe76",<simpledifficulty:dragon_canteen>,
 [[<iceandfire:dragon_skull:0>|<iceandfire:dragon_skull:1>],
  [<simpledifficulty:iron_canteen:*>],
  [<iceandfire:fire_dragon_heart>|<iceandfire:ice_dragon_heart>]]);

recipes.addShaped("lolarecipe77",<quark:iron_plate>*8,
 [[<minecraft:iron_ingot>,<minecraft:iron_ingot>,<minecraft:iron_ingot>],
  [<minecraft:iron_ingot>,null,<minecraft:iron_ingot>],
  [<minecraft:iron_ingot>,<minecraft:iron_ingot>,<minecraft:iron_ingot>]]);

recipes.addShaped("lolarecipe78",<quark:iron_plate:1>*8,
 [[<quark:iron_plate>,<quark:iron_plate>,<quark:iron_plate>],
  [<quark:iron_plate>,<minecraft:water_bucket>,<quark:iron_plate>],
  [<quark:iron_plate>,<quark:iron_plate>,<quark:iron_plate>]]);

recipes.addShaped("lolarecipe79",<waystones:warp_stone>,
 [[<quark:rune:10>,<forgottenitems:ender_gem>,<quark:rune:10>],
  [<forgottenitems:ender_gem>,<forgottenitems:ender_talisman>,<forgottenitems:ender_gem>],
  [<quark:rune:10>,<forgottenitems:ender_gem>,<quark:rune:10>]]);

recipes.addShaped("lolarecipe80",<variedcommodities:pedestal:0>,
 [[null,null,null],
  [<minecraft:log:0>,null,<minecraft:log:0>],
  [<minecraft:log:0>,<minecraft:log:0>,<minecraft:log:0>]]);

recipes.addShaped("lolarecipe81",<variedcommodities:pedestal:1>,
 [[null,null,null],
  [<minecraft:stone:0>,null,<minecraft:stone:0>],
  [<minecraft:stone:0>,<minecraft:stone:0>,<minecraft:stone:0>]]);

recipes.addShaped("lolarecipe82",<variedcommodities:pedestal:2>,
 [[null,null,null],
  [<minecraft:iron_block>,null,<minecraft:iron_block>],
  [<minecraft:iron_block>,<minecraft:iron_block>,<minecraft:iron_block>]]);

recipes.addShaped("lolarecipe83",<variedcommodities:pedestal:3>,
 [[null,null,null],
  [<minecraft:gold_block>,null,<minecraft:gold_block>],
  [<minecraft:gold_block>,<minecraft:gold_block>,<minecraft:gold_block>]]);

recipes.addShaped("lolarecipe84",<variedcommodities:pedestal:4>,
 [[null,null,null],
  [<minecraft:diamond_block>,null,<minecraft:diamond_block>],
  [<minecraft:diamond_block>,<minecraft:diamond_block>,<minecraft:diamond_block>]]);

recipes.addShaped("lolarecipe85",<armorunder:cooling_goo>*2,
 [[<simpledifficulty:frost_powder>,<minecraft:slime_ball>],
  [<minecraft:slime_ball>,null]]);

recipes.addShaped("lolarecipe86",<armorunder:heating_goo>*2,
 [[<minecraft:blaze_powder>,<minecraft:slime_ball>],
  [<minecraft:slime_ball>,null]]);

recipes.addShapeless("lolarecipe87",<contenttweaker:steel_alloy>,[<minecraft:coal>|<minecraft:coal:1>,<betternether:cincinnasite>,<minecraft:iron_ingot>]);

recipes.addShaped("lolarecipe88a",<charm:crate>,
 [[<variedcommodities:ingot_steel>,<minecraft:planks>,<variedcommodities:ingot_steel>],
  [<minecraft:planks>,null,<minecraft:planks>],
  [<variedcommodities:ingot_steel>,<minecraft:planks>,<variedcommodities:ingot_steel>]]);

recipes.addShaped("lolarecipe88b",<charm:crate:1>,
 [[<variedcommodities:ingot_steel>,<minecraft:planks:1>,<variedcommodities:ingot_steel>],
  [<minecraft:planks:1>,null,<minecraft:planks:1>],
  [<variedcommodities:ingot_steel>,<minecraft:planks:1>,<variedcommodities:ingot_steel>]]);

recipes.addShaped("lolarecipe88c",<charm:crate:2>,
 [[<variedcommodities:ingot_steel>,<minecraft:planks:2>,<variedcommodities:ingot_steel>],
  [<minecraft:planks:2>,null,<minecraft:planks:2>],
  [<variedcommodities:ingot_steel>,<minecraft:planks:2>,<variedcommodities:ingot_steel>]]);

recipes.addShaped("lolarecipe88d",<charm:crate:3>,
 [[<variedcommodities:ingot_steel>,<minecraft:planks:3>,<variedcommodities:ingot_steel>],
  [<minecraft:planks:3>,null,<minecraft:planks:3>],
  [<variedcommodities:ingot_steel>,<minecraft:planks:3>,<variedcommodities:ingot_steel>]]);

recipes.addShaped("lolarecipe88e",<charm:crate:4>,
 [[<variedcommodities:ingot_steel>,<minecraft:planks:4>,<variedcommodities:ingot_steel>],
  [<minecraft:planks:4>,null,<minecraft:planks:4>],
  [<variedcommodities:ingot_steel>,<minecraft:planks:4>,<variedcommodities:ingot_steel>]]);

recipes.addShaped("lolarecipe88f",<charm:crate:5>,
 [[<variedcommodities:ingot_steel>,<minecraft:planks:5>,<variedcommodities:ingot_steel>],
  [<minecraft:planks:5>,null,<minecraft:planks:5>],
  [<variedcommodities:ingot_steel>,<minecraft:planks:5>,<variedcommodities:ingot_steel>]]);

recipes.addShaped("lolarecipe89",<locks:steel_lock_mechanism>,
 [[<locks:spring>,<locks:spring>,<locks:spring>],
  [<contenttweaker:steel_nugget>,<contenttweaker:steel_nugget>,<contenttweaker:steel_nugget>],
  [<variedcommodities:ingot_steel>,<variedcommodities:ingot_steel>,<variedcommodities:ingot_steel>]]);

recipes.addShaped("lolarecipe90a",<locks:wood_lock_pick>,
 [[null,<minecraft:stick>,null],
  [<minecraft:stick>,null,<minecraft:stick>],
  [<minecraft:stick>,<minecraft:stick>,null]]);

recipes.addShaped("lolarecipe90b",<locks:iron_lock_pick>,
 [[null,<minecraft:iron_nugget>,<minecraft:iron_nugget>],
  [null,<minecraft:iron_nugget>,null],
  [<minecraft:iron_nugget>,null,null]]);

recipes.addShaped("lolarecipe90c",<locks:gold_lock_pick>,
 [[null,<minecraft:gold_nugget>,<minecraft:gold_nugget>],
  [null,<minecraft:gold_nugget>,null],
  [<minecraft:gold_nugget>,null,null]]);

recipes.addShaped("lolarecipe90d",<locks:steel_lock_pick>,
 [[null,<contenttweaker:steel_nugget>,<contenttweaker:steel_nugget>],
  [null,<contenttweaker:steel_nugget>,null],
  [<contenttweaker:steel_nugget>,null,null]]);

recipes.addShaped("lolarecipe90e",<locks:diamond_lock_pick>,
 [[null,<variedcommodities:coin_diamond>,<variedcommodities:coin_diamond>],
  [null,<variedcommodities:coin_diamond>,null],
  [<variedcommodities:coin_diamond>,null,null]]);

recipes.addShaped("lolarecipe92",<variedcommodities:lamp>,
 [[<contenttweaker:steel_nugget>,<variedcommodities:ingot_steel>,<contenttweaker:steel_nugget>],
  [<minecraft:glass_pane>,<minecraft:torch>,<minecraft:glass_pane>],
  [<contenttweaker:steel_nugget>,<variedcommodities:ingot_steel>,<contenttweaker:steel_nugget>]]);

recipes.addShaped("lolarecipe93",<variedcommodities:candle>*4,
 [[null,<minecraft:glowstone_dust>,null],
  [null,<rustic:tallow>|<rustic:beeswax>,null],
  [<minecraft:iron_ingot>,<minecraft:iron_ingot>,<minecraft:iron_ingot>]]);

recipes.addShaped("lolarecipe93a",<variedcommodities:candle>*4,
 [[<minecraft:glowstone_dust>],
  [<rustic:tallow>|<rustic:beeswax>],
  [<variedcommodities:ingot_steel>]]);

recipes.addShaped("lolarecipe93b",<rustic:candle>*4,
 [[null,<minecraft:glowstone_dust>,null],
  [<minecraft:iron_ingot>,<rustic:tallow>|<rustic:beeswax>,<minecraft:iron_ingot>],
  [null,<minecraft:iron_ingot>,null]]);

recipes.addShaped("lolarecipe93c",<rustic:candle_gold>*4,
 [[null,<minecraft:glowstone_dust>,null],
  [<minecraft:gold_ingot>,<rustic:tallow>|<rustic:beeswax>,<minecraft:gold_ingot>],
  [null,<minecraft:gold_ingot>,null]]);

recipes.addShaped("lolarecipe93d",<rustic:candle_silver>*4,
 [[null,<minecraft:glowstone_dust>,null],
  [<iceandfire:silver_ingot>,<rustic:tallow>|<rustic:beeswax>,<iceandfire:silver_ingot>],
  [null,<iceandfire:silver_ingot>,null]]);

recipes.addShaped("lolarecipe93e",<rustic:iron_lantern>,
 [[<minecraft:iron_nugget>,<minecraft:iron_ingot>,<minecraft:iron_nugget>],
  [<minecraft:iron_nugget>,<minecraft:torch>,<minecraft:iron_nugget>],
  [<minecraft:iron_nugget>,<minecraft:iron_ingot>,<minecraft:iron_nugget>]]);

recipes.addShaped("lolarecipe93f",<rustic:golden_lantern>,
 [[<minecraft:gold_nugget>,<minecraft:gold_ingot>,<minecraft:gold_nugget>],
  [<minecraft:gold_nugget>,<minecraft:torch>,<minecraft:gold_nugget>],
  [<minecraft:gold_nugget>,<minecraft:gold_ingot>,<minecraft:gold_nugget>]]);

recipes.addShaped("lolarecipe93g",<rustic:silver_lantern>,
 [[<iceandfire:silver_nugget>,<iceandfire:silver_ingot>,<iceandfire:silver_nugget>],
  [<iceandfire:silver_nugget>,<minecraft:torch>,<iceandfire:silver_nugget>],
  [<iceandfire:silver_nugget>,<iceandfire:silver_ingot>,<iceandfire:silver_nugget>]]);

recipes.addShaped("lolarecipe94",<betternether:cincinnasite_forge>,
 [[<variedcommodities:ingot_steel>,<betternether:cincinnasite_forged>,<variedcommodities:ingot_steel>],
  [<betternether:cincinnasite_forged>,<betternether:netherrack_furnace>,<betternether:cincinnasite_forged>],
  [<variedcommodities:ingot_steel>,<betternether:cincinnasite_forged>,<variedcommodities:ingot_steel>]]);

recipes.addShaped("lolarecipe94b",<betternether:cincinnasite_frame>,
 [[null,<betternether:cincinnasite_bars>,null],
  [<betternether:cincinnasite_bars>,<minecraft:glass>,<betternether:cincinnasite_bars>],
  [null,<betternether:cincinnasite_bars>,null]]);

recipes.addShaped("lolarecipe95",<inspirations:rope:1>*3,
 [[<contenttweaker:steel_nugget>,<contenttweaker:steel_nugget>],
  [<contenttweaker:steel_nugget>,<contenttweaker:steel_nugget>],
  [<contenttweaker:steel_nugget>,<contenttweaker:steel_nugget>]]);

recipes.addShaped("lolarecipe96",<lycanitesmobs:equipment_station>,
 [[<variedcommodities:ingot_steel>,<variedcommodities:ingot_steel>,<variedcommodities:ingot_steel>],
  [<variedcommodities:ingot_steel>,<lycanitesmobs:equipmentforge_lesser>,<variedcommodities:ingot_steel>],
  [<variedcommodities:ingot_steel>,<variedcommodities:ingot_steel>,<variedcommodities:ingot_steel>]]);

recipes.addShaped("lolarecipe97",<variedcommodities:tombstone>,
 [[<minecraft:stone>,<minecraft:stone>],
  [<minecraft:stone>,<minecraft:stone>],
  [<minecraft:stone>,<minecraft:stone>]]);

recipes.addShapeless("lolarecipe98",<variedcommodities:tombstone:1>,[<variedcommodities:tombstone>]);

recipes.addShapeless("lolarecipe99",<variedcommodities:tombstone:2>,[<variedcommodities:tombstone:1>]);

recipes.addShapeless("lolarecipe100",<lycanitesmobs:ironpaxel>,[<minecraft:iron_shovel>,<minecraft:iron_axe>,<minecraft:iron_pickaxe>,<variedcommodities:ingot_steel>,<variedcommodities:ingot_steel>,<variedcommodities:ingot_steel>]);

recipes.addShapeless("lolarecipe101",<lycanitesmobs:woodenpaxel>,[<minecraft:wooden_shovel>,<minecraft:wooden_axe>,<minecraft:wooden_pickaxe>,<minecraft:stick>,<minecraft:stick>,<minecraft:stick>]);

recipes.addShaped("lolarecipe102",<lycanitesmobs:ironrod>,
 [[<variedcommodities:ingot_steel>],
  [<variedcommodities:ingot_steel>],
  [<lycanitesmobs:woodenrod>]]);

recipes.addShaped("lolarecipe103",<lycanitesmobs:ironhilt>,
 [[<variedcommodities:ingot_steel>,<variedcommodities:ingot_steel>,<variedcommodities:ingot_steel>],
  [null,<lycanitesmobs:woodenhilt>,null]]);

recipes.addShaped("lolarecipe104",<lycanitesmobs:ironpikejoint>,
 [[<variedcommodities:ingot_steel>],
  [<lycanitesmobs:woodenhilt>],
  [<variedcommodities:ingot_steel>]]);

recipes.addShaped("lolarecipe105",<lycanitesmobs:ironaxehead>,
 [[null,<variedcommodities:ingot_steel>,null],
  [<variedcommodities:ingot_steel>,<lycanitesmobs:woodenhilt>,<variedcommodities:ingot_steel>],
  [null,<variedcommodities:ingot_steel>,null]]);

recipes.addShaped("lolarecipe106",<minecraft:coal:1>,
 [[<iceandfire:ash>,<iceandfire:ash>,<iceandfire:ash>],
  [<iceandfire:ash>,<iceandfire:ash>,<iceandfire:ash>],
  [<iceandfire:ash>,<iceandfire:ash>,<iceandfire:ash>]]);

recipes.addShaped("lolatreat1",<lycanitesmobs:dragontreat>*4,
 [[null,<defiledlands:scarlite>,<iceandfire:sapphire_gem>],
  [<minecraft:bone>,<minecraft:bone>,<defiledlands:scarlite>],
  [null,<defiledlands:scarlite>,<iceandfire:sapphire_gem>]]);

recipes.addShaped("lolatreat2",<lycanitesmobs:aviantreat>*4,
 [[null,<lycanitesmobs:cooked_ika_meat>|<lycanitesmobs:cooked_silex_meat>|<quark:cooked_crab_leg>,<lycanitesmobs:cooked_ika_meat>|<lycanitesmobs:cooked_silex_meat>|<quark:cooked_crab_leg>],
  [<minecraft:bone>,<minecraft:bone>,<lycanitesmobs:cooked_ika_meat>|<lycanitesmobs:cooked_silex_meat>|<quark:cooked_crab_leg>],
  [null,<lycanitesmobs:cooked_ika_meat>|<lycanitesmobs:cooked_silex_meat>|<quark:cooked_crab_leg>,<lycanitesmobs:cooked_ika_meat>|<lycanitesmobs:cooked_silex_meat>|<quark:cooked_crab_leg>]]);

recipes.addShaped("lolatreat3",<lycanitesmobs:beasttreat>*4,
 [[null,<lycanitesmobs:cooked_pinky_meat>|<aquaculture:food:5>|<lycanitesmobs:cooked_aspid_meat>,<lycanitesmobs:cooked_pinky_meat>|<aquaculture:food:5>|<lycanitesmobs:cooked_aspid_meat>],
  [<minecraft:bone>,<minecraft:bone>,<lycanitesmobs:cooked_pinky_meat>|<aquaculture:food:5>|<lycanitesmobs:cooked_aspid_meat>],
  [null,<lycanitesmobs:cooked_pinky_meat>|<aquaculture:food:5>|<lycanitesmobs:cooked_aspid_meat>,<lycanitesmobs:cooked_pinky_meat>|<aquaculture:food:5>|<lycanitesmobs:cooked_aspid_meat>]]);

recipes.addShaped("lolatreat4",<lycanitesmobs:planttreat>*4,
 [[null,<minecraft:pumpkin>|<minecraft:beetroot>|<minecraft:golden_carrot>,<minecraft:pumpkin>|<minecraft:beetroot>|<minecraft:golden_carrot>],
  [<minecraft:reeds>,<minecraft:reeds>,<minecraft:pumpkin>|<minecraft:beetroot>|<minecraft:golden_carrot>],
  [null,<minecraft:pumpkin>|<minecraft:beetroot>|<minecraft:golden_carrot>,<minecraft:pumpkin>|<minecraft:beetroot>|<minecraft:golden_carrot>]]);

recipes.addShaped("lolatreat5",<lycanitesmobs:undeadtreat>*4,
 [[null,<lycanitesmobs:geistliver>,<lycanitesmobs:geistliver>],
  [<minecraft:bone>,<minecraft:bone>,<lycanitesmobs:geistliver>],
  [null,<lycanitesmobs:geistliver>,<lycanitesmobs:geistliver>]]);
  
recipes.addShaped("lolatreat6",<lycanitesmobs:demontreat>*4,
 [[null,<betternether:black_apple>|<betternether:wart_seed>|<foodexpansion:itemnetherwartsoup>,<betternether:black_apple>|<betternether:wart_seed>|<foodexpansion:itemnetherwartsoup>],
  [<betternether:nether_reed>,<betternether:nether_reed>,<betternether:black_apple>|<betternether:wart_seed>|<foodexpansion:itemnetherwartsoup>],
  [null,<betternether:black_apple>|<betternether:wart_seed>|<foodexpansion:itemnetherwartsoup>,<betternether:black_apple>|<betternether:wart_seed>|<foodexpansion:itemnetherwartsoup>]]);

recipes.addShaped("lolanetherwartsoupalt",<foodexpansion:itemnetherwartsoup>,
 [[<minecraft:nether_wart>,<betternether:black_apple>,<minecraft:nether_wart>],
  [null,<minecraft:bowl>,null]]);

recipes.addShaped("lolatreat7",<lycanitesmobs:arachnidtreat>*4,
 [[null,<lycanitesmobs:cooked_joust_meat>|<lycanitesmobs:cooked_concapede_meat>,<lycanitesmobs:cooked_joust_meat>|<lycanitesmobs:cooked_concapede_meat>],
  [<minecraft:bone>,<minecraft:bone>,<lycanitesmobs:cooked_joust_meat>|<lycanitesmobs:cooked_concapede_meat>],
  [null,<lycanitesmobs:cooked_joust_meat>|<lycanitesmobs:cooked_concapede_meat>,<lycanitesmobs:cooked_joust_meat>|<lycanitesmobs:cooked_concapede_meat>]]);

recipes.addShaped("lolatreat8",<lycanitesmobs:aquatictreat>*4,
 [[null,<lycanitesmobs:cooked_cephignis_meat>|<lycanitesmobs:lapis_fish_and_chips>|<aquaculture:food:6>,<lycanitesmobs:cooked_cephignis_meat>|<lycanitesmobs:lapis_fish_and_chips>|<aquaculture:food:6>],
  [<minecraft:bone>,<minecraft:bone>,<lycanitesmobs:cooked_cephignis_meat>|<lycanitesmobs:lapis_fish_and_chips>|<aquaculture:food:6>],
  [null,<lycanitesmobs:cooked_cephignis_meat>|<lycanitesmobs:lapis_fish_and_chips>|<aquaculture:food:6>,<lycanitesmobs:cooked_cephignis_meat>|<lycanitesmobs:lapis_fish_and_chips>|<aquaculture:food:6>]]);

recipes.addShaped("lolarecipe109",<disenchanter:disenchantmenttable>,
 [[null,null,null],
  [<defiledlands:book_wyrm_scale_golden>,<minecraft:emerald>,<defiledlands:book_wyrm_scale_golden>],
  [<minecraft:emerald>,<minecraft:enchanting_table>,<minecraft:emerald>]]);

recipes.addShapeless("lolarecipe110",<rustic:honeycomb>,[<lycanitesmobs:veswax>,<forge:bucketfilled>.withTag({FluidName: "honey", Amount: 1000})]);

recipes.addShapeless("lolarecipe112",<simpledifficulty:frost_powder>*2,[<simpledifficulty:frost_rod>]);

recipes.addShapeless("lolarecipe113",<iceandfire:fire_stew>,[<iceandfire:fire_lily>,<minecraft:blaze_powder>,<minecraft:bowl>]);

recipes.addShapeless("lolarecipe114",<iceandfire:frost_stew>,[<iceandfire:frost_lily>,<simpledifficulty:frost_powder>,<minecraft:bowl>]);

recipes.addShaped("lolarecipe115",<rustic:stone_pillar>*2,
  [[<minecraft:stone:0>],
  [<minecraft:stone:0>]]);

recipes.addShaped("lolarecipe116",<rustic:andesite_pillar>*2,
  [[<minecraft:stone:5>],
  [<minecraft:stone:5>]]);

recipes.addShaped("lolarecipe117",<rustic:diorite_pillar>*2,
  [[<minecraft:stone:3>],
  [<minecraft:stone:3>]]);

recipes.addShaped("lolarecipe118",<rustic:granite_pillar>*2,
  [[<minecraft:stone:1>],
  [<minecraft:stone:1>]]);

recipes.addShaped("lolarecipe119",<switchbow:arrowfire>*4,
 [[null,<minecraft:arrow>,null],
  [<minecraft:arrow>,<minecraft:blaze_powder>,<minecraft:arrow>],
  [null,<minecraft:arrow>,null]]);

recipes.addShaped("lolarecipe120",<switchbow:arrowfrost>*4,
 [[null,<minecraft:arrow>,null],
  [<minecraft:arrow>,<simpledifficulty:frost_powder>,<minecraft:arrow>],
  [null,<minecraft:arrow>,null]]);

recipes.addShaped("lolarecipe121",<switchbow:arrowwither>*4,
 [[null,<minecraft:arrow>,null],
  [<minecraft:arrow>,<quark:black_ash>,<minecraft:arrow>],
  [null,<minecraft:arrow>,null]]);

recipes.addShaped("lolarecipe122",<switchbow:arrowvampier>*4,
 [[null,<minecraft:arrow>,null],
  [<minecraft:arrow>,<scalinghealth:heartdust>,<minecraft:arrow>],
  [null,<minecraft:arrow>,null]]);

recipes.addShaped("lolarecipe123",<switchbow:arrowburial>*4,
 [[null,<minecraft:arrow>,null],
  [<minecraft:arrow>,<quark:soul_powder>,<minecraft:arrow>],
  [null,<minecraft:arrow>,null]]);

recipes.addShaped("lolarecipe124",<xat:glow_ring>,
 [[<xat:glowing_ingot>,<iceandfire:silver_ingot>,null],
  [<iceandfire:silver_ingot>,<minecraft:golden_carrot>,<iceandfire:silver_ingot>],
  [null,<iceandfire:silver_ingot>,null]]);

recipes.addShaped("lolarecipe125",<xat:dwarf_stout>,
 [[<xat:mana_crystal>,<quark:diamond_heart>,<xat:mana_crystal>],
  [<rustic:ironberries>,<xat:dwarf_ring>,<rustic:ironberries>],
  [<xat:mana_crystal>,<rustic:fluid_bottle:*>,<xat:mana_crystal>]]);

recipes.addShaped("lolarecipe126",<xat:elf_sap>,
 [[<xat:mana_crystal>,<quark:variant_sapling:1>,<xat:mana_crystal>],
  [<rustic:fluid_bottle:*>,<xat:elf_ring>,<rustic:fluid_bottle:*>],
  [<xat:mana_crystal>,<rustic:mooncap_mushroom>,<xat:mana_crystal>]]);

recipes.addShaped("lolarecipe127",<xat:faelis_food>,
 [[<xat:mana_crystal>,<quark:glowshroom>,<xat:mana_crystal>],
  [<minecraft:sugar>,<xat:faelis_ring>,<minecraft:sugar>],
  [<xat:mana_crystal>,<minecraft:milk_bucket>,<xat:mana_crystal>]]);

recipes.addShaped("lolarecipe128",<xat:fairy_dew>,
 [[<xat:mana_crystal>,<minecraft:ghast_tear>,<xat:mana_crystal>],
  [<familiarfauna:pixie_dust>,<xat:fairy_ring>,<familiarfauna:pixie_dust>],
  [<xat:mana_crystal>,<minecraft:water_bucket>,<xat:mana_crystal>]]);

recipes.addShaped("lolarecipe129",<xat:goblin_soup>,
 [[<xat:mana_crystal>,<minecraft:fermented_spider_eye>,<xat:mana_crystal>],
  [<aquaculture:food:7>,<xat:goblin_ring>,<aquaculture:food:7>],
  [<xat:mana_crystal>,<minecraft:mushroom_stew>,<xat:mana_crystal>]]);

recipes.addShaped("lolarecipe130",<xat:titan_spirit>,
 [[<xat:mana_crystal>,<betternether:bone_mushroom>,<xat:mana_crystal>],
  [<variedcommodities:ingot_bronze>,<xat:titan_ring>,<variedcommodities:ingot_bronze>],
  [<xat:mana_crystal>,<lycanitesmobs:bucketmoglava>,<xat:mana_crystal>]]);

recipes.addShaped("lolarecipe131",<xat:dragon_gem>,
 [[<xat:mana_crystal>,<defiledlands:scarlite>,<xat:mana_crystal>],
  [<minecraft:dragon_breath>,<xat:dragon_ring>,<minecraft:dragon_breath>],
  [<xat:mana_crystal>,<iceandfire:sapphire_gem>,<xat:mana_crystal>]]);

recipes.addShaped("lolasaddle1",<lycanitesmobs:saddle_beast>,
 [[<lycanitesmobs:wendigoantler:*>,null,null],
  [<lycanitesmobs:frostyfur>,<lycanitesmobs:frostyfur>,<lycanitesmobs:frostyfur>],
  [<craftablechainmail:chainmail_plate>,<minecraft:saddle>,<craftablechainmail:chainmail_plate>]]);

recipes.addShaped("lolasaddle2",<lycanitesmobs:saddle_insect>,
 [[<notreepunching:grass_string>,null,null],
  [<iceandfire:myrmex_desert_chitin>|<iceandfire:myrmex_jungle_chitin>,<iceandfire:myrmex_desert_chitin>|<iceandfire:myrmex_jungle_chitin>,<iceandfire:myrmex_desert_chitin>|<iceandfire:myrmex_jungle_chitin>],
  [<inspirations:rope:2>,<minecraft:saddle>,<inspirations:rope:2>]]);

recipes.addShaped("lolasaddle3",<lycanitesmobs:saddle_dragon>,
 [[<iceandfire:troll_tusk>,null,null],
  [<iceandfire:dragonscales_red>|<iceandfire:dragonscales_green>|<iceandfire:dragonscales_bronze>|<iceandfire:dragonscales_gray>|<iceandfire:dragonscales_blue>|<iceandfire:dragonscales_white>|<iceandfire:dragonscales_sapphire>|<iceandfire:dragonscales_silver>,<iceandfire:dragonscales_red>|<iceandfire:dragonscales_green>|<iceandfire:dragonscales_bronze>|<iceandfire:dragonscales_gray>|<iceandfire:dragonscales_blue>|<iceandfire:dragonscales_white>|<iceandfire:dragonscales_sapphire>|<iceandfire:dragonscales_silver>,<iceandfire:dragonscales_red>|<iceandfire:dragonscales_green>|<iceandfire:dragonscales_bronze>|<iceandfire:dragonscales_gray>|<iceandfire:dragonscales_blue>|<iceandfire:dragonscales_white>|<iceandfire:dragonscales_sapphire>|<iceandfire:dragonscales_silver>],
  [<quark:chain>,<minecraft:saddle>,<quark:chain>]]);

recipes.addShaped("lolasaddle4",<lycanitesmobs:saddle_amphibian>,
 [[<minecraft:lead>,null,null],
  [<iceandfire:shiny_scales>,<iceandfire:shiny_scales>,<iceandfire:shiny_scales>],
  [<iceandfire:myrmex_desert_resin>|<iceandfire:myrmex_jungle_resin>,<minecraft:saddle>,<iceandfire:myrmex_desert_resin>|<iceandfire:myrmex_jungle_resin>]]);

recipes.addShaped("lolasaddle5",<lycanitesmobs:saddle_reptile>,
 [[<iceandfire:sea_serpent_fang>,null,null],
  [<defiledlands:book_wyrm_scale>,<defiledlands:book_wyrm_scale>,<defiledlands:book_wyrm_scale>],
  [<fishingmadebetter:hook_barbed>,<minecraft:saddle>,<fishingmadebetter:hook_barbed>]]);

recipes.addShaped("lolasaddle6",<lycanitesmobs:saddle_avian>,
 [[<iceandfire:troll_tusk>,null,null],
  [<iceandfire:troll_leather_forest>|<iceandfire:troll_leather_frost>|<iceandfire:troll_leather_mountain>,<iceandfire:troll_leather_forest>|<iceandfire:troll_leather_frost>|<iceandfire:troll_leather_mountain>,<iceandfire:troll_leather_forest>|<iceandfire:troll_leather_frost>|<iceandfire:troll_leather_mountain>],
  [<iceandfire:stymphalian_bird_feather>|<iceandfire:amphithere_feather>,<minecraft:saddle>,<iceandfire:stymphalian_bird_feather>|<iceandfire:amphithere_feather>]]);

recipes.addShaped("lolasaddle7",<lycanitesmobs:saddle_aquatic>,
 [[<minecraft:lead>,null,null],
  [<quark:crab_shell>,<quark:crab_shell>,<quark:crab_shell>],
  [<iceandfire:myrmex_desert_resin>|<iceandfire:myrmex_jungle_resin>,<minecraft:saddle>,<iceandfire:myrmex_desert_resin>|<iceandfire:myrmex_jungle_resin>]]);

recipes.addShaped("lolasaddle8",<lycanitesmobs:saddle_aberration>,
 [[<minecraft:end_rod>,null,null],
  [<quark:biotite>,<quark:biotite>,<quark:biotite>],
  [<minecraft:ender_pearl>,<minecraft:saddle>,<minecraft:ender_pearl>]]);

recipes.addShaped("lolasaddle9",<lycanitesmobs:saddle_demon>,
 [[<betternether:nether_reed>,null,null],
  [<iceandfire:fire_dragon_flesh>,<iceandfire:fire_dragon_flesh>,<iceandfire:fire_dragon_flesh>],
  [<iceandfire:witherbone>,<minecraft:saddle>,<iceandfire:witherbone>]]);

recipes.addShapeless("lolarecipe132",<iceandfire:sea_serpent_fang>,[<ore:toolKnife>.transformDamage(1),<iceandfire:fishing_spear:*>]);

recipes.addShapeless("lolarecipe132a",<minecraft:slime_ball>,[<ore:toolKnife>.transformDamage(1),<familiarfauna:snail_shell:*>]);

recipes.addShaped("lolarecipe133",<betternether:quartz_stained_glass:8>*8,
 [[<betternether:quartz_glass>,<betternether:quartz_glass>,<betternether:quartz_glass>],
  [<betternether:quartz_glass>,<ore:dyeLightGray>,<betternether:quartz_glass>],
  [<betternether:quartz_glass>,<betternether:quartz_glass>,<betternether:quartz_glass>]]);

recipes.addShaped("lolarecipe134",<betternether:quartz_stained_glass_framed:8>*8,
 [[<betternether:quartz_glass_framed>,<betternether:quartz_glass_framed>,<betternether:quartz_glass_framed>],
  [<betternether:quartz_glass_framed>,<ore:dyeLightGray>,<betternether:quartz_glass_framed>],
  [<betternether:quartz_glass_framed>,<betternether:quartz_glass_framed>,<betternether:quartz_glass_framed>]]);

recipes.addShaped("lolarecipe135",<classyhats:phantom_thread>,
 [[<bountifulbaubles:spectralsilt>,<ore:string>,null],
  [<ore:string>,<bountifulbaubles:phantomprism>,<ore:string>],
  [null,<ore:string>,<bountifulbaubles:spectralsilt>]]);

recipes.addShaped("lolarecipe136",<betternether:nether_brick_tile_slab_half>*6,
 [[<betternether:nether_brick_tile_small>,<betternether:nether_brick_tile_small>,<betternether:nether_brick_tile_small>]]);

recipes.addShaped("bruhfirespear",<mujmajnkraftsbettersurvival:itemfiredragonbonespear>*8,
 [[<mujmajnkraftsbettersurvival:itemdragonbonespear>,<mujmajnkraftsbettersurvival:itemdragonbonespear>,<mujmajnkraftsbettersurvival:itemdragonbonespear>],
  [<mujmajnkraftsbettersurvival:itemdragonbonespear>,<iceandfire:fire_dragon_blood>,<mujmajnkraftsbettersurvival:itemdragonbonespear>],
  [<mujmajnkraftsbettersurvival:itemdragonbonespear>,<mujmajnkraftsbettersurvival:itemdragonbonespear>,<mujmajnkraftsbettersurvival:itemdragonbonespear>]]);

recipes.addShaped("bruhicespear",<mujmajnkraftsbettersurvival:itemicedragonbonespear>*8,
 [[<mujmajnkraftsbettersurvival:itemdragonbonespear>,<mujmajnkraftsbettersurvival:itemdragonbonespear>,<mujmajnkraftsbettersurvival:itemdragonbonespear>],
  [<mujmajnkraftsbettersurvival:itemdragonbonespear>,<iceandfire:ice_dragon_blood>,<mujmajnkraftsbettersurvival:itemdragonbonespear>],
  [<mujmajnkraftsbettersurvival:itemdragonbonespear>,<mujmajnkraftsbettersurvival:itemdragonbonespear>,<mujmajnkraftsbettersurvival:itemdragonbonespear>]]);

recipes.addShaped("SUSSOUP1",<charm:suspicious_soup:0>,
 [[<inspirations:edibles>,<inspirations:edibles>,<inspirations:edibles>],
  [<inspirations:edibles>,<inspirations:edibles>,<inspirations:edibles>],
  [<minecraft:double_plant:0>,<minecraft:bowl>,<minecraft:double_plant:0>]]);

recipes.addShaped("SUSSOUP2",<charm:suspicious_soup:1>,
 [[<inspirations:edibles>,<inspirations:edibles>,<inspirations:edibles>],
  [<inspirations:edibles>,<inspirations:edibles>,<inspirations:edibles>],
  [<inspirations:flower:0>,<minecraft:bowl>,<inspirations:flower:0>]]);

recipes.addShaped("SUSSOUP3",<charm:suspicious_soup:2>,
 [[<inspirations:edibles>,<inspirations:edibles>,<inspirations:edibles>],
  [<inspirations:edibles>,<inspirations:edibles>,<inspirations:edibles>],
  [<minecraft:red_flower:1>,<minecraft:bowl>,<minecraft:red_flower:1>]]);

recipes.addShaped("SUSSOUP4",<charm:suspicious_soup:3>,
 [[<inspirations:edibles>,<inspirations:edibles>,<inspirations:edibles>],
  [<inspirations:edibles>,<inspirations:edibles>,<inspirations:edibles>],
  [<minecraft:red_flower:2>,<minecraft:bowl>,<minecraft:red_flower:2>]]);

recipes.addShaped("SUSSOUP5",<charm:suspicious_soup:4>,
 [[<inspirations:edibles>,<inspirations:edibles>,<inspirations:edibles>],
  [<inspirations:edibles>,<inspirations:edibles>,<inspirations:edibles>],
  [<minecraft:red_flower:3>,<minecraft:bowl>,<minecraft:red_flower:3>]]);

recipes.addShaped("SUSSOUP6",<charm:suspicious_soup:5>,
 [[<inspirations:edibles>,<inspirations:edibles>,<inspirations:edibles>],
  [<inspirations:edibles>,<inspirations:edibles>,<inspirations:edibles>],
  [<minecraft:red_flower:4>,<minecraft:bowl>,<minecraft:red_flower:4>]]);

recipes.addShaped("SUSSOUP7",<charm:suspicious_soup:6>,
 [[<inspirations:edibles>,<inspirations:edibles>,<inspirations:edibles>],
  [<inspirations:edibles>,<inspirations:edibles>,<inspirations:edibles>],
  [<minecraft:red_flower:5>,<minecraft:bowl>,<minecraft:red_flower:5>]]);

recipes.addShaped("SUSSOUP8",<charm:suspicious_soup:7>,
 [[<inspirations:edibles>,<inspirations:edibles>,<inspirations:edibles>],
  [<inspirations:edibles>,<inspirations:edibles>,<inspirations:edibles>],
  [<minecraft:red_flower:6>,<minecraft:bowl>,<minecraft:red_flower:6>]]);

recipes.addShaped("SUSSOUP9",<charm:suspicious_soup:8>,
 [[<inspirations:edibles>,<inspirations:edibles>,<inspirations:edibles>],
  [<inspirations:edibles>,<inspirations:edibles>,<inspirations:edibles>],
  [<minecraft:red_flower:7>,<minecraft:bowl>,<minecraft:red_flower:7>]]);

recipes.addShaped("SUSSOUP10",<charm:suspicious_soup:9>,
 [[<inspirations:edibles>,<inspirations:edibles>,<inspirations:edibles>],
  [<inspirations:edibles>,<inspirations:edibles>,<inspirations:edibles>],
  [<minecraft:red_flower:8>,<minecraft:bowl>,<minecraft:red_flower:8>]]);

recipes.addShaped("SUSSOUP11",<charm:suspicious_soup:10>,
 [[<inspirations:edibles>,<inspirations:edibles>,<inspirations:edibles>],
  [<inspirations:edibles>,<inspirations:edibles>,<inspirations:edibles>],
  [<inspirations:flower:1>,<minecraft:bowl>,<inspirations:flower:1>]]);

recipes.addShaped("SUSSOUP12",<charm:suspicious_soup:11>,
 [[<inspirations:edibles>,<inspirations:edibles>,<inspirations:edibles>],
  [<inspirations:edibles>,<inspirations:edibles>,<inspirations:edibles>],
  [<inspirations:flower:2>,<minecraft:bowl>,<inspirations:flower:2>]]);

recipes.addShaped("SUSSOUP13",<charm:suspicious_soup:12>,
 [[<inspirations:edibles>,<inspirations:edibles>,<inspirations:edibles>],
  [<inspirations:edibles>,<inspirations:edibles>,<inspirations:edibles>],
  [<inspirations:flower:3>,<minecraft:bowl>,<inspirations:flower:3>]]);

recipes.addShaped("lolarecipe137",<bountifulbaubles:amuletsingluttony>,
 [[null,<minecraft:cake>,null],
  [<minecraft:golden_apple:1>,<bountifulbaubles:amuletsinempty>,<minecraft:golden_apple:1>],
  [null,<lycanitesmobs:battle_burrito>,null]]);

recipes.addShaped("lolarecipe138",<variedcommodities:holyhandgrenade>,
 [[<minecraft:gold_ingot>,<bountifulbaubles:ringiron>,<minecraft:gold_ingot>],
  [<minecraft:quartz_block>,<bountifulbaubles:amuletcross>,<minecraft:quartz_block>],
  [<minecraft:gold_ingot>,<minecraft:quartz_block>,<minecraft:gold_ingot>]]);

recipes.addShaped("lolarecipe139",<defiledlands:stone_defiled_stairs>*4,
 [[<defiledlands:stone_defiled>,null,null],
  [<defiledlands:stone_defiled>,<defiledlands:stone_defiled>,null],
  [<defiledlands:stone_defiled>,<defiledlands:stone_defiled>,<defiledlands:stone_defiled>]]);

recipes.addShaped("lolarecipe140",<defiledlands:sandstone_defiled_stairs>*4,
 [[<defiledlands:sandstone_defiled>,null,null],
  [<defiledlands:sandstone_defiled>,<defiledlands:sandstone_defiled>,null],
  [<defiledlands:sandstone_defiled>,<defiledlands:sandstone_defiled>,<defiledlands:sandstone_defiled>]]);

recipes.addShaped("lolarecipe141",<defiledlands:stone_defiled_bricks_stairs>*4,
 [[<defiledlands:stone_defiled_decoration:0>,null,null],
  [<defiledlands:stone_defiled_decoration:0>,<defiledlands:stone_defiled_decoration:0>,null],
  [<defiledlands:stone_defiled_decoration:0>,<defiledlands:stone_defiled_decoration:0>,<defiledlands:stone_defiled_decoration:0>]]);

recipes.addShaped("lolarecipe142",<defiledlands:tenebra_stairs>*4,
 [[<defiledlands:tenebra_planks>,null,null],
  [<defiledlands:tenebra_planks>,<defiledlands:tenebra_planks>,null],
  [<defiledlands:tenebra_planks>,<defiledlands:tenebra_planks>,<defiledlands:tenebra_planks>]]);

recipes.addShaped("lolarecipe143",<spartandefiled:staff_umbrium>,
 [[null,null,<defiledlands:umbrium_ingot>],
  [null,<spartanweaponry:material:1>,null],
  [<defiledlands:umbrium_ingot>,null,null]]);

recipes.addShaped("lolarecipe144",<minecraft:stone_brick_stairs>*4,
 [[<minecraft:stonebrick>,null,null],
  [<minecraft:stonebrick>,<minecraft:stonebrick>,null],
  [<minecraft:stonebrick>,<minecraft:stonebrick>,<minecraft:stonebrick>]]);

recipes.addShaped("lolarecipe145",<minecraft:stone_slab:5>*6,
 [[<minecraft:stonebrick>,<minecraft:stonebrick>,<minecraft:stonebrick>]]);

recipes.addShaped("lolarecipe148",<quark:duskbound_block>*8,
 [[<minecraft:purpur_block>,<minecraft:purpur_block>,<minecraft:purpur_block>],
  [<minecraft:purpur_block>,<minecraft:obsidian>,<minecraft:purpur_block>],
  [<minecraft:purpur_block>,<minecraft:purpur_block>,<minecraft:purpur_block>]]);

recipes.addShaped("lolarecipe149",<quark:midori_block>*8,
 [[<minecraft:purpur_block>,<minecraft:purpur_block>,<minecraft:purpur_block>],
  [<minecraft:purpur_block>,<minecraft:dye:2>,<minecraft:purpur_block>],
  [<minecraft:purpur_block>,<minecraft:purpur_block>,<minecraft:purpur_block>]]);

recipes.addShaped("lolarecipe150",<quark:grate>*4,
 [[<minecraft:iron_bars>,<minecraft:iron_bars>],
  [<minecraft:iron_bars>,<minecraft:iron_bars>]]);

recipes.addShapeless("lolarecipe151",<contenttweaker:glacier_cream>,[<minecraft:slime_ball>,<simpledifficulty:frost_powder>]);

recipes.addShapeless("lesalad152",<lycanitesmobs:paleo_salad>,[<lycanitesmobs:cooked_arisaur_meat>,<minecraft:carrot>,<quark:variant_leaves:1>]);

print("Script ending!");
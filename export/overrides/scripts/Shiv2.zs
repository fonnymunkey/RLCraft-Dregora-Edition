import mods.inspirations.Cauldron;
import crafttweaker.item.IItemStack;
import crafttweaker.block.IBlockDefinition;

print("Script starting!");

events.onPlayerTick(function(event as crafttweaker.event.PlayerTickEvent) {
  var player = event.player;
  var potionToRemove = <potion:srparasites:viral>;
  var maxAmplifierAllowed = 9;
  if player.isPotionActive(potionToRemove) {
    var active = player.getActivePotionEffect(potionToRemove);
    if active.amplifier > maxAmplifierAllowed {
      player.removePotionEffect(potionToRemove);
      player.addPotionEffect(<potion:srparasites:viral>.makePotionEffect(active.duration, 9));
    }
  }
});

<simpledifficulty:wool_helmet:*>.addTooltip(format.darkRed("+2 Warmth"));
<simpledifficulty:wool_chestplate:*>.addTooltip(format.darkRed("+2 Warmth"));
<simpledifficulty:wool_leggings:*>.addTooltip(format.darkRed("+2 Warmth"));
<simpledifficulty:wool_boots:*>.addTooltip(format.darkRed("+2 Warmth"));
<simpledifficulty:ice_helmet:*>.addTooltip(format.darkAqua("+2 Cooling"));
<simpledifficulty:ice_chestplate:*>.addTooltip(format.darkAqua("+2 Cooling"));
<simpledifficulty:ice_leggings:*>.addTooltip(format.darkAqua("+2 Cooling"));
<simpledifficulty:ice_boots:*>.addTooltip(format.darkAqua("+2 Cooling"));

<rlmixins:scarlite_helmet:*>.displayName = "\u00A74\u00A7kScarlite\u00A7r\u00A74 Helmet";
<rlmixins:scarlite_chestplate:*>.displayName = "\u00A74\u00A7kScarlite\u00A7r\u00A74 Chestplate";
<rlmixins:scarlite_leggings:*>.displayName = "\u00A74\u00A7kScarlite\u00A7r\u00A74 Leggings";
<rlmixins:scarlite_boots:*>.displayName = "\u00A74\u00A7kScarlite\u00A7r\u00A74 Boots";

<mujmajnkraftsbettersurvival:itemsteelhammer:*>.addTooltip(format.gold("+2 damage against Nether mobs and Fire elementals"));
<mujmajnkraftsbettersurvival:itemsteelspear:*>.addTooltip(format.gold("+2 damage against Nether mobs and Fire elementals"));
<mujmajnkraftsbettersurvival:itemsteeldagger:*>.addTooltip(format.gold("+2 damage against Nether mobs and Fire elementals"));
<mujmajnkraftsbettersurvival:itemsteelbattleaxe:*>.addTooltip(format.gold("+2 damage against Nether mobs and Fire elementals"));
<mujmajnkraftsbettersurvival:itemsteelnunchaku:*>.addTooltip(format.gold("+2 damage against Nether mobs and Fire elementals"));
<spartanweaponry:dagger_steel:*>.addTooltip(format.gold("+2 damage against Nether mobs and Fire elementals"));
<spartanweaponry:longsword_steel:*>.addTooltip(format.gold("+2 damage against Nether mobs and Fire elementals"));
<spartanweaponry:katana_steel:*>.addTooltip(format.gold("+2 damage against Nether mobs and Fire elementals"));
<spartanweaponry:saber_steel:*>.addTooltip(format.gold("+2 damage against Nether mobs and Fire elementals"));
<spartanweaponry:rapier_steel:*>.addTooltip(format.gold("+2 damage against Nether mobs and Fire elementals"));
<spartanweaponry:greatsword_steel:*>.addTooltip(format.gold("+2 damage against Nether mobs and Fire elementals"));
<spartanweaponry:hammer_steel:*>.addTooltip(format.gold("+2 damage against Nether mobs and Fire elementals"));
<spartanweaponry:warhammer_steel:*>.addTooltip(format.gold("+2 damage against Nether mobs and Fire elementals"));
<spartanweaponry:spear_steel:*>.addTooltip(format.gold("+2 damage against Nether mobs and Fire elementals"));
<spartanweaponry:throwing_axe_steel:*>.addTooltip(format.gold("+2 damage against Nether mobs and Fire elementals"));
<spartanweaponry:halberd_steel:*>.addTooltip(format.gold("+2 damage against Nether mobs and Fire elementals"));
<spartanweaponry:pike_steel:*>.addTooltip(format.gold("+2 damage against Nether mobs and Fire elementals"));
<spartanweaponry:lance_steel:*>.addTooltip(format.gold("+2 damage against Nether mobs and Fire elementals"));
<spartanweaponry:throwing_knife_steel:*>.addTooltip(format.gold("+2 damage against Nether mobs and Fire elementals"));
<spartanweaponry:javelin_steel:*>.addTooltip(format.gold("+2 damage against Nether mobs and Fire elementals"));
<spartanweaponry:boomerang_steel:*>.addTooltip(format.gold("+2 damage against Nether mobs and Fire elementals"));
<spartanweaponry:battleaxe_steel:*>.addTooltip(format.gold("+2 damage against Nether mobs and Fire elementals"));
<spartanweaponry:mace_steel:*>.addTooltip(format.gold("+2 damage against Nether mobs and Fire elementals"));
<spartanweaponry:glaive_steel:*>.addTooltip(format.gold("+2 damage against Nether mobs and Fire elementals"));
<spartanweaponry:staff_steel:*>.addTooltip(format.gold("+2 damage against Nether mobs and Fire elementals"));

//Potion Of Curse Break
brewing.addBrew(<minecraft:potion>.withTag({Potion: "minecraft:thick"}), <rlmixins:cleansing_talisman>, <minecraft:potion>.withTag({Potion: "rlmixins:curse_break"}));
brewing.addBrew(<minecraft:potion>.withTag({Potion: "rlmixins:curse_break"}), <minecraft:gunpowder>, <minecraft:splash_potion>.withTag({Potion: "rlmixins:curse_break"}));
brewing.addBrew(<minecraft:splash_potion>.withTag({Potion: "rlmixins:curse_break"}), <minecraft:dragon_breath>, <minecraft:lingering_potion>.withTag({Potion: "rlmixins:curse_break"}));

<block:minecraft:purpur_block>.getBlock().definition.resistance=15;
<block:minecraft:purpur_pillar>.getBlock().definition.resistance=15;
<block:minecraft:purpur_slab>.getBlock().definition.resistance=15;
<block:minecraft:hopper>.getBlock().definition.resistance=15;
<block:quark:duskbound_lantern>.getBlock().definition.resistance=20;
<block:quark:duskbound_lantern>.getBlock().definition.resistance=20;
<block:quark:duskbound_block>.getBlock().definition.resistance=20;
<block:quark:duskbound_block_stairs>.getBlock().definition.resistance=20;
<block:quark:duskbound_block_slab>.getBlock().definition.resistance=20;
<block:quark:duskbound_block_wall>.getBlock().definition.resistance=20;
<block:minecraft:end_bricks>.getBlock().definition.resistance=15;
<block:quark:end_bricks_stairs>.getBlock().definition.resistance=15;
<block:quark:end_bricks_slab>.getBlock().definition.resistance=15;
<block:quark:end_bricks_wall>.getBlock().definition.resistance=15;
<block:quark:ender_watcher>.getBlock().definition.resistance=15;
<block:charm:ender_pearl_block>.getBlock().definition.resistance=15;
<block:quark:midori_block>.getBlock().definition.resistance=15;
<block:quark:midori_pillar>.getBlock().definition.resistance=15;
<block:quark:midori_block_stairs>.getBlock().definition.resistance=15;
<block:quark:midori_block_slab>.getBlock().definition.resistance=15;
<block:quark:midori_block_wall>.getBlock().definition.resistance=15;
<block:quark:elder_prismarine>.getBlock().definition.resistance=15;
<block:quark:elder_sea_lantern>.getBlock().definition.resistance=15;
<block:quark:elder_prismarine_slab>.getBlock().definition.resistance=15;
<block:quark:elder_prismarine_stairs>.getBlock().definition.resistance=15;
<block:quark:elder_prismarine_bricks_slab>.getBlock().definition.resistance=15;
<block:quark:elder_prismarine_bricks_stairs>.getBlock().definition.resistance=15;
<block:quark:elder_prismarine_dark_slab>.getBlock().definition.resistance=15;
<block:quark:elder_prismarine_dark_stairs>.getBlock().definition.resistance=15;
<block:quark:elder_prismarine_wall>.getBlock().definition.resistance=15;
<block:quark:elder_prismarine_bricks_wall>.getBlock().definition.resistance=15;
<block:quark:elder_prismarine_dark_wall>.getBlock().definition.resistance=15;

<ore:toolAxe>.add(<iceandfire:silver_axe:*>);
<ore:toolAxe>.add(<iceandfire:dragonbone_axe:*>);

<ore:spartanStaff>.add(<spartanweaponry:staff_steel:*>, <spartanweaponry:staff:*>, <spartanweaponry:staff_stone:*>, <spartanweaponry:staff_iron:*>, <spartanweaponry:staff_gold:*>, <spartanweaponry:staff_diamond:*>, <spartanweaponry:staff_bronze:*>, <spartanweaponry:staff_silver:*>, <spartanfire:staff_desert_venom:*>, <spartanfire:staff_jungle_venom:*>, <spartanfire:staff_desert:*>, <spartanfire:staff_jungle:*>, <spartanfire:staff_ice_dragonbone:*>, <spartanfire:staff_fire_dragonbone:*>, <spartanfire:staff_dragonbone:*>, <spartandefiled:staff_umbrium:*>);
<ore:spartanGlaive>.add(<spartanweaponry:glaive_steel:*>, <spartanweaponry:glaive_wood:*>, <spartanweaponry:glaive_stone:*>, <spartanweaponry:glaive_iron:*>, <spartanweaponry:glaive_gold:*>, <spartanweaponry:glaive_diamond:*>, <spartanweaponry:glaive_bronze:*>, <spartanweaponry:glaive_silver:*>, <spartanfire:glaive_desert_venom:*>, <spartanfire:glaive_jungle_venom:*>, <spartanfire:glaive_desert:*>, <spartanfire:glaive_jungle:*>, <spartanfire:glaive_ice_dragonbone:*>, <spartanfire:glaive_fire_dragonbone:*>, <spartanfire:glaive_dragonbone:*>, <spartandefiled:glaive_umbrium:*>);
<ore:spartanMace>.add(<spartanweaponry:mace_steel:*>, <spartanweaponry:mace_wood:*>, <spartanweaponry:mace_stone:*>, <spartanweaponry:mace_iron:*>, <spartanweaponry:mace_gold:*>, <spartanweaponry:mace_diamond:*>, <spartanweaponry:mace_bronze:*>, <spartanweaponry:mace_silver:*>, <spartanfire:mace_desert_venom:*>, <spartanfire:mace_jungle_venom:*>, <spartanfire:mace_desert:*>, <spartanfire:mace_jungle:*>, <spartanfire:mace_ice_dragonbone:*>, <spartanfire:mace_fire_dragonbone:*>, <spartanfire:mace_dragonbone:*>, <spartandefiled:mace_umbrium:*>);
<ore:spartanBattleaxe>.add(<spartanweaponry:battleaxe_steel:*>, <spartanweaponry:battleaxe_wood:*>, <spartanweaponry:battleaxe_stone:*>, <spartanweaponry:battleaxe_iron:*>, <spartanweaponry:battleaxe_gold:*>, <spartanweaponry:battleaxe_diamond:*>, <spartanweaponry:battleaxe_bronze:*>, <spartanweaponry:battleaxe_silver:*>, <spartanfire:battleaxe_desert_venom:*>, <spartanfire:battleaxe_jungle_venom:*>, <spartanfire:battleaxe_desert:*>, <spartanfire:battleaxe_jungle:*>, <spartanfire:battleaxe_ice_dragonbone:*>, <spartanfire:battleaxe_fire_dragonbone:*>, <spartanfire:battleaxe_dragonbone:*>, <spartandefiled:battleaxe_umbrium:*>);
<ore:spartanBoomerang>.add(<spartanweaponry:boomerang_steel:*>, <spartanweaponry:boomerang_wood:*>, <spartanweaponry:boomerang_stone:*>, <spartanweaponry:boomerang_iron:*>, <spartanweaponry:boomerang_gold:*>, <spartanweaponry:boomerang_diamond:*>, <spartanweaponry:boomerang_bronze:*>, <spartanweaponry:boomerang_silver:*>, <spartanfire:boomerang_desert_venom:*>, <spartanfire:boomerang_jungle_venom:*>, <spartanfire:boomerang_desert:*>, <spartanfire:boomerang_jungle:*>, <spartanfire:boomerang_ice_dragonbone:*>, <spartanfire:boomerang_fire_dragonbone:*>, <spartanfire:boomerang_dragonbone:*>, <spartandefiled:boomerang_umbrium:*>);
<ore:spartanjavelin>.add(<spartanweaponry:javelin_steel:*>, <spartanweaponry:javelin_wood:*>, <spartanweaponry:javelin_stone:*>, <spartanweaponry:javelin_iron:*>, <spartanweaponry:javelin_gold:*>, <spartanweaponry:javelin_diamond:*>, <spartanweaponry:javelin_bronze:*>, <spartanweaponry:javelin_silver:*>, <spartanfire:javelin_desert_venom:*>, <spartanfire:javelin_jungle_venom:*>, <spartanfire:javelin_desert:*>, <spartanfire:javelin_jungle:*>, <spartanfire:javelin_ice_dragonbone:*>, <spartanfire:javelin_fire_dragonbone:*>, <spartanfire:javelin_dragonbone:*>, <spartandefiled:javelin_umbrium:*>);
<ore:spartanThrowingAxe>.add(<spartanweaponry:throwing_axe_steel:*>, <spartanweaponry:throwing_axe_wood:*>, <spartanweaponry:throwing_axe_stone:*>, <spartanweaponry:throwing_axe_iron:*>, <spartanweaponry:throwing_axe_gold:*>, <spartanweaponry:throwing_axe_diamond:*>, <spartanweaponry:throwing_axe_bronze:*>, <spartanweaponry:throwing_axe_silver:*>, <spartanfire:throwing_axe_desert_venom:*>, <spartanfire:throwing_axe_jungle_venom:*>, <spartanfire:throwing_axe_desert:*>, <spartanfire:throwing_axe_jungle:*>, <spartanfire:throwing_axe_ice_dragonbone:*>, <spartanfire:throwing_axe_fire_dragonbone:*>, <spartanfire:throwing_axe_dragonbone:*>, <spartandefiled:throwing_axe_umbrium:*>);
<ore:spartanThrowingKnife>.add(<spartanweaponry:throwing_knife_steel:*>, <spartanweaponry:throwing_knife_wood:*>, <spartanweaponry:throwing_knife_stone:*>, <spartanweaponry:throwing_knife_iron:*>, <spartanweaponry:throwing_knife_gold:*>, <spartanweaponry:throwing_knife_diamond:*>, <spartanweaponry:throwing_knife_bronze:*>, <spartanweaponry:throwing_knife_silver:*>, <spartanfire:throwing_knife_desert_venom:*>, <spartanfire:throwing_knife_jungle_venom:*>, <spartanfire:throwing_knife_desert:*>, <spartanfire:throwing_knife_jungle:*>, <spartanfire:throwing_knife_ice_dragonbone:*>, <spartanfire:throwing_knife_fire_dragonbone:*>, <spartanfire:throwing_knife_dragonbone:*>, <spartandefiled:throwing_knife_umbrium:*>);
<ore:spartanCrossbow>.add(<spartanweaponry:crossbow_steel:*>, <spartanweaponry:crossbow_wood:*>, <spartanweaponry:crossbow_leather:*>, <spartanweaponry:crossbow_iron:*>, <spartanweaponry:crossbow_diamond:*>, <spartanweaponry:crossbow_bronze:*>, <spartanweaponry:crossbow_silver:*>, <spartanfire:crossbow_desert_venom:*>, <spartanfire:crossbow_jungle_venom:*>, <spartanfire:crossbow_desert:*>, <spartanfire:crossbow_jungle:*>, <spartanfire:crossbow_ice_dragonbone:*>, <spartanfire:crossbow_fire_dragonbone:*>, <spartanfire:crossbow_dragonbone:*>, <spartandefiled:crossbow_umbrium:*>);
<ore:spartanKatana>.add(<spartanweaponry:katana_steel:*>, <spartanweaponry:katana_wood:*>, <spartanweaponry:katana_stone:*>, <spartanweaponry:katana_iron:*>, <spartanweaponry:katana_gold:*>, <spartanweaponry:katana_diamond:*>, <spartanweaponry:katana_bronze:*>, <spartanweaponry:katana_silver:*>, <spartanfire:katana_desert_venom:*>, <spartanfire:katana_jungle_venom:*>, <spartanfire:katana_desert:*>, <spartanfire:katana_jungle:*>, <spartanfire:katana_ice_dragonbone:*>, <spartanfire:katana_fire_dragonbone:*>, <spartanfire:katana_dragonbone:*>, <spartandefiled:katana_umbrium:*>);
<ore:spartanLongsword>.add(<spartanweaponry:longsword_steel:*>, <spartanweaponry:longsword_wood:*>, <spartanweaponry:longsword_stone:*>, <spartanweaponry:longsword_iron:*>, <spartanweaponry:longsword_gold:*>, <spartanweaponry:longsword_diamond:*>, <spartanweaponry:longsword_bronze:*>, <spartanweaponry:longsword_silver:*>, <spartanfire:longsword_desert_venom:*>, <spartanfire:longsword_jungle_venom:*>, <spartanfire:longsword_desert:*>, <spartanfire:longsword_jungle:*>, <spartanfire:longsword_ice_dragonbone:*>, <spartanfire:longsword_fire_dragonbone:*>, <spartanfire:longsword_dragonbone:*>, <spartandefiled:longsword_umbrium:*>);
<ore:spartanGreatsword>.add(<spartanweaponry:greatsword_steel:*>, <spartanweaponry:greatsword_wood:*>, <spartanweaponry:greatsword_stone:*>, <spartanweaponry:greatsword_iron:*>, <spartanweaponry:greatsword_gold:*>, <spartanweaponry:greatsword_diamond:*>, <spartanweaponry:greatsword_bronze:*>, <spartanweaponry:greatsword_silver:*>, <spartanfire:greatsword_desert_venom:*>, <spartanfire:greatsword_jungle_venom:*>, <spartanfire:greatsword_desert:*>, <spartanfire:greatsword_jungle:*>, <spartanfire:greatsword_ice_dragonbone:*>, <spartanfire:greatsword_fire_dragonbone:*>, <spartanfire:greatsword_dragonbone:*>, <spartandefiled:greatsword_umbrium:*>);
<ore:spartanRapier>.add(<spartanweaponry:rapier_steel:*>, <spartanweaponry:saber_wood:*>, <spartanweaponry:rapier_stone:*>, <spartanweaponry:rapier_iron:*>, <spartanweaponry:rapier_gold:*>, <spartanweaponry:rapier_diamond:*>, <spartanweaponry:rapier_bronze:*>, <spartanweaponry:rapier_silver:*>, <spartanfire:rapier_desert_venom:*>, <spartanfire:rapier_jungle_venom:*>, <spartanfire:rapier_desert:*>, <spartanfire:rapier_jungle:*>, <spartanfire:rapier_ice_dragonbone:*>, <spartanfire:rapier_fire_dragonbone:*>, <spartanfire:rapier_dragonbone:*>, <spartandefiled:rapier_umbrium:*>);
<ore:spartanSaber>.add(<spartanweaponry:saber_steel:*>, <spartanweaponry:saber_stone:*>, <spartanweaponry:saber_iron:*>, <spartanweaponry:saber_gold:*>, <spartanweaponry:saber_diamond:*>, <spartanweaponry:saber_bronze:*>, <spartanweaponry:saber_silver:*>, <spartanfire:saber_desert_venom:*>, <spartanfire:saber_jungle_venom:*>, <spartanfire:saber_desert:*>, <spartanfire:saber_jungle:*>, <spartanfire:saber_ice_dragonbone:*>, <spartanfire:saber_fire_dragonbone:*>, <spartanfire:saber_dragonbone:*>, <spartandefiled:saber_umbrium:*>);
<ore:spartanLance>.add(<spartanweaponry:lance_steel:*>, <spartanweaponry:lance_wood:*>, <spartanweaponry:lance_stone:*>, <spartanweaponry:lance_iron:*>, <spartanweaponry:lance_gold:*>, <spartanweaponry:lance_diamond:*>, <spartanweaponry:lance_bronze:*>, <spartanweaponry:lance_silver:*>, <spartanfire:lance_desert_venom:*>, <spartanfire:lance_jungle_venom:*>, <spartanfire:lance_desert:*>, <spartanfire:lance_jungle:*>, <spartanfire:lance_ice_dragonbone:*>, <spartanfire:lance_fire_dragonbone:*>, <spartanfire:lance_dragonbone:*>, <spartandefiled:lance_umbrium:*>);
<ore:spartanPike>.add(<spartanweaponry:pike_steel:*>, <spartanweaponry:pike_wood:*>, <spartanweaponry:pike_stone:*>, <spartanweaponry:pike_iron:*>, <spartanweaponry:pike_gold:*>, <spartanweaponry:pike_diamond:*>, <spartanweaponry:pike_bronze:*>, <spartanweaponry:pike_silver:*>, <spartanfire:pike_desert_venom:*>, <spartanfire:pike_jungle_venom:*>, <spartanfire:pike_desert:*>, <spartanfire:pike_jungle:*>, <spartanfire:pike_ice_dragonbone:*>, <spartanfire:pike_fire_dragonbone:*>, <spartanfire:pike_dragonbone:*>, <spartandefiled:pike_umbrium:*>);
<ore:spartanSpear>.add(<spartanweaponry:spear_steel:*>, <spartanweaponry:spear_wood:*>, <spartanweaponry:spear_stone:*>, <spartanweaponry:spear_iron:*>, <spartanweaponry:spear_gold:*>, <spartanweaponry:spear_diamond:*>, <spartanweaponry:spear_bronze:*>, <spartanweaponry:spear_silver:*>, <spartanfire:spear_desert_venom:*>, <spartanfire:spear_jungle_venom:*>, <spartanfire:spear_desert:*>, <spartanfire:spear_jungle:*>, <spartanfire:spear_ice_dragonbone:*>, <spartanfire:spear_fire_dragonbone:*>, <spartanfire:spear_dragonbone:*>, <spartandefiled:spear_umbrium:*>);
<ore:spartanLongbow>.add(<spartanweaponry:longbow_steel:*>, <spartanweaponry:longbow_wood:*>, <spartanweaponry:longbow_leather:*>, <spartanweaponry:longbow_iron:*>, <spartanweaponry:longbow_diamond:*>, <spartanweaponry:longbow_bronze:*>, <spartanweaponry:longbow_silver:*>, <spartanfire:longbow_desert_venom:*>, <spartanfire:longbow_jungle_venom:*>, <spartanfire:longbow_desert:*>, <spartanfire:longbow_jungle:*>, <spartanfire:longbow_ice_dragonbone:*>, <spartanfire:longbow_fire_dragonbone:*>, <spartanfire:longbow_dragonbone:*>, <spartandefiled:longbow_umbrium:*>);
<ore:spartanHalberd>.add(<spartanweaponry:halberd_steel:*>, <spartanweaponry:halberd_wood:*>, <spartanweaponry:halberd_stone:*>, <spartanweaponry:halberd_iron:*>, <spartanweaponry:halberd_gold:*>, <spartanweaponry:halberd_diamond:*>, <spartanweaponry:halberd_bronze:*>, <spartanweaponry:halberd_silver:*>, <spartanfire:halberd_desert_venom:*>, <spartanfire:halberd_jungle_venom:*>, <spartanfire:halberd_desert:*>, <spartanfire:halberd_jungle:*>, <spartanfire:halberd_ice_dragonbone:*>, <spartanfire:halberd_fire_dragonbone:*>, <spartanfire:halberd_dragonbone:*>, <spartandefiled:halberd_umbrium:*>);
<ore:spartanHammer>.add(<spartanweaponry:hammer_steel:*>, <spartanweaponry:hammer_wood:*>, <spartanweaponry:hammer_stone:*>, <spartanweaponry:hammer_iron:*>, <spartanweaponry:hammer_gold:*>, <spartanweaponry:hammer_diamond:*>, <spartanweaponry:hammer_bronze:*>, <spartanweaponry:hammer_silver:*>, <spartanfire:hammer_desert_venom:*>, <spartanfire:hammer_jungle_venom:*>, <spartanfire:hammer_desert:*>, <spartanfire:hammer_jungle:*>, <spartanfire:hammer_ice_dragonbone:*>, <spartanfire:hammer_fire_dragonbone:*>, <spartanfire:hammer_dragonbone:*>, <spartandefiled:hammer_umbrium:*>);
<ore:spartanWarhammer>.add(<spartanweaponry:warhammer_steel:*>, <spartanweaponry:warhammer_wood:*>, <spartanweaponry:warhammer_stone:*>, <spartanweaponry:warhammer_iron:*>, <spartanweaponry:warhammer_gold:*>, <spartanweaponry:warhammer_diamond:*>, <spartanweaponry:warhammer_bronze:*>, <spartanweaponry:warhammer_silver:*>, <spartanfire:warhammer_desert_venom:*>, <spartanfire:warhammer_jungle_venom:*>, <spartanfire:warhammer_desert:*>, <spartanfire:warhammer_jungle:*>, <spartanfire:warhammer_ice_dragonbone:*>, <spartanfire:warhammer_fire_dragonbone:*>, <spartanfire:warhammer_dragonbone:*>, <spartandefiled:warhammer_umbrium:*>);
<ore:spartanDagger>.add(<spartanweaponry:dagger_steel:*>, <spartanweaponry:dagger_wood:*>, <spartanweaponry:dagger_stone:*>, <spartanweaponry:dagger_iron:*>, <spartanweaponry:dagger_gold:*>, <spartanweaponry:dagger_diamond:*>, <spartanweaponry:dagger_bronze:*>, <spartanweaponry:dagger_silver:*>, <spartanfire:dagger_desert_venom:*>, <spartanfire:dagger_jungle_venom:*>, <spartanfire:dagger_desert:*>, <spartanfire:dagger_jungle:*>, <spartanfire:dagger_ice_dragonbone:*>, <spartanfire:dagger_fire_dragonbone:*>, <spartanfire:dagger_dragonbone:*>, <spartandefiled:dagger_umbrium:*>);

<ore:lycaniteTreat>.add(<lycanitesmobs:planttreat:*>, <lycanitesmobs:dragontreat:*>, <lycanitesmobs:anthroniantreat:*>, <lycanitesmobs:undeadtreat:*>, <lycanitesmobs:demontreat:*>, <lycanitesmobs:imptreat:*>, <lycanitesmobs:aberrationtreat:*>, <lycanitesmobs:aviantreat:*>, <lycanitesmobs:amphibiantreat:*>, <lycanitesmobs:arachnidtreat:*>, <lycanitesmobs:wormtreat:*>, <lycanitesmobs:beasttreat:*>, <lycanitesmobs:insecttreat:*>, <lycanitesmobs:aquatictreat:*>, <lycanitesmobs:reptiletreat:*>);
<ore:lycaniteSaddle>.add(<lycanitesmobs:saddle_beast:*>, <lycanitesmobs:saddle_insect:*>, <lycanitesmobs:saddle_dragon:*>, <lycanitesmobs:saddle_amphibian:*>, <lycanitesmobs:saddle_reptile:*>, <lycanitesmobs:saddle_avian:*>, <lycanitesmobs:saddle_aquatic:*>, <lycanitesmobs:saddle_aberration:*>, <lycanitesmobs:saddle_demon:*>);

<ore:charmCrate>.add(<charm:crate:0>, <charm:crate:1>, <charm:crate:2>, <charm:crate:3>, <charm:crate:4>, <charm:crate:5>);

//<mujmajnkraftsbettersurvival:itemwoodnunchaku:*>.addTooltip(format.green("Continuous Attack"));
//<mujmajnkraftsbettersurvival:itemstonenunchaku:*>.addTooltip(format.green("Continuous Attack"));
//<mujmajnkraftsbettersurvival:itemironnunchaku:*>.addTooltip(format.green("Continuous Attack"));
//<mujmajnkraftsbettersurvival:itemdiamondnunchaku:*>.addTooltip(format.green("Continuous Attack"));
//<mujmajnkraftsbettersurvival:itemgoldnunchaku:*>.addTooltip(format.green("Continuous Attack"));
//<mujmajnkraftsbettersurvival:itembronzenunchaku:*>.addTooltip(format.green("Continuous Attack"));
//<mujmajnkraftsbettersurvival:itemsilvernunchaku:*>.addTooltip(format.green("Continuous Attack"));
//<mujmajnkraftsbettersurvival:itemsteelnunchaku:*>.addTooltip(format.green("Continuous Attack"));
//<mujmajnkraftsbettersurvival:itemdragonbonenunchaku:*>.addTooltip(format.green("Continuous Attack"));
//<mujmajnkraftsbettersurvival:itemjunglechitinnunchaku:*>.addTooltip(format.green("Continuous Attack"));
//<mujmajnkraftsbettersurvival:itemdesertchitinnunchaku:*>.addTooltip(format.green("Continuous Attack"));

//<mujmajnkraftsbettersurvival:itemwooddagger:*>.addTooltip(format.green("Backstab Bonus"));
//<mujmajnkraftsbettersurvival:itemstonedagger:*>.addTooltip(format.green("Backstab Bonus"));
//<mujmajnkraftsbettersurvival:itemirondagger:*>.addTooltip(format.green("Backstab Bonus"));
//<mujmajnkraftsbettersurvival:itemdiamonddagger:*>.addTooltip(format.green("Backstab Bonus"));
//<mujmajnkraftsbettersurvival:itemgolddagger:*>.addTooltip(format.green("Backstab Bonus"));
//<mujmajnkraftsbettersurvival:itembronzedagger:*>.addTooltip(format.green("Backstab Bonus"));
//<mujmajnkraftsbettersurvival:itemsilverdagger:*>.addTooltip(format.green("Backstab Bonus"));
//<mujmajnkraftsbettersurvival:itemsteeldagger:*>.addTooltip(format.green("Backstab Bonus"));
//<mujmajnkraftsbettersurvival:itemdragonbonedagger:*>.addTooltip(format.green("Backstab Bonus"));
//<mujmajnkraftsbettersurvival:itemjunglechitindagger:*>.addTooltip(format.green("Backstab Bonus"));
//<mujmajnkraftsbettersurvival:itemdesertchitindagger:*>.addTooltip(format.green("Backstab Bonus"));

//<mujmajnkraftsbettersurvival:itemwoodbattleaxe:*>.addTooltip(format.green("Disarming Chance"));
//<mujmajnkraftsbettersurvival:itemstonebattleaxe:*>.addTooltip(format.green("Disarming Chance"));
//<mujmajnkraftsbettersurvival:itemironbattleaxe:*>.addTooltip(format.green("Disarming Chance"));
//<mujmajnkraftsbettersurvival:itemdiamondbattleaxe:*>.addTooltip(format.green("Disarming Chance"));
//<mujmajnkraftsbettersurvival:itemgoldbattleaxe:*>.addTooltip(format.green("Disarming Chance"));
//<mujmajnkraftsbettersurvival:itembronzebattleaxe:*>.addTooltip(format.green("Disarming Chance"));
//<mujmajnkraftsbettersurvival:itemsilverbattleaxe:*>.addTooltip(format.green("Disarming Chance"));
//<mujmajnkraftsbettersurvival:itemsteelbattleaxe:*>.addTooltip(format.green("Disarming Chance"));
//<mujmajnkraftsbettersurvival:itemdragonbonebattleaxe:*>.addTooltip(format.green("Disarming Chance"));
//<mujmajnkraftsbettersurvival:itemjunglechitinbattleaxe:*>.addTooltip(format.green("Disarming Chance"));
//<mujmajnkraftsbettersurvival:itemdesertchitinbattleaxe:*>.addTooltip(format.green("Disarming Chance"));

//<mujmajnkraftsbettersurvival:itemwoodspear:*>.addTooltip(format.green("Extended Reach, Throwable"));
//<mujmajnkraftsbettersurvival:itemstonespear:*>.addTooltip(format.green("Extended Reach, Throwable"));
//<mujmajnkraftsbettersurvival:itemironspear:*>.addTooltip(format.green("Extended Reach, Throwable"));
//<mujmajnkraftsbettersurvival:itemdiamondspear:*>.addTooltip(format.green("Extended Reach, Throwable"));
//<mujmajnkraftsbettersurvival:itemgoldspear:*>.addTooltip(format.green("Extended Reach, Throwable"));
//<mujmajnkraftsbettersurvival:itembronzespear:*>.addTooltip(format.green("Extended Reach, Throwable"));
//<mujmajnkraftsbettersurvival:itemsilverspear:*>.addTooltip(format.green("Extended Reach, Throwable"));
//<mujmajnkraftsbettersurvival:itemsteelspear:*>.addTooltip(format.green("Extended Reach, Throwable"));
//<mujmajnkraftsbettersurvival:itemdragonbonespear:*>.addTooltip(format.green("Extended Reach, Throwable"));
//<mujmajnkraftsbettersurvival:itemjunglechitinspear:*>.addTooltip(format.green("Extended Reach, Throwable"));
//<mujmajnkraftsbettersurvival:itemdesertchitinspear:*>.addTooltip(format.green("Extended Reach, Throwable"));

//<mujmajnkraftsbettersurvival:itemwoodhammer:*>.addTooltip(format.green("Secondary Attack, Stun And Knockback"));
//<mujmajnkraftsbettersurvival:itemstonehammer:*>.addTooltip(format.green("Secondary Attack, Stun And Knockback"));
//<mujmajnkraftsbettersurvival:itemironhammer:*>.addTooltip(format.green("Secondary Attack, Stun And Knockback"));
//<mujmajnkraftsbettersurvival:itemdiamondhammer:*>.addTooltip(format.green("Secondary Attack, Stun And Knockback"));
//<mujmajnkraftsbettersurvival:itemgoldhammer:*>.addTooltip(format.green("Secondary Attack, Stun And Knockback"));
//<mujmajnkraftsbettersurvival:itembronzehammer:*>.addTooltip(format.green("Secondary Attack, Stun And Knockback"));
//<mujmajnkraftsbettersurvival:itemsilverhammer:*>.addTooltip(format.green("Secondary Attack, Stun And Knockback"));
//<mujmajnkraftsbettersurvival:itemsteelhammer:*>.addTooltip(format.green("Secondary Attack, Stun And Knockback"));
//<mujmajnkraftsbettersurvival:itemdragonbonehammer:*>.addTooltip(format.green("Secondary Attack, Stun And Knockback"));
//<mujmajnkraftsbettersurvival:itemjunglechitinhammer:*>.addTooltip(format.green("Secondary Attack, Stun And Knockback"));
//<mujmajnkraftsbettersurvival:itemdesertchitinhammer:*>.addTooltip(format.green("Secondary Attack, Stun And Knockback"));

<sereneseasons:greenhouse_glass:*>.addTooltip(format.green("Allows crops up to 7 blocks directly beneath to grow in any season"));

furnace.addRecipe(<defiledlands:umbrium_nugget> * 4, <spartandefiled:longbow_umbrium:*>, 99999);
furnace.addRecipe(<defiledlands:umbrium_nugget> * 4, <spartandefiled:crossbow_umbrium:*>, 99999);
furnace.addRecipe(<minecraft:iron_nugget> * 4, <spartanweaponry:longbow_iron:*>, 99999);
furnace.addRecipe(<minecraft:iron_nugget> * 4, <spartanweaponry:crossbow_iron:*>, 99999);
furnace.addRecipe(<variedcommodities:coin_diamond> * 4, <spartanweaponry:longbow_diamond:*>, 99999);
furnace.addRecipe(<variedcommodities:coin_diamond> * 4, <spartanweaponry:crossbow_diamond:*>, 99999);
furnace.addRecipe(<iceandfire:silver_nugget> * 4, <spartanweaponry:longbow_silver:*>, 99999);
furnace.addRecipe(<iceandfire:silver_nugget> * 4, <spartanweaponry:crossbow_silver:*>, 99999);
furnace.addRecipe(<contenttweaker:steel_nugget> * 4, <spartanweaponry:longbow_steel:*>, 99999);
furnace.addRecipe(<contenttweaker:steel_nugget> * 4, <spartanweaponry:crossbow_steel:*>, 99999);
furnace.addRecipe(<variedcommodities:coin_bronze> * 4, <spartanweaponry:longbow_bronze:*>, 99999);
furnace.addRecipe(<variedcommodities:coin_bronze> * 4, <spartanweaponry:crossbow_bronze:*>, 99999);

recipes.remove(<inspirations:materials:2>);
recipes.remove(<inspirations:materials:3>);

recipes.remove(<minecraft:trapdoor>);
//recipes.remove(<minecraft:iron_trapdoor>);
recipes.remove(<quark:spruce_trapdoor>);
recipes.remove(<quark:birch_trapdoor>);
recipes.remove(<quark:jungle_trapdoor>);
recipes.remove(<quark:acacia_trapdoor>);
recipes.remove(<quark:dark_oak_trapdoor>);
recipes.remove(<minecraft:wooden_door>);
recipes.remove(<minecraft:iron_door>);
recipes.remove(<minecraft:spruce_door>);
recipes.remove(<minecraft:birch_door>);
recipes.remove(<minecraft:jungle_door>);
recipes.remove(<minecraft:acacia_door>);
recipes.remove(<minecraft:dark_oak_door>);
recipes.remove(<betternether:bone_reed_door>);
recipes.remove(<betternether:bone_cincinnasite_door>);
recipes.remove(<defiledlands:tenebra_door>);
recipes.remove(<rustic:olive_door>);
recipes.remove(<rustic:ironwood_door>);
recipes.remove(<traverse:fir_door>);

recipes.remove(<quark:stained_planks:*>);

recipes.remove(<rustic:painted_wood_white>);
recipes.remove(<rustic:painted_wood_orange>);
recipes.remove(<rustic:painted_wood_magenta>);
recipes.remove(<rustic:painted_wood_light_blue>);
recipes.remove(<rustic:painted_wood_yellow>);
recipes.remove(<rustic:painted_wood_lime>);
recipes.remove(<rustic:painted_wood_pink>);
recipes.remove(<rustic:painted_wood_gray>);
recipes.remove(<rustic:painted_wood_silver>);
recipes.remove(<rustic:painted_wood_cyan>);
recipes.remove(<rustic:painted_wood_purple>);
recipes.remove(<rustic:painted_wood_blue>);
recipes.remove(<rustic:painted_wood_brown>);
recipes.remove(<rustic:painted_wood_green>);
recipes.remove(<rustic:painted_wood_red>);
recipes.remove(<rustic:painted_wood_black>);

recipes.remove(<quark:rune:0>);
recipes.remove(<quark:rune:1>);
recipes.remove(<quark:rune:2>);
recipes.remove(<quark:rune:3>);
recipes.remove(<quark:rune:4>);
recipes.remove(<quark:rune:5>);
recipes.remove(<quark:rune:6>);
recipes.remove(<quark:rune:7>);
recipes.remove(<quark:rune:8>);
recipes.remove(<quark:rune:9>);
recipes.remove(<quark:rune:10>);
recipes.remove(<quark:rune:11>);
recipes.remove(<quark:rune:12>);
recipes.remove(<quark:rune:13>);
recipes.remove(<quark:rune:14>);
recipes.remove(<quark:rune:15>);
recipes.remove(<quark:rune:16>);

recipes.remove(<betternether:reeds_fence>);
recipes.remove(<betternether:stalagnate_planks_fence>);

recipes.remove(<minecraft:saddle>);

recipes.addShaped("lolarecipe146",<betternether:stalagnate_planks_fence>*3,
 [[<betternether:stalagnate_planks>,<minecraft:stick>,<betternether:stalagnate_planks>],
  [<betternether:stalagnate_planks>,<minecraft:stick>,<betternether:stalagnate_planks>]]);

recipes.addShaped("lolarecipe147",<betternether:reeds_fence>*3,
 [[<betternether:reeds_block>,<minecraft:stick>,<betternether:reeds_block>],
  [<betternether:reeds_block>,<minecraft:stick>,<betternether:reeds_block>]]);

//===============
//RUNE TIME
//===============

recipes.addShaped("quarkrunewhite",<quark:rune:0>,
 [[<quark:crystal:0>,<quark:crystal:0>,<quark:crystal:0>],
  [<quark:crystal:0>,<ore:stone>,<quark:crystal:0>],
  [<quark:crystal:0>,<quark:crystal:0>,<quark:crystal:0>]]);
  
recipes.addShaped("quarkruneorange",<quark:rune:1>,
 [[<quark:crystal:2>,<quark:crystal:2>,<quark:crystal:2>],
  [<quark:crystal:2>,<ore:stone>,<quark:crystal:2>],
  [<quark:crystal:2>,<quark:crystal:2>,<quark:crystal:2>]]);
  
recipes.addShaped("quarkrunemagenta",<quark:rune:2>,
 [[<quark:crystal:7>,<quark:crystal:7>,<quark:crystal:7>],
  [<quark:crystal:7>,<ore:stone>,<quark:crystal:7>],
  [<quark:crystal:7>,<quark:crystal:7>,<quark:crystal:7>]]);
  
recipes.addShaped("quarkrunelightblue",<quark:rune:3>,
 [[<quark:crystal:6>,<quark:crystal:0>,<quark:crystal:6>],
  [<quark:crystal:0>,<ore:stone>,<quark:crystal:0>],
  [<quark:crystal:6>,<quark:crystal:0>,<quark:crystal:6>]]); 
  
recipes.addShaped("quarkruneyellow",<quark:rune:4>,
 [[<quark:crystal:3>,<quark:crystal:3>,<quark:crystal:3>],
  [<quark:crystal:3>,<ore:stone>,<quark:crystal:3>],
  [<quark:crystal:3>,<quark:crystal:3>,<quark:crystal:3>]]);
  
recipes.addShaped("quarkrunelime",<quark:rune:5>,
 [[<quark:crystal:4>,<quark:crystal:4>,<quark:crystal:4>],
  [<quark:crystal:4>,<ore:stone>,<quark:crystal:4>],
  [<quark:crystal:4>,<quark:crystal:4>,<quark:crystal:4>]]);
  
recipes.addShaped("quarkrunepink",<quark:rune:6>,
 [[<quark:crystal:1>,<quark:crystal:0>,<quark:crystal:1>],
  [<quark:crystal:0>,<ore:stone>,<quark:crystal:0>],
  [<quark:crystal:1>,<quark:crystal:0>,<quark:crystal:1>]]);
  
recipes.addShaped("quarkrunegray",<quark:rune:7>,
 [[<quark:crystal:8>,<quark:crystal:0>,<quark:crystal:8>],
  [<quark:crystal:0>,<ore:stone>,<quark:crystal:0>],
  [<quark:crystal:8>,<quark:crystal:0>,<quark:crystal:8>]]);
  
recipes.addShaped("quarkrunelightgray",<quark:rune:8>,
 [[<quark:crystal:0>,<quark:crystal:8>,<quark:crystal:0>],
  [<quark:crystal:0>,<ore:stone>,<quark:crystal:0>],
  [<quark:crystal:0>,<quark:crystal:8>,<quark:crystal:0>]]);
  
recipes.addShaped("quarkrunecyan",<quark:rune:9>,
 [[<quark:crystal:5>,<quark:crystal:5>,<quark:crystal:5>],
  [<quark:crystal:5>,<ore:stone>,<quark:crystal:5>],
  [<quark:crystal:5>,<quark:crystal:5>,<quark:crystal:5>]]);
  
recipes.addShaped("quarkrunepurple",<quark:rune:10>,
 [[<quark:crystal:1>,<quark:crystal:6>,<quark:crystal:1>],
  [<quark:crystal:6>,<ore:stone>,<quark:crystal:6>],
  [<quark:crystal:1>,<quark:crystal:6>,<quark:crystal:1>]]);
  
recipes.addShaped("quarkruneblue",<quark:rune:11>,
 [[<quark:crystal:6>,<quark:crystal:6>,<quark:crystal:6>],
  [<quark:crystal:6>,<ore:stone>,<quark:crystal:6>],
  [<quark:crystal:6>,<quark:crystal:6>,<quark:crystal:6>]]);
  
recipes.addShaped("quarkrunebrown",<quark:rune:12>,
 [[<quark:crystal:2>,<quark:crystal:8>,<quark:crystal:2>],
  [<quark:crystal:8>,<ore:stone>,<quark:crystal:8>],
  [<quark:crystal:2>,<quark:crystal:8>,<quark:crystal:2>]]);
  
recipes.addShaped("quarkrunegreen",<quark:rune:13>,
 [[<quark:crystal:4>,<quark:crystal:8>,<quark:crystal:4>],
  [<quark:crystal:8>,<ore:stone>,<quark:crystal:8>],
  [<quark:crystal:4>,<quark:crystal:8>,<quark:crystal:4>]]);
  
recipes.addShaped("quarkrunered",<quark:rune:14>,
 [[<quark:crystal:1>,<quark:crystal:1>,<quark:crystal:1>],
  [<quark:crystal:1>,<ore:stone>,<quark:crystal:1>],
  [<quark:crystal:1>,<quark:crystal:1>,<quark:crystal:1>]]);
  
recipes.addShaped("quarkruneblack",<quark:rune:15>,
 [[<quark:crystal:8>,<quark:crystal:8>,<quark:crystal:8>],
  [<quark:crystal:8>,<ore:stone>,<quark:crystal:8>],
  [<quark:crystal:8>,<quark:crystal:8>,<quark:crystal:8>]]);
  
recipes.addShaped("quarkrunerainbow",<quark:rune:16>*8,
 [[<quark:rune:0>,<quark:rune:1>,<quark:rune:2>],
  [<quark:rune:14>,<minecraft:glass>,<quark:rune:4>],
  [<quark:rune:11>,<quark:rune:9>,<quark:rune:5>]]);

//===============
//DOOR TIME
//===============

recipes.addShaped("loltrapdoor1",<minecraft:trapdoor>*4,
 [[<minecraft:planks:0>,<minecraft:planks:0>,<minecraft:planks:0>],
  [<minecraft:planks:0>,<minecraft:planks:0>,<minecraft:planks:0>]]);

//recipes.addShaped("loltrapdoor2",<minecraft:iron_trapdoor>*4,
// [[<minecraft:iron_ingot>,<minecraft:iron_ingot>,<minecraft:iron_ingot>],
//  [<minecraft:iron_ingot>,<minecraft:iron_ingot>,<minecraft:iron_ingot>]]);

recipes.addShaped("loltrapdoor3",<quark:spruce_trapdoor>*4,
 [[<minecraft:planks:1>,<minecraft:planks:1>,<minecraft:planks:1>],
  [<minecraft:planks:1>,<minecraft:planks:1>,<minecraft:planks:1>]]);

recipes.addShaped("loltrapdoor4",<quark:birch_trapdoor>*4,
 [[<minecraft:planks:2>,<minecraft:planks:2>,<minecraft:planks:2>],
  [<minecraft:planks:2>,<minecraft:planks:2>,<minecraft:planks:2>]]);

recipes.addShaped("loltrapdoor5",<quark:jungle_trapdoor>*4,
 [[<minecraft:planks:3>,<minecraft:planks:3>,<minecraft:planks:3>],
  [<minecraft:planks:3>,<minecraft:planks:3>,<minecraft:planks:3>]]);

recipes.addShaped("loltrapdoor6",<quark:acacia_trapdoor>*4,
 [[<minecraft:planks:4>,<minecraft:planks:4>,<minecraft:planks:4>],
  [<minecraft:planks:4>,<minecraft:planks:4>,<minecraft:planks:4>]]);

recipes.addShaped("loltrapdoor7",<quark:dark_oak_trapdoor>*4,
 [[<minecraft:planks:5>,<minecraft:planks:5>,<minecraft:planks:5>],
  [<minecraft:planks:5>,<minecraft:planks:5>,<minecraft:planks:5>]]);

recipes.addShaped("loldoor1",<minecraft:wooden_door>*2,
 [[<minecraft:planks:0>,<minecraft:planks:0>],
  [<minecraft:planks:0>,<minecraft:planks:0>],
  [<minecraft:planks:0>,<minecraft:planks:0>]]);

recipes.addShaped("loldoor2",<minecraft:iron_door>*1,
 [[<minecraft:iron_ingot>,<minecraft:iron_ingot>],
  [<minecraft:iron_ingot>,<minecraft:iron_ingot>],
  [<minecraft:iron_ingot>,<minecraft:iron_ingot>]]);

recipes.addShaped("loldoor3",<minecraft:spruce_door>*2,
 [[<minecraft:planks:1>,<minecraft:planks:1>],
  [<minecraft:planks:1>,<minecraft:planks:1>],
  [<minecraft:planks:1>,<minecraft:planks:1>]]);

recipes.addShaped("loldoor4",<minecraft:birch_door>*2,
 [[<minecraft:planks:2>,<minecraft:planks:2>],
  [<minecraft:planks:2>,<minecraft:planks:2>],
  [<minecraft:planks:2>,<minecraft:planks:2>]]);

recipes.addShaped("loldoor5",<minecraft:jungle_door>*2,
 [[<minecraft:planks:3>,<minecraft:planks:3>],
  [<minecraft:planks:3>,<minecraft:planks:3>],
  [<minecraft:planks:3>,<minecraft:planks:3>]]);

recipes.addShaped("loldoor6",<minecraft:acacia_door>*2,
 [[<minecraft:planks:4>,<minecraft:planks:4>],
  [<minecraft:planks:4>,<minecraft:planks:4>],
  [<minecraft:planks:4>,<minecraft:planks:4>]]);

recipes.addShaped("loldoor7",<minecraft:dark_oak_door>*2,
 [[<minecraft:planks:5>,<minecraft:planks:5>],
  [<minecraft:planks:5>,<minecraft:planks:5>],
  [<minecraft:planks:5>,<minecraft:planks:5>]]);

recipes.addShaped("loldoor8",<betternether:bone_reed_door>*2,
 [[<betternether:reeds_block>,<betternether:bone_block>],
  [<betternether:bone_block>,<betternether:bone_block>],
  [<betternether:bone_block>,<betternether:reeds_block>]]);

recipes.addShaped("loldoor9",<betternether:bone_cincinnasite_door>*2,
 [[<betternether:cincinnasite_forged>,<betternether:bone_block>],
  [<betternether:bone_block>,<betternether:bone_block>],
  [<betternether:bone_block>,<betternether:cincinnasite_forged>]]);

recipes.addShaped("loldoor10",<defiledlands:tenebra_door>*2,
 [[<defiledlands:tenebra_planks>,<defiledlands:tenebra_planks>],
  [<defiledlands:tenebra_planks>,<defiledlands:tenebra_planks>],
  [<defiledlands:tenebra_planks>,<defiledlands:tenebra_planks>]]);

recipes.addShaped("loldoor11",<rustic:olive_door>*2,
 [[<rustic:planks:0>,<rustic:planks:0>],
  [<rustic:planks:0>,<rustic:planks:0>],
  [<rustic:planks:0>,<rustic:planks:0>]]);

recipes.addShaped("loldoor12",<rustic:ironwood_door>*2,
 [[<rustic:planks:1>,<rustic:planks:1>],
  [<rustic:planks:1>,<rustic:planks:1>],
  [<rustic:planks:1>,<rustic:planks:1>]]);

recipes.addShaped("loldoor13",<traverse:fir_door>*2,
 [[<traverse:fir_planks>,<traverse:fir_planks>],
  [<traverse:fir_planks>,<traverse:fir_planks>],
  [<traverse:fir_planks>,<traverse:fir_planks>]]);

//=====================
//PLANK STUFF
//=====================

recipes.addShaped("lolarecipeSTAIN0",<quark:stained_planks:0>*8,
 [[<minecraft:planks:2>,<minecraft:planks:2>,<minecraft:planks:2>],
  [<minecraft:planks:2>,<ore:dyeWhite>,<minecraft:planks:2>],
  [<minecraft:planks:2>,<minecraft:planks:2>,<minecraft:planks:2>]]);

recipes.addShaped("lolarecipeSTAIN1",<quark:stained_planks:1>*8,
 [[<minecraft:planks:2>,<minecraft:planks:2>,<minecraft:planks:2>],
  [<minecraft:planks:2>,<ore:dyeOrange>,<minecraft:planks:2>],
  [<minecraft:planks:2>,<minecraft:planks:2>,<minecraft:planks:2>]]);

recipes.addShaped("lolarecipeSTAIN2",<quark:stained_planks:2>*8,
 [[<minecraft:planks:2>,<minecraft:planks:2>,<minecraft:planks:2>],
  [<minecraft:planks:2>,<ore:dyeMagenta>,<minecraft:planks:2>],
  [<minecraft:planks:2>,<minecraft:planks:2>,<minecraft:planks:2>]]);

recipes.addShaped("lolarecipeSTAIN3",<quark:stained_planks:3>*8,
 [[<minecraft:planks:2>,<minecraft:planks:2>,<minecraft:planks:2>],
  [<minecraft:planks:2>,<ore:dyeLightBlue>,<minecraft:planks:2>],
  [<minecraft:planks:2>,<minecraft:planks:2>,<minecraft:planks:2>]]);

recipes.addShaped("lolarecipeSTAIN4",<quark:stained_planks:4>*8,
 [[<minecraft:planks:2>,<minecraft:planks:2>,<minecraft:planks:2>],
  [<minecraft:planks:2>,<ore:dyeYellow>,<minecraft:planks:2>],
  [<minecraft:planks:2>,<minecraft:planks:2>,<minecraft:planks:2>]]);

recipes.addShaped("lolarecipeSTAIN5",<quark:stained_planks:5>*8,
 [[<minecraft:planks:2>,<minecraft:planks:2>,<minecraft:planks:2>],
  [<minecraft:planks:2>,<ore:dyeLime>,<minecraft:planks:2>],
  [<minecraft:planks:2>,<minecraft:planks:2>,<minecraft:planks:2>]]);

recipes.addShaped("lolarecipeSTAIN6",<quark:stained_planks:6>*8,
 [[<minecraft:planks:2>,<minecraft:planks:2>,<minecraft:planks:2>],
  [<minecraft:planks:2>,<ore:dyePink>,<minecraft:planks:2>],
  [<minecraft:planks:2>,<minecraft:planks:2>,<minecraft:planks:2>]]);

recipes.addShaped("lolarecipeSTAIN7",<quark:stained_planks:7>*8,
 [[<minecraft:planks:2>,<minecraft:planks:2>,<minecraft:planks:2>],
  [<minecraft:planks:2>,<ore:dyeGray>,<minecraft:planks:2>],
  [<minecraft:planks:2>,<minecraft:planks:2>,<minecraft:planks:2>]]);

recipes.addShaped("lolarecipeSTAIN8",<quark:stained_planks:8>*8,
 [[<minecraft:planks:2>,<minecraft:planks:2>,<minecraft:planks:2>],
  [<minecraft:planks:2>,<ore:dyeLightGray>,<minecraft:planks:2>],
  [<minecraft:planks:2>,<minecraft:planks:2>,<minecraft:planks:2>]]);

recipes.addShaped("lolarecipeSTAIN9",<quark:stained_planks:9>*8,
 [[<minecraft:planks:2>,<minecraft:planks:2>,<minecraft:planks:2>],
  [<minecraft:planks:2>,<ore:dyeCyan>,<minecraft:planks:2>],
  [<minecraft:planks:2>,<minecraft:planks:2>,<minecraft:planks:2>]]);

recipes.addShaped("lolarecipeSTAIN10",<quark:stained_planks:10>*8,
 [[<minecraft:planks:2>,<minecraft:planks:2>,<minecraft:planks:2>],
  [<minecraft:planks:2>,<ore:dyePurple>,<minecraft:planks:2>],
  [<minecraft:planks:2>,<minecraft:planks:2>,<minecraft:planks:2>]]);

recipes.addShaped("lolarecipeSTAIN11",<quark:stained_planks:11>*8,
 [[<minecraft:planks:2>,<minecraft:planks:2>,<minecraft:planks:2>],
  [<minecraft:planks:2>,<ore:dyeBlue>,<minecraft:planks:2>],
  [<minecraft:planks:2>,<minecraft:planks:2>,<minecraft:planks:2>]]);

recipes.addShaped("lolarecipeSTAIN12",<quark:stained_planks:12>*8,
 [[<minecraft:planks:2>,<minecraft:planks:2>,<minecraft:planks:2>],
  [<minecraft:planks:2>,<ore:dyeBrown>,<minecraft:planks:2>],
  [<minecraft:planks:2>,<minecraft:planks:2>,<minecraft:planks:2>]]);

recipes.addShaped("lolarecipeSTAIN13",<quark:stained_planks:13>*8,
 [[<minecraft:planks:2>,<minecraft:planks:2>,<minecraft:planks:2>],
  [<minecraft:planks:2>,<ore:dyeGreen>,<minecraft:planks:2>],
  [<minecraft:planks:2>,<minecraft:planks:2>,<minecraft:planks:2>]]);

recipes.addShaped("lolarecipeSTAIN14",<quark:stained_planks:14>*8,
 [[<minecraft:planks:2>,<minecraft:planks:2>,<minecraft:planks:2>],
  [<minecraft:planks:2>,<ore:dyeRed>,<minecraft:planks:2>],
  [<minecraft:planks:2>,<minecraft:planks:2>,<minecraft:planks:2>]]);

recipes.addShaped("lolarecipeSTAIN15",<quark:stained_planks:15>*8,
 [[<minecraft:planks:2>,<minecraft:planks:2>,<minecraft:planks:2>],
  [<minecraft:planks:2>,<ore:dyeBlack>,<minecraft:planks:2>],
  [<minecraft:planks:2>,<minecraft:planks:2>,<minecraft:planks:2>]]);

recipes.addShaped("lolarecipeDYE0",<rustic:painted_wood_white>*8,
 [[<quark:stained_planks:0>,<quark:stained_planks:0>,<quark:stained_planks:0>],
  [<quark:stained_planks:0>,<ore:dyeWhite>,<quark:stained_planks:0>],
  [<quark:stained_planks:0>,<quark:stained_planks:0>,<quark:stained_planks:0>]]);

recipes.addShaped("lolarecipeDYE1",<rustic:painted_wood_orange>*8,
 [[<quark:stained_planks:1>,<quark:stained_planks:1>,<quark:stained_planks:1>],
  [<quark:stained_planks:1>,<ore:dyeOrange>,<quark:stained_planks:1>],
  [<quark:stained_planks:1>,<quark:stained_planks:1>,<quark:stained_planks:1>]]);

recipes.addShaped("lolarecipeDYE2",<rustic:painted_wood_magenta>*8,
 [[<quark:stained_planks:2>,<quark:stained_planks:2>,<quark:stained_planks:2>],
  [<quark:stained_planks:2>,<ore:dyeMagenta>,<quark:stained_planks:2>],
  [<quark:stained_planks:2>,<quark:stained_planks:2>,<quark:stained_planks:2>]]);

recipes.addShaped("lolarecipeDYE3",<rustic:painted_wood_light_blue>*8,
 [[<quark:stained_planks:3>,<quark:stained_planks:3>,<quark:stained_planks:3>],
  [<quark:stained_planks:3>,<ore:dyeLightBlue>,<quark:stained_planks:3>],
  [<quark:stained_planks:3>,<quark:stained_planks:3>,<quark:stained_planks:3>]]);

recipes.addShaped("lolarecipeDYE4",<rustic:painted_wood_yellow>*8,
 [[<quark:stained_planks:4>,<quark:stained_planks:4>,<quark:stained_planks:4>],
  [<quark:stained_planks:4>,<ore:dyeYellow>,<quark:stained_planks:4>],
  [<quark:stained_planks:4>,<quark:stained_planks:4>,<quark:stained_planks:4>]]);

recipes.addShaped("lolarecipeDYE5",<rustic:painted_wood_lime>*8,
 [[<quark:stained_planks:5>,<quark:stained_planks:5>,<quark:stained_planks:5>],
  [<quark:stained_planks:5>,<ore:dyeLime>,<quark:stained_planks:5>],
  [<quark:stained_planks:5>,<quark:stained_planks:5>,<quark:stained_planks:5>]]);

recipes.addShaped("lolarecipeDYE6",<rustic:painted_wood_pink>*8,
 [[<quark:stained_planks:6>,<quark:stained_planks:6>,<quark:stained_planks:6>],
  [<quark:stained_planks:6>,<ore:dyePink>,<quark:stained_planks:6>],
  [<quark:stained_planks:6>,<quark:stained_planks:6>,<quark:stained_planks:6>]]);

recipes.addShaped("lolarecipeDYE7",<rustic:painted_wood_gray>*8,
 [[<quark:stained_planks:7>,<quark:stained_planks:7>,<quark:stained_planks:7>],
  [<quark:stained_planks:7>,<ore:dyeGray>,<quark:stained_planks:7>],
  [<quark:stained_planks:7>,<quark:stained_planks:7>,<quark:stained_planks:7>]]);

recipes.addShaped("lolarecipeDYE8",<rustic:painted_wood_silver>*8,
 [[<quark:stained_planks:8>,<quark:stained_planks:8>,<quark:stained_planks:8>],
  [<quark:stained_planks:8>,<ore:dyeLightGray>,<quark:stained_planks:8>],
  [<quark:stained_planks:8>,<quark:stained_planks:8>,<quark:stained_planks:8>]]);

recipes.addShaped("lolarecipeDYE9",<rustic:painted_wood_cyan>*8,
 [[<quark:stained_planks:9>,<quark:stained_planks:9>,<quark:stained_planks:9>],
  [<quark:stained_planks:9>,<ore:dyeCyan>,<quark:stained_planks:9>],
  [<quark:stained_planks:9>,<quark:stained_planks:9>,<quark:stained_planks:9>]]);

recipes.addShaped("lolarecipeDYE10",<rustic:painted_wood_purple>*8,
 [[<quark:stained_planks:10>,<quark:stained_planks:10>,<quark:stained_planks:10>],
  [<quark:stained_planks:10>,<ore:dyePurple>,<quark:stained_planks:10>],
  [<quark:stained_planks:10>,<quark:stained_planks:10>,<quark:stained_planks:10>]]);

recipes.addShaped("lolarecipeDYE11",<rustic:painted_wood_blue>*8,
 [[<quark:stained_planks:11>,<quark:stained_planks:11>,<quark:stained_planks:11>],
  [<quark:stained_planks:11>,<ore:dyeBlue>,<quark:stained_planks:11>],
  [<quark:stained_planks:11>,<quark:stained_planks:11>,<quark:stained_planks:11>]]);

recipes.addShaped("lolarecipeDYE12",<rustic:painted_wood_brown>*8,
 [[<quark:stained_planks:12>,<quark:stained_planks:12>,<quark:stained_planks:12>],
  [<quark:stained_planks:12>,<ore:dyeBrown>,<quark:stained_planks:12>],
  [<quark:stained_planks:12>,<quark:stained_planks:12>,<quark:stained_planks:12>]]);

recipes.addShaped("lolarecipeDYE13",<rustic:painted_wood_green>*8,
 [[<quark:stained_planks:13>,<quark:stained_planks:13>,<quark:stained_planks:13>],
  [<quark:stained_planks:13>,<ore:dyeGreen>,<quark:stained_planks:13>],
  [<quark:stained_planks:13>,<quark:stained_planks:13>,<quark:stained_planks:13>]]);

recipes.addShaped("lolarecipeDYE14",<rustic:painted_wood_red>*8,
 [[<quark:stained_planks:14>,<quark:stained_planks:14>,<quark:stained_planks:14>],
  [<quark:stained_planks:14>,<ore:dyeRed>,<quark:stained_planks:14>],
  [<quark:stained_planks:14>,<quark:stained_planks:14>,<quark:stained_planks:14>]]);

recipes.addShaped("lolarecipeDYE15",<rustic:painted_wood_black>*8,
 [[<quark:stained_planks:15>,<quark:stained_planks:15>,<quark:stained_planks:15>],
  [<quark:stained_planks:15>,<ore:dyeBlack>,<quark:stained_planks:15>],
  [<quark:stained_planks:15>,<quark:stained_planks:15>,<quark:stained_planks:15>]]);

//=====================
//HORSE ARMOR
//=====================

recipes.addShaped("lolarecipe64",<minecraft:saddle>,
 [[<minecraft:leather>,<minecraft:leather>,<minecraft:leather>],
  [<ore:string>,null,<ore:string>],
  [<minecraft:iron_ingot>,null,<minecraft:iron_ingot>]]);

recipes.addShaped("lolarecipeHORSEIRON",<minecraft:iron_horse_armor>,
 [[null,null,<minecraft:iron_helmet>],
  [<minecraft:iron_ingot>,<minecraft:wool:*>,<minecraft:iron_ingot>],
  [<minecraft:iron_leggings>,null,<minecraft:iron_leggings>]]);

recipes.addShaped("lolarecipeHORSEGOLD",<minecraft:golden_horse_armor>,
 [[null,null,<minecraft:golden_helmet>],
  [<minecraft:gold_ingot>,<minecraft:wool:*>,<minecraft:gold_ingot>],
  [<minecraft:golden_leggings>,null,<minecraft:golden_leggings>]]);

recipes.addShaped("lolarecipeHORSEDIAMOND",<minecraft:diamond_horse_armor>,
 [[null,null,<minecraft:diamond_helmet>],
  [<minecraft:diamond>,<minecraft:wool:*>,<minecraft:diamond>],
  [<minecraft:diamond_leggings>,null,<minecraft:diamond_leggings>]]);

//=====================
//NEW LE ARMORS
//=====================

recipes.addShaped("lolarmor1",<rlmixins:steel_helmet>,
 [[<variedcommodities:ingot_steel>,<variedcommodities:ingot_steel>,<variedcommodities:ingot_steel>],
  [<variedcommodities:ingot_steel>,null,<variedcommodities:ingot_steel>]]);

recipes.addShaped("lolarmor2",<rlmixins:steel_chestplate>,
 [[<variedcommodities:ingot_steel>,null,<variedcommodities:ingot_steel>],
  [<variedcommodities:ingot_steel>,<variedcommodities:ingot_steel>,<variedcommodities:ingot_steel>],
  [<variedcommodities:ingot_steel>,<variedcommodities:ingot_steel>,<variedcommodities:ingot_steel>]]);

recipes.addShaped("lolarmor3",<rlmixins:steel_leggings>,
 [[<variedcommodities:ingot_steel>,<variedcommodities:ingot_steel>,<variedcommodities:ingot_steel>],
  [<variedcommodities:ingot_steel>,null,<variedcommodities:ingot_steel>],
  [<variedcommodities:ingot_steel>,null,<variedcommodities:ingot_steel>]]);

recipes.addShaped("lolarmor4",<rlmixins:steel_boots>,
 [[<variedcommodities:ingot_steel>,null,<variedcommodities:ingot_steel>],
  [<variedcommodities:ingot_steel>,null,<variedcommodities:ingot_steel>]]);

//recipes.addShaped("lolarmor5",<rlmixins:scarlite_helmet>,
// [[<defiledlands:scarlite>,<defiledlands:scarlite>,<defiledlands:scarlite>],
//  [<defiledlands:scarlite>,null,<defiledlands:scarlite>]]);

//recipes.addShaped("lolarmor6",<rlmixins:scarlite_chestplate>,
// [[<defiledlands:scarlite>,null,<defiledlands:scarlite>],
//  [<defiledlands:scarlite>,<defiledlands:scarlite>,<defiledlands:scarlite>],
//  [<defiledlands:scarlite>,<defiledlands:scarlite>,<defiledlands:scarlite>]]);

//recipes.addShaped("lolarmor7",<rlmixins:scarlite_leggings>,
// [[<defiledlands:scarlite>,<defiledlands:scarlite>,<defiledlands:scarlite>],
//  [<defiledlands:scarlite>,null,<defiledlands:scarlite>],
//  [<defiledlands:scarlite>,null,<defiledlands:scarlite>]]);

//recipes.addShaped("lolarmor8",<rlmixins:scarlite_boots>,
// [[<defiledlands:scarlite>,null,<defiledlands:scarlite>],
//  [<defiledlands:scarlite>,null,<defiledlands:scarlite>]]);

//furnace.addRecipe(<defiledlands:scarlite> * 2, <rlmixins:scarlite_helmet:*>, 99999);
//furnace.addRecipe(<defiledlands:scarlite> * 3, <rlmixins:scarlite_chestplate:*>, 99999);
//furnace.addRecipe(<defiledlands:scarlite> * 3, <rlmixins:scarlite_leggings:*>, 99999);
//furnace.addRecipe(<defiledlands:scarlite> * 1, <rlmixins:scarlite_boots:*>, 99999);
furnace.addRecipe(<variedcommodities:ingot_steel> * 2, <rlmixins:steel_helmet:*>, 99999);
furnace.addRecipe(<variedcommodities:ingot_steel> * 3, <rlmixins:steel_chestplate:*>, 99999);
furnace.addRecipe(<variedcommodities:ingot_steel> * 3, <rlmixins:steel_leggings:*>, 99999);
furnace.addRecipe(<variedcommodities:ingot_steel> * 1, <rlmixins:steel_boots:*>, 99999);

//=================================
//ArtiFACTS bro
//=================================

recipes.addShapeless("rlartifact1",<bountifulbaubles:spectralsilt>,[<bountifulbaubles:disintegrationtablet>,<artifacts:shock_pendant>]);
recipes.addShapeless("rlartifact2",<bountifulbaubles:spectralsilt>,[<bountifulbaubles:disintegrationtablet>,<artifacts:flame_pendant>]);
recipes.addShapeless("rlartifact3",<bountifulbaubles:spectralsilt>,[<bountifulbaubles:disintegrationtablet>,<artifacts:thorn_pendant>]);
recipes.addShapeless("rlartifact4",<bountifulbaubles:spectralsilt>,[<bountifulbaubles:disintegrationtablet>,<artifacts:ultimate_pendant>]);
recipes.addShapeless("rlartifact5",<bountifulbaubles:spectralsilt>,[<bountifulbaubles:disintegrationtablet>,<artifacts:panic_necklace>]);
recipes.addShapeless("rlartifact6",<bountifulbaubles:spectralsilt>,[<bountifulbaubles:disintegrationtablet>,<artifacts:whoopie_cushion>]);
recipes.addShapeless("rlartifact7",<bountifulbaubles:spectralsilt>,[<bountifulbaubles:disintegrationtablet>,<artifacts:bottled_cloud>]);
recipes.addShapeless("rlartifact8",<bountifulbaubles:spectralsilt>,[<bountifulbaubles:disintegrationtablet>,<artifacts:bottled_fart>]);
recipes.addShapeless("rlartifact9",<bountifulbaubles:spectralsilt>,[<bountifulbaubles:disintegrationtablet>,<artifacts:magma_stone>]);
recipes.addShapeless("rlartifact10",<bountifulbaubles:spectralsilt>,[<bountifulbaubles:disintegrationtablet>,<artifacts:feral_claws>]);
recipes.addShapeless("rlartifact11",<bountifulbaubles:spectralsilt>,[<bountifulbaubles:disintegrationtablet>,<artifacts:power_glove>]);
recipes.addShapeless("rlartifact12",<bountifulbaubles:spectralsilt>,[<bountifulbaubles:disintegrationtablet>,<artifacts:mechanical_glove>]);
recipes.addShapeless("rlartifact13",<bountifulbaubles:spectralsilt>,[<bountifulbaubles:disintegrationtablet>,<artifacts:fire_gauntlet>]);
recipes.addShapeless("rlartifact14",<bountifulbaubles:spectralsilt>,[<bountifulbaubles:disintegrationtablet>,<artifacts:drinking_hat>]);
recipes.addShapeless("rlartifact15",<bountifulbaubles:spectralsilt>,[<bountifulbaubles:disintegrationtablet>,<artifacts:star_cloak>]);
recipes.addShapeless("rlartifact16",<bountifulbaubles:spectralsilt>,[<bountifulbaubles:disintegrationtablet>,<artifacts:pocket_piston>]);
recipes.addShapeless("rlartifact17",<bountifulbaubles:spectralsilt>,[<bountifulbaubles:disintegrationtablet>,<artifacts:antidote_vessel>]);
recipes.addShapeless("rlartifact18",<bountifulbaubles:spectralsilt>,[<bountifulbaubles:disintegrationtablet>,<artifacts:bubble_wrap>]);
recipes.addShapeless("rlartifact19",<bountifulbaubles:spectralsilt>,[<bountifulbaubles:disintegrationtablet>,<artifacts:sacrificial_amulet>]);
recipes.addShapeless("rlartifact20",<bountifulbaubles:spectralsilt>,[<bountifulbaubles:disintegrationtablet>,<artifacts:lucky_clover>]);

//=====================
//SRPARASITE THINGIES
//=====================

recipes.addShaped("lolsrarmor1",<srparasites:armor_helm>,
 [[<srparasites:vile_shell>,<srparasites:vile_shell>,<srparasites:vile_shell>],
  [<srparasites:vile_shell>,<srparasites:living_core>,<srparasites:vile_shell>]]);

recipes.addShaped("lolsrarmor2",<srparasites:armor_chest>,
 [[<srparasites:vile_shell>,<srparasites:living_core>,<srparasites:vile_shell>],
  [<srparasites:vile_shell>,<srparasites:vile_shell>,<srparasites:vile_shell>],
  [<srparasites:vile_shell>,<srparasites:vile_shell>,<srparasites:vile_shell>]]);

recipes.addShaped("lolsrarmor3",<srparasites:armor_pants>,
 [[<srparasites:vile_shell>,<srparasites:vile_shell>,<srparasites:vile_shell>],
  [<srparasites:vile_shell>,<srparasites:living_core>,<srparasites:vile_shell>],
  [<srparasites:vile_shell>,null,<srparasites:vile_shell>]]);

recipes.addShaped("lolsrarmor4",<srparasites:armor_boots>,
 [[<srparasites:vile_shell>,<srparasites:living_core>,<srparasites:vile_shell>],
  [<srparasites:vile_shell>,null,<srparasites:vile_shell>]]);

recipes.addShapeless("lolsrsarmor1",<srparasites:armor_helm_sentient>,[<srparasites:armor_helm>,<contenttweaker:sentient_core>]);
recipes.addShapeless("lolsrsarmor2",<srparasites:armor_chest_sentient>,[<srparasites:armor_chest>,<contenttweaker:sentient_core>]);
recipes.addShapeless("lolsrsarmor3",<srparasites:armor_pants_sentient>,[<srparasites:armor_pants>,<contenttweaker:sentient_core>]);
recipes.addShapeless("lolsrsarmor4",<srparasites:armor_boots_sentient>,[<srparasites:armor_boots>,<contenttweaker:sentient_core>]);

recipes.addShapeless("lolsrsweapon1",<srparasites:weapon_scythe_sentient>,[<srparasites:weapon_scythe>,<contenttweaker:sentient_core>]);
recipes.addShapeless("lolsrsweapon2",<srparasites:weapon_axe_sentient>,[<srparasites:weapon_axe>,<contenttweaker:sentient_core>]);
recipes.addShapeless("lolsrsweapon3",<srparasites:weapon_sword_sentient>,[<srparasites:weapon_sword>,<contenttweaker:sentient_core>]);
recipes.addShapeless("lolsrsweapon4",<srparasites:weapon_cleaver_sentient>,[<srparasites:weapon_cleaver>,<contenttweaker:sentient_core>]);
recipes.addShapeless("lolsrsweapon5",<srparasites:weapon_bow_sentient>,[<srparasites:weapon_bow>,<contenttweaker:sentient_core>]);

recipes.addShaped("lolsrsentientcore",<contenttweaker:sentient_core>,
 [[<contenttweaker:blood_tear>,<contenttweaker:blood_tear>,<contenttweaker:blood_tear>],
  [<contenttweaker:blood_tear>,<srparasites:living_core>,<contenttweaker:blood_tear>],
  [<contenttweaker:blood_tear>,<contenttweaker:blood_tear>,<contenttweaker:blood_tear>]]);

//=================================
//INSPIRATION CAULDRON POTION STOOF
//=================================

//sd heat cold potions
mods.inspirations.Cauldron.removeBrewingRecipe("minecraft:thick");
mods.inspirations.Cauldron.removeBrewingRecipe("simpledifficulty:cold_resist_type");
mods.inspirations.Cauldron.removeBrewingRecipe("simpledifficulty:heat_resist_type");
mods.inspirations.Cauldron.removeBrewingRecipe("minecraft:mundane", "minecraft:water", <minecraft:redstone>);

mods.inspirations.Cauldron.addBrewingRecipe("minecraft:thick", "minecraft:water", <betternether:bone_mushroom>);
mods.inspirations.Cauldron.addBrewingRecipe("simpledifficulty:cold_resist_type", "minecraft:mundane", <simpledifficulty:frost_powder>);
mods.inspirations.Cauldron.addBrewingRecipe("simpledifficulty:heat_resist_type", "minecraft:mundane", <minecraft:blaze_powder>);
mods.inspirations.Cauldron.addBrewingRecipe("simpledifficulty:long_cold_resist_type", "simpledifficulty:cold_resist_type", <minecraft:redstone>);
mods.inspirations.Cauldron.addBrewingRecipe("simpledifficulty:long_heat_resist_type", "simpledifficulty:heat_resist_type", <minecraft:redstone>);

mods.inspirations.Cauldron.removeFluidRecipe(<minecraft:potion>.withTag({Potion: "potioncore:revival"}));
mods.inspirations.Cauldron.removeFluidRecipe(<minecraft:splash_potion>.withTag({Potion: "potioncore:revival"}));
mods.inspirations.Cauldron.removeFluidRecipe(<minecraft:lingering_potion>.withTag({Potion: "potioncore:revival"}));

mods.inspirations.Cauldron.removeFillRecipe(<minecraft:potion>.withTag({Potion: "potioncore:revival"}));
mods.inspirations.Cauldron.removeFillRecipe(<minecraft:splash_potion>.withTag({Potion: "potioncore:revival"}));
mods.inspirations.Cauldron.removeFillRecipe(<minecraft:lingering_potion>.withTag({Potion: "potioncore:revival"}));

mods.inspirations.Cauldron.removeFillRecipe(<minecraft:potion>.withTag({Potion: "rlmixins:curse_break"}));

mods.inspirations.Cauldron.removeFluidRecipe(<minecraft:tipped_arrow>.withTag({Potion: "rlmixins:curse_break"}));
mods.inspirations.Cauldron.removeFluidRecipe(<minecraft:splash_potion>.withTag({Potion: "rlmixins:curse_break"}));
mods.inspirations.Cauldron.removeFluidRecipe(<minecraft:lingering_potion>.withTag({Potion: "rlmixins:curse_break"}));

mods.inspirations.Cauldron.removeBrewingRecipe("potioncore:revival");
mods.inspirations.Cauldron.removeBrewingRecipe("rlmixins:curse_break");

recipes.addShapeless("bottlebegone1",<minecraft:glass_bottle>,[<inspirations:materials:2>]);
recipes.addShapeless("bottlebegone2",<minecraft:glass_bottle>,[<inspirations:materials:3>]);

//FUCKING CARROT JUICE
mods.inspirations.Cauldron.addFluidTransform(<liquid:carrot_juice>, <minecraft:carrot> * 4, <liquid:water>, 3, true);
mods.inspirations.Cauldron.addFillRecipe(<foodexpansion:itemcarrotseedsoup>, <liquid:carrot_juice>, 1, <minecraft:bowl>);
mods.inspirations.Cauldron.addFluidRecipe(<foodexpansion:itemcarrotseedsoup>, <minecraft:bowl>, <liquid:carrot_juice>);

//Default Canteen
//mods.inspirations.Cauldron.addFluidRecipe(<simpledifficulty:canteen>.withTag({Doses: 1, CanteenType: 3}), <simpledifficulty:canteen>.withTag({Doses: 0, CanteenType: 0}), <liquid:water>, 1, true);
//mods.inspirations.Cauldron.addFluidRecipe(<simpledifficulty:canteen>.withTag({Doses: 1, CanteenType: 3}), <simpledifficulty:canteen>.withTag({Doses: 0, CanteenType: 3}), <liquid:water>, 1, true);
//mods.inspirations.Cauldron.addFluidRecipe(<simpledifficulty:canteen>.withTag({Doses: 2, CanteenType: 3}), <simpledifficulty:canteen>.withTag({Doses: 1, CanteenType: 3}), <liquid:water>, 1, true);
//mods.inspirations.Cauldron.addFluidRecipe(<simpledifficulty:canteen>.withTag({Doses: 3, CanteenType: 3}), <simpledifficulty:canteen>.withTag({Doses: 2, CanteenType: 3}), <liquid:water>, 1, true);
//mods.inspirations.Cauldron.addFluidRecipe(<simpledifficulty:canteen>.withTag({Doses: 3, CanteenType: 3}), <simpledifficulty:canteen>.withTag({Doses: 3, CanteenType: 3}), <liquid:water>, 0, true);

//Iron Canteen Purified
//mods.inspirations.Cauldron.addFluidRecipe(<simpledifficulty:iron_canteen>.withTag({Doses: 1, CanteenType: 3}), <simpledifficulty:iron_canteen>.withTag({Doses: 0, CanteenType: 0}), <liquid:water>, 1, true);
//mods.inspirations.Cauldron.addFluidRecipe(<simpledifficulty:iron_canteen>.withTag({Doses: 1, CanteenType: 3}), <simpledifficulty:iron_canteen>.withTag({Doses: 0, CanteenType: 3}), <liquid:water>, 1, true);
//mods.inspirations.Cauldron.addFluidRecipe(<simpledifficulty:iron_canteen>.withTag({Doses: 2, CanteenType: 3}), <simpledifficulty:iron_canteen>.withTag({Doses: 1, CanteenType: 3}), <liquid:water>, 1, true);
//mods.inspirations.Cauldron.addFluidRecipe(<simpledifficulty:iron_canteen>.withTag({Doses: 3, CanteenType: 3}), <simpledifficulty:iron_canteen>.withTag({Doses: 2, CanteenType: 3}), <liquid:water>, 1, true);
//mods.inspirations.Cauldron.addFluidRecipe(<simpledifficulty:iron_canteen>.withTag({Doses: 4, CanteenType: 3}), <simpledifficulty:iron_canteen>.withTag({Doses: 3, CanteenType: 3}), <liquid:water>, 1, true);
//mods.inspirations.Cauldron.addFluidRecipe(<simpledifficulty:iron_canteen>.withTag({Doses: 5, CanteenType: 3}), <simpledifficulty:iron_canteen>.withTag({Doses: 4, CanteenType: 3}), <liquid:water>, 1, true);
//mods.inspirations.Cauldron.addFluidRecipe(<simpledifficulty:iron_canteen>.withTag({Doses: 6, CanteenType: 3}), <simpledifficulty:iron_canteen>.withTag({Doses: 5, CanteenType: 3}), <liquid:water>, 1, true);
//mods.inspirations.Cauldron.addFluidRecipe(<simpledifficulty:iron_canteen>.withTag({Doses: 6, CanteenType: 3}), <simpledifficulty:iron_canteen>.withTag({Doses: 6, CanteenType: 3}), <liquid:water>, 0, true);

//Iron Canteen Dirty
//mods.inspirations.Cauldron.addFluidRecipe(<simpledifficulty:iron_canteen>.withTag({Doses: 6, CanteenType: 0}), <simpledifficulty:iron_canteen>, <liquid:water>, 0, null);
//mods.inspirations.Cauldron.addFluidRecipe(<simpledifficulty:iron_canteen>.withTag({Doses: 6, CanteenType: 0}), <simpledifficulty:iron_canteen>.withTag({Doses: 1, CanteenType: 0}), <liquid:water>, 0, true);
//mods.inspirations.Cauldron.addFluidRecipe(<simpledifficulty:iron_canteen>.withTag({Doses: 6, CanteenType: 0}), <simpledifficulty:iron_canteen>.withTag({Doses: 2, CanteenType: 0}), <liquid:water>, 0, true);
//mods.inspirations.Cauldron.addFluidRecipe(<simpledifficulty:iron_canteen>.withTag({Doses: 6, CanteenType: 0}), <simpledifficulty:iron_canteen>.withTag({Doses: 3, CanteenType: 0}), <liquid:water>, 0, true);
//mods.inspirations.Cauldron.addFluidRecipe(<simpledifficulty:iron_canteen>.withTag({Doses: 6, CanteenType: 0}), <simpledifficulty:iron_canteen>.withTag({Doses: 4, CanteenType: 0}), <liquid:water>, 0, true);
//mods.inspirations.Cauldron.addFluidRecipe(<simpledifficulty:iron_canteen>.withTag({Doses: 6, CanteenType: 0}), <simpledifficulty:iron_canteen>.withTag({Doses: 5, CanteenType: 0}), <liquid:water>, 0, true);

//Dragon Canteen
//mods.inspirations.Cauldron.addFluidRecipe(<simpledifficulty:dragon_canteen>.withTag({Doses: 8, CanteenType: 3}), <simpledifficulty:dragon_canteen>, <liquid:water>, 1, false);
//mods.inspirations.Cauldron.addFluidRecipe(<simpledifficulty:dragon_canteen>.withTag({Doses: 8, CanteenType: 3}), <simpledifficulty:dragon_canteen>, <liquid:water>, 1, true);

//Milk Kek
//mods.inspirations.Cauldron.addBrewingRecipe("mujmajnkraftsbettersurvival:milk", "minecraft:thick", <minecraft:milk_bucket>);

print("Script ending!");
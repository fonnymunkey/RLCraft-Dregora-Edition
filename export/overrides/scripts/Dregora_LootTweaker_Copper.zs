import loottweaker.LootTweaker;
import crafttweaker.item.IItemStack;
import loottweaker.vanilla.loot.LootTable;
import loottweaker.vanilla.loot.LootPool;
import loottweaker.vanilla.loot.Conditions;
import loottweaker.vanilla.loot.Functions;


//minecraft:chests/village_blacksmith
//minecraft:chests/simple_dungeon
//minecraft:chests/abandoned_mineshaft
//charm:village/butcher
//charm:village/carpenter
//charm:village/farmer
//charm:village/fisherman
//charm:village/librarian
//charm:village/priest
//charm:village/shepherd
//charm:village/smith
//charm:treasure/common
//quark:chests/pirate_chest

//val SkeletonTable = LootTweaker.getTable("minecraft:entities/skeleton");
//val mod_lavacow = SkeletonTable.addPool("mod_lavacow", 1, 1, 0, 0);
//mod_lavacow.addItemEntry(<minecraft:air>, 100, 0, [], [Conditions.killedByPlayer(), Conditions.parse({"condition": "entity_properties","entity": "this"})]);
//mod_lavacow.addItemEntry(<mod_lavacow:hatred_shard>, 25, 0, [], [Conditions.killedByPlayer(), Conditions.parse({"condition": "entity_properties","entity": "this"})]);
//mod_lavacow.addItemEntry(<mod_lavacow:kings_crown>, 1, 0, [], [Conditions.killedByPlayer(), Conditions.parse({"condition": "entity_properties","entity": "this"})]);


val mod_lavacow_mimic = LootTweaker.getTable("mod_lavacow:entities/mimic");
mod_lavacow_mimic.clear();

val mod_lavacow = mod_lavacow_mimic.addPool("claw", 1, 1, 0, 0);
mod_lavacow.addItemEntry(<mod_lavacow:mimic_claw>, 75);

val forsaken_regular = LootTweaker.getTable("mod_lavacow:entities/forsaken");
forsaken_regular.clear();

val skeleton_regular = LootTweaker.getTable("minecraft:entities/skeleton");
skeleton_regular.clear();

val skeleton_regular_new = skeleton_regular.addPool("skeleton_regular_new", 1, 1, 0, 0);
skeleton_regular_new.addLootTableEntry("dregora:entities/regular/skeleton", 100);

val mod_lavacow_skeleton_king = LootTweaker.getTable("mod_lavacow:entities/bosses/skeleton_king");
mod_lavacow_skeleton_king.clear();
val mod_lavacow_skeleton_king_new = mod_lavacow_skeleton_king.addPool("dregora_skeleton_king", 1, 1, 0, 0);
mod_lavacow_skeleton_king_new.addLootTableEntry("dregora:entities/regular/fish_undead_skeleton_king", 100);

val BlacksmithTable = LootTweaker.getTable("minecraft:chests/village_blacksmith");
val DungeonTable = LootTweaker.getTable("minecraft:chests/simple_dungeon");
val MineshaftTable = LootTweaker.getTable("minecraft:chests/abandoned_mineshaft");
val ButcherTable = LootTweaker.getTable("charm:village/butcher");
val CarpenterTable = LootTweaker.getTable("charm:village/carpenter");
val FarmerTable = LootTweaker.getTable("charm:village/farmer");
val FishermanTable = LootTweaker.getTable("charm:village/fisherman");
val LibrarianTable = LootTweaker.getTable("charm:village/librarian");
val PriestTable = LootTweaker.getTable("charm:village/priest");
val ShepherdTable = LootTweaker.getTable("charm:village/shepherd");
val SmithTable = LootTweaker.getTable("charm:village/smith");
val CommonTable = LootTweaker.getTable("charm:treasure/common");
val PirateTable = LootTweaker.getTable("quark:chests/pirate_chest");

val BlacksmithCopper = BlacksmithTable.addPool("CopperPool", 1, 2, 0, 0);
val DungeonCopper = DungeonTable.addPool("CopperPool", 0, 1, 0, 0);
val MineshaftCopper = MineshaftTable.addPool("CopperPool", 0, 1, 0, 0);
val ButcherCopper = ButcherTable.addPool("CopperPool", 0, 1, 0, 0);
val CarpenterCopper = CarpenterTable.addPool("CopperPool", 0, 1, 0, 0);
val FarmerCopper = FarmerTable.addPool("CopperPool", 0, 1, 0, 0);
val SmithCopper = SmithTable.addPool("CopperPool", 1, 2, 0, 0);
val CommonCopper = CommonTable.addPool("CopperPool", 0, 1, 0, 0);
val PirateCopper = PirateTable.addPool("CopperPool", 0, 1, 0, 0);

for item in [<iceandfire:armor_copper_metal_chestplate>,<iceandfire:armor_copper_metal_leggings>,<iceandfire:armor_copper_metal_boots>,<iceandfire:armor_copper_metal_helmet>] as IItemStack[] {
  DungeonCopper.addItemEntry(item, 10, 0, [Functions.enchantWithLevels(0, 10, false)],[]);
  DungeonCopper.addItemEntry(item, 25);
  SmithCopper.addItemEntry(item, 25);
  SmithCopper.addItemEntry(item, 10, 0, [Functions.enchantWithLevels(0, 10, false)],[]);
  BlacksmithCopper.addItemEntry(item, 25);
  BlacksmithCopper.addItemEntry(item, 10, 0, [Functions.enchantWithLevels(0, 10, false)],[]);
}

for item in [<spartanweaponry:throwing_axe_copper>,<spartanweaponry:javelin_copper>,<spartanweaponry:boomerang_copper>,<spartanweaponry:battleaxe_copper>,<spartanweaponry:mace_copper>,<spartanweaponry:glaive_copper>,<spartanweaponry:staff_copper>,<spartanweaponry:dagger_copper>,<spartanweaponry:longsword_copper>,<spartanweaponry:katana_copper>,<spartanweaponry:saber_copper>,<spartanweaponry:rapier_copper>,<spartanweaponry:greatsword_copper>,<spartanshields:shield_tower_copper>,<spartanweaponry:hammer_copper>,<spartanweaponry:warhammer_copper>,<spartanweaponry:spear_copper>,<spartanweaponry:halberd_copper>,<spartanweaponry:pike_copper>,<spartanweaponry:lance_copper>,<spartanweaponry:longbow_copper>,<spartanweaponry:crossbow_copper>,<spartanweaponry:throwing_knife_copper>] as IItemStack[] {
  DungeonCopper.addItemEntry(item, 75);
  DungeonCopper.addItemEntry(item, 30, 0, [Functions.enchantWithLevels(0, 10, false)],[]);
  PirateCopper.addItemEntry(item, 75);
  PirateCopper.addItemEntry(item, 30, 0, [Functions.enchantWithLevels(0, 10, false)],[]);
  SmithCopper.addItemEntry(item, 75);
  SmithCopper.addItemEntry(item, 30, 0, [Functions.enchantWithLevels(0, 10, false)],[]);
  BlacksmithCopper.addItemEntry(item, 75);
  BlacksmithCopper.addItemEntry(item, 30, 0, [Functions.enchantWithLevels(0, 10, false)],[]);
}

for item in [<iceandfire:copper_pickaxe>,<iceandfire:copper_shovel>,<iceandfire:copper_axe>] as IItemStack[] {
  MineshaftCopper.addItemEntry(item, 65);
  MineshaftCopper.addItemEntry(item, 40, 0, [Functions.enchantWithLevels(0, 10, false)],[]);
}

for item in [<iceandfire:copper_nugget>,<iceandfire:copper_ingot>] as IItemStack[] {
  MineshaftCopper.addItemEntry(item, 100);
  CarpenterCopper.addItemEntry(item, 100);
  CommonCopper.addItemEntry(item, 100);
  SmithCopper.addItemEntry(item, 100);
  BlacksmithCopper.addItemEntry(item, 100);
}

for item in [<iceandfire:copper_axe>,<iceandfire:copper_shovel>,<iceandfire:copper_hoe>] as IItemStack[] {
  FarmerCopper.addItemEntry(item, 65);
  FarmerCopper.addItemEntry(item, 40, 0, [Functions.enchantWithLevels(0, 10, false)],[]);
}

CarpenterCopper.addItemEntry(<iceandfire:copper_axe>, 65);
CarpenterCopper.addItemEntry(<iceandfire:copper_axe>, 40, 0, [Functions.enchantWithLevels(0, 10, false)],[]);

for item in [<iceandfire:copper_pickaxe>,<iceandfire:copper_shovel>,<iceandfire:copper_sword>,<iceandfire:copper_axe>,<iceandfire:copper_hoe>] as IItemStack[] {
  SmithCopper.addItemEntry(item, 65);
  SmithCopper.addItemEntry(item, 40, 0, [Functions.enchantWithLevels(0, 10, false)],[]);
  BlacksmithCopper.addItemEntry(item, 65);
  BlacksmithCopper.addItemEntry(item, 40, 0, [Functions.enchantWithLevels(0, 10, false)],[]);
}
import loottweaker.LootTweaker;
import loottweaker.vanilla.loot.LootTable;
import loottweaker.vanilla.loot.LootPool;
import loottweaker.vanilla.loot.Conditions;
import loottweaker.vanilla.loot.Functions;
 
 
//==== Create new tables ====
val lostCityHighRiseTable = LootTweaker.newTable("loottweaker:lostcityhighrise");
val lostCityGroundTable = LootTweaker.newTable("loottweaker:lostcityground");
val lostCityBasementTable = LootTweaker.newTable("loottweaker:lostcitybasement");
val lostCitySubwayTable = LootTweaker.newTable("loottweaker:lostcitysubway");
val lostCityRareTable = LootTweaker.newTable("loottweaker:lostcityrare");
val lostCityUncommonTable = LootTweaker.newTable("loottweaker:lostcityuncommon");
val lostCityCommonTable = LootTweaker.newTable("loottweaker:lostcitycommon");

val lowTable = LootTweaker.newTable("loottweaker:lowtable");
val medTable = LootTweaker.newTable("loottweaker:medtable");
val highTable = LootTweaker.newTable("loottweaker:hightable");
val builderTable = LootTweaker.newTable("loottweaker:buildertable");


//Pool Key - "name", minRolls, maxRolls, minLuckRolls, maxLuckRolls


//==== Add pools to your tables ====
val lostCityHighRisePool = lostCityHighRiseTable.addPool("highrise", 1, 3, 0, 1);
val lostCityGroundPool = lostCityGroundTable.addPool("ground", 1, 3, 0, 1);
val lostCityBasementPool = lostCityBasementTable.addPool("basement", 1, 3, 0, 1);
val lostCitySubwayPool = lostCitySubwayTable.addPool("subway", 1, 3, 0, 1);
val lostCityRarePool = lostCityRareTable.addPool("rare", 1, 3, 0, 1);
val lostCityUncommonPool = lostCityUncommonTable.addPool("uncommon", 1, 3, 0, 1);
val lostCityCommonPool = lostCityCommonTable.addPool("common", 1, 3, 0, 1);

val lowPool = lowTable.addPool("low", 3, 9, 0, 1);
val medPool = medTable.addPool("medium", 3, 9, 0, 1);
val highPool = highTable.addPool("high", 3, 9, 0, 1);
val builderPool = builderTable.addPool("builder", 3, 9, 0, 1);


//Loot Key - <item:item>, weight, quality, functions, conditions, "name"


//==== Low Loot ====
lowPool.addItemEntry(<simpledifficulty:frost_rod>, 10, 1, [Functions.setCount(0, 4)], [], "1");
lowPool.addItemEntry(<simpledifficulty:frost_powder>, 15, 1, [Functions.setCount(0, 8)], [], "2");
lowPool.addItemEntry(<minecraft:magma>, 20, 1, [Functions.setCount(0, 8)], [], "3");
lowPool.addItemEntry(<minecraft:blaze_rod>, 10, 1, [Functions.setCount(0, 4)], [], "4");
lowPool.addItemEntry(<minecraft:blaze_powder>, 15, 1, [Functions.setCount(0, 4)], [], "5");
lowPool.addItemEntry(<minecraft:nether_star>, 1, 2, [Functions.setCount(0, 1)], [], "6");
lowPool.addItemEntry(<betternether:bone_mushroom>, 1, 2, [Functions.setCount(0, 4)], [], "7");
lowPool.addItemEntry(<betternether:cincinnasite>, 10, 1, [Functions.setCount(0, 16)], [], "8");
lowPool.addItemEntry(<betternether:cincinnasite_block>, 15, 1, [Functions.setCount(0, 8)], [], "9");
lowPool.addItemEntry(<minecraft:ender_pearl>, 15, 1, [Functions.setCount(0, 8)], [], "10");
lowPool.addItemEntry(<iceandfire:sapphire_gem>, 10, 1, [Functions.setCount(0, 8)], [], "11");
lowPool.addItemEntry(<defiledlands:scarlite>, 10, 1, [Functions.setCount(0, 8)], [], "12");


//==== Med Loot ====
medPool.addItemEntry(<minecraft:bow>, 20, 1, [Functions.setCount(0, 1)], [], "1");
medPool.addItemEntry(<spartanweaponry:longbow_iron>, 20, 1, [Functions.setCount(0, 1)], [], "1bi");
medPool.addItemEntry(<spartanweaponry:longbow_diamond>, 20, 1, [Functions.setCount(0, 1)], [], "1bd");
medPool.addItemEntry(<minecraft:arrow>, 20, 1, [Functions.setCount(0, 16)], [], "2");
medPool.addItemEntry(<spartanweaponry:arrow_iron>, 20, 1, [Functions.setCount(0, 16)], [], "2ia");
medPool.addItemEntry(<spartanweaponry:arrow_diamond>, 20, 1, [Functions.setCount(0, 16)], [], "2da");
medPool.addItemEntry(<minecraft:apple>, 10, 1, [Functions.setCount(0, 8)], [], "3");
medPool.addItemEntry(<betternether:black_apple>, 5, 2, [Functions.setCount(0, 4)], [], "4");
medPool.addItemEntry(<minecraft:reeds>, 10, 1, [Functions.setCount(0, 8)], [], "5");
medPool.addItemEntry(<minecraft:melon>, 10, 1, [Functions.setCount(0, 8)], [], "6");
medPool.addItemEntry(<minecraft:pumpkin>, 10, 1, [Functions.setCount(0, 4)], [], "7");
medPool.addItemEntry(<minecraft:pumpkin_pie>, 10, 1, [Functions.setCount(0, 4)], [], "8");
medPool.addItemEntry(<minecraft:ender_pearl>, 10, 1, [Functions.setCount(0, 4)], [], "9");
medPool.addItemEntry(<minecraft:paper>, 10, 1, [Functions.setCount(0, 16)], [], "10");
medPool.addItemEntry(<minecraft:dye>, 15, 1, [Functions.setCount(0, 8), Functions.setMetadata(5, 5)], [], "11");


//==== High Loot ====
highPool.addItemEntry(<minecraft:feather>, 20, 1, [Functions.setCount(0, 16)], [], "1");
highPool.addItemEntry(<iceandfire:pixie_dust>, 10, 1, [Functions.setCount(0, 4)], [], "2");
highPool.addItemEntry(<familiarfauna:pixie_dust>, 5, 2, [Functions.setCount(0, 1)], [], "3");
highPool.addItemEntry(<minecraft:glass>, 20, 1, [Functions.setCount(0, 8)], [], "4");
highPool.addItemEntry(<betternether:quartz_glass_framed>, 15, 1, [Functions.setCount(0, 8)], [], "5");
highPool.addItemEntry(<minecraft:sugar>, 15, 1, [Functions.setCount(0, 16)], [], "6");
highPool.addItemEntry(<xat:mana_candy>, 10, 1, [Functions.setCount(0, 16)], [], "7");
highPool.addItemEntry(<xat:mana_crystal>, 5, 2, [Functions.setCount(0, 4)], [], "8");
highPool.addItemEntry(<minecraft:cake>, 20, 1, [Functions.setCount(0, 1)], [], "9");
highPool.addItemEntry(<minecraft:quartz_block>, 10, 1, [Functions.setCount(0, 16)], [], "10");
highPool.addItemEntry(<minecraft:quartz>, 15, 1, [Functions.setCount(0, 16)], [], "11");
highPool.addItemEntry(<minecraft:dye>, 15, 1, [Functions.setCount(0, 8), Functions.setMetadata(5, 5)], [], "12");


//==== Builder Loot ====

builderPool.addItemEntry(<minecraft:stonebrick>, 20, 1, [Functions.setCount(0, 16)], [], "1");
builderPool.addItemEntry(<minecraft:planks>, 15, 1, [Functions.setCount(0, 16)], [], "2");
builderPool.addItemEntry(<minecraft:brick_block>, 15, 1, [Functions.setCount(0, 16)], [], "3");
builderPool.addItemEntry(<minecraft:quartz_block>, 10, 1, [Functions.setCount(0, 16)], [], "4");
builderPool.addItemEntry(<minecraft:sandstone>, 15, 1, [Functions.setCount(0, 16)], [], "5");
builderPool.addItemEntry(<minecraft:red_sandstone>, 15, 1, [Functions.setCount(0, 16)], [], "6");
builderPool.addItemEntry(<minecraft:stone_slab>, 10, 1, [Functions.setCount(0, 16)], [], "7");
builderPool.addItemEntry(<minecraft:iron_bars>, 10, 1, [Functions.setCount(0, 16)], [], "8");
builderPool.addItemEntry(<minecraft:stained_hardened_clay>, 20, 1, [Functions.setCount(0, 16), Functions.setMetadata(0, 15)], [], "9");
builderPool.addItemEntry(<minecraft:stained_glass>, 15, 1, [Functions.setCount(0, 16), Functions.setMetadata(0, 15)], [], "10");

//==== High Rise Loot (fairy) ====
lostCityHighRisePool.addItemEntry(<xat:fairy_ring>, 1, 1, [Functions.setCount(0, 1)], [], "fairy_ring");
lostCityHighRisePool.addLootTableEntry("minecraft:chests/stronghold_library", 25);
lostCityHighRisePool.addLootTableEntry("loottweaker:hightable", 25);


//==== Ground Loot (elf) ====
lostCityGroundPool.addItemEntry(<xat:elf_ring>, 1, 1, [Functions.setCount(0, 1)], [], "elf_ring");
lostCityGroundPool.addLootTableEntry("minecraft:chests/woodland_mansion", 10);
lostCityGroundPool.addLootTableEntry("minecraft:chests/igloo_chest", 15);
lostCityGroundPool.addLootTableEntry("charm:village/farmer", 5);
lostCityGroundPool.addLootTableEntry("loottweaker:medtable", 20);


//==== Basement Loot (dwarf) ====
lostCityBasementPool.addItemEntry(<xat:dwarf_ring>, 1, 1, [Functions.setCount(0, 1)], [], "dwarf_ring");
lostCityBasementPool.addLootTableEntry("minecraft:chests/end_city_treasure", 15);
lostCityBasementPool.addLootTableEntry("iceandfire:ice_dragon_cave", 15);
lostCityBasementPool.addLootTableEntry("charm:village/smith", 20);


//==== Subway Loot (goblin) ====
lostCitySubwayPool.addItemEntry(<xat:goblin_ring>, 1, 1, [Functions.setCount(0, 1)], [], "goblin_ring");
lostCitySubwayPool.addLootTableEntry("minecraft:chests/abandoned_mineshaft", 10);
lostCitySubwayPool.addLootTableEntry("iceandfire:fire_dragon_cave", 10);
lostCitySubwayPool.addLootTableEntry("charm:treasure/common_potions", 10);


//==== Rare Loot (dragon) ====
lostCityRarePool.addItemEntry(<xat:dragon_ring>, 1, 1, [Functions.setCount(0, 1)], [], "dragon_ring");
lostCityRarePool.addLootTableEntry("minecraft:chests/nether_bridge", 10);
lostCityRarePool.addLootTableEntry("minecraft:chests/stronghold_corridor", 20);
lostCityRarePool.addLootTableEntry("loottweaker:lowtable", 20);


//==== Uncommon Loot (titan) ====
lostCityUncommonPool.addItemEntry(<xat:titan_ring>, 1, 1, [Functions.setCount(0, 1)], [], "titan_ring");
lostCityUncommonPool.addLootTableEntry("minecraft:chests/simple_dungeon", 15);
lostCityUncommonPool.addLootTableEntry("charm:village/butcher", 10);
lostCityUncommonPool.addLootTableEntry("loottweaker:buildertable", 25);


//==== Common Loot (faelis) ====
lostCityCommonPool.addItemEntry(<xat:faelis_ring>, 1, 1, [Functions.setCount(0, 1)], [], "faelis_ring");
lostCityCommonPool.addLootTableEntry("minecraft:chests/spawn_bonus_chest", 1);
lostCityCommonPool.addLootTableEntry("charm:village/fisherman", 10);
lostCityCommonPool.addLootTableEntry("charm:village/shepherd", 10);
lostCityCommonPool.addLootTableEntry("charm:treasure/common", 10);
lostCityCommonPool.addLootTableEntry("charm:treasure/uncommon", 10);
lostCityCommonPool.addLootTableEntry("charm:village/librarian", 10);
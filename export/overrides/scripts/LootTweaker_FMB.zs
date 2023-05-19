import loottweaker.LootTweaker;
import loottweaker.vanilla.loot.LootTable;
import loottweaker.vanilla.loot.LootPool;
import loottweaker.vanilla.loot.Conditions;
import loottweaker.vanilla.loot.Functions;
 
val fmbFishingTable = LootTweaker.getTable("fishingmadebetter:fishing_combined");
fmbFishingTable.clear();

val rlcraftFishing = fmbFishingTable.addPool("rlcraftfishing", 1, 1, 0, 0);

//itemstack, weight, quality, functions, conditions, name

//Treasure AquaCulture
rlcraftFishing.addItemEntry(<aquaculture:loot>, 5, 2, [Functions.setMetadata(1, 1)], [], "treasure_1");//nept ingot
rlcraftFishing.addItemEntry(<aquaculture:loot>, 5, 2, [Functions.setMetadata(5, 5)], [], "treasure_2");//lockbox
rlcraftFishing.addItemEntry(<aquaculture:loot>, 5, 2, [Functions.setMetadata(6, 6)], [], "treasure_3");//treasurechest
rlcraftFishing.addItemEntry(<aquaculture:loot>, 5, 2, [Functions.setMetadata(7, 7)], [], "treasure_4");//nept bounty

//Treasure Vanilla
rlcraftFishing.addItemEntry(<minecraft:waterlily>, 5, 2, [], [], "treasure_5");//water lily
rlcraftFishing.addItemEntry(<minecraft:name_tag>, 5, 2, [], [], "treasure_6");//name tag
rlcraftFishing.addItemEntry(<minecraft:saddle>, 5, 2, [], [], "treasure_7");//saddle
rlcraftFishing.addItemEntry(<minecraft:bow>, 5, 2, [Functions.setDamage(0.0, 0.9), Functions.enchantWithLevels(30, 30, true)], [], "treasure_8");//bow
rlcraftFishing.addItemEntry(<minecraft:fishing_rod>, 5, 2, [Functions.setDamage(0.0, 0.25), Functions.enchantWithLevels(30, 30, true)], [], "treasure_9");//fishing rod enchanted
rlcraftFishing.addItemEntry(<minecraft:book>, 5, 2, [Functions.enchantWithLevels(30, 30, true)], [], "treasure_10");//enchanted book

//Junk AquaCulture
rlcraftFishing.addItemEntry(<minecraft:apple>, 10, -2, [], [], "junk_1");//apple
rlcraftFishing.addItemEntry(<aquaculture:food>, 10, -2, [Functions.setMetadata(1, 1)], [], "junk_2");//algae
rlcraftFishing.addItemEntry(<aquaculture:loot>, 5, 2, [Functions.setMetadata(4, 4)], [], "junk_3");//box
rlcraftFishing.addItemEntry(<aquaculture:loot>, 10, -2, [Functions.setMetadata(0, 0)], [], "junk_4");//driftwood
rlcraftFishing.addItemEntry(<aquaculture:fish>, 5, -2, [Functions.setMetadata(38, 38)], [], "junk_5");//fish bones
rlcraftFishing.addItemEntry(<aquaculture:loot>, 5, 2, [Functions.setMetadata(3, 3)], [], "junk_6");//message bottle
rlcraftFishing.addItemEntry(<aquaculture:food>, 10, -2, [Functions.setMetadata(0, 0)], [], "junk_7");//seaweed
rlcraftFishing.addItemEntry(<aquaculture:loot>, 5, -2, [Functions.setMetadata(2, 2)], [], "junk_8");//tincan

//Junk Vanilla
rlcraftFishing.addItemEntry(<minecraft:leather_boots>, 10, -2, [Functions.setDamage(0.0, 0.9)], [], "junk_9");//booties
rlcraftFishing.addItemEntry(<minecraft:leather>, 10, -2, [], [], "junk_10");//leather
rlcraftFishing.addItemEntry(<minecraft:bone>, 10, -2, [], [], "junk_11");//bone
rlcraftFishing.addItemEntry(<minecraft:potion>.withTag({Potion: "minecraft:water"}), 10, -2, [], [], "junk_12");//water bottle
rlcraftFishing.addItemEntry(<minecraft:string>, 5, -2, [], [], "junk_13");//string
rlcraftFishing.addItemEntry(<minecraft:fishing_rod>, 5, -2, [Functions.setDamage(0.0, 0.9)], [], "junk_14");//ancient fishing rod
rlcraftFishing.addItemEntry(<minecraft:bowl>, 10, -2, [], [], "junk_15");//bowl
rlcraftFishing.addItemEntry(<minecraft:stick>, 5, -2, [], [], "junk_16");//stick
rlcraftFishing.addItemEntry(<minecraft:dye>, 5, -2, [Functions.setMetadata(0, 0), Functions.setCount(1, 10)], [], "junk_17");//ink sacks
rlcraftFishing.addItemEntry(<minecraft:tripwire_hook>, 10, -2, [], [], "junk_18");//tripwire hook
rlcraftFishing.addItemEntry(<minecraft:rotten_flesh>, 10, -2, [], [], "junk_19");//rotten flesh





//rlcraftFishing.addItemEntry(<minecraft:compass>, 10, -2, [], [], "junk_6");//compass
//rlcraftFishing.addItemEntry(<minecraft:painting>, 10, -2, [], [], "junk_7");//painting

//rlcraftFishing.addItemEntry(<minecraft:diamond>, 20, 2, [], [], "treasure_6");//diamond
//rlcraftFishing.addItemEntry(<minecraft:gold_ingot>, 30, 2, [], [], "treasure_7");//gold ingot
//rlcraftFishing.addItemEntry(<minecraft:iron_ingot>, 30, 2, [], [], "treasure_8");//iron ingot
//rlcraftFishing.addItemEntry(<minecraft:prismarine_shard>, 20, 2, [], [], "treasure_9");//prism shard
//rlcraftFishing.addItemEntry(<minecraft:prismarine_crystals>, 10, 2, [], [], "treasure_10");//prism crystal
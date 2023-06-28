import loottweaker.LootTweaker;
import loottweaker.vanilla.loot.LootTable;
import loottweaker.vanilla.loot.LootPool;
import loottweaker.vanilla.loot.Conditions;
import loottweaker.vanilla.loot.Functions;

val samuletTable = LootTweaker.getTable("artifacts:sacrificial_reward");
samuletTable.clear();

val newzor = samuletTable.addPool("brah", 1, 1, 0, 0);

newzor.addItemEntry(<bq_standard:loot_chest>, 1, 0, [Functions.setMetadata(101, 101)], [], "yeploot");
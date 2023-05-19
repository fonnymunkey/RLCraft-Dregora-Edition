import loottweaker.LootTweaker;
import loottweaker.vanilla.loot.LootTable;
import loottweaker.vanilla.loot.LootPool;
import loottweaker.vanilla.loot.Conditions;
import loottweaker.vanilla.loot.Functions;

val championTable = LootTweaker.getTable("champions:champion_loot");
val tier5 = championTable.addPool("tier#5", 1, 1, 0, 0);

tier5.addItemEntry(<minecraft:book>, 1, 0, [Functions.enchantWithLevels(30, 50, true)], [Conditions.killedByPlayer(), Conditions.parse(
            {
              "condition": "entity_properties",
              "entity": "this",
              "properties": {
                "champions:is_champion": {
                  "min_tier": 5
                }
              }
            }
        )]);
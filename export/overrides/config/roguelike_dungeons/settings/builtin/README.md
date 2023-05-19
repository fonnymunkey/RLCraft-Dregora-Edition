The files in this directory (builtin) exist to ensure that the builtin dungeons can be extended to spawn with custom loot, instead of Greymerk's builtin loot.

To accomplish this, first define a loot file, then merge it with a 

```json
{
  "name": "your_name_here:loot_food",
  "lootRules": [
    {
      "level": [0, 1, 2, 3, 4],
      "type": "FOOD",
      "each": true,
      "quantity": 1,
      "loot": [
        {"data": {"name": "minecraft:coal", "meta": 1, "min": 1, "max": 4}, "weight": 1}
      ]
    }
  ]
}
```

Then, create a new dungeon, which inherits both from your custom loot file, and these loot-less builtin dungeons, one per dungeon type
```json
{
  "name" : "your_name_here:dungeon_builtin_desert_with_custom_loot",
  "exclusive": true,
  "inherit" : [
    "builtin:desert_builtin_no_loot",
    "your_name_here:loot_food"
  ]
}
```

## Explanation
The Roguelike Dungeons Mod, when trying to choose a dungeon for a given location, first checks if there are any custom dungeon settings fitting for that locations biome and biome types. If none are found, it defaults to using the builtin dungeons. This is undesirable because they will spawn with the mod's builtin loot tables, rather than using the custom loot configurations.

To work around that, we have base dungeon files for the builtin dungeons which override their loot with empty loot tables.
We then extend these (inherit them) in new dungeon files which also inherit from the custom loot configurations, effectively joining the custom loot tables to the builtin dungeons without loot. 

In DregoraRL there's 3 main loot categories which can be found in assets/dregora/dregorarl/ which are a combination of vanilla dregora loot & rlcraft infused loot so the loottables can be used for both vanilla as rlcraft with minimal adjusting.


1. There's the regular loot category with the following loot tables:

```
[Will be mostly used in all areas]
junk_loot
common_loot
rare_loot
epic_loot
legendary_loot
cursed_loot

[will be used in cities instead of above set]
moderncity_junk_loot
moderncity_common_loot
moderncity_epic_loot
moderncity_rare_loot

[Miscalanious sets for specific structures]
bone_loot
bone_only_loot
bottle_loot
bow_loot
fishing_loot
food_loot
gilded_bone_loot
mine_resource_loot
oceanruin_big_loot
oceanruin_small_loot
piratejunk_loot
shipjunk_loot
```

2. There's the lore loot category which contains the lore on Dregora, each loot table represents a area or structure.

```
ancient
dungeonone
eaglelore
farmland
frozen
gemtraderswamp
generic
harbor
hiddenmine
hiddenminewaste
junglebeach
junglecave
junglelore
lorespooky
mayanlore
medievalcity
mineshafts
miningtown
moderncity
pirate
quarry
shipfloat
shipsunk
simpledungeon
spawnbook
viking
village
witch
```

3. At last there is the travelers loot category which is sparsely used in both the regular as lore loot categories. These contain coordinates on structures and areas that may be worth a visit.

```
traveler_main
```

Potion List:

srparasites:link
srparasites:foster
srparasites:rage
srparasites:vira
srparasites:corro
srparasites:res
srparasites:fear
mujmajnkraftsbettersurvival:warp
mujmajnkraftsbettersurvival:strong_warp
mujmajnkraftsbettersurvival:antiwarp
mujmajnkraftsbettersurvival:long_antiwarp
potioncore:teleport
potioncore:strong_teleport
potioncore:teleport_surface
potioncore:teleport_spawn
potioncore:disorganization
potioncore:long_spin
potioncore:strong_spin
potioncore:spin
bountifulbaubles:potionrecall
potioncore:lightning
potioncore:strong_fire
potioncore:fire
potioncore:strong_explode
potioncore:explode
potioncore:launch
potioncore:strong_launch
potioncore:drown
potioncore:long_drown
xat:extended_titan
xat:titan
xat:extended_dwarf
xat:dwarf
potioncore:curse
potioncore:strong_curse
potioncore:magic_inhibition
potioncore:strong_magic_inhibition
potioncore:long_magic_inhibition
potioncore:long_rust
potioncore:vulnerable
potioncore:strong_vulnerable
potioncore:long_vulnerable
potioncore:perplexity
potioncore:long_perplexity
potioncore:rust
potioncore:strong_rust
potioncore:broken_magic_shield
potioncore:strong_broken_magic_shield
potioncore:long_broken_magic_shield
potioncore:long_broken_armor
potioncore:strong_broken_armor
potioncore:broken_armor
potioncore:long_klutz
potioncore:strong_klutz
potioncore:klutz
potioncore:weight
potioncore:strong_weight
potioncore:long_weight
potioncore:dispel
potioncore:potion_sickness
potioncore:strong_potion_sickness
potioncore:long_potion_sickness


Loottable Test Strings:

/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot_test"}

Todo: RLC potions maybe use splash some?


/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:underneath/fish_undead"}

/setblock ~ ~-1 ~ charm:crate_sealed 0 false {LootTable:"dregora:entities/spawn_eggs/behemoth"}

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|
      DregoraRL Brutal Entities Loot - Works:
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:brutaltowers/tier_1"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:brutaltowers/tier_2"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:brutaltowers/tier_3"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:brutaltowers/tier_4"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:brutaltowers/tier_5"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:brutaltowers/tier_6"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:brutaltowers/treasure_chest"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:brutaltowers/special_pot"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:brutaltowers/stairwell_dispenser"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:brutaltowers/randomized_battletower"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:brutaltowers/epic_no_junk"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:brutaltowers/rare_no_junk"}

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|
      DregoraRL Brutal Tower Lootchests - Works:
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:entities/srparasites/parasites_city"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:entities/playerbosses/abyssal_tower_spider"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:entities/playerbosses/abyssal_tower_dragon"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:entities/playerbosses/abyssal_tower_humanoid"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:entities/playerbosses/abyssal_tower_crux"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:entities/playerbosses/abyssal_tower_golem"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:entities/playerbosses/abyssal_tower_hive_minion"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:entities/playerbosses/abyssal_tower_hive_boss"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:entities/playerbosses/abyssal_tower_developers"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:entities/playerbosses/abyssal_tower_shivaxi"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:entities/playerbosses/abyssal_tower_shivaxi_dev"}

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|
      DregoraRL Ruins Loot Chests - Works: V
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:ruins/consumable"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:ruins/industrial"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:ruins/nuclear"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:ruins/rubble"}

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|
      DregoraRL Battletower Loot Chests - Works: V
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:battletowers/floor_1"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:battletowers/floor_2"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:battletowers/floor_3"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:battletowers/floor_4"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:battletowers/floor_5"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:battletowers/floor_6"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:battletowers/floor_7"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:battletowers/floor_8"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:battletowers/floor_9"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:battletowers/floor_10"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:playerbosses/abyssal_tower_playerboss"}

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|
      DregoraRL Special Loot Chests - Works: V
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/setblock ~ ~-1 ~ minecraft:dispenser 0 false {LootTable:"dregora:special/arrow_dispenser"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:special/trapped_loot"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/loot/cocoa"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/loot/herbalist_loot"}

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|
      DregoraRL Main Loot Chests - Works: V
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/loot/bone_loot"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/loot/bone_only_loot"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/loot/bottle_loot"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/loot/bow_loot"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/loot/city_potions"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/loot/common_loot"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/loot/cursed_loot"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/loot/epic_loot"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/loot/fishing_loot"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/loot/food_loot"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/loot/gilded_bone_loot"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/loot/junk_loot"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/loot/mine_resource_loot"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/loot/maintenance_common_loot"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/loot/maintenance_epic_loot"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/loot/maintenance_rare_loot"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/loot/moderncity_common_loot"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/loot/moderncity_epic_loot"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/loot/moderncity_junk_loot"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/loot/moderncity_rare_loot"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/loot/oceanruin_big_loot"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/loot/oceanruin_small_loot"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/loot/piratejunk_loot"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/loot/rare_loot"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/loot/shipjunk_loot"}

/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/lore/bunker"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/lore/ancient"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/lore/dungeonone"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/lore/eaglelore"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/lore/farmland"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/lore/frozen"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/lore/gemtraderswamp"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/lore/generic"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/lore/harbor"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/lore/hiddenmine"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/lore/hiddenminewaste"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/lore/junglebeach"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/lore/junglecave"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/lore/junglelore"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/lore/lorespooky"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/lore/mayanlore"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/lore/medievalcity"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/lore/mineshafts"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/lore/miningtown"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/lore/maintenance"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/lore/moderncity"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/lore/pirate"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/lore/quarry"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/lore/shipfloat"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/lore/shipsunk"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/lore/simpledungeon"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/lore/spawnbook"} - Too much items
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/lore/viking"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/lore/village"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/lore/witch"}


/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/traveler/ocean_main"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:dregorarl/traveler/traveler_main"}



-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|
      Vanilla Loot Chests - Works: V
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/bone_loot"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/bone_only_loot"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/bottle_loot"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/bow_loot"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/common_loot"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/cursed_loot"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/empty_loot"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/epic_loot"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/fishing_loot"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/food_loot"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/gilded_bone_loot"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/junk_loot"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/mine_resource_loot"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/moderncity_common_loot"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/moderncity_epic_loot"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/moderncity_junk_loot"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/moderncity_rare_loot"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/no_loot"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/oceanruin_big_loot"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/oceanruin_small_loot"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/piratejunk_loot"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/rare_loot"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/shipjunk_loot"}


/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_ocean_potion/ocean_potion_1"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_ocean_potion/ocean_potion_10"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_ocean_potion/ocean_potion_2"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_ocean_potion/ocean_potion_3"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_ocean_potion/ocean_potion_4"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_ocean_potion/ocean_potion_5"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_ocean_potion/ocean_potion_6"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_ocean_potion/ocean_potion_7"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_ocean_potion/ocean_potion_8"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_ocean_potion/ocean_potion_9"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_ocean_potion/ocean_potion_main"}

/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_moderncity/common_old_arrows"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_moderncity/common_old_tools"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_moderncity/epic_old_arrows"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_moderncity/epic_old_tools"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_moderncity/rare_old_arrows"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_moderncity/rare_old_music"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_moderncity/rare_old_tools"}

/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_leather/leather_common"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_leather/leather_junk"}

/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_gilded/gilded_sword_1"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_gilded/gilded_sword_2"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_gilded/gilded_sword_3"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_gilded/gilded_sword_4"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_gilded/gilded_sword_5"}

/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_city_potion/city_potion_1"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_city_potion/city_potion_10"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_city_potion/city_potion_2"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_city_potion/city_potion_3"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_city_potion/city_potion_4"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_city_potion/city_potion_5"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_city_potion/city_potion_6"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_city_potion/city_potion_7"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_city_potion/city_potion_8"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_city_potion/city_potion_9"}

/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/common_1"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/common_2"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/common_3"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/common_4"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/common_arrows"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/common_chaos"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/common_potions"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/common_tools"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/common_web"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/cursed_armor"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/cursed_potions"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/cursed_potion_1"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/cursed_potion_10"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/cursed_potion_11"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/cursed_potion_12"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/cursed_potion_13"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/cursed_potion_14"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/cursed_potion_15"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/cursed_potion_16"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/cursed_potion_2"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/cursed_potion_3"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/cursed_potion_4"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/cursed_potion_5"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/cursed_potion_6"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/cursed_potion_7"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/cursed_potion_8"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/cursed_potion_9"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/cursed_regular"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/cursed_tools"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/cursed_weapons"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/epic_1"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/epic_2"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/epic_3"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/epic_4"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/epic_arrows"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/epic_chaos"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/epic_potions"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/epic_tools"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/epic_web"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/rare_1"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/rare_2"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/rare_3"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/rare_4"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/rare_arrows"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/rare_chaos"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/rare_music"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/rare_potions"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/rare_tools"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/rare_web"}

/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/special_potion_1"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/special_potion_10"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/special_potion_11"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/special_potion_12"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/special_potion_13"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/special_potion_14"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/special_potion_15"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/special_potion_2"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/special_potion_3"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/special_potion_4"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/special_potion_5"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/special_potion_6"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/special_potion_7"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/special_potion_8"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:loot/loot_bundles/special_potion_9"}


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|
      Lore Chests - Works: V
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:lore/bunker"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:lore/ancient"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:lore/dungeonone"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:lore/eaglelore"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:lore/farmland"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:lore/frozen"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:lore/gemtraderswamp"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:lore/generic"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:lore/harbor"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:lore/hiddenmine"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:lore/hiddenminewaste"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:lore/junglebeach"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:lore/junglecave"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:lore/junglelore"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:lore/lorespooky"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:lore/mayanlore"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:lore/medievalcity"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:lore/mineshafts"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:lore/maintenance"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:lore/miningtown"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:lore/moderncity"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:lore/pirate"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:lore/quarry"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:lore/shipfloat"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:lore/shipsunk"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:lore/simpledungeon"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:lore/spawnbook"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:lore/viking"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:lore/village"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:lore/witch"}


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|
      RLCraft Chests - Works: V
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/rlcraft_infuse_coins_common"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/rlcraft_infuse_coins_epic"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/rlcraft_infuse_coins_rare"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/rlcraft_infuse_common"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/rlcraft_infuse_cursed"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/rlcraft_infuse_epic"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/rlcraft_infuse_junk"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/rlcraft_infuse_legendary"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/rlcraft_infuse_rare"}

/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/common_weapons"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/diamond_weapons"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/gilded_tools"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/golden_tools"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/iron_weapons"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/junk_weapons"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/rlcraft_bow_loot"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/rlcraft_music"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/rlcraft_potion"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/rusted_weapons"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/silver_armor"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/silver_tools"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/silver_weapons"}


/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/city/city_potion_1"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/city/city_potion_10"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/city/city_potion_2"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/city/city_potion_3"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/city/city_potion_4"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/city/city_potion_5"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/city/city_potion_6"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/city/city_potion_7"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/city/city_potion_8"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/city/city_potion_9"}


/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/cursed/cursed_armor"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/cursed/cursed_potions"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/cursed/cursed_potion_1"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/cursed/cursed_potion_10"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/cursed/cursed_potion_11"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/cursed/cursed_potion_12"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/cursed/cursed_potion_13"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/cursed/cursed_potion_14"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/cursed/cursed_potion_15"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/cursed/cursed_potion_2"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/cursed/cursed_potion_3"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/cursed/cursed_potion_4"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/cursed/cursed_potion_5"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/cursed/cursed_potion_6"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/cursed/cursed_potion_7"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/cursed/cursed_potion_8"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/cursed/cursed_potion_9"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/cursed/cursed_regular"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/cursed/cursed_shields"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/cursed/cursed_tools"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/cursed/cursed_weapons"}


/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/gems/gem_1"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/gems/gem_2"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/gems/gem_3"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/gems/gem_4"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/gems/gem_5"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/gems/gem_6"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/gems/gem_8"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/gems/main_gem"}


/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_1"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_10"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_11"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_12"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_13"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_14"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_15"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_16"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_17"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_18"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_19"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_2"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_20"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_21"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_22"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_23"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_24"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_25"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_26"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_27"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_28"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_29"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_3"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_30"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_31"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_32"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_33"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_34"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_35"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_36"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_37"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_38"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_39"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_4"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_40"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_41"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_42"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_43"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_44"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_45"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_46"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_47"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_48"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_49"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_5"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_50"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_51"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_52"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_53"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_54"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_55"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_56"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_57"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_58"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_59"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_6"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_60"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_61"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_62"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_63"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_64"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_65"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_66"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_67"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_68"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_69"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_7"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_70"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_71"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_72"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_73"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_74"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_75"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_76"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_77"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_78"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_79"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_8"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_80"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_81"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_82"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:rlcraft/loot_bundles/potions/rlcraft_potion_9"}

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|
      Switch Chests - Works: V
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:switch/city_switch"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:switch/gem_switch"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:switch/milk_switch"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:switch/toilet_switch"}

/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:switch/rlcraft/city"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:switch/rlcraft/gems"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:switch/rlcraft/milk"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:switch/rlcraft/toilet"}

/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:switch/vanilla/city"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:switch/vanilla/gems"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:switch/vanilla/milk"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:switch/vanilla/toilet"}

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|
      Travelers Chests - Works: V
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++|
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:travelers/oceans_castle"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:travelers/oceans_church"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:travelers/oceans_daeroc"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:travelers/oceans_farmstead"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:travelers/oceans_greendungeon"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:travelers/oceans_iceships"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:travelers/oceans_icetemple"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:travelers/oceans_legacyspawn"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:travelers/oceans_mineshafts"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:travelers/oceans_mountains"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:travelers/oceans_origin"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:travelers/oceans_pirate"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:travelers/oceans_quarry"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:travelers/oceans_spook"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:travelers/oceans_tribal"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:travelers/ocean_main"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:travelers/travelers_castle"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:travelers/travelers_church"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:travelers/travelers_daeroc"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:travelers/travelers_farmstead"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:travelers/travelers_greendungeon"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:travelers/travelers_iceships"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:travelers/travelers_icetemple"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:travelers/travelers_legacyspawn"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:travelers/travelers_mineshafts"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:travelers/travelers_mountains"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:travelers/travelers_origin"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:travelers/travelers_pirate"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:travelers/travelers_quarry"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:travelers/travelers_spook"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:travelers/travelers_tribal"}
/setblock ~ ~-1 ~ minecraft:chest 0 false {LootTable:"dregora:travelers/traveler_main"}

















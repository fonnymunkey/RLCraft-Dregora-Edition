import crafttweaker.item.IItemStack;

print("Dregora Recipe Script starting!");

//=================================
//Normal recipe adjustments
//=================================

//tooltips Conductivity
for item in itemUtils.getItemsByRegexRegistryName(".*iron.*|.*chainmail.*|.*chain_skirt.*|.*steel.*") {
    item.addTooltip("§e§oConductivity +1");
}

for item in itemUtils.getItemsByRegexRegistryName(".!scale|.*gold.*") {
    item.addTooltip("§e§oConductivity +2");
}

for item in itemUtils.getItemsByRegexRegistryName(".*copper.*") {
    item.addTooltip("§e§oConductivity +3");
}

for item in itemUtils.getItemsByRegexRegistryName(".*silver.*") {
    item.addTooltip("§e§oConductivity +4");
}

<variedcommodities:satchel>.displayName = "Coin Purse";
<mod_lavacow:dreamcatcher>.addTooltip("§6A purse filled with ancient coins!");
recipes.addShapeless("dregora51",<variedcommodities:satchel>,[<variedcommodities:coin_gold> * 64]);
recipes.addShapeless("dregora52",<variedcommodities:coin_gold> * 64,[<variedcommodities:satchel>]);

// Remove Bread recipe
recipes.removeByRecipeName("minecraft:bread");



// Remove Enchantment table & add wither skulls to it:
recipes.remove(<minecraft:enchanting_table>);


// Re-add Enchantment table
recipes.addShaped("dregora24",<minecraft:enchanting_table>,
 [[null,<minecraft:book>,null],
  [<minecraft:diamond>,<minecraft:skull:1>,<minecraft:diamond>],
  [<minecraft:obsidian>,<minecraft:obsidian>,<minecraft:obsidian>]]);

// add reinforced block item tooltip
<contenttweaker:iron_plate_reinforced>.addTooltip("§eCorruption Resistant");
<contenttweaker:iron_plate_slab_reinforced>.addTooltip("§eCorruption Resistant");
<contentcreator:iron_plate_slab_reinforced>.addTooltip("§eCorruption Resistant");
<contentcreator:iron_plate_stairs_reinforced>.addTooltip("§eCorruption Resistant");
<contenttweaker:iron_plate_rust_reinforced>.addTooltip("§eCorruption Resistant");

//=================================
//BLOCK HARDNESS ADJUSTERS
//=================================

//Change blockhardness Blocks in relation to SRParasites
var AshenStoneHard as IItemStack = <lycanitesmobs:ashenstone>;
AshenStoneHard.hardness = 30;

var LatticeHard as IItemStack = <rustic:iron_lattice>;
LatticeHard.hardness = 20;

var GrateHard as IItemStack = <quark:grate>;
GrateHard.hardness = 10;

var IronLadderHard as IItemStack = <quark:iron_ladder>;
IronLadderHard.hardness = 5;

var ContentCreatorSlab as IItemStack = <contentcreator:iron_plate_slab_reinforced>;
ContentCreatorSlab.hardness = 30;

var ContentCreatorStairs as IItemStack = <contentcreator:iron_plate_stairs_reinforced>;
ContentCreatorStairs.hardness = 30;

var ContentTweakersDoubleSlab as IItemStack = <contenttweaker:iron_plate_slab_reinforced>;
ContentTweakersDoubleSlab.hardness = 30;

var LushPolishedHard as IItemStack = <lycanitesmobs:lushstonepolished>;
LushPolishedHard.hardness = 30;

var BasaltHard as IItemStack = <quark:basalt_wall>;
BasaltHard.hardness = 10;

var DimstackHard as IItemStack = <dimstack:bedrock>;
BasaltHard.hardness = 50;

//=================================
//DREGORARL ContentTweaker new item recipes
//=================================

// Add a recipe for the reinforced iron plates
recipes.addShaped("dregora48",<contenttweaker:iron_plate_reinforced> * 8,
 [[<minecraft:iron_bars>,<minecraft:iron_bars>,<minecraft:iron_bars>],
  [<minecraft:iron_bars>,<quark:iron_plate>*8,<minecraft:iron_bars>],
  [<minecraft:iron_bars>,<minecraft:iron_bars>,<minecraft:iron_bars>]]);

// Add a recipe for the reinforced rusty iron plates
recipes.addShaped("dregora47",<contenttweaker:iron_plate_rust_reinforced> * 8,
 [[<quark:iron_plate>,<quark:iron_plate>,<quark:iron_plate>],
  [<quark:iron_plate>,<minecraft:water_bucket>,<quark:iron_plate>],
  [<quark:iron_plate>,<quark:iron_plate>,<quark:iron_plate>]]);

// Add a recipe for the reinforced slabs
recipes.addShaped("dregora49",<contentcreator:iron_plate_slab_reinforced> * 6,
 [[null,null,null],
  [<contenttweaker:iron_plate_reinforced>,<contenttweaker:iron_plate_reinforced>,<contenttweaker:iron_plate_reinforced>],
  [null,null,null]]);

// Add a recipe for the reinforced stairs
recipes.addShaped("dregora50",<contentcreator:iron_plate_stairs_reinforced> * 8,
 [[<contenttweaker:iron_plate_reinforced>,null,null],
  [<contenttweaker:iron_plate_reinforced>,<contenttweaker:iron_plate_reinforced>,null],
  [<contenttweaker:iron_plate_reinforced>,<contenttweaker:iron_plate_reinforced>,<contenttweaker:iron_plate_reinforced>]]);

//=================================
//QUARK HAT ADD TOOLTIPS
//=================================

<quark:witch_hat>.addTooltip("§8Makes witches friendly and negates charm spectre curses");
//<quark:pirate_hat>.addTooltip("§8Grants permanent looting I");
<quark:archaeologist_hat>.addTooltip("§8Grants 25% additional chance to drop ores.");

//=================================
//FISH UNDEAD RECIPES & NAME CHANGES
//=================================

// Removed Recipes

mods.inspirations.Cauldron.removeBrewingRecipe("mod_lavacow:infestation");
mods.inspirations.Cauldron.removeBrewingRecipe("mod_lavacow:long_infestation");
mods.inspirations.Cauldron.removeBrewingRecipe("mod_lavacow:strong_infestation");

mods.inspirations.Cauldron.removeBrewingRecipe("mod_lavacow:strong_fragile");
mods.inspirations.Cauldron.removeBrewingRecipe("mod_lavacow:long_fragile");
mods.inspirations.Cauldron.removeBrewingRecipe("mod_lavacow:fragile");


recipes.remove(<minecraft:potion>.withTag({Potion: "mod_lavacow:fragile"}));
recipes.remove(<minecraft:potion>.withTag({Potion: "mod_lavacow:strong_fragile"}));
recipes.remove(<minecraft:potion>.withTag({Potion: "mod_lavacow:long_fragile"}));

recipes.remove(<minecraft:potion>.withTag({Potion: "mod_lavacow:infestation"}));
recipes.remove(<minecraft:potion>.withTag({Potion: "mod_lavacow:strong_infestation"}));
recipes.remove(<minecraft:potion>.withTag({Potion: "mod_lavacow:long_infestation"}));

brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "minecraft:slowness"}), <mod_lavacow:parasite_item> );
brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "minecraft:slowness"}), <mod_lavacow:parasite_item:1> );
brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "minecraft:slowness"}), <mod_lavacow:parasite_item:2> );
brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "mod_lavacow:infestation"}), <minecraft:glowstone_dust>);
brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "mod_lavacow:infestation"}), <minecraft:redstone>);
brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "minecraft:long_slowness"}), <mod_lavacow:parasite_item>);
brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "minecraft:long_slowness"}), <mod_lavacow:parasite_item:1>);
brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "minecraft:long_slowness"}), <mod_lavacow:parasite_item:2>);
brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "mod_lavacow:infestation"}), <minecraft:gunpowder>);
brewing.removeRecipe(<minecraft:splash_potion>.withTag({Potion: "minecraft:slowness"}), <mod_lavacow:parasite_item>);
brewing.removeRecipe(<minecraft:splash_potion>.withTag({Potion: "minecraft:slowness"}), <mod_lavacow:parasite_item:1>);
brewing.removeRecipe(<minecraft:splash_potion>.withTag({Potion: "minecraft:slowness"}), <mod_lavacow:parasite_item:2>);
brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "mod_lavacow:strong_infestation"}), <minecraft:glowstone_dust>);
brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "mod_lavacow:strong_infestation"}), <minecraft:gunpowder>);
brewing.removeRecipe(<minecraft:splash_potion>.withTag({Potion: "mod_lavacow:infestation"}), <minecraft:redstone>);
brewing.removeRecipe(<minecraft:splash_potion>.withTag({Potion: "minecraft:long_slowness"}), <mod_lavacow:parasite_item>);
brewing.removeRecipe(<minecraft:splash_potion>.withTag({Potion: "minecraft:long_slowness"}), <mod_lavacow:parasite_item:1>);
brewing.removeRecipe(<minecraft:splash_potion>.withTag({Potion: "minecraft:long_slowness"}), <mod_lavacow:parasite_item:2>);
brewing.removeRecipe(<minecraft:splash_potion>.withTag({Potion: "mod_lavacow:infestation"}), <minecraft:dragon_breath>);
brewing.removeRecipe(<minecraft:lingering_potion>.withTag({Potion: "minecraft:long_slowness"}), <mod_lavacow:parasite_item>);
brewing.removeRecipe(<minecraft:lingering_potion>.withTag({Potion: "minecraft:long_slowness"}), <mod_lavacow:parasite_item:1>);
brewing.removeRecipe(<minecraft:lingering_potion>.withTag({Potion: "minecraft:long_slowness"}), <mod_lavacow:parasite_item:2>);
brewing.removeRecipe(<minecraft:splash_potion>.withTag({Potion: "mod_lavacow:long_infestation"}), <minecraft:dragon_breath> );
brewing.removeRecipe(<minecraft:lingering_potion>.withTag({Potion: "mod_lavacow:infestation"}), <minecraft:redstone>);
brewing.removeRecipe(<minecraft:lingering_potion>.withTag({Potion: "mod_lavacow:infestation"}), <minecraft:glowstone_dust>);
brewing.removeRecipe(<minecraft:lingering_potion>.withTag({Potion: "minecraft:slowness"}), <mod_lavacow:parasite_item>);
brewing.removeRecipe(<minecraft:lingering_potion>.withTag({Potion: "minecraft:slowness"}), <mod_lavacow:parasite_item:1>);
brewing.removeRecipe(<minecraft:lingering_potion>.withTag({Potion: "minecraft:slowness"}), <mod_lavacow:parasite_item:2>);

brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "mod_lavacow:strong_fragile"})); //Removes potion of mooten lava
brewing.removeRecipe(<mod_lavacow:potion_of_mooten_lava>); //Removes potion of mooten lava
brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "minecraft:awkward"}), <mod_lavacow:hatred_shard>); //Removes DeathTouch
brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "mod_lavacow:fragile"}), <minecraft:glowstone>); //Removes DeathTouch
brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "mod_lavacow:fragile"}), <minecraft:gunpowder>); //Removes DeathTouch
brewing.removeRecipe(<minecraft:splash_potion>.withTag({Potion: "minecraft:awkward"}), <mod_lavacow:hatred_shard>); //Removes DeathTouch Splash
brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "mod_lavacow:fragile"}), <minecraft:gunpowder>); //Removes DeathTouch Splash
brewing.removeRecipe(<minecraft:splash_potion>.withTag({Potion: "mod_lavacow:fragile"}), <minecraft:glowstone>); //Removes DeathTouch Splash
brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "mod_lavacow:strong_fragile"}), <minecraft:gunpowder>); //Removes DeathTouch Splash
brewing.removeRecipe(<minecraft:splash_potion>.withTag({Potion: "mod_lavacow:fragile"}), <minecraft:redstone>); //Removes DeathTouch Splash
brewing.removeRecipe(<minecraft:potion>.withTag({Potion: "mod_lavacow:long_fragile"}), <minecraft:gunpowder>); //Removes DeathTouch Splash
brewing.removeRecipe(<minecraft:lingering_potion>.withTag({Potion: "minecraft:awkward"}), <mod_lavacow:hatred_shard>); //Removes DeathTouch Lingering 2
brewing.removeRecipe(<minecraft:splash_potion>.withTag({Potion: "mod_lavacow:fragile"}), <minecraft:dragon_breath>); //Removes DeathTouch Lingering 2
brewing.removeRecipe(<minecraft:lingering_potion>.withTag({Potion: "mod_lavacow:fragile"}), <minecraft:glowstone>); //Removes DeathTouch Lingering
brewing.removeRecipe(<minecraft:splash_potion>.withTag({Potion: "mod_lavacow:strong_fragile"}), <minecraft:dragon_breath>); //Removes DeathTouch Lingering
brewing.removeRecipe(<minecraft:lingering_potion>.withTag({Potion: "mod_lavacow:fragile"}), <minecraft:redstone>); //Removes DeathTouch Lingering 1
brewing.removeRecipe(<minecraft:splash_potion>.withTag({Potion: "mod_lavacow:long_fragile"}), <minecraft:dragon_breath>); //Removes DeathTouch Lingering 1


recipes.remove(<mod_lavacow:reapers_scythe>);
recipes.remove(<mod_lavacow:war>);
recipes.remove(<mod_lavacow:halo_necklace>);
recipes.remove(<mod_lavacow:dreamcatcher>);
recipes.remove(<mod_lavacow:raven_whistle>);
recipes.remove(<mod_lavacow:famine>);
recipes.remove(<mod_lavacow:faminearmor_helmet>);
recipes.remove(<mod_lavacow:faminearmor_chestplate>);
recipes.remove(<mod_lavacow:faminearmor_leggings>);
recipes.remove(<mod_lavacow:faminearmor_boots>);
recipes.remove(<mod_lavacow:cursed_bandage>);
recipes.remove(<mod_lavacow:cursed_bandage:1>);
recipes.remove(<mod_lavacow:cursed_bandage:2>);
recipes.remove(<mod_lavacow:cursed_bandage:3>);

recipes.remove(<mod_lavacow:cactus_thorn>);
recipes.remove(<mod_lavacow:thorn_shooter>);
recipes.remove(<mod_lavacow:potion_of_mooten_lava>);
recipes.remove(<mod_lavacow:cursed_bandage>);
recipes.remove(<mod_lavacow:weta_hoe>);

//recipes.remove(<mod_lavacow:skeletonking_mace>); - Does not have a recipe blacklisted through JEI
//recipes.remove(<mod_lavacow:emblem_of_king>); - Does not have a recipe blacklisted through JEI

// Name Changes
<mod_lavacow:skeletonking_mace>.displayName = "Ban Hammer";
<mod_lavacow:holy_grenade>.displayName = "Inferior Holy Grenade";
<mod_lavacow:bonestew>.displayName = "Dragon Bone Stew";
<mod_lavacow:dreamcatcher>.displayName = "Cursed Dream Catcher";

// Potion of fission tooltip
<mod_lavacow:fissionpotion>.clearTooltip(true);
<mod_lavacow:fissionpotion>.addTooltip("§cSplits some tamable animals into two individual baby ones.");

// Reminisence tooltip
<mod_lavacow:hatred_shard>.addTooltip("§9Fragment of reminiscence, carried by the skeleton king's underlings.");

// King's crown Tooltip
<mod_lavacow:kings_crown:1>.addTooltip("§9Legend says the soul needs it's crown to be in the true desert for the body to rise once again.");

// Ban Hammer Tooltip
<mod_lavacow:skeletonking_mace>.addTooltip("§9Effects not applied on bosses.");

//Famine Armor Tooltip
<mod_lavacow:faminearmor_helmet>.addTooltip("§9Lost to the Cities and Chasms Deep");
<mod_lavacow:faminearmor_chestplate>.addTooltip("§9Lost to the Cities and Chasms Deep");
<mod_lavacow:faminearmor_leggings>.addTooltip("§9Lost to the Cities and Chasms Deep");
<mod_lavacow:faminearmor_boots>.addTooltip("§9Lost to the Cities and Chasms Deep");
<mod_lavacow:famine>.addTooltip("§9Lost to the Cities and Chasms Deep");
<mod_lavacow:war>.addTooltip("§9Lost to the Cities and Chasms Deep");
<mod_lavacow:dreamcatcher>.addTooltip("§9Lost to the Cities and Chasms Deep");
<mod_lavacow:halo_necklace>.addTooltip("§9Lost to the Cities and Chasms Deep");
<mod_lavacow:raven_whistle>.addTooltip("§9Lost to the Cities and Chasms Deep");

// Obtained from tooltips & names
<mod_lavacow:acidicheart>.displayName = "Acidic Osvermis/Mummy Heart";
<mod_lavacow:feather_black>.displayName = "Black Raven/Penghoul Feathers";
<mod_lavacow:burntovipositor>.displayName = "Burnt Salamander Ovipositor";
<mod_lavacow:burntovipositor>.displayName = "Foul Foglet/Ithaqua Bristles";
<mod_lavacow:hyphae>.displayName = "Mycosis Hyphae";
<mod_lavacow:kings_crown>.addTooltip("The True Desert's Treasure");
<mod_lavacow:hatred_shard>.addTooltip("The memory of a King and all those who were slain in his name.");
<mod_lavacow:moltenbeef>.displayName = "Molten Salamander Meat";
<mod_lavacow:mossy_stick>.displayName = "Sludge Stick";
<mod_lavacow:pigboarhide>.displayName = "Undead Swine Hide";
<mod_lavacow:plagued_porkchop>.displayName = "Undead Swine Meat";
<mod_lavacow:poisonspore>.displayName = "Poisonous Mycosis Spores";
<mod_lavacow:scythe_claw>.displayName = "Ithaqua Claw";
<mod_lavacow:banshee_vocal_cord>.displayName = "Banshee Shriek Cord";
<mod_lavacow:cactus_fruit>.displayName = "Cactyrant/Cactoid Fruit";
<mod_lavacow:sharptooth>.addTooltip("Obtained from Foglet, Swarmer, Undead Swine, Wolf and Polar bears");
<mod_lavacow:chitin>.displayName = "Weta Chitin";
<mod_lavacow:frozenthigh>.displayName = "Frigid Thigh";
<mod_lavacow:poisonstinger>.displayName = "Poisonous Vespa Stinger";

// Description Changes
<mod_lavacow:raven_whistle>.addTooltip("§eRavens can be tamed using fermented spider eye or parasites.");
<mod_lavacow:ghostjelly>.addTooltip("§eGives 6 seconds Resistance IV & 3 seconds Levitation III");
<mod_lavacow:vespa_dagger>.addTooltip("§eInflicts Poison II");
<mod_lavacow:dreamcatcher>.clearTooltip(true);
<mod_lavacow:dreamcatcher>.addTooltip("§eThe Dead roam nearby as you wake from your deep slumber...");
<mod_lavacow:dreamcatcher>.addTooltip(" ");
<mod_lavacow:dreamcatcher>.addTooltip("§8Foglet, Undead Swine, Ithaqua, Sludge lord, Vespa, Scarecrow, Osvermis");
<mod_lavacow:dreamcatcher>.addTooltip("§8Pinghoul, Undertaker, Banshee, Avaton, Vindicator, Ghost or a Chest!?");

// Completely rename "Death" hammer
<mod_lavacow:skeletonking_mace>.clearTooltip(true);
<mod_lavacow:skeletonking_mace>.addTooltip("§eInstantly kills if the victim falls under 25% health for 10 seconds after each hit.");
<mod_lavacow:skeletonking_mace>.addTooltip("§4This item is banned for obvious reasons.");

// Completely rename Molten Heart Description
<mod_lavacow:mootenheart>.clearTooltip(true);
<mod_lavacow:mootenheart>.addTooltip("§eFire Damage Protection: -20%");

// Remove fish undead recipes
recipes.remove(<mod_lavacow:bonesword>);
recipes.remove(<mod_lavacow:frozen_dagger>);
recipes.remove(<mod_lavacow:spectral_dagger>);
recipes.remove(<mod_lavacow:moltenpan>);
recipes.remove(<mod_lavacow:moltenhammer>);
recipes.remove(<mod_lavacow:moltenaxe>);
recipes.remove(<mod_lavacow:holy_grenade>);
recipes.remove(<mod_lavacow:sonicbomb>);
recipes.remove(<mod_lavacow:bonestew>);
recipes.remove(<mod_lavacow:ghostjelly>);
recipes.remove(<mod_lavacow:goldenheart>);

// Re-add fish undead bonesword recipe
recipes.addShaped("dregora35",<mod_lavacow:bonesword>,
 [[<mod_lavacow:sharptooth>,<minecraft:bone_block>,<mod_lavacow:sharptooth>],
  [<mod_lavacow:sharptooth>,<minecraft:bone_block>,<mod_lavacow:sharptooth>],
  [null,<iceandfire:dragonbone>,null]]);

// Re-add fish undead frozen_dagger recipe
recipes.addShaped("dregora36",<mod_lavacow:frozen_dagger>,
 [[null,<mod_lavacow:shattered_ice>,null],
  [null,<mod_lavacow:shattered_ice>,null],
  [null,<iceandfire:witherbone>,null]]);

// Re-add fish undead spectral_dagger recipe
recipes.addShaped("dregora37",<mod_lavacow:spectral_dagger>,
 [[null,<mod_lavacow:ectoplasm_ingot>,null],
  [null,<iceandfire:witherbone>,null],
  [null,null,null]]);

// Re-add fish undead moltenpan recipe
recipes.addShaped("dregora38",<mod_lavacow:moltenpan>,
 [[<mod_lavacow:moltenbeef>,<mod_lavacow:moltenbeef>,<mod_lavacow:moltenbeef>],
  [<mod_lavacow:moltenbeef>,<iceandfire:fire_lily>,<mod_lavacow:moltenbeef>],
  [null,<minecraft:blaze_rod>,null]]);

// Re-add fish undead moltenhammer recipe
recipes.addShaped("dregora39",<mod_lavacow:moltenhammer>,
 [[<mod_lavacow:moltenbeef>,<mod_lavacow:moltenbeef>,<mod_lavacow:moltenbeef>],
  [null,<iceandfire:fire_lily>,null],
  [null,<minecraft:blaze_rod>,null]]);

// Re-add fish undead moltenaxe recipe
recipes.addShaped("dregora40",<mod_lavacow:moltenaxe>,
 [[<mod_lavacow:moltenbeef>,<mod_lavacow:moltenbeef>,null],
  [<mod_lavacow:moltenbeef>,<iceandfire:fire_lily>,null],
  [null,<minecraft:blaze_rod>,null]]);

// Re-add fish undead holy_grenade recipe
recipes.addShaped("dregora41",<mod_lavacow:holy_grenade> * 16,
 [[<minecraft:gunpowder>*16,<bountifulbaubles:amuletcross>,<minecraft:gunpowder>*16],
  [<minecraft:quartz>*8,<mod_lavacow:holy_sludge>*16,<minecraft:quartz>*8],
  [<minecraft:gunpowder>*16,<minecraft:quartz>*8,<minecraft:gunpowder>*16]]);

// Halo necklace into spectral silt
recipes.addShapeless("dregora42",<bountifulbaubles:spectralsilt>,[<bountifulbaubles:disintegrationtablet>,<mod_lavacow:halo_necklace>]);

// Golden Heart into spectral silt
//recipes.addShapeless("dregora43",<bountifulbaubles:spectralsilt>,[<bountifulbaubles:disintegrationtablet>,<mod_lavacow:goldenheart>]);

// Re-add fish undead sonicbomb recipe
recipes.addShaped("dregora44",<mod_lavacow:sonicbomb>,
 [[<quark:soul_powder>,<mod_lavacow:banshee_vocal_cord>,<quark:soul_powder>],
  [<mod_lavacow:chitin>,<srparasites:lurecomponent2>,<mod_lavacow:chitin>],
  [<quark:soul_powder>,<mod_lavacow:chitin>,<quark:soul_powder>]]);

// Re-add fish undead Dragon Bone Stew recipe
recipes.addShaped("dregora45",<mod_lavacow:bonestew>,
 [[<minecraft:bowl>,<mod_lavacow:moltenpan>.anyDamage().transformDamage(8),null],
  [<iceandfire:dragonbone>,<mod_lavacow:bloodtooth_shroom>,null],
  [null,null,null]]);

// Re-add fish undead ghostjelly recipe
recipes.addShaped("dregora46",<mod_lavacow:ghostjelly>,
 [[<minecraft:bowl>,<mod_lavacow:moltenpan>.anyDamage().transformDamage(8),null],
  [<mod_lavacow:ectoplasm>,<bountifulbaubles:spectralsilt>,null],
  [null,null,null]]);

//=================================
//DREGORARL NEW ITEM SETS FROM VARIEDCOMMODITIES
//=================================

<variedcommodities:tuxedo_chest>.addTooltip("Fancy Chestpiece, extremely old yet in near pristine state.");
<variedcommodities:tuxedo_pants>.addTooltip("Fancy Pants, extremely old yet in near pristine state.");
<variedcommodities:tuxedo_bottom>.addTooltip("Aged yet Fancy Trenchcoat, extremely old yet in near pristine state.");

<variedcommodities:soldier_head>.displayName = "§6☢ §8§lProtective Helmet";
<variedcommodities:soldier_chest>.displayName = "§6☢ §8§lProtective ChestPlate";
<variedcommodities:soldier_legs>.displayName = "§6☢ §8§lProtective Leggings";
<variedcommodities:soldier_bottom>.displayName = "§6☢ §8§lProtective Bottoms";

<variedcommodities:soldier_head>.addTooltip("Woven from a unknown ancient material, There's more to this armor then the eye meets.");
<variedcommodities:soldier_chest>.addTooltip("Woven from a unknown ancient material, There's more to this armor then the eye meets.");
<variedcommodities:soldier_legs>.addTooltip("Woven from a unknown ancient material, There's more to this armor then the eye meets.");
<variedcommodities:soldier_bottom>.addTooltip("Woven from a unknown ancient material, There's more to this armor then the eye meets.");

<variedcommodities:x407_head>.displayName = "§8§lX407 Prototype Helmet";
<variedcommodities:x407_chest>.displayName = "§8§lX407 Prototype ChestPlate";
<variedcommodities:x407_legs>.displayName = "§8§lX407 Prototype Leggings";
<variedcommodities:x407_boots>.displayName = "§8§lX407 Prototype Boots";

<variedcommodities:x407_head>.addTooltip("The Pinnacle of engineering from a time before the Blight.");
<variedcommodities:x407_chest>.addTooltip("The Pinnacle of engineering from a time before the Blight.");
<variedcommodities:x407_legs>.addTooltip("The Pinnacle of engineering from a time before the Blight.");
<variedcommodities:x407_boots>.addTooltip("The Pinnacle of engineering from a time before the Blight.");

<variedcommodities:commissar_head>.displayName = "§8§lCommissar's Cap";
<variedcommodities:commissar_chest>.displayName = "§8§lCommissar's Torso";
<variedcommodities:commissar_legs>.displayName = "§8§lCommissar's Leggings";
<variedcommodities:commissar_bottom>.displayName = "§8§lCommissar's Bottoms";

<variedcommodities:commissar_head>.addTooltip("Aged decorative Cap, a leather cap lined with fine cloth.");
<variedcommodities:commissar_chest>.addTooltip("Aged decorative Chestpiece, a leather jack, lined with fine cloth complete with decorative elements.");
<variedcommodities:commissar_legs>.addTooltip("Aged decorative Pants, sturdy pants lined with fine cloth.");
<variedcommodities:commissar_bottom>.addTooltip("Aged decorative Trenchcoat, made to last.");

<variedcommodities:infantry_helmet>.addTooltip("Aged Equipment, still provides decent protection.");
<variedcommodities:officer_chest>.addTooltip("Old yet sturdy Chestplate, decorated with various emblems and signs.");
<variedcommodities:tactical_chest>.addTooltip("Aged Equipment, still provides decent protection.");
<variedcommodities:tactical_head>.addTooltip("Aged Equipment, still provides decent protection.");

<variedcommodities:nanorum_head>.displayName = "§8§lHeavy Industries Helmet";
<variedcommodities:nanorum_chest>.displayName = "§8§lHeavy Industries Torso";
<variedcommodities:nanorum_legs>.displayName = "§8§lHeavy Industries Leggings";
<variedcommodities:nanorum_boots>.displayName = "§8§lHeavy Industries Boots";

<variedcommodities:nanorum_head>.addTooltip("Aged Helmet, made of advanced alloys. Provides excellent protection.");
<variedcommodities:nanorum_chest>.addTooltip("Aged Chestplate, made of advanced alloys. Provides excellent protection.");
<variedcommodities:nanorum_legs>.addTooltip("Aged Legs, made of advanced alloys. Provides excellent protection.");
<variedcommodities:nanorum_boots>.addTooltip("Aged Boots, made of advanced alloys. Provides excellent protection.");

//=================================
//HERBALIST, AND BRUTAL TOWER TRADERS/INFO
//=================================

// Tell people where to get a biome purifier.
<srparasites:biomepurifier>.addTooltip(format.gold("Obtainable at most Herbalists, rarely found at their overgrown cabin in plains and flower fields."));

//Added easy to understand description to blood tears (so people know where to find them)
<contenttweaker:blood_tear>.addTooltip(format.yellow("Remnants of Dreadnauts and Overlords"));

//Add New trading system items description & lore
<variedcommodities:coin_stone>.displayName = "Brutal Fragment";
<variedcommodities:coin_stone>.addTooltip(format.gold("Fragments of a brutal coins found in brutal towers, can be repaired "));
<biomesoplenty:terrestrial_artifact>.addTooltip(format.gold("Brimming with the essence of life & purity, can be traded with most Herbalist to craft biome purifiers."));
<variedcommodities:coin_gold>.displayName = "Ancient Coins";
<variedcommodities:coin_gold>.addTooltip(format.gold("Treasure among Topographers in Outposts & the odd villager, usually found in ancient structures such as maintenance shafts and cities."));
<variedcommodities:ancient_coin>.displayName = "Brutal Coins";
<variedcommodities:ancient_coin>.addTooltip(format.gold("The rarest of treasures, found in brutal towers surrounded by gray fog and traded for exceptional items with Topographers in outposts & most Herbalist rarely found in cabins situated in plains and flower fields."));
<variedcommodities:lead_pipe>.displayName = "Ancient Artifact";
<variedcommodities:lead_pipe>.addTooltip(format.gold("Treasure among Topographers in Outposts, usually found in ancient structures such as maintenance shafts and cities."));
<variedcommodities:crowbar>.displayName = "Ancient Artifact";
<variedcommodities:crowbar>.addTooltip(format.gold("Treasure among Topographers in Outposts, usually found in ancient structures such as maintenance shafts and cities."));
<variedcommodities:hammer>.displayName = "Ancient Artifact";
<variedcommodities:hammer>.addTooltip(format.gold("Treasure among Topographers in Outposts, usually found in ancient structures such as maintenance shafts and cities."));
<variedcommodities:wrench>.displayName = "Ancient Artifact";
<variedcommodities:wrench>.addTooltip(format.gold("Treasure among Topographers in Outposts, usually found in ancient structures such as maintenance shafts and cities."));
<variedcommodities:pipe_wrench>.displayName = "Ancient Artifact";
<variedcommodities:pipe_wrench>.addTooltip(format.gold("Treasure among Topographers in Outposts, usually found in ancient structures such as maintenance shafts and cities."));

//Add the Tool Used Description for Barrier Blocks:
<dimstack:bedrock:7>.addTooltip(format.gold("Can be destroyed with an §4‡ §6§lBrutal Artifact - Theta§r §4‡§r equipped in offhand."));

//Add the Tool Used Description for Barrier Blocks:
<dimstack:bedrock:6>.addTooltip(format.gold("Can be destroyed with an §4‡ §6§lBrutal Pendant - Eta§r §4‡§r equipped in offhand."));

//Give Theta Brutal Key it's name:
<variedcommodities:artifact>.displayName = "§4‡ §6§lBrutal Artifact - Theta§r §4‡";
<variedcommodities:artifact>.addTooltip(format.gold("Gain the ability to destroy Theta barrier blocks when equipped in off-hand."));

//Give Eta Brutal Key it's name:
<variedcommodities:pendant>.displayName = "§4‡ §6§lBrutal Pendant - Eta§r §4‡";
<variedcommodities:pendant>.addTooltip(format.gold("Gain the ability to destroy Eta barrier blocks when equipped in off-hand."));

// Give Fire Element a better name
<variedcommodities:element_fire>.clearTooltip(true);
<variedcommodities:element_fire>.displayName = "Auric Essence";
<variedcommodities:element_fire>.addTooltip(format.darkGray("variedcommodities:element_fire"));
<variedcommodities:element_fire>.addTooltip(format.green("Essence abstracted from the purest of gold."));
<variedcommodities:element_fire>.addTooltip(format.gold("Can be obtained through Brutal Merchants in Outposts."));

// Give The Ruby Gem a better name
<variedcommodities:gem_ruby>.clearTooltip(true);
<variedcommodities:gem_ruby>.displayName = "Blood Gem";
<variedcommodities:gem_ruby>.addTooltip(format.darkGray("variedcommodities:gem_ruby"));
<variedcommodities:gem_ruby>.addTooltip(format.green("This gem, magical to those who not know it's secrets feels heavy and somehow alive..."));
<variedcommodities:gem_ruby>.addTooltip(format.gold("Extracted from Amalgalich remains."));

// Give the Orb for Eta barrier a better name.
<variedcommodities:orb:0>.clearTooltip(true);
<variedcommodities:gem_ruby>.displayName = "Brutal Orb";
<variedcommodities:orb:0>.addTooltip(format.darkGray("variedcommodities:orb"));
<variedcommodities:orb:0>.addTooltip(format.green("Within this orb resides a mighty power akin to lightning."));
<variedcommodities:orb:0>.addTooltip(format.gold("Only to be obtained from the deepest chambers of Brutal Towers."));

// Crafting recipe Pendant
recipes.addShaped("dregora20",<variedcommodities:pendant>,
 [[<variedcommodities:orb:0>,<variedcommodities:element_fire>,<variedcommodities:orb:0>],
  [<variedcommodities:element_fire>,<variedcommodities:gem_ruby>,<variedcommodities:element_fire>],
  [<variedcommodities:orb:0>,<variedcommodities:element_fire>,<variedcommodities:orb:0>]]);

val mendingPot = <minecraft:potion>.withTag({Potion: "potioncore:repair"});

// Crafting recipe Brutal Coin Fragments
recipes.addShaped("dregora32",<variedcommodities:ancient_coin>,
 [[<variedcommodities:coin_stone>,<variedcommodities:coin_stone>,<variedcommodities:coin_stone>],
  [<variedcommodities:coin_stone>,mendingPot,<variedcommodities:coin_stone>],
  [<variedcommodities:coin_stone>,<variedcommodities:coin_stone>,<variedcommodities:coin_stone>]]);


//=================================
//Amalgalich, Asmodeus, Rahovart SUMMON CHANGES
//=================================


// Give the Orbs for Lycanites Summons a better name.
<variedcommodities:orb:1>.clearTooltip(true);
<variedcommodities:orb:5>.clearTooltip(true);
<variedcommodities:orb:6>.clearTooltip(true);

<variedcommodities:gem_ruby>.displayName = "Brutal Orb";
<variedcommodities:orb:1>.addTooltip(format.darkGray("variedcommodities:orb"));
<variedcommodities:orb:1>.addTooltip(format.green("Through the Orb you can see suffering and fire."));
<variedcommodities:orb:1>.addTooltip(format.gold("Can be obtained through Brutal Merchants in Outposts."));

<variedcommodities:gem_ruby>.displayName = "Brutal Orb";
<variedcommodities:orb:5>.addTooltip(format.darkGray("variedcommodities:orb"));
<variedcommodities:orb:5>.addTooltip(format.green("Orbs of unknown, perhaps alien origin."));
<variedcommodities:orb:5>.addTooltip(format.gold("Can be obtained through Brutal Merchants in Outposts."));

<variedcommodities:gem_ruby>.displayName = "Shadow Orb";
<variedcommodities:orb:6>.addTooltip(format.darkGray("variedcommodities:orb"));
<variedcommodities:orb:6>.addTooltip(format.green("A Dark fog resides within the orb."));
<variedcommodities:orb:6>.addTooltip(format.gold("Can be obtained through Brutal Merchants in Outposts."));

// Remove Lycanite Summoners:
recipes.remove(<lycanitesmobs:soulcubeaberrant>);
recipes.remove(<lycanitesmobs:soulcubeundead>);
recipes.remove(<lycanitesmobs:soulcubedemonic>);

// Re-add Amalgalich Summoner
recipes.addShaped("dregora21",<lycanitesmobs:soulcubeundead>,
 [[<variedcommodities:orb:6>,<variedcommodities:skull>,<variedcommodities:orb:6>],
  [<variedcommodities:skull>,<lycanitesmobs:soulstone_undead>,<variedcommodities:skull>],
  [<variedcommodities:orb:6>,<variedcommodities:skull>,<variedcommodities:orb:6>]]);

// Re-add Asmodeus Summoner
recipes.addShaped("dregora22",<lycanitesmobs:soulcubeaberrant>,
 [[<variedcommodities:orb:5>,<variedcommodities:heart>,<variedcommodities:orb:5>],
  [<variedcommodities:heart>,<lycanitesmobs:soulstone_aberration>,<variedcommodities:heart>],
  [<variedcommodities:orb:5>,<variedcommodities:heart>,<variedcommodities:orb:5>]]);

// Re-add Rahovart Summoner
recipes.addShaped("dregora23",<lycanitesmobs:soulcubedemonic>,
 [[<variedcommodities:orb:1>,<quark:biotite>,<variedcommodities:orb:1>],
  [<quark:biotite>,<lycanitesmobs:soulstone_demon>,<quark:biotite>],
  [<variedcommodities:orb:1>,<quark:biotite>,<variedcommodities:orb:1>]]);

//=================================
//SRParasites new weapons
//=================================

/*
recipes.addShaped("dregora33",<srparasites:weapon_maul>,
 [[<srparasites:infectious_blade_fragment>,<srparasites:living_core>,<srparasites:infectious_blade_fragment>],
  [null,<srparasites:vile_shell>,<srparasites:infectious_blade_fragment>],
  [<srparasites:hardened_bone_handle>,null,null]]);
*/
recipes.addShaped("dregora34",<srparasites:weapon_lance>,
 [[null,<srparasites:infectious_blade_fragment>,null],
  [null,<srparasites:living_core>,null],
  [null,<srparasites:hardened_bone_handle>,null]]);

//=================================
//BOP RECIPES & NAME CHANGES
//=================================

// Remove macaw bamboo bridge recipe
recipes.remove(<mcwbridges:bamboo_bridge>);
recipes.remove(<mcwbridges:dry_bamboo_bridge>);

// Re-add macaw dry bamboo bridge recipe
recipes.addShaped("dregora27",<mcwbridges:dry_bamboo_bridge>,
 [[null,null,null],
  [<biomesoplenty:plant_1:5>,<minecraft:string>,<biomesoplenty:plant_1:5>],
  [<biomesoplenty:bamboo>,<biomesoplenty:bamboo>,<biomesoplenty:bamboo>]]);

// Re-add macaw bamboo bridge recipe
recipes.addShaped("dregora26",<mcwbridges:bamboo_bridge>,
 [[null,null,null],
  [<biomesoplenty:bamboo>,<minecraft:string>,<biomesoplenty:bamboo>],
  [<biomesoplenty:bamboo>,<biomesoplenty:bamboo>,<biomesoplenty:bamboo>]]);

// Flax to string recipe
recipes.addShapeless("dregora29",<minecraft:string>,[<biomesoplenty:double_plant:0>]);

// BiomesoPlenty:root to quark:root
recipes.addShapeless("dregora30",<quark:root>,[<biomesoplenty:plant_1:9>]);

// Small Cactus to Cactus fruit
recipes.addShapeless("dregora31",<biomesoplenty:plant_1:6>,[<foodexpansion:itemcactusfruit>]);

// Barley to Wheat recipe
recipes.addShapeless("dregora28",<minecraft:wheat>,[<ore:toolKnife>.transformDamage(2),<biomesoplenty:plant_1:11>]);

//recipes.addShaped("dregora28",<minecraft:wheat> * 3,
// [[<biomesoplenty:plant_1:11>,<biomesoplenty:plant_1:11>,<biomesoplenty:plant_1:11>],
//  [<biomesoplenty:plant_1:11>,<biomesoplenty:plant_1:11>,<biomesoplenty:plant_1:11>],
//  [<biomesoplenty:plant_1:11>,<biomesoplenty:plant_1:11>,<biomesoplenty:plant_1:11>]]);

//Harvesting Tooltips:
<biomesoplenty:plant_1:11>.addTooltip("Harvest with shears.");
<biomesoplenty:double_plant:0>.addTooltip("Harvest with shears.");
<biomesoplenty:plant_1:3>.addTooltip("Harvest with shears.");

//Lower Bamboo Fuel time & add dried leaves as fuel.
furnace.setFuel(<biomesoplenty:bamboo>, 100);
furnace.setFuel(<biomesoplenty:plant_0:0>, 100);

//Remove ceramic vessel from furnace crafting
furnace.remove(<notreepunching:ceramic_small_vessel>);
recipes.remove(<notreepunching:ceramic_small_vessel>);

//Removed biome finder from BOP for it causes lag spikes.
recipes.remove(<biomesoplenty:biome_finder>);

// Remove BOP non-used and double recipes:
recipes.remove(<biomesoplenty:plant_0:4>);
recipes.remove(<biomesoplenty:jar_filled:0>);
recipes.remove(<biomesoplenty:berries>);
recipes.remove(<biomesoplenty:berries>);
recipes.remove(<biomesoplenty:plant_0:5>);
recipes.remove(<biomesoplenty:gem:6>);
recipes.remove(<biomesoplenty:gem_block:6>);
recipes.remove(<biomesoplenty:terrestrial_artifact>);

<biomesoplenty:mushroom:3>.displayName = "Gleamshroom";
<biomesoplenty:terrarium:8>.displayName = "Gleamshroom Terrarium";

//make bop reed have a use, turn it into plant fibers:
recipes.addShapeless("dregora25",<notreepunching:grass_fiber>*3,[<biomesoplenty:plant_1:8>]);

//fix BOP error unregistered item:
//recipes.remove(<notreepunching:saw_planks_7>);
recipes.addShapeless("dregora19",<biomesoplenty:planks_0:0> * 4,[<ore:toolSaw>.transformDamage(4),<biomesoplenty:log_0:4>]);

// Make BOP logs skinable using hatchet - If true, NTP will add its own log->plank and plank->stick recipes and remove old versions
recipes.addShapeless("dregora17",<minecraft:stick>*8,[<biomesoplenty:log_4:4>]);
recipes.addShapeless("dregora18",<minecraft:stick>*8,[<biomesoplenty:log_4:5>]);

// Remove BOP doors recipe due to 3x door results
recipes.remove(<biomesoplenty:sacred_oak_door>);
recipes.remove(<biomesoplenty:cherry_door>);
recipes.remove(<biomesoplenty:umbran_door>);
recipes.remove(<biomesoplenty:fir_door>);
recipes.remove(<biomesoplenty:ethereal_door>);
recipes.remove(<biomesoplenty:magic_door>);
recipes.remove(<biomesoplenty:mangrove_door>);
recipes.remove(<biomesoplenty:palm_door>);
recipes.remove(<biomesoplenty:redwood_door>);
recipes.remove(<biomesoplenty:willow_door>);
recipes.remove(<biomesoplenty:pine_door>);
recipes.remove(<biomesoplenty:hellbark_door>);
recipes.remove(<biomesoplenty:jacaranda_door>);
recipes.remove(<biomesoplenty:mahogany_door>);
recipes.remove(<biomesoplenty:ebony_door>);
recipes.remove(<biomesoplenty:eucalyptus_door>);

// Add BOP doors recipe with 2x door result.
recipes.addShaped("dregora01",<biomesoplenty:sacred_oak_door>*2,
 [[<biomesoplenty:planks_0:0>,<biomesoplenty:planks_0:0>,null],
  [<biomesoplenty:planks_0:0>,<biomesoplenty:planks_0:0>,null],
  [<biomesoplenty:planks_0:0>,<biomesoplenty:planks_0:0>,null]]);

recipes.addShaped("dregora02",<biomesoplenty:cherry_door>*2,
 [[<biomesoplenty:planks_0:1>,<biomesoplenty:planks_0:1>,null],
  [<biomesoplenty:planks_0:1>,<biomesoplenty:planks_0:1>,null],
  [<biomesoplenty:planks_0:1>,<biomesoplenty:planks_0:1>,null]]);

recipes.addShaped("dregora03",<biomesoplenty:umbran_door>*2,
 [[<biomesoplenty:planks_0:2>,<biomesoplenty:planks_0:2>,null],
  [<biomesoplenty:planks_0:2>,<biomesoplenty:planks_0:2>,null],
  [<biomesoplenty:planks_0:2>,<biomesoplenty:planks_0:2>,null]]);

recipes.addShaped("dregora04",<biomesoplenty:fir_door>*2,
 [[<biomesoplenty:planks_0:3>,<biomesoplenty:planks_0:3>,null],
  [<biomesoplenty:planks_0:3>,<biomesoplenty:planks_0:3>,null],
  [<biomesoplenty:planks_0:3>,<biomesoplenty:planks_0:3>,null]]);

recipes.addShaped("dregora05",<biomesoplenty:ethereal_door>*2,
 [[<biomesoplenty:planks_0:4>,<biomesoplenty:planks_0:4>,null],
  [<biomesoplenty:planks_0:4>,<biomesoplenty:planks_0:4>,null],
  [<biomesoplenty:planks_0:4>,<biomesoplenty:planks_0:4>,null]]);

recipes.addShaped("dregora06",<biomesoplenty:magic_door>*2,
 [[<biomesoplenty:planks_0:5>,<biomesoplenty:planks_0:5>,null],
  [<biomesoplenty:planks_0:5>,<biomesoplenty:planks_0:5>,null],
  [<biomesoplenty:planks_0:5>,<biomesoplenty:planks_0:5>,null]]);

recipes.addShaped("dregora07",<biomesoplenty:mangrove_door>*2,
 [[<biomesoplenty:planks_0:6>,<biomesoplenty:planks_0:6>,null],
  [<biomesoplenty:planks_0:6>,<biomesoplenty:planks_0:6>,null],
  [<biomesoplenty:planks_0:6>,<biomesoplenty:planks_0:6>,null]]);

recipes.addShaped("dregora08",<biomesoplenty:palm_door>*2,
 [[<biomesoplenty:planks_0:7>,<biomesoplenty:planks_0:7>,null],
  [<biomesoplenty:planks_0:7>,<biomesoplenty:planks_0:7>,null],
  [<biomesoplenty:planks_0:7>,<biomesoplenty:planks_0:7>,null]]);

recipes.addShaped("dregora09",<biomesoplenty:redwood_door>*2,
 [[<biomesoplenty:planks_0:8>,<biomesoplenty:planks_0:8>,null],
  [<biomesoplenty:planks_0:8>,<biomesoplenty:planks_0:8>,null],
  [<biomesoplenty:planks_0:8>,<biomesoplenty:planks_0:8>,null]]);

recipes.addShaped("dregora10",<biomesoplenty:willow_door>*2,
 [[<biomesoplenty:planks_0:9>,<biomesoplenty:planks_0:9>,null],
  [<biomesoplenty:planks_0:9>,<biomesoplenty:planks_0:9>,null],
  [<biomesoplenty:planks_0:9>,<biomesoplenty:planks_0:9>,null]]);

recipes.addShaped("dregora11",<biomesoplenty:pine_door>*2,
 [[<biomesoplenty:planks_0:10>,<biomesoplenty:planks_0:10>,null],
  [<biomesoplenty:planks_0:10>,<biomesoplenty:planks_0:10>,null],
  [<biomesoplenty:planks_0:10>,<biomesoplenty:planks_0:10>,null]]);

recipes.addShaped("dregora12",<biomesoplenty:hellbark_door>*2,
 [[<biomesoplenty:planks_0:11>,<biomesoplenty:planks_0:11>,null],
  [<biomesoplenty:planks_0:11>,<biomesoplenty:planks_0:11>,null],
  [<biomesoplenty:planks_0:11>,<biomesoplenty:planks_0:11>,null]]);

recipes.addShaped("dregora13",<biomesoplenty:jacaranda_door>*2,
 [[<biomesoplenty:planks_0:12>,<biomesoplenty:planks_0:12>,null],
  [<biomesoplenty:planks_0:12>,<biomesoplenty:planks_0:12>,null],
  [<biomesoplenty:planks_0:12>,<biomesoplenty:planks_0:12>,null]]);

recipes.addShaped("dregora14",<biomesoplenty:mahogany_door>*2,
 [[<biomesoplenty:planks_0:13>,<biomesoplenty:planks_0:13>,null],
  [<biomesoplenty:planks_0:13>,<biomesoplenty:planks_0:13>,null],
  [<biomesoplenty:planks_0:13>,<biomesoplenty:planks_0:13>,null]]);

recipes.addShaped("dregora15",<biomesoplenty:ebony_door>*2,
 [[<biomesoplenty:planks_0:14>,<biomesoplenty:planks_0:14>,null],
  [<biomesoplenty:planks_0:14>,<biomesoplenty:planks_0:14>,null],
  [<biomesoplenty:planks_0:14>,<biomesoplenty:planks_0:14>,null]]);

recipes.addShaped("dregora16",<biomesoplenty:eucalyptus_door>*2,
 [[<biomesoplenty:planks_0:15>,<biomesoplenty:planks_0:15>,null],
  [<biomesoplenty:planks_0:15>,<biomesoplenty:planks_0:15>,null],
  [<biomesoplenty:planks_0:15>,<biomesoplenty:planks_0:15>,null]]);

// Drop Shattered Ice from ice blocks
furnace.setFuel(<biomesoplenty:seaweed>, 400);
<biomesoplenty:seaweed>.displayName = "Dried Seaweed";
furnace.addRecipe(<biomesoplenty:seaweed>, <aquaculture:food:0>, 99999);
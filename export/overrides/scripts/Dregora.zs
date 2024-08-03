import crafttweaker.events.IEventManager;
import crafttweaker.event.BlockHarvestDropsEvent;
import crafttweaker.event.BlockBreakEvent;
import crafttweaker.event.IBlockEvent;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.block.IBlock;
import crafttweaker.item.IItemStack;
import crafttweaker.event.IEventCancelable;
import crafttweaker.event.IEventHasResult;
import crafttweaker.event.IEventPositionable;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.event.PlayerTickEvent;
import crafttweaker.entity.IEntity;
import crafttweaker.world.IBlockAccess;
import crafttweaker.world.IWorld;
import crafttweaker.block.IBlockProperties;
import crafttweaker.util.Position3f;
import crafttweaker.potions.IPotion;
import crafttweaker.potions.IPotionEffect;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.player.IPlayer;
import crafttweaker.event.EntityLivingDamageEvent;
import crafttweaker.event.ILivingEvent;
import crafttweaker.event.EntityLivingUpdateEvent;
import crafttweaker.command.ICommandManager;
import crafttweaker.command.ICommandSender;
import crafttweaker.event.EntityLivingDeathDropsEvent;
import crafttweaker.event.EntityLivingSpawnEvent;
import crafttweaker.event.EntityLivingExtendedSpawnEvent;
import crafttweaker.event.ProjectileImpactThrowableEvent;
import crafttweaker.event.EntityLivingUseItemEvent.All;
import crafttweaker.event.EntityLivingUseItemEvent.Finish;
import crafttweaker.tileentity.IMobSpawnerBaseLogic;
import crafttweaker.event.EntityLivingDeathEvent;
import crafttweaker.data.IData;
import crafttweaker.entity.IEntityEquipmentSlot;
import mods.ctintegration.baubles.IBaubleInventory;
import crafttweaker.entity.AttributeInstance;
import crafttweaker.world.IBiomeType;
import crafttweaker.world.IBiome;
import crafttweaker.block.IBlockDefinition;
import crafttweaker.event.ProjectileImpactArrowEvent;
import crafttweaker.potions.IPotionType;
import crafttweaker.event.PlayerRespawnEvent;
import crafttweaker.event.CommandEvent;
import crafttweaker.event.PlayerRightClickItemEvent;
import crafttweaker.entity.IEntityDefinition;
import crafttweaker.util.IAxisAlignedBB;


// use /ct syntax to validate scripts

print("Dregora Script starting!");

//Debug lines true/false
var Logging = false;

//=================================
//Normal recipe adjustments
//=================================

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

// Removed Items
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

// Ban Hammer Tooltip
<mod_lavacow:skeletonking_mace>.addTooltip("§9Effects not applied on bosses.");

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
<mod_lavacow:mootenheart>.addTooltip("§9Fish's Undead Rising");
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

recipes.addShaped("dregora33",<srparasites:weapon_maul>,
 [[<srparasites:infectious_blade_fragment>,<srparasites:living_core>,<srparasites:infectious_blade_fragment>],
  [null,<srparasites:vile_shell>,<srparasites:infectious_blade_fragment>],
  [<srparasites:hardened_bone_handle>,null,null]]);

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


// Aquaculture seaweed dropped from kelp, can be baked to become kelp and kelp can be used as a fuel source to smelt 2 items. (Same-ish as 1.16.5)
// Drop Shattered Ice from ice blocks
furnace.setFuel(<biomesoplenty:seaweed>, 400);
<biomesoplenty:seaweed>.displayName = "Dried Seaweed";
furnace.addRecipe(<biomesoplenty:seaweed>, <aquaculture:food:0>, 99999);

events.onBlockHarvestDrops(function(blockDrops as BlockHarvestDropsEvent){

    if (( blockDrops.block has <biomesoplenty:seaweed>.asBlock() ) || ( blockDrops.block has <biomesoplenty:coral:*>.asBlock() ) || ( blockDrops.block has <coralreef:coral:*>.asBlock() )) {

        if !blockDrops.isPlayer {
            blockDrops.drops = [] as WeightedItemStack[];
            return;
        }

        var blocktop = Position3f.create(blockDrops.position.x, blockDrops.position.y, blockDrops.position.z).asBlockPos();
        //print(blockDrops.world.getBlockState(blocktop).block.definition.id);

        while (( blockDrops.world.getBlockState(blocktop).block.definition.id has "biomesoplenty:seaweed" ) || ( blockDrops.world.getBlockState(blocktop).block.definition.id has "biomesoplenty:coral" ) || ( blockDrops.world.getBlockState(blocktop).block.definition.id has "coralreef:coral" )) {
            var blockY = blockDrops.position.y + 1;
            var blocktop = Position3f.create(blockDrops.position.x, blockY, blockDrops.position.z).asBlockPos();
        }


        if ( blockDrops.block has <biomesoplenty:seaweed>.asBlock() ) {
            blockDrops.drops = [<aquaculture:food:0>.weight(1.0)] as WeightedItemStack[];
        }
    }

    if (blockDrops.block has <minecraft:ice>.asBlock() ) || (blockDrops.block has <iceandfire:dragon_ice>.asBlock() ) || (blockDrops.block has <biomesoplenty:hard_ice>.asBlock() ) || (blockDrops.block has <minecraft:packed_ice>.asBlock() ){

        if !blockDrops.isPlayer {return;}
        for i in 1 to blockDrops.world.random.nextFloat(1, 2) {

            blockDrops.drops = [<mod_lavacow:shattered_ice>.weight(1.0)] as WeightedItemStack[];

        }
    }
});

//=================================
//DREGORARL SCRIPTS AND EVENTS
//=================================


// Script to test simple scripts with

static stick as IItemStack = <variedcommodities:stone_staff>;
static speed as double = 1.5;
var ProjectileItterations = -10 as int;

events.onPlayerRightClickItem(function(event as crafttweaker.event.PlayerRightClickItemEvent) {
    if (!event.player.world.isRemote()) { return; }
    if (event.item.definition.id.matches(stick.definition.id)) {

        // Get player lookingDirection vectors and normalize them
        var pX = event.player.lookingDirection.normalized.x;
        var pY = event.player.lookingDirection.normalized.y;
        var pZ = event.player.lookingDirection.normalized.z;

        // Offset player shooting position by where they're looking
        // Projectiles spawn directly inside of the player normally
        var fX = event.player.x + (pX * 2);
        var fY = event.player.y + (pY + 2);
        var fZ = event.player.z + (pZ * 2);
        var pos = crafttweaker.util.Position3f.create(fX, fY, fZ);

        // Multiply the projectile by speed value
        var sX = pX * speed;
        var sY = pY * speed;
        var sZ = pZ * speed;


        var ProjectileArrayCount = 0;
        var ProjectileArray = [

            <entity:srparasites:bomb>,
            <entity:minecraft:arrow>

            ] as IEntityDefinition[];

        for item in ProjectileArray {

            var ProjectileArrayCount = ProjectileArrayCount + 1;
        }


        if (ProjectileItterations == -10) {

            var ProjectileItterations = ProjectileArrayCount as int;

        } else if (ProjectileItterations > -1) {

            var ProjectileItterations = ProjectileItterations - 1;

        } else {

            var ProjectileItterations = ProjectileArrayCount as int;

        }



        var entityobject = ProjectileArray[ProjectileItterations].createEntity(event.player.world);

        entityobject.setPosition(pos);
        entityobject.motionX = sX;
        entityobject.motionY = sY;
        entityobject.motionZ = sZ;

        event.player.world.spawnEntity(entityobject);

    }
});


var ArrowArray = [
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:strong_broken_armor"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:broken_armor"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:long_klutz"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:strong_klutz"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:klutz"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:dispel"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:strong_launch"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:launch"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:long_weight"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:long_broken_armor"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:spin"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:strong_spin"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:long_spin"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:curse"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:strong_curse"}),
	<minecraft:tipped_arrow>.withTag({Potion: "quark:mining_fatigue"}),
	<minecraft:tipped_arrow>.withTag({Potion: "quark:long_mining_fatigue"}),
	<minecraft:tipped_arrow>.withTag({Potion: "quark:strong_mining_fatigue"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:disorganization"}),
	<minecraft:tipped_arrow>.withTag({Potion: "srparasites:foster"}),
	<minecraft:tipped_arrow>.withTag({Potion: "srparasites:coth"}),
	<minecraft:tipped_arrow>.withTag({Potion: "srparasites:fear"}),
	<minecraft:tipped_arrow>.withTag({Potion: "srparasites:res"}),
	<minecraft:tipped_arrow>.withTag({Potion: "srparasites:corro"}),
	<minecraft:tipped_arrow>.withTag({Potion: "srparasites:vira"}),
	<minecraft:tipped_arrow>.withTag({Potion: "srparasites:rage"}),
	<minecraft:tipped_arrow>.withTag({Potion: "srparasites:debar"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:magic_inhibition"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:weight"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:lightning"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:strong_explode"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:long_magic_inhibition"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:teleport"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:strong_teleport"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:teleport_surface"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:drown"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:long_drown"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:teleport_spawn"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:long_vulnerable"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:strong_vulnerable"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:vulnerable"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:long_rust"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:strong_rust"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:rust"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:long_perplexity"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:perplexity"}),
	<minecraft:tipped_arrow>.withTag({Potion: "minecraft:long_slowness"}),
	<minecraft:tipped_arrow>.withTag({Potion: "minecraft:slowness"}),
	<minecraft:tipped_arrow>.withTag({Potion: "mujmajnkraftsbettersurvival:milk"}),
	<minecraft:tipped_arrow>.withTag({Potion: "mujmajnkraftsbettersurvival:long_antiwarp"}),
	<minecraft:tipped_arrow>.withTag({Potion: "mujmajnkraftsbettersurvival:antiwarp"}),
	<minecraft:tipped_arrow>.withTag({Potion: "mujmajnkraftsbettersurvival:strong_decay"}),
	<minecraft:tipped_arrow>.withTag({Potion: "mujmajnkraftsbettersurvival:long_decay"}),
	<minecraft:tipped_arrow>.withTag({Potion: "mujmajnkraftsbettersurvival:decay"}),
	<minecraft:tipped_arrow>.withTag({Potion: "mujmajnkraftsbettersurvival:long_blindness"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:long_blindness"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:nausea"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:long_nausea"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:levitation"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:strong_levitation"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:long_levitation"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:unluck"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:long_hunger"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:strong_hunger"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:hunger"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:long_wither"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:strong_wither"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:wither"}),
	<minecraft:tipped_arrow>.withTag({Potion: "elenaidodge:long_sluggish"}),
	<minecraft:tipped_arrow>.withTag({Potion: "elenaidodge:sluggish"}),
	<minecraft:tipped_arrow>.withTag({Potion: "elenaidodge:strong_feeble"}),
	<minecraft:tipped_arrow>.withTag({Potion: "minecraft:harming"}),
	<minecraft:tipped_arrow>.withTag({Potion: "minecraft:strong_harming"}),
	<minecraft:tipped_arrow>.withTag({Potion: "minecraft:poison"}),
	<minecraft:tipped_arrow>.withTag({Potion: "minecraft:long_poison"}),
	<minecraft:tipped_arrow>.withTag({Potion: "minecraft:strong_poison"}),
	<minecraft:tipped_arrow>.withTag({Potion: "minecraft:long_weakness"}),
	<minecraft:tipped_arrow>.withTag({Potion: "mujmajnkraftsbettersurvival:blindness"}),
	<minecraft:tipped_arrow>.withTag({Potion: "elenaidodge:feeble"}),
	<minecraft:tipped_arrow>.withTag({Potion: "elenaidodge:long_feeble"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:strong_magic_inhibition"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:strong_weight"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:fire"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:invert"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:long_broken_magic_shield"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:broken_magic_shield"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:strong_broken_magic_shield"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:strong_blindness"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:blindness"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:explode"}),
	<minecraft:tipped_arrow>.withTag({Potion: "xat:extended_goblin"}),
	<minecraft:tipped_arrow>.withTag({Potion: "xat:goblin"})
	] as IItemStack[];


// Entities with tipped arrow in offhand apply potion effect on target hit
// Use ForgeData: NoArrowSwitch: 1 to exclude entities from changing arrows

events.onEntityLivingDamage(function(event as EntityLivingDamageEvent){

    if event.entity.world.isRemote() {return;}
    if (isNull(event.damageSource)) {return;}
    if (isNull(event.damageSource.getTrueSource())) {return;}
    if (isNull(event.damageSource.getTrueSource().heldEquipment)) {return;}
    if ((event.damageSource.getTrueSource().heldEquipment.length ) == 0) {return;}
    if (isNull(event.damageSource.getTrueSource().heldEquipment[0])) {return;}
    if (isNull(event.damageSource.getTrueSource().heldEquipment[1])) {return;}

    if (isNull(event.damageSource.getTrueSource().heldEquipment[1].tag)) {return;}
    if (isNull(event.damageSource.getTrueSource().heldEquipment[1].tag.Potion)) {return;}

    if (event.damageSource.getTrueSource().heldEquipment[0].name has "bow") {


        val buildPotion = IPotionType.fromString(event.damageSource.getTrueSource().heldEquipment[1].tag.Potion);
        val applyPotion = buildPotion.effects[0].potion as IPotion;
        val potionDuration = buildPotion.effects[0].duration as int;
        val potionAmplifier = buildPotion.effects[0].amplifier as int;

        var entityBase as IEntityLivingBase = event.entityLivingBase;
        entityBase.addPotionEffect(applyPotion.makePotionEffect(potionDuration, potionAmplifier));

        //summon minecraft:stray ~ ~1 ~ {HandItems:[{id:"minecraft:iron_sword",Count:1},{id:"minecraft:tipped_arrow",tag:{Potion:"potioncore:strong_teleport"},Count:1}]}
        //summon minecraft:stray ~ ~1 ~ {HandItems:[{id:"minecraft:bow",Count:1},{id:"minecraft:tipped_arrow",tag:{Potion:"minecraft:poison"},Count:1}]}
        //summon lycanitesmobs:roc ~ ~1 ~ {Passengers:[{id:"minecraft:wither_skeleton",NoGravity:1b,HandItems:[{id:"switchbow:switchbow",Count:1},{id:"switchbow:arrowprotector",Count:1}]}]}

        if (isNull(event.damageSource.getTrueSource().nbt)) {return;}
        if (isNull(event.damageSource.getTrueSource().nbt.ForgeData)) {return;}
        if (isNull(event.damageSource.getTrueSource().nbt.ForgeData.ArrowEntity)) {return;}
        if (event.damageSource.getTrueSource().nbt.ForgeData.ArrowEntity != 1) {return;}

        if (!isNull(event.damageSource.getTrueSource().nbt.ForgeData.NoArrowSwitch)){return;}

        var entityShooter as IEntityLivingBase = event.damageSource.getTrueSource();
        var randomInt = entityShooter.world.random.nextFloat(0, 100);
        var randomArrow = entityShooter.world.random.nextFloat(0, 90);
        var selectedArrow = ArrowArray[randomArrow];

        if (isNull(entityShooter.customName)) {

            if (randomInt <= 20) {

                entityShooter.setItemToSlot(crafttweaker.entity.IEntityEquipmentSlot.offhand(), selectedArrow);
            }

        } else {

            if (entityShooter.customName has "Jester") {

                entityShooter.setItemToSlot(crafttweaker.entity.IEntityEquipmentSlot.offhand(), selectedArrow);

            } else if (randomInt <= 20) {

                entityShooter.setItemToSlot(crafttweaker.entity.IEntityEquipmentSlot.offhand(), selectedArrow);

            }

        }

    }
});



//Killing entities gives Living weapon points
events.onEntityLivingDeath(function(event as EntityLivingDeathEvent){

    if event.entity.world.isRemote() {return;}

    if (!isNull(event.entity.definition)) {

        if (!isNull(event.entity.definition.id)) {

            if (!isNull(event.damageSource.getTrueSource())){

                if ((event.entity.definition.id) has "srparasites") {

                    if (isNull(event.damageSource.getTrueSource().heldEquipment)) {return;}
                    if (isNull(event.damageSource.getTrueSource().heldEquipment[0])) {return;}
                    if (isNull(event.damageSource.getTrueSource().heldEquipment[0].name)) {return;}

                    var HeldEquipment = event.damageSource.getTrueSource().heldEquipment;



                    var HeldWeapon = HeldEquipment[0].name;

                    if ((HeldWeapon == "item.srparasites.weapon_scythe") || (HeldWeapon == "item.srparasites.weapon_axe") || (HeldWeapon == "item.srparasites.weapon_sword") || (HeldWeapon == "item.srparasites.weapon_cleaver") || (HeldWeapon == "item.srparasites.weapon_bow") || (HeldWeapon == "item.srparasites.weapon_maul") || (HeldWeapon == "item.srparasites.weapon_lance")) {

                        var totalHealth = event.entityLivingBase.maxHealth;

                        if (!isNull(HeldEquipment[0].tag.srpkills)) {

                            var CurrentKills = HeldEquipment[0].tag.srpkills;
                            var TotalNewKills = CurrentKills + totalHealth;

                            HeldEquipment[0].mutable().updateTag({srpkills:TotalNewKills});

                        } else {

                            HeldEquipment[0].mutable().updateTag({srpkills:totalHealth});

                        }
                    }
                }
            }
        }
    }
});



//summon playerbosses:player_boss ~ ~1 ~ {CustomName:"§4☢ §5§lBlighted Shivaxi§r §4☢"}
//Function to dismount players if hit by entity named Dismounter && Function giving Shivaxi a phase 2 below 10 health if in Abyssal Rift
events.onEntityLivingDamage(function(event as EntityLivingDamageEvent){

    if (!isNull(event.damageSource.getTrueSource())){
        if(!isNull(event.damageSource.getTrueSource().getCustomName())){
            if((event.damageSource.getTrueSource().getCustomName() has "Dismounter") || (event.damageSource.getTrueSource().getCustomName() has "Dismounting")) {
                if(event.entity.isRiding) {
                    event.entity.dismountRidingEntity();
                    event.entity.removePassengers();
                }
            }
        }
    }

    if (isNull(event.entity)){return;}
    if (isNull(event.entity.definition)){return;}
    if (isNull(event.entity.definition.id)){return;}
    if ((event.entity.definition.id) == "playerbosses:player_boss"){

        var Phase03 = event.entityLivingBase.maxHealth /4;
        var Phase02 = event.entityLivingBase.maxHealth /2;
        var EntityBiome = event.entity.world.getBiome(event.entity.getPosition3f()).name;

        if ((EntityBiome) == "Abyssal Rift") {


            if ((Phase02 >= event.entityLivingBase.health) && (Phase03 <= event.entityLivingBase.health)){

                var buglin = <entity:srparasites:buglin>.createEntity(event.entityLivingBase.world);
                var adventurerhead = <entity:srparasites:sim_adventurerhead>.createEntity(event.entityLivingBase.world);
                var rupter = <entity:srparasites:rupter>.createEntity(event.entityLivingBase.world);
                var mediumform = <entity:srparasites:incompleteform_medium>.createEntity(event.entityLivingBase.world);
                var yelloweye = <entity:srparasites:pri_yelloweye>.createEntity(event.entityLivingBase.world);
                var EntityArray = [buglin, buglin, buglin, buglin, buglin, buglin, adventurerhead, adventurerhead, adventurerhead, rupter, rupter, rupter, mediumform, mediumform, yelloweye] as IEntity[];

                for i in 0 to event.entity.world.random.nextFloat(1, 6) {

                    var RandomEntity = event.entity.world.random.nextFloat(0, 14);
                    var EntitySelected = EntityArray[RandomEntity] as IEntity;
                    var RandomNum = event.entity.world.random.nextFloat(5, 10);


                    var pos1 = Position3f.create(event.entity.position.x, event.entity.position.y + 3, event.entity.position.z - RandomNum).asBlockPos();
                    var pos2 = Position3f.create(event.entity.position.x, event.entity.position.y + 3, event.entity.position.z + RandomNum).asBlockPos();
                    var pos3 = Position3f.create(event.entity.position.x - RandomNum, event.entity.position.y + 3, event.entity.position.z).asBlockPos();
                    var pos4 = Position3f.create(event.entity.position.x + RandomNum, event.entity.position.y + 3, event.entity.position.z).asBlockPos();

                    var pos5 = Position3f.create(event.entity.position.x - RandomNum, event.entity.position.y + 3, event.entity.position.z - RandomNum).asBlockPos();
                    var pos6 = Position3f.create(event.entity.position.x - RandomNum, event.entity.position.y + 3, event.entity.position.z + RandomNum).asBlockPos();
                    var pos7 = Position3f.create(event.entity.position.x + RandomNum, event.entity.position.y + 3, event.entity.position.z + RandomNum).asBlockPos();
                    var pos8 = Position3f.create(event.entity.position.x + RandomNum, event.entity.position.y + 3, event.entity.position.z - RandomNum).asBlockPos();

                    var PosArray = [pos1, pos2, pos3, pos4, pos5, pos6, pos7, pos8] as Position3f[];
                    var RandomPos = event.entity.world.random.nextFloat(0, 7);

                    for i in 0 to 10 {

                        var position = PosArray[RandomPos] as Position3f;
                        if (event.entity.world.isAirBlock(position)) {

                            EntitySelected.setPosition(position);
                            event.entityLivingBase.world.spawnEntity(EntitySelected);
                            break;

                        }
                    }
                }
            }

            if (Phase03 >= event.entityLivingBase.health){

                var villager = <entity:srparasites:sim_villager>.createEntity(event.entityLivingBase.world);
                var human = <entity:srparasites:sim_human>.createEntity(event.entityLivingBase.world);
                var spider = <entity:srparasites:sim_bigspider>.createEntity(event.entityLivingBase.world);
                var arachnida = <entity:srparasites:pri_arachnida>.createEntity(event.entityLivingBase.world);
                var ada_arachnida = <entity:srparasites:ada_arachnida>.createEntity(event.entityLivingBase.world);
                var EntityArrayNew = [villager, villager, villager, villager, villager, human, human, human, human, spider, spider, spider, arachnida, arachnida, ada_arachnida] as IEntity[];

                for i in 0 to event.entity.world.random.nextFloat(1, 3) {

                    var RandomEntity = event.entity.world.random.nextFloat(0, 14);
                    var EntitySelected = EntityArrayNew[RandomEntity] as IEntity;
                    var RandomNum = event.entity.world.random.nextFloat(5, 10);


                    var pos1 = Position3f.create(event.entity.position.x, event.entity.position.y + 3, event.entity.position.z - RandomNum).asBlockPos();
                    var pos2 = Position3f.create(event.entity.position.x, event.entity.position.y + 3, event.entity.position.z + RandomNum).asBlockPos();
                    var pos3 = Position3f.create(event.entity.position.x - RandomNum, event.entity.position.y + 3, event.entity.position.z).asBlockPos();
                    var pos4 = Position3f.create(event.entity.position.x + RandomNum, event.entity.position.y + 3, event.entity.position.z).asBlockPos();

                    var pos5 = Position3f.create(event.entity.position.x - RandomNum, event.entity.position.y + 3, event.entity.position.z - RandomNum).asBlockPos();
                    var pos6 = Position3f.create(event.entity.position.x - RandomNum, event.entity.position.y + 3, event.entity.position.z + RandomNum).asBlockPos();
                    var pos7 = Position3f.create(event.entity.position.x + RandomNum, event.entity.position.y + 3, event.entity.position.z + RandomNum).asBlockPos();
                    var pos8 = Position3f.create(event.entity.position.x + RandomNum, event.entity.position.y + 3, event.entity.position.z - RandomNum).asBlockPos();

                    var PosArray = [pos1, pos2, pos3, pos4, pos5, pos6, pos7, pos8] as Position3f[];
                    var RandomPos = event.entity.world.random.nextFloat(0, 7);

                    for i in 0 to 10 {

                        var position = PosArray[RandomPos] as Position3f;
                        if (event.entity.world.isAirBlock(position)) {

                            EntitySelected.setPosition(position);
                            event.entityLivingBase.world.spawnEntity(EntitySelected);
                            break;

                        }
                    }
                }
            }
        }
    }
});



//Function to give chorus fruit & teleportation potions a different effect on use
events.onProjectileImpactThrowable(function(event as ProjectileImpactThrowableEvent){
      if ((event.throwable.getNBT().asString() has "potioncore:teleport") || (event.throwable.getNBT().asString() has "potioncore:strong_teleport")) {
          if (!(event.throwable.getNBT().asString() has "potioncore:teleport_spawn") || !(event.throwable.getNBT().asString() has "potioncore:teleport_surface")) {
              var entityBase as IEntityLivingBase = event.thrower;

              if (!isNull(entityBase)) {
                  if (((entityBase.world.getBiome(event.entity.getPosition3f()).name) == "Abyssal Rift") || ((entityBase.world.getBiome(event.entity.getPosition3f()).name) == "Parasite Biome")){

                      if(isNull(entityBase.nbt.ForgeData.PotionCooldown)){

                          entityBase.setNBT({PotionCooldown: entityBase.world.getWorldTime()});

                      } else {

                          if !(entityBase.world.getWorldTime() > entityBase.nbt.ForgeData.PotionCooldown){return;}

                          var currentTime = entityBase.world.getWorldTime() + 10;
                          entityBase.addPotionEffect(<potion:potioncore:potion_sickness>.makePotionEffect(200, 1));
                          entityBase.addPotionEffect(<potion:potioncore:teleport_surface>.makePotionEffect(10, 0));
                          entityBase.setNBT({PotionCooldown: currentTime});
                          event.cancel();

                      }
                  }
              }
          }
      }
});



//Function to give chorus fruit & teleportation potions a different effect on use
events.onEntityLivingUseItemFinish(function(event as Finish){
      if ((event.item.tag.asString() has "potioncore:teleport") || (event.item.tag.asString() has "potioncore:strong_teleport") || (event.item.definition.id has "minecraft:chorus_fruit")){
          if (!(event.item.tag.asString() has "potioncore:teleport_spawn") || !(event.item.tag.asString() has "potioncore:teleport_surface")) {
              var entityBase as IEntityLivingBase = event.entity;

              if (((entityBase.world.getBiome(event.entity.getPosition3f()).name) == "Abyssal Rift") || ((entityBase.world.getBiome(event.entity.getPosition3f()).name) == "Parasite Biome")){

                  if(isNull(entityBase.nbt.ForgeData.PotionCooldown)){

                      entityBase.setNBT({PotionCooldown: entityBase.world.getWorldTime()});

                  } else {

                      if !(entityBase.world.getWorldTime() > entityBase.nbt.ForgeData.PotionCooldown){return;}

                      var currentTime = entityBase.world.getWorldTime() + 100;
                      entityBase.addPotionEffect(<potion:potioncore:potion_sickness>.makePotionEffect(200, 1));
                      entityBase.addPotionEffect(<potion:potioncore:teleport_surface>.makePotionEffect(10, 0));
                      entityBase.setNBT({PotionCooldown: currentTime});

                  }
              }
          }
      }
});



var beckonarray = [];

// SRParasites in overworld Script Biome Whitelist
events.onEntityLivingUpdate(function(event as EntityLivingUpdateEvent){

    if (event.entity.world.time % 50 != 0) {return;}

    if (!isNull(event.entity.definition)) {

        if (!isNull(event.entity.definition.name)) {

            if ((event.entity.definition.name) has "srparasites") {

                if ((event.entity.world.getDimension()) == 0) || ((event.entity.world.getDimension()) == 3) {


                    var entityBase as IEntityLivingBase = event.entity;
                    var entityName = (event.entity.definition.name);
                    var EntityBiome = (event.entity.world.getBiome(event.entity.getPosition3f()).name);

                    if(Logging){print("EntityBiome = " + EntityBiome);}

                    if (entityName has "beckon") {

                        val minY = 1;
                        val maxY = 255;
                        val minX = event.entity.position.x - 32;
                        val maxX = event.entity.position.x + 32;
                        val minZ = event.entity.position.z - 32;
                        val maxZ = event.entity.position.z + 32;

                        val radius = IAxisAlignedBB.create(minX, minY, minZ, maxX, maxY, maxZ);
                        for i in event.entity.world.getEntitiesWithinAABBExcludingEntity(radius, event.entity) {

                            if (!isNull(i.definition)) {
                                if (!isNull(i.definition.name)) {

                                    var EntityDetected = (i.definition.name);

                                    if EntityDetected has "beckon" {

                                        i.setDead();

                                    }
                                }
                            }
                        }
                    }

                    if ((event.entity.world.getDimension()) == 3) {return;}

                    if (((EntityBiome) == "Steppe") || ((EntityBiome) == "Wasteland") || ((EntityBiome) == "Frozen City Creek") || ((EntityBiome) == "Desert City Creek") || ((EntityBiome) == "Jungle City Creek") || ((EntityBiome) == "Ruins of Blight") || ((EntityBiome) == "Nuclear Ruins") || ((EntityBiome) == "Lair of the Thing") || ((EntityBiome) == "Parasite Biome") || ((EntityBiome) == "Abyssal Rift")){return;}

                    if ((entityName has "beckon") || (entityName has "dispatcher")) {

                        if entityBase.health > 100 {
                            entityBase.health = entityBase.health / 25;
                        } else if ((entityBase.health > 50) && (entityBase.health < 100)) {
                            entityBase.health = entityBase.health / 10;
                        } else if ((entityBase.health > 10) && (entityBase.health < 50)) {
                            entityBase.health = entityBase.health - 10;
                        } else if ((entityBase.health > 1) && (entityBase.health < 10)) {
                            entityBase.health = entityBase.health - 1;
                        } else if (entityBase.health < 1){
                            entityBase.health = entityBase.health - 1;
                        } else {
                            event.entity.setDead();
                        }

                    }


                    if entityBase.health > 1000 {
                        entityBase.health = entityBase.health / 50;
                    } else if ((entityBase.health > 100) && (entityBase.health < 1000)) {
                        entityBase.health = entityBase.health / 10;
                    } else if ((entityBase.health > 10) && (entityBase.health < 100)) {
                        entityBase.health = entityBase.health - 10;
                    } else if ((entityBase.health > 1) && (entityBase.health < 10)) {
                        entityBase.health = entityBase.health - 1;
                    } else if (entityBase.health < 1){
                        entityBase.health = entityBase.health - 1;
                    } else {
                        event.entity.setDead();
                    }


                    entityBase.addPotionEffect(<potion:minecraft:poison>.makePotionEffect(2000, 0));
                    entityBase.addPotionEffect(<potion:srparasites:bleed>.makePotionEffect(2000, 0));
                    entityBase.addPotionEffect(<potion:minecraft:instant_damage>.makePotionEffect(2000, 0));
                }
            }
        }
    }
});


// SRParasites in overworld Cancel Spawns if not in Whitelisted Biome and From spawner
events.onCheckSpawn(function(event as EntityLivingExtendedSpawnEvent){

    if (!isNull(event.spawner)){

        if (event.spawner){

            if (!isNull(event.entity.definition)) {

                if (!isNull(event.entity.definition.name)) {

                    if (((event.entity.definition.name) has "srparasites") && ((event.entity.world.getDimension()) == 0)) {

                        var Biome = (event.entity.world.getBiome(event.entity.getPosition3f()).name);

                        if (((Biome) == "Steppe") || ((Biome) == "Wasteland") || ((Biome) == "Abyssal Rift") || ((Biome) == "Parasite Biome") || ((Biome) == "Lair of the Thing") || ((Biome) == "Nuclear Ruins") || ((Biome) == "Ruins of Blight")) {return;}

                        event.deny();

                    }
                }
            }
        }
    }
});

// SRParasites in overworld Cancel loot if not in Whitelisted Biome
events.onEntityLivingDeathDrops(function(event as EntityLivingDeathDropsEvent){

    if (!isNull(event.entity.definition)) {

        if (!isNull(event.entity.definition.name)) {

            if (!isNull(event.entity.definition.id)) {

                if ((event.entity.definition.id) == "playerbosses:player_boss") {

                    var EntityBiome = event.entity.world.getBiome(event.entity.getPosition3f()).name;

                    if ((EntityBiome) == "Abyssal Rift") {
                        event.cancel(); //Shivaxi drops nothing at this stage
                    }
                }

                if (((event.entity.definition.name) has "srparasites") && ((event.entity.world.getDimension()) == 0)) {

                    if (((event.entity.customName) has "Sentient Horror") || ((event.entity.customName) has "Degrading Overseer") || ((event.entity.customName) has "Malformed Observer") || ((event.entity.customName) has "Shivaxi") || ((event.entity.customName) has "Corrupted Carrier") || ((event.entity.customName) has "Necrotic Blight")) {return;}

                    var EntityBiome = event.entity.world.getBiome(event.entity.getPosition3f()).name;


                    if (((EntityBiome) == "Steppe") || ((EntityBiome) == "Wasteland") || ((EntityBiome) == "Parasite Biome") || ((EntityBiome) == "Abyssal Rift") || ((EntityBiome) == "Ruins of Blight") || ((EntityBiome) == "Nuclear Ruins") || ((EntityBiome) == "Lair of the Thing")) {

                        if(event.drops.length > 0){

                            var drops = event.drops;

                            event.drops = [];

                            for i in drops {

                                if i.item.definition.id has "srparasites" {

                                    //Randomize the chance of the drop, make it drop less because parasites are weaker
                                    //event.addItem(<srparasites:assimilated_flesh>);

                                    var RandomInt = event.entity.world.random.nextFloat(0, 100);
                                    if RandomInt <= 62 { event.addItem(i); } else { event.addItem(<biomesoplenty:ash>); } //Based of healthmultiply 0.5 & damagemultiply 0.25 averaged out on 0.625 the overall strength of parasites in the overworld compared to lost cities parasites.


                                } else {

                                    event.addItem(i);

                                }

                                /*
                                <srparasites:dispatcher_drop>     ->    ?
                                <srparasites:beckon_drop>         ->    ?
                                <srparasites:bone>                ->    ?
                                <contenttweaker:sentient_core>    ->    ?
                                <srparasites:assimilated_flesh>   ->    ?

                                <srparasites:ada_devourer_drop>   ->    ?
                                <srparasites:ada_arachnida_drop>  ->    ?
                                <srparasites:ada_bolster_drop>    ->    ?
                                <srparasites:ada_longarms_drop>   ->    ?
                                <srparasites:ada_reeker_drop>     ->    ?
                                <srparasites:ada_manducater_drop> ->    ?
                                <srparasites:ada_summoner_drop>   ->    ?
                                <srparasites:ada_yelloweye_drop>  ->    ?

                                <srparasites:lurecomponent1>      ->    ?
                                <srparasites:lurecomponent2>      ->    ?
                                <srparasites:lurecomponent3>      ->    ?
                                <srparasites:lurecomponent4>      ->    ?
                                <srparasites:lurecomponent5>      ->    ?
                                <srparasites:lurecomponent6>      ->    ?


                                */

                            }

                            return;

                        }
                    }

                    event.drops = [];
                    event.cancel();
                }
            }
        }
    }
});

//Function containing potion effects for SRP deadblood.
function addPotionEffectDeadBlood(player as IPlayer){

	if (player.activePotionEffects.length == 0) {
    player.addPotionEffect(<potion:potioncore:weight>.makePotionEffect(100, 0));
    player.addPotionEffect(<potion:minecraft:slowness>.makePotionEffect(100, 0));
    player.addPotionEffect(<potion:srparasites:corrosive>.makePotionEffect(100, 0));
	} else {
		for p in player.activePotionEffects {
      if !(p.effectName.matches("potioncore:weight")) {
				player.addPotionEffect(<potion:potioncore:weight>.makePotionEffect(100, 0));
			}
      if !(p.effectName.matches("minecraft:slowness")) {
				player.addPotionEffect(<potion:minecraft:slowness>.makePotionEffect(100, 0));
			}
      if !(p.effectName.matches("srparasites:corrosive")) {
				player.addPotionEffect(<potion:srparasites:corrosive>.makePotionEffect(100, 0));
			}
		}
	}
}

//Function containing potion effects for BOP Blood.
function addPotionEffectBopBlood(player as IPlayer){

	if (player.activePotionEffects.length == 0) {
    player.addPotionEffect(<potion:elenaidodge:sluggish>.makePotionEffect(100, 0));
    player.addPotionEffect(<potion:lycanitesmobs:aphagia>.makePotionEffect(100, 0));
	} else {
		for p in player.activePotionEffects {
       if !(p.effectName.matches("elenaidodge:sluggish")) {
				player.addPotionEffect(<potion:elenaidodge:sluggish>.makePotionEffect(100, 0));
			}
      if !(p.effectName.matches("lycanitesmobs:aphagia")) {
        player.addPotionEffect(<potion:lycanitesmobs:aphagia>.makePotionEffect(100, 0));
      }
		}
	}
}

//Function containing potion effects for BOP Hot Spring Water.
function addPotionEffectHotSpring(player as IPlayer){

	if (player.activePotionEffects.length == 0) {
    player.addPotionEffect(<potion:potioncore:launch>.makePotionEffect(1, 0));
    player.addPotionEffect(<potion:potioncore:explode>.makePotionEffect(1, 0));
    player.addPotionEffect(<potion:minecraft:weakness>.makePotionEffect(100, 1));
    player.addPotionEffect(<potion:simpledifficulty:hyperthermia>.makePotionEffect(100, 2));

	} else {
		for p in player.activePotionEffects {
      if !(p.effectName.matches("potioncore:launch")) {
				player.addPotionEffect(<potion:potioncore:launch>.makePotionEffect(1, 0));
			}
      if !(p.effectName.matches("potioncore:explode")) {
				player.addPotionEffect(<potion:potioncore:explode>.makePotionEffect(1, 0));
			}
      if !(p.effectName.matches("minecraft:weakness")) {
				player.addPotionEffect(<potion:minecraft:weakness>.makePotionEffect(100, 1));
			}
      if !(p.effectName.matches("potion:simpledifficulty:hyperthermia")) {
				player.addPotionEffect(<potion:simpledifficulty:hyperthermia>.makePotionEffect(100, 2));
			}
		}
	}
}

//Listener for player in SRP deadblood / BOP Hot Spring Water / Bauble listener / Teleportation on hit by skeleton with Teleport arrow
events.onPlayerTick(function(event as PlayerTickEvent){

    if (event.player.world.time % 10 != 0) {return;}


    if(isNull(event.player.nbt.ForgeData.SkippedSilverDebuffs)){

        event.player.setNBT({SkippedSilverDebuffs: 0});

    }

    if(isNull(event.player.nbt.ForgeData.SilverSicknessCooldown)){
        event.player.setNBT({SilverSicknessCooldown: event.player.world.getWorldTime()});
    }

    if (!isNull(event.entity.armorInventory[0])) && (!isNull(event.entity.armorInventory[1])) && (!isNull(event.entity.armorInventory[2])) && (!isNull(event.entity.armorInventory[3])) {


        if ((event.entity.armorInventory[0].name == "item.iceandfire.silver_boots") && (event.entity.armorInventory[1].name == "item.iceandfire.silver_leggings") && (event.entity.armorInventory[2].name == "item.iceandfire.silver_chestplate") && (event.entity.armorInventory[3].name == "item.iceandfire.silver_helmet")){


            if ((event.player.isBaubleEquipped(<bountifulbaubles:trinketmixeddragonscale>)) != -1) {return;}

            for p in event.player.activePotionEffects {
                if (p.duration <= 0){
                    event.player.removePotionEffect(p.potion);
                }
            }

            if !(event.player.world.getWorldTime() > event.player.nbt.ForgeData.SilverSicknessCooldown){return;}

            var currentTime = event.player.world.getWorldTime() + event.entity.world.random.nextFloat(1200, 3600);
            var RandomInt = event.entity.world.random.nextFloat(0, 100);
            event.player.setNBT({SilverSicknessCooldown: currentTime});

            if RandomInt <= 15 {

                if (event.player.nbt.ForgeData.SkippedSilverDebuffs == 0) {

                    event.player.addPotionEffect(<potion:potioncore:potion_sickness>.makePotionEffect(200, 0));
                    event.player.setNBT({SkippedSilverDebuffs: 0});

                } else if (event.player.nbt.ForgeData.SkippedSilverDebuffs == 1) {

                    event.player.addPotionEffect(<potion:potioncore:potion_sickness>.makePotionEffect(300, 0));
                    event.player.setNBT({SkippedSilverDebuffs: 0});

                } else if (event.player.nbt.ForgeData.SkippedSilverDebuffs == 2) {

                    event.player.addPotionEffect(<potion:potioncore:potion_sickness>.makePotionEffect(400, 0));
                    event.player.setNBT({SkippedSilverDebuffs: 0});

                } else if (event.player.nbt.ForgeData.SkippedSilverDebuffs == 3) {

                    event.player.addPotionEffect(<potion:potioncore:potion_sickness>.makePotionEffect(500, 0));
                    event.player.setNBT({SkippedSilverDebuffs: 0});

                } else if (event.player.nbt.ForgeData.SkippedSilverDebuffs == 4) {

                    event.player.addPotionEffect(<potion:potioncore:potion_sickness>.makePotionEffect(200, 1));
                    event.player.setNBT({SkippedSilverDebuffs: 0});

                } else if (event.player.nbt.ForgeData.SkippedSilverDebuffs == 5) {

                    event.player.addPotionEffect(<potion:potioncore:potion_sickness>.makePotionEffect(400, 1));
                    event.player.setNBT({SkippedSilverDebuffs: 0});

                } else if (event.player.nbt.ForgeData.SkippedSilverDebuffs == 6) {

                    event.player.addPotionEffect(<potion:potioncore:potion_sickness>.makePotionEffect(400, 2));
                    event.player.setNBT({SkippedSilverDebuffs: 0});

                } else if (event.player.nbt.ForgeData.SkippedSilverDebuffs == 7) {

                    event.player.addPotionEffect(<potion:potioncore:potion_sickness>.makePotionEffect(600, 3));
                    event.player.setNBT({SkippedSilverDebuffs: 0});
                }

            } else if (event.player.nbt.ForgeData.SkippedSilverDebuffs == 7) {

                event.player.addPotionEffect(<potion:potioncore:potion_sickness>.makePotionEffect(900, 3));
                event.player.setNBT({SkippedSilverDebuffs: 0});

            } else {
                var addSkip = event.player.nbt.ForgeData.SkippedSilverDebuffs + 1;
                event.player.setNBT({SkippedSilverDebuffs: addSkip});
            }
        }
    }

    if (event.phase == "START") {

        //removes potion ghost moodals if their duration is 0
        for p in event.player.activePotionEffects {
            if (p.duration <= 0){
                event.player.removePotionEffect(p.potion);
            }
        }

        var position = Position3f.create(event.player.position.x, event.player.position.y, event.player.position.z).asBlockPos();
        var position2 = Position3f.create(event.player.position.x, event.player.position.y + 1, event.player.position.z).asBlockPos();
        var position3 = Position3f.create(event.player.position.x, event.player.position.y + 1.5, event.player.position.z).asBlockPos();
        var position4 = Position3f.create(event.player.position.x, event.player.position.y - 1, event.player.position.z).asBlockPos();

        if((event.player.isInWater) && (event.player.isRiding)) {
            if((event.player.world.getBlockState(position).block.definition.id) == "srparasites:deadblood") {

                var entityRiding = event.player.getRidingEntity();
                event.player.removePassengers();
                event.player.dismountRidingEntity();
            }
        }

        if(((event.player.world.getBlockState(position).block.definition.id) == "srparasites:deadblood") || ((event.player.world.getBlockState(position2).block.definition.id) == "srparasites:deadblood") || ((event.player.world.getBlockState(position3).block.definition.id) == "srparasites:deadblood")) {
            addPotionEffectDeadBlood(event.player);
        }
        else if(((event.player.world.getBlockState(position).block.definition.id) == "biomesoplenty:hot_spring_water") || ((event.player.world.getBlockState(position2).block.definition.id) == "biomesoplenty:hot_spring_water") || ((event.player.world.getBlockState(position3).block.definition.id) == "biomesoplenty:hot_spring_water") || ((event.player.world.getBlockState(position4).block.definition.id) == "biomesoplenty:hot_spring_water")) {
            addPotionEffectHotSpring(event.player);
        }
        else if(((event.player.world.getBlockState(position).block.definition.id) == "biomesoplenty:blood") || ((event.player.world.getBlockState(position2).block.definition.id) == "biomesoplenty:blood") || ((event.player.world.getBlockState(position3).block.definition.id) == "biomesoplenty:blood")) {
            addPotionEffectBopBlood(event.player);
        }
    }
});

// On Theta Barrier Destroyed
events.onBlockHarvestDrops(function(blockDrops as BlockHarvestDropsEvent){
    if ( blockDrops.block has <dimstack:bedrock:7>.asBlock() ){
        blockDrops.drops = [

        <notreepunching:rock/stone>.weight(1.0),
        <notreepunching:rock/stone>.weight(0.5),
        <notreepunching:rock/stone>.weight(0.3),
        <notreepunching:rock/basalt>.weight(0.5),
        <notreepunching:rock/basalt>.weight(0.3),
        <notreepunching:flint_shard>.weight(0.3),
        <notreepunching:flint_shard>.weight(0.3),
        <simpledifficulty:magma_chunk>.weight(0.3),
        <simpledifficulty:magma_chunk>.weight(0.3),
        <rustic:dust_tiny_iron>.weight(0.1),
        <rustic:dust_tiny_iron>.weight(0.1)

        ] as WeightedItemStack[];
    }
});

// On Eta Barrier Destroyed
events.onBlockHarvestDrops(function(blockDrops as BlockHarvestDropsEvent){
    if ( blockDrops.block has <dimstack:bedrock:6>.asBlock() ){
        blockDrops.drops = [

        <notreepunching:rock/stone>.weight(1.0),
        <notreepunching:rock/stone>.weight(0.5),
        <notreepunching:rock/stone>.weight(0.3),
        <notreepunching:rock/basalt>.weight(0.5),
        <notreepunching:rock/basalt>.weight(0.3),
        <biomesoplenty:crystal_shard>.weight(0.3),
        <biomesoplenty:crystal_shard>.weight(0.3),
        <defiledlands:defilement_powder>.weight(0.3),
        <defiledlands:defilement_powder>.weight(0.3),
        <contenttweaker:steel_nugget>.weight(0.1),
        <contenttweaker:steel_nugget>.weight(0.1)

        ] as WeightedItemStack[];
    }
});

//Replace the Biome essence with randomized nbt data for data-less biome essence
events.onBlockHarvestDrops(function(blockDrops as BlockHarvestDropsEvent){
    if ( blockDrops.block has <biomesoplenty:biome_block>.asBlock() ){
        blockDrops.drops = [

        <biomesoplenty:biome_essence>.weight(1.0),

        ] as WeightedItemStack[];
    }
});
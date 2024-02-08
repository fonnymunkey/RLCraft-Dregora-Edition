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

// use /ct syntax to validate scripts

print("Dregora Script starting!");

//Make ice and fire think dried_sand is a sand - does not work
//<ore:sand>.add(<biomesoplenty:dried_sand>);

//Harvesting Tooltips:
<biomesoplenty:plant_1:11>.addTooltip("Harvest with shears.");
<biomesoplenty:double_plant:0>.addTooltip("Harvest with shears.");
<biomesoplenty:plant_1:3>.addTooltip("Harvest with shears.");

//Lower Bamboo Fuel time & add dried leaves as fuel.
furnace.setFuel(<biomesoplenty:bamboo>, 200);
furnace.setFuel(<biomesoplenty:plant_0:0>, 100);

// Aquaculture seaweed dropped from kelp, can be baked to become kelp and kelp can be used as a fuel source to smelt 2 items. (Same-ish as 1.16.5)
furnace.setFuel(<biomesoplenty:seaweed>, 400);
<biomesoplenty:seaweed>.displayName = "Dried Seaweed";
furnace.addRecipe(<biomesoplenty:seaweed>, <aquaculture:food:0>, 99999);
events.onBlockHarvestDrops(function(blockDrops as BlockHarvestDropsEvent){
    if ( blockDrops.block has <biomesoplenty:seaweed>.asBlock() ){
        blockDrops.drops = [<aquaculture:food:0>.weight(1.0)] as WeightedItemStack[];
    }
});

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

//events.onBlockBreak(function(blockBreaks as BlockBreakEvent){
//    if ( blockBreaks.block has <dimstack:bedrock:7>.asBlock() ){
//        Particle effect?
//    }
//});

// Remove BOP non-used and double recipes:
recipes.remove(<biomesoplenty:berries>);
recipes.remove(<biomesoplenty:plant_0:5>);
recipes.remove(<biomesoplenty:gem:6>);
recipes.remove(<biomesoplenty:gem_block:6>);
recipes.remove(<biomesoplenty:terrestrial_artifact>);

//Add New trading system items description & lore

<variedcommodities:coin_gold>.displayName = "Ancient Coins";
<variedcommodities:coin_gold>.addTooltip(format.gold("Treasure among Topographers in Outposts, usually found in ancient structures such as maintenance shafts and cities."));
<variedcommodities:ancient_coin>.displayName = "Brutal Coins";
<variedcommodities:ancient_coin>.addTooltip(format.gold("The rarest of treasures, found in brutal towers surrounded by gray fog and traded for exceptional items with Topographers in Outposts."));
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
<dimstack:bedrock:7>.addTooltip(format.gold("Can be destroyed with an Brutal Artifact equipped in offhand."));

//Give Brutal Artifact it's name:
<variedcommodities:artifact>.displayName = "§4‡ §6§lBrutal Key§r §4‡";
<variedcommodities:artifact>.addTooltip(format.gold("Gain the ability to destroy Theta barrier blocks when equipped in off-hand"));

// Give the Orbs for Lycanites Summons a better name.
<variedcommodities:orb:1>.clearTooltip();
<variedcommodities:orb:5>.clearTooltip();
<variedcommodities:orb:6>.clearTooltip();

<variedcommodities:orb:1>.addTooltip("Demon " + <variedcommodities:orb>.displayName + " (#" + "7277" + "1)");
<variedcommodities:orb:1>.addTooltip(format.darkGray("variedcommodities:orb"));
<variedcommodities:orb:1>.addTooltip(format.green("Through the Orb you can see suffering and fire."));
<variedcommodities:orb:1>.addTooltip(format.gold("Can be obtained through Brutal Merchants in Outposts."));
<variedcommodities:orb:1>.addTooltip(format.blue(format.italic("Varied Commodities")));

<variedcommodities:orb:5>.addTooltip("Aberrant " + <variedcommodities:orb>.displayName + " (#" + "7277" + "5)");
<variedcommodities:orb:5>.addTooltip(format.darkGray("variedcommodities:orb"));
<variedcommodities:orb:5>.addTooltip(format.green("Orbs of unknown, perhaps alien origin."));
<variedcommodities:orb:5>.addTooltip(format.gold("Can be obtained through Brutal Merchants in Outposts."));
<variedcommodities:orb:5>.addTooltip(format.blue(format.italic("Varied Commodities")));

<variedcommodities:orb:6>.addTooltip("Shadow " + <variedcommodities:orb>.displayName + " (#" + "7277" + "6)");
<variedcommodities:orb:6>.addTooltip(format.darkGray("variedcommodities:orb"));
<variedcommodities:orb:6>.addTooltip(format.green("A Dark fog resides within the orb."));
<variedcommodities:orb:6>.addTooltip(format.gold("Can be obtained through Brutal Merchants in Outposts."));
<variedcommodities:orb:6>.addTooltip(format.blue(format.italic("Varied Commodities")));

// Re-add bop Terrestrial Arrifact recipe but with iceandfire sapphire.
recipes.addShaped("dregora20",<biomesoplenty:terrestrial_artifact>,
 [[<biomesoplenty:gem:1>,<biomesoplenty:gem:3>,<biomesoplenty:gem:7>],
  [<biomesoplenty:gem:2>,<biomesoplenty:gem:5>,<iceandfire:sapphire_gem>],
  [<biomesoplenty:gem:4>,<minecraft:emerald>,null]]);

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
 [[<variedcommodities:orb:5>,<quark:biotite>,<variedcommodities:orb:5>],
  [<quark:biotite>,<lycanitesmobs:soulstone_aberration>,<quark:biotite>],
  [<variedcommodities:orb:5>,<quark:biotite>,<variedcommodities:orb:5>]]);

// Re-add Rahovart Summoner
recipes.addShaped("dregora23",<lycanitesmobs:soulcubedemonic>,
 [[<variedcommodities:orb:1>,<variedcommodities:heart>,<variedcommodities:orb:1>],
  [<variedcommodities:heart>,<lycanitesmobs:soulstone_demon>,<variedcommodities:heart>],
  [<variedcommodities:orb:1>,<variedcommodities:heart>,<variedcommodities:orb:1>]]);

//fix BOP error unregistered item:
//recipes.remove(<notreepunching:saw_planks_7>);
//recipes.addShaped("dregora19", <biomesoplenty:planks_0:0> * 4, [[<ore:toolSaw>], [<biomesoplenty:log_0:4>]]);

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

print("Dregora Script ending!");
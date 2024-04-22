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

// use /ct syntax to validate scripts

print("Dregora Script starting!");

//Debug lines true/false
var Logging = false;

// Tell people where to get a biome purifier.
<srparasites:biomepurifier>.addTooltip(format.gold("Obtainable at most Herbalists, rarely found at their overgrown cabin in plains and flower fields."));


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

// Remove Enchantment table & add wither skulls to it:
recipes.remove(<minecraft:enchanting_table>);

// Re-add Enchantment table
recipes.addShaped("dregora24",<minecraft:enchanting_table>,
 [[null,<minecraft:book>,null],
  [<minecraft:diamond>,<minecraft:skull:1>,<minecraft:diamond>],
  [<minecraft:obsidian>,<minecraft:obsidian>,<minecraft:obsidian>]]);

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

// Aquaculture seaweed dropped from kelp, can be baked to become kelp and kelp can be used as a fuel source to smelt 2 items. (Same-ish as 1.16.5)
furnace.setFuel(<biomesoplenty:seaweed>, 400);
<biomesoplenty:seaweed>.displayName = "Dried Seaweed";
furnace.addRecipe(<biomesoplenty:seaweed>, <aquaculture:food:0>, 99999);
events.onBlockHarvestDrops(function(blockDrops as BlockHarvestDropsEvent){
    if ( blockDrops.block has <biomesoplenty:seaweed>.asBlock() ){
        blockDrops.drops = [<aquaculture:food:0>.weight(1.0)] as WeightedItemStack[];
    }
});

//Function to dismount players if hit by vex in biome "Abyssal Rift"
events.onEntityLivingDamage(function(event as EntityLivingDamageEvent){

    if (!isNull(event.damageSource.getTrueSource())){
          if(!isNull(event.damageSource.getTrueSource().getCustomName())){
                if(event.damageSource.getTrueSource().getCustomName() == "Dismounter"){
                    if(event.entity.isRiding) {
                        print(event.entity.id);
                        event.entity.dismountRidingEntity();
                        event.entity.removePassengers();
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

                      if(!isNull(entityBase.nbt.ForgeData.PotionCooldown)){

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

                  if(!isNull(entityBase.nbt.ForgeData.PotionCooldown)){

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



// SRParasites in overworld Script Biome Whitelist
events.onEntityLivingUpdate(function(event as EntityLivingUpdateEvent){

    if (event.entity.world.time % 50 != 0) {return;}

    if (!isNull(event.entity.definition)) {

        if (!isNull(event.entity.definition.name)) {

            if (((event.entity.definition.name) has "srparasites") && ((event.entity.world.getDimension()) == 0)) {

                var entityBase as IEntityLivingBase = event.entity;
                var entityName = (event.entity.definition.name);
                var EntityBiome = (event.entity.world.getBiome(event.entity.getPosition3f()).name);

                if (!((EntityBiome) == "Ruins of Blight") || !((EntityBiome) == "Nuclear Ruins") || !((EntityBiome) == "Lair of the Thing") || !((EntityBiome) == "Abyssal Rift")){

                    if ((entityName has "beckon") || (entityName has "dispatcher")) {

                        if(Logging){print("EntityBiome = " + EntityBiome);}

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
                        } else {

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

                        }

                        entityBase.addPotionEffect(<potion:minecraft:poison>.makePotionEffect(2000, 0));
                        entityBase.addPotionEffect(<potion:srparasites:bleed>.makePotionEffect(2000, 0));
                        entityBase.addPotionEffect(<potion:minecraft:instant_damage>.makePotionEffect(2000, 0));
                    }
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

                          if (!((Biome) == "Abyssal Rift") || !((Biome) == "Parasite Biome") || !((Biome) == "Lair of the Thing") || !((Biome) == "Nuclear Ruins") || !((Biome) == "Ruins of Blight")){

                              event.deny();

                          }
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

            if (((event.entity.definition.name) has "srparasites") && ((event.entity.world.getDimension()) == 0)) {

                var EntityBiome = event.entity.world.getBiome(event.entity.getPosition3f()).name;

                if (!((EntityBiome) == "Ruins of Blight") || !((EntityBiome) == "Nuclear Ruins") || !((EntityBiome) == "Lair of the Thing")) {

                    event.cancel();

                }
            }
        }
    }
});

//Function containing potion effects for SRP deadblood.
function addPotionEffectDeadBlood(player as IPlayer){

	if (player.activePotionEffects.length == 0) {
    player.addPotionEffect(<potion:potioncore:weight>.makePotionEffect(200, 1));
    player.addPotionEffect(<potion:minecraft:slowness>.makePotionEffect(200, 0));
    player.addPotionEffect(<potion:srparasites:corrosive>.makePotionEffect(200, 0));
	} else {
		for p in player.activePotionEffects {
      if !(p.effectName.matches("potioncore:weight")) {
				player.addPotionEffect(<potion:potioncore:weight>.makePotionEffect(200, 1));
			}
      if !(p.effectName.matches("minecraft:slowness")) {
				player.addPotionEffect(<potion:minecraft:slowness>.makePotionEffect(200, 0));
			}
      if !(p.effectName.matches("srparasites:corrosive")) {
				player.addPotionEffect(<potion:srparasites:corrosive>.makePotionEffect(200, 0));
			}
		}
	}
}

//Function containing potion effects for BOP Blood.
function addPotionEffectBopBlood(player as IPlayer){

	if (player.activePotionEffects.length == 0) {
    player.addPotionEffect(<potion:elenaidodge:sluggish>.makePotionEffect(200, 0));
    player.addPotionEffect(<potion:lycanitesmobs:instability>.makePotionEffect(200, 0));
    player.addPotionEffect(<potion:lycanitesmobs:aphagia>.makePotionEffect(200, 0));
	} else {
		for p in player.activePotionEffects {
       if !(p.effectName.matches("elenaidodge:sluggish")) {
				player.addPotionEffect(<potion:elenaidodge:sluggish>.makePotionEffect(200, 0));
			}
      if !(p.effectName.matches("lycanitesmobs:instability")) {
				player.addPotionEffect(<potion:lycanitesmobs:instability>.makePotionEffect(200, 0));
			}
      if !(p.effectName.matches("lycanitesmobs:aphagia")) {
        player.addPotionEffect(<potion:lycanitesmobs:aphagia>.makePotionEffect(200, 0));
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

//Listener for player in SRP deadblood / BOP Hot Spring Water
events.onPlayerTick(function(event as PlayerTickEvent){

    if (event.player.world.time % 10 != 0) {return;}
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

//events.onBlockBreak(function(blockBreaks as BlockBreakEvent){
//    if ( blockBreaks.block has <dimstack:bedrock:7>.asBlock() ){
//        Particle effect?
//    }
//});

// Add description to ancient sets:

<variedcommodities:tuxedo_chest>.addTooltip("Fancy Chestpiece, extremely old yet in near pristine state.");
<variedcommodities:tuxedo_pants>.addTooltip("Fancy Pants, extremely old yet in near pristine state.");
<variedcommodities:tuxedo_bottom>.addTooltip("Aged yet Fancy Trenchcoat, extremely old yet in near pristine state.");

<variedcommodities:soldier_head>.addTooltip("Sturdy Helmet, roughed up through the ages but still in near perfect condition.");
<variedcommodities:soldier_chest>.addTooltip("Sturdy ChestPlate, roughed up through the ages but still in near perfect condition.");
<variedcommodities:soldier_legs>.addTooltip("Sturdy Leggings, roughed up through the ages but still in near perfect condition.");
<variedcommodities:soldier_bottom>.addTooltip("Sturdy Trenchcoat, roughed up through the ages but still in near perfect condition.");

//<variedcommodities:x407_head>.addTooltip("Aged Carbon Lined Helmet, One was near indestructible whilst wearing the complete set, that is until the blight happened.");
//<variedcommodities:x407_chest>.addTooltip("Aged Carbon Lined ChestPlate,, One was near indestructible whilst wearing the complete set, that is until the blight happened.");
//<variedcommodities:x407_legs>.addTooltip("Aged Carbon Lined Leggings, One was near indestructible whilst wearing the complete set, that is until the blight happened.");
//<variedcommodities:x407_boots>.addTooltip("Aged Carbon Lined  Boots, One was near indestructible whilst wearing the complete set., that is until the blight happened.");

<variedcommodities:commissar_head>.addTooltip("Aged decorative Cap, a leather cap lined with fine cloth.");
<variedcommodities:commissar_chest>.addTooltip("Aged decorative Chestpiece, a leather jack, lined with fine cloth complete with decorative elements.");
<variedcommodities:commissar_legs>.addTooltip("Aged decorative Pants, sturdy pants lined with fine cloth.");
<variedcommodities:commissar_bottom>.addTooltip("Aged decorative Trenchcoat, made to last.");

<variedcommodities:infantry_helmet>.addTooltip("Aged Equipment, still provides decent protection.");
<variedcommodities:officer_chest>.addTooltip("Old yet sturdy Chestplate, decorated with various emblems and signs.");
<variedcommodities:tactical_chest>.addTooltip("Aged Equipment, still provides decent protection.");
<variedcommodities:tactical_head>.addTooltip("Aged Equipment, still provides decent protection.");

<variedcommodities:nanorum_head>.addTooltip("Aged Helmet, made of advanced alloys. Provides excellent protection.");
<variedcommodities:nanorum_chest>.addTooltip("Aged Chestplate, made of advanced alloys. Provides excellent protection.");
<variedcommodities:nanorum_legs>.addTooltip("Aged Legs, made of advanced alloys. Provides excellent protection.");
<variedcommodities:nanorum_boots>.addTooltip("Aged Boots, made of advanced alloys. Provides excellent protection.");

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

<contenttweaker:blood_tear>.addTooltip(format.yellow("Remnants of Dreadnauts and Overlords"));
<biomesoplenty:mushroom:3>.displayName = "Gleamshroom";
<biomesoplenty:terrarium:8>.displayName = "Gleamshroom Terrarium";

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
<variedcommodities:element_fire>.clearTooltip();
<variedcommodities:element_fire>.addTooltip("Auric Essence (#7295)");
<variedcommodities:element_fire>.addTooltip(format.darkGray("variedcommodities:element_fire"));
<variedcommodities:element_fire>.addTooltip(format.green("Essence abstracted from the purest of gold."));
<variedcommodities:element_fire>.addTooltip(format.gold("Can be obtained through Brutal Merchants in Outposts."));

// Give The Ruby Gem a better name
<variedcommodities:gem_ruby>.clearTooltip();
<variedcommodities:gem_ruby>.addTooltip("Blood Gem (#7279)");
<variedcommodities:gem_ruby>.addTooltip(format.darkGray("variedcommodities:gem_ruby"));
<variedcommodities:gem_ruby>.addTooltip(format.green("This gem, magical to those who not know it's secrets feels heavy and somehow alive..."));
<variedcommodities:gem_ruby>.addTooltip(format.gold("Extracted from Amalgalich remains."));

// Give the Orb for Eta barrier a better name.
<variedcommodities:orb:0>.clearTooltip();
<variedcommodities:orb:0>.addTooltip("Brutal " + <variedcommodities:orb>.displayName + " (#" + "7304" + "/0)");
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


// Give the Orbs for Lycanites Summons a better name.
<variedcommodities:orb:1>.clearTooltip();
<variedcommodities:orb:5>.clearTooltip();
<variedcommodities:orb:6>.clearTooltip();

<variedcommodities:orb:1>.addTooltip("Demon " + <variedcommodities:orb>.displayName + " (#" + "7277" + "/1)");
<variedcommodities:orb:1>.addTooltip(format.darkGray("variedcommodities:orb"));
<variedcommodities:orb:1>.addTooltip(format.green("Through the Orb you can see suffering and fire."));
<variedcommodities:orb:1>.addTooltip(format.gold("Can be obtained through Brutal Merchants in Outposts."));

<variedcommodities:orb:5>.addTooltip("Aberrant " + <variedcommodities:orb>.displayName + " (#" + "7277" + "/5)");
<variedcommodities:orb:5>.addTooltip(format.darkGray("variedcommodities:orb"));
<variedcommodities:orb:5>.addTooltip(format.green("Orbs of unknown, perhaps alien origin."));
<variedcommodities:orb:5>.addTooltip(format.gold("Can be obtained through Brutal Merchants in Outposts."));

<variedcommodities:orb:6>.addTooltip("Shadow " + <variedcommodities:orb>.displayName + " (#" + "7277" + "/6)");
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

print("Dregora Script ending!");
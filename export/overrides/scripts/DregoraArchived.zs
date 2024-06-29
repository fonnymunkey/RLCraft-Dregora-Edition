//import loottweaker.LootTweaker;
//import loottweaker.vanilla.loot.LootTable;
//import loottweaker.vanilla.loot.LootPool;
//import loottweaker.vanilla.loot.Conditions;
//import loottweaker.vanilla.loot.Functions;

//val fmbFishingTable = LootTweaker.getTable("fishingmadebetter:fishing_combined");
//val rlcraftFishingRoulette = fmbFishingTable.addPool("rlcraftfishingroulette", 1, 1, 0, 0);
//
//rlcraftFishingRoulette.addItemEntry(
//    <minecraft:spawn_egg>, 100, 0,
//    [
//        // Makes item unbreakable via NBT
//        Functions.setNBT({EntityTag:{id:"minecraft:skeleton"}})
//    ],
//    [] // Arbitrary value for example purposes
//);


//=================================
//DREGORARL DISCARDED SCRIPTS AND EVENTS, FOR REFERENCE & FUTURE USE
//=================================

// Add location identifier to entities spawned from spawner
// Check if spawner has spawnpotential enabled
// Check if entity spawned is from spawnpotential
// Give entity spawner location tag
// if entity dies check spawner location tag
// set spawner at location tag to NBT: {ForgeCaps{spawnercontrol:controllable_spawner_cap{SpawnedMobsCount:+1}}}



//events.onCheckSpawn(function(event as EntityLivingExtendedSpawnEvent){
//    if (!isNull(event.spawner)){
//         if (event.spawner){
//              if !event.entity.world.isRemote(){
//                  if (!isNull(event.spawner.nbtData.SpawnPotentials)) {
//                      if (event.spawner.nbtData.SpawnPotentials.length > 1) {
//
//                          var entityBase as IEntityLivingBase = event.entity;
//                          var entityDim = event.entity.getDimension();
//                          var spawnerPosX = event.spawner.blockPos.x;
//                          var spawnerPosY = event.spawner.blockPos.y;
//                          var spawnerPosZ = event.spawner.blockPos.z;
//
//                          entityBase.setNBT({dregora_spawnerpos:{dimension:entityDim}});
//                          entityBase.setNBT({dregora_spawnerpos:{posX:spawnerPosX}});
//                          entityBase.setNBT({dregora_spawnerpos:{posY:spawnerPosY}});
//                          entityBase.setNBT({dregora_spawnerpos:{posZ:spawnerPosZ}});
//
//                          // This is a Spawner with multiple spawn potentials
//                          // ignore the first spawn
//
//
//                      }
//                  }
//              }
//         }
//    }
//});
//
//
//events.onEntityLivingDeath(function(event as EntityLivingDeathEvent){
//
//    if (!isNull(event.entity.nbt.ForgeData.dregora_spawnerpos)) {
//
//        var entityDim = event.entity.nbt.ForgeData.dregora_spawnerpos.dimension;
//        var spawnerPosX = event.entity.nbt.ForgeData.dregora_spawnerpos.posX;
//        var spawnerPosY = event.entity.nbt.ForgeData.dregora_spawnerpos.posY;
//        var spawnerPosZ = event.entity.nbt.ForgeData.dregora_spawnerpos.posZ;
//        var spawner = event.entity.world.getBlock(spawnerPosX,spawnerPosY,spawnerPosZ);
//        var spawnercount as IData = spawner.data.memberGet("ForgeCaps").memberGet("spawnercontrol:controllable_spawner_cap").memberGet("SpawnedMobsCount");
//        //var newcount = spawner.data.ForgeCaps.spawnercontrol.controllable_spawner_cap.SpawnedMobsCount + 1 as int;
//
//        //print("BlockPos = " + spawnerPosX + "," + spawnerPosY + "," + spawnerPosZ);
//
//        print("current spawncount: " + spawnercount);
//        //spawner.data.ForgeCaps.spawnercontrol.controllable_spawner_cap.SpawnedMobsCount = newcount;
//        //var spawnercount = spawner.data.ForgeCaps.spawnercontrol.controllable_spawner_cap.SpawnedMobsCount;
//        print("new spawncount: " + spawnercount);
//
//    }
//});

//function teleportPlayer(player as IPlayer,posX as int,posY as int,posZ as int){
//
//    print("works");
//    var TpTest = crafttweaker.util.Position3f.create(0, 200, 0);
//    player.teleport(TpTest);
//    player.setPosition(TpTest);
//    player.executeCommand("teleport " + player.name + " 0 200 0");
//
//}

//if (event.damageSource.getTrueSource().heldEquipment[1].name == "item.ArrowEnderperle") {
//
//    if (event.damageSource.getTrueSource().heldEquipment[0].name has "bow") {
//
//        var shooter = event.damageSource.trueSource as IEntity;
//        var shooterPos = event.damageSource.getTrueSource().position;
//        var sPosX = shooterPos.x;
//        var sPosY = shooterPos.y;
//        var sPosZ = shooterPos.z;
//
//
//        if(event.entity instanceof IPlayer) {
//
//
//            var player as IPlayer = event.entity;
//            var playerPos = player.position;
//            //event.entity.setNBT({TeleportPosX: sPosX});
//            //event.entity.setNBT({TeleportPosY: sPosY});
//            //event.entity.setNBT({TeleportPosZ: sPosZ});
//
//            shooter.setPosition(playerPos);
//            //victim.setPosition(shooterPos);
//
//            teleportPlayer(player, sPosX, sPosY, sPosZ);
//
//            //event.entity.setNBT({TeleportPos: 1});
//
//        } else {
//
//            var victim as IEntityLivingBase = event.entityLivingBase;
//            var victimPos = victim.position;
//
//            victim.setPosition(shooterPos);
//            shooter.setPosition(victimPos);
//
//        }
//        //summon minecraft:skeleton ~ ~1 ~ {HandItems:[{id:"minecraft:bow",Count:1},{id:"switchbow:arrowenderperle",Count:1}]}
//    }
//
//}

//Listener for player in SRP deadblood / BOP Hot Spring Water / Bauble listener / Teleportation on hit by skeleton with Teleport arrow
//events.onPlayerTick(function(event as PlayerTickEvent){
//
//
//    //if (event.player.world.time % 10 != 0) {return;}
//
//    //var TpTest = crafttweaker.util.Position3f.create(0, 200, 0);
//    //event.player.teleport(TpTest);
//
//    if (event.side == "SERVER") {
//        if (isNull(event.player.nbt.ForgeData.TeleportPos)) {return;}
//        //if (event.player.nbt.ForgeData.TeleportPos != "1") {return;}
//
//
//        var TpTest = crafttweaker.util.Position3f.create(0, 200, 0);
//        event.player.teleport(TpTest);
//
//        print("TeleportPos == 1");
//        //event.player.setNBT({TeleportPos: 0});
//
//        //summon minecraft:skeleton ~ ~1 ~ {HandItems:[{id:"minecraft:bow",Count:1},{id:"switchbow:arrowenderperle",Count:1}]}
//    }
//
//});

//Listener for player in SRP deadblood / BOP Hot Spring Water / Bauble listener / Teleportation on hit by skeleton with Teleport arrow
//events.onPlayerTick(function(event as PlayerTickEvent){
//
//    if (event.player.world.time % 10 != 0) {return;}
//
//    var TpTest = crafttweaker.util.Position3f.create(0, 200, 0);
//    event.player.teleport(TpTest);
//
//    if(isNull(event.player.nbt.ForgeData.TeleportPos)){
//
//        event.player.setNBT({TeleportPos: 0});
//        return;
//
//    }
//
//    if (event.player.nbt.ForgeData.TeleportPos != "1") {return;}
//
//    var TpPosX = event.player.nbt.ForgeData.TeleportPosX;
//    var TpPosY = event.player.nbt.ForgeData.TeleportPosY;
//    var TpPosZ = event.player.nbt.ForgeData.TeleportPosZ;
//    var TpTo = crafttweaker.util.Position3f.create(TpPosX, TpPosY, TpPosZ);
//
//    var TpTest = crafttweaker.util.Position3f.create(0, 200, 0);
//    print("TeleportPos == 1");
//
//    event.player.teleport(TpTest);
//    event.player.setNBT({TeleportPos: 0});
//
//    //summon minecraft:skeleton ~ ~1 ~ {HandItems:[{id:"minecraft:bow",Count:1},{id:"switchbow:arrowenderperle",Count:1}]}
//
//});

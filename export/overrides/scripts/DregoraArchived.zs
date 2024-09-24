//import loottweaker.LootTweaker;
//import loottweaker.vanilla.loot.LootTable;
//import loottweaker.vanilla.loot.LootPool;
//import loottweaker.vanilla.loot.Conditions;
//import loottweaker.vanilla.loot.Functions;

//=================================
//DREGORARL DISCARDED SCRIPTS AND EVENTS, FOR REFERENCE & FUTURE USE
//=================================

/*

// Villager to Mental/Sussyberian conversion
if ((event.entity.definition.id) == "minecraft:villager") {

    print(event.entity.nbt.ProfessionName);

    if (event.entity.nbt.ProfessionName == "minecraft:librarian") {

        var randomNum = event.entity.world.random.nextFloat(0, 100);

        if (randomNum <= 100) {

            var randomNum = event.entity.world.random.nextFloat(0, 100);

            if (randomNum <= 50) {

                event.entity.setCustomName("Sussyberian");

            } else {

                event.entity.setCustomName("Mentalberian");

            }
        }
    }
}

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


val fmbFishingTable = LootTweaker.getTable("fishingmadebetter:fishing_combined");
val rlcraftFishingRoulette = fmbFishingTable.addPool("rlcraftfishingroulette", 1, 1, 0, 0);

rlcraftFishingRoulette.addItemEntry(
    <minecraft:spawn_egg>, 100, 0,
    [
        // Makes item unbreakable via NBT
        Functions.setNBT({EntityTag:{id:"minecraft:skeleton"}})
    ],
    [] // Arbitrary value for example purposes
);

// Add location identifier to entities spawned from spawner
 Check if spawner has spawnpotential enabled
 Check if entity spawned is from spawnpotential
 Give entity spawner location tag
 if entity dies check spawner location tag
 set spawner at location tag to NBT: {ForgeCaps{spawnercontrol:controllable_spawner_cap{SpawnedMobsCount:+1}}}



events.onCheckSpawn(function(event as EntityLivingExtendedSpawnEvent){
    if (!isNull(event.spawner)){
         if (event.spawner){
              if !event.entity.world.isRemote(){
                  if (!isNull(event.spawner.nbtData.SpawnPotentials)) {
                      if (event.spawner.nbtData.SpawnPotentials.length > 1) {

                          var entityBase as IEntityLivingBase = event.entity;
                          var entityDim = event.entity.getDimension();
                          var spawnerPosX = event.spawner.blockPos.x;
                          var spawnerPosY = event.spawner.blockPos.y;
                          var spawnerPosZ = event.spawner.blockPos.z;

                          entityBase.setNBT({dregora_spawnerpos:{dimension:entityDim}});
                          entityBase.setNBT({dregora_spawnerpos:{posX:spawnerPosX}});
                          entityBase.setNBT({dregora_spawnerpos:{posY:spawnerPosY}});
                          entityBase.setNBT({dregora_spawnerpos:{posZ:spawnerPosZ}});

                          // This is a Spawner with multiple spawn potentials
                          // ignore the first spawn


                      }
                  }
              }
         }
    }
});


events.onEntityLivingDeath(function(event as EntityLivingDeathEvent){

    if (!isNull(event.entity.nbt.ForgeData.dregora_spawnerpos)) {

        var entityDim = event.entity.nbt.ForgeData.dregora_spawnerpos.dimension;
        var spawnerPosX = event.entity.nbt.ForgeData.dregora_spawnerpos.posX;
        var spawnerPosY = event.entity.nbt.ForgeData.dregora_spawnerpos.posY;
        var spawnerPosZ = event.entity.nbt.ForgeData.dregora_spawnerpos.posZ;
        var spawner = event.entity.world.getBlock(spawnerPosX,spawnerPosY,spawnerPosZ);
        var spawnercount as IData = spawner.data.memberGet("ForgeCaps").memberGet("spawnercontrol:controllable_spawner_cap").memberGet("SpawnedMobsCount");
        //var newcount = spawner.data.ForgeCaps.spawnercontrol.controllable_spawner_cap.SpawnedMobsCount + 1 as int;

        //print("BlockPos = " + spawnerPosX + "," + spawnerPosY + "," + spawnerPosZ);

        print("current spawncount: " + spawnercount);
        //spawner.data.ForgeCaps.spawnercontrol.controllable_spawner_cap.SpawnedMobsCount = newcount;
        //var spawnercount = spawner.data.ForgeCaps.spawnercontrol.controllable_spawner_cap.SpawnedMobsCount;
        print("new spawncount: " + spawnercount);

    }
});

function teleportPlayer(player as IPlayer,posX as int,posY as int,posZ as int){

    print("works");
    var TpTest = crafttweaker.util.Position3f.create(0, 200, 0);
    player.teleport(TpTest);
    player.setPosition(TpTest);
    player.executeCommand("teleport " + player.name + " 0 200 0");

}

if (event.damageSource.getTrueSource().heldEquipment[1].name == "item.ArrowEnderperle") {

    if (event.damageSource.getTrueSource().heldEquipment[0].name has "bow") {

        var shooter = event.damageSource.trueSource as IEntity;
        var shooterPos = event.damageSource.getTrueSource().position;
        var sPosX = shooterPos.x;
        var sPosY = shooterPos.y;
        var sPosZ = shooterPos.z;


        if(event.entity instanceof IPlayer) {


            var player as IPlayer = event.entity;
            var playerPos = player.position;
            //event.entity.setNBT({TeleportPosX: sPosX});
            //event.entity.setNBT({TeleportPosY: sPosY});
            //event.entity.setNBT({TeleportPosZ: sPosZ});

            shooter.setPosition(playerPos);
            //victim.setPosition(shooterPos);

            teleportPlayer(player, sPosX, sPosY, sPosZ);

            //event.entity.setNBT({TeleportPos: 1});

        } else {

            var victim as IEntityLivingBase = event.entityLivingBase;
            var victimPos = victim.position;

            victim.setPosition(shooterPos);
            shooter.setPosition(victimPos);

        }
        //summon minecraft:skeleton ~ ~1 ~ {HandItems:[{id:"minecraft:bow",Count:1},{id:"switchbow:arrowenderperle",Count:1}]}
    }

}

//Listener for player in SRP deadblood / BOP Hot Spring Water / Bauble listener / Teleportation on hit by skeleton with Teleport arrow
events.onPlayerTick(function(event as PlayerTickEvent){


    //if (event.player.world.time % 10 != 0) {return;}

    //var TpTest = crafttweaker.util.Position3f.create(0, 200, 0);
    //event.player.teleport(TpTest);

    if (event.side == "SERVER") {
        if (isNull(event.player.nbt.ForgeData.TeleportPos)) {return;}
        //if (event.player.nbt.ForgeData.TeleportPos != "1") {return;}


        var TpTest = crafttweaker.util.Position3f.create(0, 200, 0);
        event.player.teleport(TpTest);

        print("TeleportPos == 1");
        //event.player.setNBT({TeleportPos: 0});

        //summon minecraft:skeleton ~ ~1 ~ {HandItems:[{id:"minecraft:bow",Count:1},{id:"switchbow:arrowenderperle",Count:1}]}
    }

});

//Listener for player in SRP deadblood / BOP Hot Spring Water / Bauble listener / Teleportation on hit by skeleton with Teleport arrow
events.onPlayerTick(function(event as PlayerTickEvent){

    if (event.player.world.time % 10 != 0) {return;}

    var TpTest = crafttweaker.util.Position3f.create(0, 200, 0);
    event.player.teleport(TpTest);

    if(isNull(event.player.nbt.ForgeData.TeleportPos)){

        event.player.setNBT({TeleportPos: 0});
        return;

    }

    if (event.player.nbt.ForgeData.TeleportPos != "1") {return;}

    var TpPosX = event.player.nbt.ForgeData.TeleportPosX;
    var TpPosY = event.player.nbt.ForgeData.TeleportPosY;
    var TpPosZ = event.player.nbt.ForgeData.TeleportPosZ;
    var TpTo = crafttweaker.util.Position3f.create(TpPosX, TpPosY, TpPosZ);

    var TpTest = crafttweaker.util.Position3f.create(0, 200, 0);
    print("TeleportPos == 1");

    event.player.teleport(TpTest);
    event.player.setNBT({TeleportPos: 0});

    //summon minecraft:skeleton ~ ~1 ~ {HandItems:[{id:"minecraft:bow",Count:1},{id:"switchbow:arrowenderperle",Count:1}]}

});

// Entities spawned with bow have a 5% chance to randomly get a tipped arrow in offhand slot
events.onEntityLivingUpdate(function(event as EntityLivingUpdateEvent){
    if event.entity.world.isRemote() {return;}
    if (isNull(event.entity)) {return;}
    if (isNull(event.entity.definition)) {return;}
    if (isNull(event.entity.definition.id)) {return;}
    if (event.entity.definition.id == "playerbosses:player_boss") {return;}
    if ((event.entity.definition.id == "minecraft:wither_skeleton") || (event.entity.definition.id == "minecraft:skeleton")) {

        if(isNull(event.entity.nbt.ForgeData.ArrowCheck)) {event.entity.setNBT({ArrowCheck: 0}); return;}

        if (event.entity.nbt.ForgeData.ArrowCheck != 1) {
            event.entity.setNBT({ArrowCheck: 1});
            var entityBase as IEntityLivingBase = event.entity;

            if

            if ((entityBase.offHandHeldItem.name) has "tipped_arrow") { event.entity.setNBT({NoArrowSwitch: 1}); return}

            if (entityBase.mainHandHeldItem.name has "bow") {
                var randomInt = entityBase.world.random.nextFloat(0, 100);
                if (randomInt <= 5) {
                    var randomArrow = entityBase.world.random.nextFloat(0, 90);
                    var selectedArrow = ArrowArray[randomArrow];
                    entityBase.setItemToSlot(crafttweaker.entity.IEntityEquipmentSlot.offhand(), selectedArrow);
                    event.entity.setNBT({ArrowEntity: 1});
                }
            }
        }
    }
});

//Shivaxi turns into corrupted dragon
events.onEntityLivingDeath(function(event as EntityLivingDeathEvent){

    if (!isNull(event.entity.definition)) {

        if (!isNull(event.entity.definition.name)) {

            if (!isNull(event.entity.definition.id)) {

                if (!isNull(event.entity.customName)) {

                    if (((event.entity.definition.id) has "playerbosses:player_boss") && ((event.entity.world.getDimension()) == 0) && ((event.entity.customName) has "Shivaxi")) {

                        var EntityBiome = event.entity.world.getBiome(event.entity.getPosition3f()).name;

                        if ((EntityBiome) == "Abyssal Rift") {

                            if event.entity.world.isRemote(){

                                var double_x = event.entity.position.x;
                                var double_y = event.entity.position.y;
                                var double_z = event.entity.position.z;

                                event.entity.world.performExplosion(event.entity, double_x, double_y, double_z, 4, false, false);
                                var shivaxi = <entity:srparasites:sim_dragone>.createEntity(event.entityLivingBase.world);
                                shivaxi.setPosition(event.entity.position);
                                shivaxi.updateNBT({CustomName: "§6☢ §4§lBlighted Boomer§r §6☢"});
                                shivaxi.updateNBT({PersistenceRequired:1});
                                shivaxi.updateNBT({parasitedespawn:0});
                                shivaxi.updateNBT({ForgeCaps:{"champions:championship":{tier:1}}});
                                shivaxi.updateNBT({DeathLootTable: "dregora:entities/playerbosses/abyssal_tower_shivaxi"});
                                event.entityLivingBase.world.spawnEntity(shivaxi);

                            }
                        }
                    }
                }
            }
        }
    }
});


Random chance to rename developers:

Make interactive points for engagement and attention

###################### Display names:
Kotlin = Not Kotlin
Shivaxi = §mOld§r Man
Fonny = OnlyFons
Rayquazafallout = Reaper King
Meldexun  =
Eagle = Self Proclaimed Idiot
Heaven = The Sacrifice
Artsy =

Randomly change any names to Trollvolution Members (except fonny & shivaxi)


Kotlin:
- "fun haveFun() {fun haveMoreFun() {haveFun()}haveMoreFun()}" (do huge ass explosion near fonny)
- randomly drops clue's & hints that led to the original 1000 dollar price
- ""

Shivaxi:
- "I'm §l§4NOT§r a ice dragon! you §kstupid idiot"
- ""
- randomly drops a cheese burrito which gives you the soiled effect
- when Shivaxi picks up a consumable: "That is no cheese-it!"
- When Shivaxi milks a cow: "give the moo potion"
- When Shivaxi finds vinyl in a chest says "Vinyl!"

Fonny:
- "I fixed that bug where your username wouldn't display accurately Shiv" + then do old man
- "I have my coffee, my coding projects, my onlyfons to pay the bills and a old man to take care of."
- "Randomly gives twitch prime tokens and lootbags to developers"
- "I enabled twitch chat commands but then for the people active in the server." (After a fart sound plays over Shivaxi's audio)

Rayquazafallout:
- "Shivaxi can't be a Lightning dragon can he?"
- "By the beard of a gigantopithecus!"

Meldexun:
- "What is the Trollvolution!?"
- "Shivaxi are you a Ice Dragon?"

Eagle
- "I am definitely not kotlin!"
- "Ahhh NOoOoOo not the bears! ☹☹☹☹"

Heaven:
- "Shivaxi are you a Ice Dragon?"

Artsy:
- "Shivaxi are you the Fire Dragon?"




*/
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
import crafttweaker.event.EntityLivingAttackedEvent;
import crafttweaker.damage.IDamageSource;
import crafttweaker.event.PlayerInteractEntityEvent;
import crafttweaker.util.Math;
import crafttweaker.event.PlayerCraftedEvent;
import crafttweaker.item.IItemTransformer;
import crafttweaker.world.IRayTraceResult;
import crafttweaker.event.EntityMountEvent;
import crafttweaker.event.PlayerSleepInBedEvent;
import mods.ctutils.world.World;
import crafttweaker.event.PlayerInteractBlockEvent;
import crafttweaker.event.LivingExperienceDropEvent;
import crafttweaker.event.EntityJoinWorldEvent;
import crafttweaker.entity.AttributeModifier;
import crafttweaker.entity.Attribute;


// use /ct syntax to validate scripts

print("Dregora Script starting!");

//Debug lines true/false

var Logging = false;

//DMG and health multiplier script for spawning entities
events.onEntityJoinWorld(function(event as EntityJoinWorldEvent){

    if event.entity.world.isRemote() {return;}

    if (event.entity instanceof IEntityLivingBase) {

        var EntityBase as IEntityLivingBase = event.entity;
        //overworld

        if (event.world.dimension == 0) {

            // Increase Health for mod_lavacow entities

            if (isNull(EntityBase)) {return;}
            if (isNull(EntityBase.definition)) {return;}
            if (isNull(EntityBase.definition.id)) {return;}

            if (EntityBase.definition.id has "mod_lavacow") {

                EntityBase.getAttribute("generic.maxHealth").applyModifier(AttributeModifier.createModifier("DregoraHealth", 0.5, 1));
                //EntityBase.health = EntityBase.health * 1.5;
            }

            // Lower health of parasites in cities
            if (EntityBase.definition.id has "srparasites") {

                var BiomeName = event.world.getBiome(EntityBase.getPosition3f()).name;
                for Biome in ParasiteBuffBiomes {

                    if (BiomeName == Biome) {

                        //HealthMultiply 0.5
                        EntityBase.getAttribute("generic.maxHealth").applyModifier(AttributeModifier.createModifier("DregoraHealth", -0.5, 1));
                        //EntityBase.health = EntityBase.health * 0.5;

                    }
                }
            }
        }
    }
});

events.onEntityLivingDamage(function(event as EntityLivingDamageEvent){

    if event.entity.world.isRemote() {return;}

    if (isNull(event.damageSource.trueSource)) {return;}
    if (isNull(event.damageSource.trueSource.definition)) {return;}
    if (isNull(event.damageSource.trueSource.definition.id)) {return;}

    // nerf succors
    if ((event.damageSource.trueSource.definition.id) == "srparasites:succor") {

        //DMGmultiply 0.03
        event.amount = event.amount / 0.03;

    }

    if event.damageSource.trueSource.world.dimension == 0 {

        // Lower health of parasites in cities
        var BiomeName = event.damageSource.trueSource.world.getBiome(event.entity.getPosition3f()).name;
        for Biome in ParasiteBuffBiomes {
            if (BiomeName == Biome) {
                if !(event.damageSource.trueSource.definition.id == "srparasites:succor") && (event.damageSource.trueSource.definition.id has "srparasites") {

                    //DMGMultiply 0.25
                    event.amount = event.amount / 0.25;
                }
            }
        }
    }

});

// Berries nerf
events.onEntityLivingUseItemFinish(function(event as Finish){

    if (event.item.definition.id == "biomesoplenty:berries") {

        var randomDuration = event.player.world.random.nextFloat(60, 200);
        var randomAmp = event.player.world.random.nextFloat(0, 3);
        var randomNum = event.player.world.random.nextFloat(0, 100);

        if (randomNum >= 10 ) { return; }

        event.player.addPotionEffect(<potion:minecraft:nausea>.makePotionEffect(randomDuration, randomAmp));

        if (randomNum >= 7 ) { return; }

        event.player.addPotionEffect(<potion:lycanitesmobs:aphagia>.makePotionEffect(randomDuration, randomAmp));

        if (randomNum >= 5 ) { return; }

        event.player.addPotionEffect(<potion:simpledifficulty:parasites>.makePotionEffect(randomDuration, randomAmp));

        if (randomNum >= 3 ) { return; }

        event.player.addPotionEffect(<potion:mod_lavacow:soiled>.makePotionEffect(randomDuration, randomAmp));

        if (randomNum >= 1 ) { return; }

        event.player.addPotionEffect(<potion:potioncore:vulnerable>.makePotionEffect(randomDuration, randomAmp));

    }

});

//Global damage modifier
events.onEntityLivingDamage(function(event as EntityLivingDamageEvent){

    if (!isNull(event.damageSource.damageType)) {

        if (event.damageSource.damageType) == "player" {

            if (event.amount >= 20) {

                if (event.amount <= 50) {

                    var new_amount = (event.amount / 1.15);
                    event.amount = new_amount;

                } else if (event.amount <= 100) {

                    var new_amount = (event.amount / 1.6);
                    event.amount = new_amount;

                } else if (event.amount <= 200) {

                    var new_amount = (event.amount / 2.0);
                    event.amount = new_amount;

                } else if (event.amount <= 300) {

                    var new_amount = (event.amount / 2.25);
                    event.amount = new_amount;

                } else {

                    var new_amount = (event.amount / 3.0);
                    event.amount = new_amount;

                }
            }

            if (!isNull(event.entity.uuid)) {return; print("isPlayer");}

            print(event.entity.definition.id);

            if (isNull(event.entity.definition.id)) {return;}

            if (isNull(event.damageSource.trueSource.heldEquipment[0])) {return;}

            // If player hits entity with a weapon that has been disarmed it has a chance to reflect dmg

            if (isNull(event.damageSource.trueSource.heldEquipment[0])) {return;}
            if (isNull(event.damageSource.trueSource.heldEquipment[0].tag)) {return;}
            if (isNull(event.damageSource.trueSource.heldEquipment[0].tag.disarm)) {return;}


            var randomNum = event.damageSource.trueSource.world.random.nextFloat(0, 100);

            if (randomNum >= 5 ) { return; }

            if event.amount > event.entityLivingBase.health {

                event.damageSource.trueSource.attackEntityFrom(MAGIC, event.entityLivingBase.health * 0.9 );
                event.cancel();

            } else {

                event.damageSource.trueSource.attackEntityFrom(MAGIC, event.amount );
                event.cancel();
            }
        }
    }
});

// Right clicking the crown in any biome that has the SANDY but not BEACH biometag
// Does not account for SANDY being first in the /
events.onPlayerRightClickItem(function(event as PlayerRightClickItemEvent){

    if event.player.world.isRemote() {return;}

    if (event.player.world.getBiome(event.player.getPosition3f()).name == "Abyssal Rift") {
        if ((event.item.definition.id == "minecraft:potion") || (event.item.definition.id == "minecraft:splash_potion") || (event.item.definition.id == "minecraft:lingering_potion")) {
            if (!isNull(event.item.tag.Potion)) {
                if ((event.item.tag.Potion == "potioncore:flight") || (event.item.tag.Potion == "potioncore:long_flight")) {
                    if (event.player.y <= 70) {

                        event.player.dropItem(true);
                        event.player.sendStatusMessage("You sense a mysterious force from below coming up at you as it yanks the potion from your hands", true);
                        event.cancel();
                    }
                }
            }
        } else if ((event.item.definition.id == "bountifulbaubles:magicmirror") || (event.item.definition.id == "bountifulbaubles:wormholemirror")) {
            if (event.player.y <= 70) {

                event.player.sendStatusMessage("You sense a mysterious force from below coming up at you as it yanks the mirror from your hands", true);
                event.player.dropItem(true);
                event.cancel();
            }
        }
    }

    if (isNull(event.item)) { return; }
    if (isNull(event.item.definition)) { return; }
    if (isNull(event.item.definition.id)) { return; }

    if ((event.item.definition.id == "mod_lavacow:kings_crown") && (event.item.metadata == 1)) {


        var SpawnPosRay = event.player.getRayTrace(10, 1, false, true, true);

        if (isNull(SpawnPosRay)) { return; }
        if (isNull(SpawnPosRay.blockPos)) { return; }

        var BiomeName = event.world.getBiome(event.player.getPosition3f()).name;
        var SpawnPos = Position3f.create(SpawnPosRay.blockPos.x, SpawnPosRay.blockPos.y + 1, SpawnPosRay.blockPos.z).asBlockPos();


        if ((BiomeName has "Desert") || (BiomeName has "Dune") || (BiomeName has "Wasteland")) {

            if (!isNull(event.player.heldEquipment[0])) {

                if (event.player.heldEquipment[0].definition.id == "mod_lavacow:kings_crown") {

                    event.player.heldEquipment[0].mutable().shrink(1);
                    val skeleton_king = <entity:mod_lavacow:skeletonking>.createEntity(event.player.world) as IEntity;
                    skeleton_king.setPosition(SpawnPos);
                    event.world.spawnEntity(skeleton_king);

                }

            } else if (!isNull(event.player.heldEquipment[1])) {

                if (event.player.heldEquipment[1].definition.id == "mod_lavacow:kings_crown") {

                    event.player.heldEquipment[1].mutable().shrink(1);
                    val skeleton_king = <entity:mod_lavacow:skeletonking>.createEntity(event.player.world) as IEntity;
                    skeleton_king.setPosition(SpawnPos);
                    event.world.spawnEntity(skeleton_king);
                }
            }
        }
    }

});

// Aquaculture seaweed dropped from kelp, can be baked to become kelp and kelp can be used as a fuel source to smelt 2 items. (Same-ish as 1.16.5)
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
        var randomArrow = entityShooter.world.random.nextFloat(0, 66);
        var randomArrowLong = entityShooter.world.random.nextFloat(0, 22);
        var RandomArrowScript = ArrowArray[randomArrow];
        var RandomArrowScriptLong = ArrowArrayLong[randomArrowLong];

        if (isNull(entityShooter.customName)) {

            if (randomInt <= 20) {

                if (randomInt <= 20) {

                    entityShooter.setItemToSlot(crafttweaker.entity.IEntityEquipmentSlot.offhand(), RandomArrowScriptLong);

                } else {

                    entityShooter.setItemToSlot(crafttweaker.entity.IEntityEquipmentSlot.offhand(), RandomArrowScript);

                }
            }

        } else {

            if (entityShooter.customName has "Jester") {

                if (randomInt <= 20) {

                    entityShooter.setItemToSlot(crafttweaker.entity.IEntityEquipmentSlot.offhand(), RandomArrowScriptLong);

                } else {

                    entityShooter.setItemToSlot(crafttweaker.entity.IEntityEquipmentSlot.offhand(), RandomArrowScript);

                }

            } else if (randomInt <= 20) {

                if (randomInt <= 20) {

                    entityShooter.setItemToSlot(crafttweaker.entity.IEntityEquipmentSlot.offhand(), RandomArrowScriptLong);

                } else {

                    entityShooter.setItemToSlot(crafttweaker.entity.IEntityEquipmentSlot.offhand(), RandomArrowScript);

                }

            }

        }

    }
});

//Trading with entity named Sussyberian makes you explode
//Trading with entity named mentalberian makes you nausiated, fear, etc
events.onPlayerInteractEntity(function(event as PlayerInteractEntityEvent){

    if (isNull(event.target.customName)) {return;}

    // Villager zombies can still be named MentalBerian or Sussyberian and converted back but I left it like such because I think that's a fun thing to have for players
    if (!isNull(event.item)) {
        if (!isNull(event.item.definition.id)) {
            if (!isNull(event.item.tag)) {
                if (!isNull(event.item.tag.display)) {
                    if (!isNull(event.item.tag.display.Name)) {
                        if (event.item.definition.id == "minecraft:name_tag") {

                            if (event.target.definition.id == "minecraft:villager") {
                                for name in BlackListEntitiesNameChangeVillager {
                                    if ((name has event.target.customName) || (name has event.item.tag.display.Name)) {
                                        event.cancel();
                                    }
                                }
                            }

                            if (event.target.definition.id == "playerbosses:player_boss") {
                                for name in BlackListEntitiesNameChangePlayerbosses {
                                    if ((name == event.target.customName) || (name == event.item.tag.display.Name)) {
                                        event.cancel();
                                    }
                                }
                            }

                            if (event.target.definition.id has "srparasites") {
                                for name in BlackListEntitiesNameChangeParasite {
                                    if ((name == event.target.customName) || (name == event.item.tag.display.Name)) {
                                        event.cancel();
                                    }
                                }
                            }

                            else {
                                for name in BlackListEntitiesNameChangeAny {
                                    if ((name == event.target.customName) || (name == event.item.tag.display.Name)) {
                                        event.cancel();
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    if event.entity.world.isRemote() {return;}

    if ((event.target.customName == "Mentalberian") && (event.target.definition.id == "minecraft:villager")) {

        var randomPotion = event.target.world.random.nextFloat(0, 13);
        var RandomMentalPotion = MentalPotions[randomPotion];
        event.player.addPotionEffect(<potion:mod_lavacow:soiled>.makePotionEffect(200, 1));
        event.player.addPotionEffect(RandomMentalPotion.makePotionEffect(200, 1));
        event.cancel();

    }
    if ((event.target.customName == "Sussyberian") && (event.target.definition.id == "minecraft:villager")) {

        var randomPotion = event.target.world.random.nextFloat(0, 12);
        var RandomSussyPotion = SussyPotions[randomPotion];
        event.player.addPotionEffect(<potion:mod_lavacow:soiled>.makePotionEffect(200, 1));
        event.player.addPotionEffect(RandomSussyPotion.makePotionEffect(1, 2));
        event.cancel();

    }
});

// give bow starting 0 kills when crafted
events.onPlayerCrafted(function(event as PlayerCraftedEvent){

   if ((event.output.name == "item.srparasites.weapon_bow") || (event.output.name == "item.srparasites.armor_boots") || (event.output.name == "item.srparasites.armor_pants") || (event.output.name == "item.srparasites.armor_chest") || (event.output.name == "item.srparasites.armor_helm")) {

        var SRPKills = ("§r§9---> 0") as string;
        event.output.mutable().updateTag({display:{Lore:[SRPKills]}});

   } else if ((event.output.name == "item.srparasites.weapon_scythe") || (event.output.name == "item.srparasites.weapon_axe") || (event.output.name == "item.srparasites.weapon_sword") || (event.output.name == "item.srparasites.weapon_cleaver") || (event.output.name == "item.srparasites.weapon_maul") || (event.output.name == "item.srparasites.weapon_lance")) {

        event.output.mutable().updateTag({srpkills:0});

   }

});

//Killing entities gives living armor points
events.onEntityLivingDeath(function(event as EntityLivingDeathEvent){

    if event.entity.world.isRemote() {return;}
    if (isNull(event.damageSource.getTrueSource())){return;}
    if (isNull(event.entity.definition)) {return;}
    if (isNull(event.entity.definition.id)) {return;}
    if (isNull(event.damageSource.getTrueSource().armorInventory)) {return;}

    var HeldArmor = event.damageSource.getTrueSource().armorInventory;

    if (isNull(HeldArmor)) {return;}

    var armorpieces = 0;

    if (!isNull(HeldArmor[0])) {if (HeldArmor[0].name == "item.srparasites.armor_boots") {armorpieces += 1;}}
    if (!isNull(HeldArmor[1])) {if (HeldArmor[1].name == "item.srparasites.armor_pants") {armorpieces += 1;}}
    if (!isNull(HeldArmor[2])) {if (HeldArmor[2].name == "item.srparasites.armor_chest") {armorpieces += 1;}}
    if (!isNull(HeldArmor[3])) {if (HeldArmor[3].name == "item.srparasites.armor_helm") {armorpieces += 1;}}

    if (isNull(event.damageSource.getTrueSource().heldEquipment)) {
        if (isNull(event.damageSource.getTrueSource().heldEquipment[0])) {
            if (event.damageSource.getTrueSource().heldEquipment[0].name has "srparasites") {
                armorpieces += 1;
            }
        }
        if (isNull(event.damageSource.getTrueSource().heldEquipment[1])) {
            if (event.damageSource.getTrueSource().heldEquipment[1].name has "srparasites") {
                armorpieces += 1;
            }
        }
    }

    if (!isNull(HeldArmor[0])) {

        if (HeldArmor[0].name == "item.srparasites.armor_boots") {

            var totalHealth = Math.floor(event.entityLivingBase.maxHealth) / armorpieces;

            if (isNull(HeldArmor[0].tag.srpkills)) {

                var SRPKills = ("§r§9---> " + totalHealth + "§r§5§o Your weapon tasted blood, now it longs for Parasites...") as string;
                HeldArmor[0].mutable().updateTag({display:{Lore:[SRPKills]}});
                HeldArmor[0].mutable().updateTag({srpkills:totalHealth});

            } else if ((event.entity.definition.id) has "srparasites") {

                var CurrentKills = HeldArmor[0].tag.srpkills as int;
                var TotalNewKills = CurrentKills + totalHealth;

                if TotalNewKills >= 50000 {

                    var SavedTag = HeldArmor[0].tag;

                    var posx = event.damageSource.getTrueSource().position.x;
                    var posy = event.damageSource.getTrueSource().position.y;
                    var posz = event.damageSource.getTrueSource().position.z;

                    HeldArmor[0].mutable().updateTag({display:{Lore:[""]}});
                    var SentientArmor = <srparasites:armor_boots_sentient>.withTag(SavedTag);
                    event.entityLivingBase.dropItem(SentientArmor);

                    val bolt = <entity:charm:charged_emerald>.createEntity(event.entity.world);
                    bolt.setPosition(event.damageSource.getTrueSource().position);
                    event.entity.world.spawnEntity(bolt);
                    HeldArmor[0].mutable().shrink(1);

                } else {

                    HeldArmor[0].mutable().updateTag({srpkills:TotalNewKills});
                    var SRPKills = ("§r§9---> " + TotalNewKills + "§r§5§o Your weapon tasted blood, now it longs for Parasites...") as string;
                    HeldArmor[0].mutable().updateTag({display:{Lore:[SRPKills]}});

                }

            }

        }

    }

    if (!isNull(HeldArmor[1])) {

        if (HeldArmor[1].name == "item.srparasites.armor_pants") {

            var totalHealth = Math.floor(event.entityLivingBase.maxHealth) / armorpieces;

            if (isNull(HeldArmor[1].tag.srpkills)) {

                var SRPKills = ("§r§9---> " + totalHealth + "§r§5§o Your weapon tasted blood, now it longs for Parasites...") as string;
                HeldArmor[1].mutable().updateTag({display:{Lore:[SRPKills]}});
                HeldArmor[1].mutable().updateTag({srpkills:totalHealth});

            } else if ((event.entity.definition.id) has "srparasites") {

                var CurrentKills = HeldArmor[1].tag.srpkills as int;
                var TotalNewKills = CurrentKills + totalHealth;

                if TotalNewKills >= 50000 {

                    var SavedTag = HeldArmor[1].tag;

                    var posx = event.damageSource.getTrueSource().position.x;
                    var posy = event.damageSource.getTrueSource().position.y;
                    var posz = event.damageSource.getTrueSource().position.z;

                    HeldArmor[1].mutable().updateTag({display:{Lore:[""]}});
                    var SentientArmor = <srparasites:armor_pants_sentient>.withTag(SavedTag);
                    event.entityLivingBase.dropItem(SentientArmor);


                    val bolt = <entity:charm:charged_emerald>.createEntity(event.entity.world);
                    bolt.setPosition(event.damageSource.getTrueSource().position);
                    event.entity.world.spawnEntity(bolt);
                    HeldArmor[1].mutable().shrink(1);

                } else {

                    HeldArmor[1].mutable().updateTag({srpkills:TotalNewKills});
                    var SRPKills = ("§r§9---> " + TotalNewKills + "§r§5§o Your weapon tasted blood, now it longs for Parasites...") as string;
                    HeldArmor[1].mutable().updateTag({display:{Lore:[SRPKills]}});

                }

            }
        }

    }

    if (!isNull(HeldArmor[2])) {

        if (HeldArmor[2].name == "item.srparasites.armor_chest") {

            var totalHealth = Math.floor(event.entityLivingBase.maxHealth) / armorpieces;

            if (isNull(HeldArmor[2].tag.srpkills)) {

                var SRPKills = ("§r§9---> " + totalHealth + "§r§5§o Your weapon tasted blood, now it longs for Parasites...") as string;
                HeldArmor[2].mutable().updateTag({display:{Lore:[SRPKills]}});
                HeldArmor[2].mutable().updateTag({srpkills:totalHealth});

            } else if ((event.entity.definition.id) has "srparasites") {

                var CurrentKills = HeldArmor[2].tag.srpkills as int;
                var TotalNewKills = CurrentKills + totalHealth;

                if TotalNewKills >= 50000 {

                    var SavedTag = HeldArmor[2].tag;

                    var posx = event.damageSource.getTrueSource().position.x;
                    var posy = event.damageSource.getTrueSource().position.y;
                    var posz = event.damageSource.getTrueSource().position.z;

                    HeldArmor[2].mutable().updateTag({display:{Lore:[""]}});
                    var SentientArmor = <srparasites:armor_chest_sentient>.withTag(SavedTag);
                    event.entityLivingBase.dropItem(SentientArmor);

                    val bolt = <entity:charm:charged_emerald>.createEntity(event.entity.world);
                    bolt.setPosition(event.damageSource.getTrueSource().position);
                    event.entity.world.spawnEntity(bolt);
                    HeldArmor[2].mutable().shrink(1);

                } else {

                    HeldArmor[2].mutable().updateTag({srpkills:TotalNewKills});
                    var SRPKills = ("§r§9---> " + TotalNewKills + "§r§5§o Your weapon tasted blood, now it longs for Parasites...") as string;
                    HeldArmor[2].mutable().updateTag({display:{Lore:[SRPKills]}});

                }

            }
        }

    }

    if (!isNull(HeldArmor[3])) {

        if (HeldArmor[3].name == "item.srparasites.armor_helm") {

            var totalHealth = Math.floor(event.entityLivingBase.maxHealth) / armorpieces;

            if (isNull(HeldArmor[3].tag.srpkills)) {

                var SRPKills = ("§r§9---> " + totalHealth + "§r§5§o Your weapon tasted blood, now it longs for Parasites...") as string;
                HeldArmor[3].mutable().updateTag({display:{Lore:[SRPKills]}});
                HeldArmor[3].mutable().updateTag({srpkills:totalHealth});

            } else if ((event.entity.definition.id) has "srparasites") {

                var CurrentKills = HeldArmor[3].tag.srpkills as int;
                var TotalNewKills = CurrentKills + totalHealth;

                if TotalNewKills >= 50000 {

                    var SavedTag = HeldArmor[3].tag;

                    var posx = event.damageSource.getTrueSource().position.x;
                    var posy = event.damageSource.getTrueSource().position.y;
                    var posz = event.damageSource.getTrueSource().position.z;

                    HeldArmor[3].mutable().updateTag({display:{Lore:[""]}});
                    var SentientArmor = <srparasites:armor_helm_sentient>.withTag(SavedTag);
                    event.entityLivingBase.dropItem(SentientArmor);

                    val bolt = <entity:charm:charged_emerald>.createEntity(event.entity.world);
                    bolt.setPosition(event.damageSource.getTrueSource().position);
                    event.entity.world.spawnEntity(bolt);
                    HeldArmor[3].mutable().shrink(1);

                } else {

                    HeldArmor[3].mutable().updateTag({srpkills:TotalNewKills});
                    var SRPKills = ("§r§9---> " + TotalNewKills + "§r§5§o Your weapon tasted blood, now it longs for Parasites...") as string;
                    HeldArmor[3].mutable().updateTag({display:{Lore:[SRPKills]}});

                }
            }
        }
    }

});

events.onEntityLivingDeath(function(event as EntityLivingDeathEvent){

    if event.entity.world.isRemote() {return;}
    if (isNull(event.damageSource.getTrueSource())){return;}
    if (isNull(event.entity.definition)) {return;}
    if (isNull(event.entity.definition.id)) {return;}

    for i in Mod_LavacowParasites {
        if (event.entity.definition.id == i) {

            //spawn parasites at location
            var randomNum = event.entity.world.random.nextFloat(1, 100);

            if randomNum <= 10 {
                val lavacow_parasite = <entity:mod_lavacow:parasite>.createEntity(event.entity.world);
                lavacow_parasite.setPosition(event.entity.position);
                event.entity.world.spawnEntity(lavacow_parasite);
            }
        }
    }
});

//Killing entities gives living bow points
events.onEntityLivingDeath(function(event as EntityLivingDeathEvent){

    if event.entity.world.isRemote() {return;}
    if event.entity.world.isRemote() {return;}
    if (isNull(event.damageSource.getTrueSource())){return;}
    if (isNull(event.entity.definition)) {return;}
    if (isNull(event.entity.definition.id)) {return;}
    if (isNull(event.damageSource.getTrueSource().heldEquipment)) {return;}
    if (isNull(event.damageSource.getTrueSource().heldEquipment[0])) {return;}
    if (isNull(event.damageSource.getTrueSource().heldEquipment[0].name)) {return;}

    var HeldEquipment = event.damageSource.getTrueSource().heldEquipment;
    var HeldWeapon = HeldEquipment[0].name;

    var armorpieces = 0;

    if (!isNull(HeldEquipment[0])) {if (HeldEquipment[0].name has ".srparasites.weapon_") {armorpieces += 1;}}
    if (!isNull(HeldEquipment[1])) {if (HeldEquipment[1].name has ".srparasites.weapon_") {armorpieces += 1;}}

    if (!isNull(event.damageSource.getTrueSource().armorInventory)) {
        if (!isNull(event.damageSource.getTrueSource().armorInventory[0])) {
            if (event.damageSource.getTrueSource().armorInventory[0].name has "srparasites") {
                armorpieces += 1;
            }
        }
        if (!isNull(event.damageSource.getTrueSource().armorInventory[1])) {
            if (event.damageSource.getTrueSource().armorInventory[1].name has "srparasites") {
                armorpieces += 1;
            }
        }
        if (!isNull(event.damageSource.getTrueSource().armorInventory[2])) {
            if (event.damageSource.getTrueSource().armorInventory[2].name has "srparasites") {
                armorpieces += 1;
            }
        }
        if (!isNull(event.damageSource.getTrueSource().armorInventory[3])) {
            if (event.damageSource.getTrueSource().armorInventory[3].name has "srparasites") {
                armorpieces += 1;
            }
        }
    }


    if ((event.entity.definition.id) has "srparasites") {

        if (HeldWeapon == "item.srparasites.weapon_bow") {

            // Checks if the item was disarmed and cancells tag update if it is.
            if (!isNull(HeldEquipment[0].tag)) {

                if (!isNull(HeldEquipment[0].tag.disarm)) {return;}

            }

            var totalHealth = Math.floor(event.entityLivingBase.maxHealth) / armorpieces;

            if (!isNull(HeldEquipment[0].tag.srpkills)) {


                var CurrentKills = HeldEquipment[0].tag.srpkills;
                var TotalNewKills = CurrentKills + totalHealth;
                HeldEquipment[0].mutable().updateTag({srpkills:TotalNewKills});

                var SRPKills = ("§r§9---> " + TotalNewKills) as string;
                HeldEquipment[0].mutable().updateTag({display:{Lore:[SRPKills]}});

                //Destroy item and drop a new sentient weapon with it's full NBT data on the ground + lightning strike
                if TotalNewKills >= 50000 {

                    var SavedTag = HeldEquipment[0].tag;
                    var NewWeapon = <srparasites:weapon_bow_sentient>.withTag(SavedTag);
                    var NewBow = NewWeapon.createEntityItem(event.damageSource.getTrueSource().world, event.damageSource.getTrueSource().position);

                    var posx = event.damageSource.getTrueSource().position.x;
                    var posy = event.damageSource.getTrueSource().position.y;
                    var posz = event.damageSource.getTrueSource().position.z;

                    //var StrikeEntity = <entity:switchbow:arrowlightningboltstorm>.createEntity(event.entity.world);
                    //StrikeEntity.setPosition(event.damageSource.getTrueSource().position);
                    //event.entity.world.spawnEntity(StrikeEntity);


                    //event.entity.world.performExplosion(null, posx, posy, posz, 3, false, false);
                    HeldEquipment[0].mutable().shrink(1);
                    event.entityLivingBase.dropItem(NewWeapon);

                    val bolt = <entity:charm:charged_emerald>.createEntity(event.entity.world);
                    bolt.setPosition(event.damageSource.getTrueSource().position);
                    event.entity.world.spawnEntity(bolt);


                }

            } else {

                HeldEquipment[0].mutable().updateTag({srpkills:totalHealth});

                var SRPKills = ("§r§9---> " + totalHealth) as string;
                HeldEquipment[0].mutable().updateTag({display:{Lore:[SRPKills]}});

            }

        } else if ((HeldWeapon == "item.srparasites.weapon_scythe") || (HeldWeapon == "item.srparasites.weapon_axe") || (HeldWeapon == "item.srparasites.weapon_sword") || (HeldWeapon == "item.srparasites.weapon_cleaver") || (HeldWeapon == "item.srparasites.weapon_maul") || (HeldWeapon == "item.srparasites.weapon_lance")) {

            var totalHealth = Math.floor(event.entityLivingBase.maxHealth) / armorpieces;

            if (!isNull(HeldEquipment[0].tag.srpkills)) {

                var CurrentKills = HeldEquipment[0].tag.srpkills;
                var TotalNewKills = CurrentKills + totalHealth;
                HeldEquipment[0].mutable().updateTag({srpkills:TotalNewKills});


                if TotalNewKills >= 50000 {

                    var SavedTag = HeldEquipment[0].tag;

                    var posx = event.damageSource.getTrueSource().position.x;
                    var posy = event.damageSource.getTrueSource().position.y;
                    var posz = event.damageSource.getTrueSource().position.z;


                    if (HeldEquipment[0].definition.id == "srparasites:weapon_scythe") {

                        var SentientWeapon = <srparasites:weapon_scythe_sentient>.withTag(SavedTag);
                        event.entityLivingBase.dropItem(SentientWeapon);

                    } else if (HeldEquipment[0].definition.id == "srparasites:weapon_axe") {

                        var SentientWeapon = <srparasites:weapon_axe_sentient>.withTag(SavedTag);
                        event.entityLivingBase.dropItem(SentientWeapon);

                    } else if (HeldEquipment[0].definition.id == "srparasites:weapon_sword") {

                        var SentientWeapon = <srparasites:weapon_sword_sentient>.withTag(SavedTag);
                        event.entityLivingBase.dropItem(SentientWeapon);

                    } else if (HeldEquipment[0].definition.id == "srparasites:weapon_cleaver") {

                        var SentientWeapon = <srparasites:weapon_cleaver_sentient>.withTag(SavedTag);
                        event.entityLivingBase.dropItem(SentientWeapon);

                    } else if (HeldEquipment[0].definition.id == "srparasites:weapon_maul") {

                        var SentientWeapon = <srparasites:weapon_maul_sentient>.withTag(SavedTag);
                        event.entityLivingBase.dropItem(SentientWeapon);

                    } else if (HeldEquipment[0].definition.id == "srparasites:weapon_lance") {

                        var SentientWeapon = <srparasites:weapon_lance_sentient>.withTag(SavedTag);
                        event.entityLivingBase.dropItem(SentientWeapon);


                    }

                    val bolt = <entity:charm:charged_emerald>.createEntity(event.entity.world);
                    bolt.setPosition(event.damageSource.getTrueSource().position);
                    event.entity.world.spawnEntity(bolt);
                    HeldEquipment[0].mutable().shrink(1);

                }

            } else {

                HeldEquipment[0].mutable().updateTag({srpkills:totalHealth});

            }

        }

    } else if ((HeldWeapon == "item.srparasites.weapon_scythe") || (HeldWeapon == "item.srparasites.weapon_axe") || (HeldWeapon == "item.srparasites.weapon_sword") || (HeldWeapon == "item.srparasites.weapon_cleaver") || (HeldWeapon == "item.srparasites.weapon_maul") || (HeldWeapon == "item.srparasites.weapon_lance") || (HeldWeapon == "item.srparasites.weapon_bow"))  {

        var totalHealth = Math.floor(event.entityLivingBase.maxHealth);

        if (!isNull(HeldEquipment[0].tag.srpkills)) {

            var CurrentKills = HeldEquipment[0].tag.srpkills as int;
            var TotalNewKills = CurrentKills - totalHealth;
            HeldEquipment[0].mutable().updateTag({srpkills:TotalNewKills});

        } else {

            HeldEquipment[0].mutable().updateTag({display:{Lore:["","Your weapon tasted blood, now it longs for Parasites..."]}});
            HeldEquipment[0].mutable().updateTag({srpkills:0});
        }
    }

});

//Dismounts player if they get hit by a dragon and do not have dragon armor on
events.onEntityLivingDamage(function(event as EntityLivingDamageEvent){

    if !(event.entity.isRiding) {return;}

    if(!isNull(event.damageSource.getDamageType())){
        if ((event.damageSource.getDamageType() == "dragon_ice") || (event.damageSource.getDamageType() == "dragon_fire") || (event.damageSource.getDamageType() == "dragon_lightning")) {

            if ((isNull(event.entityLivingBase.getItemInSlot(feet))) || (isNull(event.entityLivingBase.getItemInSlot(legs))) || (isNull(event.entityLivingBase.getItemInSlot(chest))) || (isNull(event.entityLivingBase.getItemInSlot(head)))) { return; }

            var feet = (event.entityLivingBase.getItemInSlot(feet).definition.id);
            var legs = (event.entityLivingBase.getItemInSlot(legs).definition.id);
            var chest = (event.entityLivingBase.getItemInSlot(chest).definition.id);
            var head = (event.entityLivingBase.getItemInSlot(head).definition.id);

            if (!(feet has "iceandfire:armor_") || !(legs has "iceandfire:armor_") || !(chest has "iceandfire:armor_") || !(head has "iceandfire:armor_")) {
                event.entity.dismountRidingEntity();
                event.entity.removePassengers();
            }

            if ((feet has "metal") || (legs has "metal") || (chest has "metal") || (head has "metal")) {
                event.entity.dismountRidingEntity();
                event.entity.removePassengers();
            }
        }
    }
});

//summon playerbosses:player_boss ~ ~1 ~ {CustomName:"§4☢ §5§lBlighted Shivaxi§r §4☢"}
//Function to dismount players if hit by entity named Dismounter && Function giving Shivaxi a phase 2 below 10 health if in Abyssal Rift
events.onEntityLivingDamage(function(event as EntityLivingDamageEvent){


    if ((event.amount) > 6) {
        if(event.entity.isRiding) {
            event.entity.dismountRidingEntity();
            event.entity.removePassengers();
        }
    }

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

    if (!isNull(event.damageSource.getTrueSource())){
        if(!isNull(event.damageSource.getTrueSource().getCustomName())) {
            if(event.damageSource.getTrueSource().getCustomName() has "Dispel") {
                event.entityLivingBase.addPotionEffect(<potion:potioncore:dispel>.makePotionEffect(100, 0));
            }
        }
    }

    if (!isNull(event.damageSource.getTrueSource())){
        if(!isNull(event.damageSource.getTrueSource().getCustomName())){
            if(event.damageSource.getTrueSource().getCustomName() has "Sarevok") {
                event.entityLivingBase.addPotionEffect(<potion:potioncore:dispel>.makePotionEffect(100, 0));
                event.entityLivingBase.addPotionEffect(<potion:biomesoplenty:curse>.makePotionEffect(100, 0));
            }
        }
    }

    var EntityBiome = event.entity.world.getBiome(event.entity.getPosition3f()).name;

    if (isNull(event.entity)){return;}
    if (isNull(event.entity.definition)){return;}
    if (isNull(event.entity.definition.id)){return;}
    if ((EntityBiome) == "Abyssal Rift") {

        //Damage cap set at 100 per hit on abyssal rift bosses
        if (event.amount >= 100) {
            if (!isNull(event.entity.nbt.SpawnedAsBoss)) {
                if ((event.entity.nbt.SpawnedAsBoss) == 1) {
                    event.amount = 100;
                }
            }
        }

        if ((event.entity.definition.id) == "playerbosses:player_boss"){

            var Phase03 = event.entityLivingBase.maxHealth /4;
            var Phase02 = event.entityLivingBase.maxHealth /2;

            if ((Phase02 >= event.entityLivingBase.health) && (Phase03 <= event.entityLivingBase.health)){

                var buglin = <entity:srparasites:buglin>.createEntity(event.entityLivingBase.world);
                var adventurerhead = <entity:srparasites:sim_adventurerhead>.createEntity(event.entityLivingBase.world);
                var rupter = <entity:srparasites:rupter>.createEntity(event.entityLivingBase.world);
                var mediumform = <entity:srparasites:incompleteform_medium>.createEntity(event.entityLivingBase.world);
                var yelloweye = <entity:srparasites:pri_yelloweye>.createEntity(event.entityLivingBase.world);
                var EntityArray = [buglin, buglin, buglin, buglin, buglin, buglin, adventurerhead, adventurerhead, adventurerhead, rupter, rupter, rupter, mediumform, mediumform, yelloweye] as IEntity[];

                for i in 0 to event.entity.world.random.nextFloat(1, 6) {

                    // Max Entity Count
                    if (!isNull(event.entity.nbt.ForgeData.EntityCount)) {
                        if (event.entity.nbt.ForgeData.EntityCount >= 50) {
                            return;
                        } else {
                            var EntityCountNew = event.entity.nbt.ForgeData.EntityCount + 1;
                            event.entity.setNBT({EntityCount: EntityCountNew});
                        }
                    }

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

//Function stopping teleport arrows & potions from having effect on entities within abyssal rift.
events.onEntityLivingAttacked(function(event as EntityLivingAttackedEvent){

    if((event.damageSource.projectile == true) && ((event.entity.world.getBiome(event.entity.getPosition3f()).name) == "Abyssal Rift")) {


        //todo: needs tipped arrows
        if !(isNull(event.damageSource.immediateSource.nbt.Potion)) {
            if (((event.damageSource.immediateSource.nbt.Potion) == "potioncore:teleport") || ((event.damageSource.immediateSource.nbt.Potion) == "mujmajnkraftsbettersurvival:warp") || ((event.damageSource.immediateSource.nbt.Potion) == "potioncore:strong_teleport") || ((event.damageSource.immediateSource.nbt.Potion) == "potioncore:teleport_surface") || ((event.damageSource.immediateSource.nbt.Potion) == "bountifulbaubles:potionrecall")) {

                event.cancel();

            }
        }

        if (((event.damageSource.immediateSource.definition.name) == "ArrowEnderperle") || ((event.damageSource.immediateSource.definition.name) == "ArrowChorus")) {
            event.cancel();
        }

    }

});

//Function to give chorus fruit & teleportation potions a different effect on use
events.onProjectileImpactThrowable(function(event as ProjectileImpactThrowableEvent){

      if ((event.throwable.getNBT().asString() == "potioncore:teleport") || (event.throwable.getNBT().asString() == "mujmajnkraftsbettersurvival:warp") || (event.throwable.getNBT().asString() == "potioncore:strong_teleport") || (event.throwable.getNBT().asString() == "potioncore:teleport_surface") || (event.throwable.getNBT().asString() == "bountifulbaubles:potionrecall")) {

          var entityBase as IEntityLivingBase = event.thrower;

          if (!isNull(entityBase)) {

              if ((entityBase.world.getBiome(event.entity.getPosition3f()).name) == "Abyssal Rift") {

                  entityBase.addPotionEffect(<potion:potioncore:potion_sickness>.makePotionEffect(200, 1));
                  entityBase.addPotionEffect(<potion:potioncore:teleport_surface>.makePotionEffect(10, 0));
                  event.cancel();

              }
          }
      }
});

//Function to give chorus fruit & teleportation potions a different effect on use
events.onEntityLivingUseItemFinish(function(event as Finish){
      if ((event.item.tag.asString() has "potioncore:teleport") || (event.item.tag.asString() has "potioncore:strong_teleport") || (event.item.definition.id has "minecraft:chorus_fruit") || (event.item.definition.id has "bountifulbaubles:potionrecall")) {
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

events.onEntityLivingUpdate(function(event as EntityLivingUpdateEvent){

    if (event.entity.world.time % 10 != 0) {return;}
    if (isNull(event.entity.definition)) { return; }
    if (isNull(event.entity.definition)) { return; }
    if ((event.entity.definition.id) != "minecraft:villager") { return; }
    if(!isNull(event.entity.nbt.ForgeData.SussyBerianNaming)) { return; }

    if((event.entity.customName == "") && (event.entity.nbt.Profession == 1) && (event.entity.nbt.Career == 1)) {
        event.entity.setNBT({SussyBerianNaming: 1});
        var RandomNum = event.entity.world.random.nextFloat(0, 100);

        if RandomNum <= 10 {

            if RandomNum <= 7 {
                event.entity.setCustomName("Sussyberian");
            } else {
                event.entity.setCustomName("Mentalberian");
            }
        }
    } else if((event.entity.customName == "Mentalberian") && (event.entity.nbt.Profession == 1) && (event.entity.nbt.Career == 1)) {
        event.entity.setNBT({SussyBerianNaming: 1});
    } else if((event.entity.customName == "Surryberian") && (event.entity.nbt.Profession == 1) && (event.entity.nbt.Career == 1)) {
        event.entity.setNBT({SussyBerianNaming: 1});
    }
});

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

                    if (((EntityBiome) == "Heath") || ((EntityBiome) == "Steppe") || ((EntityBiome) == "Wasteland") || ((EntityBiome) == "Frozen City Creek") || ((EntityBiome) == "Desert City Creek") || ((EntityBiome) == "Jungle City Creek") || ((EntityBiome) == "Ruins of Blight") || ((EntityBiome) == "Nuclear Ruins") || ((EntityBiome) == "Lair of the Thing") || ((EntityBiome) == "Parasite Biome")){return;}

                    if ((EntityBiome) == "Abyssal Rift") {

                        if ((entityName has "beckon") || (entityName has "dispatcher")) {

                            event.entity.setDead();

                        }

                    } else if entityBase.health > 1000 {
                        entityBase.health = entityBase.health / 50;
                    } else if ((entityBase.health > 100) && (entityBase.health < 1000)) {
                        entityBase.health = entityBase.health / 10;
                    } else if (entityBase.health < 100) {
                        entityBase.health = entityBase.health - 10;
                    } else {
                        event.entity.setDead();
                    }
                }
            }
        }
    }
});

// SRParasites in overworld Cancel Spawns if not in Whitelisted Biome and From spawner
events.onCheckSpawn(function(event as EntityLivingExtendedSpawnEvent){

    if (!isNull(event.spawner)){

        if (!isNull(event.entity.definition)) {

            if (!isNull(event.entity.definition.name)) {

                if (event.spawner){

                    if (((event.entity.definition.name) has "srparasites") && ((event.entity.world.getDimension()) == 0)) {

                        var Biome = (event.entity.world.getBiome(event.entity.getPosition3f()).name);

                        if (((Biome) == "Heath") || ((Biome) == "Steppe") || ((Biome) == "Wasteland") || ((Biome) == "Abyssal Rift") || ((Biome) == "Parasite Biome") || ((Biome) == "Lair of the Thing") || ((Biome) == "Nuclear Ruins") || ((Biome) == "Ruins of Blight")) {return;}

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

                var EntityBiome = event.entity.world.getBiome(event.entity.getPosition3f()).name;

                if (!isNull(event.entity.nbt.ForgeData.InfernalMobsMod)) {
                    if ((EntityBiome) == "Abyssal Rift") {

                        if(event.drops.length > 0){

                            var drops = event.drops;
                            event.drops = [];

                            for i in drops {

                                if i.item.definition.id == "minecraft:enchanted_book" {

                                    var RandomInt = event.entity.world.random.nextFloat(0, 100);
                                    if RandomInt <= 50 { event.addItem(i); } else { event.addItem(<biomesoplenty:ash>.withTag({display: {Name: "Infernal Ashes"}})); }

                                } else {

                                    event.addItem(i);

                                }
                            }
                        }
                    }
                }

                if ((event.entity.definition.id) == "playerbosses:player_boss") {

                    if ((EntityBiome) == "Abyssal Rift") {
                        event.cancel(); //Shivaxi drops nothing at this stage
                    }
                }

                if (((event.entity.definition.name) has "srparasites") && ((event.entity.world.getDimension()) == 0)) {

                    if (((event.entity.customName) has "Sentient Horror") || ((event.entity.customName) has "Degrading Overseer") || ((event.entity.customName) has "Malformed Observer") || ((event.entity.customName) has "Shivaxi") || ((event.entity.customName) has "Corrupted Carrier") || ((event.entity.customName) has "Necrotic Blight")) {return;}

                    if (((EntityBiome) == "Heath") || ((EntityBiome) == "Steppe") || ((EntityBiome) == "Wasteland") || ((EntityBiome) == "Parasite Biome") || ((EntityBiome) == "Abyssal Rift") || ((EntityBiome) == "Ruins of Blight") || ((EntityBiome) == "Nuclear Ruins") || ((EntityBiome) == "Lair of the Thing")) {

                        if(event.drops.length > 0){

                            var drops = event.drops;
                            event.drops = [];

                            for i in drops {

                                if i.item.definition.id has "srparasites" {

                                    //Randomize the chance of the drop, make it drop less because parasites are weaker
                                    //event.addItem(<srparasites:assimilated_flesh>);

                                    var RandomInt = event.entity.world.random.nextFloat(0, 100);
                                    if RandomInt <= 62 { event.addItem(i); } else { event.addItem(<biomesoplenty:ash>.withTag({display: {Name: "Corrupted Ashes"}})); } //Based of healthmultiply 0.5 & damagemultiply 0.25 averaged out on 0.625 the overall strength of parasites in the overworld compared to lost cities parasites.

                                } else {
                                    event.addItem(i);
                                }
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
	player.addPotionEffect(<potion:potioncore:dispel>.makePotionEffect(100, 0));
    player.addPotionEffect(<potion:potioncore:weight>.makePotionEffect(100, 0));
    player.addPotionEffect(<potion:minecraft:slowness>.makePotionEffect(100, 0));
    player.addPotionEffect(<potion:srparasites:corrosive>.makePotionEffect(100, 0));
	} else {
		for p in player.activePotionEffects {
      if !(p.effectName.matches("potioncore:dispel")) {
				player.addPotionEffect(<potion:potioncore:dispel>.makePotionEffect(100, 0));
			}
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
    player.addPotionEffect(<potion:potioncore:potion_sickness>.makePotionEffect(200, 0));
    player.addPotionEffect(<potion:potioncore:explode>.makePotionEffect(1, 0));
    player.addPotionEffect(<potion:potioncore:launch>.makePotionEffect(1, 0));
    player.addPotionEffect(<potion:minecraft:weakness>.makePotionEffect(100, 1));
    player.addPotionEffect(<potion:simpledifficulty:hyperthermia>.makePotionEffect(100, 2));

	} else {
		for p in player.activePotionEffects {
      if !(p.effectName.matches("potioncore:potion_sickness")) {
				player.addPotionEffect(<potion:potioncore:potion_sickness>.makePotionEffect(200, 0));
			}
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

//tooltips Conductivity
for item in conductivity_1 {item.addTooltip("§e§oConductivity +1");}
for item in conductivity_2 {item.addTooltip("§e§oConductivity +2");}
for item in conductivity_3 {item.addTooltip("§e§oConductivity +3");}
for item in conductivity_4 {item.addTooltip("§e§oConductivity +4");}
for item in conductivity_5 {item.addTooltip("§e§oConductivity +5");}
for item in conductivity_10 {item.addTooltip("§e§oConductivity +10");}



events.onPlayerTick(function(event as PlayerTickEvent){

    if event.player.world.isRemote() {return;}
    if (event.player.world.time % 100 != 0) {return;}

    // Only Thunder
    if ((event.player.world.isRaining()) && ((event.player.world.getBrightness(event.player.position)) == 15)) {
		
		var doShock = false;
		var isThunder = false;
		
		if (event.player.world.getWorldInfo().isThundering()) {
			doShock = true;
			isThunder = true;
		}
		else {
			var block =  event.player.world.getBlock(event.player.position.x, event.player.position.y - 1, event.player.position.z);
            if ((!isNull(event.player.getRidingEntity())) || (block.definition.id) == "minecraft:air") {
				doShock = true;
			}
		}
		
		if (!doShock) {
			event.player.setNBT({lightning_warning: 0});
			return;
		}
		
        // Assign conductivity rating for player
        var EquipmentList = event.player.equipmentAndArmor as IItemStack[];
        var silvercount as int = 0;

        for item in EquipmentList {

            if (!isNull(item)) {

                for conductive_item in conductivity_1 {
                    if (conductive_item.matches(item)) {silvercount += 1;}
                }
                for conductive_item in conductivity_2 {
                    if (conductive_item.matches(item)) {silvercount += 2;}
                }
                for conductive_item in conductivity_3 {
                    if (conductive_item.matches(item)) {silvercount += 3;}
                }
                for conductive_item in conductivity_4 {
                    if (conductive_item.matches(item)) {silvercount += 4;}
                }
                for conductive_item in conductivity_5 {
                    if (conductive_item.matches(item)) {silvercount += 5;}
                }
                for conductive_item in conductivity_10 {
                    if (conductive_item.matches(item)) {silvercount += 5;}
                }
            }
        }
		
		if (!isThunder) {
			silvercount = silvercount / 2.0;
		}

        var RandomLightningInt = event.entity.world.random.nextFloat(0, 7);
        var RandomLightningMessage = RandomLightningMessageArray[RandomLightningInt];

        var warning = event.player.world.time + 60;
		
		var cooldown = event.player.world.time;
		
		if (!isThunder) {
			cooldown += 1200;
		}
		else {
			cooldown += 400;
		}

        if (isNull(event.player.nbt.ForgeData.lightning_cooldown)) {

             event.player.setNBT({lightning_cooldown: 0});

        }

        if (event.player.world.time) > (event.player.nbt.ForgeData.lightning_cooldown)  {

            if (isNull(event.player.nbt.ForgeData.lightning_warning)) {

                var RandomInt = event.entity.world.random.nextFloat(0, 100);
                if (RandomInt < silvercount) {

                    // sets a cooldown for the warning (60 seconds)
                    event.player.setNBT({lightning_warning: warning});

                    // warns the player about impending lightning strike
                    event.player.sendStatusMessage(RandomLightningMessage, true);
                }
            }

            else if ((event.player.nbt.ForgeData.lightning_warning) == 0) {

                var RandomInt = event.entity.world.random.nextFloat(0, 100);
                if (RandomInt < silvercount) {

                    // sets a cooldown for the warning (60 seconds)
                    event.player.setNBT({lightning_warning: warning});

                    // warns the player about impending lightning strike
                    event.player.sendStatusMessage(RandomLightningMessage, true);
                }
            }

            else if (event.player.world.time) > (event.player.nbt.ForgeData.lightning_warning)  {

                // warning time cooldown is over, strike with lightning
                event.player.addPotionEffect(<potion:potioncore:lightning>.makePotionEffect(1, 0));

                // set cooldown before initiating the whole script again
                event.player.setNBT({lightning_cooldown: cooldown});

                // set warning to false so it skips the null check before and triggers the second check
                event.player.setNBT({lightning_warning: 0});

            }
        }
    }
	else {
		event.player.setNBT({lightning_warning: 0});
	}

});

//Listener for player on mount in Abyssal Rift
//Listener for player in SRP deadblood / BOP Hot Spring Water / Bauble listener / Teleportation on hit by skeleton with Teleport arrow
events.onPlayerTick(function(event as PlayerTickEvent){

    if event.player.world.isRemote() {return;}
    if (event.player.world.time % 20 != 0) {return;}

    if (event.player.world.getBiome(event.player.getPosition3f()).name == "Abyssal Rift") {

        if (!isNull(event.player.getRidingEntity())) {

            var newtime = event.player.world.time + 100;

            if (isNull(event.player.nbt.ForgeData.lightning_cooldown_abyssal)) {

                event.player.setNBT({lightning_cooldown_abyssal: newtime});
                event.player.sendStatusMessage("An ominous feeling overcomes you, as if you are being watched... Perhaps it's best to proceed on foot", true);

            }

            else if (event.player.nbt.ForgeData.lightning_cooldown_abyssal == 0) {

                event.player.setNBT({lightning_cooldown_abyssal: newtime});
                event.player.sendStatusMessage("An ominous feeling overcomes you, as if you are being watched... Perhaps it's best to proceed on foot", true);

            }

            else if (event.player.world.time > event.player.nbt.ForgeData.lightning_cooldown_abyssal ){

                event.player.setNBT({lightning_cooldown_abyssal: 0});

                var entityRiding = event.player.getRidingEntity();
                event.player.removePassengers();
                event.player.dismountRidingEntity();
                event.player.addPotionEffect(<potion:potioncore:lightning>.makePotionEffect(1, 0));

            }
        }
		else {
			event.player.setNBT({lightning_cooldown_abyssal: 0});
		}
    }
	else {
		event.player.setNBT({lightning_cooldown_abyssal: 0});
	}


    if(isNull(event.player.nbt.ForgeData.SkippedSilverDebuffs)){

        event.player.setNBT({SkippedSilverDebuffs: 0});

    }

    if(isNull(event.player.nbt.ForgeData.SilverSicknessCooldown)){
        event.player.setNBT({SilverSicknessCooldown: event.player.world.getWorldTime()});
    }

    if (!isNull(event.entity.armorInventory[0])) && (!isNull(event.entity.armorInventory[1])) && (!isNull(event.entity.armorInventory[2])) && (!isNull(event.entity.armorInventory[3])) {


        if ((event.entity.armorInventory[0].name == "item.iceandfire.silver_boots") && (event.entity.armorInventory[1].name == "item.iceandfire.silver_leggings") && (event.entity.armorInventory[2].name == "item.iceandfire.silver_chestplate") && (event.entity.armorInventory[3].name == "item.iceandfire.silver_helmet")){


            if (((event.player.isBaubleEquipped(<bountifulbaubles:shieldankh>)) != -1) || ((event.player.isBaubleEquipped(<bountifulbaubles:trinketankhcharm>)) != -1)) {return;}

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
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

// use /ct syntax to validate scripts

print("Dregora Script starting!");

//Debug lines true/false
var Logging = false;

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

var ArrowArrayLong = [
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:long_klutz"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:long_weight"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:long_broken_armor"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:long_spin"}),
	<minecraft:tipped_arrow>.withTag({Potion: "quark:long_mining_fatigue"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:long_magic_inhibition"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:long_drown"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:long_vulnerable"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:long_rust"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:long_perplexity"}),
	<minecraft:tipped_arrow>.withTag({Potion: "minecraft:long_slowness"}),
	<minecraft:tipped_arrow>.withTag({Potion: "mujmajnkraftsbettersurvival:long_antiwarp"}),
	<minecraft:tipped_arrow>.withTag({Potion: "mujmajnkraftsbettersurvival:long_decay"}),
	<minecraft:tipped_arrow>.withTag({Potion: "mujmajnkraftsbettersurvival:long_blindness"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:long_blindness"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:long_nausea"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:long_levitation"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:long_hunger"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:long_wither"}),
	<minecraft:tipped_arrow>.withTag({Potion: "elenaidodge:long_sluggish"}),
	<minecraft:tipped_arrow>.withTag({Potion: "minecraft:long_poison"}),
	<minecraft:tipped_arrow>.withTag({Potion: "minecraft:long_weakness"}),
	<minecraft:tipped_arrow>.withTag({Potion: "elenaidodge:long_feeble"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:long_broken_magic_shield"})
	] as IItemStack[];

var ArrowArray = [
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:strong_broken_armor"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:broken_armor"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:strong_klutz"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:klutz"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:dispel"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:strong_launch"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:launch"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:spin"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:strong_spin"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:curse"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:strong_curse"}),
	<minecraft:tipped_arrow>.withTag({Potion: "quark:mining_fatigue"}),
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
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:teleport"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:strong_teleport"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:teleport_surface"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:drown"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:teleport_spawn"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:strong_vulnerable"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:vulnerable"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:strong_rust"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:rust"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:perplexity"}),
	<minecraft:tipped_arrow>.withTag({Potion: "minecraft:slowness"}),
	<minecraft:tipped_arrow>.withTag({Potion: "mujmajnkraftsbettersurvival:milk"}),
	<minecraft:tipped_arrow>.withTag({Potion: "mujmajnkraftsbettersurvival:antiwarp"}),
	<minecraft:tipped_arrow>.withTag({Potion: "mujmajnkraftsbettersurvival:strong_decay"}),
	<minecraft:tipped_arrow>.withTag({Potion: "mujmajnkraftsbettersurvival:decay"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:nausea"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:levitation"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:strong_levitation"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:unluck"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:strong_hunger"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:hunger"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:strong_wither"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:wither"}),
	<minecraft:tipped_arrow>.withTag({Potion: "elenaidodge:sluggish"}),
	<minecraft:tipped_arrow>.withTag({Potion: "elenaidodge:strong_feeble"}),
	<minecraft:tipped_arrow>.withTag({Potion: "minecraft:harming"}),
	<minecraft:tipped_arrow>.withTag({Potion: "minecraft:strong_harming"}),
	<minecraft:tipped_arrow>.withTag({Potion: "minecraft:poison"}),
	<minecraft:tipped_arrow>.withTag({Potion: "minecraft:strong_poison"}),
	<minecraft:tipped_arrow>.withTag({Potion: "mujmajnkraftsbettersurvival:blindness"}),
	<minecraft:tipped_arrow>.withTag({Potion: "elenaidodge:feeble"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:strong_magic_inhibition"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:strong_weight"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:fire"}),
	<minecraft:tipped_arrow>.withTag({Potion: "potioncore:invert"}),
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
        var RandomArrowScript = ArrowArray[randomArrow];
        var RandomArrowScriptLong = ArrowArrayLong[randomArrow];

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

var MentalPotions = [
    <potion:lycanitesmobs:paralysis>,
    <potion:lycanitesmobs:insomnia>,
    <potion:lycanitesmobs:fear>,
    <potion:potioncore:klutz>,
    <potion:rustic:tipsy>,
    <potion:minecraft:nausea>,
    <potion:elenaidodge:sluggish>,
    <potion:potioncore:spin>,
    <potion:minecraft:mining_fatigue>,
    <potion:lycanitesmobs:aphagia>,
    <potion:minecraft:blindness>,
    <potion:minecraft:unluck>,
    <potion:srparasites:fear>,
    <potion:potioncore:disorganization>
    ] as IPotion[];

var SussyPotions = [
    <potion:potioncore:lightning>,
    <potion:potioncore:explode>,
    <potion:potioncore:launch>
	] as IPotion[];

var BlackListEntitiesNameChangeVillager = [
    "Mentalberian",
    "Sussyberian"
	] as string[];

var BlackListEntitiesNameChangeAny = [
    "Dismounting",
    "Dismounter",
    "Dispel",
    "Sarevok",
    "Jester"
	] as string[];

var BlackListEntitiesNameChangePlayerbosses = [
    "Blighted Shivaxi"
	] as string[];

var BlackListEntitiesNameChangeParasite = [
    "Sentient Horror",
    "Degrading Overseer",
    "Malformed Observer",
    "Shivaxi",
    "Corrupted Carrier",
    "Necrotic Blight"
	] as string[];

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

    if ((event.target.customName == "Mentalberian") && (event.target.definition.id == "minecraft:villager")) {

        var randomPotion = event.target.world.random.nextFloat(0, 13);
        var RandomMentalPotion = MentalPotions[randomPotion];
        event.player.addPotionEffect(<potion:mod_lavacow:soiled>.makePotionEffect(200, 1));
        event.player.addPotionEffect(RandomMentalPotion.makePotionEffect(200, 1));
        event.cancel();

    }
    if ((event.target.customName == "Sussyberian") && (event.target.definition.id == "minecraft:villager")) {

        var randomPotion = event.target.world.random.nextFloat(0, 1);
        var RandomSussyPotion = SussyPotions[randomPotion];
        event.player.addPotionEffect(<potion:mod_lavacow:soiled>.makePotionEffect(200, 1));
        event.player.addPotionEffect(RandomSussyPotion.makePotionEffect(1, 2));
        event.cancel();

    }
});


// give bow starting 0 kills when crafted
events.onPlayerCrafted(function(event as PlayerCraftedEvent){

   if (event.output.name == "item.srparasites.weapon_bow") {

        var SRPKills = ("§r§9---> 0") as string;
        event.output.mutable().updateTag({display:{Lore:[SRPKills]}});

   } else if ((event.output.name == "item.srparasites.weapon_scythe") || (event.output.name == "item.srparasites.weapon_axe") || (event.output.name == "item.srparasites.weapon_sword") || (event.output.name == "item.srparasites.weapon_cleaver") || (event.output.name == "item.srparasites.weapon_maul") || (event.output.name == "item.srparasites.weapon_lance")) {

        event.output.mutable().updateTag({srpkills:0});

   }

});

var Mod_LavacowParasites = [
    "minecraft:zombie",
    "minecraft:husk",
    "mod_lavacow:zombiefrozen",
    "mod_lavacow:zombiemushroom",
    "mod_lavacow:unburied",
    "mod_lavacow:mummy"
    ] as string[];

//Killing entities gives living bow points
events.onEntityLivingDeath(function(event as EntityLivingDeathEvent){

    if event.entity.world.isRemote() {return;}

    if (!isNull(event.damageSource.getTrueSource())){

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

        if (isNull(event.damageSource.getTrueSource().heldEquipment)) {return;}
        if (isNull(event.damageSource.getTrueSource().heldEquipment[0])) {return;}
        if (isNull(event.damageSource.getTrueSource().heldEquipment[0].name)) {return;}

        var HeldEquipment = event.damageSource.getTrueSource().heldEquipment;


        var HeldWeapon = HeldEquipment[0].name;

        if ((event.entity.definition.id) has "srparasites") {

            if (HeldWeapon == "item.srparasites.weapon_bow") {

                var totalHealth = Math.floor(event.entityLivingBase.maxHealth);

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

                var totalHealth = Math.floor(event.entityLivingBase.maxHealth);

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
                //give @a srparasites:weapon_cleaver 1 0 {Item:{tag:{srpkills:0}}}
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

    if(!isNull(event.damageSource.getDamageType())){
        if (event.damageSource.getDamageType() == "lightningBolt") {
            if(event.entity.isRiding) {
                event.entity.dismountRidingEntity();
                event.entity.removePassengers();

            }
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


    if (isNull(event.entity)){return;}
    if (isNull(event.entity.definition)){return;}
    if (isNull(event.entity.definition.id)){return;}
    if ((event.entity.definition.id) == "playerbosses:player_boss"){

        var EntityBiome = event.entity.world.getBiome(event.entity.getPosition3f()).name;

        if ((EntityBiome) == "Abyssal Rift") {

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
            if (((event.damageSource.immediateSource.nbt.Potion) == "potioncore:teleport") || ((event.damageSource.immediateSource.nbt.Potion) == "mujmajnkraftsbettersurvival:warp") || ((event.damageSource.immediateSource.nbt.Potion) == "potioncore:strong_teleport") || ((event.damageSource.immediateSource.nbt.Potion) == "potioncore:teleport_surface")) {

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

      if ((event.throwable.getNBT().asString() == "potioncore:teleport") || (event.throwable.getNBT().asString() == "mujmajnkraftsbettersurvival:warp") || (event.throwable.getNBT().asString() == "potioncore:strong_teleport") || (event.throwable.getNBT().asString() == "potioncore:teleport_surface")) {

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

        if (event.spawner){

            if (!isNull(event.entity.definition)) {

                if (!isNull(event.entity.definition.name)) {

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
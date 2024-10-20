#loader contenttweaker
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;
import mods.contenttweaker.BlockMaterial;

val StatusEffect = VanillaFactory.createItem("status_effect");
StatusEffect.register();

// Reinforced Iron Plate Block
val ReinforcedBlockDefault = VanillaFactory.createBlock("iron_plate_reinforced", <blockmaterial:iron>);
ReinforcedBlockDefault.blockSoundType = <soundtype:metal>;
ReinforcedBlockDefault.blockHardness = 30.0; //default 5.0
ReinforcedBlockDefault.blockResistance = 20.0; //default 10
ReinforcedBlockDefault.register();

// Reinforced Rusty Iron Plate Block
val ReinforcedBlockRust = VanillaFactory.createBlock("iron_plate_rust_reinforced", <blockmaterial:iron>);
ReinforcedBlockRust.blockSoundType = <soundtype:metal>;
ReinforcedBlockRust.blockHardness = 30.0; //default 5.0
ReinforcedBlockRust.blockResistance = 20.0; //default 10
ReinforcedBlockRust.register();


// Reinforced Iron Slab Double
val ReinforcedBlockSlab = VanillaFactory.createBlock("iron_plate_slab_reinforced", <blockmaterial:iron>);
ReinforcedBlockSlab.blockSoundType = <soundtype:metal>;
ReinforcedBlockSlab.blockHardness = 30.0; //default 5.0
ReinforcedBlockSlab.blockResistance = 20.0; //default 10
ReinforcedBlockSlab.register();


// RLCraft Bliss and Blight music disks
VanillaFactory.createRecord("rlmusic_bliss");
VanillaFactory.createRecord("rlmusic_blight");


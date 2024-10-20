#loader preinit
import contentcreator.block.GenericBlock;
import crafttweaker.block.IMaterial as Mat;
import mods.contenttweaker.VanillaFactory;

val iron = Mat.iron();

// Reinforced Iron Stairs Block
GenericBlock.createStairs("iron_plate_stairs_reinforced", <blockstate:minecraft:iron_block>).register();
GenericBlock.createSlab(iron, "iron_plate_slab_reinforced").register();
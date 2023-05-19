#loader contenttweaker

import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Block;
import mods.contenttweaker.Item;
import mods.contenttweaker.Fluid;
import mods.contenttweaker.Color;

var bonePile = VanillaFactory.createBlock("bone_pile", <blockmaterial:rock>);
bonePile.setDropHandler(function(drops, world, position, state, fortune) {
    drops.clear();
    drops.add(<item:minecraft:skull:0> % 70);
    drops.add(<item:minecraft:skull:0> % 30);
	drops.add(<item:minecraft:bone> % 10);
	drops.add(<item:minecraft:bone> % 30);
	drops.add(<item:minecraft:bone> % 50);
	drops.add(<item:minecraft:bone> % 50);
	drops.add(<item:minecraft:bone>);
	drops.add(<item:minecraft:bone>);
    return;
});
bonePile.fullBlock = false;
bonePile.lightOpacity = 0;
bonePile.enumBlockRenderType = "MODEL";
bonePile.gravity = true;
bonePile.passable = true;
bonePile.blockLayer = "CUTOUT_MIPPED";
bonePile.replaceable = false;
bonePile.toolClass = "pickaxe";
bonePile.toolLevel = 0;
bonePile.blockHardness = 0.5;
bonePile.blockResistance = 0.5;
bonePile.blockSoundType = <soundtype:stone>;
bonePile.register();

var SteelAlloy = VanillaFactory.createItem("steel_alloy");
SteelAlloy.register();

var SteelNugget = VanillaFactory.createItem("steel_nugget");
SteelNugget.register();

var NeptuniumNugget = VanillaFactory.createItem("neptunium_nugget");
NeptuniumNugget.register();

var exampleItem = VanillaFactory.createItem("example_item");
exampleItem.register();

var CarrotJuice = VanillaFactory.createFluid("carrot_juice", Color.fromHex("FF7100"));
CarrotJuice.register();

var GlacierCREM = VanillaFactory.createItem("glacier_cream");
GlacierCREM.register();

var LeBloodTear = VanillaFactory.createItem("blood_tear");
LeBloodTear.register();

var TRACERCORE = VanillaFactory.createItem("sentient_core");
TRACERCORE.register();
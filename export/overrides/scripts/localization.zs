//TODO: Deprecate these with localizator		
							
<rustic:chili_pepper_seeds>.addTooltip("Fertile Seasons:");
<rustic:chili_pepper_seeds>.addTooltip(format.yellow(" Summer"));
<rustic:tomato_seeds>.addTooltip("Fertile Seasons:");
<rustic:tomato_seeds>.addTooltip(format.yellow(" Summer"));
<rustic:tomato_seeds>.addTooltip(format.gold(" Autumn"));

<minecraft:fishing_rod:*>.displayName = "Ancient Fishing Rod";
<advanced-fishing:blazing_fishing_pole:*>.displayName = "Ancient Lava Fishing Rod";
<iceandfire:fishing_spear:*>.displayName = "Ancient Fishing Spear";

<simpledifficulty:heater>.displayName = "Heating Coil";
<simpledifficulty:chiller>.displayName = "Cooling Coil";
<simpledifficulty:wool_helmet:*>.displayName = "Wool Hood";
<simpledifficulty:wool_chestplate:*>.displayName = "Wool Coat";
<simpledifficulty:wool_leggings:*>.displayName = "Wool Leggings";
<simpledifficulty:wool_boots:*>.displayName = "Wool Boots";

<notreepunching:rock/basalt>.displayName = "Basalt Rock";
<notreepunching:cobblestone/basalt>.displayName = "Basalt Cobblestone";

<betternether:bone_block>.displayName = "Smooth Bone Block";

<bountifulbaubles:reforger>.displayName = "Baubles Reforging Station";
<bountifulbaubles:ringiron>.displayName = "Holy Ring";

<variedcommodities:heart>.displayName = "Demonic Heart";
<variedcommodities:skull>.displayName = "Corrupted Skull";

<minecraft:saddle>.displayName = "Basic Saddle";

game.setLocalization("en_us", "tooltip.scripts.onlycrafting", "Only used for crafting!");
<minecraft:fishing_rod:*>.addTooltip(format.darkRed(game.localize("tooltip.scripts.onlycrafting","en_us")));
<advanced-fishing:blazing_fishing_pole:*>.addTooltip(format.darkRed(game.localize("tooltip.scripts.onlycrafting","en_us")));
<iceandfire:fishing_spear:*>.addTooltip(format.darkRed(game.localize("tooltip.scripts.onlycrafting","en_us")));

game.setLocalization("en_us", "tooltip.scripts.ozzyliner.destroys", " Destroyed upon removal!");
<armorunder:auto_chestplate_liner>.addTooltip(format.darkRed(game.localize("tooltip.scripts.ozzyliner.destroys", "en_us")));
<armorunder:auto_leggings_liner>.addTooltip(format.darkRed(game.localize("tooltip.scripts.ozzyliner.destroys", "en_us")));

game.setLocalization("en_us", "item.fish.cod.raw.name", "River Fish");
<minecraft:fish:0>.displayName = game.localize("item.fish.cod.raw.name", "en_us");
game.setLocalization("en_us", "item.fish.salmon.raw.name", "Mountain Fish");
<minecraft:fish:1>.displayName = game.localize("item.fish.salmon.raw.name", "en_us");
game.setLocalization("en_us", "item.fish.clownfish.raw.name", "Tropical Fish");
<minecraft:fish:2>.displayName = game.localize("item.fish.clownfish.raw.name", "en_us");
game.setLocalization("en_us", "item.fish.pufferfish.raw.name", "Ocean Fish");
<minecraft:fish:3>.displayName = game.localize("item.fish.pufferfish.raw.name", "en_us");
game.setLocalization("en_us", "item.fish.cod.cooked.name", "Cooked River Fish");
<minecraft:cooked_fish:0>.displayName = game.localize("item.fish.cod.cooked.name", "en_us");
game.setLocalization("en_us", "item.fish.salmon.cooked.name", "Cooked Mountain Fish");
<minecraft:cooked_fish:1>.displayName = game.localize("item.fish.salmon.cooked.name", "en_us");

game.setLocalization("en_us", "tooltip.quark:ancient_tome", "Use in off-hand to apply to matching enchanted item");
<quark:ancient_tome:*>.addTooltip(format.gold(game.localize("tooltip.quark:ancient_tome", "en_us")));

game.setLocalization("en_us", "tooltip.rlmixins:cleansing_talisman", "Craft with any enchanted book to convert the book's enchantment to Curse Break");
<rlmixins:cleansing_talisman>.addTooltip(format.gold(game.localize("tooltip.rlmixins:cleansing_talisman", "en_us")));

game.setLocalization("en_us", "tooltip.bountifulbaubles:amuletsinwrath", "A trophy lost to time, reminiscent of another world.");
<bountifulbaubles:amuletsinwrath>.addTooltip(format.darkPurple(game.localize("tooltip.bountifulbaubles:amuletsinwrath", "en_us")));

game.setLocalization("en_us", "tooltip.variedcommodities:heart", "One of many hearts dropped by Rahovart, still beating with demonic energy.");
<variedcommodities:heart>.addTooltip(format.green(game.localize("tooltip.variedcommodities:heart", "en_us")));
game.setLocalization("en_us", "tooltip.variedcommodities:skull", "One of many skulls dropped by Asmodeus, the lost souls inside can still be heard screaming.");
<variedcommodities:skull>.addTooltip(format.green(game.localize("tooltip.variedcommodities:skull", "en_us")));

//<locks:wood_lock>.addTooltip(format.green("Blast Resistance: Weak"));
//<locks:iron_lock>.addTooltip(format.green("Blast Resistance: Average"));
//<locks:gold_lock>.addTooltip(format.green("Blast Resistance: Weak"));
//<locks:steel_lock>.addTooltip(format.green("Blast Resistance: Strong"));
//<locks:diamond_lock>.addTooltip(format.green("Blast Resistance: Supreme"));

//END Deprecate these with localizator
SET NAMES utf8;

DELETE FROM areatrigger_scripts WHERE entry = 10243;
INSERT INTO areatrigger_scripts VALUE (10243, "areatrigger_at_foundry_iron_maidens_entrance");

SET @REF_SORKA = 77231;
SET @REF_GARAN = 77557;
SET @REF_MARAK = 77477;

UPDATE creature_template SET unit_flags = unit_flags & ~(0x200000 | 0x04), dmg_multiplier = 10, ScriptName = "boss_enforcer_sorka", mechanic_immune_mask = 617299839 WHERE entry = @REF_SORKA;
UPDATE creature_template SET unit_flags = unit_flags & ~(0x200000 | 0x04), dmg_multiplier = 10, ScriptName = "boss_admiral_garan", mechanic_immune_mask = 617299839 WHERE entry = @REF_GARAN;
UPDATE creature_template SET unit_flags = unit_flags & ~(0x200000 | 0x04), dmg_multiplier = 10, ScriptName = "boss_marak_the_blooded", mechanic_immune_mask = 617299839 WHERE entry = @REF_MARAK;

REPLACE INTO creature_equip_template (entry, id, itemEntry1, itemEntry2, itemEntry3) VALUE (@REF_SORKA, 1, 114966, 113965, 0);
REPLACE INTO creature_equip_template (entry, id, itemEntry1, itemEntry2, itemEntry3) VALUE (@REF_GARAN, 1, 0, 0, 112344);
REPLACE INTO creature_equip_template (entry, id, itemEntry1, itemEntry2, itemEntry3) VALUE (@REF_MARAK, 1, 114962, 114971, 0);

DELETE FROM `conversation_template` WHERE `Entry` IN (118, 119);
INSERT INTO `conversation_template` VALUES
(118, 30000, 3, "77557 77231 77477", "Iron Maidens - Intro"),
(119, 10000, 3, "0 77557 77231", "Iron Maidens - After Trashes");

DELETE FROM `conversation_lines` WHERE `Entry` IN (118, 119);
INSERT INTO `conversation_lines` VALUES
(118, 452, 87897, 0, 0, 256),
(118, 453, 87898, 0, 5853, 256),
(118, 454, 87921, 0, 9253, 257),
(118, 455, 87899, 0, 10849, 256),
(118, 456, 87937, 0, 14547, 258),
(118, 457, 87900, 0, 18421, 256),
(118, 458, 87922, 0, 21417, 1),
(118, 459, 87923, 0, 23600, 257),
(118, 460, 87902, 0, 27884, 256),
(119, 461, 87924, 0, 0, 258),
(119, 462, 87901, 0, 5316, 257),
(119, 463, 87925, 0, 8190, 2);

DELETE FROM npc_text WHERE ID IN (87897, 87898, 87921, 87899, 87937, 87900, 87922, 87923, 87902, 87924, 87901, 87925);
INSERT INTO npc_text (ID, SoundID, text0_0, text0_1) VALUE
(
    87897, 41824,
    "Patience, sisters. The sooner we finish our work, the sooner we crush our enemies.",
    "Patience, sisters. The sooner we finish our work, the sooner we crush our enemies."
),
(
    87898, 41825,
    "Sorka, ensure the peons are keeping pace!",
    "Sorka, ensure the peons are keeping pace!"
),
(
    87921, 41851,
    "My pleasure.",
    "My pleasure."
),
(
    87899, 41826,
    "Marak, load the ammunition into the main cannon!",
    "Marak, load the ammunition into the main cannon!"
),
(
    87937, 41710,
    "Right.",
    "Right."
),
(
    87900, 41827,
    "What? The trains are behind schedule?",
    "What? The trains are behind schedule?"
),
(
    87922, 41852,
    "I think I see the problem...",
    "I think I see the problem..."
),
(
    87923, 41853,
    "Let's see how well you trained our soldiers, Gar'an.",
    "Let's see how well you trained our soldiers, Gar'an."
),
(
    87902, 41829,
    "You insufferable...",
    "You insufferable..."
),
(
    87924, 41854,
    "What brutality... What bloodshed... Beautiful!",
    "What brutality... What bloodshed... Beautiful!"
),
(
    87901, 41828,
    "Sorka! This isn't a game! Get down there!",
    "Sorka! This isn't a game! Get down there!"
),
(
    87925, 41855,
    "Don't worry, I'm coming... this looks fun.",
    "Don't worry, I'm coming... this looks fun."
);

DELETE FROM locales_npc_text WHERE entry IN (87897, 87898, 87921, 87899, 87937, 87900, 87922, 87923, 87902, 87924, 87901, 87925);
--                                   French                      German                      Spanish                     Russian
INSERT INTO locales_npc_text (entry, Text0_0_loc2, Text0_1_loc2, Text0_0_loc3, Text0_1_loc3, Text0_0_loc6, Text0_1_loc6, Text0_0_loc8, Text0_1_loc8) VALUE
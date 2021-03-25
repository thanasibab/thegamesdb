/*
 Navicat MySQL Data Transfer

 Source Server         : thegamesdb
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : localhost
 Source Database       : thegamesdb

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : utf-8

 Date: 11/30/2017 23:49:38 PM
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `cart`
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) COLLATE utf8_bin NOT NULL,
  `game_id` int(11) DEFAULT NULL,
  `quantity` int(255) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `game_user` (`user_id`,`game_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `cart`
-- ----------------------------
BEGIN;
INSERT INTO `cart` VALUES ('1', 'kosta', '1', '3'), ('4', 'admin', '4', '3');
COMMIT;

-- ----------------------------
--  Table structure for `comments`
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) DEFAULT NULL,
  `game_id` int(11) DEFAULT NULL,
  `comment_date` datetime DEFAULT NULL,
  `comment_details` text,
  `ratings` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `comments`
-- ----------------------------
BEGIN;
INSERT INTO `comments` VALUES ('1', 'kosta', '4', '2017-11-30 23:12:10', 'ccxz adasasd', null), ('2', 'kosta', '5', '2017-11-22 23:12:13', 'that\'s a cool game', null), ('3', 'anonymous', '5', '2017-11-21 23:12:17', 'I love Donkey Kong', null), ('4', 'kosta', '5', '2017-11-22 23:12:20', 'Very cool game', null), ('5', 'kosta', '5', '2017-11-22 23:12:24', 'Very cool game', null), ('8', 'anonymous', '5', '2017-12-01 04:49:52', 'Thank you', null);
COMMIT;

-- ----------------------------
--  Table structure for `favorites`
-- ----------------------------
DROP TABLE IF EXISTS `favorites`;
CREATE TABLE `favorites` (
  `user_id` varchar(255) COLLATE utf8_bin NOT NULL,
  `game_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `favorites`
-- ----------------------------
BEGIN;
INSERT INTO `favorites` VALUES ('kosta', '1'), ('admin', '2'), ('admin', '5');
COMMIT;

-- ----------------------------
--  Table structure for `game`
-- ----------------------------
DROP TABLE IF EXISTS `game`;
CREATE TABLE `game` (
  `game_id` int(11) NOT NULL,
  `game_name` varchar(255) DEFAULT NULL,
  `game_description` text,
  `console` varchar(255) DEFAULT NULL,
  `num_players` varchar(255) DEFAULT NULL,
  `coop` varchar(255) DEFAULT NULL,
  `genre` varchar(255) DEFAULT NULL,
  `release_date` datetime DEFAULT NULL,
  `developer` varchar(255) DEFAULT NULL,
  `publisher` varchar(255) DEFAULT NULL,
  `front_box_art` varchar(255) DEFAULT NULL,
  `back_box_art` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `developer_logo` varchar(255) DEFAULT NULL,
  `price` decimal(7,2) DEFAULT '0.00',
  `discount` decimal(7,2) DEFAULT '0.00',
  PRIMARY KEY (`game_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `game`
-- ----------------------------
BEGIN;
INSERT INTO `game` VALUES ('1', 'Halo: Combat Evolved', 'In Halo\'s twenty-sixth century setting, the player assumes the role of the Master Chief, a cybernetically enhanced super-soldier. The player is accompanied by Cortana, an artificial intelligence who occupies the Master Chief\'s neural interface. Players ba', 'PC', '1', null, 'Shooter ', '2001-01-11 00:00:00', 'Bungie ', '', 'http://thegamesdb.net/banners/_gameviewcache/boxart/original/front/1-1.jpg', null, null, null, '24.99', '5.00'), ('2', 'Crysis', 'From the makers of Far Cry, Crysis offers FPS fans the best-looking, most highly-evolving gameplay, requiring the player to use adaptive tactics and total customization of weapons and armor to survive in dynamic, hostile environments including Zero-G. \n\nE', 'PC', '4', 'No', 'Shooter ', '2007-01-11 00:00:00', 'Crytek', 'Electronic Arts', 'http://thegamesdb.net/banners/_gameviewcache/boxart/original/front/2-1.jpg', null, null, null, '59.99', '0.00'), ('4', 'Star Fox 64', 'The Lylat system has been invaded! Join Fox McCloud and his Star Fox team as they fight to save the galaxy from the clutches of the evil Andross. Travel to many different 3-D worlds. Battle the enemy in the air and on the ground and listen in as Fox McClo', 'Nintendo 64', '4', null, 'Action, Shooter ', '1997-01-06 00:00:00', 'Nintendo', '', 'http://thegamesdb.net/banners/_gameviewcache/boxart/original/front/4-1.jpg', null, null, null, '59.99', '0.00'), ('5', 'Donkey Kong', 'Can you save Mario\'s girl from the clutches of Donkey Kong? Donkey Kong has kidnapped Mario\'s girlfriend Pauline and taken her to the top of a construction site. It\'s up to you to help Mario save Pauline before time runs out. But it won\'t be easy. Donkey ', 'Nintendo Entertainment System (NES)', '2', 'No', 'Action ', '1982-01-01 00:00:00', 'Nintendo ', '', 'http://thegamesdb.net/banners/_gameviewcache/boxart/original/front/5-2.jpg', null, null, null, '59.99', '10.00'), ('6', 'Tapper', 'Tapper, also known as Root Beer Tapper, is a 1983 arcade game released by Bally Midway. The goal of the game is to serve beer and collect empty mugs and tips. ', 'Arcade', '1', null, 'Action ', '1983-01-01 00:00:00', 'Marvin Glass and Associates ', 'Playdough', 'http://thegamesdb.net/banners/_gameviewcache/boxart/original/front/6-1.jpg', null, null, null, '59.99', '10.99'), ('9', 'Halo 2', 'Halo 2 is the sequel to the highly successful and critically acclaimed Halo®: Combat Evolved. In Halo 2, the saga continues as Master Chief—a genetically enhanced super-soldier—is the only thing standing between the relentless Covenant and the destruction', 'PC', '2', null, 'Action, Shooter ', '2007-01-05 00:00:00', 'Bungie ', '', 'http://thegamesdb.net/banners/_gameviewcache/boxart/original/front/9-2.jpg', null, null, null, '59.99', '20.99'), ('10', 'Ace Combat 6: Fires of Liberation', 'Throughout Ace Combat 6, the player must pilot a fighter jet or other aircraft to destroy foes both in the air and on the ground. As an arcade flight game, it simplifies flight controls and gives the player a large amount of bullets, missiles and other we', 'Microsoft Xbox 360', '1', 'No', 'Flight Simulator ', '2007-01-10 00:00:00', 'Namco ', '', 'http://thegamesdb.net/banners/_gameviewcache/boxart/original/front/10-1.jpg', null, null, null, '59.99', '0.00'), ('11', 'Army of Two', 'Focusing on cooperative strategies, Army of Two\'s main feature is the necessity to use coordinated teamwork to accomplish the game\'s goals. While the game is meant to be played with another human as a partner, a \"Partner Artificial Intelligence\" (PAI) is ', 'Microsoft Xbox 360', '2', 'Yes', 'Action, Shooter ', '2008-04-03 00:00:00', 'EA Montreal ', '', 'http://thegamesdb.net/banners/_gameviewcache/boxart/original/front/11-1.jpg', null, null, null, '59.99', '0.00'), ('12', 'Assassin\'s Creed', 'The game centers on the use of a machine named the \"Animus\", which allows the viewing of the protagonist\'s genetic memories of his ancestors.\n\nThrough this plot device, details emerge of a struggle between two factions, the Knights Templar and the Assassi', 'PC', '1', 'No', 'Action, Adventure, Sandbox ', '2008-09-04 00:00:00', 'Ubisoft Montreal ', '', 'http://thegamesdb.net/banners/_gameviewcache/boxart/original/front/12-1.jpg', null, null, null, '59.99', '0.00'), ('13', 'BioShock', 'Set in an alternate history 1960, the game places the player in the role of a plane crash survivor named Jack, who must explore the underwater city of Rapture, and survive attacks by the mutated beings and mechanical drones that populate it. The game inco', 'PC', '1', null, 'Action, Shooter ', '2007-01-08 00:00:00', 'Irrational Games ', '', 'http://thegamesdb.net/banners/_gameviewcache/boxart/original/front/13-1.jpg', null, null, null, '27.00', '0.00'), ('14', 'Dead Space', 'The player takes on the role of an engineer named Isaac Clarke, who battles a polymorphic, virus-like, alien infestation which turns humans into grotesque alien monsters called \"Necromorphs\", on board a stricken interstellar mining ship named the USG Ishi', 'PC', '1', 'No', 'Shooter ', '2008-01-10 00:00:00', 'Visceral Games ', '', 'http://thegamesdb.net/banners/_gameviewcache/boxart/original/front/14-2.jpg', null, null, null, '59.99', '0.00'), ('15', 'Devil May Cry', 'Set in modern times on the fictional Mallet Island, the story centers on the characters Dante and Trish and their quest to confront the demon lord Mundus. The story is told primarily through a mixture of cutscenes, which use the game\'s engine and several ', 'Sony Playstation 2', '1', 'No', 'Action ', '2001-01-10 00:00:00', 'Capcom ', '', 'http://thegamesdb.net/banners/_gameviewcache/boxart/original/front/15-1.jpg', null, null, null, '59.99', '0.00'), ('16', 'Devil May Cry 3: Dante\'s Awakening', 'Set in modern times in an enchanted tower named Temen-ni-gru, the story centers on the dysfunctional relationship between Dante and his brother Vergil. The events of the game take place just as Dante has opened up the Devil May Cry agency, and before Dant', 'Sony Playstation 2', '1', 'No', 'Action ', '2005-01-02 00:00:00', 'Capcom ', '', 'http://thegamesdb.net/banners/_gameviewcache/boxart/original/front/16-2.jpg', null, null, null, '59.99', '20.00'), ('17', 'Devil May Cry 4', 'In the game, the player controls both Nero and Dante, and fights enemies in close combat using firearms, swords, and other weapons. The characters Lady and Trish from previous games in the series make appearances, along with new characters Nero, Kyrie, Cr', 'Sony Playstation 3', '1', 'No', 'Action, Horror, Role-Playing ', '2008-05-02 00:00:00', 'Capcom ', '', 'http://thegamesdb.net/banners/_gameviewcache/boxart/original/front/17-2.jpg', null, null, null, '59.99', '0.00'), ('18', 'Driver: Parallel Lines', 'Diverging from previous Driver games, Parallel Lines takes place in just one city, New York, instead of multiple cities, but in the middle of the story you change to different eras of the city - 1978 and 2006. Due to the underwhelming performance of Driv3', 'PC', 'N/A', 'No', 'Racing ', '2007-01-06 00:00:00', 'Reflections Interactive', 'Ubisoft', 'http://thegamesdb.net/banners/_gameviewcache/boxart/original/front/18-1.jpg', null, null, null, '59.99', '0.00'), ('19', 'Final Fantasy X-2', 'The game\'s story follows the character Yuna from Final Fantasy X as she seeks to resolve political conflicts in the fictional world of Spira before it leads to war.\n\nThe story begins as Yuna, Rikku and Paine recover Yuna\'s stolen Garment Grid from the Leb', 'Sony Playstation 2', '1', 'No', 'Role-Playing ', '2003-01-11 00:00:00', 'Enix,Square Enix ', '', 'http://thegamesdb.net/banners/_gameviewcache/boxart/original/front/19-1.jpg', null, null, null, '59.99', '0.00'), ('20', 'Final Fantasy X', 'There are seven main playable characters in Final Fantasy X. Tidus is a cheerful young teenager and the star blitzball player for the Zanarkand Abes. He has long resented his father, a renowned blitzball player who disappeared during Tidus\'s youth. Yuna i', 'Sony Playstation 2', '1', 'No', 'Role-Playing ', '2001-01-12 00:00:00', 'Squaresoft ', '', 'http://thegamesdb.net/banners/_gameviewcache/boxart/original/front/20-1.jpg', null, null, null, '59.99', '0.00'), ('21', 'Final Fantasy XIII', 'Final Fantasy XIII is a console role-playing video game developed and published by Square Enix for the PlayStation 3 and Xbox 360. Released in 2009 in Japan and North America and PAL regions in March 2010, it is the thirteenth major installment in the Fin', 'Sony Playstation 3', '1', 'No', 'Role-Playing ', '2010-09-03 00:00:00', 'Square Enix ', '', 'http://thegamesdb.net/banners/_gameviewcache/boxart/original/front/21-1.jpg', null, null, null, '59.99', '0.00'), ('22', 'Left 4 Dead', 'From Valve (the creators of Counter-Strike, Half-Life and more) comes Left 4 Dead, a co-op action horror game for the PC and Xbox 360 that casts up to four players in an epic struggle for survival against swarming zombie hordes and terrifying mutant monst', 'PC', '4', 'Yes', 'Horror, Shooter ', '2008-01-11 00:00:00', 'Valve Corporation ', '', 'http://thegamesdb.net/banners/_gameviewcache/boxart/original/front/22-1.jpg', null, null, null, '59.99', '0.00'), ('23', 'Gears of War', 'The game focuses on the troops of Delta Squad as they fight to save the human inhabitants of the fictional planet Sera from a relentless subterranean enemy known as the Locust Horde. The player assumes the role of Marcus Fenix, a former prisoner and war-h', 'PC', '2', 'Yes', 'Shooter ', '2006-07-11 00:00:00', 'Epic ', '', 'http://thegamesdb.net/banners/_gameviewcache/boxart/original/front/23-1.jpg', null, null, null, '59.99', '0.00'), ('24', 'Gears of War 2', 'In Gears of War 2, The COG continues its fight against the Locust horde, who are attempting to sink all of the cities on the planet Sera by using a big riftworm to eat the ground beneath them. Sergeant Marcus Fenix leads Delta Squad into the depths of the', 'Microsoft Xbox 360', '2', 'Yes', 'Action, Shooter ', '2008-07-11 00:00:00', 'Epic Games ', '', 'http://thegamesdb.net/banners/_gameviewcache/boxart/original/front/24-1.jpg', null, null, null, '59.99', '17.00'), ('25', 'God Hand', 'THERE AIN\'T NO JUSTICE IN THE\nWILD, WEIRD WEST. JUST YOU.\nThings can\'t get any worse after demonic thugs cut your arm off, right? Dead wrong, partner. The lady you saved from them has only gone and given you the legendary GOD HAND as a replacement - the u', 'Sony Playstation 2', '1', 'No', 'Action, Fighting ', '2006-10-10 00:00:00', 'Clover Studio ', '', 'http://thegamesdb.net/banners/_gameviewcache/boxart/original/front/25-1.jpg', null, null, null, '59.99', '0.00'), ('26', 'God of War', 'This action/adventure/combat game makes powerful use of the darkly imaginative world of Ancient Greek mythology, where the realms of the mortal and the divine collide in a pervasive atmosphere of brute force and violence. Playing as Kratos, throughout the', 'Sony Playstation 2', '1', 'No', 'Action, Platform ', '2005-01-03 00:00:00', 'SCE Santa Monica Studio ', '', 'http://thegamesdb.net/banners/_gameviewcache/boxart/original/front/26-2.jpg', null, null, null, '59.99', '0.00'), ('27', 'Golden Axe: Beast Rider', 'Beast Rider is the first Golden Axe game in 3D as opposed to side scrolling hack and slash. While this is a major shift in game style from the previous games, Beast Rider maintains many of the elements from the originals such as magic and riding beasts, a', 'Microsoft Xbox 360', 'N/A', 'No', 'Action, Adventure ', '2008-01-10 00:00:00', 'Secret Level ', '', 'http://thegamesdb.net/banners/_gameviewcache/boxart/original/front/27-1.jpg', null, null, null, '59.99', '0.00'), ('28', 'Race Driver: Grid', 'The game begins with the player accepting jobs to drive for other teams to earn money, and once the player gains enough capital they can purchase their own vehicles and drive independently, as well as continuing to drive for other teams should they choose', 'PC', 'N/A', 'No', 'Racing ', '2008-01-05 00:00:00', 'Codemasters Studios ', '', 'http://thegamesdb.net/banners/_gameviewcache/boxart/original/front/28-1.jpg', null, null, null, '59.99', '0.00'), ('29', 'Grand Theft Auto IV', 'For Niko Bellic, fresh off the boat from Europe, it is the hope he can escape his past. For his cousin, Roman, it is the vision that together they can find fortune in Liberty City, gateway to the land of opportunity. As they slip into debt and are dragged', 'PC', 'N/A', 'No', 'Action, Adventure, Shooter ', '2008-02-12 00:00:00', 'Rockstar North ', '', 'http://thegamesdb.net/banners/_gameviewcache/boxart/original/front/29-1.jpg', null, null, null, '59.99', '23.00'), ('54', 'Tom Clancy\'s Rainbow Six: Vegas', 'Rainbow Six Vegas changes the series with multiple new features, such as a new health system where the player regenerates health while not taking fire (it should be noted that the player may sometimes be killed instantly, without a chance to regenerate he', 'PC', 'N/A', 'No', 'Action, Shooter ', '2006-01-11 00:00:00', 'Ubisoft ', '', 'http://thegamesdb.net/banners/_gameviewcache/boxart/original/front/54-1.jpg', null, null, null, '59.99', '20.99'), ('55', 'Command & Conquer: Red Alert 3', 'The game is set in a parallel universe in which World War II never happened—in the original Red Alert, Albert Einstein travelled back in time and removed Hitler in the 1920s. After an Allied victory in Red Alert 2, the Soviet leaders travelled back in tim', 'PC', 'N/A', 'No', 'Strategy ', '2008-01-10 00:00:00', 'EA LA ', '', 'http://thegamesdb.net/banners/_gameviewcache/boxart/original/front/55-1.jpg', null, null, null, '59.99', '0.00'), ('56', 'Resident Evil 4', 'U.S. agent Leon Kennedy has been tasked to look into the abduction of the President\'s daughter and his investigation has led him to a mysterious location in Europe. As Leon encounters unimaginable horrors, he must find out what is behind the terror. ', 'Nintendo GameCube', '1', 'No', 'Action, Adventure, Horror ', '2005-11-01 00:00:00', 'Capcom ', '', 'http://thegamesdb.net/banners/_gameviewcache/boxart/original/front/56-2.jpg', null, null, null, '59.99', '0.00'), ('57', 'Resident Evil 5', 'Produced by series veteran Jun Takeuchi, this next-generation follow-up to the terrifying series introduces the theme of escape as its core survival instinct. As Chris Redfield (former S.T.A.R.S. member and now part of the BSAA unit), your life is in dang', 'PC', '2', 'Yes', 'Action, Shooter ', '2009-01-09 00:00:00', 'Capcom ', '', 'http://thegamesdb.net/banners/_gameviewcache/boxart/original/front/57-2.jpg', null, null, null, '59.99', '0.00'), ('58', 'Resident Evil Archives: Resident Evil 0', 'The game\'s storyline serves as a prequel to Resident Evil, covering Rebecca Chambers\' ordeal a day prior. \n\nOn July 23, 1998, special police STARS Bravo team is sent in to investigate a series of grisly murders in the Arklay Mountains region outside of Ra', 'Nintendo Wii', '1', 'No', 'Horror, Shooter ', '2009-01-12 00:00:00', 'Capcom ', '', 'http://thegamesdb.net/banners/_gameviewcache/boxart/original/front/58-1.jpg', null, null, null, '59.99', '0.00'), ('66', 'Tomb Raider', 'In Tomb Raider, the player controls the female archaeologist Lara Croft, in search for the three mysterious Scion artefacts across the world. The game is presented in third person perspective. Lara is always visible and the camera follows the action from ', 'PC', '1', 'No', 'Action, Adventure ', '1996-01-11 00:00:00', 'Core Design ', '', 'http://thegamesdb.net/banners/_gameviewcache/boxart/original/front/66-1.jpg', null, null, null, '59.99', '0.00'), ('67', 'Tomb Raider: Underworld', 'Tomb Raider: Underworld begins where its predecessor left off, with Lara Croft searching for the mythical resting place of King Arthur, Avalon. Underneath the Mediterranean Sea Lara discovers Thor\'s gauntlet and then has an encounter with an old enemy, Ja', 'PC', '1', 'No', 'Action, Adventure ', '2008-01-11 00:00:00', 'Eidos Interactive ', '', 'http://thegamesdb.net/banners/_gameviewcache/boxart/original/front/67-2.jpg', null, null, null, '59.99', '0.00'), ('68', 'Turok: Dinosaur Hunter', 'Much like your usual 1st person shooter, although with dinosaurs as your main enemy. Includes 14 high tech weapons, like the Quad Rocket Launcher and the Atomic Fusion Cannon. You control Turok, who must take on the Campaigner and his highly evolved dino\'', 'Nintendo 64', '1', 'No', 'Shooter ', '1997-04-03 00:00:00', 'Iguana Entertainment ', '', 'http://thegamesdb.net/banners/_gameviewcache/boxart/original/front/68-1.jpg', null, null, null, '59.99', '0.00'), ('69', 'Ultimate Ghosts \'n Goblins', 'An exclusive PSP edition of Capcom\'s legendary platforming game, directed by the original\'s creator Tokurou Fujiwara. The game makes use of a 3D graphics engine, giving depth to the visuals, but plays in a side-scrolling perspective and similar art design', 'Sony Playstation Portable', '1', 'No', 'Action, Platform ', '2006-01-08 00:00:00', 'Capcom ', '', 'http://thegamesdb.net/banners/_gameviewcache/boxart/original/front/69-1.jpg', null, null, null, '59.99', '0.00'), ('70', 'Uncharted: Drake\'s Fortune', 'A 400-year-old clue in the coffin of Sir Francis Drake sets a modern-day fortune hunter on an exploration for the fabled treasure of El Dorado, leading to the discovery of a forgotten island in the middle of the Pacific Ocean. The search turns deadly when', 'Sony Playstation 3', '1', 'No', 'Action, Adventure ', '2007-01-11 00:00:00', 'Naughty Dog ', '', 'http://thegamesdb.net/banners/_gameviewcache/boxart/original/front/70-1.jpg', null, null, null, '59.99', '0.00'), ('79', 'Command & Conquer 3: Kane\'s Wrath', 'In the name of Kane! The Command & Conquer™ series continues to thrive with Command & Conquer™ 3: Kane’s Wrath. As the expansion pack to the critically-acclaimed and fan favorite, Command & Conquer 3: Tiberium Wars™, this Real-time Strategy (RTS) game ret', 'PC', 'N/A', 'No', 'Construction and Management Simulation ', '2008-01-03 00:00:00', 'EA Los Angeles ', '', 'http://thegamesdb.net/banners/_gameviewcache/boxart/original/front/79-1.jpg', null, null, null, '59.99', '0.00'), ('80', 'Command & Conquer 3: Tiberium Wars', 'Tiberium Wars takes place in the year 2047, at the advent of and during the \"Third Tiberium War\" when the Brotherhood of Nod launches a worldwide offensive against the Global Defense Initiative, abruptly ending 17 years of silence and crippling GDI forces', 'PC', '1', 'No', 'Strategy ', '2007-01-03 00:00:00', 'Electronic Arts Los Angeles ', '', 'http://thegamesdb.net/banners/_gameviewcache/boxart/original/front/80-1.jpg', null, null, null, '59.99', '0.00'), ('81', 'Crisis Core: Final Fantasy VII', 'Seven years prior to the events of FINAL FANTASY VII, the Shinra Company is finalizing construction of its base and symbol of prosperity: the enormous city of Midgar. When Genesis, a prominent SOLDIER 1st Class in Shinra\'s private army disappears with his', 'Sony Playstation Portable', '1', 'No', 'Action, Role-Playing ', '2008-01-03 00:00:00', 'Square Enix ', '', 'http://thegamesdb.net/banners/_gameviewcache/boxart/original/front/81-1.jpg', null, null, null, '59.99', '0.00'), ('83', 'Final Fantasy III', 'Ages ago, evil beings created powerful creatures called Espers, and unleashed them against each other. The resulting battles left their world a smoldering rubble. Legend has it, the Espers destroyed themselves and most of humanity. Magic disappeared forev', 'Super Nintendo (SNES)', '1', 'No', 'Role-Playing ', '1994-02-04 00:00:00', 'Squaresoft ', '', 'http://thegamesdb.net/banners/_gameviewcache/boxart/original/front/83-1.jpg', null, null, null, '59.99', '0.00'), ('84', 'Empire Earth III', 'Empire Earth III is a real-time strategy video game developed by Mad Doc Software and published by Sierra Entertainment, released on November 6, 2007.[1][2][3] It is the latest installment of the Empire Earth series and has generally received widespread n', 'PC', 'N/A', 'No', 'Construction and Management Simulation, Strategy ', '2007-06-11 00:00:00', 'Mad Doc Software ', '', 'http://thegamesdb.net/banners/_gameviewcache/boxart/original/front/84-1.jpg', null, null, null, '59.99', '0.00'), ('86', 'Fallout 3', 'Fallout 3 takes place in the year 2277, 36 years after the setting of Fallout 2 and 200 years after the nuclear apocalypse that devastated the game\'s world in a future where international conflicts culminated in a Sino-American war in the second half of t', 'PC', '1', 'No', 'Action, Adventure, Role-Playing, Shooter ', '2008-01-10 00:00:00', 'Bethesda Game Studios ', '', 'http://thegamesdb.net/banners/_gameviewcache/boxart/original/front/86-1.jpg', null, null, null, '59.99', '0.00'), ('87', 'Final Fantasy XII', 'Final Fantasy XII takes place in the fictional location of Ivalice, where the empires of Archadia and Rozarria are waging an endless war. Dalmasca, a small kingdom, is caught between the warring nations. When Dalmasca becomes annexed by Archadia, its prin', 'Sony Playstation 2', '1', 'No', 'Role-Playing ', '2006-01-03 00:00:00', 'Square Enix ', '', 'http://thegamesdb.net/banners/_gameviewcache/boxart/original/front/87-2.jpg', null, null, null, '59.99', '0.00'), ('88', 'God of War II', 'Kratos is now the God of War, having defeated the Olympian god Ares. Shunned by the other gods and still haunted by nightmares from his past, Kratos decides to join an army of Spartans in an attack on the city of Rhodes. Kratos also ignores a warning from', 'Sony Playstation 2', '1', 'No', 'Action, Platform ', '2007-01-03 00:00:00', 'SCE Santa Monica Studio ', '', 'http://thegamesdb.net/banners/_gameviewcache/boxart/original/front/88-1.jpg', null, null, null, '59.99', '0.00'), ('89', 'God of War: Chains of Olympus', 'The game is set in Ancient Greece and loosely based on its mythology. The player controls Kratos, a Spartan warrior in the service of the Olympian Gods. Kratos is guided by the goddess Athena, who instructs him to find the Sun God Helios, as the Dream God', 'Sony Playstation Portable', '1', 'No', 'Action, Adventure ', '2008-04-03 00:00:00', 'Ready at Dawn ', '', 'http://thegamesdb.net/banners/_gameviewcache/boxart/original/front/89-1.jpg', null, null, null, '59.99', '0.00'), ('90', 'Halo 3', 'Master Chief returns to a Covenant Dominated Earth on a mission to kill the final alien leader. Meanwhile, the Arbiter, Johnson, and Keyes form a loose alliance and escape from Delta Halo. The Covenant is ripped in civil war, and the Elites along with a h', 'Microsoft Xbox 360', '2', 'Yes', 'Shooter ', '2007-01-09 00:00:00', 'Bungie ', '', 'http://thegamesdb.net/banners/_gameviewcache/boxart/original/front/90-1.jpg', null, null, null, '59.99', '0.00'), ('91', 'Iron Man', 'Iron Man is a 2008 video game based on the film of the same name as well as the classic iterations of the character.[2] It was released on May 2, 2008 to coincide with the release of the film in cinemas. The game is published by Sega, and was released on ', 'PC', 'N/A', 'No', 'Action, Adventure ', '2008-06-05 00:00:00', 'Artificial Mind and Movement ', '', 'http://thegamesdb.net/banners/_gameviewcache/boxart/original/front/91-1.jpg', null, null, null, '59.99', '0.00'), ('92', 'Medal of Honor: Airborne', 'The game begins as Boyd Travers, a member of the 82nd Airborne Division of the U.S. Army, begins his first mission in the Invasion of Sicily in 1943. The story begins with a brief training level, but then takes you to the first mission: \"Operation Husky\".', 'PC', 'N/A', 'No', 'Shooter ', '2007-01-09 00:00:00', 'EA ', '', 'http://thegamesdb.net/banners/_gameviewcache/boxart/original/front/92-2.jpg', null, null, null, '59.99', '0.00'), ('93', 'Monster Hunter 2', 'Monster Hunter 2 has an improved weapon tree and upgradeable armors. As in all Monster Hunter games, armor pieces can be worn to obtain skills and abilities. A new feature in Monster Hunter 2 is the use of gems. Gems add skill points to complement those a', 'Sony Playstation 2', 'N/A', 'No', 'Action, Role-Playing ', '2006-01-02 00:00:00', 'Capcom ', '', 'http://thegamesdb.net/banners/_gameviewcache/boxart/original/front/93-1.jpg', null, null, null, '59.99', '0.00'), ('99', 'Soul Calibur IV', 'Soulcalibur IV (ソウルキャリバーIV SōruKyaribā Fō?) is the fifth installment in Namco\'s Soul series of fighting games, released for the PlayStation 3 and Xbox 360 in 2008. Soulcalibur IV included three characters from the Star Wars franchise as playable fighters.', 'Microsoft Xbox 360', 'N/A', 'No', 'Fighting ', '2008-01-07 00:00:00', 'Namco ', '', 'http://thegamesdb.net/banners/_gameviewcache/boxart/original/front/99-1.jpg', null, null, null, '59.99', '0.00');
COMMIT;

-- ----------------------------
--  Table structure for `purchaseHistory`
-- ----------------------------
DROP TABLE IF EXISTS `purchaseHistory`;
CREATE TABLE `purchaseHistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) COLLATE utf8_bin NOT NULL,
  `total` double NOT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL DEFAULT '0',
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `credit_card_type` varchar(255) DEFAULT NULL,
  `credit_card_cvv` varchar(255) DEFAULT NULL,
  `credit_card_expiry` varchar(255) DEFAULT NULL,
  `last_login` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tempPass` varchar(255) DEFAULT '0',
  `locked` int(255) DEFAULT '0',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Records of `user`
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('admin', 'admin', '1', 'Mr. Admin', 'Adminoulis', '', '', '', 'Montreal', '', '', '', '', '', '', '2017-12-01 02:12:43', '2017-11-01 18:27:17', '0', '0'), ('george', 'george', '0', 'George', 'Michael', 'george.concordia@mailinator.com', '456 George Street', '', 'Vancouver', 'BC', 'V1K2G1', 'Canada', 'MasterCard', '1512', '1/1', '2017-11-05 01:44:42', '2017-11-29 13:59:51', '0', '0'), ('kosta', 'kosta', '0', 'Konstantinos', 'Psimoulis', 'kpsimoulis@mailinator.com', '123 Main Street', '', 'Montreal', 'QC', '', 'Canada', 'MasterCard', '354', '5/7', '2017-12-01 04:07:18', '2017-12-01 02:51:58', '0', '0');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

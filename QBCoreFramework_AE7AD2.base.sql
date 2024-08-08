-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for qbcoreframework_ae7ad2
CREATE DATABASE IF NOT EXISTS `qbcoreframework_ae7ad2` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;
USE `qbcoreframework_ae7ad2`;

-- Dumping structure for table qbcoreframework_ae7ad2.apartments
CREATE TABLE IF NOT EXISTS `apartments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `citizenid` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcoreframework_ae7ad2.apartments: ~0 rows (approximately)
INSERT IGNORE INTO `apartments` (`id`, `name`, `type`, `label`, `citizenid`) VALUES
	(1, 'apartment35791', 'apartment3', 'Integrity Way 5791', 'ISA70238');

-- Dumping structure for table qbcoreframework_ae7ad2.bank_accounts
CREATE TABLE IF NOT EXISTS `bank_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) DEFAULT NULL,
  `account_name` varchar(50) DEFAULT NULL,
  `account_balance` int(11) NOT NULL DEFAULT 0,
  `account_type` enum('shared','job','gang') NOT NULL,
  `users` longtext DEFAULT '[]',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `account_name` (`account_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcoreframework_ae7ad2.bank_accounts: ~0 rows (approximately)

-- Dumping structure for table qbcoreframework_ae7ad2.bank_statements
CREATE TABLE IF NOT EXISTS `bank_statements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) DEFAULT NULL,
  `account_name` varchar(50) DEFAULT 'checking',
  `amount` int(11) DEFAULT NULL,
  `reason` varchar(50) DEFAULT NULL,
  `statement_type` enum('deposit','withdraw') DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcoreframework_ae7ad2.bank_statements: ~0 rows (approximately)

-- Dumping structure for table qbcoreframework_ae7ad2.bans
CREATE TABLE IF NOT EXISTS `bans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `expire` int(11) DEFAULT NULL,
  `bannedby` varchar(255) NOT NULL DEFAULT 'LeBanhammer',
  PRIMARY KEY (`id`),
  KEY `license` (`license`),
  KEY `discord` (`discord`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcoreframework_ae7ad2.bans: ~0 rows (approximately)

-- Dumping structure for table qbcoreframework_ae7ad2.crypto
CREATE TABLE IF NOT EXISTS `crypto` (
  `crypto` varchar(50) NOT NULL DEFAULT 'qbit',
  `worth` int(11) NOT NULL DEFAULT 0,
  `history` text DEFAULT NULL,
  PRIMARY KEY (`crypto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcoreframework_ae7ad2.crypto: ~0 rows (approximately)

-- Dumping structure for table qbcoreframework_ae7ad2.crypto_transactions
CREATE TABLE IF NOT EXISTS `crypto_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `message` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcoreframework_ae7ad2.crypto_transactions: ~0 rows (approximately)

-- Dumping structure for table qbcoreframework_ae7ad2.dealers
CREATE TABLE IF NOT EXISTS `dealers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `coords` longtext DEFAULT NULL,
  `time` longtext DEFAULT NULL,
  `createdby` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcoreframework_ae7ad2.dealers: ~0 rows (approximately)

-- Dumping structure for table qbcoreframework_ae7ad2.gloveboxitems
CREATE TABLE IF NOT EXISTS `gloveboxitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) NOT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`plate`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table qbcoreframework_ae7ad2.gloveboxitems: ~0 rows (approximately)

-- Dumping structure for table qbcoreframework_ae7ad2.houselocations
CREATE TABLE IF NOT EXISTS `houselocations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `coords` text DEFAULT NULL,
  `owned` tinyint(1) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `tier` tinyint(4) DEFAULT NULL,
  `garage` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcoreframework_ae7ad2.houselocations: ~0 rows (approximately)

-- Dumping structure for table qbcoreframework_ae7ad2.house_plants
CREATE TABLE IF NOT EXISTS `house_plants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `building` varchar(50) DEFAULT NULL,
  `stage` int(11) DEFAULT 1,
  `sort` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `food` int(11) DEFAULT 100,
  `health` int(11) DEFAULT 100,
  `progress` int(11) DEFAULT 0,
  `coords` text DEFAULT NULL,
  `plantid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `building` (`building`),
  KEY `plantid` (`plantid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcoreframework_ae7ad2.house_plants: ~0 rows (approximately)

-- Dumping structure for table qbcoreframework_ae7ad2.inventories
CREATE TABLE IF NOT EXISTS `inventories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) NOT NULL,
  `items` longtext DEFAULT '[]',
  PRIMARY KEY (`identifier`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcoreframework_ae7ad2.inventories: ~0 rows (approximately)

-- Dumping structure for table qbcoreframework_ae7ad2.lapraces
CREATE TABLE IF NOT EXISTS `lapraces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `checkpoints` text DEFAULT NULL,
  `records` text DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `raceid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `raceid` (`raceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcoreframework_ae7ad2.lapraces: ~0 rows (approximately)

-- Dumping structure for table qbcoreframework_ae7ad2.management_outfits
CREATE TABLE IF NOT EXISTS `management_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `minrank` int(11) NOT NULL DEFAULT 0,
  `name` varchar(50) NOT NULL DEFAULT 'Cool Outfit',
  `gender` varchar(50) NOT NULL DEFAULT 'male',
  `model` varchar(50) DEFAULT NULL,
  `props` varchar(1000) DEFAULT NULL,
  `components` varchar(1500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcoreframework_ae7ad2.management_outfits: ~0 rows (approximately)

-- Dumping structure for table qbcoreframework_ae7ad2.mdt_bolos
CREATE TABLE IF NOT EXISTS `mdt_bolos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `individual` varchar(50) DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `gallery` text DEFAULT NULL,
  `officersinvolved` text DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) NOT NULL DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcoreframework_ae7ad2.mdt_bolos: ~0 rows (approximately)

-- Dumping structure for table qbcoreframework_ae7ad2.mdt_bulletin
CREATE TABLE IF NOT EXISTS `mdt_bulletin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `desc` text NOT NULL,
  `author` varchar(50) NOT NULL,
  `time` varchar(20) NOT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcoreframework_ae7ad2.mdt_bulletin: ~0 rows (approximately)

-- Dumping structure for table qbcoreframework_ae7ad2.mdt_clocking
CREATE TABLE IF NOT EXISTS `mdt_clocking` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL DEFAULT '',
  `firstname` varchar(255) NOT NULL DEFAULT '',
  `lastname` varchar(255) NOT NULL DEFAULT '',
  `clock_in_time` varchar(255) NOT NULL DEFAULT '',
  `clock_out_time` varchar(50) DEFAULT NULL,
  `total_time` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcoreframework_ae7ad2.mdt_clocking: ~0 rows (approximately)

-- Dumping structure for table qbcoreframework_ae7ad2.mdt_convictions
CREATE TABLE IF NOT EXISTS `mdt_convictions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` varchar(50) DEFAULT NULL,
  `linkedincident` int(11) NOT NULL DEFAULT 0,
  `warrant` varchar(50) DEFAULT NULL,
  `guilty` varchar(50) DEFAULT NULL,
  `processed` varchar(50) DEFAULT NULL,
  `associated` varchar(50) DEFAULT '0',
  `charges` text DEFAULT NULL,
  `fine` int(11) DEFAULT 0,
  `sentence` int(11) DEFAULT 0,
  `recfine` int(11) DEFAULT 0,
  `recsentence` int(11) DEFAULT 0,
  `time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcoreframework_ae7ad2.mdt_convictions: ~0 rows (approximately)

-- Dumping structure for table qbcoreframework_ae7ad2.mdt_data
CREATE TABLE IF NOT EXISTS `mdt_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` varchar(20) NOT NULL,
  `information` mediumtext DEFAULT NULL,
  `tags` text NOT NULL,
  `gallery` text NOT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  `pfp` text DEFAULT NULL,
  `fingerprint` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcoreframework_ae7ad2.mdt_data: ~0 rows (approximately)

-- Dumping structure for table qbcoreframework_ae7ad2.mdt_impound
CREATE TABLE IF NOT EXISTS `mdt_impound` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicleid` int(11) NOT NULL,
  `linkedreport` int(11) NOT NULL,
  `fee` int(11) DEFAULT NULL,
  `time` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcoreframework_ae7ad2.mdt_impound: ~0 rows (approximately)

-- Dumping structure for table qbcoreframework_ae7ad2.mdt_incidents
CREATE TABLE IF NOT EXISTS `mdt_incidents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(50) NOT NULL DEFAULT '0',
  `details` longtext NOT NULL,
  `tags` text NOT NULL,
  `officersinvolved` text NOT NULL,
  `civsinvolved` text NOT NULL,
  `evidence` text NOT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) NOT NULL DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcoreframework_ae7ad2.mdt_incidents: ~0 rows (approximately)

-- Dumping structure for table qbcoreframework_ae7ad2.mdt_logs
CREATE TABLE IF NOT EXISTS `mdt_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcoreframework_ae7ad2.mdt_logs: ~0 rows (approximately)

-- Dumping structure for table qbcoreframework_ae7ad2.mdt_reports
CREATE TABLE IF NOT EXISTS `mdt_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `details` longtext DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `officersinvolved` text DEFAULT NULL,
  `civsinvolved` text DEFAULT NULL,
  `gallery` text DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcoreframework_ae7ad2.mdt_reports: ~0 rows (approximately)

-- Dumping structure for table qbcoreframework_ae7ad2.mdt_vehicleinfo
CREATE TABLE IF NOT EXISTS `mdt_vehicleinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(50) DEFAULT NULL,
  `information` text NOT NULL DEFAULT '',
  `stolen` tinyint(1) NOT NULL DEFAULT 0,
  `code5` tinyint(1) NOT NULL DEFAULT 0,
  `image` text NOT NULL DEFAULT '',
  `points` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcoreframework_ae7ad2.mdt_vehicleinfo: ~0 rows (approximately)

-- Dumping structure for table qbcoreframework_ae7ad2.mdt_weaponinfo
CREATE TABLE IF NOT EXISTS `mdt_weaponinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial` varchar(50) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `information` text NOT NULL DEFAULT '',
  `weapClass` varchar(50) DEFAULT NULL,
  `weapModel` varchar(50) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `serial` (`serial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcoreframework_ae7ad2.mdt_weaponinfo: ~0 rows (approximately)

-- Dumping structure for table qbcoreframework_ae7ad2.multijobs
CREATE TABLE IF NOT EXISTS `multijobs` (
  `citizenid` varchar(100) NOT NULL,
  `jobdata` text DEFAULT NULL,
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcoreframework_ae7ad2.multijobs: ~0 rows (approximately)

-- Dumping structure for table qbcoreframework_ae7ad2.occasion_vehicles
CREATE TABLE IF NOT EXISTS `occasion_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `mods` text DEFAULT NULL,
  `occasionid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `occasionId` (`occasionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcoreframework_ae7ad2.occasion_vehicles: ~0 rows (approximately)

-- Dumping structure for table qbcoreframework_ae7ad2.phone_gallery
CREATE TABLE IF NOT EXISTS `phone_gallery` (
  `citizenid` varchar(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcoreframework_ae7ad2.phone_gallery: ~0 rows (approximately)

-- Dumping structure for table qbcoreframework_ae7ad2.phone_invoices
CREATE TABLE IF NOT EXISTS `phone_invoices` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `society` tinytext DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `sendercitizenid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcoreframework_ae7ad2.phone_invoices: ~0 rows (approximately)

-- Dumping structure for table qbcoreframework_ae7ad2.phone_messages
CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `messages` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `number` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcoreframework_ae7ad2.phone_messages: ~0 rows (approximately)

-- Dumping structure for table qbcoreframework_ae7ad2.phone_tweets
CREATE TABLE IF NOT EXISTS `phone_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) DEFAULT NULL,
  `firstName` varchar(25) DEFAULT NULL,
  `lastName` varchar(25) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `url` text DEFAULT NULL,
  `picture` varchar(512) DEFAULT './img/default.png',
  `tweetId` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcoreframework_ae7ad2.phone_tweets: ~0 rows (approximately)

-- Dumping structure for table qbcoreframework_ae7ad2.players
CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `license` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `money` text NOT NULL,
  `charinfo` text DEFAULT NULL,
  `job` text NOT NULL,
  `gang` text DEFAULT NULL,
  `position` text NOT NULL,
  `metadata` text NOT NULL,
  `inventory` longtext DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`citizenid`),
  KEY `id` (`id`),
  KEY `last_updated` (`last_updated`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcoreframework_ae7ad2.players: ~0 rows (approximately)

-- Dumping structure for table qbcoreframework_ae7ad2.playerskins
CREATE TABLE IF NOT EXISTS `playerskins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `skin` text NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table qbcoreframework_ae7ad2.playerskins: ~0 rows (approximately)
INSERT IGNORE INTO `playerskins` (`id`, `citizenid`, `model`, `skin`, `active`) VALUES
	(1, 'ISA70238', 'mp_m_freemode_01', '{"hair":{"style":0,"color":0,"texture":0,"highlight":0},"props":[{"drawable":-1,"prop_id":0,"texture":-1},{"drawable":-1,"prop_id":1,"texture":-1},{"drawable":-1,"prop_id":2,"texture":-1},{"drawable":-1,"prop_id":6,"texture":-1},{"drawable":-1,"prop_id":7,"texture":-1}],"tattoos":[],"headBlend":{"skinMix":0,"thirdMix":0,"shapeFirst":0,"shapeThird":0,"skinFirst":0,"shapeSecond":0,"skinSecond":0,"shapeMix":0,"skinThird":0},"headOverlays":{"beard":{"secondColor":0,"color":0,"opacity":0,"style":0},"sunDamage":{"secondColor":0,"color":0,"opacity":0,"style":0},"bodyBlemishes":{"secondColor":0,"color":0,"opacity":0,"style":0},"ageing":{"secondColor":0,"color":0,"opacity":0,"style":0},"lipstick":{"secondColor":0,"color":0,"opacity":0,"style":0},"complexion":{"secondColor":0,"color":0,"opacity":0,"style":0},"makeUp":{"secondColor":0,"color":0,"opacity":0,"style":0},"moleAndFreckles":{"secondColor":0,"color":0,"opacity":0,"style":0},"blush":{"secondColor":0,"color":0,"opacity":0,"style":0},"chestHair":{"secondColor":0,"color":0,"opacity":0,"style":0},"blemishes":{"secondColor":0,"color":0,"opacity":0,"style":0},"eyebrows":{"secondColor":0,"color":0,"opacity":0,"style":0}},"eyeColor":0,"components":[{"component_id":0,"texture":0,"drawable":0},{"component_id":1,"texture":0,"drawable":0},{"component_id":2,"texture":0,"drawable":0},{"component_id":3,"texture":0,"drawable":0},{"component_id":4,"texture":0,"drawable":0},{"component_id":5,"texture":0,"drawable":0},{"component_id":6,"texture":0,"drawable":0},{"component_id":7,"texture":0,"drawable":0},{"component_id":8,"texture":0,"drawable":0},{"component_id":9,"texture":0,"drawable":0},{"component_id":10,"texture":0,"drawable":0},{"component_id":11,"texture":0,"drawable":0}],"faceFeatures":{"noseBoneHigh":0,"chinBoneLowering":0,"cheeksBoneHigh":0,"eyeBrownHigh":0,"noseWidth":0,"noseBoneTwist":0,"chinBoneLenght":0,"nosePeakSize":0,"jawBoneBackSize":0,"eyeBrownForward":0,"cheeksWidth":0,"neckThickness":0,"lipsThickness":0,"nosePeakLowering":0,"nosePeakHigh":0,"chinHole":0,"eyesOpening":0,"cheeksBoneWidth":0,"chinBoneSize":0,"jawBoneWidth":0},"model":"mp_m_freemode_01"}', 1);

-- Dumping structure for table qbcoreframework_ae7ad2.player_contacts
CREATE TABLE IF NOT EXISTS `player_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `iban` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcoreframework_ae7ad2.player_contacts: ~0 rows (approximately)

-- Dumping structure for table qbcoreframework_ae7ad2.player_houses
CREATE TABLE IF NOT EXISTS `player_houses` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `house` varchar(50) NOT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `citizenid` varchar(11) DEFAULT NULL,
  `keyholders` text DEFAULT NULL,
  `decorations` text DEFAULT NULL,
  `stash` text DEFAULT NULL,
  `outfit` text DEFAULT NULL,
  `logout` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `house` (`house`),
  KEY `citizenid` (`citizenid`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcoreframework_ae7ad2.player_houses: ~0 rows (approximately)

-- Dumping structure for table qbcoreframework_ae7ad2.player_mails
CREATE TABLE IF NOT EXISTS `player_mails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `read` tinyint(4) DEFAULT 0,
  `mailid` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `button` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcoreframework_ae7ad2.player_mails: ~0 rows (approximately)

-- Dumping structure for table qbcoreframework_ae7ad2.player_outfits
CREATE TABLE IF NOT EXISTS `player_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `outfitname` varchar(50) NOT NULL DEFAULT '0',
  `model` varchar(50) DEFAULT NULL,
  `props` varchar(1000) DEFAULT NULL,
  `components` varchar(1500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `citizenid_outfitname_model` (`citizenid`,`outfitname`,`model`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcoreframework_ae7ad2.player_outfits: ~0 rows (approximately)

-- Dumping structure for table qbcoreframework_ae7ad2.player_outfit_codes
CREATE TABLE IF NOT EXISTS `player_outfit_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `outfitid` int(11) NOT NULL,
  `code` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `FK_player_outfit_codes_player_outfits` (`outfitid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcoreframework_ae7ad2.player_outfit_codes: ~0 rows (approximately)

-- Dumping structure for table qbcoreframework_ae7ad2.player_vehicles
CREATE TABLE IF NOT EXISTS `player_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `vehicle` varchar(50) DEFAULT NULL,
  `hash` varchar(50) DEFAULT NULL,
  `mods` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `plate` varchar(50) NOT NULL,
  `fakeplate` varchar(50) DEFAULT NULL,
  `garage` varchar(50) DEFAULT NULL,
  `fuel` int(11) DEFAULT 100,
  `engine` float DEFAULT 1000,
  `body` float DEFAULT 1000,
  `state` int(11) DEFAULT 1,
  `depotprice` int(11) NOT NULL DEFAULT 0,
  `drivingdistance` int(50) DEFAULT NULL,
  `status` text DEFAULT NULL,
  `balance` int(11) NOT NULL DEFAULT 0,
  `paymentamount` int(11) NOT NULL DEFAULT 0,
  `paymentsleft` int(11) NOT NULL DEFAULT 0,
  `financetime` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `plate` (`plate`),
  KEY `citizenid` (`citizenid`),
  KEY `license` (`license`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcoreframework_ae7ad2.player_vehicles: ~0 rows (approximately)

-- Dumping structure for table qbcoreframework_ae7ad2.player_warns
CREATE TABLE IF NOT EXISTS `player_warns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `senderIdentifier` varchar(50) DEFAULT NULL,
  `targetIdentifier` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `warnId` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table qbcoreframework_ae7ad2.player_warns: ~0 rows (approximately)

-- Dumping structure for table qbcoreframework_ae7ad2.ps_banking_accounts
CREATE TABLE IF NOT EXISTS `ps_banking_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `balance` bigint(20) NOT NULL,
  `holder` varchar(255) NOT NULL,
  `cardNumber` varchar(255) NOT NULL,
  `users` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`users`)),
  `owner` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`owner`)),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcoreframework_ae7ad2.ps_banking_accounts: ~0 rows (approximately)

-- Dumping structure for table qbcoreframework_ae7ad2.ps_banking_bills
CREATE TABLE IF NOT EXISTS `ps_banking_bills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `date` date NOT NULL,
  `isPaid` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcoreframework_ae7ad2.ps_banking_bills: ~0 rows (approximately)

-- Dumping structure for table qbcoreframework_ae7ad2.ps_banking_transactions
CREATE TABLE IF NOT EXISTS `ps_banking_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `date` date NOT NULL,
  `isIncome` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcoreframework_ae7ad2.ps_banking_transactions: ~0 rows (approximately)

-- Dumping structure for table qbcoreframework_ae7ad2.stashitems
CREATE TABLE IF NOT EXISTS `stashitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stash` varchar(255) NOT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`stash`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table qbcoreframework_ae7ad2.stashitems: ~48 rows (approximately)
INSERT IGNORE INTO `stashitems` (`id`, `stash`, `items`) VALUES
	(1, '[247supermarket(1)]', '[{"useable":true,"weight":200,"type":"item","slot":1,"amount":34,"label":"Grilled Cheese Sandwich","description":"Nice to eat","image":"tosti.png","unique":false,"name":"tosti"},{"useable":true,"weight":500,"type":"item","slot":2,"amount":19,"label":"Bottle of Water","description":"For all the thirsty out there","image":"water_bottle.png","unique":false,"name":"water_bottle"},{"useable":true,"weight":500,"type":"item","slot":3,"amount":29,"label":"Cola","description":"For all the thirsty out there","image":"cola.png","unique":false,"name":"kurkakola"},{"useable":true,"weight":100,"type":"item","slot":4,"amount":18,"label":"Twerks","description":"Some delicious candy :O","image":"twerks_candy.png","unique":false,"name":"twerks_candy"},{"useable":true,"weight":100,"type":"item","slot":5,"amount":23,"label":"Snikkel","description":"Some delicious candy :O","image":"snikkel_candy.png","unique":false,"name":"snikkel_candy"},{"useable":true,"weight":200,"type":"item","slot":6,"amount":27,"label":"Sandwich","description":"Nice bread for your stomach","image":"sandwich.png","unique":false,"name":"sandwich"},{"useable":true,"weight":500,"type":"item","slot":7,"amount":39,"label":"Beer","description":"Nothing like a good cold beer!","image":"beer.png","unique":false,"name":"beer"},{"useable":true,"weight":500,"type":"item","slot":8,"amount":15,"label":"Whiskey","description":"For all the thirsty out there","image":"whiskey.png","unique":false,"name":"whiskey"},{"useable":true,"weight":500,"type":"item","slot":9,"amount":14,"label":"Vodka","description":"For all the thirsty out there","image":"vodka.png","unique":false,"name":"vodka"},{"useable":true,"weight":0,"type":"item","slot":10,"amount":1,"label":"Bandage","description":"A bandage works every time","image":"bandage.png","unique":false,"name":"bandage"},{"useable":false,"weight":0,"type":"item","slot":11,"amount":42,"label":"Lighter","description":"On new years eve a nice fire to stand next to","image":"lighter.png","unique":false,"name":"lighter"},{"useable":false,"weight":0,"type":"item","slot":12,"amount":2640,"label":"Rolling Paper","description":"Paper made specifically for encasing and smoking tobacco or cannabis.","image":"rolling_paper.png","unique":false,"name":"rolling_paper"}]'),
	(10, '[247supermarket(10)]', '[{"useable":true,"weight":200,"type":"item","slot":1,"amount":21,"label":"Grilled Cheese Sandwich","description":"Nice to eat","image":"tosti.png","unique":false,"name":"tosti"},{"useable":true,"weight":500,"type":"item","slot":2,"amount":24,"label":"Bottle of Water","description":"For all the thirsty out there","image":"water_bottle.png","unique":false,"name":"water_bottle"},{"useable":true,"weight":500,"type":"item","slot":3,"amount":45,"label":"Cola","description":"For all the thirsty out there","image":"cola.png","unique":false,"name":"kurkakola"},{"useable":true,"weight":100,"type":"item","slot":4,"amount":35,"label":"Twerks","description":"Some delicious candy :O","image":"twerks_candy.png","unique":false,"name":"twerks_candy"},{"useable":true,"weight":100,"type":"item","slot":5,"amount":32,"label":"Snikkel","description":"Some delicious candy :O","image":"snikkel_candy.png","unique":false,"name":"snikkel_candy"},{"useable":true,"weight":200,"type":"item","slot":6,"amount":2,"label":"Sandwich","description":"Nice bread for your stomach","image":"sandwich.png","unique":false,"name":"sandwich"},{"useable":true,"weight":500,"type":"item","slot":7,"amount":25,"label":"Beer","description":"Nothing like a good cold beer!","image":"beer.png","unique":false,"name":"beer"},{"useable":true,"weight":500,"type":"item","slot":8,"amount":19,"label":"Whiskey","description":"For all the thirsty out there","image":"whiskey.png","unique":false,"name":"whiskey"},{"useable":true,"weight":500,"type":"item","slot":9,"amount":42,"label":"Vodka","description":"For all the thirsty out there","image":"vodka.png","unique":false,"name":"vodka"},{"useable":true,"weight":0,"type":"item","slot":10,"amount":29,"label":"Bandage","description":"A bandage works every time","image":"bandage.png","unique":false,"name":"bandage"},{"useable":false,"weight":0,"type":"item","slot":11,"amount":17,"label":"Lighter","description":"On new years eve a nice fire to stand next to","image":"lighter.png","unique":false,"name":"lighter"},{"useable":false,"weight":0,"type":"item","slot":12,"amount":4010,"label":"Rolling Paper","description":"Paper made specifically for encasing and smoking tobacco or cannabis.","image":"rolling_paper.png","unique":false,"name":"rolling_paper"}]'),
	(11, '[247supermarket(11)]', '[{"useable":true,"weight":200,"type":"item","slot":1,"amount":40,"label":"Grilled Cheese Sandwich","description":"Nice to eat","image":"tosti.png","unique":false,"name":"tosti"},{"useable":true,"weight":500,"type":"item","slot":2,"amount":20,"label":"Bottle of Water","description":"For all the thirsty out there","image":"water_bottle.png","unique":false,"name":"water_bottle"},{"useable":true,"weight":500,"type":"item","slot":3,"amount":9,"label":"Cola","description":"For all the thirsty out there","image":"cola.png","unique":false,"name":"kurkakola"},{"useable":true,"weight":100,"type":"item","slot":4,"amount":1,"label":"Twerks","description":"Some delicious candy :O","image":"twerks_candy.png","unique":false,"name":"twerks_candy"},{"useable":true,"weight":100,"type":"item","slot":5,"amount":2,"label":"Snikkel","description":"Some delicious candy :O","image":"snikkel_candy.png","unique":false,"name":"snikkel_candy"},{"useable":true,"weight":200,"type":"item","slot":6,"amount":27,"label":"Sandwich","description":"Nice bread for your stomach","image":"sandwich.png","unique":false,"name":"sandwich"},{"useable":true,"weight":500,"type":"item","slot":7,"amount":22,"label":"Beer","description":"Nothing like a good cold beer!","image":"beer.png","unique":false,"name":"beer"},{"useable":true,"weight":500,"type":"item","slot":8,"amount":8,"label":"Whiskey","description":"For all the thirsty out there","image":"whiskey.png","unique":false,"name":"whiskey"},{"useable":true,"weight":500,"type":"item","slot":9,"amount":19,"label":"Vodka","description":"For all the thirsty out there","image":"vodka.png","unique":false,"name":"vodka"},{"useable":true,"weight":0,"type":"item","slot":10,"amount":37,"label":"Bandage","description":"A bandage works every time","image":"bandage.png","unique":false,"name":"bandage"},{"useable":false,"weight":0,"type":"item","slot":11,"amount":12,"label":"Lighter","description":"On new years eve a nice fire to stand next to","image":"lighter.png","unique":false,"name":"lighter"},{"useable":false,"weight":0,"type":"item","slot":12,"amount":4555,"label":"Rolling Paper","description":"Paper made specifically for encasing and smoking tobacco or cannabis.","image":"rolling_paper.png","unique":false,"name":"rolling_paper"}]'),
	(2, '[247supermarket(2)]', '[{"useable":true,"weight":200,"type":"item","slot":1,"amount":30,"label":"Grilled Cheese Sandwich","description":"Nice to eat","image":"tosti.png","unique":false,"name":"tosti"},{"useable":true,"weight":500,"type":"item","slot":2,"amount":13,"label":"Bottle of Water","description":"For all the thirsty out there","image":"water_bottle.png","unique":false,"name":"water_bottle"},{"useable":true,"weight":500,"type":"item","slot":3,"amount":50,"label":"Cola","description":"For all the thirsty out there","image":"cola.png","unique":false,"name":"kurkakola"},{"useable":true,"weight":100,"type":"item","slot":4,"amount":9,"label":"Twerks","description":"Some delicious candy :O","image":"twerks_candy.png","unique":false,"name":"twerks_candy"},{"useable":true,"weight":100,"type":"item","slot":5,"amount":16,"label":"Snikkel","description":"Some delicious candy :O","image":"snikkel_candy.png","unique":false,"name":"snikkel_candy"},{"useable":true,"weight":200,"type":"item","slot":6,"amount":27,"label":"Sandwich","description":"Nice bread for your stomach","image":"sandwich.png","unique":false,"name":"sandwich"},{"useable":true,"weight":500,"type":"item","slot":7,"amount":15,"label":"Beer","description":"Nothing like a good cold beer!","image":"beer.png","unique":false,"name":"beer"},{"useable":true,"weight":500,"type":"item","slot":8,"amount":49,"label":"Whiskey","description":"For all the thirsty out there","image":"whiskey.png","unique":false,"name":"whiskey"},{"useable":true,"weight":500,"type":"item","slot":9,"amount":34,"label":"Vodka","description":"For all the thirsty out there","image":"vodka.png","unique":false,"name":"vodka"},{"useable":true,"weight":0,"type":"item","slot":10,"amount":4,"label":"Bandage","description":"A bandage works every time","image":"bandage.png","unique":false,"name":"bandage"},{"useable":false,"weight":0,"type":"item","slot":11,"amount":39,"label":"Lighter","description":"On new years eve a nice fire to stand next to","image":"lighter.png","unique":false,"name":"lighter"},{"useable":false,"weight":0,"type":"item","slot":12,"amount":1563,"label":"Rolling Paper","description":"Paper made specifically for encasing and smoking tobacco or cannabis.","image":"rolling_paper.png","unique":false,"name":"rolling_paper"}]'),
	(3, '[247supermarket(3)]', '[{"useable":true,"weight":200,"type":"item","slot":1,"amount":46,"label":"Grilled Cheese Sandwich","description":"Nice to eat","image":"tosti.png","unique":false,"name":"tosti"},{"useable":true,"weight":500,"type":"item","slot":2,"amount":50,"label":"Bottle of Water","description":"For all the thirsty out there","image":"water_bottle.png","unique":false,"name":"water_bottle"},{"useable":true,"weight":500,"type":"item","slot":3,"amount":8,"label":"Cola","description":"For all the thirsty out there","image":"cola.png","unique":false,"name":"kurkakola"},{"useable":true,"weight":100,"type":"item","slot":4,"amount":3,"label":"Twerks","description":"Some delicious candy :O","image":"twerks_candy.png","unique":false,"name":"twerks_candy"},{"useable":true,"weight":100,"type":"item","slot":5,"amount":11,"label":"Snikkel","description":"Some delicious candy :O","image":"snikkel_candy.png","unique":false,"name":"snikkel_candy"},{"useable":true,"weight":200,"type":"item","slot":6,"amount":37,"label":"Sandwich","description":"Nice bread for your stomach","image":"sandwich.png","unique":false,"name":"sandwich"},{"useable":true,"weight":500,"type":"item","slot":7,"amount":7,"label":"Beer","description":"Nothing like a good cold beer!","image":"beer.png","unique":false,"name":"beer"},{"useable":true,"weight":500,"type":"item","slot":8,"amount":8,"label":"Whiskey","description":"For all the thirsty out there","image":"whiskey.png","unique":false,"name":"whiskey"},{"useable":true,"weight":500,"type":"item","slot":9,"amount":18,"label":"Vodka","description":"For all the thirsty out there","image":"vodka.png","unique":false,"name":"vodka"},{"useable":true,"weight":0,"type":"item","slot":10,"amount":50,"label":"Bandage","description":"A bandage works every time","image":"bandage.png","unique":false,"name":"bandage"},{"useable":false,"weight":0,"type":"item","slot":11,"amount":42,"label":"Lighter","description":"On new years eve a nice fire to stand next to","image":"lighter.png","unique":false,"name":"lighter"},{"useable":false,"weight":0,"type":"item","slot":12,"amount":4566,"label":"Rolling Paper","description":"Paper made specifically for encasing and smoking tobacco or cannabis.","image":"rolling_paper.png","unique":false,"name":"rolling_paper"}]'),
	(4, '[247supermarket(4)]', '[{"useable":true,"weight":200,"type":"item","slot":1,"amount":17,"label":"Grilled Cheese Sandwich","description":"Nice to eat","image":"tosti.png","unique":false,"name":"tosti"},{"useable":true,"weight":500,"type":"item","slot":2,"amount":6,"label":"Bottle of Water","description":"For all the thirsty out there","image":"water_bottle.png","unique":false,"name":"water_bottle"},{"useable":true,"weight":500,"type":"item","slot":3,"amount":28,"label":"Cola","description":"For all the thirsty out there","image":"cola.png","unique":false,"name":"kurkakola"},{"useable":true,"weight":100,"type":"item","slot":4,"amount":3,"label":"Twerks","description":"Some delicious candy :O","image":"twerks_candy.png","unique":false,"name":"twerks_candy"},{"useable":true,"weight":100,"type":"item","slot":5,"amount":10,"label":"Snikkel","description":"Some delicious candy :O","image":"snikkel_candy.png","unique":false,"name":"snikkel_candy"},{"useable":true,"weight":200,"type":"item","slot":6,"amount":18,"label":"Sandwich","description":"Nice bread for your stomach","image":"sandwich.png","unique":false,"name":"sandwich"},{"useable":true,"weight":500,"type":"item","slot":7,"amount":29,"label":"Beer","description":"Nothing like a good cold beer!","image":"beer.png","unique":false,"name":"beer"},{"useable":true,"weight":500,"type":"item","slot":8,"amount":10,"label":"Whiskey","description":"For all the thirsty out there","image":"whiskey.png","unique":false,"name":"whiskey"},{"useable":true,"weight":500,"type":"item","slot":9,"amount":41,"label":"Vodka","description":"For all the thirsty out there","image":"vodka.png","unique":false,"name":"vodka"},{"useable":true,"weight":0,"type":"item","slot":10,"amount":38,"label":"Bandage","description":"A bandage works every time","image":"bandage.png","unique":false,"name":"bandage"},{"useable":false,"weight":0,"type":"item","slot":11,"amount":28,"label":"Lighter","description":"On new years eve a nice fire to stand next to","image":"lighter.png","unique":false,"name":"lighter"},{"useable":false,"weight":0,"type":"item","slot":12,"amount":2389,"label":"Rolling Paper","description":"Paper made specifically for encasing and smoking tobacco or cannabis.","image":"rolling_paper.png","unique":false,"name":"rolling_paper"}]'),
	(5, '[247supermarket(5)]', '[{"useable":true,"weight":200,"type":"item","slot":1,"amount":41,"label":"Grilled Cheese Sandwich","description":"Nice to eat","image":"tosti.png","unique":false,"name":"tosti"},{"useable":true,"weight":500,"type":"item","slot":2,"amount":48,"label":"Bottle of Water","description":"For all the thirsty out there","image":"water_bottle.png","unique":false,"name":"water_bottle"},{"useable":true,"weight":500,"type":"item","slot":3,"amount":1,"label":"Cola","description":"For all the thirsty out there","image":"cola.png","unique":false,"name":"kurkakola"},{"useable":true,"weight":100,"type":"item","slot":4,"amount":15,"label":"Twerks","description":"Some delicious candy :O","image":"twerks_candy.png","unique":false,"name":"twerks_candy"},{"useable":true,"weight":100,"type":"item","slot":5,"amount":29,"label":"Snikkel","description":"Some delicious candy :O","image":"snikkel_candy.png","unique":false,"name":"snikkel_candy"},{"useable":true,"weight":200,"type":"item","slot":6,"amount":13,"label":"Sandwich","description":"Nice bread for your stomach","image":"sandwich.png","unique":false,"name":"sandwich"},{"useable":true,"weight":500,"type":"item","slot":7,"amount":9,"label":"Beer","description":"Nothing like a good cold beer!","image":"beer.png","unique":false,"name":"beer"},{"useable":true,"weight":500,"type":"item","slot":8,"amount":6,"label":"Whiskey","description":"For all the thirsty out there","image":"whiskey.png","unique":false,"name":"whiskey"},{"useable":true,"weight":500,"type":"item","slot":9,"amount":48,"label":"Vodka","description":"For all the thirsty out there","image":"vodka.png","unique":false,"name":"vodka"},{"useable":true,"weight":0,"type":"item","slot":10,"amount":37,"label":"Bandage","description":"A bandage works every time","image":"bandage.png","unique":false,"name":"bandage"},{"useable":false,"weight":0,"type":"item","slot":11,"amount":43,"label":"Lighter","description":"On new years eve a nice fire to stand next to","image":"lighter.png","unique":false,"name":"lighter"},{"useable":false,"weight":0,"type":"item","slot":12,"amount":4409,"label":"Rolling Paper","description":"Paper made specifically for encasing and smoking tobacco or cannabis.","image":"rolling_paper.png","unique":false,"name":"rolling_paper"}]'),
	(6, '[247supermarket(6)]', '[{"useable":true,"weight":200,"type":"item","slot":1,"amount":22,"label":"Grilled Cheese Sandwich","description":"Nice to eat","image":"tosti.png","unique":false,"name":"tosti"},{"useable":true,"weight":500,"type":"item","slot":2,"amount":5,"label":"Bottle of Water","description":"For all the thirsty out there","image":"water_bottle.png","unique":false,"name":"water_bottle"},{"useable":true,"weight":500,"type":"item","slot":3,"amount":4,"label":"Cola","description":"For all the thirsty out there","image":"cola.png","unique":false,"name":"kurkakola"},{"useable":true,"weight":100,"type":"item","slot":4,"amount":43,"label":"Twerks","description":"Some delicious candy :O","image":"twerks_candy.png","unique":false,"name":"twerks_candy"},{"useable":true,"weight":100,"type":"item","slot":5,"amount":32,"label":"Snikkel","description":"Some delicious candy :O","image":"snikkel_candy.png","unique":false,"name":"snikkel_candy"},{"useable":true,"weight":200,"type":"item","slot":6,"amount":21,"label":"Sandwich","description":"Nice bread for your stomach","image":"sandwich.png","unique":false,"name":"sandwich"},{"useable":true,"weight":500,"type":"item","slot":7,"amount":27,"label":"Beer","description":"Nothing like a good cold beer!","image":"beer.png","unique":false,"name":"beer"},{"useable":true,"weight":500,"type":"item","slot":8,"amount":46,"label":"Whiskey","description":"For all the thirsty out there","image":"whiskey.png","unique":false,"name":"whiskey"},{"useable":true,"weight":500,"type":"item","slot":9,"amount":36,"label":"Vodka","description":"For all the thirsty out there","image":"vodka.png","unique":false,"name":"vodka"},{"useable":true,"weight":0,"type":"item","slot":10,"amount":34,"label":"Bandage","description":"A bandage works every time","image":"bandage.png","unique":false,"name":"bandage"},{"useable":false,"weight":0,"type":"item","slot":11,"amount":35,"label":"Lighter","description":"On new years eve a nice fire to stand next to","image":"lighter.png","unique":false,"name":"lighter"},{"useable":false,"weight":0,"type":"item","slot":12,"amount":1691,"label":"Rolling Paper","description":"Paper made specifically for encasing and smoking tobacco or cannabis.","image":"rolling_paper.png","unique":false,"name":"rolling_paper"}]'),
	(7, '[247supermarket(7)]', '[{"useable":true,"weight":200,"type":"item","slot":1,"amount":16,"label":"Grilled Cheese Sandwich","description":"Nice to eat","image":"tosti.png","unique":false,"name":"tosti"},{"useable":true,"weight":500,"type":"item","slot":2,"amount":14,"label":"Bottle of Water","description":"For all the thirsty out there","image":"water_bottle.png","unique":false,"name":"water_bottle"},{"useable":true,"weight":500,"type":"item","slot":3,"amount":12,"label":"Cola","description":"For all the thirsty out there","image":"cola.png","unique":false,"name":"kurkakola"},{"useable":true,"weight":100,"type":"item","slot":4,"amount":32,"label":"Twerks","description":"Some delicious candy :O","image":"twerks_candy.png","unique":false,"name":"twerks_candy"},{"useable":true,"weight":100,"type":"item","slot":5,"amount":10,"label":"Snikkel","description":"Some delicious candy :O","image":"snikkel_candy.png","unique":false,"name":"snikkel_candy"},{"useable":true,"weight":200,"type":"item","slot":6,"amount":21,"label":"Sandwich","description":"Nice bread for your stomach","image":"sandwich.png","unique":false,"name":"sandwich"},{"useable":true,"weight":500,"type":"item","slot":7,"amount":49,"label":"Beer","description":"Nothing like a good cold beer!","image":"beer.png","unique":false,"name":"beer"},{"useable":true,"weight":500,"type":"item","slot":8,"amount":3,"label":"Whiskey","description":"For all the thirsty out there","image":"whiskey.png","unique":false,"name":"whiskey"},{"useable":true,"weight":500,"type":"item","slot":9,"amount":27,"label":"Vodka","description":"For all the thirsty out there","image":"vodka.png","unique":false,"name":"vodka"},{"useable":true,"weight":0,"type":"item","slot":10,"amount":36,"label":"Bandage","description":"A bandage works every time","image":"bandage.png","unique":false,"name":"bandage"},{"useable":false,"weight":0,"type":"item","slot":11,"amount":8,"label":"Lighter","description":"On new years eve a nice fire to stand next to","image":"lighter.png","unique":false,"name":"lighter"},{"useable":false,"weight":0,"type":"item","slot":12,"amount":3308,"label":"Rolling Paper","description":"Paper made specifically for encasing and smoking tobacco or cannabis.","image":"rolling_paper.png","unique":false,"name":"rolling_paper"}]'),
	(8, '[247supermarket(8)]', '[{"useable":true,"weight":200,"type":"item","slot":1,"amount":14,"label":"Grilled Cheese Sandwich","description":"Nice to eat","image":"tosti.png","unique":false,"name":"tosti"},{"useable":true,"weight":500,"type":"item","slot":2,"amount":7,"label":"Bottle of Water","description":"For all the thirsty out there","image":"water_bottle.png","unique":false,"name":"water_bottle"},{"useable":true,"weight":500,"type":"item","slot":3,"amount":22,"label":"Cola","description":"For all the thirsty out there","image":"cola.png","unique":false,"name":"kurkakola"},{"useable":true,"weight":100,"type":"item","slot":4,"amount":20,"label":"Twerks","description":"Some delicious candy :O","image":"twerks_candy.png","unique":false,"name":"twerks_candy"},{"useable":true,"weight":100,"type":"item","slot":5,"amount":35,"label":"Snikkel","description":"Some delicious candy :O","image":"snikkel_candy.png","unique":false,"name":"snikkel_candy"},{"useable":true,"weight":200,"type":"item","slot":6,"amount":31,"label":"Sandwich","description":"Nice bread for your stomach","image":"sandwich.png","unique":false,"name":"sandwich"},{"useable":true,"weight":500,"type":"item","slot":7,"amount":37,"label":"Beer","description":"Nothing like a good cold beer!","image":"beer.png","unique":false,"name":"beer"},{"useable":true,"weight":500,"type":"item","slot":8,"amount":5,"label":"Whiskey","description":"For all the thirsty out there","image":"whiskey.png","unique":false,"name":"whiskey"},{"useable":true,"weight":500,"type":"item","slot":9,"amount":46,"label":"Vodka","description":"For all the thirsty out there","image":"vodka.png","unique":false,"name":"vodka"},{"useable":true,"weight":0,"type":"item","slot":10,"amount":42,"label":"Bandage","description":"A bandage works every time","image":"bandage.png","unique":false,"name":"bandage"},{"useable":false,"weight":0,"type":"item","slot":11,"amount":11,"label":"Lighter","description":"On new years eve a nice fire to stand next to","image":"lighter.png","unique":false,"name":"lighter"},{"useable":false,"weight":0,"type":"item","slot":12,"amount":734,"label":"Rolling Paper","description":"Paper made specifically for encasing and smoking tobacco or cannabis.","image":"rolling_paper.png","unique":false,"name":"rolling_paper"}]'),
	(9, '[247supermarket(9)]', '[{"useable":true,"weight":200,"type":"item","slot":1,"amount":20,"label":"Grilled Cheese Sandwich","description":"Nice to eat","image":"tosti.png","unique":false,"name":"tosti"},{"useable":true,"weight":500,"type":"item","slot":2,"amount":49,"label":"Bottle of Water","description":"For all the thirsty out there","image":"water_bottle.png","unique":false,"name":"water_bottle"},{"useable":true,"weight":500,"type":"item","slot":3,"amount":13,"label":"Cola","description":"For all the thirsty out there","image":"cola.png","unique":false,"name":"kurkakola"},{"useable":true,"weight":100,"type":"item","slot":4,"amount":5,"label":"Twerks","description":"Some delicious candy :O","image":"twerks_candy.png","unique":false,"name":"twerks_candy"},{"useable":true,"weight":100,"type":"item","slot":5,"amount":14,"label":"Snikkel","description":"Some delicious candy :O","image":"snikkel_candy.png","unique":false,"name":"snikkel_candy"},{"useable":true,"weight":200,"type":"item","slot":6,"amount":22,"label":"Sandwich","description":"Nice bread for your stomach","image":"sandwich.png","unique":false,"name":"sandwich"},{"useable":true,"weight":500,"type":"item","slot":7,"amount":23,"label":"Beer","description":"Nothing like a good cold beer!","image":"beer.png","unique":false,"name":"beer"},{"useable":true,"weight":500,"type":"item","slot":8,"amount":50,"label":"Whiskey","description":"For all the thirsty out there","image":"whiskey.png","unique":false,"name":"whiskey"},{"useable":true,"weight":500,"type":"item","slot":9,"amount":9,"label":"Vodka","description":"For all the thirsty out there","image":"vodka.png","unique":false,"name":"vodka"},{"useable":true,"weight":0,"type":"item","slot":10,"amount":42,"label":"Bandage","description":"A bandage works every time","image":"bandage.png","unique":false,"name":"bandage"},{"useable":false,"weight":0,"type":"item","slot":11,"amount":37,"label":"Lighter","description":"On new years eve a nice fire to stand next to","image":"lighter.png","unique":false,"name":"lighter"},{"useable":false,"weight":0,"type":"item","slot":12,"amount":4229,"label":"Rolling Paper","description":"Paper made specifically for encasing and smoking tobacco or cannabis.","image":"rolling_paper.png","unique":false,"name":"rolling_paper"}]'),
	(38, '[ammunation(1)]', '[{"useable":false,"weight":1000,"type":"weapon","slot":1,"amount":91,"label":"Knife","description":"An instrument composed of a blade fixed into a handle, used for cutting or as a weapon","image":"weapon_knife.png","unique":true,"name":"weapon_knife"},{"useable":false,"weight":1000,"type":"weapon","slot":2,"amount":76,"label":"Bat","description":"Used for hitting a ball in sports (or other things)","image":"weapon_bat.png","unique":true,"name":"weapon_bat"},{"useable":false,"weight":1000,"type":"weapon","slot":3,"amount":227,"label":"Hatchet","description":"A small axe with a short handle for use in one hand","image":"weapon_hatchet.png","unique":true,"name":"weapon_hatchet"},{"useable":false,"weight":1000,"type":"weapon","slot":4,"amount":5,"label":"Walther P99","description":"A small firearm designed to be held in one hand","image":"weapon_pistol.png","unique":true,"name":"weapon_pistol"},{"useable":false,"weight":1000,"type":"weapon","slot":5,"amount":1,"label":"SNS Pistol","description":"A very small firearm designed to be easily concealed","image":"weapon_snspistol.png","unique":true,"name":"weapon_snspistol"},{"useable":false,"weight":1000,"type":"weapon","slot":6,"amount":5,"label":"Vintage Pistol","description":"An antique firearm designed to be held in one hand","image":"weapon_vintagepistol.png","unique":true,"name":"weapon_vintagepistol"}]'),
	(47, '[ammunation(10)]', '[{"useable":false,"weight":1000,"type":"weapon","slot":1,"amount":162,"label":"Knife","description":"An instrument composed of a blade fixed into a handle, used for cutting or as a weapon","image":"weapon_knife.png","unique":true,"name":"weapon_knife"},{"useable":false,"weight":1000,"type":"weapon","slot":2,"amount":108,"label":"Bat","description":"Used for hitting a ball in sports (or other things)","image":"weapon_bat.png","unique":true,"name":"weapon_bat"},{"useable":false,"weight":1000,"type":"weapon","slot":3,"amount":168,"label":"Hatchet","description":"A small axe with a short handle for use in one hand","image":"weapon_hatchet.png","unique":true,"name":"weapon_hatchet"},{"useable":false,"weight":1000,"type":"weapon","slot":4,"amount":4,"label":"Walther P99","description":"A small firearm designed to be held in one hand","image":"weapon_pistol.png","unique":true,"name":"weapon_pistol"},{"useable":false,"weight":1000,"type":"weapon","slot":5,"amount":4,"label":"SNS Pistol","description":"A very small firearm designed to be easily concealed","image":"weapon_snspistol.png","unique":true,"name":"weapon_snspistol"},{"useable":false,"weight":1000,"type":"weapon","slot":6,"amount":5,"label":"Vintage Pistol","description":"An antique firearm designed to be held in one hand","image":"weapon_vintagepistol.png","unique":true,"name":"weapon_vintagepistol"}]'),
	(39, '[ammunation(2)]', '[{"useable":false,"weight":1000,"type":"weapon","slot":1,"amount":232,"label":"Knife","description":"An instrument composed of a blade fixed into a handle, used for cutting or as a weapon","image":"weapon_knife.png","unique":true,"name":"weapon_knife"},{"useable":false,"weight":1000,"type":"weapon","slot":2,"amount":241,"label":"Bat","description":"Used for hitting a ball in sports (or other things)","image":"weapon_bat.png","unique":true,"name":"weapon_bat"},{"useable":false,"weight":1000,"type":"weapon","slot":3,"amount":174,"label":"Hatchet","description":"A small axe with a short handle for use in one hand","image":"weapon_hatchet.png","unique":true,"name":"weapon_hatchet"},{"useable":false,"weight":1000,"type":"weapon","slot":4,"amount":4,"label":"Walther P99","description":"A small firearm designed to be held in one hand","image":"weapon_pistol.png","unique":true,"name":"weapon_pistol"},{"useable":false,"weight":1000,"type":"weapon","slot":5,"amount":2,"label":"SNS Pistol","description":"A very small firearm designed to be easily concealed","image":"weapon_snspistol.png","unique":true,"name":"weapon_snspistol"},{"useable":false,"weight":1000,"type":"weapon","slot":6,"amount":3,"label":"Vintage Pistol","description":"An antique firearm designed to be held in one hand","image":"weapon_vintagepistol.png","unique":true,"name":"weapon_vintagepistol"}]'),
	(40, '[ammunation(3)]', '[{"useable":false,"weight":1000,"type":"weapon","slot":1,"amount":68,"label":"Knife","description":"An instrument composed of a blade fixed into a handle, used for cutting or as a weapon","image":"weapon_knife.png","unique":true,"name":"weapon_knife"},{"useable":false,"weight":1000,"type":"weapon","slot":2,"amount":159,"label":"Bat","description":"Used for hitting a ball in sports (or other things)","image":"weapon_bat.png","unique":true,"name":"weapon_bat"},{"useable":false,"weight":1000,"type":"weapon","slot":3,"amount":62,"label":"Hatchet","description":"A small axe with a short handle for use in one hand","image":"weapon_hatchet.png","unique":true,"name":"weapon_hatchet"},{"useable":false,"weight":1000,"type":"weapon","slot":4,"amount":2,"label":"Walther P99","description":"A small firearm designed to be held in one hand","image":"weapon_pistol.png","unique":true,"name":"weapon_pistol"},{"useable":false,"weight":1000,"type":"weapon","slot":5,"amount":5,"label":"SNS Pistol","description":"A very small firearm designed to be easily concealed","image":"weapon_snspistol.png","unique":true,"name":"weapon_snspistol"},{"useable":false,"weight":1000,"type":"weapon","slot":6,"amount":5,"label":"Vintage Pistol","description":"An antique firearm designed to be held in one hand","image":"weapon_vintagepistol.png","unique":true,"name":"weapon_vintagepistol"}]'),
	(41, '[ammunation(4)]', '[{"useable":false,"weight":1000,"type":"weapon","slot":1,"amount":189,"label":"Knife","description":"An instrument composed of a blade fixed into a handle, used for cutting or as a weapon","image":"weapon_knife.png","unique":true,"name":"weapon_knife"},{"useable":false,"weight":1000,"type":"weapon","slot":2,"amount":69,"label":"Bat","description":"Used for hitting a ball in sports (or other things)","image":"weapon_bat.png","unique":true,"name":"weapon_bat"},{"useable":false,"weight":1000,"type":"weapon","slot":3,"amount":79,"label":"Hatchet","description":"A small axe with a short handle for use in one hand","image":"weapon_hatchet.png","unique":true,"name":"weapon_hatchet"},{"useable":false,"weight":1000,"type":"weapon","slot":4,"amount":4,"label":"Walther P99","description":"A small firearm designed to be held in one hand","image":"weapon_pistol.png","unique":true,"name":"weapon_pistol"},{"useable":false,"weight":1000,"type":"weapon","slot":5,"amount":2,"label":"SNS Pistol","description":"A very small firearm designed to be easily concealed","image":"weapon_snspistol.png","unique":true,"name":"weapon_snspistol"},{"useable":false,"weight":1000,"type":"weapon","slot":6,"amount":4,"label":"Vintage Pistol","description":"An antique firearm designed to be held in one hand","image":"weapon_vintagepistol.png","unique":true,"name":"weapon_vintagepistol"}]'),
	(42, '[ammunation(5)]', '[{"useable":false,"weight":1000,"type":"weapon","slot":1,"amount":127,"label":"Knife","description":"An instrument composed of a blade fixed into a handle, used for cutting or as a weapon","image":"weapon_knife.png","unique":true,"name":"weapon_knife"},{"useable":false,"weight":1000,"type":"weapon","slot":2,"amount":186,"label":"Bat","description":"Used for hitting a ball in sports (or other things)","image":"weapon_bat.png","unique":true,"name":"weapon_bat"},{"useable":false,"weight":1000,"type":"weapon","slot":3,"amount":6,"label":"Hatchet","description":"A small axe with a short handle for use in one hand","image":"weapon_hatchet.png","unique":true,"name":"weapon_hatchet"},{"useable":false,"weight":1000,"type":"weapon","slot":4,"amount":3,"label":"Walther P99","description":"A small firearm designed to be held in one hand","image":"weapon_pistol.png","unique":true,"name":"weapon_pistol"},{"useable":false,"weight":1000,"type":"weapon","slot":5,"amount":3,"label":"SNS Pistol","description":"A very small firearm designed to be easily concealed","image":"weapon_snspistol.png","unique":true,"name":"weapon_snspistol"},{"useable":false,"weight":1000,"type":"weapon","slot":6,"amount":2,"label":"Vintage Pistol","description":"An antique firearm designed to be held in one hand","image":"weapon_vintagepistol.png","unique":true,"name":"weapon_vintagepistol"}]'),
	(43, '[ammunation(6)]', '[{"useable":false,"weight":1000,"type":"weapon","slot":1,"amount":158,"label":"Knife","description":"An instrument composed of a blade fixed into a handle, used for cutting or as a weapon","image":"weapon_knife.png","unique":true,"name":"weapon_knife"},{"useable":false,"weight":1000,"type":"weapon","slot":2,"amount":141,"label":"Bat","description":"Used for hitting a ball in sports (or other things)","image":"weapon_bat.png","unique":true,"name":"weapon_bat"},{"useable":false,"weight":1000,"type":"weapon","slot":3,"amount":143,"label":"Hatchet","description":"A small axe with a short handle for use in one hand","image":"weapon_hatchet.png","unique":true,"name":"weapon_hatchet"},{"useable":false,"weight":1000,"type":"weapon","slot":4,"amount":1,"label":"Walther P99","description":"A small firearm designed to be held in one hand","image":"weapon_pistol.png","unique":true,"name":"weapon_pistol"},{"useable":false,"weight":1000,"type":"weapon","slot":5,"amount":4,"label":"SNS Pistol","description":"A very small firearm designed to be easily concealed","image":"weapon_snspistol.png","unique":true,"name":"weapon_snspistol"},{"useable":false,"weight":1000,"type":"weapon","slot":6,"amount":1,"label":"Vintage Pistol","description":"An antique firearm designed to be held in one hand","image":"weapon_vintagepistol.png","unique":true,"name":"weapon_vintagepistol"}]'),
	(44, '[ammunation(7)]', '[{"useable":false,"weight":1000,"type":"weapon","slot":1,"amount":40,"label":"Knife","description":"An instrument composed of a blade fixed into a handle, used for cutting or as a weapon","image":"weapon_knife.png","unique":true,"name":"weapon_knife"},{"useable":false,"weight":1000,"type":"weapon","slot":2,"amount":152,"label":"Bat","description":"Used for hitting a ball in sports (or other things)","image":"weapon_bat.png","unique":true,"name":"weapon_bat"},{"useable":false,"weight":1000,"type":"weapon","slot":3,"amount":134,"label":"Hatchet","description":"A small axe with a short handle for use in one hand","image":"weapon_hatchet.png","unique":true,"name":"weapon_hatchet"},{"useable":false,"weight":1000,"type":"weapon","slot":4,"amount":3,"label":"Walther P99","description":"A small firearm designed to be held in one hand","image":"weapon_pistol.png","unique":true,"name":"weapon_pistol"},{"useable":false,"weight":1000,"type":"weapon","slot":5,"amount":1,"label":"SNS Pistol","description":"A very small firearm designed to be easily concealed","image":"weapon_snspistol.png","unique":true,"name":"weapon_snspistol"},{"useable":false,"weight":1000,"type":"weapon","slot":6,"amount":2,"label":"Vintage Pistol","description":"An antique firearm designed to be held in one hand","image":"weapon_vintagepistol.png","unique":true,"name":"weapon_vintagepistol"}]'),
	(45, '[ammunation(8)]', '[{"useable":false,"weight":1000,"type":"weapon","slot":1,"amount":72,"label":"Knife","description":"An instrument composed of a blade fixed into a handle, used for cutting or as a weapon","image":"weapon_knife.png","unique":true,"name":"weapon_knife"},{"useable":false,"weight":1000,"type":"weapon","slot":2,"amount":197,"label":"Bat","description":"Used for hitting a ball in sports (or other things)","image":"weapon_bat.png","unique":true,"name":"weapon_bat"},{"useable":false,"weight":1000,"type":"weapon","slot":3,"amount":66,"label":"Hatchet","description":"A small axe with a short handle for use in one hand","image":"weapon_hatchet.png","unique":true,"name":"weapon_hatchet"},{"useable":false,"weight":1000,"type":"weapon","slot":4,"amount":1,"label":"Walther P99","description":"A small firearm designed to be held in one hand","image":"weapon_pistol.png","unique":true,"name":"weapon_pistol"},{"useable":false,"weight":1000,"type":"weapon","slot":5,"amount":2,"label":"SNS Pistol","description":"A very small firearm designed to be easily concealed","image":"weapon_snspistol.png","unique":true,"name":"weapon_snspistol"},{"useable":false,"weight":1000,"type":"weapon","slot":6,"amount":1,"label":"Vintage Pistol","description":"An antique firearm designed to be held in one hand","image":"weapon_vintagepistol.png","unique":true,"name":"weapon_vintagepistol"}]'),
	(46, '[ammunation(9)]', '[{"useable":false,"weight":1000,"type":"weapon","slot":1,"amount":36,"label":"Knife","description":"An instrument composed of a blade fixed into a handle, used for cutting or as a weapon","image":"weapon_knife.png","unique":true,"name":"weapon_knife"},{"useable":false,"weight":1000,"type":"weapon","slot":2,"amount":31,"label":"Bat","description":"Used for hitting a ball in sports (or other things)","image":"weapon_bat.png","unique":true,"name":"weapon_bat"},{"useable":false,"weight":1000,"type":"weapon","slot":3,"amount":22,"label":"Hatchet","description":"A small axe with a short handle for use in one hand","image":"weapon_hatchet.png","unique":true,"name":"weapon_hatchet"},{"useable":false,"weight":1000,"type":"weapon","slot":4,"amount":3,"label":"Walther P99","description":"A small firearm designed to be held in one hand","image":"weapon_pistol.png","unique":true,"name":"weapon_pistol"},{"useable":false,"weight":1000,"type":"weapon","slot":5,"amount":1,"label":"SNS Pistol","description":"A very small firearm designed to be easily concealed","image":"weapon_snspistol.png","unique":true,"name":"weapon_snspistol"},{"useable":false,"weight":1000,"type":"weapon","slot":6,"amount":2,"label":"Vintage Pistol","description":"An antique firearm designed to be held in one hand","image":"weapon_vintagepistol.png","unique":true,"name":"weapon_vintagepistol"}]'),
	(34, '[beancoffee(1)]', '[{"useable":true,"weight":200,"type":"item","slot":1,"amount":187,"label":"Coffee","description":"Pump 4 Caffeine","image":"coffee.png","unique":false,"name":"coffee"},{"useable":false,"weight":0,"type":"item","slot":2,"amount":36,"label":"Lighter","description":"On new years eve a nice fire to stand next to","image":"lighter.png","unique":false,"name":"lighter"}]'),
	(35, '[beancoffee(2)]', '[{"useable":true,"weight":200,"type":"item","slot":1,"amount":100,"label":"Coffee","description":"Pump 4 Caffeine","image":"coffee.png","unique":false,"name":"coffee"},{"useable":false,"weight":0,"type":"item","slot":2,"amount":50,"label":"Lighter","description":"On new years eve a nice fire to stand next to","image":"lighter.png","unique":false,"name":"lighter"}]'),
	(36, '[casino(1)]', '[{"useable":false,"weight":0,"type":"item","slot":1,"amount":999999,"label":"Casino Chips","description":"Chips For Casino Gambling","image":"casinochips.png","unique":false,"name":"casinochips"}]'),
	(37, '[casino(2)]', '[{"useable":false,"weight":0,"type":"item","slot":1,"amount":999999,"label":"Casino Chips","description":"Chips For Casino Gambling","image":"casinochips.png","unique":false,"name":"casinochips"}]'),
	(33, '[casino2(1)]', '[{"useable":true,"weight":500,"type":"item","slot":1,"amount":21,"label":"Bottle of Water","description":"For all the thirsty out there","image":"water_bottle.png","unique":false,"name":"water_bottle"},{"useable":true,"weight":500,"type":"item","slot":2,"amount":23,"label":"Beer","description":"Nothing like a good cold beer!","image":"beer.png","unique":false,"name":"beer"},{"useable":true,"weight":500,"type":"item","slot":3,"amount":44,"label":"Whiskey","description":"For all the thirsty out there","image":"whiskey.png","unique":false,"name":"whiskey"},{"useable":true,"weight":500,"type":"item","slot":4,"amount":33,"label":"Vodka","description":"For all the thirsty out there","image":"vodka.png","unique":false,"name":"vodka"}]'),
	(32, '[delvecchioliquor(1)]', '[{"useable":true,"weight":200,"type":"item","slot":1,"amount":47,"label":"Grilled Cheese Sandwich","description":"Nice to eat","image":"tosti.png","unique":false,"name":"tosti"},{"useable":true,"weight":500,"type":"item","slot":2,"amount":39,"label":"Bottle of Water","description":"For all the thirsty out there","image":"water_bottle.png","unique":false,"name":"water_bottle"},{"useable":true,"weight":500,"type":"item","slot":3,"amount":25,"label":"Cola","description":"For all the thirsty out there","image":"cola.png","unique":false,"name":"kurkakola"},{"useable":true,"weight":100,"type":"item","slot":4,"amount":7,"label":"Twerks","description":"Some delicious candy :O","image":"twerks_candy.png","unique":false,"name":"twerks_candy"},{"useable":true,"weight":100,"type":"item","slot":5,"amount":2,"label":"Snikkel","description":"Some delicious candy :O","image":"snikkel_candy.png","unique":false,"name":"snikkel_candy"},{"useable":true,"weight":200,"type":"item","slot":6,"amount":44,"label":"Sandwich","description":"Nice bread for your stomach","image":"sandwich.png","unique":false,"name":"sandwich"},{"useable":true,"weight":500,"type":"item","slot":7,"amount":14,"label":"Beer","description":"Nothing like a good cold beer!","image":"beer.png","unique":false,"name":"beer"},{"useable":true,"weight":500,"type":"item","slot":8,"amount":8,"label":"Whiskey","description":"For all the thirsty out there","image":"whiskey.png","unique":false,"name":"whiskey"},{"useable":true,"weight":500,"type":"item","slot":9,"amount":25,"label":"Vodka","description":"For all the thirsty out there","image":"vodka.png","unique":false,"name":"vodka"},{"useable":true,"weight":0,"type":"item","slot":10,"amount":15,"label":"Bandage","description":"A bandage works every time","image":"bandage.png","unique":false,"name":"bandage"},{"useable":false,"weight":0,"type":"item","slot":11,"amount":3,"label":"Lighter","description":"On new years eve a nice fire to stand next to","image":"lighter.png","unique":false,"name":"lighter"},{"useable":false,"weight":0,"type":"item","slot":12,"amount":4760,"label":"Rolling Paper","description":"Paper made specifically for encasing and smoking tobacco or cannabis.","image":"rolling_paper.png","unique":false,"name":"rolling_paper"}]'),
	(23, '[digitalden(1)]', '[{"useable":false,"weight":700,"type":"item","slot":1,"amount":17,"label":"Phone","description":"Neat phone ya got there","image":"phone.png","unique":true,"name":"phone"},{"useable":true,"weight":2000,"type":"item","slot":2,"amount":38,"label":"Radio","description":"You can communicate with this through a signal","image":"radio.png","unique":true,"name":"radio"},{"useable":false,"weight":1000,"type":"item","slot":3,"amount":28,"label":"Toolkit","description":"Very useful to screw... screws...","image":"screwdriverset.png","unique":false,"name":"screwdriverset"},{"useable":true,"weight":600,"type":"item","slot":4,"amount":10,"label":"Binoculars","description":"Sneaky Breaky...","image":"binoculars.png","unique":false,"name":"binoculars"},{"useable":true,"weight":500,"type":"item","slot":5,"amount":41,"label":"Fitbit","description":"I like fitbit","image":"fitbit.png","unique":true,"name":"fitbit"},{"useable":true,"weight":1000,"type":"item","slot":6,"amount":4,"label":"Camera","description":"Camera to take pretty pictures.","image":"camera.png","unique":true,"name":"camera"}]'),
	(24, '[digitalden(2)]', '[{"useable":false,"weight":700,"type":"item","slot":1,"amount":8,"label":"Phone","description":"Neat phone ya got there","image":"phone.png","unique":true,"name":"phone"},{"useable":true,"weight":2000,"type":"item","slot":2,"amount":35,"label":"Radio","description":"You can communicate with this through a signal","image":"radio.png","unique":true,"name":"radio"},{"useable":false,"weight":1000,"type":"item","slot":3,"amount":25,"label":"Toolkit","description":"Very useful to screw... screws...","image":"screwdriverset.png","unique":false,"name":"screwdriverset"},{"useable":true,"weight":600,"type":"item","slot":4,"amount":16,"label":"Binoculars","description":"Sneaky Breaky...","image":"binoculars.png","unique":false,"name":"binoculars"},{"useable":true,"weight":500,"type":"item","slot":5,"amount":48,"label":"Fitbit","description":"I like fitbit","image":"fitbit.png","unique":true,"name":"fitbit"},{"useable":true,"weight":1000,"type":"item","slot":6,"amount":23,"label":"Camera","description":"Camera to take pretty pictures.","image":"camera.png","unique":true,"name":"camera"}]'),
	(25, '[digitalden(3)]', '[{"useable":false,"weight":700,"type":"item","slot":1,"amount":43,"label":"Phone","description":"Neat phone ya got there","image":"phone.png","unique":true,"name":"phone"},{"useable":true,"weight":2000,"type":"item","slot":2,"amount":2,"label":"Radio","description":"You can communicate with this through a signal","image":"radio.png","unique":true,"name":"radio"},{"useable":false,"weight":1000,"type":"item","slot":3,"amount":11,"label":"Toolkit","description":"Very useful to screw... screws...","image":"screwdriverset.png","unique":false,"name":"screwdriverset"},{"useable":true,"weight":600,"type":"item","slot":4,"amount":39,"label":"Binoculars","description":"Sneaky Breaky...","image":"binoculars.png","unique":false,"name":"binoculars"},{"useable":true,"weight":500,"type":"item","slot":5,"amount":32,"label":"Fitbit","description":"I like fitbit","image":"fitbit.png","unique":true,"name":"fitbit"},{"useable":true,"weight":1000,"type":"item","slot":6,"amount":47,"label":"Camera","description":"Camera to take pretty pictures.","image":"camera.png","unique":true,"name":"camera"}]'),
	(26, '[digitalden(4)]', '[{"useable":false,"weight":700,"type":"item","slot":1,"amount":41,"label":"Phone","description":"Neat phone ya got there","image":"phone.png","unique":true,"name":"phone"},{"useable":true,"weight":2000,"type":"item","slot":2,"amount":29,"label":"Radio","description":"You can communicate with this through a signal","image":"radio.png","unique":true,"name":"radio"},{"useable":false,"weight":1000,"type":"item","slot":3,"amount":2,"label":"Toolkit","description":"Very useful to screw... screws...","image":"screwdriverset.png","unique":false,"name":"screwdriverset"},{"useable":true,"weight":600,"type":"item","slot":4,"amount":41,"label":"Binoculars","description":"Sneaky Breaky...","image":"binoculars.png","unique":false,"name":"binoculars"},{"useable":true,"weight":500,"type":"item","slot":5,"amount":97,"label":"Fitbit","description":"I like fitbit","image":"fitbit.png","unique":true,"name":"fitbit"},{"useable":true,"weight":1000,"type":"item","slot":6,"amount":15,"label":"Camera","description":"Camera to take pretty pictures.","image":"camera.png","unique":true,"name":"camera"}]'),
	(27, '[digitalden(5)]', '[{"useable":false,"weight":700,"type":"item","slot":1,"amount":24,"label":"Phone","description":"Neat phone ya got there","image":"phone.png","unique":true,"name":"phone"},{"useable":true,"weight":2000,"type":"item","slot":2,"amount":37,"label":"Radio","description":"You can communicate with this through a signal","image":"radio.png","unique":true,"name":"radio"},{"useable":false,"weight":1000,"type":"item","slot":3,"amount":47,"label":"Toolkit","description":"Very useful to screw... screws...","image":"screwdriverset.png","unique":false,"name":"screwdriverset"},{"useable":true,"weight":600,"type":"item","slot":4,"amount":41,"label":"Binoculars","description":"Sneaky Breaky...","image":"binoculars.png","unique":false,"name":"binoculars"},{"useable":true,"weight":500,"type":"item","slot":5,"amount":112,"label":"Fitbit","description":"I like fitbit","image":"fitbit.png","unique":true,"name":"fitbit"},{"useable":true,"weight":1000,"type":"item","slot":6,"amount":2,"label":"Camera","description":"Camera to take pretty pictures.","image":"camera.png","unique":true,"name":"camera"}]'),
	(28, '[hardware(1)]', '[{"useable":true,"weight":300,"type":"item","slot":1,"amount":28,"label":"Lockpick","description":"Very useful if you lose your keys a lot.. or if you want to use it for something else...","image":"lockpick.png","unique":false,"name":"lockpick"},{"useable":false,"weight":1000,"type":"weapon","slot":2,"amount":201,"label":"Wrench","description":"A tool used for gripping and turning nuts, bolts, pipes, etc","image":"weapon_wrench.png","unique":true,"name":"weapon_wrench"},{"useable":false,"weight":1000,"type":"weapon","slot":3,"amount":171,"label":"Hammer","description":"Used for jobs such as breaking things (legs) and driving in nails","image":"weapon_hammer.png","unique":true,"name":"weapon_hammer"},{"useable":false,"weight":1000,"type":"weapon","slot":4,"amount":35,"label":"Bat","description":"Used for hitting a ball in sports (or other things)","image":"weapon_bat.png","unique":true,"name":"weapon_bat"},{"useable":true,"weight":2500,"type":"item","slot":5,"amount":46,"label":"Repairkit","description":"A nice toolbox with stuff to repair your vehicle","image":"repairkit.png","unique":false,"name":"repairkit"},{"useable":false,"weight":1000,"type":"item","slot":6,"amount":10,"label":"Toolkit","description":"Very useful to screw... screws...","image":"screwdriverset.png","unique":false,"name":"screwdriverset"},{"useable":false,"weight":700,"type":"item","slot":7,"amount":37,"label":"Phone","description":"Neat phone ya got there","image":"phone.png","unique":true,"name":"phone"},{"useable":true,"weight":2000,"type":"item","slot":8,"amount":39,"label":"Radio","description":"You can communicate with this through a signal","image":"radio.png","unique":true,"name":"radio"},{"useable":true,"weight":600,"type":"item","slot":9,"amount":16,"label":"Binoculars","description":"Sneaky Breaky...","image":"binoculars.png","unique":false,"name":"binoculars"},{"useable":true,"weight":1,"type":"item","slot":10,"amount":35,"label":"Skateboard","description":"a jimnastic board","image":"skateboard.png","unique":true,"name":"skateboard"},{"useable":true,"weight":500,"type":"item","slot":11,"amount":38,"label":"Fitbit","description":"I like fitbit","image":"fitbit.png","unique":true,"name":"fitbit"},{"useable":true,"weight":250,"type":"item","slot":12,"amount":123,"label":"Cleaning Kit","description":"A microfiber cloth with some soap will let your car sparkle again!","image":"cleaningkit.png","unique":false,"name":"cleaningkit"},{"useable":true,"weight":4000,"type":"item","slot":13,"amount":18,"label":"Advanced Repairkit","description":"A nice toolbox with stuff to repair your vehicle","image":"advancedkit.png","unique":false,"name":"advancedrepairkit"}]'),
	(29, '[hardware(2)]', '[{"useable":true,"weight":300,"type":"item","slot":1,"amount":48,"label":"Lockpick","description":"Very useful if you lose your keys a lot.. or if you want to use it for something else...","image":"lockpick.png","unique":false,"name":"lockpick"},{"useable":false,"weight":1000,"type":"weapon","slot":2,"amount":44,"label":"Wrench","description":"A tool used for gripping and turning nuts, bolts, pipes, etc","image":"weapon_wrench.png","unique":true,"name":"weapon_wrench"},{"useable":false,"weight":1000,"type":"weapon","slot":3,"amount":226,"label":"Hammer","description":"Used for jobs such as breaking things (legs) and driving in nails","image":"weapon_hammer.png","unique":true,"name":"weapon_hammer"},{"useable":false,"weight":1000,"type":"weapon","slot":4,"amount":12,"label":"Bat","description":"Used for hitting a ball in sports (or other things)","image":"weapon_bat.png","unique":true,"name":"weapon_bat"},{"useable":true,"weight":2500,"type":"item","slot":5,"amount":21,"label":"Repairkit","description":"A nice toolbox with stuff to repair your vehicle","image":"repairkit.png","unique":false,"name":"repairkit"},{"useable":false,"weight":1000,"type":"item","slot":6,"amount":37,"label":"Toolkit","description":"Very useful to screw... screws...","image":"screwdriverset.png","unique":false,"name":"screwdriverset"},{"useable":false,"weight":700,"type":"item","slot":7,"amount":22,"label":"Phone","description":"Neat phone ya got there","image":"phone.png","unique":true,"name":"phone"},{"useable":true,"weight":2000,"type":"item","slot":8,"amount":27,"label":"Radio","description":"You can communicate with this through a signal","image":"radio.png","unique":true,"name":"radio"},{"useable":true,"weight":600,"type":"item","slot":9,"amount":23,"label":"Binoculars","description":"Sneaky Breaky...","image":"binoculars.png","unique":false,"name":"binoculars"},{"useable":true,"weight":1,"type":"item","slot":10,"amount":6,"label":"Skateboard","description":"a jimnastic board","image":"skateboard.png","unique":true,"name":"skateboard"},{"useable":true,"weight":500,"type":"item","slot":11,"amount":55,"label":"Fitbit","description":"I like fitbit","image":"fitbit.png","unique":true,"name":"fitbit"},{"useable":true,"weight":250,"type":"item","slot":12,"amount":68,"label":"Cleaning Kit","description":"A microfiber cloth with some soap will let your car sparkle again!","image":"cleaningkit.png","unique":false,"name":"cleaningkit"},{"useable":true,"weight":4000,"type":"item","slot":13,"amount":34,"label":"Advanced Repairkit","description":"A nice toolbox with stuff to repair your vehicle","image":"advancedkit.png","unique":false,"name":"advancedrepairkit"}]'),
	(30, '[hardware(3)]', '[{"useable":true,"weight":300,"type":"item","slot":1,"amount":49,"label":"Lockpick","description":"Very useful if you lose your keys a lot.. or if you want to use it for something else...","image":"lockpick.png","unique":false,"name":"lockpick"},{"useable":false,"weight":1000,"type":"weapon","slot":2,"amount":52,"label":"Wrench","description":"A tool used for gripping and turning nuts, bolts, pipes, etc","image":"weapon_wrench.png","unique":true,"name":"weapon_wrench"},{"useable":false,"weight":1000,"type":"weapon","slot":3,"amount":83,"label":"Hammer","description":"Used for jobs such as breaking things (legs) and driving in nails","image":"weapon_hammer.png","unique":true,"name":"weapon_hammer"},{"useable":false,"weight":1000,"type":"weapon","slot":4,"amount":38,"label":"Bat","description":"Used for hitting a ball in sports (or other things)","image":"weapon_bat.png","unique":true,"name":"weapon_bat"},{"useable":true,"weight":2500,"type":"item","slot":5,"amount":44,"label":"Repairkit","description":"A nice toolbox with stuff to repair your vehicle","image":"repairkit.png","unique":false,"name":"repairkit"},{"useable":false,"weight":1000,"type":"item","slot":6,"amount":31,"label":"Toolkit","description":"Very useful to screw... screws...","image":"screwdriverset.png","unique":false,"name":"screwdriverset"},{"useable":false,"weight":700,"type":"item","slot":7,"amount":11,"label":"Phone","description":"Neat phone ya got there","image":"phone.png","unique":true,"name":"phone"},{"useable":true,"weight":2000,"type":"item","slot":8,"amount":2,"label":"Radio","description":"You can communicate with this through a signal","image":"radio.png","unique":true,"name":"radio"},{"useable":true,"weight":600,"type":"item","slot":9,"amount":27,"label":"Binoculars","description":"Sneaky Breaky...","image":"binoculars.png","unique":false,"name":"binoculars"},{"useable":true,"weight":1,"type":"item","slot":10,"amount":29,"label":"Skateboard","description":"a jimnastic board","image":"skateboard.png","unique":true,"name":"skateboard"},{"useable":true,"weight":500,"type":"item","slot":11,"amount":23,"label":"Fitbit","description":"I like fitbit","image":"fitbit.png","unique":true,"name":"fitbit"},{"useable":true,"weight":250,"type":"item","slot":12,"amount":147,"label":"Cleaning Kit","description":"A microfiber cloth with some soap will let your car sparkle again!","image":"cleaningkit.png","unique":false,"name":"cleaningkit"},{"useable":true,"weight":4000,"type":"item","slot":13,"amount":9,"label":"Advanced Repairkit","description":"A nice toolbox with stuff to repair your vehicle","image":"advancedkit.png","unique":false,"name":"advancedrepairkit"}]'),
	(22, '[leisureshop(1)]', '[{"useable":true,"weight":30000,"type":"item","slot":1,"amount":10,"label":"Parachute","description":"The sky is the limit! Woohoo!","image":"parachute.png","unique":true,"name":"parachute"},{"useable":true,"weight":600,"type":"item","slot":2,"amount":44,"label":"Binoculars","description":"Sneaky Breaky...","image":"binoculars.png","unique":false,"name":"binoculars"},{"useable":true,"weight":30000,"type":"item","slot":3,"amount":3,"label":"Diving Gear","description":"An oxygen tank and a rebreather","image":"diving_gear.png","unique":true,"name":"diving_gear"}]'),
	(31, '[lostmc(1)]', '[{"useable":true,"weight":200,"type":"item","slot":1,"amount":335,"label":"Coffee","description":"Pump 4 Caffeine","image":"coffee.png","unique":false,"name":"coffee"},{"useable":false,"weight":0,"type":"item","slot":2,"amount":49,"label":"Lighter","description":"On new years eve a nice fire to stand next to","image":"lighter.png","unique":false,"name":"lighter"}]'),
	(12, '[ltdgasoline(1)]', '[{"useable":true,"weight":200,"type":"item","slot":1,"amount":33,"label":"Grilled Cheese Sandwich","description":"Nice to eat","image":"tosti.png","unique":false,"name":"tosti"},{"useable":true,"weight":500,"type":"item","slot":2,"amount":36,"label":"Bottle of Water","description":"For all the thirsty out there","image":"water_bottle.png","unique":false,"name":"water_bottle"},{"useable":true,"weight":500,"type":"item","slot":3,"amount":12,"label":"Cola","description":"For all the thirsty out there","image":"cola.png","unique":false,"name":"kurkakola"},{"useable":true,"weight":100,"type":"item","slot":4,"amount":37,"label":"Twerks","description":"Some delicious candy :O","image":"twerks_candy.png","unique":false,"name":"twerks_candy"},{"useable":true,"weight":100,"type":"item","slot":5,"amount":40,"label":"Snikkel","description":"Some delicious candy :O","image":"snikkel_candy.png","unique":false,"name":"snikkel_candy"},{"useable":true,"weight":200,"type":"item","slot":6,"amount":40,"label":"Sandwich","description":"Nice bread for your stomach","image":"sandwich.png","unique":false,"name":"sandwich"},{"useable":true,"weight":500,"type":"item","slot":7,"amount":10,"label":"Beer","description":"Nothing like a good cold beer!","image":"beer.png","unique":false,"name":"beer"},{"useable":true,"weight":500,"type":"item","slot":8,"amount":47,"label":"Whiskey","description":"For all the thirsty out there","image":"whiskey.png","unique":false,"name":"whiskey"},{"useable":true,"weight":500,"type":"item","slot":9,"amount":41,"label":"Vodka","description":"For all the thirsty out there","image":"vodka.png","unique":false,"name":"vodka"},{"useable":true,"weight":0,"type":"item","slot":10,"amount":45,"label":"Bandage","description":"A bandage works every time","image":"bandage.png","unique":false,"name":"bandage"},{"useable":false,"weight":0,"type":"item","slot":11,"amount":37,"label":"Lighter","description":"On new years eve a nice fire to stand next to","image":"lighter.png","unique":false,"name":"lighter"},{"useable":false,"weight":0,"type":"item","slot":12,"amount":3052,"label":"Rolling Paper","description":"Paper made specifically for encasing and smoking tobacco or cannabis.","image":"rolling_paper.png","unique":false,"name":"rolling_paper"}]'),
	(13, '[ltdgasoline(2)]', '[{"useable":true,"weight":200,"type":"item","slot":1,"amount":31,"label":"Grilled Cheese Sandwich","description":"Nice to eat","image":"tosti.png","unique":false,"name":"tosti"},{"useable":true,"weight":500,"type":"item","slot":2,"amount":36,"label":"Bottle of Water","description":"For all the thirsty out there","image":"water_bottle.png","unique":false,"name":"water_bottle"},{"useable":true,"weight":500,"type":"item","slot":3,"amount":25,"label":"Cola","description":"For all the thirsty out there","image":"cola.png","unique":false,"name":"kurkakola"},{"useable":true,"weight":100,"type":"item","slot":4,"amount":17,"label":"Twerks","description":"Some delicious candy :O","image":"twerks_candy.png","unique":false,"name":"twerks_candy"},{"useable":true,"weight":100,"type":"item","slot":5,"amount":44,"label":"Snikkel","description":"Some delicious candy :O","image":"snikkel_candy.png","unique":false,"name":"snikkel_candy"},{"useable":true,"weight":200,"type":"item","slot":6,"amount":19,"label":"Sandwich","description":"Nice bread for your stomach","image":"sandwich.png","unique":false,"name":"sandwich"},{"useable":true,"weight":500,"type":"item","slot":7,"amount":12,"label":"Beer","description":"Nothing like a good cold beer!","image":"beer.png","unique":false,"name":"beer"},{"useable":true,"weight":500,"type":"item","slot":8,"amount":32,"label":"Whiskey","description":"For all the thirsty out there","image":"whiskey.png","unique":false,"name":"whiskey"},{"useable":true,"weight":500,"type":"item","slot":9,"amount":33,"label":"Vodka","description":"For all the thirsty out there","image":"vodka.png","unique":false,"name":"vodka"},{"useable":true,"weight":0,"type":"item","slot":10,"amount":17,"label":"Bandage","description":"A bandage works every time","image":"bandage.png","unique":false,"name":"bandage"},{"useable":false,"weight":0,"type":"item","slot":11,"amount":23,"label":"Lighter","description":"On new years eve a nice fire to stand next to","image":"lighter.png","unique":false,"name":"lighter"},{"useable":false,"weight":0,"type":"item","slot":12,"amount":1758,"label":"Rolling Paper","description":"Paper made specifically for encasing and smoking tobacco or cannabis.","image":"rolling_paper.png","unique":false,"name":"rolling_paper"}]'),
	(14, '[ltdgasoline(3)]', '[{"useable":true,"weight":200,"type":"item","slot":1,"amount":25,"label":"Grilled Cheese Sandwich","description":"Nice to eat","image":"tosti.png","unique":false,"name":"tosti"},{"useable":true,"weight":500,"type":"item","slot":2,"amount":38,"label":"Bottle of Water","description":"For all the thirsty out there","image":"water_bottle.png","unique":false,"name":"water_bottle"},{"useable":true,"weight":500,"type":"item","slot":3,"amount":22,"label":"Cola","description":"For all the thirsty out there","image":"cola.png","unique":false,"name":"kurkakola"},{"useable":true,"weight":100,"type":"item","slot":4,"amount":48,"label":"Twerks","description":"Some delicious candy :O","image":"twerks_candy.png","unique":false,"name":"twerks_candy"},{"useable":true,"weight":100,"type":"item","slot":5,"amount":41,"label":"Snikkel","description":"Some delicious candy :O","image":"snikkel_candy.png","unique":false,"name":"snikkel_candy"},{"useable":true,"weight":200,"type":"item","slot":6,"amount":23,"label":"Sandwich","description":"Nice bread for your stomach","image":"sandwich.png","unique":false,"name":"sandwich"},{"useable":true,"weight":500,"type":"item","slot":7,"amount":49,"label":"Beer","description":"Nothing like a good cold beer!","image":"beer.png","unique":false,"name":"beer"},{"useable":true,"weight":500,"type":"item","slot":8,"amount":45,"label":"Whiskey","description":"For all the thirsty out there","image":"whiskey.png","unique":false,"name":"whiskey"},{"useable":true,"weight":500,"type":"item","slot":9,"amount":17,"label":"Vodka","description":"For all the thirsty out there","image":"vodka.png","unique":false,"name":"vodka"},{"useable":true,"weight":0,"type":"item","slot":10,"amount":31,"label":"Bandage","description":"A bandage works every time","image":"bandage.png","unique":false,"name":"bandage"},{"useable":false,"weight":0,"type":"item","slot":11,"amount":17,"label":"Lighter","description":"On new years eve a nice fire to stand next to","image":"lighter.png","unique":false,"name":"lighter"},{"useable":false,"weight":0,"type":"item","slot":12,"amount":480,"label":"Rolling Paper","description":"Paper made specifically for encasing and smoking tobacco or cannabis.","image":"rolling_paper.png","unique":false,"name":"rolling_paper"}]'),
	(15, '[ltdgasoline(4)]', '[{"useable":true,"weight":200,"type":"item","slot":1,"amount":35,"label":"Grilled Cheese Sandwich","description":"Nice to eat","image":"tosti.png","unique":false,"name":"tosti"},{"useable":true,"weight":500,"type":"item","slot":2,"amount":19,"label":"Bottle of Water","description":"For all the thirsty out there","image":"water_bottle.png","unique":false,"name":"water_bottle"},{"useable":true,"weight":500,"type":"item","slot":3,"amount":27,"label":"Cola","description":"For all the thirsty out there","image":"cola.png","unique":false,"name":"kurkakola"},{"useable":true,"weight":100,"type":"item","slot":4,"amount":20,"label":"Twerks","description":"Some delicious candy :O","image":"twerks_candy.png","unique":false,"name":"twerks_candy"},{"useable":true,"weight":100,"type":"item","slot":5,"amount":1,"label":"Snikkel","description":"Some delicious candy :O","image":"snikkel_candy.png","unique":false,"name":"snikkel_candy"},{"useable":true,"weight":200,"type":"item","slot":6,"amount":14,"label":"Sandwich","description":"Nice bread for your stomach","image":"sandwich.png","unique":false,"name":"sandwich"},{"useable":true,"weight":500,"type":"item","slot":7,"amount":5,"label":"Beer","description":"Nothing like a good cold beer!","image":"beer.png","unique":false,"name":"beer"},{"useable":true,"weight":500,"type":"item","slot":8,"amount":8,"label":"Whiskey","description":"For all the thirsty out there","image":"whiskey.png","unique":false,"name":"whiskey"},{"useable":true,"weight":500,"type":"item","slot":9,"amount":30,"label":"Vodka","description":"For all the thirsty out there","image":"vodka.png","unique":false,"name":"vodka"},{"useable":true,"weight":0,"type":"item","slot":10,"amount":20,"label":"Bandage","description":"A bandage works every time","image":"bandage.png","unique":false,"name":"bandage"},{"useable":false,"weight":0,"type":"item","slot":11,"amount":32,"label":"Lighter","description":"On new years eve a nice fire to stand next to","image":"lighter.png","unique":false,"name":"lighter"},{"useable":false,"weight":0,"type":"item","slot":12,"amount":1910,"label":"Rolling Paper","description":"Paper made specifically for encasing and smoking tobacco or cannabis.","image":"rolling_paper.png","unique":false,"name":"rolling_paper"}]'),
	(16, '[robsliquor(1)]', '[{"useable":true,"weight":500,"type":"item","slot":1,"amount":5,"label":"Bottle of Water","description":"For all the thirsty out there","image":"water_bottle.png","unique":false,"name":"water_bottle"},{"useable":true,"weight":500,"type":"item","slot":2,"amount":29,"label":"Beer","description":"Nothing like a good cold beer!","image":"beer.png","unique":false,"name":"beer"},{"useable":true,"weight":500,"type":"item","slot":3,"amount":48,"label":"Whiskey","description":"For all the thirsty out there","image":"whiskey.png","unique":false,"name":"whiskey"},{"useable":true,"weight":500,"type":"item","slot":4,"amount":3,"label":"Vodka","description":"For all the thirsty out there","image":"vodka.png","unique":false,"name":"vodka"}]'),
	(17, '[robsliquor(2)]', '[{"useable":true,"weight":500,"type":"item","slot":1,"amount":26,"label":"Bottle of Water","description":"For all the thirsty out there","image":"water_bottle.png","unique":false,"name":"water_bottle"},{"useable":true,"weight":500,"type":"item","slot":2,"amount":38,"label":"Beer","description":"Nothing like a good cold beer!","image":"beer.png","unique":false,"name":"beer"},{"useable":true,"weight":500,"type":"item","slot":3,"amount":23,"label":"Whiskey","description":"For all the thirsty out there","image":"whiskey.png","unique":false,"name":"whiskey"},{"useable":true,"weight":500,"type":"item","slot":4,"amount":25,"label":"Vodka","description":"For all the thirsty out there","image":"vodka.png","unique":false,"name":"vodka"}]'),
	(18, '[robsliquor(3)]', '[{"useable":true,"weight":500,"type":"item","slot":1,"amount":14,"label":"Bottle of Water","description":"For all the thirsty out there","image":"water_bottle.png","unique":false,"name":"water_bottle"},{"useable":true,"weight":500,"type":"item","slot":2,"amount":30,"label":"Beer","description":"Nothing like a good cold beer!","image":"beer.png","unique":false,"name":"beer"},{"useable":true,"weight":500,"type":"item","slot":3,"amount":15,"label":"Whiskey","description":"For all the thirsty out there","image":"whiskey.png","unique":false,"name":"whiskey"},{"useable":true,"weight":500,"type":"item","slot":4,"amount":5,"label":"Vodka","description":"For all the thirsty out there","image":"vodka.png","unique":false,"name":"vodka"}]'),
	(19, '[robsliquor(4)]', '[{"useable":true,"weight":500,"type":"item","slot":1,"amount":20,"label":"Bottle of Water","description":"For all the thirsty out there","image":"water_bottle.png","unique":false,"name":"water_bottle"},{"useable":true,"weight":500,"type":"item","slot":2,"amount":21,"label":"Beer","description":"Nothing like a good cold beer!","image":"beer.png","unique":false,"name":"beer"},{"useable":true,"weight":500,"type":"item","slot":3,"amount":12,"label":"Whiskey","description":"For all the thirsty out there","image":"whiskey.png","unique":false,"name":"whiskey"},{"useable":true,"weight":500,"type":"item","slot":4,"amount":41,"label":"Vodka","description":"For all the thirsty out there","image":"vodka.png","unique":false,"name":"vodka"}]'),
	(20, '[robsliquor(5)]', '[{"useable":true,"weight":500,"type":"item","slot":1,"amount":12,"label":"Bottle of Water","description":"For all the thirsty out there","image":"water_bottle.png","unique":false,"name":"water_bottle"},{"useable":true,"weight":500,"type":"item","slot":2,"amount":16,"label":"Beer","description":"Nothing like a good cold beer!","image":"beer.png","unique":false,"name":"beer"},{"useable":true,"weight":500,"type":"item","slot":3,"amount":45,"label":"Whiskey","description":"For all the thirsty out there","image":"whiskey.png","unique":false,"name":"whiskey"},{"useable":true,"weight":500,"type":"item","slot":4,"amount":43,"label":"Vodka","description":"For all the thirsty out there","image":"vodka.png","unique":false,"name":"vodka"}]'),
	(21, '[seaworld(1)]', '[{"useable":true,"weight":30000,"type":"item","slot":1,"amount":5,"label":"Diving Gear","description":"An oxygen tank and a rebreather","image":"diving_gear.png","unique":true,"name":"diving_gear"},{"useable":true,"weight":20000,"type":"item","slot":2,"amount":8,"label":"Jerrycan 20L","description":"A can full of Fuel","image":"jerry_can.png","unique":false,"name":"jerry_can"}]'),
	(48, '[weedshop(1)]', '[{"useable":true,"weight":0,"type":"item","slot":1,"amount":140,"label":"Joint","description":"Sidney would be very proud at you","image":"joint.png","unique":false,"name":"joint"},{"useable":false,"weight":1000,"type":"weapon","slot":2,"amount":622,"label":"Poolcue","description":"A stick used to strike a ball, usually the cue ball (or other things)","image":"weapon_poolcue.png","unique":true,"name":"weapon_poolcue"},{"useable":true,"weight":2000,"type":"item","slot":3,"amount":969,"label":"Plant Fertilizer","description":"Plant nutrition","image":"weed_nutrition.png","unique":false,"name":"weed_nutrition"},{"useable":true,"weight":0,"type":"item","slot":4,"amount":595,"label":"Empty Weed Bag","description":"A small empty bag","image":"weed_baggy_empty.png","unique":false,"name":"empty_weed_bag"},{"useable":false,"weight":0,"type":"item","slot":5,"amount":567,"label":"Rolling Paper","description":"Paper made specifically for encasing and smoking tobacco or cannabis.","image":"rolling_paper.png","unique":false,"name":"rolling_paper"}]');

-- Dumping structure for table qbcoreframework_ae7ad2.trunkitems
CREATE TABLE IF NOT EXISTS `trunkitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) NOT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`plate`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table qbcoreframework_ae7ad2.trunkitems: ~0 rows (approximately)

-- Dumping structure for table qbcoreframework_ae7ad2.weedplants
CREATE TABLE IF NOT EXISTS `weedplants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coords` longtext NOT NULL CHECK (json_valid(`coords`)),
  `time` int(255) NOT NULL,
  `fertilizer` longtext NOT NULL CHECK (json_valid(`fertilizer`)),
  `water` longtext NOT NULL CHECK (json_valid(`water`)),
  `gender` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table qbcoreframework_ae7ad2.weedplants: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

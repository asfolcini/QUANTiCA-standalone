-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versione server:              10.3.11-MariaDB - mariadb.org binary distribution
-- S.O. server:                  Win64
-- HeidiSQL Versione:            9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dump della struttura del database db-quantica-core
DROP DATABASE IF EXISTS `db-quantica-core`;
CREATE DATABASE IF NOT EXISTS `db-quantica-core` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `db-quantica-core`;

CREATE USER 'quantica_usr'@'%' IDENTIFIED BY 'quantica_psw';
GRANT ALL PRIVILEGES ON *.* TO 'quantica_usr'@'%';

-- Dump della struttura di tabella db-quantica-core.brokers
DROP TABLE IF EXISTS `brokers`;
CREATE TABLE IF NOT EXISTS `brokers` (
  `runID` varchar(100) NOT NULL,
  `brokerID` varchar(60) NOT NULL,
  `brokerDescription` varchar(200) DEFAULT NULL,
  `initialBalance` double NOT NULL,
  `balance` double NOT NULL,
  `currency` varchar(10) NOT NULL,
  `creditLimit` double DEFAULT NULL,
  `PnL` double NOT NULL,
  `UPnL` double NOT NULL,
  `Fees` double NOT NULL,
  `ReturnOnAccount` double NOT NULL,
  `InvestedAmount` double NOT NULL,
  `creationTS` timestamp NOT NULL DEFAULT current_timestamp(),
  `lastupdateTS` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`runID`,`brokerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella db-quantica-core.brokers: ~37 rows (circa)
/*!40000 ALTER TABLE `brokers` DISABLE KEYS */;
/*!40000 ALTER TABLE `brokers` ENABLE KEYS */;

-- Dump della struttura di tabella db-quantica-core.candleevents
DROP TABLE IF EXISTS `candleevents`;
CREATE TABLE IF NOT EXISTS `candleevents` (
  `runID` varchar(100) NOT NULL,
  `symbol` varchar(20) NOT NULL,
  `isin` varchar(12) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `timeStamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `highTimeStamp` timestamp NULL DEFAULT NULL,
  `lowTimeStamp` timestamp NULL DEFAULT NULL,
  `openPrice` double DEFAULT NULL,
  `highPrice` double DEFAULT NULL,
  `lowPrice` double DEFAULT NULL,
  `closePrice` double DEFAULT NULL,
  `volume` int(11) DEFAULT 0,
  `timeFrame` varchar(20) NOT NULL,
  `creationTS` timestamp NOT NULL DEFAULT current_timestamp(),
  `lastupdateTS` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`runID`,`symbol`,`timeStamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella db-quantica-core.candleevents: ~26.042 rows (circa)
/*!40000 ALTER TABLE `candleevents` DISABLE KEYS */;
/*!40000 ALTER TABLE `candleevents` ENABLE KEYS */;

-- Dump della struttura di tabella db-quantica-core.orders
DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `runID` varchar(100) NOT NULL,
  `strategyID` varchar(60) DEFAULT NULL,
  `orderID` varchar(60) NOT NULL,
  `brokerID` varchar(60) NOT NULL,
  `orderSide` varchar(20) NOT NULL,
  `orderType` varchar(20) NOT NULL,
  `orderStatus` varchar(20) NOT NULL,
  `symbol` varchar(20) NOT NULL,
  `expirationTimeStamp` timestamp NULL DEFAULT NULL,
  `executionTargetTimeStamp` timestamp NULL DEFAULT NULL,
  `orderCreationTimeStamp` timestamp NULL DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `quantityToFill` int(11) DEFAULT NULL,
  `limitPrice` double DEFAULT NULL,
  `stopPrice` double DEFAULT NULL,
  `creationTS` timestamp NOT NULL DEFAULT current_timestamp(),
  `lastupdateTS` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`orderID`,`runID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella db-quantica-core.orders: ~286 rows (circa)
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- Dump della struttura di tabella db-quantica-core.positions
DROP TABLE IF EXISTS `positions`;
CREATE TABLE IF NOT EXISTS `positions` (
  `runID` varchar(100) NOT NULL,
  `positionID` varchar(60) NOT NULL,
  `brokerID` varchar(60) NOT NULL,
  `strategyID` varchar(60) DEFAULT NULL,
  `positionOpenTS` timestamp NULL DEFAULT NULL,
  `positionCloseTS` timestamp NULL DEFAULT NULL,
  `symbol` varchar(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `averagePrice` double DEFAULT NULL,
  `marketPrice` double DEFAULT NULL,
  `marketValue` double DEFAULT NULL,
  `profitAndLoss` double DEFAULT NULL,
  `positionSide` varchar(20) DEFAULT NULL,
  `positionStatus` varchar(20) DEFAULT NULL,
  `creationTS` timestamp NOT NULL DEFAULT current_timestamp(),
  `lastupdateTS` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`positionID`,`runID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella db-quantica-core.positions: ~99 rows (circa)
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
/*!40000 ALTER TABLE `positions` ENABLE KEYS */;

-- Dump della struttura di tabella db-quantica-core.positions_orders
DROP TABLE IF EXISTS `positions_orders`;
CREATE TABLE IF NOT EXISTS `positions_orders` (
  `runID` varchar(100) NOT NULL,
  `positionID` varchar(60) NOT NULL,
  `orderID` varchar(60) NOT NULL,
  `creationTS` timestamp NOT NULL DEFAULT current_timestamp(),
  `lastupdateTS` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`runID`,`positionID`,`orderID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella db-quantica-core.positions_orders: ~298 rows (circa)
/*!40000 ALTER TABLE `positions_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `positions_orders` ENABLE KEYS */;

-- Dump della struttura di procedura db-quantica-core.REMOVE_runID
DROP PROCEDURE IF EXISTS `REMOVE_runID`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `REMOVE_runID`(
	IN `_runID` VARCHAR(100)

)
    COMMENT 'Delete all DB entries of a given runID'
BEGIN
	DELETE FROM brokers 		WHERE runID=_runID;
	DELETE FROM orders		WHERE runID=_runID;
	DELETE FROM positions	WHERE runID=_runID;
	DELETE FROM positions_orders WHERE runID=_runID;
	DELETE FROM transactions WHERE runID=_runID;
	DELETE FROM candleevents WHERE runID=_runID;
	DELETE FROM runids WHERE runID=_runID;
END//
DELIMITER ;

-- Dump della struttura di tabella db-quantica-core.runids
DROP TABLE IF EXISTS `runids`;
CREATE TABLE IF NOT EXISTS `runids` (
  `runID` varchar(100) NOT NULL,
  `userID` varchar(100) NOT NULL,
  `elapsed` bigint(20) DEFAULT NULL COMMENT 'millis',
  `mode` varchar(20) DEFAULT NULL,
  `creationTS` timestamp NOT NULL DEFAULT current_timestamp(),
  `lastupdateTS` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`runID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella db-quantica-core.runids: ~44 rows (circa)
/*!40000 ALTER TABLE `runids` DISABLE KEYS */;
/*!40000 ALTER TABLE `runids` ENABLE KEYS */;

-- Dump della struttura di tabella db-quantica-core.transactions
DROP TABLE IF EXISTS `transactions`;
CREATE TABLE IF NOT EXISTS `transactions` (
  `runID` varchar(100) NOT NULL,
  `transactionID` varchar(60) NOT NULL,
  `orderID` varchar(60) NOT NULL,
  `brokerID` varchar(60) NOT NULL,
  `strategyID` varchar(60) DEFAULT NULL,
  `positionID` varchar(60) DEFAULT NULL,
  `symbol` varchar(20) NOT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  `side` varchar(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double DEFAULT NULL,
  `fees` double DEFAULT NULL,
  `creationTS` timestamp NOT NULL DEFAULT current_timestamp(),
  `lastupdateTS` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`runID`,`transactionID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella db-quantica-core.transactions: ~282 rows (circa)
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;

-- Dump della struttura di procedura db-quantica-core.TRUNCATE_ALL
DROP PROCEDURE IF EXISTS `TRUNCATE_ALL`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `TRUNCATE_ALL`()
    COMMENT 'Empty the whole DB'
BEGIN
	TRUNCATE brokers;
	TRUNCATE orders;
	TRUNCATE positions;
	TRUNCATE positions_orders;
	TRUNCATE transactions;
	TRUNCATE candleevents;
	TRUNCATE runids;
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

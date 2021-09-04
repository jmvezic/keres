-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: localhost    Database: DB_WCT
-- ------------------------------------------------------
-- Server version	5.7.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ABSTRACT_TARGET`
--

DROP TABLE IF EXISTS `ABSTRACT_TARGET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ABSTRACT_TARGET` (
  `AT_OID` bigint(20) NOT NULL,
  `AT_DESC` text,
  `AT_NAME` varchar(191) DEFAULT NULL,
  `AT_OWNER_ID` bigint(20) DEFAULT NULL,
  `AT_PROF_OVERRIDE_OID` bigint(20) DEFAULT NULL,
  `AT_STATE` int(11) DEFAULT NULL,
  `T_PROFILE_ID` bigint(20) DEFAULT NULL,
  `AT_OBJECT_TYPE` int(11) DEFAULT NULL,
  `AT_CREATION_DATE` timestamp NULL DEFAULT NULL,
  `AT_REFERENCE` varchar(255) DEFAULT NULL,
  `AT_PROFILE_NOTE` varchar(255) DEFAULT NULL,
  `AT_DUBLIN_CORE_OID` bigint(20) DEFAULT NULL,
  `AT_ACCESS_ZONE` int(11) NOT NULL DEFAULT '0',
  `AT_DISPLAY_TARGET` bit(1) NOT NULL DEFAULT b'1',
  `AT_DISPLAY_NOTE` text,
  `AT_DISPLAY_CHG_REASON` text,
  `AT_RR_OID` bigint(20) DEFAULT NULL,
  `AT_CRAWLS` bigint(20) DEFAULT NULL,
  `AT_REFERENCE_CRAWL_OID` bigint(20) DEFAULT NULL,
  `AT_AUTO_PRUNE` tinyint(1) NOT NULL DEFAULT '0',
  `AT_AUTO_DENOTE_REFERENCE_CRAWL` tinyint(1) NOT NULL DEFAULT '0',
  `AT_REQUEST_TO_ARCHIVISTS` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`AT_OID`),
  UNIQUE KEY `AT_NAME_AND_TYPE` (`AT_NAME`,`AT_OBJECT_TYPE`),
  KEY `FK_AT_DUBLIN_CORE_OID` (`AT_DUBLIN_CORE_OID`),
  KEY `FK_T_PROF_OVERRIDE_OID` (`AT_PROF_OVERRIDE_OID`),
  KEY `FKB6DD784E5C2C497` (`AT_OWNER_ID`),
  KEY `FKB6DD784E3A83A603` (`T_PROFILE_ID`),
  KEY `FK_AT_RR_OID` (`AT_RR_OID`),
  CONSTRAINT `FKB6DD784E3A83A603` FOREIGN KEY (`T_PROFILE_ID`) REFERENCES `PROFILE` (`P_OID`),
  CONSTRAINT `FKB6DD784E5C2C497` FOREIGN KEY (`AT_OWNER_ID`) REFERENCES `WCTUSER` (`USR_OID`),
  CONSTRAINT `FK_AT_DUBLIN_CORE_OID` FOREIGN KEY (`AT_DUBLIN_CORE_OID`) REFERENCES `DUBLIN_CORE` (`DC_OID`),
  CONSTRAINT `FK_AT_RR_OID` FOREIGN KEY (`AT_RR_OID`) REFERENCES `REJECTION_REASON` (`RR_OID`),
  CONSTRAINT `FK_T_PROF_OVERRIDE_OID` FOREIGN KEY (`AT_PROF_OVERRIDE_OID`) REFERENCES `PROFILE_OVERRIDES` (`PO_OID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ABSTRACT_TARGET`
--

LOCK TABLES `ABSTRACT_TARGET` WRITE;
/*!40000 ALTER TABLE `ABSTRACT_TARGET` DISABLE KEYS */;
/*!40000 ALTER TABLE `ABSTRACT_TARGET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `ABSTRACT_TARGET_GROUPTYPE_VIEW`
--

DROP TABLE IF EXISTS `ABSTRACT_TARGET_GROUPTYPE_VIEW`;
/*!50001 DROP VIEW IF EXISTS `ABSTRACT_TARGET_GROUPTYPE_VIEW`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `ABSTRACT_TARGET_GROUPTYPE_VIEW` AS SELECT 
 1 AS `at_oid`,
 1 AS `at_desc`,
 1 AS `at_name`,
 1 AS `at_owner_id`,
 1 AS `at_prof_override_oid`,
 1 AS `at_state`,
 1 AS `t_profile_id`,
 1 AS `at_object_type`,
 1 AS `at_creation_date`,
 1 AS `at_reference`,
 1 AS `at_profile_note`,
 1 AS `at_dublin_core_oid`,
 1 AS `at_access_zone`,
 1 AS `at_display_target`,
 1 AS `at_display_note`,
 1 AS `tg_type`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `ABSTRACT_TARGET_SCHEDULE_VIEW`
--

DROP TABLE IF EXISTS `ABSTRACT_TARGET_SCHEDULE_VIEW`;
/*!50001 DROP VIEW IF EXISTS `ABSTRACT_TARGET_SCHEDULE_VIEW`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `ABSTRACT_TARGET_SCHEDULE_VIEW` AS SELECT 
 1 AS `thekey`,
 1 AS `at_object_type_desc`,
 1 AS `at_name`,
 1 AS `at_state`,
 1 AS `usr_username`,
 1 AS `agc_name`,
 1 AS `s_oid`,
 1 AS `s_start`,
 1 AS `s_end`,
 1 AS `s_type`,
 1 AS `s_cron`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `AGENCY`
--

DROP TABLE IF EXISTS `AGENCY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AGENCY` (
  `AGC_OID` bigint(20) NOT NULL,
  `AGC_NAME` varchar(80) NOT NULL,
  `AGC_ADDRESS` varchar(255) NOT NULL,
  `AGC_LOGO_URL` varchar(255) DEFAULT NULL,
  `AGC_URL` varchar(255) DEFAULT NULL,
  `AGC_EMAIL` varchar(80) DEFAULT NULL,
  `AGC_FAX` varchar(20) DEFAULT NULL,
  `AGC_PHONE` varchar(20) DEFAULT NULL,
  `AGC_SHOW_TASKS` tinyint(1) NOT NULL DEFAULT '1',
  `AGC_DEFAULT_DESC_TYPE` varchar(50) DEFAULT '',
  PRIMARY KEY (`AGC_OID`),
  UNIQUE KEY `AGC_NAME` (`AGC_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AGENCY`
--

LOCK TABLES `AGENCY` WRITE;
/*!40000 ALTER TABLE `AGENCY` DISABLE KEYS */;
INSERT INTO `AGENCY` VALUES (0,'bootstrap','NA',NULL,NULL,NULL,NULL,NULL,1,'');
/*!40000 ALTER TABLE `AGENCY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ANNOTATIONS`
--

DROP TABLE IF EXISTS `ANNOTATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANNOTATIONS` (
  `AN_OID` bigint(20) NOT NULL,
  `AN_DATE` datetime NOT NULL,
  `AN_NOTE` text NOT NULL,
  `AN_USER_OID` bigint(20) NOT NULL,
  `AN_OBJ_OID` bigint(20) NOT NULL,
  `AN_OBJ_TYPE` text NOT NULL,
  `AN_ALERTABLE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`AN_OID`),
  KEY `FK_NOTE_USER_OID` (`AN_USER_OID`),
  CONSTRAINT `FK_NOTE_USER_OID` FOREIGN KEY (`AN_USER_OID`) REFERENCES `WCTUSER` (`USR_OID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ANNOTATIONS`
--

LOCK TABLES `ANNOTATIONS` WRITE;
/*!40000 ALTER TABLE `ANNOTATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `ANNOTATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ARC_HARVEST_FILE`
--

DROP TABLE IF EXISTS `ARC_HARVEST_FILE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ARC_HARVEST_FILE` (
  `AHF_OID` bigint(20) NOT NULL,
  `AHF_COMPRESSED` bit(1) NOT NULL,
  `AHF_NAME` varchar(100) NOT NULL,
  `AHF_ARC_HARVEST_RESULT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AHF_OID`),
  UNIQUE KEY `AHF_NAME` (`AHF_NAME`),
  KEY `FK_AHR_ARC_HARVEST_RESULT_ID` (`AHF_ARC_HARVEST_RESULT_ID`),
  KEY `IX_AHF_ARC_HARVEST_RESULT_ID` (`AHF_ARC_HARVEST_RESULT_ID`),
  CONSTRAINT `FK_AHR_ARC_HARVEST_RESULT_ID` FOREIGN KEY (`AHF_ARC_HARVEST_RESULT_ID`) REFERENCES `ARC_HARVEST_RESULT` (`AHRS_HARVEST_RESULT_OID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ARC_HARVEST_FILE`
--

LOCK TABLES `ARC_HARVEST_FILE` WRITE;
/*!40000 ALTER TABLE `ARC_HARVEST_FILE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ARC_HARVEST_FILE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ARC_HARVEST_RESOURCE`
--

DROP TABLE IF EXISTS `ARC_HARVEST_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ARC_HARVEST_RESOURCE` (
  `AHRC_HARVEST_RESOURCE_OID` bigint(20) NOT NULL,
  `AHRC_RESOURCE_LENGTH` bigint(20) NOT NULL,
  `AHRC_RESOURCE_OFFSET` bigint(20) NOT NULL,
  `AHRC_ARC_FILE_NAME` varchar(100) NOT NULL,
  `AHRC_COMPRESSED_YN` bit(1) NOT NULL,
  PRIMARY KEY (`AHRC_HARVEST_RESOURCE_OID`),
  KEY `FK6D84FEB12FF8F14B` (`AHRC_HARVEST_RESOURCE_OID`),
  CONSTRAINT `FK6D84FEB12FF8F14B` FOREIGN KEY (`AHRC_HARVEST_RESOURCE_OID`) REFERENCES `HARVEST_RESOURCE` (`HRC_OID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ARC_HARVEST_RESOURCE`
--

LOCK TABLES `ARC_HARVEST_RESOURCE` WRITE;
/*!40000 ALTER TABLE `ARC_HARVEST_RESOURCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ARC_HARVEST_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ARC_HARVEST_RESULT`
--

DROP TABLE IF EXISTS `ARC_HARVEST_RESULT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ARC_HARVEST_RESULT` (
  `AHRS_HARVEST_RESULT_OID` bigint(20) NOT NULL,
  PRIMARY KEY (`AHRS_HARVEST_RESULT_OID`),
  KEY `FKE39C5380C88A38D9` (`AHRS_HARVEST_RESULT_OID`),
  CONSTRAINT `FKE39C5380C88A38D9` FOREIGN KEY (`AHRS_HARVEST_RESULT_OID`) REFERENCES `HARVEST_RESULT` (`HR_OID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ARC_HARVEST_RESULT`
--

LOCK TABLES `ARC_HARVEST_RESULT` WRITE;
/*!40000 ALTER TABLE `ARC_HARVEST_RESULT` DISABLE KEYS */;
/*!40000 ALTER TABLE `ARC_HARVEST_RESULT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHORISING_AGENT`
--

DROP TABLE IF EXISTS `AUTHORISING_AGENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUTHORISING_AGENT` (
  `AA_OID` bigint(20) NOT NULL,
  `AA_NAME` varchar(191) DEFAULT NULL,
  `AA_ADRESS` text,
  `AA_CONTACT` varchar(255) DEFAULT NULL,
  `AA_EMAIL` varchar(255) DEFAULT NULL,
  `AA_PHONE_NUMBER` varchar(32) DEFAULT NULL,
  `AA_DESC` text,
  PRIMARY KEY (`AA_OID`),
  UNIQUE KEY `AA_NAME` (`AA_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHORISING_AGENT`
--

LOCK TABLES `AUTHORISING_AGENT` WRITE;
/*!40000 ALTER TABLE `AUTHORISING_AGENT` DISABLE KEYS */;
INSERT INTO `AUTHORISING_AGENT` VALUES (2,'Default agency','','wct@example.com','wct@example.com','','');
/*!40000 ALTER TABLE `AUTHORISING_AGENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BANDWIDTH_RESTRICTIONS`
--

DROP TABLE IF EXISTS `BANDWIDTH_RESTRICTIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BANDWIDTH_RESTRICTIONS` (
  `BR_OID` bigint(20) NOT NULL,
  `BR_BANDWIDTH` bigint(20) NOT NULL,
  `BR_DAY` varchar(9) NOT NULL,
  `BR_END_TIME` datetime NOT NULL,
  `BR_START_TIME` datetime NOT NULL,
  `BR_OPTIMIZATION_ALLOWED` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`BR_OID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BANDWIDTH_RESTRICTIONS`
--

LOCK TABLES `BANDWIDTH_RESTRICTIONS` WRITE;
/*!40000 ALTER TABLE `BANDWIDTH_RESTRICTIONS` DISABLE KEYS */;
INSERT INTO `BANDWIDTH_RESTRICTIONS` VALUES (1,5000,'MONDAY','1972-11-09 23:59:59','1972-11-09 00:00:00',1),(2,5000,'TUESDAY','1972-11-09 23:59:59','1972-11-09 00:00:00',1),(3,5000,'WEDNESDAY','1972-11-09 23:59:59','1972-11-09 00:00:00',1),(4,5000,'THURSDAY','1972-11-09 23:59:59','1972-11-09 00:00:00',1),(5,5000,'FRIDAY','1972-11-09 23:59:59','1972-11-09 00:00:00',1),(6,5000,'SATURDAY','1972-11-09 23:59:59','1972-11-09 00:00:00',1),(7,5000,'SUNDAY','1972-11-09 23:59:59','1972-11-09 00:00:00',1);
/*!40000 ALTER TABLE `BANDWIDTH_RESTRICTIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DUBLIN_CORE`
--

DROP TABLE IF EXISTS `DUBLIN_CORE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DUBLIN_CORE` (
  `DC_OID` bigint(20) NOT NULL,
  `DC_CONTRIBUTOR` varchar(255) DEFAULT NULL,
  `DC_COVERAGE` varchar(255) DEFAULT NULL,
  `DC_CREATOR` varchar(255) DEFAULT NULL,
  `DC_DESCRIPTION` text,
  `DC_FORMAT` varchar(255) DEFAULT NULL,
  `DC_IDENTIFIER` varchar(255) DEFAULT NULL,
  `DC_IDENTIFIER_ISBN` varchar(13) DEFAULT NULL,
  `DC_IDENTIFIER_ISSN` varchar(9) DEFAULT NULL,
  `DC_LANGUAGE` varchar(255) DEFAULT NULL,
  `DC_PUBLISHER` varchar(255) DEFAULT NULL,
  `DC_RELATION` varchar(255) DEFAULT NULL,
  `DC_SOURCE` varchar(255) DEFAULT NULL,
  `DC_SUBJECT` text,
  `DC_TITLE` varchar(255) DEFAULT NULL,
  `DC_TYPE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`DC_OID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DUBLIN_CORE`
--

LOCK TABLES `DUBLIN_CORE` WRITE;
/*!40000 ALTER TABLE `DUBLIN_CORE` DISABLE KEYS */;
/*!40000 ALTER TABLE `DUBLIN_CORE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FLAG`
--

DROP TABLE IF EXISTS `FLAG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FLAG` (
  `F_OID` bigint(20) NOT NULL,
  `F_NAME` varchar(255) NOT NULL,
  `F_RGB` varchar(6) NOT NULL,
  `F_COMPLEMENT_RGB` varchar(6) NOT NULL,
  `F_AGC_OID` bigint(20) NOT NULL,
  PRIMARY KEY (`F_OID`),
  KEY `FK_F_AGENCY_OID` (`F_AGC_OID`),
  CONSTRAINT `FK_F_AGENCY_OID` FOREIGN KEY (`F_AGC_OID`) REFERENCES `AGENCY` (`AGC_OID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FLAG`
--

LOCK TABLES `FLAG` WRITE;
/*!40000 ALTER TABLE `FLAG` DISABLE KEYS */;
/*!40000 ALTER TABLE `FLAG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_MEMBER`
--

DROP TABLE IF EXISTS `GROUP_MEMBER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GROUP_MEMBER` (
  `AT_OID` bigint(20) NOT NULL,
  `GM_CHILD_ID` bigint(20) DEFAULT NULL,
  `GM_PARENT_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AT_OID`),
  KEY `FK_GM_PARENT_ID` (`GM_PARENT_ID`),
  KEY `FK_GM_CHILD_ID` (`GM_CHILD_ID`),
  CONSTRAINT `FK_GM_CHILD_ID` FOREIGN KEY (`GM_CHILD_ID`) REFERENCES `ABSTRACT_TARGET` (`AT_OID`),
  CONSTRAINT `FK_GM_PARENT_ID` FOREIGN KEY (`GM_PARENT_ID`) REFERENCES `TARGET_GROUP` (`TG_AT_OID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_MEMBER`
--

LOCK TABLES `GROUP_MEMBER` WRITE;
/*!40000 ALTER TABLE `GROUP_MEMBER` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_MEMBER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HARVEST_RESOURCE`
--

DROP TABLE IF EXISTS `HARVEST_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HARVEST_RESOURCE` (
  `HRC_OID` bigint(20) NOT NULL,
  `HRC_LENGTH` bigint(20) DEFAULT NULL,
  `HRC_NAME` text NOT NULL,
  `HRC_HARVEST_RESULT_OID` bigint(20) DEFAULT NULL,
  `HRC_STATUS_CODE` int(11) NOT NULL,
  PRIMARY KEY (`HRC_OID`),
  KEY `FK5BA2B04431A1C148` (`HRC_HARVEST_RESULT_OID`),
  KEY `IX_HRC_NAME` (`HRC_NAME`(60)),
  KEY `IX_HRC_HARVEST_RESULT_OID` (`HRC_HARVEST_RESULT_OID`),
  CONSTRAINT `FK5BA2B04431A1C148` FOREIGN KEY (`HRC_HARVEST_RESULT_OID`) REFERENCES `HARVEST_RESULT` (`HR_OID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HARVEST_RESOURCE`
--

LOCK TABLES `HARVEST_RESOURCE` WRITE;
/*!40000 ALTER TABLE `HARVEST_RESOURCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `HARVEST_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HARVEST_RESULT`
--

DROP TABLE IF EXISTS `HARVEST_RESULT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HARVEST_RESULT` (
  `HR_OID` bigint(20) NOT NULL,
  `HR_HARVEST_NO` int(11) DEFAULT NULL,
  `HR_TARGET_INSTANCE_ID` bigint(20) DEFAULT NULL,
  `HR_PROVENANCE_NOTE` text NOT NULL,
  `HR_CREATED_DATE` datetime DEFAULT NULL,
  `HR_CREATED_BY_ID` bigint(20) DEFAULT NULL,
  `HR_STATE` int(11) DEFAULT NULL,
  `HR_DERIVED_FROM` int(11) DEFAULT NULL,
  `HR_INDEX` int(11) DEFAULT '0',
  `HR_RR_OID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`HR_OID`),
  KEY `FK_HR_CREATED_BY_ID` (`HR_CREATED_BY_ID`),
  KEY `FK_HRC_TARGET_INSTANCE_ID` (`HR_TARGET_INSTANCE_ID`),
  KEY `FK_HR_RR_OID` (`HR_RR_OID`),
  KEY `IX_HR_TARGET_INSTANCE_ID` (`HR_TARGET_INSTANCE_ID`),
  CONSTRAINT `FK_HRC_TARGET_INSTANCE_ID` FOREIGN KEY (`HR_TARGET_INSTANCE_ID`) REFERENCES `TARGET_INSTANCE` (`TI_OID`),
  CONSTRAINT `FK_HR_CREATED_BY_ID` FOREIGN KEY (`HR_CREATED_BY_ID`) REFERENCES `WCTUSER` (`USR_OID`),
  CONSTRAINT `FK_HR_RR_OID` FOREIGN KEY (`HR_RR_OID`) REFERENCES `REJECTION_REASON` (`RR_OID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HARVEST_RESULT`
--

LOCK TABLES `HARVEST_RESULT` WRITE;
/*!40000 ALTER TABLE `HARVEST_RESULT` DISABLE KEYS */;
/*!40000 ALTER TABLE `HARVEST_RESULT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HARVEST_STATUS`
--

DROP TABLE IF EXISTS `HARVEST_STATUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HARVEST_STATUS` (
  `HS_OID` bigint(20) NOT NULL,
  `HS_AVG_KB` double DEFAULT NULL,
  `HS_AVG_URI` double DEFAULT NULL,
  `HS_DATA_AMOUNT` bigint(20) DEFAULT NULL,
  `HS_ELAPSED_TIME` bigint(20) DEFAULT NULL,
  `HS_JOB_NAME` text,
  `HS_STATUS` varchar(255) DEFAULT NULL,
  `HS_URLS_DOWN` bigint(20) DEFAULT NULL,
  `HS_URLS_FAILED` bigint(20) DEFAULT NULL,
  `HS_ALERTS` int(11) DEFAULT NULL,
  `HS_APP_VERSION` varchar(255) DEFAULT NULL,
  `HS_HRTX_VERSION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`HS_OID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HARVEST_STATUS`
--

LOCK TABLES `HARVEST_STATUS` WRITE;
/*!40000 ALTER TABLE `HARVEST_STATUS` DISABLE KEYS */;
/*!40000 ALTER TABLE `HARVEST_STATUS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HEATMAP_CONFIG`
--

DROP TABLE IF EXISTS `HEATMAP_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HEATMAP_CONFIG` (
  `HM_OID` bigint(20) NOT NULL,
  `HM_NAME` varchar(255) NOT NULL,
  `HM_COLOR` varchar(255) NOT NULL,
  `HM_THRESHOLD_LOWEST` int(11) NOT NULL,
  `HM_DISPLAY_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`HM_OID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HEATMAP_CONFIG`
--

LOCK TABLES `HEATMAP_CONFIG` WRITE;
/*!40000 ALTER TABLE `HEATMAP_CONFIG` DISABLE KEYS */;
INSERT INTO `HEATMAP_CONFIG` VALUES (1,'low','8FBC8F',1,'Low'),(2,'medium','F0E68C',7,'Medium'),(3,'high','FF6347',12,'High');
/*!40000 ALTER TABLE `HEATMAP_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HR_MODIFICATION_NOTE`
--

DROP TABLE IF EXISTS `HR_MODIFICATION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HR_MODIFICATION_NOTE` (
  `HMN_HR_OID` bigint(20) NOT NULL,
  `HMN_NOTE` text,
  `HMN_INDEX` int(11) NOT NULL,
  PRIMARY KEY (`HMN_HR_OID`,`HMN_INDEX`),
  KEY `FKA908CCC03E1474AF` (`HMN_HR_OID`),
  CONSTRAINT `FKA908CCC03E1474AF` FOREIGN KEY (`HMN_HR_OID`) REFERENCES `HARVEST_RESULT` (`HR_OID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HR_MODIFICATION_NOTE`
--

LOCK TABLES `HR_MODIFICATION_NOTE` WRITE;
/*!40000 ALTER TABLE `HR_MODIFICATION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `HR_MODIFICATION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ID_GENERATOR`
--

DROP TABLE IF EXISTS `ID_GENERATOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ID_GENERATOR` (
  `IG_TYPE` varchar(255) DEFAULT NULL,
  `IG_VALUE` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ID_GENERATOR`
--

LOCK TABLES `ID_GENERATOR` WRITE;
/*!40000 ALTER TABLE `ID_GENERATOR` DISABLE KEYS */;
INSERT INTO `ID_GENERATOR` VALUES ('Audit',18),('LogonDuration',3),('RolePriv',45),('General',8),('Bandwidth',7);
/*!40000 ALTER TABLE `ID_GENERATOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INDICATOR`
--

DROP TABLE IF EXISTS `INDICATOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INDICATOR` (
  `I_OID` bigint(20) NOT NULL,
  `I_IC_OID` bigint(20) NOT NULL,
  `I_TI_OID` bigint(20) NOT NULL,
  `I_NAME` varchar(255) NOT NULL,
  `I_FLOAT_VALUE` double DEFAULT NULL,
  `I_UPPER_LIMIT_PERCENTAGE` double DEFAULT NULL,
  `I_LOWER_LIMIT_PERCENTAGE` double DEFAULT NULL,
  `I_UPPER_LIMIT` double DEFAULT NULL,
  `I_LOWER_LIMIT` double DEFAULT NULL,
  `I_ADVICE` varchar(255) DEFAULT NULL,
  `I_JUSTIFICATION` varchar(255) DEFAULT NULL,
  `I_AGC_OID` bigint(20) NOT NULL,
  `I_UNIT` varchar(20) NOT NULL,
  `I_SHOW_DELTA` bit(1) NOT NULL,
  `I_INDEX` int(11) DEFAULT NULL,
  `I_DATE` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`I_OID`),
  UNIQUE KEY `IX_I_OID` (`I_OID`),
  KEY `FK_I_TI_OID` (`I_TI_OID`),
  KEY `FK_I_IC_OID` (`I_IC_OID`),
  KEY `FK_I_AGENCY_OID` (`I_AGC_OID`),
  CONSTRAINT `FK_I_AGENCY_OID` FOREIGN KEY (`I_AGC_OID`) REFERENCES `AGENCY` (`AGC_OID`),
  CONSTRAINT `FK_I_IC_OID` FOREIGN KEY (`I_IC_OID`) REFERENCES `INDICATOR_CRITERIA` (`IC_OID`),
  CONSTRAINT `FK_I_TI_OID` FOREIGN KEY (`I_TI_OID`) REFERENCES `TARGET_INSTANCE` (`TI_OID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INDICATOR`
--

LOCK TABLES `INDICATOR` WRITE;
/*!40000 ALTER TABLE `INDICATOR` DISABLE KEYS */;
/*!40000 ALTER TABLE `INDICATOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INDICATOR_CRITERIA`
--

DROP TABLE IF EXISTS `INDICATOR_CRITERIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INDICATOR_CRITERIA` (
  `IC_OID` bigint(20) NOT NULL,
  `IC_NAME` varchar(255) NOT NULL,
  `IC_DESCRIPTION` varchar(255) DEFAULT NULL,
  `IC_UPPER_LIMIT_PERCENTAGE` double DEFAULT NULL,
  `IC_LOWER_LIMIT_PERCENTAGE` double DEFAULT NULL,
  `IC_UPPER_LIMIT` double DEFAULT NULL,
  `IC_LOWER_LIMIT` double DEFAULT NULL,
  `IC_AGC_OID` bigint(20) NOT NULL,
  `IC_UNIT` varchar(20) NOT NULL,
  `IC_SHOW_DELTA` bit(1) NOT NULL,
  `IC_ENABLE_REPORT` bit(1) NOT NULL,
  PRIMARY KEY (`IC_OID`),
  KEY `FK_IC_AGENCY_OID` (`IC_AGC_OID`),
  CONSTRAINT `FK_IC_AGENCY_OID` FOREIGN KEY (`IC_AGC_OID`) REFERENCES `AGENCY` (`AGC_OID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INDICATOR_CRITERIA`
--

LOCK TABLES `INDICATOR_CRITERIA` WRITE;
/*!40000 ALTER TABLE `INDICATOR_CRITERIA` DISABLE KEYS */;
INSERT INTO `INDICATOR_CRITERIA` VALUES (17,'Crawl Runtime','Elapsed time of crawl in milliseconds',10,-10,25200000,60000,0,'millisecond',_binary '\0',_binary '\0'),(18,'URLs Downloaded','The number of URLs downloaded for the site',10,-10,NULL,1,0,'integer',_binary '',_binary '\0'),(19,'Delist','Number of times that the same content is downloaded before a target is flagged for de-listing (based on the number of bytes downloaded)',NULL,NULL,2,NULL,0,'integer',_binary '\0',_binary '\0'),(20,'Heritrix Error Codes','The number of occurances of a Heritrix Error Code (any negative code + 403, 404 and 301)',10,0,1,NULL,0,'integer',_binary '',_binary ''),(21,'Long URIs','Occurances of a URI exceeding 125 characters',10,-10,1,NULL,0,'integer',_binary '',_binary ''),(22,'Matching URIs','The number of URIs from this crawl that also appeared in the reference crawl',NULL,NULL,NULL,NULL,0,'integer',_binary '',_binary ''),(23,'Missing URIs','The URIs that appear in the reference crawl but do not appear in the current crawl',5,0,NULL,NULL,0,'integer',_binary '',_binary ''),(24,'New URIs','The URIs that appear in the current crawl that did not appear in the reference crawl',10,0,NULL,NULL,0,'integer',_binary '',_binary ''),(25,'Off Scope URIs','The number of URIs that do not belong to a subdomain of the targets seeds',5,0,NULL,NULL,0,'integer',_binary '',_binary ''),(26,'Robots.txt entries disallowed','The number of \'DISALLOWED\' entries in the site\'s ROBOTS.TXT file',10,-10,NULL,NULL,0,'integer',_binary '',_binary ''),(27,'Unknown MIME Types','The number of distinct unrecognised MIME types encountered for the crawl',10,0,1,NULL,0,'integer',_binary '',_binary ''),(28,'Sub Domains','The number of domains in the root domain for the site',15,0,NULL,NULL,0,'integer',_binary '',_binary ''),(29,'Content Downloaded','Number of bytes downloaded',10,-10,NULL,1048576,0,'byte',_binary '',_binary '\0'),(30,'Repeating URI Patterns','URIs containing repeating path segments',10,-10,1,NULL,0,'integer',_binary '',_binary '');
/*!40000 ALTER TABLE `INDICATOR_CRITERIA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INDICATOR_REPORT_LINE`
--

DROP TABLE IF EXISTS `INDICATOR_REPORT_LINE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INDICATOR_REPORT_LINE` (
  `IRL_OID` bigint(20) DEFAULT NULL,
  `IRL_I_OID` bigint(20) DEFAULT NULL,
  `IRL_LINE` varchar(1024) DEFAULT NULL,
  `IRL_INDEX` int(11) DEFAULT NULL,
  UNIQUE KEY `IX_IRL_OID` (`IRL_OID`),
  KEY `IX_IRL_I_OID` (`IRL_I_OID`),
  CONSTRAINT `FK_IRL_I_OID` FOREIGN KEY (`IRL_I_OID`) REFERENCES `INDICATOR` (`I_OID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INDICATOR_REPORT_LINE`
--

LOCK TABLES `INDICATOR_REPORT_LINE` WRITE;
/*!40000 ALTER TABLE `INDICATOR_REPORT_LINE` DISABLE KEYS */;
/*!40000 ALTER TABLE `INDICATOR_REPORT_LINE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NOTIFICATION`
--

DROP TABLE IF EXISTS `NOTIFICATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NOTIFICATION` (
  `NOT_OID` bigint(20) NOT NULL,
  `NOT_MESSAGE` text,
  `NOT_USR_OID` bigint(20) NOT NULL,
  `NOT_SENDER` varchar(80) NOT NULL,
  `NOT_SENT_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `NOT_SUBJECT` varchar(255) NOT NULL,
  PRIMARY KEY (`NOT_OID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NOTIFICATION`
--

LOCK TABLES `NOTIFICATION` WRITE;
/*!40000 ALTER TABLE `NOTIFICATION` DISABLE KEYS */;
/*!40000 ALTER TABLE `NOTIFICATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PERMISSION`
--

DROP TABLE IF EXISTS `PERMISSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PERMISSION` (
  `PE_OID` bigint(20) NOT NULL,
  `PE_ACCESS_STATUS` varchar(255) DEFAULT NULL,
  `PE_APPROVED_YN` bit(1) DEFAULT NULL,
  `PE_AVAILABLE_YN` bit(1) DEFAULT NULL,
  `PE_COPYRIGHT_STATEMENT` text,
  `PE_COPYRIGHT_URL` text,
  `PE_CREATION_DATE` timestamp NULL DEFAULT NULL,
  `PE_END_DATE` timestamp NULL DEFAULT NULL,
  `PE_NOTES` text,
  `PE_OPEN_ACCESS_DATE` timestamp NULL DEFAULT NULL,
  `PE_PERMISSION_GRANTED_DATE` timestamp NULL DEFAULT NULL,
  `PE_PERMISSION_REQUESTED_DATE` timestamp NULL DEFAULT NULL,
  `PE_SPECIAL_REQUIREMENTS` text,
  `PE_START_DATE` timestamp NULL DEFAULT NULL,
  `PE_STATUS` int(11) DEFAULT NULL,
  `PE_AUTH_AGENT_ID` bigint(20) DEFAULT NULL,
  `PE_SITE_ID` bigint(20) DEFAULT NULL,
  `PE_QUICK_PICK` bit(1) DEFAULT NULL,
  `PE_DISPLAY_NAME` varchar(32) DEFAULT NULL,
  `PE_OWNING_AGENCY_ID` bigint(20) DEFAULT NULL,
  `PE_FILE_REFERENCE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PE_OID`),
  KEY `FKFE0FB1CFEE52493C` (`PE_AUTH_AGENT_ID`),
  KEY `FKFE0FB1CFA1E5D89A` (`PE_OWNING_AGENCY_ID`),
  KEY `FK_PE_SITE_ID` (`PE_SITE_ID`),
  CONSTRAINT `FKFE0FB1CFA1E5D89A` FOREIGN KEY (`PE_OWNING_AGENCY_ID`) REFERENCES `AGENCY` (`AGC_OID`),
  CONSTRAINT `FKFE0FB1CFEE52493C` FOREIGN KEY (`PE_AUTH_AGENT_ID`) REFERENCES `AUTHORISING_AGENT` (`AA_OID`),
  CONSTRAINT `FK_PE_SITE_ID` FOREIGN KEY (`PE_SITE_ID`) REFERENCES `SITE` (`ST_OID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PERMISSION`
--

LOCK TABLES `PERMISSION` WRITE;
/*!40000 ALTER TABLE `PERMISSION` DISABLE KEYS */;
INSERT INTO `PERMISSION` VALUES (4,'Open (unrestricted) access',_binary '\0',_binary '\0','','','2021-09-04 17:18:52','2025-12-31 23:59:59','',NULL,NULL,NULL,'','2020-01-01 00:00:00',2,2,3,_binary '\0','',0,'');
/*!40000 ALTER TABLE `PERMISSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PERMISSION_EXCLUSION`
--

DROP TABLE IF EXISTS `PERMISSION_EXCLUSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PERMISSION_EXCLUSION` (
  `PEX_OID` bigint(20) NOT NULL,
  `PEX_REASON` varchar(255) DEFAULT NULL,
  `PEX_URL` text,
  `PEX_PERMISSION_OID` bigint(20) DEFAULT NULL,
  `PEX_INDEX` int(11) DEFAULT NULL,
  PRIMARY KEY (`PEX_OID`),
  KEY `FK2DB3C33EB558CEC7` (`PEX_PERMISSION_OID`),
  CONSTRAINT `FK2DB3C33EB558CEC7` FOREIGN KEY (`PEX_PERMISSION_OID`) REFERENCES `PERMISSION` (`PE_OID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PERMISSION_EXCLUSION`
--

LOCK TABLES `PERMISSION_EXCLUSION` WRITE;
/*!40000 ALTER TABLE `PERMISSION_EXCLUSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `PERMISSION_EXCLUSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PERMISSION_TEMPLATE`
--

DROP TABLE IF EXISTS `PERMISSION_TEMPLATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PERMISSION_TEMPLATE` (
  `PRT_OID` bigint(20) NOT NULL,
  `PRT_AGC_OID` bigint(20) NOT NULL,
  `PRT_TEMPLATE_TEXT` text NOT NULL,
  `PRT_TEMPLATE_NAME` varchar(80) NOT NULL,
  `PRT_TEMPLATE_TYPE` varchar(40) NOT NULL,
  `PRT_TEMPLATE_DESC` varchar(255) DEFAULT NULL,
  `PRT_TEMPLATE_SUBJECT` varchar(255) DEFAULT NULL,
  `PRT_TEMPLATE_OVERWRITE_FROM` bit(1) NOT NULL DEFAULT b'0',
  `PRT_TEMPLATE_FROM` varchar(255) DEFAULT NULL,
  `PRT_TEMPLATE_CC` text,
  `PRT_TEMPLATE_BCC` text,
  `PRT_TEMPLATE_REPLY_TO` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PRT_OID`),
  KEY `FK_TEMPLATE_AGENCY_OID` (`PRT_AGC_OID`),
  CONSTRAINT `FK_TEMPLATE_AGENCY_OID` FOREIGN KEY (`PRT_AGC_OID`) REFERENCES `AGENCY` (`AGC_OID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PERMISSION_TEMPLATE`
--

LOCK TABLES `PERMISSION_TEMPLATE` WRITE;
/*!40000 ALTER TABLE `PERMISSION_TEMPLATE` DISABLE KEYS */;
/*!40000 ALTER TABLE `PERMISSION_TEMPLATE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PERMISSION_URLPATTERN`
--

DROP TABLE IF EXISTS `PERMISSION_URLPATTERN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PERMISSION_URLPATTERN` (
  `PU_PERMISSION_ID` bigint(20) NOT NULL,
  `PU_URLPATTERN_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`PU_URLPATTERN_ID`,`PU_PERMISSION_ID`),
  KEY `PU_FK_1` (`PU_URLPATTERN_ID`),
  KEY `PU_FK_2` (`PU_PERMISSION_ID`),
  KEY `IX_PU_PERMISSION_ID` (`PU_PERMISSION_ID`),
  CONSTRAINT `PU_FK_1` FOREIGN KEY (`PU_URLPATTERN_ID`) REFERENCES `URL_PATTERN` (`UP_OID`),
  CONSTRAINT `PU_FK_2` FOREIGN KEY (`PU_PERMISSION_ID`) REFERENCES `PERMISSION` (`PE_OID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PERMISSION_URLPATTERN`
--

LOCK TABLES `PERMISSION_URLPATTERN` WRITE;
/*!40000 ALTER TABLE `PERMISSION_URLPATTERN` DISABLE KEYS */;
INSERT INTO `PERMISSION_URLPATTERN` VALUES (4,5),(4,6);
/*!40000 ALTER TABLE `PERMISSION_URLPATTERN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PO_EXCLUSION_URI`
--

DROP TABLE IF EXISTS `PO_EXCLUSION_URI`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PO_EXCLUSION_URI` (
  `PEU_PROF_OVER_OID` bigint(20) NOT NULL,
  `PEU_FILTER` varchar(255) DEFAULT NULL,
  `PEU_IX` int(11) NOT NULL,
  PRIMARY KEY (`PEU_PROF_OVER_OID`,`PEU_IX`),
  KEY `FKFF4AB0FBBC3C926` (`PEU_PROF_OVER_OID`),
  CONSTRAINT `FKFF4AB0FBBC3C926` FOREIGN KEY (`PEU_PROF_OVER_OID`) REFERENCES `PROFILE_OVERRIDES` (`PO_OID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PO_EXCLUSION_URI`
--

LOCK TABLES `PO_EXCLUSION_URI` WRITE;
/*!40000 ALTER TABLE `PO_EXCLUSION_URI` DISABLE KEYS */;
/*!40000 ALTER TABLE `PO_EXCLUSION_URI` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PO_H3_BLOCK_URL`
--

DROP TABLE IF EXISTS `PO_H3_BLOCK_URL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PO_H3_BLOCK_URL` (
  `PBU_PROF_OVER_OID` bigint(20) NOT NULL,
  `PBU_FILTER` varchar(255) DEFAULT NULL,
  `PBU_IX` int(11) NOT NULL,
  PRIMARY KEY (`PBU_PROF_OVER_OID`,`PBU_IX`),
  KEY `PBU_FK_1` (`PBU_PROF_OVER_OID`),
  CONSTRAINT `PBU_FK_1` FOREIGN KEY (`PBU_PROF_OVER_OID`) REFERENCES `PROFILE_OVERRIDES` (`PO_OID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PO_H3_BLOCK_URL`
--

LOCK TABLES `PO_H3_BLOCK_URL` WRITE;
/*!40000 ALTER TABLE `PO_H3_BLOCK_URL` DISABLE KEYS */;
/*!40000 ALTER TABLE `PO_H3_BLOCK_URL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PO_H3_INCLUDE_URL`
--

DROP TABLE IF EXISTS `PO_H3_INCLUDE_URL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PO_H3_INCLUDE_URL` (
  `PIU_PROF_OVER_OID` bigint(20) NOT NULL,
  `PIU_FILTER` varchar(255) DEFAULT NULL,
  `PIU_IX` int(11) NOT NULL,
  PRIMARY KEY (`PIU_PROF_OVER_OID`,`PIU_IX`),
  KEY `PIU_FK_1` (`PIU_PROF_OVER_OID`),
  CONSTRAINT `PIU_FK_1` FOREIGN KEY (`PIU_PROF_OVER_OID`) REFERENCES `PROFILE_OVERRIDES` (`PO_OID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PO_H3_INCLUDE_URL`
--

LOCK TABLES `PO_H3_INCLUDE_URL` WRITE;
/*!40000 ALTER TABLE `PO_H3_INCLUDE_URL` DISABLE KEYS */;
/*!40000 ALTER TABLE `PO_H3_INCLUDE_URL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PO_INCLUSION_URI`
--

DROP TABLE IF EXISTS `PO_INCLUSION_URI`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PO_INCLUSION_URI` (
  `PEU_PROF_OVER_OID` bigint(20) NOT NULL,
  `PEU_FILTER` varchar(255) DEFAULT NULL,
  `PEU_IX` int(11) NOT NULL,
  PRIMARY KEY (`PEU_PROF_OVER_OID`,`PEU_IX`),
  KEY `FK6C665549BC3C926` (`PEU_PROF_OVER_OID`),
  CONSTRAINT `FK6C665549BC3C926` FOREIGN KEY (`PEU_PROF_OVER_OID`) REFERENCES `PROFILE_OVERRIDES` (`PO_OID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PO_INCLUSION_URI`
--

LOCK TABLES `PO_INCLUSION_URI` WRITE;
/*!40000 ALTER TABLE `PO_INCLUSION_URI` DISABLE KEYS */;
/*!40000 ALTER TABLE `PO_INCLUSION_URI` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROFILE`
--

DROP TABLE IF EXISTS `PROFILE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROFILE` (
  `P_OID` bigint(20) NOT NULL,
  `P_VERSION` int(11) NOT NULL,
  `P_DESC` varchar(255) DEFAULT NULL,
  `P_NAME` varchar(255) DEFAULT NULL,
  `P_PROFILE_STRING` text,
  `P_PROFILE_LEVEL` int(11) DEFAULT NULL,
  `P_STATUS` int(11) DEFAULT NULL,
  `P_DEFAULT` bit(1) DEFAULT NULL,
  `P_AGECNY_OID` bigint(20) DEFAULT NULL,
  `P_ORIG_OID` bigint(20) DEFAULT NULL,
  `P_HARVESTER_TYPE` varchar(40) NOT NULL,
  `P_DATA_LIMIT_UNIT` varchar(40) DEFAULT NULL,
  `P_MAX_FILE_SIZE_UNIT` varchar(40) DEFAULT NULL,
  `P_TIME_LIMIT_UNIT` varchar(40) DEFAULT NULL,
  `P_IMPORTED` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`P_OID`),
  KEY `FK_P_AGENCY_OID` (`P_AGECNY_OID`),
  CONSTRAINT `FK_P_AGENCY_OID` FOREIGN KEY (`P_AGECNY_OID`) REFERENCES `AGENCY` (`AGC_OID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROFILE`
--

LOCK TABLES `PROFILE` WRITE;
/*!40000 ALTER TABLE `PROFILE` DISABLE KEYS */;
INSERT INTO `PROFILE` VALUES (1,1,'Imported profile','Customized profile','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!-- \n  HERITRIX 3 CRAWL JOB CONFIGURATION FILE\n  \n   This is a relatively minimal configuration suitable for many crawls.\n   \n   Commented-out beans and properties are provided as an example; values\n   shown in comments reflect the actual defaults which are in effect\n   if not otherwise specified specification. (To change from the default \n   behavior, uncomment AND alter the shown values.)   \n -->\n<beans xmlns=\"http://www.springframework.org/schema/beans\"\n        xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n        xmlns:context=\"http://www.springframework.org/schema/context\"\n        xmlns:aop=\"http://www.springframework.org/schema/aop\"\n        xmlns:tx=\"http://www.springframework.org/schema/tx\"\n        xsi:schemaLocation=\"http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-3.0.xsd\n           http://www.springframework.org/schema/aop http://www.springframework.org/schema/aop/spring-aop-3.0.xsd\n           http://www.springframework.org/schema/tx http://www.springframework.org/schema/tx/spring-tx-3.0.xsd\n           http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context-3.0.xsd\">\n \n <context:annotation-config/>\n\n<!-- \n  OVERRIDES\n   Values elsewhere in the configuration may be replaced (\'overridden\') \n   by a Properties map declared in a PropertiesOverrideConfigurer, \n   using a dotted-bean-path to address individual bean properties. \n   This allows us to collect a few of the most-often changed values\n   in an easy-to-edit format here at the beginning of the model\n   configuration.    \n -->\n <!-- overrides from a text property list -->\n <bean id=\"simpleOverrides\" class=\"org.springframework.beans.factory.config.PropertyOverrideConfigurer\">\n  <property name=\"properties\">\n   <value>\n# This Properties map is specified in the Java \'property list\' text format\n# http://java.sun.com/javase/6/docs/api/java/util/Properties.html#load%28java.io.Reader%29\n\nmetadata.operatorContactUrl=https://localhost.com/\nmetadata.jobName=custom-heritrix-wct-job\nmetadata.description=Sample harvest\n\n   </value>\n  </property>\n </bean>\n\n <!-- overrides from declared <prop> elements, more easily allowing\n      multiline values or even declared beans -->\n <!--\n <bean id=\"longerOverrides\" class=\"org.springframework.beans.factory.config.PropertyOverrideConfigurer\">\n  <property name=\"properties\">\n   <props>\n    <prop key=\"seeds.textSource.value\">\n# URLS HERE\nhttp://example.example/example\n    </prop>\n   </props>\n  </property>\n </bean>\n -->\n \n \n <!-- CRAWL METADATA: including identification of crawler/operator -->\n <bean id=\"metadata\" class=\"org.archive.modules.CrawlMetadata\" autowire=\"byName\">\n       <property name=\"operatorContactUrl\" value=\"[see override above]\"/>\n       <property name=\"jobName\" value=\"[see override above]\"/>\n       <property name=\"description\" value=\"[see override above]\"/>\n       <property name=\"robotsPolicyName\" value=\"obey\"/>\n       \n       <property name=\"operator\" value=\"Docker WCT\"/>\n       <property name=\"operatorFrom\" value=\"wct@localhost.hr\"/>\n       <!-- <property name=\"organization\" value=\"\"/> -->\n       <!-- <property name=\"audience\" value=\"\"/> -->\n       <property name=\"userAgentTemplate\" value=\"Mozilla/5.0 (compatible; heritrix/@VERSION@ +@OPERATOR_CONTACT_URL@)\"/>\n </bean>\n \n <!-- SEEDS: crawl starting points \n      ConfigString allows simple, inline specification of a moderate\n      number of seeds; see below comment for example of using an\n      arbitrarily-large external file. -->\n <!--\n <bean id=\"seeds\" class=\"org.archive.modules.seeds.TextSeedModule\">\n     <property name=\"textSource\">\n      <bean class=\"org.archive.spring.ConfigString\">\n       <property name=\"value\">\n        <value>\n# [see override above]\n        </value>\n       </property>\n      </bean>\n     </property>\n     <property name=\'sourceTagSeeds\' value=\'false\'/>\n     <property name=\'blockAwaitingSeedLines\' value=\'-1\'/>\n </bean>\n -->\n \n <!-- SEEDS ALTERNATE APPROACH: specifying external seeds.txt file in\n      the job directory, similar to the H1 approach. \n      Use either the above, or this, but not both. -->\n <bean id=\"seeds\" class=\"org.archive.modules.seeds.TextSeedModule\">\n  <property name=\"textSource\">\n   <bean class=\"org.archive.spring.ConfigFile\">\n    <property name=\"path\" value=\"seeds.txt\" />\n   </bean>\n  </property>\n  <property name=\'sourceTagSeeds\' value=\'false\'/>\n  <property name=\'blockAwaitingSeedLines\' value=\'-1\'/>\n </bean>\n\n \n <bean id=\"acceptSurts\" class=\"org.archive.modules.deciderules.surt.OnDomainsDecideRule\">\n  <property name=\"decision\" value=\"ACCEPT\"/>\n  <property name=\"seedsAsSurtPrefixes\" value=\"true\" />\n  <!-- <property name=\"alsoCheckVia\" value=\"false\" /> -->\n  <!-- <property name=\"surtsSourceFile\" value=\"surt.txt\" /> -->\n  <property name=\"surtsDumpFile\" value=\"${launchId}/surts.dump\" />\n  <!-- <property name=\"surtsSource\">\n        <bean class=\"org.archive.spring.ConfigString\">\n         <property name=\"value\">\n          <value>\n           # example.com\n           # http://www.example.edu/path1/\n           # +http://(org,example,\n          </value>\n         </property> \n        </bean>\n       </property> -->\n </bean>\n\n <!-- SCOPE: rules for which discovered URIs to crawl; order is very \n      important because last decision returned other than \'NONE\' wins. -->\n <bean id=\"scope\" class=\"org.archive.modules.deciderules.DecideRuleSequence\">\n  <!-- <property name=\"logToFile\" value=\"false\" /> -->\n  <property name=\"rules\">\n   <list>\n    <!-- Begin by REJECTing all... -->\n    <bean class=\"org.archive.modules.deciderules.RejectDecideRule\" />\n    <!-- ...then ACCEPT those within configured/seed-implied SURT prefixes... -->\n    <ref bean=\"acceptSurts\" />\n    <!-- ...but REJECT those more than a configured link-hop-count from start... -->\n    <bean class=\"org.archive.modules.deciderules.TooManyHopsDecideRule\">\n      <property name=\"maxHops\" value=\"2\" />\n    </bean>\n    <!-- ...but ACCEPT those more than a configured link-hop-count from start... -->\n    <bean class=\"org.archive.modules.deciderules.TransclusionDecideRule\">\n     <property name=\"maxTransHops\" value=\"2\" /> \n     <property name=\"maxSpeculativeHops\" value=\"1\" /> \n    </bean>\n    <!-- ...but REJECT those from a configurable (initially empty) set of REJECT SURTs... -->\n    <bean class=\"org.archive.modules.deciderules.surt.SurtPrefixedDecideRule\">\n          <property name=\"decision\" value=\"REJECT\"/>\n          <property name=\"seedsAsSurtPrefixes\" value=\"false\"/>\n          <property name=\"surtsDumpFile\" value=\"${launchId}/negative-surts.dump\" /> \n          <!-- \n          <property name=\"surtsSource\">\n           <bean class=\"org.archive.spring.ConfigFile\">\n            <property name=\"path\" value=\"negative-surts.txt\" />\n           </bean>\n          </property>\n          -->\n    </bean>\n    <!-- ...and REJECT those from a configurable (initially empty) set of URI regexes... -->\n    <bean class=\"org.archive.modules.deciderules.MatchesListRegexDecideRule\">\n          <property name=\"decision\" value=\"REJECT\"/>\n          <property name=\"listLogicalOr\" value=\"true\" />\n          <property name=\"regexList\">\n           <list>\n              <value>.*/posting\\.php\\?mode=(?:post|quote|reply|newtopic).*</value>\n              <value>.*/ignore\\.php\\?mode=add\\&amp;username=.*</value>\n              <value>.*/privmsg\\.php\\?mode=post.*</value>\n              <value>.*/profile\\.php\\?mode=email.*</value>\n              <value>.*/ucp\\.php\\?i=pm&amp;mode=compose.*</value>\n              <value>.*/newreply\\.php\\?do=newreply.*</value>\n              <value>.*/newthread\\.php\\?do=newthread.*</value>\n              <value>.*option=com_fireboard.*func=(?:report|post).*</value>\n              <value>.*\\.html\\?board=\\d+\\.0$</value>\n              <value>.*/post\\?do=(?:quote|reply|new).*</value>\n              <value>.*/new_(?:topic|replay)_form\\.asp\\?.*</value>\n              <value>.*action=(?:emailuser|wishlist_add|compare_products_add|notify_add|add_product|buy_now|add|del|send|dodaj|edit).*</value>\n              <value>.*/login_user\\.asp\\?.*</value>\n              <value>.*/ratepic\\.php\\?pic=.*</value>\n              <value>.*/addfav\\.php\\?pid=.*</value>\n              <value>.*\\?redirect_to=.*</value>\n              <value>.*\\?(?:R|r)eturnUrl=.*</value>\n              <value>.*/login\\.php\\?referer=[^&amp;]+\\.php.*</value>\n              <value>.*/login/\\??referer(?:=|/).*</value>\n              <value>.*/wishlist/index/add/product/.*</value>\n              <value>.*/sendfriend/product/send/.*</value>\n              <value>.*/product_compare/(?:add|remove|index|clear)/.*</value>\n              <value>.*/cart/(?:add|delete|configure|remove|update_quantity|addproduct).*</value>\n              <value>.*/cart(?:\\.php)?\\?(?:add|delete).*</value>\n              <value>.*/(cartadd|shop-cart-add|cart-delete|favorites-add|favorites-delete|wishlist-add|rating-add)\\.asp\\?.*</value>\n              <value>.*/Shop/Cart\\.aspx\\?ref=.*</value>\n              <value>.*page=shop\\.cart.*func=cart(?:A|a)dd.*</value>\n              <value>.*page=shop\\.recommend.*</value>\n              <value>.*task=(?:recalculate|addJS|emailfrom).*</value>\n              <value>.*\\?replaytocom=.*</value>\n              <value>.*add_to_(?:wishlist|cart)=.*</value>\n              <value>.*add-to-cart=.*</value>\n              <value>.*AddTo(?:Cart|WishList)=.*</value>\n              <value>.*/sites/.*/sites/.*</value>\n              <value>.*/login/\\?target=.*</value>\n              <value>.*/addproducttocart/.*</value>\n       		  <value>.*/contact-form-7/v1$</value>\n       		  <value>.*/mejs\\..*</value>\n              <value>.*/dd/mm/yy.*</value>\n       		  <value>.*\\.(XMLDOM|init|arrow|_change|move|alert|detail|waypoints|flat_responsive)$</value>\n       		  <value>.*/slogin/provider/.*/auth/.*</value>\n       		  <value>.*/(embed/|ShockwaveFlash\\.ShockwaveFlash|ui\\.accordion|item\\.image|easing\\.Back|performance\\.timing|click\\.imageLightbox)$</value>\n       		  <value>.*/gtm\\..*</value>       \n           </list>\n          </property>\n    </bean>\n	<bean class=\"org.archive.modules.deciderules.MatchesListRegexDecideRule\">\n          <property name=\"decision\" value=\"ACCEPT\"/>\n          <property name=\"listLogicalOr\" value=\"true\" />\n          <property name=\"regexList\">\n           <list>\n       		  <value>.*\\.rss.*</value>       \n           </list>\n          </property>\n    </bean>\n    <!-- ...and REJECT those with suspicious repeating path-segments... -->\n    <bean class=\"org.archive.modules.deciderules.PathologicalPathDecideRule\">\n     <property name=\"maxRepetitions\" value=\"2\" />\n    </bean>\n    <!-- ...and REJECT those with more than threshold number of path-segments... -->\n    <bean class=\"org.archive.modules.deciderules.TooManyPathSegmentsDecideRule\">\n     <property name=\"maxPathDepth\" value=\"20\" />\n    </bean>\n    <!-- ...but always ACCEPT those marked as prerequisitee for another URI... -->\n    <bean class=\"org.archive.modules.deciderules.PrerequisiteAcceptDecideRule\">\n    </bean>\n    <!-- ...but always REJECT those with unsupported URI schemes -->\n    <bean class=\"org.archive.modules.deciderules.SchemeNotInSetDecideRule\">\n    </bean>\n   </list>\n  </property>\n </bean>\n \n <!-- \n   PROCESSING CHAINS\n    Much of the crawler\'s work is specified by the sequential \n    application of swappable Processor modules. These Processors\n    are collected into three \'chains\'. The CandidateChain is applied \n    to URIs being considered for inclusion, before a URI is enqueued\n    for collection. The FetchChain is applied to URIs when their \n    turn for collection comes up. The DispositionChain is applied \n    after a URI is fetched and analyzed/link-extracted.\n  -->\n  \n <!-- CANDIDATE CHAIN --> \n <!-- first, processors are declared as top-level named beans -->\n <bean id=\"candidateScoper\" class=\"org.archive.crawler.prefetch.CandidateScoper\">\n </bean>\n <bean id=\"preparer\" class=\"org.archive.crawler.prefetch.FrontierPreparer\">\n  <!-- <property name=\"preferenceDepthHops\" value=\"-1\" /> -->\n  <!-- <property name=\"preferenceEmbedHops\" value=\"1\" /> -->\n  <!-- <property name=\"canonicalizationPolicy\"> \n        <ref bean=\"canonicalizationPolicy\" />\n       </property> -->\n  <!-- <property name=\"queueAssignmentPolicy\"> \n        <ref bean=\"queueAssignmentPolicy\" />\n       </property> -->\n  <!-- <property name=\"uriPrecedencePolicy\"> \n        <ref bean=\"uriPrecedencePolicy\" />\n       </property> -->\n  <!-- <property name=\"costAssignmentPolicy\"> \n        <ref bean=\"costAssignmentPolicy\" />\n       </property> -->\n </bean>\n <!-- now, processors are assembled into ordered CandidateChain bean -->\n <bean id=\"candidateProcessors\" class=\"org.archive.modules.CandidateChain\">\n  <property name=\"processors\">\n   <list>\n    <!-- apply scoping rules to each individual candidate URI... -->\n    <ref bean=\"candidateScoper\"/>\n    <!-- ...then prepare those ACCEPTed to be enqueued to frontier. -->\n    <ref bean=\"preparer\"/>\n   </list>\n  </property>\n </bean>\n  \n <!-- FETCH CHAIN --> \n <!-- first, processors are declared as top-level named beans -->\n <bean id=\"preselector\" class=\"org.archive.crawler.prefetch.Preselector\">\n  <!-- <property name=\"recheckScope\" value=\"false\" /> -->\n  <!-- <property name=\"blockAll\" value=\"false\" /> -->\n  <!-- <property name=\"blockByRegex\" value=\"\" /> -->\n  <!-- <property name=\"allowByRegex\" value=\"\" /> -->\n </bean>\n <bean id=\"preconditions\" class=\"org.archive.crawler.prefetch.PreconditionEnforcer\">\n  <!-- <property name=\"ipValidityDurationSeconds\" value=\"21600\" /> -->\n  <!-- <property name=\"robotsValidityDurationSeconds\" value=\"86400\" /> -->\n  <!-- <property name=\"calculateRobotsOnly\" value=\"false\" /> -->\n </bean>\n <bean id=\"fetchDns\" class=\"org.archive.modules.fetcher.FetchDNS\">\n  <!-- <property name=\"acceptNonDnsResolves\" value=\"false\" /> -->\n  <!-- <property name=\"digestContent\" value=\"true\" /> -->\n  <!-- <property name=\"digestAlgorithm\" value=\"sha1\" /> -->\n </bean>\n <!-- <bean id=\"fetchWhois\" class=\"org.archive.modules.fetcher.FetchWhois\">\n       <property name=\"specialQueryTemplates\">\n        <map>\n         <entry key=\"whois.verisign-grs.com\" value=\"domain %s\" />\n         <entry key=\"whois.arin.net\" value=\"z + %s\" />\n         <entry key=\"whois.denic.de\" value=\"-T dn %s\" />\n        </map>\n       </property> \n      </bean> -->\n <bean id=\"fetchHttp\" class=\"org.archive.modules.fetcher.FetchHTTP\">\n  <!-- <property name=\"useHTTP11\" value=\"false\" /> -->\n  <property name=\"maxLengthBytes\" value=\"100000000\" />\n  <property name=\"timeoutSeconds\" value=\"1200\" /> <!-- 20 min -->\n  <!-- <property name=\"maxFetchKBSec\" value=\"0\" /> -->\n  <property name=\"defaultEncoding\" value=\"utf-8\" />\n  <!-- <property name=\"shouldFetchBodyRule\"> \n        <bean class=\"org.archive.modules.deciderules.AcceptDecideRule\"/>\n       </property> -->\n  <property name=\"soTimeoutMs\" value=\"120000\" />\n  <!-- <property name=\"sendIfModifiedSince\" value=\"true\" /> -->\n  <!-- <property name=\"sendIfNoneMatch\" value=\"true\" /> -->\n  <!-- <property name=\"sendConnectionClose\" value=\"true\" /> -->\n  <property name=\"sendReferer\" value=\"true\" />\n  <!-- <property name=\"sendRange\" value=\"false\" /> -->\n  <property name=\"ignoreCookies\" value=\"false\" />\n  <property name=\"sslTrustLevel\" value=\"OPEN\" />\n  <property name=\"acceptHeaders\"> \n   <list>\n    <value>Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8</value>\n    <value>Accept-Language: hr-hr,hr;q=0.7,en;q=0.3</value>\n   </list>\n  </property>\n  <!-- <property name=\"httpBindAddress\" value=\"\" /> -->\n  <!-- <property name=\"httpProxyHost\" value=\"\" /> -->\n  <!-- <property name=\"httpProxyPort\" value=\"0\" /> -->\n  <!-- <property name=\"httpProxyUser\" value=\"\" /> -->\n  <!-- <property name=\"httpProxyPassword\" value=\"\" /> -->\n  <property name=\"digestContent\" value=\"true\" />\n  <property name=\"digestAlgorithm\" value=\"sha1\" />\n </bean>\n <bean id=\"extractorHttp\" class=\"org.archive.modules.extractor.ExtractorHTTP\">\n </bean>\n <bean id=\"extractorHtml\" class=\"org.archive.modules.extractor.ExtractorHTML\">\n  <property name=\"extractJavascript\" value=\"true\" />\n  <property name=\"extractValueAttributes\" value=\"true\" />\n  <property name=\"ignoreFormActionUrls\" value=\"false\" />\n  <!-- <property name=\"extractOnlyFormGets\" value=\"true\" /> -->\n  <property name=\"treatFramesAsEmbedLinks\" value=\"true\" />\n  <property name=\"ignoreUnexpectedHtml\" value=\"true\" />\n  <!-- <property name=\"maxElementLength\" value=\"1024\" /> -->\n  <!-- <property name=\"maxAttributeNameLength\" value=\"1024\" /> -->\n  <!-- <property name=\"maxAttributeValueLength\" value=\"16384\" /> -->\n </bean>\n <bean id=\"extractorCss\" class=\"org.archive.modules.extractor.ExtractorCSS\">\n </bean> \n <bean id=\"extractorJs\" class=\"org.archive.modules.extractor.ExtractorJS\">\n </bean>\n <bean id=\"extractorSwf\" class=\"org.archive.modules.extractor.ExtractorSWF\">\n </bean>    \n <!-- now, processors are assembled into ordered FetchChain bean -->\n <bean id=\"fetchProcessors\" class=\"org.archive.modules.FetchChain\">\n  <property name=\"processors\">\n   <list>\n    <!-- re-check scope, if so enabled... -->\n    <ref bean=\"preselector\"/>\n    <!-- ...then verify or trigger prerequisite URIs fetched, allow crawling... -->\n    <ref bean=\"preconditions\"/>\n    <!-- ...fetch if DNS URI... -->\n    <ref bean=\"fetchDns\"/>\n    <!-- <ref bean=\"fetchWhois\"/> -->\n    <!-- ...fetch if HTTP URI... -->\n    <ref bean=\"fetchHttp\"/>\n    <!-- ...extract outlinks from HTTP headers... -->\n    <ref bean=\"extractorHttp\"/>\n    <!-- ...extract outlinks from HTML content... -->\n    <ref bean=\"extractorHtml\"/>\n    <!-- ...extract outlinks from CSS content... -->\n    <ref bean=\"extractorCss\"/>\n    <!-- ...extract outlinks from Javascript content... -->\n    <ref bean=\"extractorJs\"/>\n    <!-- ...extract outlinks from Flash content... -->\n    <ref bean=\"extractorSwf\"/>\n   </list>\n  </property>\n </bean>\n  \n <!-- DISPOSITION CHAIN -->\n <!-- first, processors are declared as top-level named beans  -->\n <bean id=\"warcWriter\" class=\"org.archive.modules.writer.WARCWriterProcessor\">\n  <property name=\"compress\" value=\"true\" />\n  <property name=\"prefix\" value=\"wct-tematski-harvest\" />\n  <property name=\"maxFileSizeBytes\" value=\"1000000000\" />\n  <property name=\"poolMaxActive\" value=\"1\" />\n  <!-- <property name=\"MaxWaitForIdleMs\" value=\"500\" /> -->\n  <!-- <property name=\"skipIdenticalDigests\" value=\"false\" /> -->\n  <!-- <property name=\"maxTotalBytesToWrite\" value=\"0\" /> -->\n  <!-- <property name=\"directory\" value=\"${launchId}\" /> -->\n  <!-- <property name=\"storePaths\">\n   <list>\n    <value>/path/to/directory</value>\n   </list>\n  </property> -->\n  <!-- <property name=\"template\" value=\"${prefix}-${timestamp17}-${serialno}-${heritrix.pid}~${heritrix.hostname}~${heritrix.port}\" /> -->\n  <property name=\"template\" value=\"${prefix}-${timestamp17}-${serialno}\" />\n  <property name=\"writeRequests\" value=\"true\" />\n  <property name=\"writeMetadata\" value=\"true\" />\n  <!-- <property name=\"writeRevisitForIdenticalDigests\" value=\"true\" /> -->\n  <!-- <property name=\"writeRevisitForNotModified\" value=\"true\" /> -->\n  <!-- <property name=\"startNewFilesOnCheckpoint\" value=\"true\" /> -->\n </bean>\n <bean id=\"candidates\" class=\"org.archive.crawler.postprocessor.CandidatesProcessor\">\n  <!-- <property name=\"seedsRedirectNewSeeds\" value=\"true\" /> -->\n  <!-- <property name=\"processErrorOutlinks\" value=\"false\" /> -->\n </bean>\n <bean id=\"disposition\" class=\"org.archive.crawler.postprocessor.DispositionProcessor\">\n  <property name=\"delayFactor\" value=\"1.0\" />\n  <property name=\"minDelayMs\" value=\"1000\" />\n  <property name=\"respectCrawlDelayUpToSeconds\" value=\"4\" />\n  <property name=\"maxDelayMs\" value=\"4000\" />\n  <property name=\"maxPerHostBandwidthUsageKbSec\" value=\"0\" />\n </bean>\n <!-- <bean id=\"rescheduler\" class=\"org.archive.crawler.postprocessor.ReschedulingProcessor\">\n       <property name=\"rescheduleDelaySeconds\" value=\"-1\" />\n      </bean> -->\n <!-- now, processors are assembled into ordered DispositionChain bean -->\n <bean id=\"dispositionProcessors\" class=\"org.archive.modules.DispositionChain\">\n  <property name=\"processors\">\n   <list>\n    <!-- write to aggregate archival files... -->\n    <ref bean=\"warcWriter\"/>\n    <!-- ...send each outlink candidate URI to CandidateChain, \n         and enqueue those ACCEPTed to the frontier... -->\n    <ref bean=\"candidates\"/>\n    <!-- ...then update stats, shared-structures, frontier decisions -->\n    <ref bean=\"disposition\"/>\n    <!-- <ref bean=\"rescheduler\" /> -->\n   </list>\n  </property>\n </bean>\n \n <!-- CRAWLCONTROLLER: Control interface, unifying context -->\n <bean id=\"crawlController\" \n   class=\"org.archive.crawler.framework.CrawlController\">\n  <property name=\"maxToeThreads\" value=\"400\" />\n  <property name=\"pauseAtStart\" value=\"true\" />\n  <property name=\"runWhileEmpty\" value=\"false\" />\n  <!-- <property name=\"recorderInBufferBytes\" value=\"524288\" /> -->\n  <!-- <property name=\"recorderOutBufferBytes\" value=\"16384\" /> -->\n  <property name=\"recorderInBufferBytes\" value=\"1000000\" />\n  <property name=\"recorderOutBufferBytes\" value=\"100000\" />\n  <!-- <property name=\"scratchDir\" value=\"scratch\" /> -->\n </bean>\n \n <!-- FRONTIER: Record of all URIs discovered and queued-for-collection -->\n <bean id=\"frontier\" \n   class=\"org.archive.crawler.frontier.BdbFrontier\">\n  <property name=\"queueTotalBudget\" value=\"30000\" />\n  <property name=\"balanceReplenishAmount\" value=\"30000\" />\n  <property name=\"errorPenaltyAmount\" value=\"100\" />\n  <!-- <property name=\"precedenceFloor\" value=\"255\" /> -->\n  <!-- <property name=\"queuePrecedencePolicy\">\n        <bean class=\"org.archive.crawler.frontier.precedence.BaseQueuePrecedencePolicy\" />\n       </property> -->\n  <!-- <property name=\"snoozeLongMs\" value=\"300000\" /> -->\n  <property name=\"snoozeLongMs\" value=\"30000\" />\n  <!-- <property name=\"retryDelaySeconds\" value=\"900\" /> -->\n  <!-- <property name=\"maxRetries\" value=\"30\" /> -->\n  <property name=\"retryDelaySeconds\" value=\"600\" />\n  <property name=\"maxRetries\" value=\"15\" />\n  <property name=\"recoveryLogEnabled\" value=\"true\" />\n  <property name=\"maxOutlinks\" value=\"6000\" />\n  <!-- <property name=\"extractIndependently\" value=\"false\" /> -->\n  <!-- <property name=\"outbound\">\n        <bean class=\"java.util.concurrent.ArrayBlockingQueue\">\n         <constructor-arg value=\"200\"/>\n         <constructor-arg value=\"true\"/>\n        </bean>\n       </property> -->\n  <!-- <property name=\"inbound\">\n        <bean class=\"java.util.concurrent.ArrayBlockingQueue\">\n         <constructor-arg value=\"40000\"/>\n         <constructor-arg value=\"true\"/>\n        </bean>\n       </property> -->\n  <property name=\"dumpPendingAtClose\" value=\"true\" />\n </bean>\n \n <!-- URI UNIQ FILTER: Used by frontier to remember already-included URIs --> \n <bean id=\"uriUniqFilter\" \n   class=\"org.archive.crawler.util.BdbUriUniqFilter\">\n </bean>\n \n <!--\n   EXAMPLE SETTINGS OVERLAY SHEETS\n   Sheets allow some settings to vary by context - usually by URI context,\n   so that different sites or sections of sites can be treated differently. \n   Here are some example Sheets for common purposes. The SheetOverlaysManager\n   (below) automatically collects all Sheet instances declared among the \n   original beans, but others can be added during the crawl via the scripting \n   interface.\n  -->\n\n<!-- bigBudget: queueTotalBudget is biger -->\n<bean id=\'bigBudget\' class=\'org.archive.spring.Sheet\'>\n <property name=\'map\'>\n  <map>\n   <entry key=\'frontier.queueTotalBudget\' value=\'100000\'/>\n  </map>\n </property>\n</bean>\n\n<!-- noJsParse: for any URI to which this sheet\'s settings are applied \n     the resource JS will not be parsed. -->\n<!--\n<bean id=\'noJsParse\' class=\'org.archive.spring.Sheet\'>\n <property name=\'map\'>\n  <map>   \n  </map>\n </property>\n</bean>\n-->\n\n<bean id=\'minMaxHops\' class=\'org.archive.spring.Sheet\'>\n <property name=\'map\'>\n  <map>\n   <entry key=\'scope.rules[2].maxHops\' value=\'1\'/>\n  </map>\n </property>\n</bean>\n\n\n \n<!--\n   EXAMPLE SETTINGS OVERLAY SHEET-ASSOCIATION\n   A SheetAssociation says certain URIs should have certain overlay Sheets\n   applied. This example applies two sheets to URIs matching two SURT-prefixes.\n   New associations may also be added mid-crawl using the scripting facility.\n  -->\n<bean class=\'org.archive.crawler.spring.SurtPrefixesSheetAssociation\'>\n <property name=\'surtPrefixes\'>\n  <list>\n   <value>https://(com,facebook,</value>\n   <value>https://(com,google,</value>\n    <value>https://(com,twitter,</value>\n  </list>\n </property>\n <property name=\'targetSheetNames\'>\n  <list>\n   <!-- <value>noJsParse</value> -->\n   <value>bigBudget</value>\n  </list>\n </property>\n</bean>\n \n<bean class=\'org.archive.crawler.spring.SurtPrefixesSheetAssociation\'>\n <property name=\'surtPrefixes\'>\n  <list>\n   <value>http://(org,wikipedia,</value>\n  </list>\n </property>\n <property name=\'targetSheetNames\'>\n  <list>\n   <value>minMaxHops</value>\n  </list>\n </property>\n</bean>\n\n\n <!-- \n   OPTIONAL BUT RECOMMENDED BEANS\n  -->\n  \n <!-- ACTIONDIRECTORY: disk directory for mid-crawl operations\n      Running job will watch directory for new files with URIs, \n      scripts, and other data to be processed during a crawl. -->\n <bean id=\"actionDirectory\" class=\"org.archive.crawler.framework.ActionDirectory\">\n  <!-- <property name=\"actionDir\" value=\"action\" /> -->\n  <!-- <property name=\"doneDir\" value=\"${launchId}/actions-done\" /> -->\n  <!-- <property name=\"initialDelaySeconds\" value=\"10\" /> -->\n  <!-- <property name=\"delaySeconds\" value=\"30\" /> -->\n </bean> \n \n <!--  CRAWLLIMITENFORCER: stops crawl when it reaches configured limits -->\n <bean id=\"crawlLimiter\" class=\"org.archive.crawler.framework.CrawlLimitEnforcer\">\n  <property name=\"maxBytesDownload\" value=\"0\" />\n  <property name=\"maxDocumentsDownload\" value=\"0\" />\n  <property name=\"maxTimeSeconds\" value=\"0\" />\n </bean>\n \n <!-- CHECKPOINTSERVICE: checkpointing assistance -->\n <bean id=\"checkpointService\" \n   class=\"org.archive.crawler.framework.CheckpointService\">\n  <!-- <property name=\"checkpointIntervalMinutes\" value=\"-1\"/> -->\n  <!-- <property name=\"checkpointsDir\" value=\"checkpoints\"/> -->\n  <!-- <property name=\"forgetAllButLatest\" value=\"true\"/> -->\n </bean>\n \n <!-- \n   OPTIONAL BEANS\n    Uncomment and expand as needed, or if non-default alternate \n    implementations are preferred.\n  -->\n  \n <!-- CANONICALIZATION POLICY -->\n <!--\n <bean id=\"canonicalizationPolicy\" \n   class=\"org.archive.modules.canonicalize.RulesCanonicalizationPolicy\">\n   <property name=\"rules\">\n    <list>\n     <bean class=\"org.archive.modules.canonicalize.LowercaseRule\" />\n     <bean class=\"org.archive.modules.canonicalize.StripUserinfoRule\" />\n     <bean class=\"org.archive.modules.canonicalize.StripWWWNRule\" />\n     <bean class=\"org.archive.modules.canonicalize.StripSessionIDs\" />\n     <bean class=\"org.archive.modules.canonicalize.StripSessionCFIDs\" />\n     <bean class=\"org.archive.modules.canonicalize.FixupQueryString\" />\n    </list>\n  </property>\n </bean>\n -->\n \n\n <!-- QUEUE ASSIGNMENT POLICY -->\n <!--\n <bean id=\"queueAssignmentPolicy\" \n   class=\"org.archive.crawler.frontier.SurtAuthorityQueueAssignmentPolicy\">\n  <property name=\"forceQueueAssignment\" value=\"\" />\n  <property name=\"deferToPrevious\" value=\"true\" />\n  <property name=\"parallelQueues\" value=\"1\" />\n </bean>\n -->\n \n <!-- URI PRECEDENCE POLICY -->\n <!--\n <bean id=\"uriPrecedencePolicy\" \n   class=\"org.archive.crawler.frontier.precedence.CostUriPrecedencePolicy\">\n </bean>\n -->\n \n <!-- COST ASSIGNMENT POLICY -->\n <!--\n <bean id=\"costAssignmentPolicy\" \n   class=\"org.archive.crawler.frontier.UnitCostAssignmentPolicy\">\n </bean>\n -->\n \n <!-- CREDENTIAL STORE: HTTP authentication or FORM POST credentials -->\n <!-- \n <bean id=\"credentialStore\" \n   class=\"org.archive.modules.credential.CredentialStore\">\n </bean>\n -->\n \n <!-- DISK SPACE MONITOR: \n      Pauses the crawl if disk space at monitored paths falls below minimum threshold -->\n <!-- \n <bean id=\"diskSpaceMonitor\" class=\"org.archive.crawler.monitor.DiskSpaceMonitor\">\n   <property name=\"pauseThresholdMiB\" value=\"500\" />\n   <property name=\"monitorConfigPaths\" value=\"true\" />\n   <property name=\"monitorPaths\">\n     <list>\n       <value>PATH</value>\n     </list>\n   </property>\n </bean>\n -->\n \n <!-- \n   REQUIRED STANDARD BEANS\n    It will be very rare to replace or reconfigure the following beans.\n  -->\n\n <!-- STATISTICSTRACKER: standard stats/reporting collector -->\n <bean id=\"statisticsTracker\" \n   class=\"org.archive.crawler.reporting.StatisticsTracker\" autowire=\"byName\">\n  <!-- <property name=\"reports\">\n        <list>\n         <bean id=\"crawlSummaryReport\" class=\"org.archive.crawler.reporting.CrawlSummaryReport\" />\n         <bean id=\"seedsReport\" class=\"org.archive.crawler.reporting.SeedsReport\" />\n         <bean id=\"hostsReport\" class=\"org.archive.crawler.reporting.HostsReport\">\n     		<property name=\"maxSortSize\" value=\"-1\" />\n     		<property name=\"suppressEmptyHosts\" value=\"false\" />\n         </bean>\n         <bean id=\"sourceTagsReport\" class=\"org.archive.crawler.reporting.SourceTagsReport\" />\n         <bean id=\"mimetypesReport\" class=\"org.archive.crawler.reporting.MimetypesReport\" />\n         <bean id=\"responseCodeReport\" class=\"org.archive.crawler.reporting.ResponseCodeReport\" />\n         <bean id=\"processorsReport\" class=\"org.archive.crawler.reporting.ProcessorsReport\" />\n         <bean id=\"frontierSummaryReport\" class=\"org.archive.crawler.reporting.FrontierSummaryReport\" />\n         <bean id=\"frontierNonemptyReport\" class=\"org.archive.crawler.reporting.FrontierNonemptyReport\" />\n         <bean id=\"toeThreadsReport\" class=\"org.archive.crawler.reporting.ToeThreadsReport\" />\n        </list>\n       </property> -->\n  <!-- <property name=\"reportsDir\" value=\"${launchId}/reports\" /> -->\n  <!-- <property name=\"liveHostReportSize\" value=\"20\" /> -->\n  <!-- <property name=\"intervalSeconds\" value=\"20\" /> -->\n  <!-- <property name=\"keepSnapshotsCount\" value=\"5\" /> -->\n  <!-- <property name=\"liveHostReportSize\" value=\"20\" /> -->\n </bean>\n \n <!-- CRAWLERLOGGERMODULE: shared logging facility -->\n <bean id=\"loggerModule\" \n   class=\"org.archive.crawler.reporting.CrawlerLoggerModule\">\n  <!-- <property name=\"path\" value=\"${launchId}/logs\" /> -->\n  <!-- <property name=\"crawlLogPath\" value=\"crawl.log\" /> -->\n  <!-- <property name=\"alertsLogPath\" value=\"alerts.log\" /> -->\n  <!-- <property name=\"progressLogPath\" value=\"progress-statistics.log\" /> -->\n  <!-- <property name=\"uriErrorsLogPath\" value=\"uri-errors.log\" /> -->\n  <!-- <property name=\"runtimeErrorsLogPath\" value=\"runtime-errors.log\" /> -->\n  <!-- <property name=\"nonfatalErrorsLogPath\" value=\"nonfatal-errors.log\" /> -->\n  <!-- <property name=\"logExtraInfo\" value=\"false\" /> -->\n </bean>\n \n <!-- SHEETOVERLAYMANAGER: manager of sheets of contextual overlays\n      Autowired to include any SheetForSurtPrefix or \n      SheetForDecideRuled beans -->\n <bean id=\"sheetOverlaysManager\" autowire=\"byType\"\n   class=\"org.archive.crawler.spring.SheetOverlaysManager\">\n </bean>\n\n <!-- BDBMODULE: shared BDB-JE disk persistence manager -->\n <bean id=\"bdb\" \n  class=\"org.archive.bdb.BdbModule\">\n  <!-- <property name=\"dir\" value=\"state\" /> -->\n  <!-- if neither cachePercent or cacheSize are specified (the default), bdb\n       uses its own default of 60% -->\n  <!-- <property name=\"cachePercent\" value=\"0\" /> -->\n  <!-- <property name=\"cacheSize\" value=\"0\" /> -->\n  <!-- <property name=\"useSharedCache\" value=\"true\" /> -->\n  <!-- <property name=\"expectedConcurrency\" value=\"25\" /> -->\n </bean>\n \n <!-- BDBCOOKIESTORE: disk-based cookie storage for FetchHTTP -->\n <bean id=\"cookieStore\" \n  class=\"org.archive.modules.fetcher.BdbCookieStore\">\n  <!-- <property name=\"cookiesLoadFile\"><null/></property> -->\n  <!-- <property name=\"cookiesSaveFile\"><null/></property> -->\n  <!-- <property name=\"bdbModule\">\n        <ref bean=\"bdb\"/>\n       </property> -->\n </bean>\n \n <!-- SERVERCACHE: shared cache of server/host info -->\n <bean id=\"serverCache\" \n   class=\"org.archive.modules.net.BdbServerCache\">\n  <!-- <property name=\"bdb\">\n        <ref bean=\"bdb\"/>\n       </property> -->\n </bean>\n\n <!-- CONFIG PATH CONFIGURER: required helper making crawl paths relative\n      to crawler-beans.cxml file, and tracking crawl files for web UI -->\n <bean id=\"configPathConfigurer\" \n   class=\"org.archive.spring.ConfigPathConfigurer\">\n </bean>\n \n</beans>\n\n',1,1,_binary '',0,NULL,'HERITRIX3',NULL,NULL,NULL,_binary '');
/*!40000 ALTER TABLE `PROFILE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROFILE_BASIC_CREDENTIALS`
--

DROP TABLE IF EXISTS `PROFILE_BASIC_CREDENTIALS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROFILE_BASIC_CREDENTIALS` (
  `PBC_PC_OID` bigint(20) NOT NULL,
  `PBC_REALM` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PBC_PC_OID`),
  KEY `FKE72A5AF5BD9AB61` (`PBC_PC_OID`),
  CONSTRAINT `FKE72A5AF5BD9AB61` FOREIGN KEY (`PBC_PC_OID`) REFERENCES `PROFILE_CREDENTIALS` (`PC_OID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROFILE_BASIC_CREDENTIALS`
--

LOCK TABLES `PROFILE_BASIC_CREDENTIALS` WRITE;
/*!40000 ALTER TABLE `PROFILE_BASIC_CREDENTIALS` DISABLE KEYS */;
/*!40000 ALTER TABLE `PROFILE_BASIC_CREDENTIALS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROFILE_CREDENTIALS`
--

DROP TABLE IF EXISTS `PROFILE_CREDENTIALS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROFILE_CREDENTIALS` (
  `PC_OID` bigint(20) NOT NULL,
  `PC_DOMAIN` varchar(255) DEFAULT NULL,
  `PC_PASSWORD` varchar(255) DEFAULT NULL,
  `PC_USERNAME` varchar(255) DEFAULT NULL,
  `PC_PROFILE_OVERIDE_OID` bigint(20) DEFAULT NULL,
  `PC_INDEX` int(11) DEFAULT NULL,
  PRIMARY KEY (`PC_OID`),
  KEY `FK317A252682C63D7F` (`PC_PROFILE_OVERIDE_OID`),
  CONSTRAINT `FK317A252682C63D7F` FOREIGN KEY (`PC_PROFILE_OVERIDE_OID`) REFERENCES `PROFILE_OVERRIDES` (`PO_OID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROFILE_CREDENTIALS`
--

LOCK TABLES `PROFILE_CREDENTIALS` WRITE;
/*!40000 ALTER TABLE `PROFILE_CREDENTIALS` DISABLE KEYS */;
/*!40000 ALTER TABLE `PROFILE_CREDENTIALS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROFILE_FORM_CREDENTIALS`
--

DROP TABLE IF EXISTS `PROFILE_FORM_CREDENTIALS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROFILE_FORM_CREDENTIALS` (
  `PRC_PC_OID` bigint(20) NOT NULL,
  `PFC_METHOD` varchar(4) DEFAULT NULL,
  `PFC_LOGIN_URI` varchar(255) DEFAULT NULL,
  `PFC_PASSWORD_FIELD` varchar(255) DEFAULT NULL,
  `PFC_USERNAME_FIELD` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PRC_PC_OID`),
  KEY `FK6B1303D750209B71` (`PRC_PC_OID`),
  CONSTRAINT `FK6B1303D750209B71` FOREIGN KEY (`PRC_PC_OID`) REFERENCES `PROFILE_CREDENTIALS` (`PC_OID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROFILE_FORM_CREDENTIALS`
--

LOCK TABLES `PROFILE_FORM_CREDENTIALS` WRITE;
/*!40000 ALTER TABLE `PROFILE_FORM_CREDENTIALS` DISABLE KEYS */;
/*!40000 ALTER TABLE `PROFILE_FORM_CREDENTIALS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROFILE_OVERRIDES`
--

DROP TABLE IF EXISTS `PROFILE_OVERRIDES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROFILE_OVERRIDES` (
  `PO_OID` bigint(20) NOT NULL,
  `PO_EXCL_MIME_TYPES` varchar(255) DEFAULT NULL,
  `PO_MAX_BYES` bigint(20) DEFAULT NULL,
  `PO_MAX_DOCS` bigint(20) DEFAULT NULL,
  `PO_MAX_HOPS` int(11) DEFAULT NULL,
  `PO_MAX_PATH_DEPTH` int(11) DEFAULT NULL,
  `PO_MAX_TIME_SEC` bigint(20) DEFAULT NULL,
  `PO_ROBOTS_POLICY` varchar(10) DEFAULT NULL,
  `PO_H3_DOC_LIMIT` int(11) DEFAULT NULL,
  `PO_H3_DATA_LIMIT` double DEFAULT NULL,
  `PO_H3_DATA_LIMIT_UNIT` varchar(40) DEFAULT NULL,
  `PO_H3_TIME_LIMIT` double DEFAULT NULL,
  `PO_H3_TIME_LIMIT_UNIT` varchar(40) DEFAULT NULL,
  `PO_H3_MAX_PATH_DEPTH` int(11) DEFAULT NULL,
  `PO_H3_MAX_HOPS` int(11) DEFAULT NULL,
  `PO_H3_MAX_TRANS_HOPS` int(11) DEFAULT NULL,
  `PO_H3_IGNORE_ROBOTS` bit(1) DEFAULT NULL,
  `PO_H3_EXTRACT_JS` bit(1) DEFAULT NULL,
  `PO_H3_IGNORE_COOKIES` bit(1) DEFAULT NULL,
  `PO_OR_CREDENTIALS` bit(1) DEFAULT NULL,
  `PO_OR_EXCL_MIME_TYPES` bit(1) DEFAULT NULL,
  `PO_OR_EXCLUSION_URI` bit(1) DEFAULT NULL,
  `PO_OR_INCLUSION_URI` bit(1) DEFAULT NULL,
  `PO_OR_MAX_BYTES` bit(1) DEFAULT NULL,
  `PO_OR_MAX_DOCS` bit(1) DEFAULT NULL,
  `PO_OR_MAX_HOPS` bit(1) DEFAULT NULL,
  `PO_OR_MAX_PATH_DEPTH` bit(1) DEFAULT NULL,
  `PO_OR_MAX_TIME_SEC` bit(1) DEFAULT NULL,
  `PO_OR_ROBOTS_POLICY` bit(1) DEFAULT NULL,
  `PO_H3_OR_DOC_LIMIT` bit(1) DEFAULT NULL,
  `PO_H3_OR_DATA_LIMIT` bit(1) DEFAULT NULL,
  `PO_H3_OR_TIME_LIMIT` bit(1) DEFAULT NULL,
  `PO_H3_OR_MAX_PATH_DEPTH` bit(1) DEFAULT NULL,
  `PO_H3_OR_MAX_HOPS` bit(1) DEFAULT NULL,
  `PO_H3_OR_MAX_TRANS_HOPS` bit(1) DEFAULT NULL,
  `PO_H3_OR_IGNORE_ROBOTS` bit(1) DEFAULT NULL,
  `PO_H3_OR_EXTRACT_JS` bit(1) DEFAULT NULL,
  `PO_H3_OR_IGNORE_COOKIES` bit(1) DEFAULT NULL,
  `PO_H3_OR_BLOCK_URL` bit(1) DEFAULT NULL,
  `PO_H3_OR_INCL_URL` bit(1) DEFAULT NULL,
  `PO_H3_OR_RAW_PROFILE` bit(1) DEFAULT NULL,
  `PO_H3_RAW_PROFILE` text,
  PRIMARY KEY (`PO_OID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROFILE_OVERRIDES`
--

LOCK TABLES `PROFILE_OVERRIDES` WRITE;
/*!40000 ALTER TABLE `PROFILE_OVERRIDES` DISABLE KEYS */;
/*!40000 ALTER TABLE `PROFILE_OVERRIDES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REJECTION_REASON`
--

DROP TABLE IF EXISTS `REJECTION_REASON`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REJECTION_REASON` (
  `RR_OID` bigint(20) NOT NULL,
  `RR_NAME` varchar(100) NOT NULL,
  `RR_AVAILABLE_FOR_TARGET` bit(1) NOT NULL DEFAULT b'0',
  `RR_AVAILABLE_FOR_TI` bit(1) NOT NULL DEFAULT b'0',
  `RR_AGC_OID` bigint(20) NOT NULL,
  PRIMARY KEY (`RR_OID`),
  UNIQUE KEY `RR_NAME_AND_AGENCY` (`RR_NAME`,`RR_AGC_OID`),
  KEY `FK_RR_AGENCY_OID` (`RR_AGC_OID`),
  CONSTRAINT `FK_RR_AGENCY_OID` FOREIGN KEY (`RR_AGC_OID`) REFERENCES `AGENCY` (`AGC_OID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REJECTION_REASON`
--

LOCK TABLES `REJECTION_REASON` WRITE;
/*!40000 ALTER TABLE `REJECTION_REASON` DISABLE KEYS */;
/*!40000 ALTER TABLE `REJECTION_REASON` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLE_PRIVILEGE`
--

DROP TABLE IF EXISTS `ROLE_PRIVILEGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ROLE_PRIVILEGE` (
  `PRV_OID` bigint(20) NOT NULL,
  `PRV_CODE` varchar(40) NOT NULL,
  `PRV_ROLE_OID` bigint(20) DEFAULT NULL,
  `PRV_SCOPE` int(11) NOT NULL,
  PRIMARY KEY (`PRV_OID`),
  KEY `FK_PRIV_ROLE_OID` (`PRV_ROLE_OID`),
  CONSTRAINT `FK_PRIV_ROLE_OID` FOREIGN KEY (`PRV_ROLE_OID`) REFERENCES `WCTROLE` (`ROL_OID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLE_PRIVILEGE`
--

LOCK TABLES `ROLE_PRIVILEGE` WRITE;
/*!40000 ALTER TABLE `ROLE_PRIVILEGE` DISABLE KEYS */;
INSERT INTO `ROLE_PRIVILEGE` VALUES (1,'MANAGE_WEB_HARVESTER',0,0),(2,'SET_HARVEST_PROFILE_LV1',0,100),(3,'GIVE_OWNERSHIP',0,0),(4,'MODIFY_TARGET',0,0),(5,'MANAGE_REASONS',0,100),(6,'SET_HARVEST_PROFILE_LV2',0,100),(7,'MANAGE_PROFILES',0,100),(8,'MANAGE_INDICATORS',0,100),(9,'VIEW_PROFILES',0,100),(10,'MANAGE_ROLES',0,0),(11,'MANAGE_TARGET_INSTANCES',0,0),(12,'MODIFY_OWN_CREDENTIALS',0,200),(13,'ADD_TARGET_TO_GROUP',0,0),(14,'ARCHIVE_HARVEST',0,0),(15,'MANAGE_USERS',0,0),(16,'MODIFY_PERMISSION',0,100),(17,'GRANT_CROSS_AGENCY_USER_ADMIN',0,500),(18,'CONFIGURE_PARAMETERS',0,500),(19,'DELETE_TASK',0,200),(20,'TAKE_OWNERSHIP',0,0),(21,'APPROVE_TARGET',0,0),(22,'MODIFY_SITE',0,100),(23,'CANCEL_TARGET',0,0),(24,'SYSTEM_REPORT_LEVEL_1',0,100),(25,'LOGIN',0,500),(26,'CREATE_SITE',0,100),(27,'CREATE_TARGET',0,100),(28,'MANAGE_GROUP_OVERRIDES',0,0),(29,'MANAGE_AGENCIES',0,0),(30,'GENERATE_TEMPLATE',0,100),(31,'REINSTATE_TARGET',0,0),(32,'PERMISSION_REQUEST_TEMPLATE',0,100),(33,'MANAGE_GROUP',0,0),(34,'ADD_SCHEDULE_TO_TARGET',0,0),(35,'CONFIRM_PERMISSION',0,100),(36,'ENABLE_DISABLE_SITE',0,100),(37,'MANAGE_GROUP_SCHEDULE',0,0),(38,'CREATE_GROUP',0,100),(39,'MANAGE_FLAGS',0,100),(40,'TRANSFER_LINKED_TARGETS',0,100),(41,'LAUNCH_TARGET_INSTANCE_IMMEDIATE',0,100),(42,'ENDORSE_HARVEST',0,0),(43,'UNENDORSE_HARVEST',0,0),(44,'DELETE_TARGET',0,0),(45,'SET_HARVEST_PROFILE_LV3',0,100);
/*!40000 ALTER TABLE `ROLE_PRIVILEGE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCHEDULE`
--

DROP TABLE IF EXISTS `SCHEDULE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SCHEDULE` (
  `S_OID` bigint(20) NOT NULL,
  `S_CRON` varchar(255) NOT NULL,
  `S_START` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `S_END` timestamp NULL DEFAULT NULL,
  `S_TARGET_ID` bigint(20) DEFAULT NULL,
  `S_TYPE` int(11) NOT NULL,
  `S_OWNER_OID` bigint(20) DEFAULT NULL,
  `S_NEXT_SCHEDULE_TIME` timestamp NULL DEFAULT NULL,
  `S_ABSTRACT_TARGET_ID` bigint(20) DEFAULT NULL,
  `S_LAST_PROCESSED_DATE` datetime DEFAULT '2001-01-01 00:00:00',
  PRIMARY KEY (`S_OID`),
  KEY `FK50C8297BE49544D` (`S_ABSTRACT_TARGET_ID`),
  KEY `FK_S_OWNER_OID` (`S_OWNER_OID`),
  KEY `FK_S_TARGET_ID` (`S_TARGET_ID`),
  KEY `IX_SHED_PROC_DATE` (`S_LAST_PROCESSED_DATE`),
  KEY `IX_SHED_NEXT_TIME` (`S_NEXT_SCHEDULE_TIME`),
  CONSTRAINT `FK50C8297BE49544D` FOREIGN KEY (`S_ABSTRACT_TARGET_ID`) REFERENCES `ABSTRACT_TARGET` (`AT_OID`),
  CONSTRAINT `FK_S_OWNER_OID` FOREIGN KEY (`S_OWNER_OID`) REFERENCES `WCTUSER` (`USR_OID`),
  CONSTRAINT `FK_S_TARGET_ID` FOREIGN KEY (`S_TARGET_ID`) REFERENCES `ABSTRACT_TARGET` (`AT_OID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCHEDULE`
--

LOCK TABLES `SCHEDULE` WRITE;
/*!40000 ALTER TABLE `SCHEDULE` DISABLE KEYS */;
/*!40000 ALTER TABLE `SCHEDULE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SEED`
--

DROP TABLE IF EXISTS `SEED`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SEED` (
  `S_OID` bigint(20) NOT NULL,
  `S_SEED` text,
  `S_TARGET_ID` bigint(20) DEFAULT NULL,
  `S_PRIMARY` bit(1) DEFAULT NULL,
  PRIMARY KEY (`S_OID`),
  KEY `FK_SEED_TARGET_ID` (`S_TARGET_ID`),
  KEY `IX_S_TARGET_ID` (`S_TARGET_ID`),
  CONSTRAINT `FK_SEED_TARGET_ID` FOREIGN KEY (`S_TARGET_ID`) REFERENCES `TARGET` (`T_AT_OID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SEED`
--

LOCK TABLES `SEED` WRITE;
/*!40000 ALTER TABLE `SEED` DISABLE KEYS */;
/*!40000 ALTER TABLE `SEED` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SEED_HISTORY`
--

DROP TABLE IF EXISTS `SEED_HISTORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SEED_HISTORY` (
  `SH_OID` bigint(20) NOT NULL,
  `SH_TI_OID` bigint(20) DEFAULT NULL,
  `SH_SEED` text NOT NULL,
  `SH_PRIMARY` bit(1) NOT NULL,
  PRIMARY KEY (`SH_OID`),
  KEY `FK_SEED_HISTORY_TI_OID` (`SH_TI_OID`),
  KEY `IX_SH_TI_OID` (`SH_TI_OID`),
  CONSTRAINT `FK_SEED_HISTORY_TI_OID` FOREIGN KEY (`SH_TI_OID`) REFERENCES `TARGET_INSTANCE` (`TI_OID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SEED_HISTORY`
--

LOCK TABLES `SEED_HISTORY` WRITE;
/*!40000 ALTER TABLE `SEED_HISTORY` DISABLE KEYS */;
/*!40000 ALTER TABLE `SEED_HISTORY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SEED_PERMISSION`
--

DROP TABLE IF EXISTS `SEED_PERMISSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SEED_PERMISSION` (
  `SP_SEED_ID` bigint(20) NOT NULL,
  `SP_PERMISSION_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`SP_SEED_ID`,`SP_PERMISSION_ID`),
  KEY `FK9659805D68A4F4BA` (`SP_SEED_ID`),
  KEY `FK_SP_PERMISSION_ID` (`SP_PERMISSION_ID`),
  CONSTRAINT `FK9659805D68A4F4BA` FOREIGN KEY (`SP_SEED_ID`) REFERENCES `SEED` (`S_OID`),
  CONSTRAINT `FK_SP_PERMISSION_ID` FOREIGN KEY (`SP_PERMISSION_ID`) REFERENCES `PERMISSION` (`PE_OID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SEED_PERMISSION`
--

LOCK TABLES `SEED_PERMISSION` WRITE;
/*!40000 ALTER TABLE `SEED_PERMISSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `SEED_PERMISSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SIP_PART_ELEMENT`
--

DROP TABLE IF EXISTS `SIP_PART_ELEMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SIP_PART_ELEMENT` (
  `SPE_TARGET_INSTANCE_OID` bigint(20) NOT NULL,
  `SPE_VALUE` mediumtext,
  `SPE_KEY` varchar(191) NOT NULL,
  PRIMARY KEY (`SPE_TARGET_INSTANCE_OID`,`SPE_KEY`),
  KEY `FK4998B1F5F51BBD3F` (`SPE_TARGET_INSTANCE_OID`),
  CONSTRAINT `FK4998B1F5F51BBD3F` FOREIGN KEY (`SPE_TARGET_INSTANCE_OID`) REFERENCES `TARGET_INSTANCE` (`TI_OID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SIP_PART_ELEMENT`
--

LOCK TABLES `SIP_PART_ELEMENT` WRITE;
/*!40000 ALTER TABLE `SIP_PART_ELEMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `SIP_PART_ELEMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SITE`
--

DROP TABLE IF EXISTS `SITE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SITE` (
  `ST_OID` bigint(20) NOT NULL,
  `ST_TITLE` varchar(191) NOT NULL,
  `ST_DESC` text,
  `ST_LIBRARY_ORDER_NO` varchar(32) DEFAULT NULL,
  `ST_NOTES` text,
  `ST_PUBLISHED` bit(1) NOT NULL,
  `ST_ACTIVE` bit(1) NOT NULL,
  `ST_OWNING_AGENCY_ID` bigint(20) DEFAULT NULL,
  `ST_CREATION_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ST_OID`),
  UNIQUE KEY `ST_TITLE` (`ST_TITLE`),
  KEY `FK_OWNING_AGENCY_ID` (`ST_OWNING_AGENCY_ID`),
  CONSTRAINT `FK_OWNING_AGENCY_ID` FOREIGN KEY (`ST_OWNING_AGENCY_ID`) REFERENCES `AGENCY` (`AGC_OID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SITE`
--

LOCK TABLES `SITE` WRITE;
/*!40000 ALTER TABLE `SITE` DISABLE KEYS */;
INSERT INTO `SITE` VALUES (3,'Wildcard authorisation','','',NULL,_binary '\0',_binary '',0,'2021-09-04 17:19:16');
/*!40000 ALTER TABLE `SITE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SITE_AUTH_AGENCY`
--

DROP TABLE IF EXISTS `SITE_AUTH_AGENCY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SITE_AUTH_AGENCY` (
  `SA_SITE_ID` bigint(20) NOT NULL,
  `SA_AGENT_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`SA_SITE_ID`,`SA_AGENT_ID`),
  KEY `FKDF808D84C049BBEB` (`SA_SITE_ID`),
  KEY `FK_SA_AGENT_ID` (`SA_AGENT_ID`),
  CONSTRAINT `FKDF808D84C049BBEB` FOREIGN KEY (`SA_SITE_ID`) REFERENCES `SITE` (`ST_OID`),
  CONSTRAINT `FK_SA_AGENT_ID` FOREIGN KEY (`SA_AGENT_ID`) REFERENCES `AUTHORISING_AGENT` (`AA_OID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SITE_AUTH_AGENCY`
--

LOCK TABLES `SITE_AUTH_AGENCY` WRITE;
/*!40000 ALTER TABLE `SITE_AUTH_AGENCY` DISABLE KEYS */;
INSERT INTO `SITE_AUTH_AGENCY` VALUES (3,2);
/*!40000 ALTER TABLE `SITE_AUTH_AGENCY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TARGET`
--

DROP TABLE IF EXISTS `TARGET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TARGET` (
  `T_AT_OID` bigint(20) NOT NULL,
  `T_RUN_ON_APPROVAL` bit(1) DEFAULT NULL,
  `T_EVALUATION_NOTE` text,
  `T_SELECTION_DATE` timestamp NULL DEFAULT NULL,
  `T_SELECTION_NOTE` text,
  `T_SELECTION_TYPE` varchar(255) DEFAULT NULL,
  `T_HARVEST_TYPE` varchar(255) DEFAULT NULL,
  `T_USE_AQA` bit(1) NOT NULL DEFAULT b'0',
  `T_ALLOW_OPTIMIZE` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`T_AT_OID`),
  KEY `FK931165917947B83E` (`T_AT_OID`),
  CONSTRAINT `FK931165917947B83E` FOREIGN KEY (`T_AT_OID`) REFERENCES `ABSTRACT_TARGET` (`AT_OID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TARGET`
--

LOCK TABLES `TARGET` WRITE;
/*!40000 ALTER TABLE `TARGET` DISABLE KEYS */;
/*!40000 ALTER TABLE `TARGET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TARGET_GROUP`
--

DROP TABLE IF EXISTS `TARGET_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TARGET_GROUP` (
  `TG_AT_OID` bigint(20) NOT NULL,
  `TG_SIP_TYPE` int(11) DEFAULT NULL,
  `TG_START_DATE` date DEFAULT NULL,
  `TG_END_DATE` date DEFAULT NULL,
  `TG_OWNERSHIP_METADATA` varchar(255) DEFAULT NULL,
  `TG_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`TG_AT_OID`),
  KEY `FKB444963161DABD5F` (`TG_AT_OID`),
  CONSTRAINT `FKB444963161DABD5F` FOREIGN KEY (`TG_AT_OID`) REFERENCES `ABSTRACT_TARGET` (`AT_OID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TARGET_GROUP`
--

LOCK TABLES `TARGET_GROUP` WRITE;
/*!40000 ALTER TABLE `TARGET_GROUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `TARGET_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TARGET_INSTANCE`
--

DROP TABLE IF EXISTS `TARGET_INSTANCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TARGET_INSTANCE` (
  `TI_OID` bigint(20) NOT NULL,
  `TI_VERSION` int(11) NOT NULL,
  `TI_SCHEDULE_ID` bigint(20) DEFAULT NULL,
  `TI_TARGET_ID` bigint(20) DEFAULT NULL,
  `TI_PRIORITY` int(11) NOT NULL,
  `TI_SCHEDULED_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TI_STATE` varchar(50) NOT NULL,
  `TI_BANDWIDTH_PERCENT` int(11) DEFAULT NULL,
  `TI_ALLOCATED_BANDWIDTH` bigint(20) DEFAULT NULL,
  `TI_START_TIME` datetime DEFAULT NULL,
  `TI_OWNER_ID` bigint(20) DEFAULT NULL,
  `TI_DISPLAY_ORDER` int(11) DEFAULT NULL,
  `TI_PROF_OVERRIDE_OID` bigint(20) DEFAULT NULL,
  `TI_PURGED` bit(1) NOT NULL,
  `TI_ARCHIVE_ID` varchar(40) DEFAULT NULL,
  `TI_REFERENCE` varchar(255) DEFAULT NULL,
  `TI_HARVEST_SERVER` varchar(255) DEFAULT NULL,
  `TI_DISPLAY_TARGET_INSTANCE` bit(1) NOT NULL DEFAULT b'1',
  `TI_DISPLAY_NOTE` text,
  `TI_FLAGGED` bit(1) NOT NULL DEFAULT b'0',
  `TI_PROFILE_ID` bigint(20) DEFAULT NULL,
  `TI_ARCHIVED_TIME` datetime DEFAULT NULL,
  `TI_FIRST_FROM_TARGET` bit(1) NOT NULL DEFAULT b'0',
  `TI_DISPLAY_CHG_REASON` text,
  `TI_USE_AQA` bit(1) NOT NULL DEFAULT b'0',
  `TI_ALLOW_OPTIMIZE` tinyint(1) NOT NULL DEFAULT '0',
  `TI_FLAG_OID` bigint(20) DEFAULT NULL,
  `TI_RECOMMENDATION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`TI_OID`),
  UNIQUE KEY `TI_ARCHIVE_ID` (`TI_ARCHIVE_ID`),
  KEY `FK_TI_TARGET_ID` (`TI_TARGET_ID`),
  KEY `FK_TI_USER_ID` (`TI_OWNER_ID`),
  KEY `FK_TI_PROF_OVERRIDE_OID` (`TI_PROF_OVERRIDE_OID`),
  KEY `FK_TI_SCHEDULE_ID` (`TI_SCHEDULE_ID`),
  KEY `IDX_FLAGGED` (`TI_FLAGGED`),
  KEY `IX_TI_TARGET_ID` (`TI_TARGET_ID`),
  KEY `IX_TI_SCHEDULE_ID` (`TI_SCHEDULE_ID`),
  KEY `IX_TI_PROFILE_ID` (`TI_PROFILE_ID`),
  KEY `IX_TI_FLAG_OID` (`TI_FLAG_OID`),
  CONSTRAINT `FK_F_OID` FOREIGN KEY (`TI_FLAG_OID`) REFERENCES `FLAG` (`F_OID`),
  CONSTRAINT `FK_TI_PROF_OVERRIDE_OID` FOREIGN KEY (`TI_PROF_OVERRIDE_OID`) REFERENCES `PROFILE_OVERRIDES` (`PO_OID`),
  CONSTRAINT `FK_TI_SCHEDULE_ID` FOREIGN KEY (`TI_SCHEDULE_ID`) REFERENCES `SCHEDULE` (`S_OID`),
  CONSTRAINT `FK_TI_TARGET_ID` FOREIGN KEY (`TI_TARGET_ID`) REFERENCES `ABSTRACT_TARGET` (`AT_OID`),
  CONSTRAINT `FK_TI_USER_ID` FOREIGN KEY (`TI_OWNER_ID`) REFERENCES `WCTUSER` (`USR_OID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TARGET_INSTANCE`
--

LOCK TABLES `TARGET_INSTANCE` WRITE;
/*!40000 ALTER TABLE `TARGET_INSTANCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `TARGET_INSTANCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TARGET_INSTANCE_ORIG_SEED`
--

DROP TABLE IF EXISTS `TARGET_INSTANCE_ORIG_SEED`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TARGET_INSTANCE_ORIG_SEED` (
  `TIOS_TI_OID` bigint(20) NOT NULL,
  `TIOS_SEED` varchar(1024) DEFAULT NULL,
  KEY `FKD47ACFF36748402E` (`TIOS_TI_OID`),
  KEY `IX_TIOS_TI_OID` (`TIOS_TI_OID`),
  CONSTRAINT `FKD47ACFF36748402E` FOREIGN KEY (`TIOS_TI_OID`) REFERENCES `TARGET_INSTANCE` (`TI_OID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TARGET_INSTANCE_ORIG_SEED`
--

LOCK TABLES `TARGET_INSTANCE_ORIG_SEED` WRITE;
/*!40000 ALTER TABLE `TARGET_INSTANCE_ORIG_SEED` DISABLE KEYS */;
/*!40000 ALTER TABLE `TARGET_INSTANCE_ORIG_SEED` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TASK`
--

DROP TABLE IF EXISTS `TASK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TASK` (
  `TSK_OID` bigint(20) NOT NULL,
  `TSK_USR_OID` bigint(20) DEFAULT NULL,
  `TSK_MESSAGE` text,
  `TSK_SENDER` varchar(80) NOT NULL,
  `TSK_SENT_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TSK_SUBJECT` varchar(255) NOT NULL,
  `TSK_PRIVILEGE` varchar(40) DEFAULT NULL,
  `TSK_AGC_OID` bigint(20) NOT NULL,
  `TSK_MSG_TYPE` varchar(40) NOT NULL,
  `TSK_RESOURCE_OID` bigint(20) NOT NULL,
  `TSK_RESOURCE_TYPE` varchar(80) NOT NULL,
  PRIMARY KEY (`TSK_OID`),
  KEY `FK_TASK_AGENCY_OID` (`TSK_AGC_OID`),
  CONSTRAINT `FK_TASK_AGENCY_OID` FOREIGN KEY (`TSK_AGC_OID`) REFERENCES `AGENCY` (`AGC_OID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TASK`
--

LOCK TABLES `TASK` WRITE;
/*!40000 ALTER TABLE `TASK` DISABLE KEYS */;
/*!40000 ALTER TABLE `TASK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `URL_PATTERN`
--

DROP TABLE IF EXISTS `URL_PATTERN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `URL_PATTERN` (
  `UP_OID` bigint(20) NOT NULL,
  `UP_PATTERN` text,
  `UP_SITE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`UP_OID`),
  KEY `FK_UP_SITE_ID` (`UP_SITE_ID`),
  CONSTRAINT `FK_UP_SITE_ID` FOREIGN KEY (`UP_SITE_ID`) REFERENCES `SITE` (`ST_OID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `URL_PATTERN`
--

LOCK TABLES `URL_PATTERN` WRITE;
/*!40000 ALTER TABLE `URL_PATTERN` DISABLE KEYS */;
INSERT INTO `URL_PATTERN` VALUES (5,'http://*/',3),(6,'https://*/',3);
/*!40000 ALTER TABLE `URL_PATTERN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `URL_PERMISSION_MAPPING`
--

DROP TABLE IF EXISTS `URL_PERMISSION_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `URL_PERMISSION_MAPPING` (
  `UPM_OID` bigint(20) NOT NULL,
  `UPM_PERMISSION_ID` bigint(20) DEFAULT NULL,
  `UPM_URL_PATTERN_ID` bigint(20) DEFAULT NULL,
  `UPM_DOMAIN` text,
  PRIMARY KEY (`UPM_OID`),
  KEY `FK_UPM_URL_PATTERN_ID` (`UPM_URL_PATTERN_ID`),
  KEY `FK_UPM_PERMISSION_ID` (`UPM_PERMISSION_ID`),
  CONSTRAINT `FK_UPM_PERMISSION_ID` FOREIGN KEY (`UPM_PERMISSION_ID`) REFERENCES `PERMISSION` (`PE_OID`),
  CONSTRAINT `FK_UPM_URL_PATTERN_ID` FOREIGN KEY (`UPM_URL_PATTERN_ID`) REFERENCES `URL_PATTERN` (`UP_OID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `URL_PERMISSION_MAPPING`
--

LOCK TABLES `URL_PERMISSION_MAPPING` WRITE;
/*!40000 ALTER TABLE `URL_PERMISSION_MAPPING` DISABLE KEYS */;
INSERT INTO `URL_PERMISSION_MAPPING` VALUES (7,4,5,'*'),(8,4,6,'*');
/*!40000 ALTER TABLE `URL_PERMISSION_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `URL_PERMISSION_MAPPING_VIEW`
--

DROP TABLE IF EXISTS `URL_PERMISSION_MAPPING_VIEW`;
/*!50001 DROP VIEW IF EXISTS `URL_PERMISSION_MAPPING_VIEW`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `URL_PERMISSION_MAPPING_VIEW` AS SELECT 
 1 AS `upm_oid`,
 1 AS `upm_domain`,
 1 AS `pe_oid`,
 1 AS `pe_end_date`,
 1 AS `pe_owning_agency_id`,
 1 AS `up_pattern`,
 1 AS `st_active`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `USER_ROLE`
--

DROP TABLE IF EXISTS `USER_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_ROLE` (
  `URO_ROL_OID` bigint(20) NOT NULL,
  `URO_USR_OID` bigint(20) NOT NULL,
  PRIMARY KEY (`URO_USR_OID`,`URO_ROL_OID`),
  KEY `FK_USERROLE_TO_ROLE` (`URO_ROL_OID`),
  KEY `FK_USERROLE_TO_USER` (`URO_USR_OID`),
  CONSTRAINT `FK_USERROLE_TO_ROLE` FOREIGN KEY (`URO_ROL_OID`) REFERENCES `WCTROLE` (`ROL_OID`),
  CONSTRAINT `FK_USERROLE_TO_USER` FOREIGN KEY (`URO_USR_OID`) REFERENCES `WCTUSER` (`USR_OID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ROLE`
--

LOCK TABLES `USER_ROLE` WRITE;
/*!40000 ALTER TABLE `USER_ROLE` DISABLE KEYS */;
INSERT INTO `USER_ROLE` VALUES (0,0);
/*!40000 ALTER TABLE `USER_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WCTAUDIT`
--

DROP TABLE IF EXISTS `WCTAUDIT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WCTAUDIT` (
  `AUD_OID` bigint(20) NOT NULL,
  `AUD_ACTION` varchar(40) NOT NULL,
  `AUD_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `AUD_FIRSTNAME` varchar(50) DEFAULT NULL,
  `AUD_LASTNAME` varchar(50) DEFAULT NULL,
  `AUD_MESSAGE` text NOT NULL,
  `AUD_SUBJECT_TYPE` varchar(255) NOT NULL,
  `AUD_USERNAME` varchar(80) DEFAULT NULL,
  `AUD_USER_OID` bigint(20) DEFAULT NULL,
  `AUD_SUBJECT_OID` bigint(20) DEFAULT NULL,
  `AUD_AGENCY_OID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AUD_OID`),
  KEY `FK_AUD_USER_OID` (`AUD_USER_OID`),
  KEY `FK_AUD_AGENCY_OID` (`AUD_AGENCY_OID`),
  KEY `IX_AUD_DATE` (`AUD_DATE`),
  CONSTRAINT `FK_AUD_AGENCY_OID` FOREIGN KEY (`AUD_AGENCY_OID`) REFERENCES `AGENCY` (`AGC_OID`),
  CONSTRAINT `FK_AUD_USER_OID` FOREIGN KEY (`AUD_USER_OID`) REFERENCES `WCTUSER` (`USR_OID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WCTAUDIT`
--

LOCK TABLES `WCTAUDIT` WRITE;
/*!40000 ALTER TABLE `WCTAUDIT` DISABLE KEYS */;
INSERT INTO `WCTAUDIT` VALUES (1,'LOGIN_SUCCESS','2021-09-04 17:11:53','System','Bootstrap','Successful Login for username: bootstrap','org.webcurator.domain.model.auth.User','bootstrap',0,0,0),(2,'UPDATE_USER','2021-09-04 17:12:48','System','Bootstrap','The User named \'bootstrap\' has been updated','org.webcurator.domain.model.auth.User','bootstrap',0,0,0),(3,'LOGIN_SUCCESS','2021-09-04 17:12:57','System','Bootstrap','Successful Login for username: bootstrap','org.webcurator.domain.model.auth.User','bootstrap',0,0,0),(4,'UPDATE_ROLE','2021-09-04 17:13:12','System','Bootstrap','The role \'Bootstrap Role\' has been updated under the \'bootstrap\' Agency.','org.webcurator.domain.model.auth.Role','bootstrap',0,0,0),(5,'LOGIN_SUCCESS','2021-09-04 17:13:16','System','Bootstrap','Successful Login for username: bootstrap','org.webcurator.domain.model.auth.User','bootstrap',0,0,0),(6,'NEW_PROFILE','2021-09-04 17:14:12','System','Bootstrap','A new profile Customized profile has been created for bootstrap','org.webcurator.domain.model.core.Profile','bootstrap',0,1,0),(7,'SET_DEFAULT_PROFILE','2021-09-04 17:14:21','System','Bootstrap','The profile Customized profile has been set as the default for bootstrap','org.webcurator.domain.model.core.Profile','bootstrap',0,1,0),(8,'NEW_BANDWIDTH_RESTRICTION','2021-09-04 17:14:37','System','Bootstrap','New bandwidth restriction: MONDAY - 00:00:00 to 23:59:59 - 5000KBps','org.webcurator.domain.model.core.BandwidthRestriction','bootstrap',0,1,0),(9,'NEW_BANDWIDTH_RESTRICTION','2021-09-04 17:14:40','System','Bootstrap','New bandwidth restriction: TUESDAY - 00:00:00 to 23:59:59 - 5000KBps','org.webcurator.domain.model.core.BandwidthRestriction','bootstrap',0,2,0),(10,'NEW_BANDWIDTH_RESTRICTION','2021-09-04 17:14:44','System','Bootstrap','New bandwidth restriction: WEDNESDAY - 00:00:00 to 23:59:59 - 5000KBps','org.webcurator.domain.model.core.BandwidthRestriction','bootstrap',0,3,0),(11,'NEW_BANDWIDTH_RESTRICTION','2021-09-04 17:14:48','System','Bootstrap','New bandwidth restriction: THURSDAY - 00:00:00 to 23:59:59 - 5000KBps','org.webcurator.domain.model.core.BandwidthRestriction','bootstrap',0,4,0),(12,'NEW_BANDWIDTH_RESTRICTION','2021-09-04 17:14:51','System','Bootstrap','New bandwidth restriction: FRIDAY - 00:00:00 to 23:59:59 - 5000KBps','org.webcurator.domain.model.core.BandwidthRestriction','bootstrap',0,5,0),(13,'NEW_BANDWIDTH_RESTRICTION','2021-09-04 17:14:54','System','Bootstrap','New bandwidth restriction: SATURDAY - 00:00:00 to 23:59:59 - 5000KBps','org.webcurator.domain.model.core.BandwidthRestriction','bootstrap',0,6,0),(14,'NEW_BANDWIDTH_RESTRICTION','2021-09-04 17:14:58','System','Bootstrap','New bandwidth restriction: SUNDAY - 00:00:00 to 23:59:59 - 5000KBps','org.webcurator.domain.model.core.BandwidthRestriction','bootstrap',0,7,0),(15,'NEW_HARVEST_AUTHORISATION','2021-09-04 17:19:16','System','Bootstrap','New Harvest Authorisation created','org.webcurator.domain.model.core.Site','bootstrap',0,3,0),(16,'NEW_PERMISSION','2021-09-04 17:19:16','System','Bootstrap','New permission created','org.webcurator.domain.model.core.Permission','bootstrap',0,4,0),(17,'UPDATE_PERMISSION','2021-09-04 17:19:16','System','Bootstrap','Permission updated','org.webcurator.domain.model.core.Permission','bootstrap',0,4,0),(18,'APPROVE_PERMISSION','2021-09-04 17:19:16','System','Bootstrap','Permission approved','org.webcurator.domain.model.core.Permission','bootstrap',0,4,0);
/*!40000 ALTER TABLE `WCTAUDIT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WCTROLE`
--

DROP TABLE IF EXISTS `WCTROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WCTROLE` (
  `ROL_OID` bigint(20) NOT NULL,
  `ROL_DESCRIPTION` varchar(255) DEFAULT NULL,
  `ROL_NAME` varchar(80) NOT NULL,
  `ROL_AGENCY_OID` bigint(20) NOT NULL,
  PRIMARY KEY (`ROL_OID`),
  KEY `FK_ROLE_AGENCY_OID` (`ROL_AGENCY_OID`),
  CONSTRAINT `FK_ROLE_AGENCY_OID` FOREIGN KEY (`ROL_AGENCY_OID`) REFERENCES `AGENCY` (`AGC_OID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WCTROLE`
--

LOCK TABLES `WCTROLE` WRITE;
/*!40000 ALTER TABLE `WCTROLE` DISABLE KEYS */;
INSERT INTO `WCTROLE` VALUES (0,'Bootstrap Role','Bootstrap Role',0);
/*!40000 ALTER TABLE `WCTROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WCTUSER`
--

DROP TABLE IF EXISTS `WCTUSER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WCTUSER` (
  `USR_OID` bigint(20) NOT NULL,
  `USR_ACTIVE` bit(1) NOT NULL,
  `USR_ADDRESS` varchar(200) DEFAULT NULL,
  `USR_EMAIL` varchar(100) NOT NULL,
  `USR_EXTERNAL_AUTH` bit(1) NOT NULL,
  `USR_FIRSTNAME` varchar(50) NOT NULL,
  `USR_FORCE_PWD_CHANGE` bit(1) NOT NULL,
  `USR_LASTNAME` varchar(50) NOT NULL,
  `USR_NOTIFICATIONS_BY_EMAIL` bit(1) NOT NULL,
  `USR_PASSWORD` varchar(255) DEFAULT NULL,
  `USR_PHONE` varchar(16) DEFAULT NULL,
  `USR_TITLE` varchar(10) DEFAULT NULL,
  `USR_USERNAME` varchar(80) NOT NULL,
  `USR_AGC_OID` bigint(20) NOT NULL,
  `USR_DEACTIVATE_DATE` timestamp NULL DEFAULT NULL,
  `USR_TASKS_BY_EMAIL` bit(1) NOT NULL,
  `USR_NOTIFY_ON_GENERAL` bit(1) NOT NULL,
  `USR_NOTIFY_ON_WARNINGS` bit(1) NOT NULL,
  PRIMARY KEY (`USR_OID`),
  UNIQUE KEY `USR_USERNAME` (`USR_USERNAME`),
  KEY `FK_USER_AGENCY_OID` (`USR_AGC_OID`),
  CONSTRAINT `FK_USER_AGENCY_OID` FOREIGN KEY (`USR_AGC_OID`) REFERENCES `AGENCY` (`AGC_OID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WCTUSER`
--

LOCK TABLES `WCTUSER` WRITE;
/*!40000 ALTER TABLE `WCTUSER` DISABLE KEYS */;
INSERT INTO `WCTUSER` VALUES (0,_binary '',NULL,'bootstrap@sytec.co.nz',_binary '\0','System',_binary '\0','Bootstrap',_binary '\0','$2a$10$VpVuN9d3BlbsEmlrGz13wujWLP72S0IUjsNR7jVeXDRMHE12.1cz6',NULL,NULL,'bootstrap',0,NULL,_binary '\0',_binary '\0',_binary '\0');
/*!40000 ALTER TABLE `WCTUSER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WCT_LOGON_DURATION`
--

DROP TABLE IF EXISTS `WCT_LOGON_DURATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WCT_LOGON_DURATION` (
  `LOGDUR_OID` bigint(20) NOT NULL,
  `LOGDUR_DURATION` bigint(20) DEFAULT NULL,
  `LOGDUR_LOGON_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LOGDUR_LOGOUT_TIME` timestamp NULL DEFAULT NULL,
  `LOGDUR_USERNAME` varchar(80) DEFAULT NULL,
  `LOGDUR_USER_OID` bigint(20) NOT NULL,
  `LOGDUR_USER_REALNAME` varchar(100) DEFAULT NULL,
  `LOGDUR_SESSION_ID` varchar(32) NOT NULL,
  PRIMARY KEY (`LOGDUR_OID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WCT_LOGON_DURATION`
--

LOCK TABLES `WCT_LOGON_DURATION` WRITE;
/*!40000 ALTER TABLE `WCT_LOGON_DURATION` DISABLE KEYS */;
INSERT INTO `WCT_LOGON_DURATION` VALUES (1,64,'2021-09-04 17:11:53','2021-09-04 17:12:57','bootstrap',0,'S. Bootstrap','E4D40E37A12CB59320EE5BBE4FB0824D'),(2,19,'2021-09-04 17:12:57','2021-09-04 17:13:16','bootstrap',0,'S. Bootstrap','C82FE9DD001A38F12A2011BA3A7F0A55'),(3,NULL,'2021-09-04 17:13:16',NULL,'bootstrap',0,'S. Bootstrap','134D9960FD5FFC672DA9AD326B5890AD');
/*!40000 ALTER TABLE `WCT_LOGON_DURATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `ABSTRACT_TARGET_GROUPTYPE_VIEW`
--

/*!50001 DROP VIEW IF EXISTS `ABSTRACT_TARGET_GROUPTYPE_VIEW`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ABSTRACT_TARGET_GROUPTYPE_VIEW` AS select `a`.`AT_OID` AS `at_oid`,`a`.`AT_DESC` AS `at_desc`,`a`.`AT_NAME` AS `at_name`,`a`.`AT_OWNER_ID` AS `at_owner_id`,`a`.`AT_PROF_OVERRIDE_OID` AS `at_prof_override_oid`,`a`.`AT_STATE` AS `at_state`,`a`.`T_PROFILE_ID` AS `t_profile_id`,`a`.`AT_OBJECT_TYPE` AS `at_object_type`,`a`.`AT_CREATION_DATE` AS `at_creation_date`,`a`.`AT_REFERENCE` AS `at_reference`,`a`.`AT_PROFILE_NOTE` AS `at_profile_note`,`a`.`AT_DUBLIN_CORE_OID` AS `at_dublin_core_oid`,`a`.`AT_ACCESS_ZONE` AS `at_access_zone`,`a`.`AT_DISPLAY_TARGET` AS `at_display_target`,`a`.`AT_DISPLAY_NOTE` AS `at_display_note`,`tg`.`TG_TYPE` AS `tg_type` from (`ABSTRACT_TARGET` `a` left join `TARGET_GROUP` `tg` on((`a`.`AT_OID` = `tg`.`TG_AT_OID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ABSTRACT_TARGET_SCHEDULE_VIEW`
--

/*!50001 DROP VIEW IF EXISTS `ABSTRACT_TARGET_SCHEDULE_VIEW`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ABSTRACT_TARGET_SCHEDULE_VIEW` AS select (`abt`.`AT_OID` or ',' or `s`.`S_OID`) AS `thekey`,(case `abt`.`AT_OBJECT_TYPE` when 1 then 'Target' else 'Group' end) AS `at_object_type_desc`,`abt`.`AT_NAME` AS `at_name`,`abt`.`AT_STATE` AS `at_state`,`u`.`USR_USERNAME` AS `usr_username`,`a`.`AGC_NAME` AS `agc_name`,`s`.`S_OID` AS `s_oid`,`s`.`S_START` AS `s_start`,`s`.`S_END` AS `s_end`,`s`.`S_TYPE` AS `s_type`,`s`.`S_CRON` AS `s_cron` from (((`SCHEDULE` `s` left join `ABSTRACT_TARGET` `abt` on((`s`.`S_ABSTRACT_TARGET_ID` = `abt`.`AT_OID`))) join `WCTUSER` `u` on((`abt`.`AT_OWNER_ID` = `u`.`USR_OID`))) join `AGENCY` `a` on((`u`.`USR_AGC_OID` = `a`.`AGC_OID`))) order by `abt`.`AT_NAME`,`s`.`S_OID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `URL_PERMISSION_MAPPING_VIEW`
--

/*!50001 DROP VIEW IF EXISTS `URL_PERMISSION_MAPPING_VIEW`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `URL_PERMISSION_MAPPING_VIEW` AS select `upm`.`UPM_OID` AS `upm_oid`,`upm`.`UPM_DOMAIN` AS `upm_domain`,`p`.`PE_OID` AS `pe_oid`,`p`.`PE_END_DATE` AS `pe_end_date`,`p`.`PE_OWNING_AGENCY_ID` AS `pe_owning_agency_id`,`up`.`UP_PATTERN` AS `up_pattern`,`st`.`ST_ACTIVE` AS `st_active` from (((`URL_PERMISSION_MAPPING` `upm` join `PERMISSION` `p` on((`upm`.`UPM_PERMISSION_ID` = `p`.`PE_OID`))) join `URL_PATTERN` `up` on((`upm`.`UPM_URL_PATTERN_ID` = `up`.`UP_OID`))) join `SITE` `st` on((`p`.`PE_SITE_ID` = `st`.`ST_OID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-04 17:21:39

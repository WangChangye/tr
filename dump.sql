-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: 10.10.15.70    Database: 
-- ------------------------------------------------------
-- Server version	5.7.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `blueprint`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `blueprint` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `blueprint`;

--
-- Table structure for table `blueprint`
--

DROP TABLE IF EXISTS `blueprint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blueprint` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `_id` varchar(64) DEFAULT NULL COMMENT '用来测试用，如果设置了该值，将用其作为id',
  `name` varchar(256) DEFAULT NULL COMMENT '蓝图名字，不需要唯一，由用户自己管理',
  `icon` varchar(512) DEFAULT NULL COMMENT '蓝图的图标，为一个url',
  `is_model` tinyint(4) DEFAULT '0' COMMENT '表示是否作为组件，暂定1为普通组件，2为自定义的组件',
  `user` varchar(128) DEFAULT 'admin' COMMENT '用户id',
  `note` mediumtext COMMENT '测试用的备注，业务没有用到',
  `topo` mediumtext COMMENT '蓝图的topo关系，用json表示',
  `yaml` mediumtext COMMENT '蓝图的yaml',
  `custom_editor` mediumtext COMMENT 'custom编辑器的json数据，目前仅针对is_model值为2的场景',
  `biz_type` varchar(32) DEFAULT 'normal' COMMENT '给业务层的蓝图类型。composer层面通常不关心这个类型',
  `template_type` varchar(32) DEFAULT '示例模板' COMMENT '模板的类型，只有模板蓝图该字段才有意义',
  `template_order` int(11) DEFAULT '0' COMMENT '模板的排序',
  `template_tag` mediumtext COMMENT '用于模板的tag，目前多个tag以英文逗号分隔吧',
  `icon_url` varchar(512) DEFAULT NULL COMMENT '模板的需求，还需要一个url字段',
  `initial` int(11) DEFAULT '0' COMMENT '是否为初始蓝图',
  `_ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `_id_UNIQUE` (`_id`),
  KEY `template_type_idx` (`template_type`),
  CONSTRAINT `template_type` FOREIGN KEY (`template_type`) REFERENCES `template_type` (`name`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9548 DEFAULT CHARSET=utf8mb4 COMMENT='蓝图模板';
/*!40101 SET character_set_client = @saved_cs_client */;
ALTER DATABASE `blueprint` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`blueprint`@`%`*/ /*!50003 trigger default_uuid before insert on blueprint
for each row
begin
  IF new._id IS NULL THEN
    SET new._id = uuid();
  END IF;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `blueprint` CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci ;

--
-- Table structure for table `template_type`
--

DROP TABLE IF EXISTS `template_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template_type` (
  `name` varchar(64) NOT NULL DEFAULT '示例',
  `desc` mediumtext,
  `order` int(11) DEFAULT '0',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='模板分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `v_bp`
--

DROP TABLE IF EXISTS `v_bp`;
/*!50001 DROP VIEW IF EXISTS `v_bp`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_bp` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `user`,
 1 AS `icon`,
 1 AS `topo`,
 1 AS `yaml`,
 1 AS `custom_editor`,
 1 AS `is_model`,
 1 AS `note`,
 1 AS `biz_type`*/;
SET character_set_client = @saved_cs_client;

--
-- Current Database: `mysql`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mysql` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `mysql`;

--
-- Table structure for table `columns_priv`
--

DROP TABLE IF EXISTS `columns_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `columns_priv` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Table_name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Column_name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Column_priv` set('Select','Insert','Update','References') CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`Host`,`Db`,`User`,`Table_name`,`Column_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `db`
--

DROP TABLE IF EXISTS `db`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Event_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Trigger_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Host`,`Db`,`User`),
  KEY `User` (`User`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `engine_cost`
--

DROP TABLE IF EXISTS `engine_cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine_cost` (
  `engine_name` varchar(64) NOT NULL,
  `device_type` int(11) NOT NULL,
  `cost_name` varchar(64) NOT NULL,
  `cost_value` float DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comment` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`cost_name`,`engine_name`,`device_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `db` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `name` char(64) NOT NULL DEFAULT '',
  `body` longblob NOT NULL,
  `definer` char(93) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `execute_at` datetime DEFAULT NULL,
  `interval_value` int(11) DEFAULT NULL,
  `interval_field` enum('YEAR','QUARTER','MONTH','DAY','HOUR','MINUTE','WEEK','SECOND','MICROSECOND','YEAR_MONTH','DAY_HOUR','DAY_MINUTE','DAY_SECOND','HOUR_MINUTE','HOUR_SECOND','MINUTE_SECOND','DAY_MICROSECOND','HOUR_MICROSECOND','MINUTE_MICROSECOND','SECOND_MICROSECOND') DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_executed` datetime DEFAULT NULL,
  `starts` datetime DEFAULT NULL,
  `ends` datetime DEFAULT NULL,
  `status` enum('ENABLED','DISABLED','SLAVESIDE_DISABLED') NOT NULL DEFAULT 'ENABLED',
  `on_completion` enum('DROP','PRESERVE') NOT NULL DEFAULT 'DROP',
  `sql_mode` set('REAL_AS_FLOAT','PIPES_AS_CONCAT','ANSI_QUOTES','IGNORE_SPACE','NOT_USED','ONLY_FULL_GROUP_BY','NO_UNSIGNED_SUBTRACTION','NO_DIR_IN_CREATE','POSTGRESQL','ORACLE','MSSQL','DB2','MAXDB','NO_KEY_OPTIONS','NO_TABLE_OPTIONS','NO_FIELD_OPTIONS','MYSQL323','MYSQL40','ANSI','NO_AUTO_VALUE_ON_ZERO','NO_BACKSLASH_ESCAPES','STRICT_TRANS_TABLES','STRICT_ALL_TABLES','NO_ZERO_IN_DATE','NO_ZERO_DATE','INVALID_DATES','ERROR_FOR_DIVISION_BY_ZERO','TRADITIONAL','NO_AUTO_CREATE_USER','HIGH_NOT_PRECEDENCE','NO_ENGINE_SUBSTITUTION','PAD_CHAR_TO_FULL_LENGTH') NOT NULL DEFAULT '',
  `comment` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `originator` int(10) unsigned NOT NULL,
  `time_zone` char(64) CHARACTER SET latin1 NOT NULL DEFAULT 'SYSTEM',
  `character_set_client` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `collation_connection` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `db_collation` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `body_utf8` longblob,
  PRIMARY KEY (`db`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Events';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `func`
--

DROP TABLE IF EXISTS `func`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `func` (
  `name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ret` tinyint(1) NOT NULL DEFAULT '0',
  `dl` char(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `type` enum('function','aggregate') CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User defined functions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gtid_executed`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `gtid_executed` (
  `source_uuid` char(36) NOT NULL COMMENT 'uuid of the source where the transaction was originally executed.',
  `interval_start` bigint(20) NOT NULL COMMENT 'First number of interval.',
  `interval_end` bigint(20) NOT NULL COMMENT 'Last number of interval.',
  PRIMARY KEY (`source_uuid`,`interval_start`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `help_category`
--

DROP TABLE IF EXISTS `help_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `help_category` (
  `help_category_id` smallint(5) unsigned NOT NULL,
  `name` char(64) NOT NULL,
  `parent_category_id` smallint(5) unsigned DEFAULT NULL,
  `url` text NOT NULL,
  PRIMARY KEY (`help_category_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 COMMENT='help categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `help_keyword`
--

DROP TABLE IF EXISTS `help_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `help_keyword` (
  `help_keyword_id` int(10) unsigned NOT NULL,
  `name` char(64) NOT NULL,
  PRIMARY KEY (`help_keyword_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 COMMENT='help keywords';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `help_relation`
--

DROP TABLE IF EXISTS `help_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `help_relation` (
  `help_topic_id` int(10) unsigned NOT NULL,
  `help_keyword_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`help_keyword_id`,`help_topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 COMMENT='keyword-topic relation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `help_topic`
--

DROP TABLE IF EXISTS `help_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `help_topic` (
  `help_topic_id` int(10) unsigned NOT NULL,
  `name` char(64) NOT NULL,
  `help_category_id` smallint(5) unsigned NOT NULL,
  `description` text NOT NULL,
  `example` text NOT NULL,
  `url` text NOT NULL,
  PRIMARY KEY (`help_topic_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 COMMENT='help topics';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `innodb_index_stats`
--

DROP TABLE IF EXISTS `innodb_index_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `innodb_index_stats` (
  `database_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(199) COLLATE utf8_bin NOT NULL,
  `index_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `stat_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `stat_value` bigint(20) unsigned NOT NULL,
  `sample_size` bigint(20) unsigned DEFAULT NULL,
  `stat_description` varchar(1024) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`database_name`,`table_name`,`index_name`,`stat_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin STATS_PERSISTENT=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `innodb_table_stats`
--

DROP TABLE IF EXISTS `innodb_table_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `innodb_table_stats` (
  `database_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(199) COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `n_rows` bigint(20) unsigned NOT NULL,
  `clustered_index_size` bigint(20) unsigned NOT NULL,
  `sum_of_other_index_sizes` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`database_name`,`table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin STATS_PERSISTENT=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ndb_binlog_index`
--

DROP TABLE IF EXISTS `ndb_binlog_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ndb_binlog_index` (
  `Position` bigint(20) unsigned NOT NULL,
  `File` varchar(255) NOT NULL,
  `epoch` bigint(20) unsigned NOT NULL,
  `inserts` int(10) unsigned NOT NULL,
  `updates` int(10) unsigned NOT NULL,
  `deletes` int(10) unsigned NOT NULL,
  `schemaops` int(10) unsigned NOT NULL,
  `orig_server_id` int(10) unsigned NOT NULL,
  `orig_epoch` bigint(20) unsigned NOT NULL,
  `gci` int(10) unsigned NOT NULL,
  `next_position` bigint(20) unsigned NOT NULL,
  `next_file` varchar(255) NOT NULL,
  PRIMARY KEY (`epoch`,`orig_server_id`,`orig_epoch`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugin`
--

DROP TABLE IF EXISTS `plugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin` (
  `name` varchar(64) NOT NULL DEFAULT '',
  `dl` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 COMMENT='MySQL plugins';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `proc`
--

DROP TABLE IF EXISTS `proc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proc` (
  `db` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `name` char(64) NOT NULL DEFAULT '',
  `type` enum('FUNCTION','PROCEDURE') NOT NULL,
  `specific_name` char(64) NOT NULL DEFAULT '',
  `language` enum('SQL') NOT NULL DEFAULT 'SQL',
  `sql_data_access` enum('CONTAINS_SQL','NO_SQL','READS_SQL_DATA','MODIFIES_SQL_DATA') NOT NULL DEFAULT 'CONTAINS_SQL',
  `is_deterministic` enum('YES','NO') NOT NULL DEFAULT 'NO',
  `security_type` enum('INVOKER','DEFINER') NOT NULL DEFAULT 'DEFINER',
  `param_list` blob NOT NULL,
  `returns` longblob NOT NULL,
  `body` longblob NOT NULL,
  `definer` char(93) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sql_mode` set('REAL_AS_FLOAT','PIPES_AS_CONCAT','ANSI_QUOTES','IGNORE_SPACE','NOT_USED','ONLY_FULL_GROUP_BY','NO_UNSIGNED_SUBTRACTION','NO_DIR_IN_CREATE','POSTGRESQL','ORACLE','MSSQL','DB2','MAXDB','NO_KEY_OPTIONS','NO_TABLE_OPTIONS','NO_FIELD_OPTIONS','MYSQL323','MYSQL40','ANSI','NO_AUTO_VALUE_ON_ZERO','NO_BACKSLASH_ESCAPES','STRICT_TRANS_TABLES','STRICT_ALL_TABLES','NO_ZERO_IN_DATE','NO_ZERO_DATE','INVALID_DATES','ERROR_FOR_DIVISION_BY_ZERO','TRADITIONAL','NO_AUTO_CREATE_USER','HIGH_NOT_PRECEDENCE','NO_ENGINE_SUBSTITUTION','PAD_CHAR_TO_FULL_LENGTH') NOT NULL DEFAULT '',
  `comment` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `character_set_client` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `collation_connection` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `db_collation` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `body_utf8` longblob,
  PRIMARY KEY (`db`,`name`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stored Procedures';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `procs_priv`
--

DROP TABLE IF EXISTS `procs_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `procs_priv` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Routine_name` char(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Routine_type` enum('FUNCTION','PROCEDURE') COLLATE utf8_bin NOT NULL,
  `Grantor` char(93) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Proc_priv` set('Execute','Alter Routine','Grant') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Host`,`Db`,`User`,`Routine_name`,`Routine_type`),
  KEY `Grantor` (`Grantor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Procedure privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `proxies_priv`
--

DROP TABLE IF EXISTS `proxies_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxies_priv` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Proxied_host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Proxied_user` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `With_grant` tinyint(1) NOT NULL DEFAULT '0',
  `Grantor` char(93) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Host`,`User`,`Proxied_host`,`Proxied_user`),
  KEY `Grantor` (`Grantor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User proxy privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `server_cost`
--

DROP TABLE IF EXISTS `server_cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_cost` (
  `cost_name` varchar(64) NOT NULL,
  `cost_value` float DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comment` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`cost_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `servers`
--

DROP TABLE IF EXISTS `servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servers` (
  `Server_name` char(64) NOT NULL DEFAULT '',
  `Host` char(64) NOT NULL DEFAULT '',
  `Db` char(64) NOT NULL DEFAULT '',
  `Username` char(64) NOT NULL DEFAULT '',
  `Password` char(64) NOT NULL DEFAULT '',
  `Port` int(4) NOT NULL DEFAULT '0',
  `Socket` char(64) NOT NULL DEFAULT '',
  `Wrapper` char(64) NOT NULL DEFAULT '',
  `Owner` char(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`Server_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 COMMENT='MySQL Foreign Servers table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slave_master_info`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `slave_master_info` (
  `Number_of_lines` int(10) unsigned NOT NULL COMMENT 'Number of lines in the file.',
  `Master_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The name of the master binary log currently being read from the master.',
  `Master_log_pos` bigint(20) unsigned NOT NULL COMMENT 'The master log position of the last read event.',
  `Host` char(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'The host name of the master.',
  `User_name` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The user name used to connect to the master.',
  `User_password` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The password used to connect to the master.',
  `Port` int(10) unsigned NOT NULL COMMENT 'The network port used to connect to the master.',
  `Connect_retry` int(10) unsigned NOT NULL COMMENT 'The period (in seconds) that the slave will wait before trying to reconnect to the master.',
  `Enabled_ssl` tinyint(1) NOT NULL COMMENT 'Indicates whether the server supports SSL connections.',
  `Ssl_ca` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The file used for the Certificate Authority (CA) certificate.',
  `Ssl_capath` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The path to the Certificate Authority (CA) certificates.',
  `Ssl_cert` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The name of the SSL certificate file.',
  `Ssl_cipher` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The name of the cipher in use for the SSL connection.',
  `Ssl_key` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The name of the SSL key file.',
  `Ssl_verify_server_cert` tinyint(1) NOT NULL COMMENT 'Whether to verify the server certificate.',
  `Heartbeat` float NOT NULL,
  `Bind` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'Displays which interface is employed when connecting to the MySQL server',
  `Ignored_server_ids` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The number of server IDs to be ignored, followed by the actual server IDs',
  `Uuid` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The master server uuid.',
  `Retry_count` bigint(20) unsigned NOT NULL COMMENT 'Number of reconnect attempts, to the master, before giving up.',
  `Ssl_crl` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The file used for the Certificate Revocation List (CRL)',
  `Ssl_crlpath` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The path used for Certificate Revocation List (CRL) files',
  `Enabled_auto_position` tinyint(1) NOT NULL COMMENT 'Indicates whether GTIDs will be used to retrieve events from the master.',
  `Channel_name` char(64) NOT NULL COMMENT 'The channel on which the slave is connected to a source. Used in Multisource Replication',
  `Tls_version` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'Tls version',
  PRIMARY KEY (`Channel_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 COMMENT='Master Information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slave_relay_log_info`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `slave_relay_log_info` (
  `Number_of_lines` int(10) unsigned NOT NULL COMMENT 'Number of lines in the file or rows in the table. Used to version table definitions.',
  `Relay_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The name of the current relay log file.',
  `Relay_log_pos` bigint(20) unsigned NOT NULL COMMENT 'The relay log position of the last executed event.',
  `Master_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The name of the master binary log file from which the events in the relay log file were read.',
  `Master_log_pos` bigint(20) unsigned NOT NULL COMMENT 'The master log position of the last executed event.',
  `Sql_delay` int(11) NOT NULL COMMENT 'The number of seconds that the slave must lag behind the master.',
  `Number_of_workers` int(10) unsigned NOT NULL,
  `Id` int(10) unsigned NOT NULL COMMENT 'Internal Id that uniquely identifies this record.',
  `Channel_name` char(64) NOT NULL COMMENT 'The channel on which the slave is connected to a source. Used in Multisource Replication',
  PRIMARY KEY (`Channel_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 COMMENT='Relay Log Information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slave_worker_info`
--

DROP TABLE IF EXISTS `slave_worker_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slave_worker_info` (
  `Id` int(10) unsigned NOT NULL,
  `Relay_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Relay_log_pos` bigint(20) unsigned NOT NULL,
  `Master_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Master_log_pos` bigint(20) unsigned NOT NULL,
  `Checkpoint_relay_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Checkpoint_relay_log_pos` bigint(20) unsigned NOT NULL,
  `Checkpoint_master_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Checkpoint_master_log_pos` bigint(20) unsigned NOT NULL,
  `Checkpoint_seqno` int(10) unsigned NOT NULL,
  `Checkpoint_group_size` int(10) unsigned NOT NULL,
  `Checkpoint_group_bitmap` blob NOT NULL,
  `Channel_name` char(64) NOT NULL COMMENT 'The channel on which the slave is connected to a source. Used in Multisource Replication',
  PRIMARY KEY (`Channel_name`,`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 COMMENT='Worker Information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tables_priv`
--

DROP TABLE IF EXISTS `tables_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tables_priv` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Table_name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Grantor` char(93) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Table_priv` set('Select','Insert','Update','Delete','Create','Drop','Grant','References','Index','Alter','Create View','Show view','Trigger') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Column_priv` set('Select','Insert','Update','References') CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`Host`,`Db`,`User`,`Table_name`),
  KEY `Grantor` (`Grantor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `time_zone`
--

DROP TABLE IF EXISTS `time_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_zone` (
  `Time_zone_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Use_leap_seconds` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Time_zone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1824 DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 COMMENT='Time zones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `time_zone_leap_second`
--

DROP TABLE IF EXISTS `time_zone_leap_second`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_zone_leap_second` (
  `Transition_time` bigint(20) NOT NULL,
  `Correction` int(11) NOT NULL,
  PRIMARY KEY (`Transition_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 COMMENT='Leap seconds information for time zones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `time_zone_name`
--

DROP TABLE IF EXISTS `time_zone_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_zone_name` (
  `Name` char(64) NOT NULL,
  `Time_zone_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 COMMENT='Time zone names';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `time_zone_transition`
--

DROP TABLE IF EXISTS `time_zone_transition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_zone_transition` (
  `Time_zone_id` int(10) unsigned NOT NULL,
  `Transition_time` bigint(20) NOT NULL,
  `Transition_type_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Time_zone_id`,`Transition_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 COMMENT='Time zone transitions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `time_zone_transition_type`
--

DROP TABLE IF EXISTS `time_zone_transition_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_zone_transition_type` (
  `Time_zone_id` int(10) unsigned NOT NULL,
  `Transition_type_id` int(10) unsigned NOT NULL,
  `Offset` int(11) NOT NULL DEFAULT '0',
  `Is_DST` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Abbreviation` char(8) NOT NULL DEFAULT '',
  PRIMARY KEY (`Time_zone_id`,`Transition_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 COMMENT='Time zone transition types';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Reload_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Shutdown_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Process_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `File_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Show_db_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Super_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Repl_slave_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Repl_client_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_user_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Event_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Trigger_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_tablespace_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `ssl_type` enum('','ANY','X509','SPECIFIED') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `ssl_cipher` blob NOT NULL,
  `x509_issuer` blob NOT NULL,
  `x509_subject` blob NOT NULL,
  `max_questions` int(11) unsigned NOT NULL DEFAULT '0',
  `max_updates` int(11) unsigned NOT NULL DEFAULT '0',
  `max_connections` int(11) unsigned NOT NULL DEFAULT '0',
  `max_user_connections` int(11) unsigned NOT NULL DEFAULT '0',
  `plugin` char(64) COLLATE utf8_bin NOT NULL DEFAULT 'mysql_native_password',
  `authentication_string` text COLLATE utf8_bin,
  `password_expired` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `password_last_changed` timestamp NULL DEFAULT NULL,
  `password_lifetime` smallint(5) unsigned DEFAULT NULL,
  `account_locked` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Host`,`User`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and global privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `general_log`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `general_log` (
  `event_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `user_host` mediumtext NOT NULL,
  `thread_id` bigint(21) unsigned NOT NULL,
  `server_id` int(10) unsigned NOT NULL,
  `command_type` varchar(64) NOT NULL,
  `argument` mediumblob NOT NULL
) ENGINE=CSV DEFAULT CHARSET=utf8 COMMENT='General log';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slow_log`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `slow_log` (
  `start_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `user_host` mediumtext NOT NULL,
  `query_time` time(6) NOT NULL,
  `lock_time` time(6) NOT NULL,
  `rows_sent` int(11) NOT NULL,
  `rows_examined` int(11) NOT NULL,
  `db` varchar(512) NOT NULL,
  `last_insert_id` int(11) NOT NULL,
  `insert_id` int(11) NOT NULL,
  `server_id` int(10) unsigned NOT NULL,
  `sql_text` mediumblob NOT NULL,
  `thread_id` bigint(21) unsigned NOT NULL
) ENGINE=CSV DEFAULT CHARSET=utf8 COMMENT='Slow log';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `service_code`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `service_code` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `service_code`;

--
-- Table structure for table `blueprint`
--

DROP TABLE IF EXISTS `blueprint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blueprint` (
  `blueprint_id` varchar(100) NOT NULL,
  `version` varchar(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `description` longblob,
  `level` int(11) DEFAULT '0' COMMENT '层级，0-表示零级蓝图',
  `buildpack` tinyint(1) DEFAULT '0' COMMENT '包含buildpack信息标识。非零级蓝图时，true-表示部分或全部子蓝图包含buildpack，false-表示均不包含',
  `apis` tinyint(1) DEFAULT '0' COMMENT '包含api描述信息标识。非零级蓝图时，true-表示部分或全部子蓝图包含api描述，false-表示均不包含',
  `timestamp` datetime DEFAULT NULL COMMENT 'composer中的生成时间',
  `make_time` datetime DEFAULT NULL COMMENT '同步或生成时间',
  PRIMARY KEY (`blueprint_id`) USING BTREE,
  KEY `blueprint_id` (`blueprint_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='蓝图主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blueprint_auxiliary_buildpack`
--

DROP TABLE IF EXISTS `blueprint_auxiliary_buildpack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blueprint_auxiliary_buildpack` (
  `blueprint_id` varchar(100) NOT NULL,
  `leaf_blueprint_id` varchar(100) NOT NULL COMMENT '对应的零级蓝图',
  `leaf_path` varchar(255) NOT NULL COMMENT '零级蓝图所在的位置',
  `buildpack_blueprint_id` varchar(100) NOT NULL,
  `composer_build_pack_id` varchar(100) NOT NULL COMMENT '蓝图中的唯一标识，用于区分同一蓝图中有多个相同buildpack的情况，默认同input_name值',
  `input_name` varchar(255) NOT NULL,
  `stack_id` varchar(100) NOT NULL,
  `key_values` longblob COMMENT 'key/value的键值对，JSON格式',
  `git_repo` varchar(255) DEFAULT NULL COMMENT 'git仓库地址',
  `git_branch` varchar(255) DEFAULT NULL COMMENT 'git主要分支',
  PRIMARY KEY (`blueprint_id`,`leaf_blueprint_id`,`leaf_path`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='零级蓝图buildpack信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blueprint_body`
--

DROP TABLE IF EXISTS `blueprint_body`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blueprint_body` (
  `blueprint_id` varchar(100) NOT NULL,
  `os` varchar(10) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `replica_support` tinyint(1) DEFAULT NULL,
  `sessionpersist_required` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`blueprint_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='零级蓝图，非零级蓝图的body的子蓝图列表，即blueprint_sub中描述';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blueprint_body_log`
--

DROP TABLE IF EXISTS `blueprint_body_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blueprint_body_log` (
  `blueprint_id` varchar(100) NOT NULL,
  `log_type` varchar(255) NOT NULL,
  `log_value` varchar(255) DEFAULT NULL,
  KEY `blueprint_body_log_id` (`blueprint_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='零级蓝图，日志描述';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blueprint_body_ports`
--

DROP TABLE IF EXISTS `blueprint_body_ports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blueprint_body_ports` (
  `blueprint_id` varchar(100) NOT NULL,
  `port` int(255) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `protocol` varchar(20) DEFAULT NULL COMMENT 'TCP、HTTP等',
  PRIMARY KEY (`blueprint_id`,`port`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='零级蓝图，端口定义';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blueprint_body_volume`
--

DROP TABLE IF EXISTS `blueprint_body_volume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blueprint_body_volume` (
  `blueprint_id` varchar(100) NOT NULL,
  `volume` varchar(255) NOT NULL,
  PRIMARY KEY (`blueprint_id`,`volume`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='零级蓝图，数据卷';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blueprint_extend`
--

DROP TABLE IF EXISTS `blueprint_extend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blueprint_extend` (
  `blueprint_id` varchar(40) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `type1` varchar(255) DEFAULT NULL COMMENT '类型：\r\nnormal-由composer生成；\r\ntemplate - 模板；\r\nbuildpack；\r\nworksapce',
  `type2` varchar(255) DEFAULT NULL COMMENT '子分类',
  `template_convert` tinyint(1) DEFAULT '0' COMMENT '模板转换蓝图标识，true-模板需转换成新蓝图',
  `icon` varchar(255) DEFAULT NULL,
  `icon_url` varchar(255) DEFAULT NULL,
  `seq` int(11) DEFAULT NULL,
  `description` longblob,
  `yaml` longblob,
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(40) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `modify_user` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`blueprint_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='蓝图业务层扩展属性';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blueprint_extend_action`
--

DROP TABLE IF EXISTS `blueprint_extend_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blueprint_extend_action` (
  `blueprint_id` varchar(100) NOT NULL,
  `action` varchar(100) NOT NULL,
  PRIMARY KEY (`blueprint_id`,`action`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='blueprint_type_dict表中action类型定义';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blueprint_extend_tag`
--

DROP TABLE IF EXISTS `blueprint_extend_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blueprint_extend_tag` (
  `blueprint_id` varchar(100) NOT NULL,
  `tag` varchar(255) NOT NULL,
  PRIMARY KEY (`blueprint_id`,`tag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blueprint_input`
--

DROP TABLE IF EXISTS `blueprint_input`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blueprint_input` (
  `blueprint_id` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `default_value` varchar(255) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `protocol` varchar(20) DEFAULT NULL,
  `internal` tinyint(1) DEFAULT NULL COMMENT '是否内部使用',
  `port` int(10) DEFAULT NULL COMMENT '服务端口，domain类型时才有值',
  `optional` tinyint(1) NOT NULL DEFAULT '0' COMMENT '必录标识：true-非必录',
  `description` varchar(255) DEFAULT NULL,
  `meta` varchar(100) DEFAULT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0' COMMENT '在页面上是否隐藏',
  `leaf_id` varchar(100) DEFAULT NULL,
  `leaf_input_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`blueprint_id`,`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='输入参数';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blueprint_input_init`
--

DROP TABLE IF EXISTS `blueprint_input_init`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blueprint_input_init` (
  `blueprint_id` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `init_key` varchar(255) NOT NULL,
  `init_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`blueprint_id`,`name`,`init_key`) USING BTREE,
  KEY `blueprint_input_init_id` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='复杂输入参数的初始化';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blueprint_leaf`
--

DROP TABLE IF EXISTS `blueprint_leaf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blueprint_leaf` (
  `blueprint_id` varchar(100) NOT NULL,
  `leaf_id` varchar(40) NOT NULL COMMENT '叶子节点蓝图标识',
  `path` varchar(255) NOT NULL COMMENT '零级蓝图所在路径',
  `label` varchar(255) DEFAULT NULL COMMENT '显示的组件名称',
  PRIMARY KEY (`blueprint_id`,`leaf_id`,`path`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='叶子节点，即零级蓝图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blueprint_output`
--

DROP TABLE IF EXISTS `blueprint_output`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blueprint_output` (
  `blueprint_id` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `init_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`blueprint_id`,`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='输出参数';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blueprint_sub`
--

DROP TABLE IF EXISTS `blueprint_sub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blueprint_sub` (
  `blueprint_id` varchar(100) NOT NULL,
  `extern` varchar(40) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`blueprint_id`,`extern`,`name`) USING BTREE,
  KEY `blueprint_id` (`blueprint_id`,`extern`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='子蓝图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blueprint_sub_input`
--

DROP TABLE IF EXISTS `blueprint_sub_input`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blueprint_sub_input` (
  `blueprint_id` varchar(100) NOT NULL,
  `extern` varchar(40) NOT NULL,
  `input_key` varchar(255) NOT NULL,
  `name` varchar(40) NOT NULL,
  `input_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`blueprint_id`,`extern`,`input_key`,`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='子蓝图输入参数';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blueprint_sync_result`
--

DROP TABLE IF EXISTS `blueprint_sync_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blueprint_sync_result` (
  `batch_no` varchar(40) NOT NULL COMMENT '批次号',
  `refresh` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'true-清空所有数据后再同步，false-增量同步',
  `count` int(11) NOT NULL COMMENT '同步蓝图总数',
  `success` int(11) DEFAULT NULL,
  `fail` int(11) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  PRIMARY KEY (`batch_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='蓝图批量同步结果';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blueprint_sync_result_detail`
--

DROP TABLE IF EXISTS `blueprint_sync_result_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blueprint_sync_result_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `batch_no` varchar(40) NOT NULL,
  `blueprint_id` varchar(100) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `make_date` datetime NOT NULL,
  `result_state` tinyint(1) NOT NULL,
  `result_short_message` varchar(255) DEFAULT NULL,
  `result_message` longblob,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `batch_no` (`batch_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='蓝图批量同步结果明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blueprint_type_dict`
--

DROP TABLE IF EXISTS `blueprint_type_dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blueprint_type_dict` (
  `type` varchar(10) NOT NULL COMMENT 'type-蓝图一级分类\r\ntemplate-模板分类',
  `code` varchar(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longblob,
  `seq` int(11) NOT NULL,
  `create_user` varchar(40) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modify_user` varchar(40) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `icon_url` varchar(200) DEFAULT 'NULL' COMMENT 'image',
  `icon` varchar(100) DEFAULT 'NULL' COMMENT '图标icon',
  PRIMARY KEY (`type`,`code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `code_example`
--

DROP TABLE IF EXISTS `code_example`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `code_example` (
  `id` varchar(40) NOT NULL COMMENT '主键',
  `valid` tinyint(1) DEFAULT '1' COMMENT '有效标识：1-有效',
  `git_name` varchar(255) NOT NULL COMMENT 'git项目名称',
  `git_url` varchar(255) NOT NULL COMMENT 'git url地址',
  `stack_config_id` varchar(40) NOT NULL,
  `code_desc` varchar(1000) NOT NULL COMMENT '描述信息, 用于前段展示',
  `extend_json` longblob NOT NULL COMMENT '前段向导使用的json数据信息',
  `sort` int(11) NOT NULL COMMENT '排序信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `ide_type` varchar(10) DEFAULT 'ide' COMMENT '代码库类型  ide-正常, design-可视化, depend-可视化的依赖',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `composer_template`
--

DROP TABLE IF EXISTS `composer_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `composer_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `composer_id` varchar(100) NOT NULL COMMENT '模板蓝图ID',
  `git_url_key` varchar(100) NOT NULL,
  `branch_key` varchar(100) NOT NULL,
  `ssh_key` varchar(100) NOT NULL,
  `webide_key` varchar(100) DEFAULT NULL,
  `git_url_template` varchar(200) NOT NULL COMMENT '对应giturl的模板',
  `project_name` varchar(255) DEFAULT NULL,
  `git_url` varchar(500) DEFAULT NULL,
  `stack_config_id` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `git_repository`
--

DROP TABLE IF EXISTS `git_repository`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `git_repository` (
  `rep_id` varchar(40) NOT NULL,
  `user_id` varchar(40) NOT NULL COMMENT '用户ID',
  `git_url` varchar(255) NOT NULL COMMENT '代码地址',
  `git_name` varchar(255) NOT NULL COMMENT '代码项目名称',
  `git_desc` varchar(2000) NOT NULL COMMENT '代码库描述',
  `git_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '代码最后修改时间',
  `stack_config_id` varchar(40) NOT NULL COMMENT '对应ide数据库中的stack_config的主键ID',
  `org` varchar(10) NOT NULL COMMENT '来源  factory-应用工厂同步; code-CTG新建代码库',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `branch` varchar(255) NOT NULL COMMENT '分支信息',
  `ide_type` varchar(10) DEFAULT 'ide' COMMENT '代码库类型  ide-正常代码库  design-可视化前段代码库',
  PRIMARY KEY (`rep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `git_ssh_key`
--

DROP TABLE IF EXISTS `git_ssh_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `git_ssh_key` (
  `git_user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT 'gitlab域名, eg: gitlab.com',
  `private_key` varchar(4000) NOT NULL,
  `public_key` varchar(4000) NOT NULL,
  `service` varchar(255) NOT NULL,
  `user_id` varchar(40) NOT NULL COMMENT 'service_user中user表的主键',
  PRIMARY KEY (`git_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `git_user`
--

DROP TABLE IF EXISTS `git_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `git_user` (
  `git_user_id` int(11) NOT NULL COMMENT 'git的userID',
  `name` varchar(255) NOT NULL COMMENT '用户名',
  `username` varchar(255) NOT NULL COMMENT 'git账号',
  `password` varchar(255) NOT NULL COMMENT '明文密码',
  `user_id` varchar(40) NOT NULL COMMENT 'service_user中user表的主键',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`git_user_id`),
  UNIQUE KEY `unique_git_user_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitlab_project`
--

DROP TABLE IF EXISTS `gitlab_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitlab_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ssh_git_url` varchar(500) NOT NULL COMMENT 'ssh的gitUrl',
  `user_id` varchar(40) NOT NULL COMMENT '用户ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'git代码库创建时间(gitlab里面的时间)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `job_buildpack`
--

DROP TABLE IF EXISTS `job_buildpack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_buildpack` (
  `blueprint_id` varchar(40) NOT NULL COMMENT '蓝图标识',
  `cron` varchar(255) NOT NULL,
  `next_time` datetime NOT NULL COMMENT '下次执行时间',
  `limits` int(11) NOT NULL DEFAULT '0' COMMENT '执行次数限制，0表示无次数限制',
  `times` int(11) NOT NULL DEFAULT '0' COMMENT '已执行次数',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`blueprint_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `job_buildpack_trace`
--

DROP TABLE IF EXISTS `job_buildpack_trace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_buildpack_trace` (
  `id` varchar(40) NOT NULL COMMENT '唯一标识',
  `blueprint_id` varchar(40) NOT NULL COMMENT '蓝图标识',
  `cron` varchar(255) NOT NULL,
  `next_time` datetime NOT NULL COMMENT '下次执行时间',
  `limits` int(11) NOT NULL DEFAULT '0' COMMENT '执行次数限制，0表示无次数限制',
  `times` int(11) NOT NULL DEFAULT '0' COMMENT '已执行次数',
  `create_time` datetime NOT NULL,
  `type` varchar(10) NOT NULL COMMENT 'EXEC or DELETE',
  `exec_start_time` datetime NOT NULL,
  `exec_end_time` datetime NOT NULL,
  `exec_status` varchar(10) NOT NULL COMMENT '执行结果：OK, FAIL',
  `exec_desc` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sync_user_task`
--

DROP TABLE IF EXISTS `sync_user_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sync_user_task` (
  `user_id` varchar(40) NOT NULL COMMENT '用户ID',
  `user_mobile` varchar(40) NOT NULL,
  `git_user_id` int(11) DEFAULT NULL COMMENT 'gitlab用户ID',
  `status` varchar(10) NOT NULL DEFAULT 'doing' COMMENT 'done-执行结束, 但是有部分存在失败\r\nsuc-成功\r\nfail-超过重试次数后算成失败\r\ndoing-执行中\r\n',
  `che_user_status` varchar(10) NOT NULL COMMENT 'suc-成功\r\nfail-失败',
  `gitlab_user_status` varchar(10) NOT NULL COMMENT 'suc-成功\r\nfail-失败',
  `che_ssh_key_status` varchar(10) NOT NULL COMMENT 'suc-成功\r\nfail-失败',
  `gitlab_ssh_key_status` varchar(10) NOT NULL COMMENT 'suc-成功\r\nfail-失败',
  `gitlab_project_status` varchar(10) NOT NULL COMMENT 'suc-成功\r\nfail-失败',
  `che_committer_status` varchar(10) NOT NULL COMMENT 'suc-成功 fail-失败',
  `times` int(11) NOT NULL DEFAULT '0' COMMENT '执行次数',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `user_email` varchar(500) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `service_composer`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `service_composer` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `service_composer`;

--
-- Table structure for table `blueprint`
--

DROP TABLE IF EXISTS `blueprint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blueprint` (
  `blueprint_id` varchar(100) NOT NULL,
  `version` varchar(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `description` longblob,
  `level` int(11) DEFAULT '0' COMMENT '层级，0-表示零级蓝图',
  `buildpack` tinyint(1) DEFAULT '0' COMMENT '包含buildpack信息标识。非零级蓝图时，true-表示部分或全部子蓝图包含buildpack，false-表示均不包含',
  `apis` tinyint(1) DEFAULT '0' COMMENT '包含api描述信息标识。非零级蓝图时，true-表示部分或全部子蓝图包含api描述，false-表示均不包含',
  `timestamp` datetime DEFAULT NULL COMMENT 'composer中的生成时间',
  `make_time` datetime DEFAULT NULL COMMENT '同步或生成时间',
  PRIMARY KEY (`blueprint_id`) USING BTREE,
  KEY `blueprint_id` (`blueprint_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='蓝图主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blueprint_auxiliary_buildpack`
--

DROP TABLE IF EXISTS `blueprint_auxiliary_buildpack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blueprint_auxiliary_buildpack` (
  `blueprint_id` varchar(100) NOT NULL,
  `leaf_blueprint_id` varchar(100) NOT NULL COMMENT '对应的零级蓝图',
  `leaf_path` varchar(255) NOT NULL COMMENT '零级蓝图所在的位置',
  `buildpack_blueprint_id` varchar(100) NOT NULL,
  `composer_build_pack_id` varchar(100) NOT NULL COMMENT '蓝图中的唯一标识，用于区分同一蓝图中有多个相同buildpack的情况，默认同input_name值',
  `input_name` varchar(255) NOT NULL,
  `stack_id` varchar(100) NOT NULL,
  `key_values` longblob COMMENT 'key/value的键值对，JSON格式',
  `git_repo` varchar(255) DEFAULT NULL COMMENT 'git仓库地址',
  `git_branch` varchar(255) DEFAULT NULL COMMENT 'git主要分支',
  PRIMARY KEY (`blueprint_id`,`leaf_blueprint_id`,`leaf_path`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='零级蓝图buildpack信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blueprint_body`
--

DROP TABLE IF EXISTS `blueprint_body`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blueprint_body` (
  `blueprint_id` varchar(100) NOT NULL,
  `os` varchar(10) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `replica_support` tinyint(1) DEFAULT NULL,
  `sessionpersist_required` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`blueprint_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='零级蓝图，非零级蓝图的body的子蓝图列表，即blueprint_sub中描述';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blueprint_body_log`
--

DROP TABLE IF EXISTS `blueprint_body_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blueprint_body_log` (
  `blueprint_id` varchar(100) NOT NULL,
  `log_type` varchar(255) NOT NULL,
  `log_value` varchar(255) DEFAULT NULL,
  KEY `blueprint_body_log_id` (`blueprint_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='零级蓝图，日志描述';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blueprint_body_ports`
--

DROP TABLE IF EXISTS `blueprint_body_ports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blueprint_body_ports` (
  `blueprint_id` varchar(100) NOT NULL,
  `port` int(255) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `protocol` varchar(20) DEFAULT NULL COMMENT 'TCP、HTTP等',
  PRIMARY KEY (`blueprint_id`,`port`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='零级蓝图，端口定义';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blueprint_body_volume`
--

DROP TABLE IF EXISTS `blueprint_body_volume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blueprint_body_volume` (
  `blueprint_id` varchar(100) NOT NULL,
  `volume` varchar(255) NOT NULL,
  PRIMARY KEY (`blueprint_id`,`volume`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='零级蓝图，数据卷';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blueprint_extend`
--

DROP TABLE IF EXISTS `blueprint_extend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blueprint_extend` (
  `blueprint_id` varchar(40) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `type1` varchar(255) DEFAULT NULL COMMENT '类型：\r\nnormal-由composer生成；\r\ntemplate - 模板；\r\nbuildpack；\r\nworksapce',
  `type2` varchar(255) DEFAULT NULL COMMENT '子分类',
  `template_convert` tinyint(1) DEFAULT '0' COMMENT '模板转换蓝图标识，true-模板需转换成新蓝图',
  `icon` varchar(255) DEFAULT NULL,
  `icon_url` varchar(255) DEFAULT NULL,
  `seq` int(11) DEFAULT NULL,
  `description` longblob,
  `yaml` longblob,
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(40) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `modify_user` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`blueprint_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='蓝图业务层扩展属性';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blueprint_extend_action`
--

DROP TABLE IF EXISTS `blueprint_extend_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blueprint_extend_action` (
  `blueprint_id` varchar(100) NOT NULL,
  `action` varchar(100) NOT NULL,
  PRIMARY KEY (`blueprint_id`,`action`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='blueprint_type_dict表中action类型定义';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blueprint_extend_tag`
--

DROP TABLE IF EXISTS `blueprint_extend_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blueprint_extend_tag` (
  `blueprint_id` varchar(100) NOT NULL,
  `tag` varchar(255) NOT NULL,
  PRIMARY KEY (`blueprint_id`,`tag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blueprint_input`
--

DROP TABLE IF EXISTS `blueprint_input`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blueprint_input` (
  `blueprint_id` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `default_value` varchar(255) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `protocol` varchar(20) DEFAULT NULL,
  `internal` tinyint(1) DEFAULT NULL COMMENT '是否内部使用',
  `port` int(10) DEFAULT NULL COMMENT '服务端口，domain类型时才有值',
  `optional` tinyint(1) NOT NULL DEFAULT '0' COMMENT '必录标识：true-非必录',
  `description` varchar(255) DEFAULT NULL,
  `meta` varchar(100) DEFAULT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0' COMMENT '在页面上是否隐藏',
  `leaf_id` varchar(100) DEFAULT NULL,
  `leaf_input_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`blueprint_id`,`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='输入参数';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blueprint_input_init`
--

DROP TABLE IF EXISTS `blueprint_input_init`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blueprint_input_init` (
  `blueprint_id` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `init_key` varchar(255) NOT NULL,
  `init_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`blueprint_id`,`name`,`init_key`) USING BTREE,
  KEY `blueprint_input_init_id` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='复杂输入参数的初始化';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blueprint_leaf`
--

DROP TABLE IF EXISTS `blueprint_leaf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blueprint_leaf` (
  `blueprint_id` varchar(100) NOT NULL,
  `leaf_id` varchar(40) NOT NULL COMMENT '叶子节点蓝图标识',
  `path` varchar(255) NOT NULL COMMENT '零级蓝图所在路径',
  `label` varchar(255) DEFAULT NULL COMMENT '显示的组件名称',
  PRIMARY KEY (`blueprint_id`,`leaf_id`,`path`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='叶子节点，即零级蓝图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blueprint_output`
--

DROP TABLE IF EXISTS `blueprint_output`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blueprint_output` (
  `blueprint_id` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `init_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`blueprint_id`,`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='输出参数';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blueprint_sub`
--

DROP TABLE IF EXISTS `blueprint_sub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blueprint_sub` (
  `blueprint_id` varchar(100) NOT NULL,
  `extern` varchar(40) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`blueprint_id`,`extern`,`name`) USING BTREE,
  KEY `blueprint_id` (`blueprint_id`,`extern`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='子蓝图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blueprint_sub_input`
--

DROP TABLE IF EXISTS `blueprint_sub_input`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blueprint_sub_input` (
  `blueprint_id` varchar(100) NOT NULL,
  `extern` varchar(40) NOT NULL,
  `input_key` varchar(255) NOT NULL,
  `name` varchar(40) NOT NULL,
  `input_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`blueprint_id`,`extern`,`input_key`,`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='子蓝图输入参数';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blueprint_sync_result`
--

DROP TABLE IF EXISTS `blueprint_sync_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blueprint_sync_result` (
  `batch_no` varchar(40) NOT NULL COMMENT '批次号',
  `refresh` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'true-清空所有数据后再同步，false-增量同步',
  `count` int(11) NOT NULL COMMENT '同步蓝图总数',
  `success` int(11) DEFAULT NULL,
  `fail` int(11) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  PRIMARY KEY (`batch_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='蓝图批量同步结果';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blueprint_sync_result_detail`
--

DROP TABLE IF EXISTS `blueprint_sync_result_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blueprint_sync_result_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `batch_no` varchar(40) NOT NULL,
  `blueprint_id` varchar(100) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `make_date` datetime NOT NULL,
  `result_state` tinyint(1) NOT NULL,
  `result_short_message` varchar(255) DEFAULT NULL,
  `result_message` longblob,
  PRIMARY KEY (`id`),
  KEY `batch_no` (`batch_no`),
  CONSTRAINT `batch_no` FOREIGN KEY (`batch_no`) REFERENCES `blueprint_sync_result` (`batch_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='蓝图批量同步结果明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blueprint_type_dict`
--

DROP TABLE IF EXISTS `blueprint_type_dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blueprint_type_dict` (
  `type` varchar(10) NOT NULL COMMENT 'type-蓝图一级分类\r\ntemplate-模板分类',
  `code` varchar(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longblob,
  `seq` int(11) NOT NULL,
  `create_user` varchar(40) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modify_user` varchar(40) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `icon_url` varchar(200) DEFAULT 'NULL' COMMENT 'image',
  `icon` varchar(100) DEFAULT 'NULL' COMMENT '图标icon',
  PRIMARY KEY (`type`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `service_cron`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `service_cron` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `service_cron`;

--
-- Table structure for table `domain`
--

DROP TABLE IF EXISTS `domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain_prefix` varchar(50) NOT NULL,
  `domain_suffix` varchar(255) NOT NULL,
  `full_domain` varchar(500) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `full_domain_index` (`full_domain`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='正在使用的域名信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `domain_track`
--

DROP TABLE IF EXISTS `domain_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domain_track` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain_prefix` varchar(50) NOT NULL,
  `domain_suffix` varchar(255) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `full_domain` varchar(500) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='域名信息备份表, 记录被删除的域名信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `job_buildpack`
--

DROP TABLE IF EXISTS `job_buildpack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_buildpack` (
  `blueprint_id` varchar(40) NOT NULL COMMENT '蓝图标识',
  `cron` varchar(255) NOT NULL,
  `next_time` datetime NOT NULL COMMENT '下次执行时间',
  `limits` int(11) NOT NULL DEFAULT '0' COMMENT '执行次数限制，0表示无次数限制',
  `times` int(11) NOT NULL DEFAULT '0' COMMENT '已执行次数',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`blueprint_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `job_buildpack_trace`
--

DROP TABLE IF EXISTS `job_buildpack_trace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_buildpack_trace` (
  `id` varchar(40) NOT NULL COMMENT '唯一标识',
  `blueprint_id` varchar(40) NOT NULL COMMENT '蓝图标识',
  `cron` varchar(255) NOT NULL,
  `next_time` datetime NOT NULL COMMENT '下次执行时间',
  `limits` int(11) NOT NULL DEFAULT '0' COMMENT '执行次数限制，0表示无次数限制',
  `times` int(11) NOT NULL DEFAULT '0' COMMENT '已执行次数',
  `create_time` datetime NOT NULL,
  `type` varchar(10) NOT NULL COMMENT 'EXEC or DELETE',
  `exec_start_time` datetime NOT NULL,
  `exec_end_time` datetime NOT NULL,
  `exec_status` varchar(10) NOT NULL COMMENT '执行结果：OK, FAIL',
  `exec_desc` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `service_domain`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `service_domain` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `service_domain`;

--
-- Table structure for table `auto_deploy_config`
--

DROP TABLE IF EXISTS `auto_deploy_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auto_deploy_config` (
  `composer_id` varchar(100) NOT NULL COMMENT '蓝图ID',
  `project_id` varchar(40) NOT NULL COMMENT '项目ID',
  `cron_policy` varchar(400) NOT NULL COMMENT 'crontab 表达式',
  `cron_times` int(11) NOT NULL DEFAULT '1' COMMENT '次数',
  `deploy_type` varchar(10) NOT NULL COMMENT 'deploy-发布新实例, upgrade-更新实例',
  `upgrade_flow_id` int(11) DEFAULT NULL COMMENT '需要更新的流程ID',
  `upgrade_orca_deploy_id` varchar(36) DEFAULT NULL COMMENT '需要更新的实例的orca_deploy_id',
  `user_id` varchar(40) NOT NULL COMMENT '操作用户ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`composer_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auto_deploy_hook_config`
--

DROP TABLE IF EXISTS `auto_deploy_hook_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auto_deploy_hook_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `project_id` varchar(40) NOT NULL COMMENT '项目ID',
  `composer_id` varchar(100) NOT NULL COMMENT '蓝图ID',
  `git_url` varchar(2000) NOT NULL COMMENT '代码地址',
  `branch` varchar(100) NOT NULL COMMENT '代码分支',
  `user_id` varchar(40) NOT NULL COMMENT '用户ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `domain`
--

DROP TABLE IF EXISTS `domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain_prefix` varchar(50) NOT NULL,
  `domain_suffix` varchar(255) NOT NULL,
  `full_domain` varchar(500) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='正在使用的域名信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `domain_track`
--

DROP TABLE IF EXISTS `domain_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domain_track` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain_prefix` varchar(50) NOT NULL,
  `domain_suffix` varchar(255) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `full_domain` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='域名信息备份表, 记录被删除的域名信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `email_template`
--

DROP TABLE IF EXISTS `email_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_template` (
  `code` varchar(30) NOT NULL COMMENT '模板编号',
  `service_id` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL COMMENT '模板名称',
  `mail_to` varchar(2000) DEFAULT NULL COMMENT '收件人，可设置默认收件人，如监控邮件等。',
  `mail_cc` varchar(2000) DEFAULT NULL COMMENT '邮件抄送人，多个时用英文分号“;”分隔',
  `mail_bcc` varchar(2000) DEFAULT NULL COMMENT '邮件暗送人，多个时用英文分号“;”分隔',
  `subject` varchar(1000) DEFAULT NULL COMMENT '邮件标题，为空时取name字段',
  `content` blob NOT NULL COMMENT '模板内容',
  `operator_id` varchar(40) NOT NULL COMMENT '操作用户',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `modify_date` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_activity_log`
--

DROP TABLE IF EXISTS `factory_activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_activity_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_type` varchar(10) DEFAULT NULL COMMENT '日志类型，如：project-项目类日志',
  `biz_no` varchar(100) DEFAULT NULL COMMENT '业务号，如：项目类日志的projectId',
  `url` varchar(100) DEFAULT NULL COMMENT '实际访问地址',
  `request_method` varchar(20) DEFAULT NULL COMMENT '请求类型，如：GET、POST、PUT等',
  `pkg` varchar(100) DEFAULT NULL COMMENT '包名',
  `clazz` varchar(200) DEFAULT NULL COMMENT '访问类名',
  `method` varchar(100) DEFAULT NULL COMMENT '类方法名',
  `description` varchar(4000) DEFAULT NULL COMMENT '自定义描述',
  `client_ip` varchar(100) DEFAULT NULL COMMENT '客户端ip',
  `consume_time` int(11) DEFAULT NULL COMMENT '请求处理耗时 （毫秒）',
  `user_id` varchar(40) DEFAULT NULL COMMENT '操作用户',
  `create_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_auto_test_report`
--

DROP TABLE IF EXISTS `factory_auto_test_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_auto_test_report` (
  `flow_id` int(10) unsigned NOT NULL COMMENT '应用flowId',
  `test_namespace` varchar(200) NOT NULL COMMENT '自动化测试工具实例namespace',
  `download_url` varchar(2000) DEFAULT NULL COMMENT '下载地址',
  `preview_url` varchar(2000) DEFAULT NULL COMMENT '预览地址',
  PRIMARY KEY (`test_namespace`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='自动化测试工具报告记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_build_pack_compile`
--

DROP TABLE IF EXISTS `factory_build_pack_compile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_build_pack_compile` (
  `bp_compile_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'buildpack 编译的ID',
  `project_id` varchar(40) NOT NULL COMMENT '项目ID',
  `composer_id` varchar(100) NOT NULL,
  `build_pack_id` varchar(100) NOT NULL COMMENT '对应的buildPack(对于composer来说就是composerID)',
  `composer_build_pack_id` varchar(100) DEFAULT NULL COMMENT 'buildpack在蓝图中的唯一标识',
  `deploy_id` varchar(36) NOT NULL COMMENT 'buildpack的发布ID',
  `consume_deploy_id` varchar(36) DEFAULT NULL COMMENT '消费此imageurl的发布信息的deploy_id',
  `flow_id` int(11) DEFAULT NULL COMMENT '操作标识，关联表factory_project_deploy_flow',
  `is_compile` varchar(5) NOT NULL COMMENT '是否在编译  0-开始编译  1- 结束编译 ',
  `start_compile_date` datetime NOT NULL COMMENT '开始编译时间',
  `end_compile_date` datetime NOT NULL COMMENT '结束编译时间',
  `start_compile_status` varchar(5) NOT NULL COMMENT '开始编译状态  0- 成功  1-失败',
  `end_compile_status` varchar(5) NOT NULL COMMENT '结束编译状态  0- 成功  1-失败',
  `image_key` varchar(200) DEFAULT NULL COMMENT 'image参数的key值',
  `image_url` varchar(200) DEFAULT NULL COMMENT '编译产出的images的url',
  `compile_type` varchar(1) DEFAULT NULL COMMENT '编译类型：h-手动触发，a-自动（monitor）触发',
  `user_id` varchar(40) DEFAULT NULL COMMENT '手动触发时的用户id',
  `compile_detail` varchar(2000) DEFAULT NULL COMMENT '编译结果信息',
  `git_commit_id` varchar(40) DEFAULT NULL COMMENT '编译代码所基于的commit_id',
  PRIMARY KEY (`bp_compile_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_build_pack_deploy`
--

DROP TABLE IF EXISTS `factory_build_pack_deploy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_build_pack_deploy` (
  `project_id` varchar(40) NOT NULL,
  `composer_id` varchar(100) NOT NULL,
  `build_pack_id` varchar(100) NOT NULL,
  `composer_build_pack_id` varchar(100) DEFAULT NULL COMMENT 'buildpack在蓝图中的唯一标识',
  `deploy_id` varchar(36) NOT NULL,
  `domain` varchar(400) DEFAULT NULL,
  `full_domain` varchar(400) DEFAULT NULL COMMENT '完整域名',
  `hook` varchar(100) DEFAULT NULL,
  `user_id` varchar(40) NOT NULL,
  PRIMARY KEY (`deploy_id`) USING BTREE,
  UNIQUE KEY `deploy_id_UNIQUE` (`deploy_id`) USING BTREE,
  KEY `idx_project_id_and_composer_id` (`project_id`,`composer_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='buildpack蓝图发布信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_composer_component`
--

DROP TABLE IF EXISTS `factory_composer_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_composer_component` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `project_id` varchar(40) DEFAULT NULL COMMENT '项目ID',
  `app_id` varchar(40) DEFAULT NULL COMMENT '应用ID',
  `app_version` varchar(100) DEFAULT NULL COMMENT '应用版本',
  `composer_id` varchar(100) DEFAULT NULL COMMENT '组件所属蓝图的ID',
  `inside_unique_id` varchar(100) DEFAULT NULL COMMENT '组件在蓝图中的唯一标识',
  `component_name` varchar(200) DEFAULT NULL COMMENT '组件的原始名称（蓝图原型的名称）',
  `price` decimal(16,2) DEFAULT NULL COMMENT '组件单价',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `component_source_id` varchar(100) DEFAULT NULL COMMENT '组件的原型蓝图ID（组件实际为原型蓝图的一个副本）',
  `component_new_id` varchar(100) DEFAULT NULL COMMENT '组件作为原始蓝图副本产生的新ID',
  `component_new_name` varchar(200) DEFAULT NULL COMMENT '用户自定义的组件名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='composer下包含的组件信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_composer_component_config_template`
--

DROP TABLE IF EXISTS `factory_composer_component_config_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_composer_component_config_template` (
  `id` varchar(36) NOT NULL,
  `project_id` varchar(40) DEFAULT NULL COMMENT '创建配置模板所在的项目',
  `path` varchar(200) NOT NULL,
  `content` longblob NOT NULL,
  `remark` varchar(200) DEFAULT NULL COMMENT '模板说明',
  `image` varchar(200) DEFAULT NULL COMMENT '所使用镜像',
  `protocol` varchar(10) DEFAULT NULL COMMENT '服务协议：http or tcp',
  `os` varchar(20) DEFAULT NULL COMMENT '操作系统：Linux or Windows',
  `valid` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0-无效，1-有效',
  `create_user` varchar(40) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL,
  `modify_user` varchar(40) NOT NULL,
  `modify_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='蓝图组件映射配置文件模板';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_deploy_params`
--

DROP TABLE IF EXISTS `factory_deploy_params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_deploy_params` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` varchar(40) DEFAULT NULL COMMENT '项目ID',
  `composer_id` varchar(100) DEFAULT NULL COMMENT '发布ID',
  `key_data` varchar(400) DEFAULT NULL COMMENT '参数key值',
  `value_data` varchar(2000) DEFAULT NULL COMMENT '参数value值(对应用户填/选的值)',
  `custom_domain` varchar(400) DEFAULT NULL COMMENT '自定义域名',
  `label_data` varchar(400) DEFAULT NULL COMMENT 'label 信息',
  `required` tinyint(1) DEFAULT NULL COMMENT '0-false 非必填;  1-true 必填',
  `hidden` tinyint(1) DEFAULT NULL COMMENT '是否隐藏     0-false     1-true',
  `description` varchar(2000) DEFAULT NULL COMMENT '描述',
  `type` varchar(20) DEFAULT NULL COMMENT '输入框类型',
  `param_type` varchar(10) DEFAULT NULL COMMENT '参数类型：\r\nu-应用配置；\r\nbp-buildpack输出；\r\napi-API网关；\r\nregion-可访问区域；\r\nenv-发布环境；\r\ntest-自动化测试；\r\ns-调度策略；\r\ncopy-副本数；\r\nimage-镜像；',
  `tpl_code` varchar(40) DEFAULT '0' COMMENT '常用配置模板ID，0-为正常发布使用的参数',
  `port` int(11) DEFAULT NULL COMMENT '使用端口',
  `internal` tinyint(1) DEFAULT NULL COMMENT '内部使用',
  `protocol` varchar(40) DEFAULT NULL COMMENT '协议',
  `replicas` int(11) DEFAULT NULL COMMENT '副本数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='最新参数数据表\r\n(参数输入的历史记录件track表)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_deploy_params_auto_test`
--

DROP TABLE IF EXISTS `factory_deploy_params_auto_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_deploy_params_auto_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` varchar(40) DEFAULT NULL COMMENT '项目ID',
  `composer_id` varchar(100) DEFAULT NULL COMMENT '应用蓝图标识',
  `tool_project_id` varchar(40) DEFAULT NULL,
  `tool_composer_id` varchar(100) DEFAULT NULL COMMENT '测试工具蓝图',
  `key_data` varchar(400) DEFAULT NULL COMMENT '参数key值',
  `value_data` varchar(400) DEFAULT NULL COMMENT '参数value值(对应用户填/选的值)',
  `label_data` varchar(400) DEFAULT NULL COMMENT 'label 信息',
  `required` tinyint(1) DEFAULT NULL COMMENT '0-false 非必填;  1-true 必填',
  `hidden` tinyint(1) DEFAULT NULL COMMENT '0-false 不隐藏;  1-true 隐藏录入',
  `description` varchar(2000) DEFAULT NULL COMMENT '描述',
  `type` varchar(20) DEFAULT NULL COMMENT '输入框类型',
  `param_type` varchar(5) DEFAULT NULL COMMENT '参数类型  u-用户录入  f-factory产出参数  bp-buildpack参数',
  `user_id` varchar(40) DEFAULT NULL,
  `make_time` datetime DEFAULT NULL,
  `port` int(11) DEFAULT NULL COMMENT '使用端口',
  `internal` tinyint(1) DEFAULT NULL COMMENT '内部使用',
  `protocol` varchar(40) DEFAULT NULL COMMENT '协议',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='自动化测试工具录入参数';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_deploy_params_auto_test_track`
--

DROP TABLE IF EXISTS `factory_deploy_params_auto_test_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_deploy_params_auto_test_track` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` varchar(40) DEFAULT NULL COMMENT '项目ID',
  `composer_id` varchar(100) DEFAULT NULL COMMENT '应用蓝图标识',
  `tool_project_id` varchar(40) DEFAULT NULL,
  `tool_composer_id` varchar(100) DEFAULT NULL COMMENT '测试工具蓝图',
  `flow_id` int(11) NOT NULL,
  `key_data` varchar(400) DEFAULT NULL COMMENT '参数key值',
  `value_data` varchar(400) DEFAULT NULL COMMENT '参数value值(对应用户填/选的值)',
  `label_data` varchar(400) DEFAULT NULL COMMENT 'label 信息',
  `required` tinyint(1) DEFAULT NULL COMMENT '0-false 非必填;  1-true 必填',
  `hidden` tinyint(1) DEFAULT NULL COMMENT '0-false 不隐藏;  1-true 隐藏录入',
  `description` varchar(2000) DEFAULT NULL COMMENT '描述',
  `type` varchar(20) DEFAULT NULL COMMENT '输入框类型',
  `param_type` varchar(10) DEFAULT NULL COMMENT '参数类型  u-用户录入  f-factory产出参数  bp-buildpack参数',
  `user_id` varchar(40) DEFAULT NULL,
  `make_time` datetime DEFAULT NULL,
  `port` int(11) DEFAULT NULL COMMENT '使用端口',
  `internal` tinyint(1) DEFAULT NULL COMMENT '内部使用',
  `protocol` varchar(40) DEFAULT NULL COMMENT '协议',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='自动化测试工具录入参数';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_deploy_params_track`
--

DROP TABLE IF EXISTS `factory_deploy_params_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_deploy_params_track` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` varchar(40) DEFAULT NULL COMMENT '项目ID',
  `composer_id` varchar(100) DEFAULT NULL COMMENT '发布ID',
  `flow_id` int(11) NOT NULL,
  `key_data` varchar(400) DEFAULT NULL COMMENT '参数key值',
  `value_data` varchar(2000) DEFAULT NULL COMMENT '参数value值(对应用户填/选的值)',
  `custom_domain` varchar(400) DEFAULT NULL,
  `label_data` varchar(400) DEFAULT NULL COMMENT 'label 信息',
  `required` tinyint(1) DEFAULT NULL COMMENT '0-false 非必填;  1-true 必填',
  `hidden` tinyint(1) DEFAULT NULL COMMENT '是否隐藏     0-false     1-true',
  `description` varchar(2000) DEFAULT NULL COMMENT '描述',
  `type` varchar(20) DEFAULT NULL COMMENT '类型',
  `param_type` varchar(10) DEFAULT NULL COMMENT '参数类型(u：用户录入，f：factory产出参数，bp：buildpack参数，image：镜像）',
  `port` int(11) DEFAULT NULL COMMENT '使用端口',
  `internal` tinyint(1) DEFAULT NULL COMMENT '内部使用',
  `protocol` varchar(40) DEFAULT NULL COMMENT '协议',
  `replicas` int(11) DEFAULT NULL COMMENT '副本数量',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `flow_id_index` (`flow_id`) USING BTREE,
  KEY `idx_type` (`type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_deploy_scale`
--

DROP TABLE IF EXISTS `factory_deploy_scale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_deploy_scale` (
  `flow_id` int(11) NOT NULL COMMENT 'flowId',
  `project_id` varchar(255) DEFAULT NULL COMMENT '项目ID',
  `composer_id` varchar(100) DEFAULT NULL COMMENT '蓝图ID',
  `path` varchar(200) NOT NULL COMMENT '0级蓝图的path',
  `scale_type` varchar(10) DEFAULT NULL COMMENT '伸缩策略：handle-手动；auto-自动；',
  `replica` int(11) DEFAULT NULL COMMENT '副本数',
  `auto_min` int(11) DEFAULT NULL COMMENT '自动伸缩  最小值',
  `auto_max` int(11) DEFAULT NULL COMMENT '自动伸缩  最大值',
  `cpu_limit` int(11) DEFAULT NULL COMMENT 'cpu阀值',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间',
  `user_id` varchar(40) DEFAULT NULL COMMENT '操作用户',
  PRIMARY KEY (`flow_id`,`path`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_deploy_scale_track`
--

DROP TABLE IF EXISTS `factory_deploy_scale_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_deploy_scale_track` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flow_id` int(11) NOT NULL COMMENT 'flowId',
  `project_id` varchar(255) DEFAULT NULL COMMENT '项目ID',
  `composer_id` varchar(100) DEFAULT NULL COMMENT '蓝图ID',
  `path` varchar(200) NOT NULL COMMENT '0级蓝图的path',
  `scale_type` varchar(10) DEFAULT NULL COMMENT '伸缩策略：handle-手动；auto-自动；',
  `replica` int(11) DEFAULT NULL COMMENT '副本数',
  `auto_min` int(11) DEFAULT NULL COMMENT '自动伸缩  最小值',
  `auto_max` int(11) DEFAULT NULL COMMENT '自动伸缩  最大值',
  `cpu_limit` int(11) DEFAULT NULL COMMENT 'cpu阀值',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间',
  `user_id` varchar(40) DEFAULT NULL COMMENT '操作用户',
  `scale_result` varchar(10) DEFAULT NULL COMMENT '0-成功，其他-失败',
  `scale_orca_msg` varchar(100) DEFAULT NULL COMMENT 'orca返回的异常状态描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_deploy_upgrade_track`
--

DROP TABLE IF EXISTS `factory_deploy_upgrade_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_deploy_upgrade_track` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` varchar(40) NOT NULL COMMENT '项目ID',
  `namespace` varchar(40) NOT NULL COMMENT 'orca发布ID',
  `old_flow_id` int(11) DEFAULT NULL COMMENT '老版本的 flow_id',
  `new_flow_id` int(11) NOT NULL COMMENT '新版本的 flow_id',
  `type` varchar(10) NOT NULL COMMENT '分流类型  all-全部覆盖   flow-流量   ip-ip段   city-区域',
  `old_value` blob COMMENT '老版本的 分流策略的值',
  `new_value` blob COMMENT '新版本的 分流策略的值',
  `orca_deploy_status` varchar(5) DEFAULT NULL COMMENT '调用orca发布的返回状态  1-成功  2-失败   同deploy_status字段',
  `orca_deploy_description` varchar(4000) DEFAULT NULL COMMENT '发布描述--   失败原因',
  `user_id` varchar(40) DEFAULT NULL COMMENT '操作用户',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_env`
--

DROP TABLE IF EXISTS `factory_env`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_env` (
  `env_id` varchar(33) NOT NULL,
  `env_name` varchar(40) NOT NULL COMMENT '环境名称',
  `env_desc` varchar(4000) DEFAULT NULL COMMENT '环境描述',
  `env_schedule_sql` varchar(500) DEFAULT NULL COMMENT '环境高度策略脚本',
  `env_schedule_desc` varchar(4000) DEFAULT NULL COMMENT '描述',
  `env_type` varchar(10) NOT NULL COMMENT '三个层级：\r\nbase-系统初始化环境配置，所有团队、所有项目可直接使用，但不能修改；\r\nteam-团队层级，团队下所有项目均可直接使用，修改时会影响团队下所有项目；\r\nproject-项目层级，只在本项目下使用，修改时只影响本项目；',
  `team_id` varchar(40) DEFAULT NULL COMMENT '归属团队',
  `project_id` varchar(40) DEFAULT NULL COMMENT '归属项目',
  `status` varchar(10) NOT NULL COMMENT 'valid-有效；\r\ndel-已删除；',
  `operator` varchar(40) DEFAULT NULL COMMENT '操作用户',
  `create_time` datetime NOT NULL,
  `modify_time` datetime NOT NULL,
  PRIMARY KEY (`env_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='环境基础配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_gray_romote`
--

DROP TABLE IF EXISTS `factory_gray_romote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_gray_romote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` varchar(40) NOT NULL COMMENT '项目标识',
  `gray_deploy_id` varchar(36) NOT NULL COMMENT '提升到全局的发布id',
  `global_deploy_id` varchar(36) NOT NULL COMMENT '已发布至全局的发布id',
  `inner_domain` varchar(100) DEFAULT NULL COMMENT '内部定义域名，eg：*.c.cloudtogo.cn',
  `reply_status` int(11) DEFAULT NULL COMMENT '提升至全局的操作结果',
  `reply_status_name` varchar(30) DEFAULT NULL,
  `reply_description` varchar(4000) DEFAULT NULL,
  `user_id` varchar(40) NOT NULL COMMENT '操作用户',
  `make_time` datetime NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='提升至全局操作轨迹';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_order`
--

DROP TABLE IF EXISTS `factory_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_order` (
  `order_no` varchar(40) NOT NULL COMMENT '订单号',
  `pay_order_no` varchar(50) DEFAULT NULL,
  `project_id` varchar(40) DEFAULT NULL COMMENT '项目ID',
  `composer_id` varchar(100) DEFAULT NULL COMMENT 'composerID',
  `order_status` varchar(1) DEFAULT NULL COMMENT '订单状态\n0-有效\n1-失效，即删除的订单',
  `pay_status` varchar(1) DEFAULT NULL COMMENT '支付状态  0-待支付   1-支付中  2-支付成功  3-支付失败',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `launch_pay_date` datetime DEFAULT NULL COMMENT '发起支付时间',
  `pay_date` datetime DEFAULT NULL COMMENT '支付时间',
  `purchase_user_id` varchar(40) DEFAULT NULL COMMENT '购买用户',
  `amount` decimal(16,2) DEFAULT NULL COMMENT '总价',
  PRIMARY KEY (`order_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_order_detail`
--

DROP TABLE IF EXISTS `factory_order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(40) NOT NULL COMMENT '订单号',
  `project_id` varchar(40) DEFAULT NULL COMMENT '项目ID',
  `composer_id` varchar(100) DEFAULT NULL COMMENT 'composerID',
  `component_id` varchar(100) DEFAULT NULL COMMENT '组件ID',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `purchase_price` decimal(16,2) DEFAULT NULL COMMENT '购买单价',
  `original_price` decimal(16,2) DEFAULT NULL COMMENT '原价',
  `actual_price` decimal(16,2) DEFAULT NULL COMMENT '实际销售价格',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_params_config`
--

DROP TABLE IF EXISTS `factory_params_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_params_config` (
  `tpl_code` varchar(40) NOT NULL COMMENT 'uuid，常用配置模板id',
  `flow_id` int(11) DEFAULT NULL,
  `project_id` varchar(40) NOT NULL,
  `composer_id` varchar(100) DEFAULT NULL,
  `config_desc` varchar(2000) NOT NULL COMMENT '备注',
  `env_id` varchar(33) NOT NULL COMMENT '环境ID',
  `schedule_desc` blob COMMENT '调用策略描述信息',
  `user_id` varchar(40) NOT NULL DEFAULT '',
  `create_time` datetime NOT NULL,
  `modify_user_id` varchar(40) NOT NULL COMMENT '修改用户',
  `modify_time` datetime NOT NULL,
  `type` varchar(10) DEFAULT 'common' COMMENT 'auto-自动发布配置信息, common-常用参数配置信息',
  `deploy_mode` varchar(10) DEFAULT 'strict' COMMENT 'strict-严格模式; effort-尽力模式',
  PRIMARY KEY (`tpl_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='参数管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_params_config_detail`
--

DROP TABLE IF EXISTS `factory_params_config_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_params_config_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` varchar(40) DEFAULT NULL COMMENT '项目ID',
  `composer_id` varchar(100) DEFAULT NULL COMMENT '发布ID',
  `tpl_code` varchar(40) NOT NULL,
  `key_data` varchar(400) DEFAULT NULL COMMENT '参数key值',
  `value_data` varchar(2000) DEFAULT NULL COMMENT '参数value值(对应用户填/选的值)',
  `custom_domain` varchar(400) DEFAULT NULL,
  `label_data` varchar(400) DEFAULT NULL COMMENT 'label 信息',
  `required` tinyint(1) DEFAULT NULL COMMENT '0-false 非必填;  1-true 必填',
  `hidden` tinyint(1) DEFAULT NULL COMMENT '是否隐藏     0-false     1-true',
  `description` varchar(2000) DEFAULT NULL COMMENT '描述',
  `type` varchar(20) DEFAULT NULL COMMENT '类型',
  `param_type` varchar(10) DEFAULT NULL COMMENT '参数类型  u-用户录入  f-factory产出参数  bp-buildpack参数',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `flow_id_index` (`tpl_code`) USING BTREE,
  KEY `idx_tpl_code_and_key_data` (`tpl_code`,`key_data`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_project`
--

DROP TABLE IF EXISTS `factory_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_project` (
  `project_id` varchar(40) NOT NULL COMMENT '项目ID',
  `project_name` varchar(50) DEFAULT NULL COMMENT '项目名称',
  `project_status` varchar(5) DEFAULT NULL COMMENT '项目状态\n1 活动 \n2 关闭 3 删除',
  `detail_desc` varchar(4000) DEFAULT NULL COMMENT '项目详细描述',
  `notice_email` varchar(1000) DEFAULT NULL COMMENT '通知邮箱',
  `team_id` varchar(50) DEFAULT NULL COMMENT '项目对应的teamId',
  `template_id` varchar(40) DEFAULT NULL COMMENT '模板ID\n(在创建应用发布时,第二部选择)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user_id` varchar(40) DEFAULT NULL COMMENT '创建用户ID',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `modify_user_id` varchar(40) DEFAULT NULL,
  `app_id` varchar(40) DEFAULT NULL COMMENT '上架到mart的应用标识',
  `upload_time` datetime DEFAULT NULL COMMENT '首次上架mart的时间',
  `activity_id` varchar(40) DEFAULT 'NULL' COMMENT '活动标识',
  `project_type` varchar(10) DEFAULT 'normal' COMMENT '项目类型  git2run-giturl运行; normal-正常',
  PRIMARY KEY (`project_id`) USING BTREE,
  KEY `idx_create_user_id` (`create_user_id`) USING BTREE,
  KEY `idx_activity_id` (`activity_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_project_build_pack`
--

DROP TABLE IF EXISTS `factory_project_build_pack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_project_build_pack` (
  `bp_seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `project_id` varchar(40) NOT NULL COMMENT '项目ID',
  `composer_id` varchar(100) NOT NULL COMMENT '项目蓝图顶层id',
  `build_pack_id` varchar(100) NOT NULL COMMENT 'build_pack的id',
  `composer_build_pack_id` varchar(100) NOT NULL COMMENT 'buildpack在蓝图中的唯一标识',
  `path` varchar(100) DEFAULT NULL COMMENT 'buildpack所在0级蓝图的path',
  `input_name` varchar(100) DEFAULT NULL COMMENT 'buildpack输出的镜像key值',
  `stack_config_id` varchar(40) DEFAULT NULL COMMENT 'stackConfigId对应IDE库中的stack_config表的主键',
  PRIMARY KEY (`bp_seq`) USING BTREE,
  KEY `project_id_index` (`project_id`) USING BTREE,
  KEY `idx_project_id_and_composer_id` (`project_id`,`composer_id`) USING BTREE,
  KEY `idx_composer_id` (`composer_id`) USING BTREE,
  KEY `composer_build_pack_id_NORMAL` (`composer_build_pack_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_project_build_pack_param`
--

DROP TABLE IF EXISTS `factory_project_build_pack_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_project_build_pack_param` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `bp_seq` int(11) NOT NULL COMMENT 'buildpack主表ID',
  `key_data` varchar(400) DEFAULT NULL COMMENT 'key值',
  `value_data` varchar(4000) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL COMMENT '类型 （u-用户录入,f-factory填充）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `bp_unique` (`key_data`,`bp_seq`) USING BTREE,
  KEY `idx_bp_seq` (`bp_seq`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `service_email`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `service_email` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `service_email`;

--
-- Table structure for table `email_template`
--

DROP TABLE IF EXISTS `email_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_template` (
  `code` varchar(30) NOT NULL COMMENT '模板编号',
  `service_id` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL COMMENT '模板名称',
  `mail_to` varchar(2000) DEFAULT NULL COMMENT '收件人，可设置默认收件人，如监控邮件等。',
  `mail_cc` varchar(2000) DEFAULT NULL COMMENT '邮件抄送人，多个时用英文分号“;”分隔',
  `mail_bcc` varchar(2000) DEFAULT NULL COMMENT '邮件暗送人，多个时用英文分号“;”分隔',
  `subject` varchar(1000) DEFAULT NULL COMMENT '邮件标题，为空时取name字段',
  `content` blob NOT NULL COMMENT '模板内容',
  `operator_id` varchar(40) NOT NULL COMMENT '操作用户',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `modify_date` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `service_factory`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `service_factory` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `service_factory`;

--
-- Table structure for table `auto_deploy_config`
--

DROP TABLE IF EXISTS `auto_deploy_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auto_deploy_config` (
  `composer_id` varchar(100) NOT NULL COMMENT '蓝图ID',
  `project_id` varchar(40) NOT NULL COMMENT '项目ID',
  `cron_policy` varchar(400) NOT NULL COMMENT 'crontab 表达式',
  `cron_times` int(11) NOT NULL DEFAULT '1' COMMENT '次数',
  `deploy_type` varchar(10) NOT NULL COMMENT 'deploy-发布新实例, upgrade-更新实例',
  `upgrade_flow_id` int(11) DEFAULT NULL COMMENT '需要更新的流程ID',
  `upgrade_orca_deploy_id` varchar(36) DEFAULT NULL COMMENT '需要更新的实例的orca_deploy_id',
  `user_id` varchar(40) NOT NULL COMMENT '操作用户ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`composer_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auto_deploy_hook_config`
--

DROP TABLE IF EXISTS `auto_deploy_hook_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auto_deploy_hook_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `project_id` varchar(40) NOT NULL COMMENT '项目ID',
  `composer_id` varchar(100) NOT NULL COMMENT '蓝图ID',
  `git_url` varchar(2000) NOT NULL COMMENT '代码地址',
  `branch` varchar(100) NOT NULL COMMENT '代码分支',
  `user_id` varchar(40) NOT NULL COMMENT '用户ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `composer_template`
--

DROP TABLE IF EXISTS `composer_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `composer_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `composer_id` varchar(100) NOT NULL COMMENT '模板蓝图ID',
  `git_url_key` varchar(100) NOT NULL,
  `branch_key` varchar(100) NOT NULL,
  `ssh_key` varchar(100) NOT NULL,
  `webide_key` varchar(100) DEFAULT NULL,
  `git_url_template` varchar(200) NOT NULL COMMENT '对应giturl的模板',
  `project_name` varchar(255) DEFAULT NULL,
  `git_url` varchar(500) DEFAULT NULL,
  `stack_config_id` varchar(40) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_activity_log`
--

DROP TABLE IF EXISTS `factory_activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_activity_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_type` varchar(10) DEFAULT NULL COMMENT '日志类型，如：project-项目类日志',
  `biz_no` varchar(100) DEFAULT NULL COMMENT '业务号，如：项目类日志的projectId',
  `url` varchar(1000) DEFAULT NULL COMMENT '实际访问地址',
  `request_method` varchar(20) DEFAULT NULL COMMENT '请求类型，如：GET、POST、PUT等',
  `pkg` varchar(100) DEFAULT NULL COMMENT '包名',
  `clazz` varchar(200) DEFAULT NULL COMMENT '访问类名',
  `method` varchar(100) DEFAULT NULL COMMENT '类方法名',
  `description` varchar(4000) DEFAULT NULL COMMENT '自定义描述',
  `client_ip` varchar(100) DEFAULT NULL COMMENT '客户端ip',
  `consume_time` int(11) DEFAULT NULL COMMENT '请求处理耗时 （毫秒）',
  `user_id` varchar(40) DEFAULT NULL COMMENT '操作用户',
  `create_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_auto_test_report`
--

DROP TABLE IF EXISTS `factory_auto_test_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_auto_test_report` (
  `flow_id` int(10) unsigned NOT NULL COMMENT '应用flowId',
  `test_namespace` varchar(200) NOT NULL COMMENT '自动化测试工具实例namespace',
  `download_url` varchar(2000) DEFAULT NULL COMMENT '下载地址',
  `preview_url` varchar(2000) DEFAULT NULL COMMENT '预览地址',
  PRIMARY KEY (`test_namespace`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='自动化测试工具报告记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_build_pack_compile`
--

DROP TABLE IF EXISTS `factory_build_pack_compile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_build_pack_compile` (
  `bp_compile_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'buildpack 编译的ID',
  `project_id` varchar(40) NOT NULL COMMENT '项目ID',
  `composer_id` varchar(100) NOT NULL,
  `build_pack_id` varchar(100) NOT NULL COMMENT '对应的buildPack(对于composer来说就是composerID)',
  `composer_build_pack_id` varchar(100) DEFAULT NULL COMMENT 'buildpack在蓝图中的唯一标识',
  `deploy_id` varchar(36) NOT NULL COMMENT 'buildpack的发布ID',
  `consume_deploy_id` varchar(36) DEFAULT NULL COMMENT '消费此imageurl的发布信息的deploy_id',
  `flow_id` int(11) DEFAULT NULL COMMENT '操作标识，关联表factory_project_deploy_flow',
  `is_compile` varchar(5) NOT NULL COMMENT '是否在编译  0-开始编译  1- 结束编译 ',
  `start_compile_date` datetime NOT NULL COMMENT '开始编译时间',
  `end_compile_date` datetime NOT NULL COMMENT '结束编译时间',
  `start_compile_status` varchar(5) NOT NULL COMMENT '开始编译状态  0- 成功  1-失败',
  `end_compile_status` varchar(5) NOT NULL COMMENT '结束编译状态  0- 成功  1-失败',
  `image_key` varchar(200) DEFAULT NULL COMMENT 'image参数的key值',
  `image_url` varchar(200) DEFAULT NULL COMMENT '编译产出的images的url',
  `compile_type` varchar(1) DEFAULT NULL COMMENT '编译类型：h-手动触发，a-自动（monitor）触发',
  `user_id` varchar(40) DEFAULT NULL COMMENT '手动触发时的用户id',
  `compile_detail` varchar(2000) DEFAULT NULL,
  `git_commit_id` varchar(40) DEFAULT NULL COMMENT '编译代码所基于的commit_id',
  `image_tag` varchar(200) DEFAULT NULL COMMENT '同步的镜像名',
  `sync_start_time` datetime DEFAULT NULL,
  `sync_end_time` datetime DEFAULT NULL,
  `sync_result_code` varchar(10) DEFAULT NULL,
  `sync_result_message` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`bp_compile_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_build_pack_deploy`
--

DROP TABLE IF EXISTS `factory_build_pack_deploy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_build_pack_deploy` (
  `project_id` varchar(40) NOT NULL,
  `composer_id` varchar(100) NOT NULL COMMENT 'composerId，buildpack所属的应用蓝图ID，非buildpack本身的蓝图ID',
  `build_pack_id` varchar(100) NOT NULL,
  `composer_build_pack_id` varchar(100) DEFAULT NULL COMMENT 'buildpack在蓝图中的唯一标识',
  `deploy_id` varchar(36) NOT NULL,
  `domain` varchar(400) DEFAULT NULL,
  `full_domain` varchar(400) DEFAULT NULL COMMENT '完整域名',
  `hook` varchar(100) DEFAULT NULL,
  `user_id` varchar(40) NOT NULL,
  PRIMARY KEY (`deploy_id`) USING BTREE,
  UNIQUE KEY `deploy_id_UNIQUE` (`deploy_id`) USING BTREE,
  KEY `idx_project_id_and_composer_id` (`project_id`,`composer_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='buildpack蓝图发布信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_composer_component`
--

DROP TABLE IF EXISTS `factory_composer_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_composer_component` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `project_id` varchar(40) DEFAULT NULL COMMENT '项目ID',
  `app_id` varchar(40) DEFAULT NULL COMMENT '应用ID',
  `app_version` varchar(100) DEFAULT NULL COMMENT '应用版本',
  `composer_id` varchar(100) DEFAULT NULL COMMENT '组件所属蓝图的ID',
  `inside_unique_id` varchar(100) DEFAULT NULL COMMENT '组件在蓝图中的唯一标识',
  `component_name` varchar(200) DEFAULT NULL COMMENT '组件的原始名称（蓝图原型的名称）',
  `price` decimal(16,2) DEFAULT NULL COMMENT '组件单价',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `component_source_id` varchar(100) DEFAULT NULL COMMENT '组件的原型蓝图ID（组件实际为原型蓝图的一个副本）',
  `component_new_id` varchar(100) DEFAULT NULL COMMENT '组件作为原始蓝图副本产生的新ID',
  `component_new_name` varchar(200) DEFAULT NULL COMMENT '用户自定义的组件名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='composer下包含的组件信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_composer_component_config_template`
--

DROP TABLE IF EXISTS `factory_composer_component_config_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_composer_component_config_template` (
  `id` varchar(36) NOT NULL,
  `project_id` varchar(40) DEFAULT NULL COMMENT '创建配置模板所在的项目',
  `path` varchar(200) NOT NULL,
  `content` longblob NOT NULL,
  `remark` varchar(200) DEFAULT NULL COMMENT '模板说明',
  `image` varchar(200) DEFAULT NULL COMMENT '所使用镜像',
  `protocol` varchar(10) DEFAULT NULL COMMENT '服务协议：http or tcp',
  `os` varchar(20) DEFAULT NULL COMMENT '操作系统：Linux or Windows',
  `valid` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0-无效，1-有效',
  `create_user` varchar(40) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL,
  `modify_user` varchar(40) NOT NULL,
  `modify_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='蓝图组件映射配置文件模板';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_deploy_params`
--

DROP TABLE IF EXISTS `factory_deploy_params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_deploy_params` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` varchar(40) DEFAULT NULL COMMENT '项目ID',
  `composer_id` varchar(100) DEFAULT NULL COMMENT '发布ID',
  `key_data` varchar(400) DEFAULT NULL COMMENT '参数key值',
  `value_data` varchar(2000) DEFAULT NULL COMMENT '参数value值(对应用户填/选的值)',
  `custom_domain` varchar(400) DEFAULT NULL COMMENT '自定义域名',
  `label_data` varchar(400) DEFAULT NULL COMMENT 'label 信息',
  `required` tinyint(1) DEFAULT NULL COMMENT '0-false 非必填;  1-true 必填',
  `hidden` tinyint(1) DEFAULT NULL COMMENT '是否隐藏     0-false     1-true',
  `description` varchar(2000) DEFAULT NULL COMMENT '描述',
  `type` varchar(20) DEFAULT NULL COMMENT '输入框类型',
  `param_type` varchar(10) DEFAULT NULL COMMENT '参数类型：\r\nu-应用配置；\r\nbp-buildpack输出；\r\napi-API网关；\r\nregion-可访问区域；\r\nenv-发布环境；\r\ntest-自动化测试；\r\ns-调度策略；\r\ncopy-副本数；\r\nimage-镜像；',
  `tpl_code` varchar(40) DEFAULT '0' COMMENT '常用配置模板ID，0-为正常发布使用的参数',
  `port` int(11) DEFAULT NULL COMMENT '使用端口',
  `internal` tinyint(1) DEFAULT NULL COMMENT '内部使用',
  `protocol` varchar(40) DEFAULT NULL COMMENT '协议',
  `replicas` int(11) DEFAULT NULL COMMENT '副本数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='最新参数数据表\r\n(参数输入的历史记录件track表)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_deploy_params_auto_test`
--

DROP TABLE IF EXISTS `factory_deploy_params_auto_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_deploy_params_auto_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` varchar(40) DEFAULT NULL COMMENT '项目ID',
  `composer_id` varchar(100) DEFAULT NULL COMMENT '应用蓝图标识',
  `tool_project_id` varchar(40) DEFAULT NULL,
  `tool_composer_id` varchar(100) DEFAULT NULL COMMENT '测试工具蓝图',
  `key_data` varchar(400) DEFAULT NULL COMMENT '参数key值',
  `value_data` varchar(400) DEFAULT NULL COMMENT '参数value值(对应用户填/选的值)',
  `label_data` varchar(400) DEFAULT NULL COMMENT 'label 信息',
  `required` tinyint(1) DEFAULT NULL COMMENT '0-false 非必填;  1-true 必填',
  `hidden` tinyint(1) DEFAULT NULL COMMENT '0-false 不隐藏;  1-true 隐藏录入',
  `description` varchar(2000) DEFAULT NULL COMMENT '描述',
  `type` varchar(20) DEFAULT NULL COMMENT '输入框类型',
  `param_type` varchar(5) DEFAULT NULL COMMENT '参数类型  u-用户录入  f-factory产出参数  bp-buildpack参数',
  `user_id` varchar(40) DEFAULT NULL,
  `make_time` datetime DEFAULT NULL,
  `port` int(11) DEFAULT NULL COMMENT '使用端口',
  `internal` tinyint(1) DEFAULT NULL COMMENT '内部使用',
  `protocol` varchar(40) DEFAULT NULL COMMENT '协议',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='自动化测试工具录入参数';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_deploy_params_auto_test_track`
--

DROP TABLE IF EXISTS `factory_deploy_params_auto_test_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_deploy_params_auto_test_track` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` varchar(40) DEFAULT NULL COMMENT '项目ID',
  `composer_id` varchar(100) DEFAULT NULL COMMENT '应用蓝图标识',
  `tool_project_id` varchar(40) DEFAULT NULL,
  `tool_composer_id` varchar(100) DEFAULT NULL COMMENT '测试工具蓝图',
  `flow_id` int(11) NOT NULL,
  `key_data` varchar(400) DEFAULT NULL COMMENT '参数key值',
  `value_data` varchar(400) DEFAULT NULL COMMENT '参数value值(对应用户填/选的值)',
  `label_data` varchar(400) DEFAULT NULL COMMENT 'label 信息',
  `required` tinyint(1) DEFAULT NULL COMMENT '0-false 非必填;  1-true 必填',
  `hidden` tinyint(1) DEFAULT NULL COMMENT '0-false 不隐藏;  1-true 隐藏录入',
  `description` varchar(2000) DEFAULT NULL COMMENT '描述',
  `type` varchar(20) DEFAULT NULL COMMENT '输入框类型',
  `param_type` varchar(10) DEFAULT NULL COMMENT '参数类型  u-用户录入  f-factory产出参数  bp-buildpack参数',
  `user_id` varchar(40) DEFAULT NULL,
  `make_time` datetime DEFAULT NULL,
  `port` int(11) DEFAULT NULL COMMENT '使用端口',
  `internal` tinyint(1) DEFAULT NULL COMMENT '内部使用',
  `protocol` varchar(40) DEFAULT NULL COMMENT '协议',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='自动化测试工具录入参数';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_deploy_params_track`
--

DROP TABLE IF EXISTS `factory_deploy_params_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_deploy_params_track` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` varchar(40) DEFAULT NULL COMMENT '项目ID',
  `composer_id` varchar(100) DEFAULT NULL COMMENT '发布ID',
  `flow_id` int(11) NOT NULL,
  `key_data` varchar(400) DEFAULT NULL COMMENT '参数key值',
  `value_data` varchar(2000) DEFAULT NULL COMMENT '参数value值(对应用户填/选的值)',
  `custom_domain` varchar(400) DEFAULT NULL,
  `label_data` varchar(400) DEFAULT NULL COMMENT 'label 信息',
  `required` tinyint(1) DEFAULT NULL COMMENT '0-false 非必填;  1-true 必填',
  `hidden` tinyint(1) DEFAULT NULL COMMENT '是否隐藏     0-false     1-true',
  `description` varchar(2000) DEFAULT NULL COMMENT '描述',
  `type` varchar(20) DEFAULT NULL COMMENT '类型',
  `param_type` varchar(10) DEFAULT NULL COMMENT '参数类型(u：用户录入，f：factory产出参数，bp：buildpack参数，image：镜像）',
  `port` int(11) DEFAULT NULL COMMENT '使用端口',
  `internal` tinyint(1) DEFAULT NULL COMMENT '内部使用',
  `protocol` varchar(40) DEFAULT NULL COMMENT '协议',
  `replicas` int(11) DEFAULT NULL COMMENT '副本数量',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `flow_id_index` (`flow_id`) USING BTREE,
  KEY `idx_type` (`type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_deploy_scale`
--

DROP TABLE IF EXISTS `factory_deploy_scale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_deploy_scale` (
  `flow_id` int(11) NOT NULL COMMENT 'flowId',
  `project_id` varchar(255) DEFAULT NULL COMMENT '项目ID',
  `composer_id` varchar(100) DEFAULT NULL COMMENT '蓝图ID',
  `path` varchar(200) NOT NULL COMMENT '0级蓝图的path',
  `scale_type` varchar(10) DEFAULT NULL COMMENT '伸缩策略：handle-手动；auto-自动；',
  `replica` int(11) DEFAULT NULL COMMENT '副本数',
  `auto_min` int(11) DEFAULT NULL COMMENT '自动伸缩  最小值',
  `auto_max` int(11) DEFAULT NULL COMMENT '自动伸缩  最大值',
  `cpu_limit` int(11) DEFAULT NULL COMMENT 'cpu阀值',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间',
  `user_id` varchar(40) DEFAULT NULL COMMENT '操作用户',
  PRIMARY KEY (`flow_id`,`path`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_deploy_scale_track`
--

DROP TABLE IF EXISTS `factory_deploy_scale_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_deploy_scale_track` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flow_id` int(11) NOT NULL COMMENT 'flowId',
  `project_id` varchar(255) DEFAULT NULL COMMENT '项目ID',
  `composer_id` varchar(100) DEFAULT NULL COMMENT '蓝图ID',
  `path` varchar(200) NOT NULL COMMENT '0级蓝图的path',
  `scale_type` varchar(10) DEFAULT NULL COMMENT '伸缩策略：handle-手动；auto-自动；',
  `replica` int(11) DEFAULT NULL COMMENT '副本数',
  `auto_min` int(11) DEFAULT NULL COMMENT '自动伸缩  最小值',
  `auto_max` int(11) DEFAULT NULL COMMENT '自动伸缩  最大值',
  `cpu_limit` int(11) DEFAULT NULL COMMENT 'cpu阀值',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间',
  `user_id` varchar(40) DEFAULT NULL COMMENT '操作用户',
  `scale_result` varchar(10) DEFAULT NULL COMMENT '0-成功，其他-失败',
  `scale_orca_msg` varchar(100) DEFAULT NULL COMMENT 'orca返回的异常状态描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_deploy_upgrade_track`
--

DROP TABLE IF EXISTS `factory_deploy_upgrade_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_deploy_upgrade_track` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` varchar(40) NOT NULL COMMENT '项目ID',
  `namespace` varchar(40) NOT NULL COMMENT 'orca发布ID',
  `old_flow_id` int(11) DEFAULT NULL COMMENT '老版本的 flow_id',
  `new_flow_id` int(11) NOT NULL COMMENT '新版本的 flow_id',
  `type` varchar(10) NOT NULL COMMENT '分流类型  all-全部覆盖   flow-流量   ip-ip段   city-区域',
  `old_value` blob COMMENT '老版本的 分流策略的值',
  `new_value` blob COMMENT '新版本的 分流策略的值',
  `orca_deploy_status` varchar(5) DEFAULT NULL COMMENT '调用orca发布的返回状态  1-成功  2-失败   同deploy_status字段',
  `orca_deploy_description` varchar(4000) DEFAULT NULL COMMENT '发布描述--   失败原因',
  `user_id` varchar(40) DEFAULT NULL COMMENT '操作用户',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_env`
--

DROP TABLE IF EXISTS `factory_env`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_env` (
  `env_id` varchar(33) NOT NULL,
  `env_name` varchar(40) NOT NULL COMMENT '环境名称',
  `env_desc` varchar(4000) DEFAULT NULL COMMENT '环境描述',
  `env_schedule_sql` varchar(500) DEFAULT NULL COMMENT '环境高度策略脚本',
  `env_schedule_desc` varchar(4000) DEFAULT NULL COMMENT '描述',
  `env_type` varchar(10) NOT NULL COMMENT '三个层级：\r\nbase-系统初始化环境配置，所有团队、所有项目可直接使用，但不能修改；\r\nteam-团队层级，团队下所有项目均可直接使用，修改时会影响团队下所有项目；\r\nproject-项目层级，只在本项目下使用，修改时只影响本项目；',
  `team_id` varchar(40) DEFAULT NULL COMMENT '归属团队',
  `project_id` varchar(40) DEFAULT NULL COMMENT '归属项目',
  `status` varchar(10) NOT NULL COMMENT 'valid-有效；\r\ndel-已删除；',
  `operator` varchar(40) DEFAULT NULL COMMENT '操作用户',
  `create_time` datetime NOT NULL,
  `modify_time` datetime NOT NULL,
  PRIMARY KEY (`env_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='环境基础配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_gray_romote`
--

DROP TABLE IF EXISTS `factory_gray_romote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_gray_romote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` varchar(40) NOT NULL COMMENT '项目标识',
  `gray_deploy_id` varchar(36) NOT NULL COMMENT '提升到全局的发布id',
  `global_deploy_id` varchar(36) NOT NULL COMMENT '已发布至全局的发布id',
  `inner_domain` varchar(100) DEFAULT NULL COMMENT '内部定义域名，eg：*.c.cloudtogo.cn',
  `reply_status` int(11) DEFAULT NULL COMMENT '提升至全局的操作结果',
  `reply_status_name` varchar(30) DEFAULT NULL,
  `reply_description` varchar(4000) DEFAULT NULL,
  `user_id` varchar(40) NOT NULL COMMENT '操作用户',
  `make_time` datetime NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='提升至全局操作轨迹';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_order`
--

DROP TABLE IF EXISTS `factory_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_order` (
  `order_no` varchar(40) NOT NULL COMMENT '订单号',
  `pay_order_no` varchar(50) DEFAULT NULL,
  `project_id` varchar(40) DEFAULT NULL COMMENT '项目ID',
  `composer_id` varchar(100) DEFAULT NULL COMMENT 'composerID',
  `order_status` varchar(1) DEFAULT NULL COMMENT '订单状态\n0-有效\n1-失效，即删除的订单',
  `pay_status` varchar(1) DEFAULT NULL COMMENT '支付状态  0-待支付   1-支付中  2-支付成功  3-支付失败',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `launch_pay_date` datetime DEFAULT NULL COMMENT '发起支付时间',
  `pay_date` datetime DEFAULT NULL COMMENT '支付时间',
  `purchase_user_id` varchar(40) DEFAULT NULL COMMENT '购买用户',
  `amount` decimal(16,2) DEFAULT NULL COMMENT '总价',
  PRIMARY KEY (`order_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_order_detail`
--

DROP TABLE IF EXISTS `factory_order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(40) NOT NULL COMMENT '订单号',
  `project_id` varchar(40) DEFAULT NULL COMMENT '项目ID',
  `composer_id` varchar(100) DEFAULT NULL COMMENT 'composerID',
  `component_id` varchar(100) DEFAULT NULL COMMENT '组件ID',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `purchase_price` decimal(16,2) DEFAULT NULL COMMENT '购买单价',
  `original_price` decimal(16,2) DEFAULT NULL COMMENT '原价',
  `actual_price` decimal(16,2) DEFAULT NULL COMMENT '实际销售价格',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_params_config`
--

DROP TABLE IF EXISTS `factory_params_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_params_config` (
  `tpl_code` varchar(40) NOT NULL COMMENT 'uuid，常用配置模板id',
  `flow_id` int(11) DEFAULT NULL,
  `project_id` varchar(40) NOT NULL,
  `composer_id` varchar(100) DEFAULT NULL,
  `config_desc` varchar(2000) NOT NULL COMMENT '备注',
  `env_id` varchar(33) NOT NULL COMMENT '环境ID',
  `schedule_desc` blob COMMENT '调用策略描述信息',
  `user_id` varchar(40) NOT NULL DEFAULT '',
  `create_time` datetime NOT NULL,
  `modify_user_id` varchar(40) NOT NULL COMMENT '修改用户',
  `modify_time` datetime NOT NULL,
  `type` varchar(10) DEFAULT 'common' COMMENT 'auto-自动发布配置信息, common-常用参数配置信息',
  `deploy_mode` varchar(10) DEFAULT 'strict' COMMENT 'strict-严格模式; effort-尽力模式',
  `for_version_releasing` bit(1) DEFAULT b'0' COMMENT '是否是封版操作的预设参数',
  PRIMARY KEY (`tpl_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='参数管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_params_config_detail`
--

DROP TABLE IF EXISTS `factory_params_config_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_params_config_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` varchar(40) DEFAULT NULL COMMENT '项目ID',
  `composer_id` varchar(100) DEFAULT NULL COMMENT '发布ID',
  `tpl_code` varchar(40) NOT NULL,
  `key_data` varchar(400) DEFAULT NULL COMMENT '参数key值',
  `value_data` varchar(2000) DEFAULT NULL COMMENT '参数value值(对应用户填/选的值)',
  `custom_domain` varchar(400) DEFAULT NULL,
  `label_data` varchar(400) DEFAULT NULL COMMENT 'label 信息',
  `required` tinyint(1) DEFAULT NULL COMMENT '0-false 非必填;  1-true 必填',
  `hidden` tinyint(1) DEFAULT NULL COMMENT '是否隐藏     0-false     1-true',
  `description` varchar(2000) DEFAULT NULL COMMENT '描述',
  `type` varchar(20) DEFAULT NULL COMMENT '类型',
  `param_type` varchar(10) DEFAULT NULL COMMENT '参数类型  u-用户录入  f-factory产出参数  bp-buildpack参数',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `flow_id_index` (`tpl_code`) USING BTREE,
  KEY `idx_tpl_code_and_key_data` (`tpl_code`,`key_data`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_pipeline`
--

DROP TABLE IF EXISTS `factory_pipeline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_pipeline` (
  `id` varchar(32) NOT NULL,
  `project_id` varchar(255) NOT NULL,
  `composer_id` varchar(100) NOT NULL,
  `flow_id` int(11) NOT NULL,
  `step_id` varchar(32) DEFAULT NULL,
  `instance_id` varchar(32) DEFAULT NULL,
  `build_status` int(11) DEFAULT '-1',
  `deploy_status` int(11) DEFAULT '-1',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `factory_pipeline_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_project`
--

DROP TABLE IF EXISTS `factory_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_project` (
  `project_id` varchar(40) NOT NULL COMMENT '项目ID',
  `project_name` varchar(50) DEFAULT NULL COMMENT '项目名称',
  `project_status` varchar(5) DEFAULT NULL COMMENT '项目状态\n1 活动 \n2 关闭 3 删除',
  `detail_desc` varchar(4000) DEFAULT NULL COMMENT '项目详细描述',
  `notice_email` varchar(1000) DEFAULT NULL COMMENT '通知邮箱',
  `team_id` varchar(50) DEFAULT NULL COMMENT '项目对应的teamId',
  `template_id` varchar(40) DEFAULT NULL COMMENT '模板ID\n(在创建应用发布时,第二部选择)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user_id` varchar(40) DEFAULT NULL COMMENT '创建用户ID',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `modify_user_id` varchar(40) DEFAULT NULL,
  `app_id` varchar(40) DEFAULT NULL COMMENT '上架到mart的应用标识',
  `upload_time` datetime DEFAULT NULL COMMENT '首次上架mart的时间',
  `activity_id` varchar(40) DEFAULT 'NULL' COMMENT '活动标识',
  `project_type` varchar(10) DEFAULT 'normal' COMMENT '项目类型  git2run-giturl运行; normal-正常',
  PRIMARY KEY (`project_id`) USING BTREE,
  KEY `idx_create_user_id` (`create_user_id`) USING BTREE,
  KEY `idx_activity_id` (`activity_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_project_build_pack`
--

DROP TABLE IF EXISTS `factory_project_build_pack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_project_build_pack` (
  `bp_seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `project_id` varchar(40) NOT NULL COMMENT '项目ID',
  `composer_id` varchar(100) NOT NULL COMMENT '项目蓝图顶层id',
  `build_pack_id` varchar(100) NOT NULL COMMENT 'build_pack的id',
  `composer_build_pack_id` varchar(100) NOT NULL COMMENT 'buildpack在蓝图中的唯一标识',
  `path` varchar(100) DEFAULT NULL COMMENT 'buildpack所在0级蓝图的path',
  `input_name` varchar(100) DEFAULT NULL COMMENT 'buildpack输出的镜像key值',
  `stack_config_id` varchar(40) DEFAULT NULL COMMENT 'stackConfigId对应IDE库中的stack_config表的主键',
  PRIMARY KEY (`bp_seq`) USING BTREE,
  KEY `project_id_index` (`project_id`) USING BTREE,
  KEY `idx_project_id_and_composer_id` (`project_id`,`composer_id`) USING BTREE,
  KEY `idx_composer_id` (`composer_id`) USING BTREE,
  KEY `composer_build_pack_id_NORMAL` (`composer_build_pack_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_project_build_pack_param`
--

DROP TABLE IF EXISTS `factory_project_build_pack_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_project_build_pack_param` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `bp_seq` int(11) NOT NULL COMMENT 'buildpack主表ID',
  `key_data` varchar(400) DEFAULT NULL COMMENT 'key值',
  `value_data` varchar(4000) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL COMMENT '类型 （u-用户录入,f-factory填充）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `bp_unique` (`key_data`,`bp_seq`) USING BTREE,
  KEY `idx_bp_seq` (`bp_seq`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_project_composer`
--

DROP TABLE IF EXISTS `factory_project_composer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_project_composer` (
  `project_id` varchar(40) DEFAULT NULL COMMENT '项目ID',
  `composer_id` varchar(100) NOT NULL COMMENT '主键，项目顶层蓝图ID',
  `composer_name` varchar(200) DEFAULT NULL COMMENT 'composer的名字, 用于显示使用',
  `composer_comment` varchar(4000) DEFAULT NULL COMMENT '提交备注',
  `origin` varchar(10) DEFAULT NULL COMMENT '来源：design-设计；extract-根据实例提取；',
  `based_deploy_id` varchar(32) DEFAULT NULL COMMENT '基于哪个deployId  生成的composer',
  `based_composer_id` varchar(100) DEFAULT NULL COMMENT '基于哪个composerId进行的修改',
  `user_id` varchar(40) DEFAULT NULL COMMENT '用户ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `paused` tinyint(1) DEFAULT '1' COMMENT '暂停自动构建功能，仅包含buildpack的蓝图才有效；true-暂停',
  `paused_user` varchar(40) DEFAULT NULL COMMENT '暂停功能操作用户',
  PRIMARY KEY (`composer_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_project_id` (`project_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_project_composer_share`
--

DROP TABLE IF EXISTS `factory_project_composer_share`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_project_composer_share` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` varchar(40) NOT NULL,
  `composer_id` varchar(100) NOT NULL,
  `share_name` varchar(100) DEFAULT NULL COMMENT '分享名称/显示名称',
  `image` longblob COMMENT '显示图片内容',
  `is_valid` tinyint(1) NOT NULL COMMENT '是否有效     1-true 有效   0-false 失效',
  `user_id` varchar(40) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `cancel_user` varchar(40) DEFAULT NULL,
  `cancel_time` datetime DEFAULT NULL COMMENT '取消分享时间',
  `icon_class` varchar(100) DEFAULT NULL,
  `icon_url` varchar(200) DEFAULT NULL,
  `share_desc` varchar(1000) DEFAULT NULL COMMENT '分享描述',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `project_id_index` (`project_id`) USING BTREE,
  KEY `idx_composer_id` (`composer_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='蓝图分享';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_project_deploy`
--

DROP TABLE IF EXISTS `factory_project_deploy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_project_deploy` (
  `flow_id` int(11) DEFAULT NULL COMMENT '流程ID',
  `deploy_id` varchar(36) NOT NULL COMMENT '主键ID',
  `orca_deploy_id` varchar(37) DEFAULT NULL COMMENT '调用orca发布的ID (orca的namespace)',
  `project_id` varchar(255) DEFAULT NULL COMMENT '项目ID',
  `composer_id` varchar(100) DEFAULT NULL COMMENT 'buildpack发布时为buildpack id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `deploy_way` varchar(1) DEFAULT NULL COMMENT '发布方式\n1 手动\n  2 自动',
  `user_id` varchar(40) DEFAULT NULL COMMENT '手动触发的用户',
  `deploy_type` varchar(10) DEFAULT 'app' COMMENT '部署类型  app-正常应用  bp-为bulidpack  autoTest-自动化测试工具',
  `deploy_status` varchar(1) DEFAULT '0' COMMENT '发布状态：-1 - 待发布 ,  0-发布中，1-发布成功，2-发布失败',
  `orca_deploy_status` varchar(5) DEFAULT NULL COMMENT '调用orca发布的返回状态',
  `orca_deploy_description` varchar(4000) DEFAULT NULL COMMENT '发布描述',
  `is_recycle` varchar(1) DEFAULT '1' COMMENT '是否回收   0-是 1-否',
  `recycle_time` datetime DEFAULT NULL COMMENT '回收时间',
  `recycle_type` varchar(1) DEFAULT NULL COMMENT '回收类型  0-自动  1-手动',
  `recycle_orca_status` int(11) DEFAULT '-1' COMMENT '调用orca删除应用返回状态',
  `recycle_orca_error` varchar(400) DEFAULT NULL COMMENT '调用orca删除应用返回的错误信息',
  `composer_out_print` longblob COMMENT '测试环境部署返回信息',
  PRIMARY KEY (`deploy_id`) USING BTREE,
  KEY `project_id_index` (`project_id`) USING BTREE,
  KEY `idx_composer_id` (`composer_id`) USING BTREE,
  KEY `idx_is_recycle` (`is_recycle`) USING BTREE,
  KEY `idx_deploy_status` (`deploy_status`) USING BTREE,
  KEY `deploy_type_index` (`deploy_type`) USING BTREE,
  KEY `idx_flow_id` (`flow_id`) USING BTREE,
  KEY `idx_deploy_type` (`deploy_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_project_deploy_app`
--

DROP TABLE IF EXISTS `factory_project_deploy_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_project_deploy_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` varchar(40) NOT NULL,
  `composer_id` varchar(100) NOT NULL COMMENT '基于蓝图发布至mart',
  `deploy_id` varchar(36) DEFAULT NULL COMMENT '基于实例发布至mart',
  `composer_new_id` varchar(100) NOT NULL COMMENT '转换后的蓝图ID',
  `app_id` varchar(40) DEFAULT NULL COMMENT '应用ID',
  `app_version` varchar(100) DEFAULT NULL COMMENT '应用版本',
  `user_id` varchar(40) DEFAULT NULL COMMENT '用户ID',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `project_id_index` (`project_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='发布到mart的app信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_project_deploy_auto_test`
--

DROP TABLE IF EXISTS `factory_project_deploy_auto_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_project_deploy_auto_test` (
  `deploy_id` varchar(36) NOT NULL COMMENT '自动化工具发布id，针对每次测试都会发布一次',
  `type` varchar(10) NOT NULL COMMENT '测试报告类型：text-纯文本报告（默认）',
  `content` longblob COMMENT '自动化测试报告',
  `create_time` datetime NOT NULL COMMENT '开始自动化测试时间',
  `modify_time` datetime NOT NULL COMMENT '最后修改时间，即报告生成时间',
  PRIMARY KEY (`deploy_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='自动化测试结果，测试工具回调通知';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_project_deploy_flow`
--

DROP TABLE IF EXISTS `factory_project_deploy_flow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_project_deploy_flow` (
  `flow_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` varchar(255) NOT NULL,
  `composer_id` varchar(100) NOT NULL,
  `activity_id` varchar(36) DEFAULT NULL COMMENT '活动ID',
  `base_on_deploy_id` varchar(36) DEFAULT NULL COMMENT '基于哪个实例的deploy_id 进行发布',
  `handle_type` varchar(1) NOT NULL COMMENT '触发类型：1-手动；2-自动（根据规则触发）',
  `flow_type` varchar(20) DEFAULT NULL COMMENT '流程类型：deploy-正常发布；gray-灰度发布；part-局部更新；',
  `build_pack_start_time` datetime DEFAULT NULL COMMENT 'buildpack发布开始时间',
  `build_pack_end_time` datetime DEFAULT NULL COMMENT 'buildoack发布结束时间',
  `build_pack_deploy_status` varchar(10) DEFAULT NULL COMMENT 'buildpack发布状态：-1 无buildpack,  0-发布中，1-发布成功，2-发布失败',
  `build_pack_deploy_msg` varchar(1000) DEFAULT NULL COMMENT 'buildpack发布返回信息',
  `build_notify_time` datetime DEFAULT NULL COMMENT '调用hook通知构建的时间，手动触发时才有值',
  `build_start_time` datetime DEFAULT NULL,
  `build_end_time` datetime DEFAULT NULL,
  `build_result_code` varchar(10) DEFAULT NULL COMMENT '-1 无build  0 开始编译  1 结束编译   2编译失败\r\n',
  `build_result_msg` varchar(1000) DEFAULT NULL,
  `app_deploy_start_time` datetime DEFAULT NULL,
  `app_deploy_end_time` datetime DEFAULT NULL,
  `app_deploy_status` varchar(2) DEFAULT NULL COMMENT '发布状态：-1-待发布,0-发布中，1-发布成功，2-发布失败',
  `auto_test_deploy_start_time` datetime DEFAULT NULL,
  `auto_test_deploy_end_time` datetime DEFAULT NULL,
  `auto_test_deploy_status` varchar(16) DEFAULT NULL COMMENT '发布状态：-1 无auto test, 0-发布中，1-发布成功，2-发布失败, 3-待发布',
  `auto_test_task_id` varchar(40) DEFAULT NULL COMMENT 'API自动化测试执行任务ID',
  `auto_test_execution_status` varchar(16) DEFAULT NULL COMMENT 'API自动化测试执行状态（waiting-等待状态，running-正在运行，success成功，failure失败）',
  `auto_test_report_id` varchar(40) DEFAULT NULL COMMENT 'API自动化测试执行结果报告ID',
  `user_id` varchar(40) DEFAULT NULL COMMENT '手动触发时的操作用户',
  `create_time` datetime DEFAULT NULL,
  `is_del` varchar(5) DEFAULT NULL COMMENT '是否删除   0-是 1-否',
  `del_user_id` varchar(40) DEFAULT NULL COMMENT '删除用户ID',
  `del_time` datetime DEFAULT NULL,
  `webhook_notify_id` int(11) DEFAULT NULL COMMENT 'webhook通知标识',
  `schedule_desc` blob COMMENT '调用策略描述信息',
  `cover` tinyint(1) DEFAULT '0' COMMENT '是否被覆盖    0-false   1-true ',
  `deploy_desc` varchar(4000) DEFAULT NULL COMMENT '发布描述',
  `env_id` varchar(33) NOT NULL COMMENT '环境ID',
  `deploy_mode` varchar(10) DEFAULT 'strict' COMMENT 'strict-严格模式; effort-尽力模式',
  `app_group_id` varchar(40) DEFAULT NULL COMMENT '应用组ID(多云部署场景)',
  `is_multicluster` bit(1) DEFAULT b'0' COMMENT '是否多集群部署(1-是，0-否)',
  PRIMARY KEY (`flow_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_app_deploy_status` (`app_deploy_status`) USING BTREE,
  KEY `activity_id_index` (`activity_id`) USING BTREE,
  KEY `idx_project_id` (`project_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='实例发布状态流';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_project_deploy_result_specific`
--

DROP TABLE IF EXISTS `factory_project_deploy_result_specific`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_project_deploy_result_specific` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deploy_id` varchar(36) NOT NULL,
  `key_data` varchar(400) NOT NULL,
  `value_data` varchar(4000) DEFAULT NULL COMMENT '参数value值(对应用户填/选的值)',
  `label_data` varchar(400) DEFAULT NULL COMMENT 'label 信息',
  `type` varchar(20) DEFAULT NULL COMMENT '类型 tp-tcpport端口 domain-自定义域名  n-normal参数(orca返回的正常参数)   s-schedule (调度策略参数)',
  `description` varchar(2000) DEFAULT NULL COMMENT '描述(可能为空)',
  `port` int(11) DEFAULT NULL COMMENT '使用端口',
  `protocol` varchar(40) DEFAULT NULL COMMENT '协议',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='orca发布返回数据记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_project_member`
--

DROP TABLE IF EXISTS `factory_project_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_project_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` varchar(40) DEFAULT NULL COMMENT '项目ID',
  `user_id` varchar(40) DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_project_user_role`
--

DROP TABLE IF EXISTS `factory_project_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_project_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `project_id` varchar(40) DEFAULT NULL COMMENT '项目ID',
  `user_id` varchar(40) DEFAULT NULL COMMENT '用户ID',
  `role_id` varchar(10) DEFAULT NULL COMMENT '角色ID',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='项目成员角色关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_project_version`
--

DROP TABLE IF EXISTS `factory_project_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_project_version` (
  `project_id` varchar(40) NOT NULL COMMENT '项目ID',
  `version` varchar(40) NOT NULL COMMENT '版本',
  `deploy_id` varchar(40) DEFAULT NULL COMMENT '基于发布应用的DeployID',
  `composer_id` varchar(40) NOT NULL COMMENT '基于发布版本的蓝图ID',
  `new_composer_id` varchar(40) NOT NULL COMMENT '提取架构后的新蓝图ID',
  `description` varchar(1000) DEFAULT NULL COMMENT '封版描述',
  `created_by` varchar(255) DEFAULT NULL COMMENT '封版人',
  `created_at` datetime DEFAULT NULL COMMENT '封版时间',
  PRIMARY KEY (`project_id`,`version`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_project_version_sync_track`
--

DROP TABLE IF EXISTS `factory_project_version_sync_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_project_version_sync_track` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `project_id` varchar(40) NOT NULL COMMENT '当前环境中的项目ID',
  `version` varchar(255) NOT NULL COMMENT '版本号',
  `operated_by` varchar(255) DEFAULT NULL COMMENT '执行同步的用户ID',
  `started_at` datetime DEFAULT NULL COMMENT '执行同步的时间',
  `finished_at` datetime DEFAULT NULL COMMENT '同步完成的时间',
  `success` bit(1) NOT NULL COMMENT '同步状态',
  `message` varchar(255) DEFAULT NULL COMMENT '同步结果说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_quota`
--

DROP TABLE IF EXISTS `factory_quota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_quota` (
  `user_id` varchar(40) NOT NULL DEFAULT '' COMMENT '用户ID',
  `modify_time` datetime DEFAULT NULL,
  `modify_user_id` varchar(40) DEFAULT NULL,
  `create_user_id` varchar(40) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `instance_count` int(11) DEFAULT NULL COMMENT '用户可以发布的app实例个数',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='配额临时表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_task`
--

DROP TABLE IF EXISTS `factory_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `flow_id` int(11) DEFAULT NULL COMMENT '流程ID',
  `task_type` varchar(20) DEFAULT NULL COMMENT '任务类型  \r\n buildpack(bp发布) \r\n hook(调用hook)\r\n app(app发布)\r\n test(自动测试工具发布)',
  `task_status` varchar(5) DEFAULT NULL COMMENT '任务状态 \r\n 0-待处理\r\n 1-处理中  2-处理完成 3-不需要处理',
  `handle_desc` varchar(4000) DEFAULT NULL COMMENT '处理描述',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `start_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '开始时间',
  `end_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '结束时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_trace`
--

DROP TABLE IF EXISTS `factory_trace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_trace` (
  `id` varchar(32) NOT NULL,
  `flow_id` int(11) NOT NULL COMMENT '发布流程id',
  `trace_id` varchar(255) NOT NULL COMMENT '链路唯一id',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='关联jaeger 追踪链路所需要的 trace_id 和 flow_id 的关系，它们一一对应';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_webhook_notify_track`
--

DROP TABLE IF EXISTS `factory_webhook_notify_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_webhook_notify_track` (
  `notify_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` varchar(40) NOT NULL,
  `content_type` varchar(100) DEFAULT NULL COMMENT 'application/json;\r\napplication/x-www-form-urlencoded;',
  `git_url` varchar(200) DEFAULT NULL,
  `commit_id` varchar(100) DEFAULT NULL COMMENT '提交id',
  `is_deal` tinyint(1) NOT NULL DEFAULT '0' COMMENT '正常处理标志',
  `remark` varchar(4000) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`notify_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='webhook通知接收轨迹';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `factory_webhook_notify_track_composer`
--

DROP TABLE IF EXISTS `factory_webhook_notify_track_composer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory_webhook_notify_track_composer` (
  `notify_id` int(11) NOT NULL,
  `composer_id` varchar(100) NOT NULL,
  `is_deal` tinyint(1) NOT NULL,
  `remark` varchar(4000) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`notify_id`,`composer_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='webhook通知时影响到的蓝图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `instance_debug_domain`
--

DROP TABLE IF EXISTS `instance_debug_domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instance_debug_domain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flow_id` int(11) NOT NULL,
  `orca_deploy_id` varchar(37) DEFAULT NULL,
  `input_name` varchar(100) DEFAULT NULL,
  `domain` varchar(400) NOT NULL,
  `port` varchar(400) DEFAULT NULL COMMENT '参数value值(对应用户填/选的值)',
  `type` varchar(20) DEFAULT NULL COMMENT '类型 \r\nhttp   \r\ntcp',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_domain` (`domain`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `instance_volume`
--

DROP TABLE IF EXISTS `instance_volume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instance_volume` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flow_id` int(11) NOT NULL COMMENT '流程ID',
  `orca_deploy_id` varchar(37) NOT NULL COMMENT 'orca发布ID',
  `volume_id` varchar(40) NOT NULL COMMENT 'volume id',
  `volume_path` varchar(50) NOT NULL COMMENT 'volume的path',
  `key_data` varchar(100) NOT NULL COMMENT '输入参数的key值',
  `user_id` varchar(40) NOT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `promotion_activities`
--

DROP TABLE IF EXISTS `promotion_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotion_activities` (
  `activity_id` varchar(40) NOT NULL COMMENT '作为活动标识，拼接url',
  `activity_name` varchar(255) NOT NULL COMMENT '活动名称',
  `promote_time` datetime NOT NULL COMMENT '开始推广时间',
  `project_name` varchar(50) DEFAULT NULL COMMENT '项目名，支持替换符',
  `project_desc` varchar(4000) DEFAULT NULL COMMENT '项目描述',
  `deploy_desc` varchar(4000) DEFAULT NULL COMMENT '发布描述',
  `deploy_config` longblob NOT NULL COMMENT '发布配置，JSON字符串',
  `base_on_project_id` varchar(40) DEFAULT NULL COMMENT '基于的项目',
  `base_on_blueprint` varchar(40) DEFAULT NULL COMMENT '基于的蓝图',
  `valid` tinyint(1) NOT NULL DEFAULT '1' COMMENT '有效标识',
  `create_user` varchar(40) NOT NULL,
  `create_time` datetime NOT NULL,
  `modify_user` varchar(40) NOT NULL,
  `modify_time` datetime NOT NULL,
  PRIMARY KEY (`activity_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='推广活动，hack';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `service_ide`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `service_ide` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `service_ide`;

--
-- Table structure for table `che_stack`
--

DROP TABLE IF EXISTS `che_stack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `che_stack` (
  `che_stack_id` varchar(255) NOT NULL,
  `che_stack_name` varchar(255) NOT NULL,
  `che_stack_desc` varchar(4000) NOT NULL COMMENT '描述',
  `stack_composer_id` varchar(100) NOT NULL COMMENT 'stack对应的蓝图ID',
  `stack_base_image` varchar(200) NOT NULL,
  `stack_image_inspect` blob NOT NULL COMMENT 'image对应的json信息',
  `stack_container_inspect` blob NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_user_id` varchar(40) NOT NULL,
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modify_user_id` varchar(40) NOT NULL,
  PRIMARY KEY (`che_stack_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `che_workspace`
--

DROP TABLE IF EXISTS `che_workspace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `che_workspace` (
  `che_workspace_id` varchar(100) NOT NULL COMMENT 'workspace ID  对应che的workspace ID',
  `che_namespace` varchar(100) NOT NULL,
  `git_url` varchar(200) NOT NULL COMMENT 'git的地址',
  `ws_name` varchar(1000) NOT NULL COMMENT '工作空间名称',
  `user_id` varchar(40) NOT NULL COMMENT '用户ID',
  `che_stack_id` varchar(100) NOT NULL COMMENT 'workspace中使用的stackID ( 对应che的stackID )',
  `composer_id` varchar(100) NOT NULL COMMENT 'workspace对应的buildpack所在的父蓝图ID',
  `ws_url` varchar(2000) NOT NULL COMMENT '工作空间访问路径(部分路径)',
  `status` varchar(20) NOT NULL COMMENT '工作空间状态 \r\ndel-删除 \r\nrunning-启动',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `instance_orca_deploy_id` varchar(40) NOT NULL COMMENT '关联的实例的orcaDeployId',
  PRIMARY KEY (`che_workspace_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `che_workspace_action`
--

DROP TABLE IF EXISTS `che_workspace_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `che_workspace_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `che_workspace_id` varchar(100) NOT NULL COMMENT '工作空间ID',
  `user_id` varchar(40) NOT NULL,
  `type` varchar(20) NOT NULL COMMENT '操作类型  \r\n \r\ndel-删除 \r\nrunning-启动 (待定)',
  `request` blob NOT NULL COMMENT '请求信息',
  `request_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '请求时间',
  `response` blob NOT NULL COMMENT '返回信息',
  `response_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '返回时间',
  `is_success` varchar(1) NOT NULL DEFAULT '0' COMMENT '是否成功  0-成功  1-失败',
  `error` blob NOT NULL COMMENT '错误信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `command_exec`
--

DROP TABLE IF EXISTS `command_exec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `command_exec` (
  `exec_id` varchar(40) NOT NULL,
  `user_id` varchar(40) NOT NULL DEFAULT 'che',
  `orca_deploy_id` varchar(40) NOT NULL COMMENT '工作空间ID',
  `request` longblob NOT NULL,
  `response` longblob NOT NULL,
  `exec_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '执行时间',
  `exec_status` varchar(5) NOT NULL COMMENT '执行状态\r\nexec- 执行中\r\nsuc- 执行成功\r\nfail-执行失败',
  `orca_exec_status` varchar(100) NOT NULL COMMENT 'orca返回的执行状态',
  `orca_exec_desc` varchar(1000) NOT NULL COMMENT 'orca返回的执行描述',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `exec_stdout` blob NOT NULL COMMENT '脚本执行 输出',
  `exec_stderr` blob NOT NULL COMMENT '脚本执行  输出错误 ',
  `exec_retcode` varchar(100) NOT NULL COMMENT '执行返回code',
  PRIMARY KEY (`exec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deploy_params_config`
--

DROP TABLE IF EXISTS `deploy_params_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deploy_params_config` (
  `id` varchar(40) NOT NULL,
  `orca_deploy_id` varchar(40) NOT NULL,
  `key_data` varchar(100) NOT NULL,
  `value_data` varchar(100) NOT NULL,
  `type` varchar(10) NOT NULL,
  `port` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deploy_workspace`
--

DROP TABLE IF EXISTS `deploy_workspace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deploy_workspace` (
  `orca_deploy_id` varchar(40) NOT NULL,
  `deploy_status` varchar(1) NOT NULL COMMENT '发布状态：-1 - 待发布 ,  0-发布中，1-发布成功，2-发布失败',
  `deploy_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发布时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` varchar(40) NOT NULL,
  `workspace_id` varchar(100) NOT NULL,
  `composer_id` varchar(40) NOT NULL COMMENT '发布蓝图ID',
  `orca_deploy_status` varchar(5) NOT NULL,
  `orca_deploy_description` varchar(4000) NOT NULL COMMENT '发布描述',
  `is_recycle` varchar(1) NOT NULL DEFAULT '1' COMMENT '是否回收   0-是 1-否',
  `recycle_time` timestamp NULL DEFAULT NULL COMMENT '回收时间',
  `recycle_type` varchar(1) NOT NULL COMMENT '回收类型  0-自动  1-手动',
  `recycle_orca_status` int(11) NOT NULL DEFAULT '-1' COMMENT '调用orca删除应用返回状态',
  `recycle_orca_error` varchar(400) NOT NULL COMMENT '调用orca删除应用返回的错误信息',
  PRIMARY KEY (`orca_deploy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `image_tag_data`
--

DROP TABLE IF EXISTS `image_tag_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image_tag_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(400) NOT NULL,
  `che_stack_id` varchar(255) NOT NULL COMMENT 'buildpack_config表主键',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stack_config`
--

DROP TABLE IF EXISTS `stack_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stack_config` (
  `id` varchar(40) NOT NULL,
  `name` varchar(100) NOT NULL,
  `blueprint` varchar(100) NOT NULL COMMENT '暂只有两个选项：buildpack_linux、buildpack_windows',
  `image` varchar(255) NOT NULL,
  `valid` tinyint(1) NOT NULL DEFAULT '1' COMMENT '有效标识：1-有效',
  `icon` varchar(255) NOT NULL COMMENT '图标',
  `icon_url` varchar(255) NOT NULL,
  `description` varchar(4000) NOT NULL COMMENT '描述',
  `che_stack_id` varchar(255) NOT NULL,
  `type` varchar(10) NOT NULL COMMENT '两种选项：S2I、BuildPack',
  `os` varchar(10) NOT NULL COMMENT '操作系统：Linux or Windows',
  `s2i_builder_image` varchar(300) NOT NULL,
  `buildpack_build_script` blob NOT NULL,
  `buildpack_dockerfile` blob NOT NULL,
  `image_build_script` blob NOT NULL COMMENT 's2i or buildpack',
  `default_git_url` varchar(500) NOT NULL COMMENT '默认从哪里下载代码',
  `create_time` datetime NOT NULL,
  `create_user` varchar(40) NOT NULL,
  `modify_time` datetime NOT NULL,
  `modify_user` varchar(40) NOT NULL,
  `tips` varchar(4000) NOT NULL COMMENT '提示信息',
  `ide_type` varchar(10) DEFAULT 'ide' COMMENT '代码库类型  ide-正常代码库  design-可视化前段代码库',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='buildpack配置实例';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `workspace_check`
--

DROP TABLE IF EXISTS `workspace_check`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workspace_check` (
  `workspace_id` varchar(100) NOT NULL,
  `check_begin_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `check_end_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `workspace_status` varchar(10) NOT NULL COMMENT 'workspace启动状态  u-up启动  f-fail失败',
  PRIMARY KEY (`workspace_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `workspace_deploy_result_specific`
--

DROP TABLE IF EXISTS `workspace_deploy_result_specific`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workspace_deploy_result_specific` (
  `id` varchar(40) NOT NULL,
  `orca_deploy_id` varchar(40) NOT NULL,
  `key_data` varchar(400) NOT NULL,
  `value_data` varchar(400) NOT NULL COMMENT '参数value值(对应用户填/选的值)',
  `port` varchar(10) NOT NULL COMMENT '内部端口',
  `label_data` varchar(400) NOT NULL COMMENT 'label 信息',
  `type` varchar(20) NOT NULL COMMENT '类型 tp-tcpport端口 domain-自定义域名  n-normal参数(orca返回的正常参数)   s-schedule (调度策略参数)',
  `description` varchar(2000) NOT NULL COMMENT '描述(可能为空)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='orca发布返回数据记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `service_mart`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `service_mart` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `service_mart`;

--
-- Table structure for table `app_attr_data`
--

DROP TABLE IF EXISTS `app_attr_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_attr_data` (
  `app_id` varchar(40) NOT NULL COMMENT 'appid',
  `browse_count` int(11) DEFAULT '1' COMMENT 'app浏览量',
  PRIMARY KEY (`app_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='app属性信息表\r\n(待扩展)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_deploy_configs`
--

DROP TABLE IF EXISTS `app_deploy_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_deploy_configs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` varchar(40) NOT NULL COMMENT 'appID',
  `app_version` varchar(100) NOT NULL COMMENT '版本号',
  `template_id` varchar(45) NOT NULL COMMENT 'composer模板ID',
  `key_data` varchar(100) NOT NULL COMMENT 'name',
  `value_data` varchar(400) NOT NULL COMMENT 'name值',
  `custom_domain` varchar(400) DEFAULT NULL,
  `label_data` varchar(100) NOT NULL,
  `required` tinyint(1) DEFAULT NULL COMMENT '0-false 非必填;  1-true 必填',
  `hidden` tinyint(1) DEFAULT NULL COMMENT '是否隐藏     0-false     1-true',
  `description` varchar(2000) DEFAULT NULL COMMENT '描述',
  `type` varchar(100) NOT NULL,
  `deploy_id` varchar(40) NOT NULL,
  `port` int(11) DEFAULT NULL COMMENT '使用端口',
  `internal` tinyint(1) DEFAULT NULL COMMENT '内部使用',
  `protocol` varchar(40) DEFAULT NULL COMMENT '协议',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='蓝图参数信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_operate_log`
--

DROP TABLE IF EXISTS `app_operate_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_operate_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` varchar(40) DEFAULT NULL COMMENT '应用ID',
  `app_name` varchar(45) DEFAULT NULL COMMENT '应用名称',
  `app_version` varchar(100) DEFAULT NULL COMMENT '应用版本号',
  `url` varchar(100) DEFAULT NULL COMMENT '实际访问地址',
  `request_method` varchar(20) DEFAULT NULL COMMENT '请求类型，如：GET、POST、PUT等',
  `operate_type` varchar(10) DEFAULT NULL COMMENT '操作类型：1.删除 2.新增3.修改4.查询',
  `description` varchar(200) DEFAULT NULL COMMENT '自定义描述',
  `user_id` varchar(40) DEFAULT NULL COMMENT '操作用户',
  `create_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_snapshots`
--

DROP TABLE IF EXISTS `app_snapshots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_snapshots` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `app_id` varchar(40) NOT NULL COMMENT 'APPID',
  `app_version` varchar(100) NOT NULL COMMENT '版本号',
  `img` longblob NOT NULL COMMENT '缩略图',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_team`
--

DROP TABLE IF EXISTS `app_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` varchar(40) DEFAULT NULL,
  `app_version` varchar(30) NOT NULL COMMENT '版本号',
  `team_id` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_version`
--

DROP TABLE IF EXISTS `app_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_version` (
  `app_id` varchar(40) NOT NULL,
  `app_name` varchar(45) NOT NULL,
  `app_version` varchar(100) NOT NULL COMMENT '版本号',
  `template_id` varchar(45) NOT NULL COMMENT '模板ID (改版之后对应composer_id)',
  `encrypt` tinyint(1) NOT NULL COMMENT '访问限制：0-false-公共的(未加密)；1-true-私有的(加密)',
  `logo_id` int(11) DEFAULT NULL COMMENT 'logo图标',
  `app_type` varchar(1) NOT NULL COMMENT '应用类型：1-开源应用、2-行业应用、3-咨询方案等',
  `short_desc` varchar(4000) DEFAULT NULL COMMENT '简短描述，logo旁的简短说明',
  `description` longblob COMMENT '版本说明',
  `probation_flag` varchar(1) DEFAULT '0' COMMENT '是否可试用\n0-不可试用，默认值\n1-可试用，需指定试用期',
  `probation` int(11) NOT NULL DEFAULT '0' COMMENT '试用期限',
  `probation_unit` varchar(10) DEFAULT NULL COMMENT '试用期限单位\nD - 天\nM - 月\nY - 年',
  `price` decimal(16,2) NOT NULL DEFAULT '0.00' COMMENT '应用单价',
  `docker_compose` longblob,
  `rancher_compose` longblob,
  `app_status` varchar(1) NOT NULL COMMENT '状态\n1-发布中，客户上传应用后还未申请审核应用；\n2-审核中，申请发布后\n3-审核通过\n4-审核不通过\n0-失效，即用户删除了该应用',
  `ud_status` varchar(1) NOT NULL DEFAULT 'd' COMMENT '上下架状态：u-上架；d-下架\n只有审核通过的应用该状态才有效',
  `user_type` varchar(1) DEFAULT NULL COMMENT '发布用户类型：I-内部用户；O-外部注册用户',
  `user_id` varchar(40) DEFAULT NULL COMMENT '发布用户',
  `vendor_name` varchar(100) DEFAULT NULL COMMENT '供应商的名字(当vendor为zzzzzz时, 此字段有值)',
  `vendor` varchar(20) DEFAULT NULL COMMENT '应用提供商',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `apply_date` datetime DEFAULT NULL COMMENT '申请发布时间',
  `auditor_id` varchar(40) DEFAULT NULL COMMENT '审核人',
  `audit_date` datetime DEFAULT NULL COMMENT '审核时间',
  `audit_content` varchar(4000) DEFAULT NULL,
  `modify_date` datetime NOT NULL COMMENT '最后修改时间',
  `app_arrange` longblob COMMENT '应用编排',
  `maintain` varchar(20) DEFAULT NULL COMMENT '维护方 0-mart, 1-composer',
  `param_content` longblob COMMENT '参数内容',
  `app_source` varchar(20) DEFAULT 'mart' COMMENT 'app来源   mart  或 factory',
  PRIMARY KEY (`app_id`,`app_version`) USING BTREE,
  UNIQUE KEY `app_version_unique` (`app_id`,`app_version`) USING BTREE,
  KEY `app_id_index` (`app_id`) USING BTREE,
  KEY `update_date_index` (`update_date`) USING BTREE,
  KEY `template_id_normal` (`template_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_version_logo`
--

DROP TABLE IF EXISTS `app_version_logo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_version_logo` (
  `logo_id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` varchar(40) NOT NULL,
  `app_version` varchar(100) NOT NULL,
  `logo` longblob NOT NULL,
  PRIMARY KEY (`logo_id`) USING BTREE,
  UNIQUE KEY `logo_ID_UNIQUE` (`logo_id`) USING BTREE,
  UNIQUE KEY `app_unique` (`app_id`,`app_version`) USING BTREE,
  KEY `app_id_index` (`app_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='应用logo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deploy_result_specific`
--

DROP TABLE IF EXISTS `deploy_result_specific`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deploy_result_specific` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deploy_id` varchar(40) NOT NULL COMMENT '发布ID---子订单号',
  `key_data` varchar(400) NOT NULL,
  `value_data` varchar(400) DEFAULT NULL COMMENT '参数value值(对应用户填/选的值)',
  `label_data` varchar(400) DEFAULT NULL COMMENT 'label 信息',
  `type` varchar(20) DEFAULT NULL COMMENT '类型 tp-tcpport端口 domain-自定义域名  n-normal参数(orca返回的正常参数)   s-schedule (调度策略参数)',
  `description` varchar(2000) DEFAULT NULL COMMENT '描述(可能为空)',
  `port` int(11) DEFAULT NULL COMMENT '使用端口',
  `protocol` varchar(40) DEFAULT NULL COMMENT '协议',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='orca发布返回数据记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evaluate_trace`
--

DROP TABLE IF EXISTS `evaluate_trace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evaluate_trace` (
  `trace_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(40) DEFAULT NULL COMMENT '订单号',
  `sub_order_no` varchar(40) DEFAULT NULL COMMENT '子订单号',
  `app_id` varchar(40) NOT NULL COMMENT '应用ID',
  `app_version` varchar(40) NOT NULL COMMENT '应用版本号',
  `score` float NOT NULL DEFAULT '0' COMMENT '评分',
  `content` blob,
  `is_anonymous` tinyint(1) NOT NULL COMMENT '是否匿名\n0 - 是\n1 - 否',
  `evaluate_user_id` varchar(40) NOT NULL COMMENT '评价人',
  `create_time` datetime NOT NULL COMMENT '评论时间',
  PRIMARY KEY (`trace_id`) USING BTREE,
  UNIQUE KEY `trace_ID_UNIQUE` (`trace_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='应用评价轨迹表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_detail` (
  `order_id` varchar(40) DEFAULT NULL,
  `sub_order_no` varchar(40) NOT NULL,
  `deploy_id` varchar(40) NOT NULL COMMENT '发布ID',
  `app_id` varchar(40) NOT NULL,
  `app_version` varchar(100) NOT NULL,
  `instance_name` varchar(100) DEFAULT NULL,
  `original_price` decimal(16,2) NOT NULL COMMENT '应用原价',
  `actual_price` decimal(16,2) NOT NULL COMMENT '应用实际销售价格，一般与原价相等',
  `value_added_service_price` decimal(16,2) NOT NULL DEFAULT '0.00' COMMENT '增值服务金额',
  `res_cpu` int(11) NOT NULL COMMENT '占用CPU资源个数',
  `res_memory` int(11) NOT NULL COMMENT '占用内存资源单位数',
  `res_used_time` int(11) NOT NULL COMMENT '资源使用时间',
  `res_used_time_unit` varchar(2) NOT NULL COMMENT '资源使用时间单位：H、D、M、Y',
  `res_price` decimal(16,2) DEFAULT NULL COMMENT '资源使用费用',
  `domain_name` varchar(100) NOT NULL COMMENT '用户填写的部分域名',
  `domain_full_name` varchar(100) NOT NULL COMMENT '可访问的完整域名',
  `purchase_price` decimal(16,2) DEFAULT NULL COMMENT '购买价格：actual_price + value_added_service_price + res_price，购买者支付金额',
  `valuation_id` int(11) DEFAULT NULL COMMENT '所采用的分配策略',
  `valuation_type` varchar(1) DEFAULT NULL,
  `valuation_percent` float DEFAULT NULL COMMENT '百分比值',
  `valuation_amount` decimal(16,2) DEFAULT NULL,
  `valuation_sql` varchar(4000) DEFAULT NULL,
  `distribute_to_isv_amount` decimal(16,2) DEFAULT NULL COMMENT '应用部分分配给ISV的金额',
  `cloud_type` varchar(10) NOT NULL COMMENT '云类型(私有,公有)',
  `sub_cloud_type` varchar(10) NOT NULL COMMENT '具体云(阿里,腾讯等)',
  `distribute_to_platform_amount` decimal(16,2) DEFAULT NULL COMMENT '应用部分分配给平台的金额；所占用资源费用归平台所有，不进行分配。',
  `blue_print` longblob COMMENT '蓝图',
  `deploy_status` varchar(5) DEFAULT NULL COMMENT '未发布 = -2;\n发布中 = -1;\nINVALID = 0;\nSTATUS_OK = 1;\nNAMESPACE_IS_REQUIRED = 2;\nYAML_IS_REQUIRED = 3;\nAGENT_FAILURE = 4;\nNO_RESOURCE = 5;\nRES_FAILURE = 6;\nRES_CONF_FAILURE = 7;\nWATCH_FAILURE = 8;',
  `deploy_start_time` datetime DEFAULT NULL,
  `deploy_end_time` datetime DEFAULT NULL,
  `deploy_description` varchar(4000) DEFAULT NULL,
  `orca_output` longblob COMMENT 'orca部署后的输出结果',
  `composer_output` longblob COMMENT '调用composer返回的output信息',
  `is_recycle` varchar(1) DEFAULT NULL COMMENT '是否回收   0-是 1-否',
  `recycle_time` datetime DEFAULT NULL,
  `recycle_user` varchar(40) DEFAULT NULL COMMENT '回收用户',
  `recycle_orca_status` int(11) DEFAULT '-1' COMMENT '调用orca删除应用返回状态',
  `recycle_orca_error` varchar(400) DEFAULT NULL COMMENT '调用orca删除应用返回的错误信息',
  `audit_status` enum('-1','0','1') DEFAULT NULL COMMENT '审核状态',
  `audit_date` timestamp NULL DEFAULT NULL COMMENT '审核时间',
  `audit_remark` varchar(255) DEFAULT NULL,
  `audit_user` varchar(40) DEFAULT NULL COMMENT '审核用户ID',
  `schedule_desc` blob,
  PRIMARY KEY (`sub_order_no`) USING BTREE,
  UNIQUE KEY `sub_order_no_UNIQUE` (`sub_order_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='订单详情';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_main`
--

DROP TABLE IF EXISTS `order_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_main` (
  `order_id` varchar(40) NOT NULL COMMENT '订单序号',
  `order_no` varchar(40) NOT NULL COMMENT '订单号',
  `pay_order_no` varchar(50) DEFAULT NULL COMMENT 'epay系统返回的支付订单号',
  `amount` decimal(16,2) NOT NULL COMMENT '订单总金额',
  `order_status` varchar(1) NOT NULL COMMENT '订单状态\n0-有效\n1-失效，即删除的订单',
  `pay_status` varchar(1) NOT NULL COMMENT '支付状态  0-待支付   1-支付中  2-支付成功  3-支付失败',
  `purchase_user_id` varchar(40) NOT NULL COMMENT '购买用户',
  `is_refund` varchar(255) DEFAULT NULL COMMENT '退款状态',
  `refund_remark` varchar(4000) DEFAULT NULL COMMENT '退款描述',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `launch_pay_date` datetime DEFAULT NULL COMMENT '发起支付时间',
  `pay_date` datetime DEFAULT NULL COMMENT '实际支付时间',
  `audit_status` enum('0','1','-1') DEFAULT '0' COMMENT '审核状态 - 0: 未审核, 1: 已审核, -1: 不通过',
  `audit_date` timestamp NULL DEFAULT NULL COMMENT '审核日期',
  `audit_remark` varchar(255) DEFAULT NULL COMMENT '审核意见',
  `audit_user` varchar(40) DEFAULT NULL COMMENT '审核人员',
  PRIMARY KEY (`order_id`) USING BTREE,
  UNIQUE KEY `order_ID_UNIQUE` (`order_id`) USING BTREE,
  UNIQUE KEY `order_no_UNIQUE` (`order_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quota`
--

DROP TABLE IF EXISTS `quota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quota` (
  `user_id` varchar(40) NOT NULL COMMENT '用户的ID',
  `app_count` int(11) DEFAULT NULL COMMENT '用户可以购买app的个数',
  `modify_time` datetime DEFAULT NULL,
  `create_user_id` varchar(40) DEFAULT NULL,
  `modify_user_id` varchar(40) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='配额临时表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `service_monitor`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `service_monitor` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `service_monitor`;

--
-- Table structure for table `alarm_contact`
--

DROP TABLE IF EXISTS `alarm_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alarm_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(400) NOT NULL,
  `status` varchar(5) NOT NULL DEFAULT '0' COMMENT '是否有效; 0-有效;  1-失效',
  `email` varchar(400) NOT NULL,
  `email_switch` varchar(5) NOT NULL DEFAULT 'on' COMMENT '邮件开关; on-开, off-关',
  `mobile` varchar(20) NOT NULL,
  `mobile_switch` varchar(5) NOT NULL DEFAULT 'on' COMMENT '短信开关; on-开, off-关',
  `ding_robot` varchar(500) NOT NULL,
  `ding_robot_switch` varchar(5) NOT NULL DEFAULT 'on' COMMENT '短信开关; on-开, off-关',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_user_id` varchar(40) NOT NULL,
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_user_id` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `service_notify`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `service_notify` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `service_notify`;

--
-- Table structure for table `namespace_deploy_result`
--

DROP TABLE IF EXISTS `namespace_deploy_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `namespace_deploy_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `namespace` varchar(40) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `status_name` varchar(255) DEFAULT NULL,
  `error` varchar(255) DEFAULT NULL,
  `content` longblob,
  `create_time` datetime DEFAULT NULL,
  `checked` tinyint(1) NOT NULL DEFAULT '0' COMMENT '核对标识，也是送达标识',
  `check_time` datetime DEFAULT NULL COMMENT '核对时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `namespace_deploy_result_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice` (
  `notice_id` varchar(40) NOT NULL,
  `type` varchar(10) NOT NULL DEFAULT 'notice' COMMENT '类型',
  `level` varchar(10) NOT NULL DEFAULT '' COMMENT 'info, error ...',
  `title` varchar(255) DEFAULT NULL,
  `message` longblob NOT NULL,
  `notify_times` int(11) NOT NULL DEFAULT '0' COMMENT '已通知次数',
  `create_user` varchar(40) NOT NULL,
  `create_time` datetime NOT NULL,
  `modify_user` varchar(40) NOT NULL,
  `modify_time` datetime NOT NULL,
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='公告等通知类消息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notice_trace`
--

DROP TABLE IF EXISTS `notice_trace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice_trace` (
  `trace_id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_id` varchar(40) NOT NULL,
  `type` varchar(10) DEFAULT NULL,
  `level` varchar(10) DEFAULT NULL COMMENT 'info, error ...',
  `title` varchar(255) DEFAULT NULL,
  `message` longblob,
  `notify_times` int(11) DEFAULT NULL,
  `modify_user` varchar(40) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `notify_user` varchar(40) NOT NULL,
  `notify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`trace_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `service_pipeline`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `service_pipeline` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `service_pipeline`;

--
-- Table structure for table `apps`
--

DROP TABLE IF EXISTS `apps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apps` (
  `at_value` varchar(255) DEFAULT NULL,
  `id` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `blue_print_id` varchar(255) DEFAULT NULL,
  `topo` longtext,
  `method` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `create_at` varchar(255) DEFAULT NULL,
  `composer_id` varchar(255) DEFAULT NULL,
  `property_set` varchar(255) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `instance_id` varchar(255) DEFAULT NULL,
  `pipeline_id` varchar(255) DEFAULT NULL,
  `project_id` varchar(255) DEFAULT NULL,
  `is_running` tinyint(1) DEFAULT NULL,
  `input_event_name` varchar(255) DEFAULT NULL,
  `output_event_name` varchar(255) DEFAULT NULL,
  `flow_id` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `instants`
--

DROP TABLE IF EXISTS `instants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instants` (
  `id` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `blue_print_id` varchar(255) DEFAULT NULL,
  `topo` longtext,
  `method` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `create_at` varchar(255) DEFAULT NULL,
  `property_set` varchar(255) DEFAULT NULL,
  `flow_id` double DEFAULT NULL,
  `api_request` varchar(255) DEFAULT NULL,
  `api_response` varchar(255) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `instance_id` varchar(255) DEFAULT NULL,
  `composer_id` varchar(255) DEFAULT NULL,
  `project_id` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `percent` varchar(255) DEFAULT NULL,
  `pipeline_name` varchar(255) DEFAULT NULL,
  `pipeline_id` varchar(255) DEFAULT NULL,
  `event_status` varchar(255) DEFAULT NULL,
  `input_event_name` varchar(255) DEFAULT NULL,
  `input_code` int(11) DEFAULT NULL,
  `output_event_name` varchar(255) DEFAULT NULL,
  `output_code` int(11) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `at_value` varchar(255) DEFAULT NULL,
  `app_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pipeline`
--

DROP TABLE IF EXISTS `pipeline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pipeline` (
  `id` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `blue_print_id` varchar(255) DEFAULT NULL,
  `topo` longtext,
  `method` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `create_at` varchar(255) DEFAULT NULL,
  `property_set` varchar(255) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `project_id` varchar(255) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `instance_id` varchar(255) DEFAULT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `input_event_name` varchar(255) DEFAULT NULL,
  `output_event_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `service_registry`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `service_registry` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `service_registry`;

--
-- Table structure for table `registry_provider`
--

DROP TABLE IF EXISTS `registry_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registry_provider` (
  `id` varchar(40) NOT NULL,
  `key` varchar(40) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `type` enum('registry','dockerhub','harbor') NOT NULL,
  `version` varchar(40) NOT NULL DEFAULT 'latest',
  `uri` varchar(200) DEFAULT NULL,
  `seq` int(11) NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `service_sms`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `service_sms` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `service_sms`;

--
-- Table structure for table `sms_template`
--

DROP TABLE IF EXISTS `sms_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_template` (
  `code` varchar(20) NOT NULL COMMENT '模板编号',
  `service_id` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL COMMENT '模板名称',
  `send_to` varchar(2000) DEFAULT NULL COMMENT '默认短信接收人，多个时用英文分号“;”分隔',
  `content` varchar(1000) NOT NULL COMMENT '模板内容',
  `yunpian_tpl` varchar(100) DEFAULT NULL COMMENT '云片中的模板id',
  `operator_id` varchar(40) DEFAULT NULL COMMENT '操作用户',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `modify_date` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sms_trace`
--

DROP TABLE IF EXISTS `sms_trace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_trace` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序列号',
  `tpl` varchar(20) NOT NULL COMMENT '使用的模板ID',
  `mobile` varchar(11) NOT NULL COMMENT '手机号码',
  `content` varchar(4000) NOT NULL COMMENT '短信内容',
  `service_id` varchar(50) NOT NULL COMMENT '来源系统，如：mart',
  `sms_type` varchar(20) DEFAULT '' COMMENT '短信类型，由短信平台约定，侧重在对接系统上的约定',
  `business_type` varchar(20) DEFAULT '' COMMENT '业务类型，由各业务系统自行定义',
  `make_date` datetime NOT NULL COMMENT '接收/创建时间',
  `call_type` varchar(10) DEFAULT '' COMMENT '调用方式：tpl-按模板，content-内容',
  `send_type` varchar(10) NOT NULL COMMENT '发送类型：\r\nsync - 实时\r\nasync - 异步',
  `send_date` datetime DEFAULT NULL COMMENT '短信实际发送时间，即调用外部服务的时间',
  `receive_date` datetime DEFAULT NULL COMMENT '返回结果时间',
  `send_status` int(2) DEFAULT '0' COMMENT '发送状态：0-已接收，1-发送中，2-发送成功，3-发送失败',
  `operator_id` varchar(40) DEFAULT '' COMMENT '操作用户',
  PRIMARY KEY (`id`),
  KEY `mobile_index` (`mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sms_trace_yunpian`
--

DROP TABLE IF EXISTS `sms_trace_yunpian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_trace_yunpian` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sms_trace_id` int(11) NOT NULL COMMENT 'sms_trace中的唯一标识',
  `send_date` datetime NOT NULL COMMENT '发送时间',
  `http_status_code` int(11) DEFAULT NULL COMMENT 'http状态',
  `code` int(11) DEFAULT NULL COMMENT 'code = 0: 正确返回。可以从api返回的对应字段中取数据。\r\ncode > 0: 调用API时发生错误，需要开发者进行相应的处理。\r\n-50 < code <= -1: 权限验证失败，需要开发者进行相应的处理。\r\ncode <= -50: 系统内部错误，请联系技术支持，调查问题原因并获得解决方案。\r\n值说明：https://www.yunpian.com/api2.0/api-recode.html',
  `msg` varchar(2000) DEFAULT NULL COMMENT '例如""发送成功""，或者相应错误信息',
  `detail` varchar(4000) DEFAULT NULL,
  `count` int(11) DEFAULT NULL COMMENT '发送成功短信的计费条数(计费条数：70个字一条，超出70个字时按每67字一条计费)',
  `fee` double(12,2) DEFAULT NULL COMMENT '扣费金额，单位：元，类型：双精度浮点型/double',
  `sid` bigint(20) DEFAULT NULL COMMENT '短信id，64位整型， 对应Java和C#的Long，不可用int解析',
  `receive_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `service_study`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `service_study` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `service_study`;

--
-- Table structure for table `app_runtime`
--

DROP TABLE IF EXISTS `app_runtime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_runtime` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `runtime_id` int(10) DEFAULT NULL,
  `project_id` varchar(40) DEFAULT NULL COMMENT '项目ID',
  `blueprint_id` varchar(40) DEFAULT NULL COMMENT '蓝图ID',
  `flow_id` int(11) DEFAULT NULL,
  `created_app_resource_id` int(11) DEFAULT NULL COMMENT '资源池资源的ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_runtime_id` (`runtime_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chapter`
--

DROP TABLE IF EXISTS `chapter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chapter` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '章节ID',
  `course_id` int(11) DEFAULT NULL COMMENT '课程ID',
  `index` int(11) DEFAULT NULL COMMENT '章节序号',
  `title` varchar(255) DEFAULT NULL COMMENT '章节标题',
  `description` varchar(255) DEFAULT NULL COMMENT '章节描述',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_course_and_index` (`course_id`,`index`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `class_info`
--

DROP TABLE IF EXISTS `class_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `class_name` varchar(50) NOT NULL COMMENT '班级名',
  `create_tm` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_tm` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `class_student`
--

DROP TABLE IF EXISTS `class_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_student` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` varchar(40) NOT NULL COMMENT '学生id',
  `class_id` int(11) NOT NULL COMMENT '班级id',
  `create_tm` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_tm` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `inx_student` (`user_id`) USING BTREE,
  KEY `inx_class` (`class_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='班级和学生关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '课程ID',
  `title` varchar(255) DEFAULT NULL COMMENT '课程标题',
  `overview` varchar(400) DEFAULT NULL COMMENT '课程概要，简单描述课程，格式为简单的纯文本',
  `description` text COMMENT '课程描述，完整地描述课程内容，格式为复杂的富文本',
  `description_html` text COMMENT '根据课程描述原始文档解析生成的html，用以前端显示使用',
  `notice` text COMMENT '课程须知（又可称“注意事项”）',
  `notice_html` text COMMENT '根据课程须知原始文档解析生成的html，用以前端显示使用',
  `difficulty` varchar(16) DEFAULT NULL COMMENT '课程难度（入门，中级，困难）',
  `cover_url` varchar(500) DEFAULT NULL COMMENT '封面图URL',
  `lesson_count` int(11) DEFAULT NULL COMMENT '课时节数',
  `student_count` int(11) DEFAULT NULL COMMENT '学习人数',
  `estimated_study_time` int(11) DEFAULT NULL COMMENT '预计学习使用时长（秒）',
  `created_at` datetime DEFAULT NULL COMMENT '课程发布时间',
  `updated_at` datetime DEFAULT NULL COMMENT '课程更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `course_teacher`
--

DROP TABLE IF EXISTS `course_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_teacher` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '关联记录ID',
  `teacher_id` varchar(40) DEFAULT NULL COMMENT '教师ID',
  `class_id` int(11) DEFAULT NULL COMMENT '班级ID',
  `course_id` int(11) DEFAULT NULL COMMENT '课程ID',
  `joined_at` datetime DEFAULT NULL COMMENT '参加学习课程的时间',
  `last_access_at` datetime DEFAULT NULL COMMENT '上次教本课程的时间',
  `teach_time` int(11) DEFAULT NULL COMMENT '累计教该课程的时间（秒）',
  `current_lesson_id` int(11) DEFAULT NULL COMMENT '当前已教到的课时ID',
  `finished_lesson_count` int(11) DEFAULT '0' COMMENT '已完成课时节数',
  `finished` bit(1) DEFAULT b'0' COMMENT '该课程是否已教学完毕',
  `finished_at` datetime DEFAULT NULL COMMENT '该课程完成教学的时间',
  `create_tm` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_tm` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_and_course` (`teacher_id`,`course_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='教师上该门课程的情况';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `created_app_resource`
--

DROP TABLE IF EXISTS `created_app_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `created_app_resource` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lesson_id` int(11) DEFAULT NULL,
  `project_id` varchar(40) DEFAULT NULL,
  `project_team_id` varchar(40) DEFAULT NULL,
  `project_admin_id` varchar(40) DEFAULT NULL,
  `project_admin_role_id` varchar(40) DEFAULT NULL,
  `blueprint_id` varchar(40) DEFAULT NULL,
  `flow_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `assigned` bit(1) DEFAULT b'0',
  `assigned_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ide_runtime`
--

DROP TABLE IF EXISTS `ide_runtime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ide_runtime` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `runtime_id` int(10) DEFAULT NULL,
  `stack_config_id` varchar(40) DEFAULT NULL,
  `git_url` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_runtime_id` (`runtime_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lesson`
--

DROP TABLE IF EXISTS `lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lesson` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '课时ID',
  `course_id` int(11) DEFAULT NULL COMMENT '课程ID',
  `chapter_id` int(11) DEFAULT NULL COMMENT '章节ID',
  `index_in_chapter` int(11) DEFAULT NULL COMMENT '课时在章节中的序号',
  `title` varchar(255) DEFAULT NULL COMMENT '课时标题',
  `description` varchar(255) DEFAULT NULL COMMENT '课时描述',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `experimental` bit(1) DEFAULT b'0' COMMENT '是否是实验课（1是实验课，0是理论课）',
  `experiment_type` enum('app','ide','terminal') DEFAULT NULL COMMENT '实验类型（app，ide，terminal）',
  `video_url` varchar(500) DEFAULT NULL COMMENT '视频URL地址',
  `stack_id` varchar(60) DEFAULT NULL COMMENT '课程环境技术栈id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_course_id` (`course_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lesson_section`
--

DROP TABLE IF EXISTS `lesson_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lesson_section` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '课时小节ID',
  `course_id` int(11) DEFAULT NULL COMMENT '课程ID',
  `lesson_id` int(11) DEFAULT NULL COMMENT '课时ID',
  `index_in_lesson` int(11) DEFAULT NULL COMMENT '小节在课时中的序号',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `video_start_at` int(11) unsigned DEFAULT '0' COMMENT '视频开始时间',
  `video_end_at` int(11) unsigned DEFAULT '0' COMMENT '视频结束时间',
  `content` text COMMENT '课时小节内容',
  `content_html` text COMMENT '课时小节内容解析后的HTML',
  `content_json` text COMMENT '课时小节内容解析后的JSON',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_lesson_and_index` (`lesson_id`,`index_in_lesson`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `runtime`
--

DROP TABLE IF EXISTS `runtime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `runtime` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '资源ID',
  `type` varchar(255) DEFAULT NULL COMMENT '资源类型（app，ide，terminal）',
  `success` bit(1) DEFAULT b'0' COMMENT '资源创建是否完成（1是，0否）',
  `message` varchar(255) DEFAULT NULL COMMENT '资源创建结果信息',
  `started_at` datetime DEFAULT NULL COMMENT '资源创建开始时间',
  `finished_at` datetime DEFAULT NULL COMMENT '资源创建完成时间',
  `destroyed_at` datetime DEFAULT NULL COMMENT '资源销毁时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `runtime_config`
--

DROP TABLE IF EXISTS `runtime_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `runtime_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置参数ID',
  `configurable_type` varchar(255) DEFAULT NULL COMMENT '配置项类型（如lesson、section等）',
  `configurable_id` int(11) DEFAULT NULL COMMENT '配置项ID',
  `key` varchar(255) DEFAULT NULL COMMENT '配置名',
  `value` varchar(255) DEFAULT NULL COMMENT '配置值',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_configuration_type_and_id` (`configurable_type`,`configurable_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` varchar(40) DEFAULT NULL COMMENT '学生Id ,对应第三方库里的userID',
  `account` varchar(100) DEFAULT NULL COMMENT '学生账号',
  `student_name` varchar(40) DEFAULT NULL COMMENT '学生姓名',
  `nick_name` varchar(50) DEFAULT NULL COMMENT '昵称',
  `gender` varchar(1) DEFAULT NULL COMMENT 'M 男性 ，F女性',
  `tel` varchar(20) DEFAULT NULL COMMENT '电话号码',
  `mail` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `create_tm` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_tm` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `inx_uid` (`user_id`) USING BTREE COMMENT '学生id索引'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='学生表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `student_chapter`
--

DROP TABLE IF EXISTS `student_chapter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_chapter` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '关联记录ID',
  `user_id` varchar(40) DEFAULT NULL COMMENT '学生用户ID',
  `course_id` int(11) DEFAULT NULL COMMENT '课程ID',
  `chapter_id` int(11) DEFAULT NULL COMMENT 'chapter ID',
  `joined_at` datetime DEFAULT NULL COMMENT '参加学习本课时的时间',
  `last_access_at` datetime DEFAULT NULL COMMENT '上次学习本课时的时间',
  `study_time` int(11) DEFAULT NULL COMMENT '累计学习该章节的时间（秒）',
  `current_lesson_id` int(11) DEFAULT NULL COMMENT '当前学习到的课时lessonid',
  `finished` bit(1) DEFAULT NULL COMMENT '该课时是否已完成学习',
  `finished_at` datetime DEFAULT NULL COMMENT '该课时完成学习的时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_user_and_lesson` (`user_id`,`chapter_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `student_course`
--

DROP TABLE IF EXISTS `student_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_course` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '关联记录ID',
  `user_id` varchar(40) DEFAULT NULL COMMENT '学生用户ID',
  `course_id` int(11) DEFAULT NULL COMMENT '课程ID',
  `joined_at` datetime DEFAULT NULL COMMENT '参加学习课程的时间',
  `last_access_at` datetime DEFAULT NULL COMMENT '上次学习本课程的时间',
  `study_time` int(11) DEFAULT NULL COMMENT '累计学习该课程的时间（秒）',
  `current_lesson_id` int(11) DEFAULT NULL COMMENT '当前已学习到的课时ID',
  `finished_lesson_count` int(11) DEFAULT NULL COMMENT '已完成课时节数',
  `finished` bit(1) DEFAULT b'0' COMMENT '该课程是否已完成学习',
  `finished_at` datetime DEFAULT NULL COMMENT '该课程完成学习的时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_and_course` (`user_id`,`course_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `student_education`
--

DROP TABLE IF EXISTS `student_education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_education` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(40) DEFAULT NULL COMMENT '用户ID',
  `joined_at` datetime DEFAULT NULL COMMENT '加入教育平台时间',
  `study_time` int(11) DEFAULT NULL COMMENT '累计学习时长（秒）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `student_lesson`
--

DROP TABLE IF EXISTS `student_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_lesson` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '关联记录ID',
  `user_id` varchar(40) DEFAULT NULL COMMENT '学生用户ID',
  `lesson_id` int(11) DEFAULT NULL COMMENT '课时ID',
  `joined_at` datetime DEFAULT NULL COMMENT '参加学习本课时的时间',
  `last_access_at` datetime DEFAULT NULL COMMENT '上次学习本课时的时间',
  `study_time` int(11) DEFAULT NULL COMMENT '累计学习该课时的时间（秒）',
  `current_section_id` int(11) DEFAULT NULL COMMENT '当前学习到的课时小节ID',
  `finished` bit(1) DEFAULT NULL COMMENT '该课时是否已完成学习',
  `finished_at` datetime DEFAULT NULL COMMENT '该课时完成学习的时间',
  `runtime_id` int(11) DEFAULT NULL COMMENT '绑定的运行环境ID（runtime_id，临时解决方案）',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_and_lesson` (`user_id`,`lesson_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `student_lesson_section`
--

DROP TABLE IF EXISTS `student_lesson_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_lesson_section` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '关联记录ID',
  `user_id` varchar(40) DEFAULT NULL COMMENT '学生用户ID',
  `section_id` int(11) DEFAULT NULL COMMENT '课时小节ID',
  `started_at` datetime DEFAULT NULL COMMENT '开始学习时间',
  `finished` bit(1) DEFAULT b'0' COMMENT '该课时小节是否已完成学习',
  `finished_at` datetime DEFAULT NULL COMMENT '该课时小节完成学习时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_and_section` (`user_id`,`section_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '教师ID',
  `teacher_id` varchar(40) DEFAULT NULL COMMENT '教师ID，关联用户库里的user表',
  `account` varchar(100) DEFAULT NULL COMMENT '用户账号',
  `teacher_name` varchar(32) DEFAULT NULL COMMENT '教师姓名',
  `title` varchar(255) DEFAULT NULL COMMENT '职衔称号',
  `organization` varchar(255) DEFAULT NULL COMMENT '所属组织（学校，公司，单位等）',
  `introduction` varchar(255) DEFAULT NULL COMMENT '教师介绍',
  `avatar_url` varchar(500) DEFAULT NULL COMMENT '头像URL',
  `create_tm` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_tm` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `inx_teacher_id` (`teacher_id`) USING BTREE,
  KEY `inx_account` (`account`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teacher_class`
--

DROP TABLE IF EXISTS `teacher_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher_class` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `class_id` int(11) NOT NULL COMMENT '班级id',
  `teacher_id` varchar(40) NOT NULL COMMENT '老师id',
  `course_id` int(11) DEFAULT NULL COMMENT '课程ID',
  `create_tm` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_tm` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='班级与老师的关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teacher_lesson`
--

DROP TABLE IF EXISTS `teacher_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher_lesson` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '关联记录ID',
  `user_id` varchar(40) DEFAULT NULL COMMENT '老师用户ID',
  `class_id` int(11) DEFAULT NULL COMMENT '班级ID',
  `lesson_id` int(11) DEFAULT NULL COMMENT '课时ID',
  `joined_at` datetime DEFAULT NULL COMMENT '参加教谠本课时的时间',
  `last_access_at` datetime DEFAULT NULL COMMENT '上次教学本课时的时间',
  `teach_time` int(11) DEFAULT NULL COMMENT '累计教学该课时的时间（秒）',
  `current_section_id` int(11) DEFAULT NULL COMMENT '当前教学到的课时小节ID',
  `finished` bit(1) DEFAULT NULL COMMENT '该课时是否已完成教学',
  `finished_at` datetime DEFAULT NULL COMMENT '该课时完成教学的时间',
  `runtime_id` int(11) DEFAULT NULL COMMENT '绑定的运行环境ID（runtime_id，临时解决方案）',
  `create_tm` datetime DEFAULT NULL COMMENT '创建时间',
  `update_tm` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_and_lesson` (`user_id`,`lesson_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teacher_lesson_section`
--

DROP TABLE IF EXISTS `teacher_lesson_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher_lesson_section` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '关联记录ID',
  `user_id` varchar(40) DEFAULT NULL COMMENT '老师用户ID',
  `section_id` int(11) DEFAULT NULL COMMENT '课时小节ID',
  `started_at` datetime DEFAULT NULL COMMENT '开始教学时间',
  `finished` bit(1) DEFAULT b'0' COMMENT '该课时小节是否已完成教学',
  `finished_at` datetime DEFAULT NULL COMMENT '该课时小节完成教学时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_and_section` (`user_id`,`section_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_admin`
--

DROP TABLE IF EXISTS `user_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_id` varchar(40) DEFAULT NULL COMMENT '用户ID，关联用户库里的user表',
  `account` varchar(100) DEFAULT NULL COMMENT '用户账号',
  `user_name` varchar(32) DEFAULT NULL COMMENT '用户姓名',
  `title` varchar(255) DEFAULT NULL COMMENT '职衔称号',
  `organization` varchar(255) DEFAULT NULL COMMENT '所属组织（学校，公司，单位等）',
  `introduction` varchar(255) DEFAULT NULL COMMENT '教师介绍',
  `avatar_url` varchar(500) DEFAULT NULL COMMENT '头像URL',
  `create_tm` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_tm` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `inx_teacher_id` (`user_id`) USING BTREE,
  KEY `inx_account` (`account`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='管理后台管理人员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `service_test`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `service_test` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `service_test`;

--
-- Table structure for table `tb_api_log`
--

DROP TABLE IF EXISTS `tb_api_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_api_log` (
  `message_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `message` varchar(500) NOT NULL,
  `message_type` char(10) NOT NULL,
  `message_status` tinyint(2) NOT NULL,
  `error_message` varchar(200) DEFAULT NULL,
  `message_time` datetime DEFAULT NULL,
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='消息推送记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_case`
--

DROP TABLE IF EXISTS `tb_case`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_case` (
  `case_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `inter_id` int(11) unsigned NOT NULL,
  `user_id` varchar(40) NOT NULL,
  `user_name` varchar(40) DEFAULT '',
  `project_id` varchar(36) NOT NULL,
  `case_name` varchar(30) NOT NULL,
  `protocol` char(6) NOT NULL DEFAULT 'http' COMMENT '协议类型，http，https',
  `url` varchar(50) DEFAULT NULL,
  `type` char(6) NOT NULL DEFAULT 'post' COMMENT 'get，post，delete，put',
  `case_type` tinyint(3) unsigned DEFAULT '1' COMMENT '默认单用例，2为流程用例',
  `query_value` json DEFAULT NULL,
  `para_value` json DEFAULT NULL,
  `header` json DEFAULT NULL,
  `expect` varchar(1000) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `case_status` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`case_id`),
  KEY `Index 2` (`inter_id`),
  KEY `Index 3` (`project_id`,`user_id`),
  KEY `Index 4` (`case_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_case_step`
--

DROP TABLE IF EXISTS `tb_case_step`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_case_step` (
  `case_id` int(10) unsigned NOT NULL COMMENT '流程用例id',
  `step_id` int(10) unsigned NOT NULL COMMENT '测试步骤',
  `step_type` char(6) NOT NULL DEFAULT 'before' COMMENT '步骤类型。self本身，before前置步骤，after后置步骤'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='测试套件(单个用例与测试用例表一致)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_config`
--

DROP TABLE IF EXISTS `tb_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(40) NOT NULL DEFAULT '0',
  `project_id` varchar(40) NOT NULL DEFAULT '0',
  `project_name` varchar(40) DEFAULT '0',
  `app_namespace` varchar(40) NOT NULL DEFAULT '0',
  `app_desc` varchar(100) DEFAULT '0',
  `blueprint_id` varchar(40) NOT NULL DEFAULT '0',
  `blueprint_comment` varchar(100) NOT NULL DEFAULT '0',
  `component_id` varchar(40) DEFAULT '0',
  `component_name` varchar(100) DEFAULT '0',
  `com_namespace` varchar(100) DEFAULT '0',
  `host` varchar(100) DEFAULT '0',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uiq_app` (`app_namespace`,`blueprint_id`,`component_id`),
  KEY `index1` (`user_id`),
  KEY `index2` (`project_id`),
  KEY `Index 5` (`blueprint_id`),
  KEY `Index 6` (`component_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='发布应用推送表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_crontab`
--

DROP TABLE IF EXISTS `tb_crontab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_crontab` (
  `crontab_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` int(11) unsigned NOT NULL,
  `minite` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `hour` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `day` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mouth` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `week` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`crontab_id`),
  KEY `FK_tb_crontab_tb_user_task` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='定时任务';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_get_param`
--

DROP TABLE IF EXISTS `tb_get_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_get_param` (
  `get_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` varchar(36) NOT NULL,
  `task_id` int(11) unsigned DEFAULT NULL COMMENT 'task在执行的时候会有相同参数',
  `save_value` json DEFAULT NULL COMMENT '{"para1":"value1","para2":"value2"}',
  PRIMARY KEY (`get_id`),
  UNIQUE KEY `Index 2` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='变量保存表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_interface`
--

DROP TABLE IF EXISTS `tb_interface`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_interface` (
  `inter_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `api_id` char(32) NOT NULL DEFAULT '0' COMMENT '蓝图组件的api_id',
  `user_id` varchar(40) NOT NULL,
  `project_id` varchar(36) NOT NULL,
  `component_id` varchar(40) DEFAULT NULL,
  `host` varchar(50) DEFAULT '0' COMMENT '对外部api进行测试',
  `protocol` char(10) NOT NULL DEFAULT '0' COMMENT 'http/https/tcp',
  `url_name` varchar(30) NOT NULL,
  `url` varchar(50) DEFAULT NULL,
  `type` char(6) NOT NULL DEFAULT 'GET' COMMENT 'GET/POST/PUT/DELETE',
  `description` varchar(100) NOT NULL,
  `header` json DEFAULT NULL,
  `query` json DEFAULT NULL COMMENT 'query参数',
  `para` json DEFAULT NULL COMMENT 'body参数，以json格式存储',
  `response` json DEFAULT NULL,
  `inter_status` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`inter_id`),
  UNIQUE KEY `unique-key` (`api_id`,`project_id`,`component_id`),
  KEY `Index 4` (`url_name`),
  KEY `Index 5` (`url`),
  KEY `Index 3` (`user_id`,`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='接口表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_interface_config`
--

DROP TABLE IF EXISTS `tb_interface_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_interface_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `api_id` char(32) NOT NULL DEFAULT '0' COMMENT '蓝图组件的api_id',
  `user_id` varchar(40) NOT NULL,
  `project_id` varchar(36) NOT NULL,
  `protocol` char(10) NOT NULL DEFAULT '0' COMMENT 'http/https/tcp',
  `name` varchar(30) NOT NULL,
  `uri` varchar(50) DEFAULT NULL,
  `url_params` varchar(100) DEFAULT NULL,
  `method` char(6) NOT NULL DEFAULT 'GET' COMMENT 'GET/POST/PUT/DELETE',
  `content_type` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `description` varchar(100) NOT NULL,
  `headers` json DEFAULT NULL,
  `query_params` json DEFAULT NULL COMMENT 'query参数',
  `body_params` json DEFAULT NULL COMMENT 'body参数，以json格式存储',
  `response_params` json DEFAULT NULL,
  `body_params_text` varchar(100) DEFAULT '',
  `body_params_text_desc` varchar(100) DEFAULT '',
  `response_params_text_desc` varchar(100) DEFAULT '',
  `response_params_text` varchar(100) DEFAULT '',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index 2` (`api_id`),
  KEY `Index 3` (`user_id`,`project_id`),
  KEY `Index 4` (`name`),
  KEY `Index 5` (`uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='接口消息推送表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_log`
--

DROP TABLE IF EXISTS `tb_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_log` (
  `log_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `report_id` int(11) unsigned NOT NULL DEFAULT '0',
  `case_id` int(11) unsigned NOT NULL DEFAULT '0',
  `task_id` int(11) unsigned NOT NULL DEFAULT '0',
  `case_name` varchar(50) NOT NULL DEFAULT '0',
  `type` char(6) NOT NULL DEFAULT '0' COMMENT '枚举：GET，POST',
  `host` varchar(100) NOT NULL DEFAULT '0',
  `protocol` char(10) NOT NULL DEFAULT '0' COMMENT 'HTTP,HTTPS',
  `header` json DEFAULT NULL,
  `url` varchar(50) NOT NULL DEFAULT '0',
  `query_value` json DEFAULT NULL,
  `para_value` json DEFAULT NULL COMMENT '接口参数和值，json格式',
  `expect` varchar(1000) NOT NULL DEFAULT '0' COMMENT '预期结果【检查点】',
  `create_time` datetime NOT NULL,
  `res_time` float NOT NULL COMMENT '响应时间',
  `run_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否通过1-通过',
  `result` longtext NOT NULL COMMENT '响应结果',
  `code_status` smallint(6) NOT NULL DEFAULT '200' COMMENT 'http请求状态码',
  PRIMARY KEY (`log_id`),
  KEY `Index 2` (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_log_year`
--

DROP TABLE IF EXISTS `tb_log_year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_log_year` (
  `log_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `report_id` int(11) unsigned NOT NULL DEFAULT '0',
  `case_id` int(11) unsigned NOT NULL DEFAULT '0',
  `task_id` int(11) unsigned NOT NULL DEFAULT '0',
  `case_name` varchar(50) NOT NULL DEFAULT '0',
  `type` char(6) NOT NULL DEFAULT '0' COMMENT '枚举：GET,POST',
  `host` varchar(100) NOT NULL DEFAULT '0',
  `protocol` char(10) NOT NULL DEFAULT '0' COMMENT '枚举：HTTP,HTTPS',
  `url` varchar(50) NOT NULL DEFAULT '0',
  `expect` varchar(1000) NOT NULL DEFAULT '0' COMMENT '预期结果【检查点】',
  `create_time` datetime NOT NULL,
  `res_time` float NOT NULL COMMENT '响应时间',
  `run_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-false,1-true',
  `code_status` smallint(6) NOT NULL DEFAULT '200' COMMENT 'http请求状态码',
  KEY `Index 2` (`report_id`),
  KEY `FK_tb_log_year_tb_log` (`log_id`),
  CONSTRAINT `FK_tb_log_year_tb_log` FOREIGN KEY (`log_id`) REFERENCES `tb_log` (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='记录表，超过一年的数据自动删除';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_log_year_result`
--

DROP TABLE IF EXISTS `tb_log_year_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_log_year_result` (
  `log_id` int(11) unsigned DEFAULT NULL,
  `report_id` int(11) unsigned DEFAULT NULL,
  `header` json DEFAULT NULL,
  `query_value` json DEFAULT NULL,
  `para_value` json DEFAULT NULL,
  `result` mediumtext,
  KEY `Index 1` (`log_id`),
  KEY `Index 2` (`report_id`),
  CONSTRAINT `FK_tb_log_year_result_tb_log` FOREIGN KEY (`log_id`) REFERENCES `tb_log` (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='日志参数和结果大数据字段放在此表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_save_param`
--

DROP TABLE IF EXISTS `tb_save_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_save_param` (
  `save_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` varchar(40) NOT NULL,
  `param_name` varchar(40) NOT NULL,
  `case_id` int(11) unsigned NOT NULL COMMENT '哪个用例要保存参数',
  `param_des` char(6) NOT NULL DEFAULT 'text' COMMENT '参数来源text or header',
  `param_type` varchar(100) DEFAULT NULL COMMENT '{"type":string,"left":"","right":""}{"type":"json","json":"data.code"}',
  PRIMARY KEY (`save_id`),
  UNIQUE KEY `Index 2` (`project_id`,`param_name`),
  KEY `Index 3` (`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='提取变量表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_slave`
--

DROP TABLE IF EXISTS `tb_slave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_slave` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `namespace` varchar(40) NOT NULL,
  `component_id` varchar(40) NOT NULL COMMENT '组件标志',
  `cluster_id` varchar(40) NOT NULL COMMENT '集群标志',
  `cluster_des` varchar(40) NOT NULL,
  `dc_id` varchar(40) NOT NULL COMMENT '区域标志',
  `dc_des` varchar(30) NOT NULL,
  `host` varchar(60) NOT NULL COMMENT '服务名称',
  `slave_host` char(22) NOT NULL COMMENT 'slave 地址',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `index1` (`component_id`),
  KEY `namespace` (`namespace`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='发布时组件所在的ip地址';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_slave_config`
--

DROP TABLE IF EXISTS `tb_slave_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_slave_config` (
  `slave_host` char(20) DEFAULT NULL COMMENT '10.10.13.7:8080',
  `cluster_id` varchar(50) DEFAULT NULL,
  `cluster_des` varchar(50) DEFAULT NULL,
  `dc_id` varchar(50) DEFAULT NULL,
  `dc_des` varchar(50) DEFAULT NULL,
  `defalut` tinyint(4) DEFAULT NULL,
  KEY `cluster_id` (`cluster_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='发布位置、集群以及对应的slave 访问地址';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_task_case`
--

DROP TABLE IF EXISTS `tb_task_case`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_task_case` (
  `task_id` int(11) unsigned DEFAULT NULL,
  `case_id` int(11) unsigned DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `deploy_id` varchar(50) DEFAULT NULL,
  `deploy_des` varchar(100) DEFAULT NULL,
  UNIQUE KEY `Index 1` (`task_id`,`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='测试计划选择的用例';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_task_report`
--

DROP TABLE IF EXISTS `tb_task_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_task_report` (
  `report_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` int(11) unsigned DEFAULT NULL,
  `case_id` int(11) unsigned DEFAULT '0' COMMENT '单个用例执行时需要的id',
  `report_status` tinyint(3) unsigned DEFAULT '1' COMMENT '0失败，1成功',
  `create_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `run_time` float DEFAULT '0' COMMENT '任务运行时间',
  `deploy_id` varchar(50) DEFAULT NULL COMMENT '发布应用id',
  `deploy_des` varchar(100) DEFAULT NULL,
  `run_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '触发方式，0：手动触发，1自动触发，2定时任务触发',
  `run_user_id` varchar(40) DEFAULT '0',
  `run_user_name` varchar(40) DEFAULT '0',
  PRIMARY KEY (`report_id`),
  KEY `Index 2` (`deploy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='测试计划执行报告';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_test_type`
--

DROP TABLE IF EXISTS `tb_test_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_test_type` (
  `id` tinyint(3) unsigned NOT NULL COMMENT '测试类别标识',
  `name` char(10) NOT NULL DEFAULT 'auto' COMMENT '自动化测试',
  `comment` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='测试类别表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_user`
--

DROP TABLE IF EXISTS `tb_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `api_id` char(32) DEFAULT NULL,
  `user_id` varchar(40) NOT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `blueprint_id` varchar(100) DEFAULT NULL,
  `blueprint_des` varchar(100) DEFAULT NULL,
  `component_id` varchar(100) DEFAULT NULL,
  `component_des` varchar(100) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `Index 2` (`blueprint_id`),
  KEY `Index 3` (`api_id`),
  KEY `Index 4` (`component_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='测试用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_user_task`
--

DROP TABLE IF EXISTS `tb_user_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_user_task` (
  `task_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(40) NOT NULL DEFAULT '0',
  `user_name` varchar(40) NOT NULL DEFAULT '0' COMMENT '创建人的昵称',
  `project_id` varchar(40) NOT NULL DEFAULT '0',
  `task_name` varchar(50) NOT NULL DEFAULT '0',
  `task_type` varchar(10) NOT NULL DEFAULT 'auto' COMMENT 'unit,auto,safe,scanner,load',
  `email` varchar(50) NOT NULL DEFAULT '0',
  `notice_mode` varchar(10) NOT NULL DEFAULT 'only_false' COMMENT 'all,only_fals,no',
  `task_status` char(6) NOT NULL DEFAULT 'wait' COMMENT 'finish、stop、run、wait',
  `create_time` datetime DEFAULT NULL,
  `task_run_time` datetime DEFAULT NULL COMMENT '任务最新运行时间',
  `last_run_status` tinyint(4) DEFAULT NULL COMMENT '最后执行结果',
  PRIMARY KEY (`task_id`),
  KEY `Index 2` (`task_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='测试任务、计划表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `service_user`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `service_user` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `service_user`;

--
-- Table structure for table `dict_data`
--

DROP TABLE IF EXISTS `dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dict_data` (
  `data_type_code` varchar(20) NOT NULL,
  `data_code` varchar(50) NOT NULL,
  `data_name` varchar(100) NOT NULL,
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`data_type_code`,`data_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='数据字典';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dict_type`
--

DROP TABLE IF EXISTS `dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dict_type` (
  `type_code` varchar(20) NOT NULL,
  `type_name` varchar(100) NOT NULL,
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`type_code`) USING BTREE,
  UNIQUE KEY `type_code_UNIQUE` (`type_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='数据字典类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resource_front`
--

DROP TABLE IF EXISTS `resource_front`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_front` (
  `website` varchar(100) NOT NULL COMMENT '站点',
  `resource_code` varchar(40) NOT NULL COMMENT '资源标识',
  `resource_name` varchar(100) NOT NULL COMMENT '名称',
  `resource_type` varchar(10) NOT NULL COMMENT '资源类型：menu-菜单；function-功能按钮',
  `description` varchar(1000) DEFAULT NULL COMMENT '资源描述',
  `parent_code` varchar(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_no` int(11) NOT NULL COMMENT '排序编号',
  `set_up` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否可在页面配置 0-false  1-true',
  `user_id` varchar(40) NOT NULL,
  `create_time` datetime NOT NULL,
  `modify_user_id` varchar(40) NOT NULL,
  `modify_time` datetime NOT NULL,
  PRIMARY KEY (`website`,`resource_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resource_front_rest_relation`
--

DROP TABLE IF EXISTS `resource_front_rest_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_front_rest_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `website` varchar(100) NOT NULL,
  `resource_code` varchar(40) NOT NULL,
  `rest_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='菜单/按钮  与 后台api对应关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resource_rest`
--

DROP TABLE IF EXISTS `resource_rest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_rest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` varchar(30) NOT NULL COMMENT '微服务ID',
  `resource_name` varchar(100) NOT NULL COMMENT '资源名称，ApiOperation注解的value值',
  `pattern` varchar(100) NOT NULL DEFAULT '' COMMENT '微服务注解配置的访问地址',
  `pkg` varchar(50) DEFAULT NULL,
  `class_name` varchar(1000) DEFAULT NULL,
  `method` varchar(100) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL COMMENT '后端资源为ApiOperation的notes值',
  `is_limited` tinyint(1) NOT NULL DEFAULT '0' COMMENT '资源访问类型:\r\n0-false-公开资源，没有任务限制;\r\n1-true-指定具体用户访问',
  `operator_id` varchar(40) NOT NULL COMMENT '操作用户',
  `make_date` datetime NOT NULL COMMENT '维护时间',
  `modify_date` datetime NOT NULL COMMENT '修改时间',
  `permission` varchar(30) DEFAULT 'NULL' COMMENT '可访问角色',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pattern_index` (`pattern`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resource_rest_temp`
--

DROP TABLE IF EXISTS `resource_rest_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_rest_temp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` varchar(30) NOT NULL COMMENT '微服务ID',
  `resource_name` varchar(100) NOT NULL COMMENT '资源名称，ApiOperation注解的value值',
  `pattern` varchar(100) NOT NULL DEFAULT '' COMMENT '微服务注解配置的访问地址',
  `pkg` varchar(50) DEFAULT NULL,
  `class_name` varchar(1000) DEFAULT NULL,
  `method` varchar(100) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL COMMENT '后端资源为ApiOperation的notes值',
  `is_limited` tinyint(1) NOT NULL DEFAULT '0' COMMENT '资源访问类型:\r\n0-false-公开资源，没有任务限制;\r\n1-true-指定具体用户访问',
  `operator_id` varchar(40) NOT NULL COMMENT '操作用户',
  `make_date` datetime NOT NULL COMMENT '维护时间',
  `modify_date` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pattern_index` (`pattern`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `role_id` varchar(40) NOT NULL,
  `role_name` varchar(40) NOT NULL COMMENT '角色名称：user-普通用户, project_owner-项目拥有者, team_owner-团队拥有者',
  `role_type` varchar(1) NOT NULL COMMENT '类型：\r\ns-系统内置，不允许删除；p-项目层级角色；\r\nt-团队层级角色',
  `team_id` varchar(40) DEFAULT NULL,
  `project_id` varchar(40) DEFAULT NULL,
  `operator_id` varchar(40) NOT NULL,
  `make_date` datetime NOT NULL COMMENT '添加时间',
  `modify_date` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role_env`
--

DROP TABLE IF EXISTS `role_env`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_env` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` varchar(40) NOT NULL COMMENT '角色ID',
  `env_id` varchar(40) NOT NULL COMMENT '环境ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role_env_res_relation`
--

DROP TABLE IF EXISTS `role_env_res_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_env_res_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` varchar(40) DEFAULT NULL,
  `env_id` varchar(40) DEFAULT NULL COMMENT '0000=无环境对应',
  `resource_code` varchar(40) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `make_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role_resource_relation`
--

DROP TABLE IF EXISTS `role_resource_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_resource_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` varchar(40) NOT NULL,
  `website` varchar(100) NOT NULL,
  `resource_code` varchar(40) NOT NULL,
  `make_time` datetime NOT NULL COMMENT '维护时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=292 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='角色、资源关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequence`
--

DROP TABLE IF EXISTS `sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence` (
  `seq_name` varchar(20) NOT NULL COMMENT '序列名称',
  `current_value` int(11) NOT NULL COMMENT '当前值',
  `increment` int(11) NOT NULL DEFAULT '1' COMMENT '递增值',
  `remark` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`seq_name`) USING BTREE,
  UNIQUE KEY `seq_name_UNIQUE` (`seq_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='mysql不支持直接的sequence，创建一张table来模拟';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `team_id` varchar(40) NOT NULL,
  `team_name` varchar(200) NOT NULL COMMENT '团队名称',
  `status` varchar(1) NOT NULL COMMENT '状态：0-有效，1-owner解散，2-管理员删除',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `creator` varchar(40) NOT NULL COMMENT '创建人',
  `update_time` date NOT NULL,
  `update_user` varchar(40) NOT NULL,
  `transfer_time` datetime NOT NULL COMMENT '拥有者最后变更时间',
  `owner` varchar(40) NOT NULL COMMENT '所有人，默认为创建者，但可转移',
  `support_admin` tinyint(1) DEFAULT '0' COMMENT '临时标识：1-团队成员支持查看运维系统；',
  `invite_time` datetime DEFAULT NULL COMMENT '生成邀请链接的时间',
  `invite_user` varchar(40) DEFAULT NULL COMMENT '生成邀请链接的用户',
  `invite_code` varchar(40) DEFAULT NULL COMMENT '邀请码',
  PRIMARY KEY (`team_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='团队表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `team_invite`
--

DROP TABLE IF EXISTS `team_invite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_invite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_id` varchar(40) DEFAULT NULL,
  `invite_code` varchar(10) DEFAULT NULL COMMENT '邀请码信息',
  `type` varchar(10) DEFAULT NULL COMMENT '邀请码类型   email-邮件 ;  link-页面显示',
  `email` varchar(255) DEFAULT NULL COMMENT '发送邮箱地址; 如果type是email, 此处不为空',
  `encrypt` varchar(1000) DEFAULT NULL COMMENT '加密之后的字符串',
  `create_user_id` varchar(40) DEFAULT NULL COMMENT '生成邀请链接的用户ID',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(5) DEFAULT NULL COMMENT '0-失效, 1-有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` varchar(40) NOT NULL COMMENT '用户唯一标识',
  `user_code` varchar(20) DEFAULT NULL COMMENT '非空时唯一，可作为登录名使用',
  `user_mobile` varchar(11) DEFAULT NULL COMMENT '注册电话号码，可在账户设置中调整',
  `nickname` varchar(40) DEFAULT '' COMMENT '用户昵称',
  `user_email` varchar(100) DEFAULT '' COMMENT '非空时唯一，可作为登录名使用',
  `user_password` varchar(400) DEFAULT NULL,
  `user_state` varchar(2) DEFAULT NULL COMMENT '用户状态：\r\n-1-待激活，0-有效，可正常登录；\r\n1-失效，管理后台可直接设置，限制用户使用平台；\r\n2-已锁，如连续三次登录失败后锁住账户；',
  `user_type` varchar(10) DEFAULT NULL COMMENT '用户类型',
  `register_date` datetime NOT NULL COMMENT '注册时间',
  `modify_date` datetime NOT NULL COMMENT '更新时间',
  `source` varchar(10) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL COMMENT '默认头像类别',
  `icon_url` varchar(255) DEFAULT NULL COMMENT '自定义头像url',
  `channel` varchar(200) DEFAULT 'NULL' COMMENT '注册渠道',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_github`
--

DROP TABLE IF EXISTS `user_github`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_github` (
  `user_id` varchar(40) NOT NULL COMMENT '用户 ID',
  `github_id` varchar(40) NOT NULL COMMENT 'Github 用户ID',
  `access_token` varchar(255) DEFAULT NULL COMMENT '接口调用凭证',
  `token_type` varchar(50) DEFAULT NULL COMMENT '凭证类型',
  `scope` varchar(255) DEFAULT NULL COMMENT '用户凭证作用域; 用逗号(,)分隔',
  `account` varchar(255) DEFAULT NULL COMMENT 'Github 用户账号',
  `nickname` varchar(255) DEFAULT NULL COMMENT 'Github 用户昵称',
  `email` varchar(40) DEFAULT NULL COMMENT 'Github 用户邮箱',
  `avatar_url` varchar(255) DEFAULT NULL COMMENT 'Github 用户头像url',
  `location` varchar(255) DEFAULT NULL COMMENT 'Github 用户位置',
  `company` varchar(255) DEFAULT NULL COMMENT 'Github 用户公司',
  `github_bio` blob COMMENT 'Github 用户简介',
  `private_key` longblob COMMENT 'Github 私钥 存储在平台中',
  `public_key` longblob COMMENT 'Github 公钥 发布到用户的public_key中\n',
  `public_key_id` varchar(40) DEFAULT NULL COMMENT 'Github 部署公钥的ID',
  `github_created_at` datetime DEFAULT NULL COMMENT '用户在Github注册的时间\n',
  `github_updated_at` datetime DEFAULT NULL COMMENT '用户在Github更新资料的时间',
  `userinfo_created_at` datetime DEFAULT NULL COMMENT '用户信息存储在平台的时间',
  `userinfo_updated_at` datetime DEFAULT NULL COMMENT '用户信息在平台被更新的时间',
  PRIMARY KEY (`github_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='Github 用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_invite_code`
--

DROP TABLE IF EXISTS `user_invite_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_invite_code` (
  `invited_code` varchar(10) NOT NULL COMMENT '邀请码',
  `status` varchar(1) NOT NULL COMMENT '是否有效:0-有效,1-失效',
  `user_id` varchar(40) DEFAULT NULL COMMENT '使用用户id',
  `create_date` datetime NOT NULL COMMENT '维护时间',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `specialty` varchar(255) DEFAULT NULL COMMENT '专业/职业',
  `native_place` varchar(255) DEFAULT NULL COMMENT '籍贯',
  `politics_status` varchar(255) DEFAULT NULL COMMENT '政治面貌',
  `school` varchar(255) DEFAULT NULL COMMENT '学校/企业',
  `assign_name` varchar(255) DEFAULT NULL COMMENT '邀请用户',
  `distribution_date` datetime DEFAULT NULL COMMENT '发放时间',
  `nation` varchar(255) DEFAULT NULL COMMENT '民族',
  `remark` longblob COMMENT '备注信息',
  `sex` varchar(255) DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL,
  `graduation_date` varchar(255) DEFAULT NULL COMMENT '毕业时间',
  `update_user_id` varchar(40) DEFAULT NULL COMMENT '修改用户ID',
  `channel` varchar(255) DEFAULT NULL COMMENT '发送渠道',
  `activate_date` datetime DEFAULT NULL COMMENT '激活时间',
  `mobile` varchar(255) DEFAULT NULL COMMENT '邀请用户手机',
  `email` varchar(255) DEFAULT NULL COMMENT '邀请用户邮箱',
  PRIMARY KEY (`invited_code`) USING BTREE,
  UNIQUE KEY `invited_code_UNIQUE` (`invited_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='邀请码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_ldap`
--

DROP TABLE IF EXISTS `user_ldap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_ldap` (
  `user_id` varchar(40) NOT NULL COMMENT '平台用户ID',
  `ldap_id` varchar(255) NOT NULL COMMENT 'LDAP ID',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ldap_id`) USING BTREE,
  UNIQUE KEY `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='LDAP 用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_login_trace`
--

DROP TABLE IF EXISTS `user_login_trace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_login_trace` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(40) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `login_type` varchar(100) NOT NULL COMMENT '登录类型：\nmobile - 手机号登录\nemail - 邮箱登录\n\n注册成功时的自动登录按手机号记录一次。',
  `login_ip` varchar(1000) NOT NULL,
  `login_date` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_project_resource_relation`
--

DROP TABLE IF EXISTS `user_project_resource_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_project_resource_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(40) NOT NULL COMMENT '用户ID',
  `project_id` varchar(40) DEFAULT NULL COMMENT '项目ID',
  `website` varchar(100) DEFAULT NULL COMMENT '站点',
  `resource_code` varchar(40) DEFAULT NULL COMMENT '资源标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` varchar(40) NOT NULL,
  `user_id` varchar(40) NOT NULL,
  `project_id` varchar(40) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_tag`
--

DROP TABLE IF EXISTS `user_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_tag` (
  `user_id` varchar(30) DEFAULT NULL COMMENT '用户ID',
  `tag` varchar(100) DEFAULT NULL COMMENT '标签. | 内部用户: cloudtogo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户标签表\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_team`
--

DROP TABLE IF EXISTS `user_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_team` (
  `user_id` varchar(40) NOT NULL,
  `team_id` varchar(40) NOT NULL,
  `make_time` datetime NOT NULL,
  PRIMARY KEY (`user_id`,`team_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户、团队关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_weixin`
--

DROP TABLE IF EXISTS `user_weixin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_weixin` (
  `user_id` varchar(40) NOT NULL,
  `open_id` varchar(40) NOT NULL COMMENT '普通用户的标识，对当前开发者帐号唯一',
  `unionid` varchar(40) DEFAULT NULL COMMENT '当且仅当该网站应用已获得该用户的userinfo授权时，才会出现该字段。',
  `scope` varchar(255) DEFAULT NULL COMMENT '用户授权的作用域，使用逗号（,）分隔',
  `access_token` varchar(255) DEFAULT NULL COMMENT '接口调用凭证',
  `expires_in` int(11) DEFAULT NULL COMMENT 'access_token接口调用凭证超时时间，单位（秒）',
  `refresh_token` varchar(255) DEFAULT NULL COMMENT '用户刷新access_token',
  `access_token_start_time` datetime DEFAULT NULL,
  `access_token_end_time` datetime DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL COMMENT '普通用户昵称',
  `sex` varchar(1) DEFAULT NULL COMMENT '普通用户性别，1为男性，2为女性',
  `province` varchar(255) DEFAULT NULL COMMENT '普通用户个人资料填写的省份',
  `city` varchar(255) DEFAULT NULL COMMENT '普通用户个人资料填写的城市',
  `country` varchar(255) DEFAULT NULL COMMENT '国家，如中国为CN',
  `headimgurl` varchar(255) DEFAULT NULL COMMENT '用户头像，最后一个数值代表正方形头像大小（有0、46、64、96、132数值可选，0代表640*640正方形头像），用户没有头像时该项为空',
  `privilege` blob COMMENT '用户特权信息，json数组，如微信沃卡用户为（chinaunicom）',
  `userinfo_start_time` datetime DEFAULT NULL,
  `userinfo_end_time` datetime DEFAULT NULL,
  PRIMARY KEY (`open_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `service_volume`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `service_volume` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `service_volume`;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumes` (
  `id` varchar(40) NOT NULL COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '显示名称',
  `type` varchar(10) NOT NULL DEFAULT 'nfs' COMMENT '类型  nfs ; glusterfs ',
  `capacity` bigint(30) NOT NULL DEFAULT '1' COMMENT '容量   单位 byte ',
  `volume_name` varchar(400) NOT NULL COMMENT 'volume 名称; 针对glusterfs类型的卷信息',
  `is_del` varchar(5) NOT NULL DEFAULT 'no' COMMENT 'yes - 已删除 ;   no - 未删除',
  `org` varchar(10) NOT NULL DEFAULT 'factory' COMMENT '来源   factory-工厂; ide-cloudIDE ; mart-商店',
  `ownership` varchar(40) NOT NULL COMMENT '所有权: 应用工厂:项目ID  应用商店: 子订单ID',
  `nasip` varchar(200) NOT NULL DEFAULT '',
  `naspath` varchar(1000) NOT NULL DEFAULT '',
  `options` varchar(1000) NOT NULL DEFAULT '',
  `user_id` varchar(40) NOT NULL COMMENT '操作用户ID',
  `del_user_id` varchar(40) NOT NULL COMMENT '删除 用户ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `service_weixin`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `service_weixin` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `service_weixin`;

--
-- Table structure for table `user_weixin`
--

DROP TABLE IF EXISTS `user_weixin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_weixin` (
  `open_id` varchar(255) NOT NULL COMMENT '普通用户的标识，对当前开发者帐号唯一',
  `union_id` varchar(255) DEFAULT NULL COMMENT '当且仅当该网站应用已获得该用户的userinfo授权时，才会出现该字段。',
  `session_key` varchar(255) DEFAULT NULL COMMENT '微信小程序使用code换取的sessionKey, 仅当微信小程序登录时不为空',
  `scope` varchar(255) DEFAULT NULL COMMENT '用户授权的作用域，使用逗号（,）分隔',
  `access_token` varchar(255) DEFAULT NULL COMMENT '接口调用凭证',
  `expires_in` int(11) DEFAULT NULL COMMENT 'access_token接口调用凭证超时时间，单位（秒）',
  `refresh_token` varchar(255) DEFAULT NULL COMMENT '用户刷新access_token',
  `access_token_start_time` datetime DEFAULT NULL,
  `access_token_end_time` datetime DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL COMMENT '普通用户昵称',
  `sex` varchar(1) DEFAULT NULL COMMENT '普通用户性别，1为男性，2为女性',
  `province` varchar(255) DEFAULT NULL COMMENT '普通用户个人资料填写的省份',
  `city` varchar(255) DEFAULT NULL COMMENT '普通用户个人资料填写的城市',
  `country` varchar(255) DEFAULT NULL COMMENT '国家，如中国为CN',
  `headimgurl` varchar(255) DEFAULT NULL COMMENT '用户头像，最后一个数值代表正方形头像大小（有0、46、64、96、132数值可选，0代表640*640正方形头像），用户没有头像时该项为空',
  `privilege` blob COMMENT '用户特权信息，json数组，如微信沃卡用户为（chinaunicom）',
  `userinfo_start_time` datetime DEFAULT NULL,
  `userinfo_end_time` datetime DEFAULT NULL,
  `register_time` datetime DEFAULT NULL COMMENT '注册时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `channel` varchar(100) DEFAULT NULL COMMENT '登录渠道 (ex: 扫码登录、微信公众号登录、小程序登录)',
  PRIMARY KEY (`open_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='微信用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_weixin_relation`
--

DROP TABLE IF EXISTS `user_weixin_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_weixin_relation` (
  `union_id` varchar(255) NOT NULL COMMENT '微信平台统一用户ID',
  `user_id` varchar(255) DEFAULT NULL COMMENT '平台用户ID',
  `create_time` datetime DEFAULT NULL COMMENT '关系创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '关系更新时间',
  PRIMARY KEY (`union_id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='微信用户与平台用户绑定关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `weixin_message_template`
--

DROP TABLE IF EXISTS `weixin_message_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weixin_message_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(255) DEFAULT NULL COMMENT '业务系统中的模板名称，命名格式："系统.行为.模板描述"',
  `default_to_user` varchar(2000) DEFAULT NULL COMMENT '模板的默认接收人的OpenID（多个收信人以逗号分隔，例如："xxx, aaa, ccc"）',
  `weixin_template_id` varchar(255) DEFAULT NULL COMMENT '微信模板消息的模板ID',
  `weixin_template_content` varchar(500) DEFAULT NULL COMMENT '微信模板消息的模板内容',
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '添加模板信息时间',
  PRIMARY KEY (`id`),
  KEY `idx_template_name` (`template_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `blueprint`
--

USE `blueprint`;

--
-- Final view structure for view `v_bp`
--

/*!50001 DROP VIEW IF EXISTS `v_bp`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`blueprint`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_bp` AS select (case when (`blueprint`.`_id` is not null) then `blueprint`.`_id` else `blueprint`.`id` end) AS `id`,`blueprint`.`name` AS `name`,`blueprint`.`user` AS `user`,`blueprint`.`icon` AS `icon`,`blueprint`.`topo` AS `topo`,`blueprint`.`yaml` AS `yaml`,`blueprint`.`custom_editor` AS `custom_editor`,`blueprint`.`is_model` AS `is_model`,`blueprint`.`note` AS `note`,`blueprint`.`biz_type` AS `biz_type` from `blueprint` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Current Database: `mysql`
--

USE `mysql`;

--
-- Current Database: `service_code`
--

USE `service_code`;

--
-- Current Database: `service_composer`
--

USE `service_composer`;

--
-- Current Database: `service_cron`
--

USE `service_cron`;

--
-- Current Database: `service_domain`
--

USE `service_domain`;

--
-- Current Database: `service_email`
--

USE `service_email`;

--
-- Current Database: `service_factory`
--

USE `service_factory`;

--
-- Current Database: `service_ide`
--

USE `service_ide`;

--
-- Current Database: `service_mart`
--

USE `service_mart`;

--
-- Current Database: `service_monitor`
--

USE `service_monitor`;

--
-- Current Database: `service_notify`
--

USE `service_notify`;

--
-- Current Database: `service_pipeline`
--

USE `service_pipeline`;

--
-- Current Database: `service_registry`
--

USE `service_registry`;

--
-- Current Database: `service_sms`
--

USE `service_sms`;

--
-- Current Database: `service_study`
--

USE `service_study`;

--
-- Current Database: `service_test`
--

USE `service_test`;

--
-- Current Database: `service_user`
--

USE `service_user`;

--
-- Current Database: `service_volume`
--

USE `service_volume`;

--
-- Current Database: `service_weixin`
--

USE `service_weixin`;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-03  8:17:13

/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2012-12-04 14:52:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `invheader`
-- ----------------------------
DROP TABLE IF EXISTS `invheader`;
CREATE TABLE `invheader` (
  `invid` int(11) NOT NULL default '0',
  `invdate` datetime default NULL,
  `name` varchar(255) default NULL,
  `amount` double default NULL,
  `tax` double default NULL,
  `total` double default NULL,
  `note` varchar(255) default NULL,
  PRIMARY KEY  (`invid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of invheader
-- ----------------------------
INSERT INTO `invheader` VALUES ('1', '2012-11-30 11:49:51', 'Client 1', '100', '11', '100', 'no tax');
INSERT INTO `invheader` VALUES ('2', '2012-11-30 10:28:48', 'Client 2', '150', '22', '150', 'no tax at all');
INSERT INTO `invheader` VALUES ('3', '2012-11-30 10:41:39', 'Client 3', '50', '20', '70', null);
INSERT INTO `invheader` VALUES ('4', '2012-11-30 10:42:26', 'Client 4', '120', '10', '130', null);
INSERT INTO `invheader` VALUES ('5', '2012-11-30 10:41:39', 'Client 5', '50', '20', '70', null);
INSERT INTO `invheader` VALUES ('6', '2012-11-30 10:42:26', 'Client 6', '120', null, '120', null);
INSERT INTO `invheader` VALUES ('7', '2012-11-30 10:41:39', 'Client 7', '50', '20', '70', null);
INSERT INTO `invheader` VALUES ('8', '2012-11-30 10:42:26', 'Client 8', '120', null, '120', null);
INSERT INTO `invheader` VALUES ('9', '2012-11-30 10:41:39', 'Client 9', '50', '20', '70', null);
INSERT INTO `invheader` VALUES ('10', '2012-11-30 10:42:26', 'Client 10', '120', null, '120', null);
INSERT INTO `invheader` VALUES ('11', '2012-11-30 10:41:39', 'Client 11', '50', '20', '70', null);
INSERT INTO `invheader` VALUES ('12', '2012-11-30 10:42:26', 'Client 12', '120', null, '120', null);
INSERT INTO `invheader` VALUES ('13', '2012-11-30 10:41:39', 'Client 13', '50', '20', '70', null);
INSERT INTO `invheader` VALUES ('14', '2012-11-30 10:42:26', 'Client 14', '120', null, '120', null);

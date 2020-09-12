/*
 Navicat Premium Data Transfer

 Source Server         : conn
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : kopfood

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 12/09/2020 22:53:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbshop
-- ----------------------------
DROP TABLE IF EXISTS `tbshop`;
CREATE TABLE `tbshop`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_shop` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address_shop` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `phone_shop` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lat_shop` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `long_shop` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbshop
-- ----------------------------

-- ----------------------------
-- Table structure for tbuser
-- ----------------------------
DROP TABLE IF EXISTS `tbuser`;
CREATE TABLE `tbuser`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `choosetype` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `myname` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `myuser` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mypassword` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbuser
-- ----------------------------
INSERT INTO `tbuser` VALUES (1, 'User', 'chawarit', 'kop', '12345');
INSERT INTO `tbuser` VALUES (2, 'User', 'chawarit', 'test', 'tttt');
INSERT INTO `tbuser` VALUES (3, 'Raider', 'tttttt', 'tttttt', 'ttttt');
INSERT INTO `tbuser` VALUES (4, 'Raider', 'tttttt', 'tttttt', 'ttttt');
INSERT INTO `tbuser` VALUES (5, 'User', 'tttttt', 'tttt', 'ttttt');
INSERT INTO `tbuser` VALUES (6, 'Raider', 'ttt', 'ttt', 'ttt');
INSERT INTO `tbuser` VALUES (7, 'User', 'ttt', 'ttt', 'tttttt');
INSERT INTO `tbuser` VALUES (8, 'User', 'ttt', 'ttt', 'ttt4');
INSERT INTO `tbuser` VALUES (9, 'Raider', 'aaa', 'kop2', '12345');
INSERT INTO `tbuser` VALUES (10, 'User', 'ttt', 'ttt', 'ttt');
INSERT INTO `tbuser` VALUES (11, 'Shop', 'ttt', 'kop1', '12345');
INSERT INTO `tbuser` VALUES (12, 'Shop', 'ttt', 'ttt', 'ttt');

SET FOREIGN_KEY_CHECKS = 1;

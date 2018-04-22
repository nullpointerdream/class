/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50541
Source Host           : localhost:3306
Source Database       : class

Target Server Type    : MYSQL
Target Server Version : 50541
File Encoding         : 65001

Date: 2018-04-22 08:56:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for leave
-- ----------------------------
DROP TABLE IF EXISTS `leave`;
CREATE TABLE `leave` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stuname` varchar(255) DEFAULT NULL,
  `stuid` varchar(255) DEFAULT NULL,
  `stureson` varchar(255) DEFAULT NULL,
  `sturaddr` varchar(255) DEFAULT NULL,
  `stutel` varchar(255) DEFAULT NULL,
  `stuparetel` varchar(255) DEFAULT NULL,
  `starttime` varchar(255) DEFAULT NULL,
  `returntel` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of leave
-- ----------------------------
INSERT INTO `leave` VALUES ('4', '成功', '51125', '奶奶80大寿', '北京', '12315', '12324', '2018-04-26', '2018-04-29');

-- ----------------------------
-- Table structure for stu
-- ----------------------------
DROP TABLE IF EXISTS `stu`;
CREATE TABLE `stu` (
  `id` int(11) DEFAULT NULL,
  `stuName` varchar(255) DEFAULT NULL,
  `stuMajor` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `stuAge` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stu
-- ----------------------------
INSERT INTO `stu` VALUES ('1', '1', '1', '1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `stuName` varchar(255) DEFAULT NULL,
  `stuAge` int(11) DEFAULT NULL,
  `stuSex` varchar(255) DEFAULT NULL,
  `stuId` varchar(255) DEFAULT NULL,
  `stuTel` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `stuMajor` varchar(255) DEFAULT NULL,
  `stuAddr` varchar(255) DEFAULT NULL,
  `stuJob` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4235 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'www', '123', '张三', '0', '男', '51125', '124323', '1', '软件工程14-01', '北京', '学生', 'b.jpg');
INSERT INTO `user` VALUES ('2', 'eee', '123', '李四', '0', '女', '4234', '123415', '1', '软件工程', '北京', '班长', null);
INSERT INTO `user` VALUES ('3', 'rrr', '123', '王五', null, null, '4234', null, null, '软件工程', '上海', '学生', null);
INSERT INTO `user` VALUES ('4', null, null, '陈安慰', '0', null, '4234', '123415', null, '软件工程', '江苏', '班长', null);
INSERT INTO `user` VALUES ('5', null, null, '李切', '0', null, '4234', '1243', null, '软件工程', '安徽', '学习委员', null);
INSERT INTO `user` VALUES ('6', null, null, '成功', '0', null, '4234', '12315', null, '软件工程', null, '团支书', null);
INSERT INTO `user` VALUES ('8', null, null, '打完', '0', null, '4234', '124323', null, '软件工程', null, '班长', null);
INSERT INTO `user` VALUES ('9', null, null, null, null, null, '4234', null, null, '软件工程', null, '班长', null);
INSERT INTO `user` VALUES ('10', null, null, null, null, null, '4234', null, null, '软件工程', null, '班长', null);
INSERT INTO `user` VALUES ('11', null, null, null, null, null, '4234', null, null, '软件工程', null, '班长', null);
INSERT INTO `user` VALUES ('13', 'syh', '123', 'SYH', '0', '1', '201413040', '18382256432', '1', '软件工程', '四川', null, null);
INSERT INTO `user` VALUES ('4234', '4234', '4234', '4234', '4234', '4234', '4234', '4234', '1', '4234', '4234', '班长', '4234');

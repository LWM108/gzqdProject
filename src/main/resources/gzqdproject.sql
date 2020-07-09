/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : gzqdproject

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2020-07-09 19:09:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tbl_dept
-- ----------------------------
DROP TABLE IF EXISTS `tbl_dept`;
CREATE TABLE `tbl_dept` (
  `dep_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `dep_name` varchar(255) NOT NULL COMMENT '部门名',
  PRIMARY KEY (`dep_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='部门表与员工表 有外键关联';

-- ----------------------------
-- Records of tbl_dept
-- ----------------------------
INSERT INTO `tbl_dept` VALUES ('1', '开发部');
INSERT INTO `tbl_dept` VALUES ('2', '测试部');

-- ----------------------------
-- Table structure for tbl_emp
-- ----------------------------
DROP TABLE IF EXISTS `tbl_emp`;
CREATE TABLE `tbl_emp` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '员工id',
  `emp_name` varchar(255) NOT NULL COMMENT '员工姓名',
  `gender` char(1) DEFAULT NULL COMMENT '员工性别：MF男女',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `d_id` int(11) DEFAULT NULL COMMENT '关联部门表的外键id',
  PRIMARY KEY (`emp_id`),
  KEY `emp_with_emp` (`d_id`),
  CONSTRAINT `emp_with_emp` FOREIGN KEY (`d_id`) REFERENCES `tbl_dept` (`dep_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1050 DEFAULT CHARSET=utf8 COMMENT='员工表 与部门表有外键关联';

-- ----------------------------
-- Records of tbl_emp
-- ----------------------------
INSERT INTO `tbl_emp` VALUES ('1015', '张三', 'F', '946249562@qq.com', '2');
INSERT INTO `tbl_emp` VALUES ('1016', '张三分', 'M', '6249562@qq.com', '1');
INSERT INTO `tbl_emp` VALUES ('1020', 'd88c91', 'M', 'd88c91@qq.com', '1');
INSERT INTO `tbl_emp` VALUES ('1022', 'bd3433', 'M', 'bd3433@qq.com', '1');
INSERT INTO `tbl_emp` VALUES ('1023', 'cb4bb4', 'M', 'cb4bb4@qq.com', '1');
INSERT INTO `tbl_emp` VALUES ('1024', 'cb6925', 'M', 'cb6925@qq.com', '1');
INSERT INTO `tbl_emp` VALUES ('1025', '9ad846', 'M', '9ad846@qq.com', '1');
INSERT INTO `tbl_emp` VALUES ('1026', '339027', 'M', '339027@qq.com', '1');
INSERT INTO `tbl_emp` VALUES ('1027', '9b0bb8', 'M', '9b0bb8@qq.com', '1');
INSERT INTO `tbl_emp` VALUES ('1028', 'efe999', 'M', 'efe999@qq.com', '1');
INSERT INTO `tbl_emp` VALUES ('1029', 'b21d210', 'M', 'b21d210@qq.com', '1');
INSERT INTO `tbl_emp` VALUES ('1030', '835f911', 'M', '835f911@qq.com', '1');
INSERT INTO `tbl_emp` VALUES ('1031', '7fd7912', 'M', '7fd7912@qq.com', '1');
INSERT INTO `tbl_emp` VALUES ('1032', 'b0fa313', 'M', 'b0fa313@qq.com', '1');
INSERT INTO `tbl_emp` VALUES ('1033', 'ea29e14', 'M', 'ea29e14@qq.com', '1');
INSERT INTO `tbl_emp` VALUES ('1034', '41b5815', 'M', '41b5815@qq.com', '1');
INSERT INTO `tbl_emp` VALUES ('1035', '66a3816', 'M', '66a3816@qq.com', '1');
INSERT INTO `tbl_emp` VALUES ('1036', '9615817', 'M', '9615817@qq.com', '1');
INSERT INTO `tbl_emp` VALUES ('1037', 'c4f0a18', 'M', 'c4f0a18@qq.com', '1');
INSERT INTO `tbl_emp` VALUES ('1038', 'c08fe19', 'M', 'c08fe19@qq.com', '1');
INSERT INTO `tbl_emp` VALUES ('1039', '85edc20', 'M', '85edc20@qq.com', '1');
INSERT INTO `tbl_emp` VALUES ('1040', 'b5a7421', 'M', 'b5a7421@qq.com', '1');
INSERT INTO `tbl_emp` VALUES ('1041', '9be2922', 'M', '9be2922@qq.com', '1');
INSERT INTO `tbl_emp` VALUES ('1042', '70c8823', 'M', '70c8823@qq.com', '1');
INSERT INTO `tbl_emp` VALUES ('1043', 'aac3f24', 'M', 'aac3f24@qq.com', '1');
INSERT INTO `tbl_emp` VALUES ('1044', '631e425', 'M', '631e425@qq.com', '1');
INSERT INTO `tbl_emp` VALUES ('1045', '196b326', 'M', '196b326@qq.com', '1');
INSERT INTO `tbl_emp` VALUES ('1046', '5882227', 'M', '5882227@qq.com', '1');
INSERT INTO `tbl_emp` VALUES ('1047', 'bdb7828', 'M', 'bdb7828@qq.com', '1');
INSERT INTO `tbl_emp` VALUES ('1048', '61f9129', 'M', '61f9129@qq.com', '1');
INSERT INTO `tbl_emp` VALUES ('1049', '王菲', 'F', '49562@qq.com', '2');

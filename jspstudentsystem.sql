/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : localhost:3306
 Source Schema         : jspstudentsystem

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 07/12/2020 18:07:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for administrator_info
-- ----------------------------
DROP TABLE IF EXISTS `administrator_info`;
CREATE TABLE `administrator_info`  (
  `manageId` int(11) NOT NULL,
  `name` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` enum('男','女') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthday` date NULL DEFAULT NULL,
  `phone` bigint(20) NULL DEFAULT NULL,
  `avatar` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`manageId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of administrator_info
-- ----------------------------
INSERT INTO `administrator_info` VALUES (1001, '马保国', '男', '1951-04-06', 17656561156, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1606674252249&di=6d64e5e37d8998b5491240a7f35cd9c6&imgtype=0&src=http%3A%2F%2Fww2.sinaimg.cn%2Fmw690%2F005PeXV6gy1gkq2o9jasvj30uw0usgyq.jpg');

-- ----------------------------
-- Table structure for class_info
-- ----------------------------
DROP TABLE IF EXISTS `class_info`;
CREATE TABLE `class_info`  (
  `class_name` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `major` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `total_person` tinyint(4) NULL DEFAULT NULL COMMENT '总人数',
  `join_year` date NULL DEFAULT '2018-09-10' COMMENT '入学年份',
  `counselor` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '辅导员',
  `class_id` bigint(11) NOT NULL COMMENT '班级号',
  PRIMARY KEY (`class_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of class_info
-- ----------------------------
INSERT INTO `class_info` VALUES ('软工三班', '软件工程', 32, '2018-09-04', '童老师', 5183002643);

-- ----------------------------
-- Table structure for course_chart
-- ----------------------------
DROP TABLE IF EXISTS `course_chart`;
CREATE TABLE `course_chart`  (
  `plan_id` int(11) NOT NULL COMMENT '排课id',
  `cno` int(11) NULL DEFAULT NULL,
  `class_id` bigint(11) NULL DEFAULT NULL COMMENT '班级号',
  `teacher` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授课日期',
  `address` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地点',
  PRIMARY KEY (`plan_id`) USING BTREE,
  INDEX `class_id`(`class_id`) USING BTREE,
  INDEX `cno`(`cno`) USING BTREE,
  CONSTRAINT `course_chart_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `class_info` (`class_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `course_chart_ibfk_3` FOREIGN KEY (`cno`) REFERENCES `course_info` (`cno`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course_chart
-- ----------------------------
INSERT INTO `course_chart` VALUES (1, 1, 5183002643, '焦家林', '星期一,08:00-09:40', 'JS-203');
INSERT INTO `course_chart` VALUES (2, 2, 5183002643, '吴先飞', '星期一,14:00-15:40', '科技楼508');
INSERT INTO `course_chart` VALUES (3, 3, 5183002643, '徐沛然', '星期一,16:00-17:40', '科技楼309');
INSERT INTO `course_chart` VALUES (4, 4, 5183002643, '魏文才', '星期二,08:00-09:40', '科技楼309');
INSERT INTO `course_chart` VALUES (5, 4, 5183002643, '魏文才', '星期二,16:00-17:40', '同大202(机房2)');
INSERT INTO `course_chart` VALUES (6, 1, 5183002643, '焦家林', '星期三,16:00-17:40', '科技楼508');
INSERT INTO `course_chart` VALUES (7, 3, 5183002643, '徐沛然', '星期三,14:00-15:40', '科技楼510');
INSERT INTO `course_chart` VALUES (8, 5, 5183002643, '赵小超', '星期四,19:00-21:40', '同大205(机房5)');
INSERT INTO `course_chart` VALUES (9, 6, 5183002643, '彭杏芬', '星期五,08:00-11:40', '老化学楼201');
INSERT INTO `course_chart` VALUES (10, 2, 5183002643, '吴先飞', '星期六,08:00-11:40', 'JS-203');
INSERT INTO `course_chart` VALUES (11, 2, 5183002643, '吴先飞', '星期五,14:00-15:40', 'JS-203');

-- ----------------------------
-- Table structure for course_info
-- ----------------------------
DROP TABLE IF EXISTS `course_info`;
CREATE TABLE `course_info`  (
  `cno` int(11) NOT NULL,
  `cname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `study_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '16周',
  `credit` tinyint(4) NULL DEFAULT 2,
  PRIMARY KEY (`cno`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course_info
-- ----------------------------
INSERT INTO `course_info` VALUES (1, 'android项目开发实验', '16周', 2);
INSERT INTO `course_info` VALUES (2, 'J2EE程序设计', '16周', 2);
INSERT INTO `course_info` VALUES (3, '操作系统', '8周', 2);
INSERT INTO `course_info` VALUES (4, '软件需求分析', '16周', 2);
INSERT INTO `course_info` VALUES (5, '数据库程序设计(实践)', '16周', 2);
INSERT INTO `course_info` VALUES (6, '数据库设计', '16周', 2);

-- ----------------------------
-- Table structure for grade_info
-- ----------------------------
DROP TABLE IF EXISTS `grade_info`;
CREATE TABLE `grade_info`  (
  `sno` bigint(20) NOT NULL,
  `cno` int(11) NOT NULL,
  `grade` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`sno`, `cno`) USING BTREE,
  INDEX `grade_info_ibfk_2`(`cno`) USING BTREE,
  CONSTRAINT `grade_info_ibfk_1` FOREIGN KEY (`sno`) REFERENCES `student_info` (`sno`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `grade_info_ibfk_2` FOREIGN KEY (`cno`) REFERENCES `course_info` (`cno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of grade_info
-- ----------------------------
INSERT INTO `grade_info` VALUES (518300264301, 1, 95);
INSERT INTO `grade_info` VALUES (518300264301, 2, 99);
INSERT INTO `grade_info` VALUES (518300264301, 3, 88);
INSERT INTO `grade_info` VALUES (518300264301, 4, 91);
INSERT INTO `grade_info` VALUES (518300264301, 5, 89);
INSERT INTO `grade_info` VALUES (518300264301, 6, 92);

-- ----------------------------
-- Table structure for student_info
-- ----------------------------
DROP TABLE IF EXISTS `student_info`;
CREATE TABLE `student_info`  (
  `sno` bigint(11) NOT NULL,
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` enum('男','女') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthday` date NULL DEFAULT NULL,
  `major` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专业',
  `class` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '班级',
  `address` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `phone` bigint(20) NULL DEFAULT NULL COMMENT '手机号',
  `remark` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '应届生' COMMENT '备注',
  `classId` bigint(20) NULL DEFAULT NULL COMMENT '班号',
  PRIMARY KEY (`sno`) USING BTREE,
  INDEX `classId`(`classId`) USING BTREE,
  CONSTRAINT `student_info_ibfk_1` FOREIGN KEY (`classId`) REFERENCES `class_info` (`class_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student_info
-- ----------------------------
INSERT INTO `student_info` VALUES (518300214201, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '应届生', 5183002643);
INSERT INTO `student_info` VALUES (518300264301, '陈浩', '男', '1999-02-20', '软件工程', '软件三班', '河北邢台', 18890111029, '应届生', 5183002643);

-- ----------------------------
-- Table structure for user_login
-- ----------------------------
DROP TABLE IF EXISTS `user_login`;
CREATE TABLE `user_login`  (
  `username` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '学生',
  `user_info_id` bigint(20) NULL DEFAULT NULL COMMENT '用户详细信息识别id',
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_login
-- ----------------------------
INSERT INTO `user_login` VALUES ('admin', '123456', '管理员', 1001);
INSERT INTO `user_login` VALUES ('admine', '123456', '管理员', 1002);
INSERT INTO `user_login` VALUES ('chenhao', '111111', '学生', 518300264301);

SET FOREIGN_KEY_CHECKS = 1;

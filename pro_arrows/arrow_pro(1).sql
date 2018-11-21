/*
Navicat MySQL Data Transfer

Source Server         : dws
Source Server Version : 80013
Source Host           : localhost:3306
Source Database       : arrow_pro

Target Server Type    : MYSQL
Target Server Version : 80013
File Encoding         : 65001

Date: 2018-11-21 08:49:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ap_activity
-- ----------------------------
DROP TABLE IF EXISTS `ap_activity`;
CREATE TABLE `ap_activity` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `rid` int(10) DEFAULT NULL COMMENT '米数分类id',
  `title` varchar(100) DEFAULT NULL COMMENT '活动标题',
  `start_time` int(10) DEFAULT NULL COMMENT '活动开始时间',
  `desc` varchar(255) DEFAULT NULL COMMENT '活动简介',
  `theme` varchar(255) DEFAULT NULL COMMENT '活动主题',
  `backdrop` varchar(255) DEFAULT NULL COMMENT '活动背景',
  `purpose` varchar(255) DEFAULT NULL COMMENT '活动目的',
  `detail` text COMMENT '活动详情',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '修改时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='活动表';

-- ----------------------------
-- Records of ap_activity
-- ----------------------------

-- ----------------------------
-- Table structure for ap_activity_people
-- ----------------------------
DROP TABLE IF EXISTS `ap_activity_people`;
CREATE TABLE `ap_activity_people` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int(10) DEFAULT NULL COMMENT '用户id',
  `name` varchar(100) DEFAULT NULL COMMENT '姓名',
  `phone` varchar(255) DEFAULT NULL COMMENT '电话',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '修改时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of ap_activity_people
-- ----------------------------

-- ----------------------------
-- Table structure for ap_activity_vp
-- ----------------------------
DROP TABLE IF EXISTS `ap_activity_vp`;
CREATE TABLE `ap_activity_vp` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int(10) DEFAULT NULL COMMENT '用户id',
  `basics` int(10) DEFAULT NULL COMMENT '基础箭数',
  `hit` int(10) DEFAULT NULL COMMENT '命中箭数',
  `ring` int(10) DEFAULT NULL COMMENT '总环数',
  `consum_time` varchar(50) DEFAULT NULL COMMENT '耗时',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '修改时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of ap_activity_vp
-- ----------------------------

-- ----------------------------
-- Table structure for ap_desc
-- ----------------------------
DROP TABLE IF EXISTS `ap_desc`;
CREATE TABLE `ap_desc` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `detail` text COMMENT '详情',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '修改时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='箭馆介绍表';

-- ----------------------------
-- Records of ap_desc
-- ----------------------------

-- ----------------------------
-- Table structure for ap_goods
-- ----------------------------
DROP TABLE IF EXISTS `ap_goods`;
CREATE TABLE `ap_goods` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `cid` int(10) DEFAULT NULL COMMENT '商品分类id',
  `name` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `price` varchar(100) DEFAULT NULL COMMENT '商品价格',
  `stock` varchar(100) DEFAULT NULL COMMENT '商品库存',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '修改时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商品表';

-- ----------------------------
-- Records of ap_goods
-- ----------------------------

-- ----------------------------
-- Table structure for ap_goods_attribute
-- ----------------------------
DROP TABLE IF EXISTS `ap_goods_attribute`;
CREATE TABLE `ap_goods_attribute` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `gid` int(10) DEFAULT NULL COMMENT '商品id',
  `name` varchar(100) DEFAULT NULL COMMENT '属性',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '修改时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商品属性表';

-- ----------------------------
-- Records of ap_goods_attribute
-- ----------------------------

-- ----------------------------
-- Table structure for ap_goods_cart
-- ----------------------------
DROP TABLE IF EXISTS `ap_goods_cart`;
CREATE TABLE `ap_goods_cart` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `gid` int(10) DEFAULT NULL COMMENT '商品id',
  `name` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `price` varchar(100) DEFAULT NULL COMMENT '商品价格',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '修改时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商品购物车表';

-- ----------------------------
-- Records of ap_goods_cart
-- ----------------------------

-- ----------------------------
-- Table structure for ap_goods_classify
-- ----------------------------
DROP TABLE IF EXISTS `ap_goods_classify`;
CREATE TABLE `ap_goods_classify` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(100) DEFAULT NULL COMMENT '商品分类名称',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '修改时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商品分类表';

-- ----------------------------
-- Records of ap_goods_classify
-- ----------------------------

-- ----------------------------
-- Table structure for ap_image
-- ----------------------------
DROP TABLE IF EXISTS `ap_image`;
CREATE TABLE `ap_image` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `image` varchar(255) DEFAULT NULL COMMENT '图片',
  `type` tinyint(1) DEFAULT NULL COMMENT '图片类型（1商品详情轮播，2商品详情图片，3箭馆介绍顶部轮播，4箭馆介绍底部轮播）',
  `from` tinyint(1) DEFAULT '1' COMMENT '来源（1本地，2外网）',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '修改时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='图片表';

-- ----------------------------
-- Records of ap_image
-- ----------------------------

-- ----------------------------
-- Table structure for ap_integral
-- ----------------------------
DROP TABLE IF EXISTS `ap_integral`;
CREATE TABLE `ap_integral` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `integral_num` int(11) DEFAULT NULL COMMENT '积分数',
  `lower_limit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '上限',
  `upper_limit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '下限分数',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '修改时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='积分分配表';

-- ----------------------------
-- Records of ap_integral
-- ----------------------------

-- ----------------------------
-- Table structure for ap_level
-- ----------------------------
DROP TABLE IF EXISTS `ap_level`;
CREATE TABLE `ap_level` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `level` int(5) DEFAULT NULL COMMENT '等级',
  `lower_limit` varchar(255) DEFAULT NULL COMMENT '上限',
  `upper_limit` varchar(255) DEFAULT NULL COMMENT '下限分数',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '修改时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='等级表';

-- ----------------------------
-- Records of ap_level
-- ----------------------------

-- ----------------------------
-- Table structure for ap_pk_log
-- ----------------------------
DROP TABLE IF EXISTS `ap_pk_log`;
CREATE TABLE `ap_pk_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int(10) DEFAULT NULL COMMENT '用户id',
  `fraction` varchar(255) DEFAULT NULL COMMENT '分数',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '修改时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='pk记录表';

-- ----------------------------
-- Records of ap_pk_log
-- ----------------------------

-- ----------------------------
-- Table structure for ap_rice
-- ----------------------------
DROP TABLE IF EXISTS `ap_rice`;
CREATE TABLE `ap_rice` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `rice` varchar(100) DEFAULT NULL COMMENT '米数',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '修改时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='箭道排行米数分类表';

-- ----------------------------
-- Records of ap_rice
-- ----------------------------

-- ----------------------------
-- Table structure for ap_user
-- ----------------------------
DROP TABLE IF EXISTS `ap_user`;
CREATE TABLE `ap_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `openid` varchar(255) DEFAULT NULL COMMENT 'openid',
  `code` varchar(100) DEFAULT NULL COMMENT '编码',
  `username` varchar(100) DEFAULT NULL COMMENT '用户名',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `level` int(5) DEFAULT NULL COMMENT '我的等级',
  `arrow_number` varchar(255) DEFAULT NULL COMMENT '我的箭数',
  `integral` varchar(255) DEFAULT NULL COMMENT '我的积分',
  `detail` text COMMENT '我的介绍',
  `vip_endtime` int(11) DEFAULT NULL COMMENT '会员到期时间',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '修改时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户表';

-- ----------------------------
-- Records of ap_user
-- ----------------------------

-- ----------------------------
-- Table structure for ap_user_footprint
-- ----------------------------
DROP TABLE IF EXISTS `ap_user_footprint`;
CREATE TABLE `ap_user_footprint` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `project` varchar(255) DEFAULT NULL COMMENT '足迹名称',
  `vip` varchar(100) DEFAULT NULL COMMENT '会员',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '称号',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '修改时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户足迹表';

-- ----------------------------
-- Records of ap_user_footprint
-- ----------------------------

-- ----------------------------
-- Table structure for ap_user_mvc
-- ----------------------------
DROP TABLE IF EXISTS `ap_user_mvc`;
CREATE TABLE `ap_user_mvc` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int(10) DEFAULT NULL COMMENT '用户id',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `url` varchar(255) DEFAULT NULL COMMENT '视频',
  `from` tinyint(1) DEFAULT NULL COMMENT '来源（1本地，2外网）',
  `type` tinyint(1) DEFAULT NULL COMMENT '类型（1视频，2图片）',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '修改时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户视频图片表';

-- ----------------------------
-- Records of ap_user_mvc
-- ----------------------------

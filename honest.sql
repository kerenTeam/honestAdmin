/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : honest

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-08-15 18:58:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for h_contract
-- ----------------------------
DROP TABLE IF EXISTS `h_contract`;
CREATE TABLE `h_contract` (
  `contract_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '合同id',
  `contract_year` varchar(255) DEFAULT NULL COMMENT '合同年度',
  `contract_number` varchar(255) DEFAULT NULL COMMENT '合同编号',
  `province` varchar(200) DEFAULT NULL COMMENT '省份',
  `city` varchar(255) DEFAULT NULL COMMENT '城市',
  `area` varchar(255) DEFAULT NULL COMMENT '区县',
  `plate` varchar(255) DEFAULT NULL COMMENT '板块',
  `industry` varchar(10) DEFAULT NULL COMMENT '行业',
  `army` int(1) DEFAULT '0' COMMENT '是否军地   1是  0否',
  `service_tyep` varchar(20) DEFAULT NULL COMMENT '服务类型',
  `sign_date` varchar(200) DEFAULT NULL COMMENT '签订日期',
  `sign_user` varchar(200) DEFAULT NULL COMMENT '签订人',
  `contract_price` varchar(100) DEFAULT NULL COMMENT '合同金额',
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  PRIMARY KEY (`contract_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of h_contract
-- ----------------------------

-- ----------------------------
-- Table structure for h_customer
-- ----------------------------
DROP TABLE IF EXISTS `h_customer`;
CREATE TABLE `h_customer` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '客户表',
  `title` varchar(200) DEFAULT NULL COMMENT '名称',
  `industry` varchar(200) DEFAULT NULL COMMENT '行业',
  `address` varchar(200) DEFAULT NULL COMMENT '地址',
  `postcode` varchar(200) DEFAULT NULL COMMENT '邮政编码',
  `province` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `phone1` varchar(255) DEFAULT NULL,
  `phone2` varchar(255) DEFAULT NULL,
  `facsimile` varchar(255) DEFAULT NULL COMMENT '传真',
  `tax_on` varchar(255) DEFAULT NULL COMMENT '税号',
  `open_bank` varchar(255) DEFAULT NULL COMMENT '开户银行',
  `bank_account` varchar(255) DEFAULT NULL COMMENT '银行卡账号',
  `email` varchar(255) DEFAULT NULL COMMENT '电子邮件',
  `http` varchar(255) DEFAULT NULL COMMENT '网址',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `linkman` varchar(255) DEFAULT NULL COMMENT '本公司对口人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of h_customer
-- ----------------------------

-- ----------------------------
-- Table structure for h_customer_contacts
-- ----------------------------
DROP TABLE IF EXISTS `h_customer_contacts`;
CREATE TABLE `h_customer_contacts` (
  `id` int(10) NOT NULL,
  `company_id` int(10) NOT NULL COMMENT '单位iid',
  `name` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `duties` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `qq` varchar(255) DEFAULT NULL,
  `wechat` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `facsimile` varchar(255) DEFAULT NULL,
  `link_man` varchar(255) DEFAULT NULL COMMENT '本公司对口人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of h_customer_contacts
-- ----------------------------

-- ----------------------------
-- Table structure for h_system_log
-- ----------------------------
DROP TABLE IF EXISTS `h_system_log`;
CREATE TABLE `h_system_log` (
  `log_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '系统日志',
  `log_url` varchar(200) NOT NULL COMMENT '地址',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `log_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `log_ip` varchar(200) DEFAULT NULL COMMENT '操作ip',
  `log_sql` varchar(500) DEFAULT NULL COMMENT '操作sql',
  `log_status` int(2) DEFAULT NULL COMMENT '操作状态',
  `log_message` varchar(500) DEFAULT NULL COMMENT '操作内容',
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of h_system_log
-- ----------------------------
INSERT INTO `h_system_log` VALUES ('1', 'Member/add_power', '1', 'admin', null, '127.0.0.1', null, null, '新增了一个权限，权限级别为顶级');
INSERT INTO `h_system_log` VALUES ('2', 'Member/add_power_level', '1', 'admin', '2017-08-14 15:29:42', '127.0.0.1', null, '1', '新增权限成功,权限名称为3456');
INSERT INTO `h_system_log` VALUES ('3', 'Member/add_power_level', '1', 'admin', '2017-08-14 15:31:18', '127.0.0.1', null, '1', '新增权限成功,权限名称为3456');
INSERT INTO `h_system_log` VALUES ('4', 'Member/add_power_level', '1', 'admin', '2017-08-14 15:31:38', '127.0.0.1', null, '1', '新增权限成功,权限名称为3456');
INSERT INTO `h_system_log` VALUES ('5', 'Member/add_power_level', '1', 'admin', '2017-08-14 15:32:06', '127.0.0.1', null, '1', '新增权限成功,权限名称为3456');
INSERT INTO `h_system_log` VALUES ('6', 'Member/add_power_level', '1', 'admin', '2017-08-14 15:34:52', '127.0.0.1', null, '1', '新增权限成功,权限名称为系统设置');
INSERT INTO `h_system_log` VALUES ('7', 'Member/add_power_level', '1', 'admin', '2017-08-14 15:35:31', '127.0.0.1', null, '1', '新增权限成功,权限名称为2222');
INSERT INTO `h_system_log` VALUES ('8', 'Member/edit_power', '1', 'admin', '2017-08-14 15:58:49', '127.0.0.1', null, '1', '编辑权限成功,权限名称为3456123');
INSERT INTO `h_system_log` VALUES ('9', 'Member/edit_power', '1', 'admin', '2017-08-14 15:59:02', '127.0.0.1', null, '1', '编辑权限成功,权限名称为3456123');
INSERT INTO `h_system_log` VALUES ('10', 'Member/del_power', '1', 'admin', '2017-08-14 16:06:19', '127.0.0.1', null, '1', '删除权限成功');
INSERT INTO `h_system_log` VALUES ('11', 'Member/del_power', '1', 'admin', '2017-08-14 16:06:29', '127.0.0.1', null, '1', '删除权限成功');
INSERT INTO `h_system_log` VALUES ('12', 'Member/add_userGroup', '1', 'admin', '2017-08-15 09:37:38', '127.0.0.1', null, '1', '新增用户组成功,用户组名称为超级管理员');
INSERT INTO `h_system_log` VALUES ('13', 'Member/add_userGroup', '1', 'admin', '2017-08-15 09:54:55', '127.0.0.1', null, '1', '新增用户组成功,用户组名称为人力资源');
INSERT INTO `h_system_log` VALUES ('14', 'Member/edit_userGroup', '1', 'admin', '2017-08-15 10:42:13', '127.0.0.1', null, '1', '修改用户组成功,用户组名称为人力资源11');
INSERT INTO `h_system_log` VALUES ('15', 'Member/edit_userGroup', '1', 'admin', '2017-08-15 10:42:42', '127.0.0.1', null, '1', '修改用户组成功,用户组名称为人力资源1');
INSERT INTO `h_system_log` VALUES ('16', 'Member/edit_userGroup', '1', 'admin', '2017-08-15 10:42:51', '127.0.0.1', null, '1', '修改用户组成功,用户组名称为人力资源1');
INSERT INTO `h_system_log` VALUES ('17', 'Member/edit_power', '1', 'admin', '2017-08-15 11:29:45', '127.0.0.1', null, '1', '编辑权限成功,权限名称为管理员 | 用户');
INSERT INTO `h_system_log` VALUES ('18', 'Member/edit_power', '1', 'admin', '2017-08-15 11:31:03', '127.0.0.1', null, '1', '编辑权限成功,权限名称为管理员 | 用户');
INSERT INTO `h_system_log` VALUES ('19', 'Member/edit_power', '1', 'admin', '2017-08-15 11:31:26', '127.0.0.1', null, '1', '编辑权限成功,权限名称为权限管理');
INSERT INTO `h_system_log` VALUES ('20', 'Member/edit_power', '1', 'admin', '2017-08-15 11:31:56', '127.0.0.1', null, '1', '编辑权限成功,权限名称为添加权限');
INSERT INTO `h_system_log` VALUES ('21', 'Member/edit_power', '1', 'admin', '2017-08-15 11:32:09', '127.0.0.1', null, '1', '编辑权限成功,权限名称为管理员 | 用户');
INSERT INTO `h_system_log` VALUES ('22', 'Member/add_power_level', '1', 'admin', '2017-08-15 11:35:43', '127.0.0.1', null, '1', '新增权限成功,权限名称为编辑权限');
INSERT INTO `h_system_log` VALUES ('23', 'Member/add_power_level', '1', 'admin', '2017-08-15 11:36:05', '127.0.0.1', null, '1', '新增权限成功,权限名称为删除权限');
INSERT INTO `h_system_log` VALUES ('24', 'Member/add_power_level', '1', 'admin', '2017-08-15 11:37:22', '127.0.0.1', null, '1', '新增权限成功,权限名称为成员组管理');
INSERT INTO `h_system_log` VALUES ('25', 'Member/edit_power', '1', 'admin', '2017-08-15 11:37:40', '127.0.0.1', null, '1', '编辑权限成功,权限名称为编辑权限');
INSERT INTO `h_system_log` VALUES ('26', 'Member/edit_power', '1', 'admin', '2017-08-15 11:37:54', '127.0.0.1', null, '1', '编辑权限成功,权限名称为删除权限');
INSERT INTO `h_system_log` VALUES ('27', 'Member/add_power_level', '1', 'admin', '2017-08-15 12:03:42', '127.0.0.1', null, '1', '新增权限成功,权限名称为新增成员组');
INSERT INTO `h_system_log` VALUES ('28', 'Member/add_power_level', '1', 'admin', '2017-08-15 12:04:22', '127.0.0.1', null, '1', '新增权限成功,权限名称为编辑成员组');
INSERT INTO `h_system_log` VALUES ('29', 'Member/add_power_level', '1', 'admin', '2017-08-15 12:04:57', '127.0.0.1', null, '1', '新增权限成功,权限名称为删除成员组');
INSERT INTO `h_system_log` VALUES ('30', 'Member/add_power_level', '1', 'admin', '2017-08-15 12:05:45', '127.0.0.1', null, '1', '新增权限成功,权限名称为修改成员组权限');
INSERT INTO `h_system_log` VALUES ('31', 'Member/edit_userGroup', '1', 'admin', '2017-08-15 14:17:51', '127.0.0.1', null, '1', '修改用户组成功,用户组名称为人力资源123456');
INSERT INTO `h_system_log` VALUES ('32', 'Member/edit_userGroup', '1', 'admin', '2017-08-15 14:19:41', '127.0.0.1', null, '1', '修改用户组成功,用户组名称为人力资源123');
INSERT INTO `h_system_log` VALUES ('33', 'Member/del_power', '1', 'admin', '2017-08-15 17:41:44', '127.0.0.1', null, '1', '删除权限成功');
INSERT INTO `h_system_log` VALUES ('34', 'Member/del_power', '1', 'admin', '2017-08-15 17:41:51', '127.0.0.1', null, '1', '删除权限成功');
INSERT INTO `h_system_log` VALUES ('35', 'Member/edit_power', '1', 'admin', '2017-08-15 17:43:18', '127.0.0.1', null, '1', '编辑权限成功,权限名称为客户管理');
INSERT INTO `h_system_log` VALUES ('36', 'Member/group_power', '1', 'admin', '2017-08-15 17:43:41', '127.0.0.1', null, '0', '修改用户组权限成功,用户组名称id为1');

-- ----------------------------
-- Table structure for h_system_nav
-- ----------------------------
DROP TABLE IF EXISTS `h_system_nav`;
CREATE TABLE `h_system_nav` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL COMMENT '导航名称',
  `status` int(1) DEFAULT '1' COMMENT '状态   1显示，  0 不显示',
  `pid` int(10) DEFAULT NULL COMMENT '父类',
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `url` varchar(200) DEFAULT NULL COMMENT '控制器',
  `url_type` varchar(200) DEFAULT NULL COMMENT 'url 类型',
  `style` varchar(255) DEFAULT NULL COMMENT '样式',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of h_system_nav
-- ----------------------------
INSERT INTO `h_system_nav` VALUES ('1', '管理员 | 用户', '1', '0', null, 'member', null, 'am-icon-user-secret');
INSERT INTO `h_system_nav` VALUES ('2', '客户管理', '1', '0', '2017-08-14 14:35:07', 'Customer/index', null, 'am-icon-user-secret');
INSERT INTO `h_system_nav` VALUES ('3', '权限管理', '1', '1', '2017-08-14 15:29:42', 'Member/power', null, '');
INSERT INTO `h_system_nav` VALUES ('4', '添加权限', '0', '3', '2017-08-14 15:31:18', 'Member/add_power', null, '');
INSERT INTO `h_system_nav` VALUES ('9', '编辑权限', '0', '3', '2017-08-15 11:35:43', 'Member/edit_power', null, null);
INSERT INTO `h_system_nav` VALUES ('10', '删除权限', '0', '3', '2017-08-15 11:36:05', 'Member/del_power', null, null);
INSERT INTO `h_system_nav` VALUES ('11', '成员组管理', '1', '1', '2017-08-15 11:37:22', 'Member/userGroup', null, null);
INSERT INTO `h_system_nav` VALUES ('12', '新增成员组', '0', '11', '2017-08-15 12:03:42', 'Member/add_userGroup', null, null);
INSERT INTO `h_system_nav` VALUES ('13', '编辑成员组', '0', '11', '2017-08-15 12:04:22', 'Member/edit_userGroup', null, null);
INSERT INTO `h_system_nav` VALUES ('14', '删除成员组', '0', '11', '2017-08-15 12:04:57', 'Member/del_userGroup', null, null);
INSERT INTO `h_system_nav` VALUES ('15', '修改成员组权限', '0', '11', '2017-08-15 12:05:45', 'Member/edit_group_power', null, null);

-- ----------------------------
-- Table structure for h_user_compact
-- ----------------------------
DROP TABLE IF EXISTS `h_user_compact`;
CREATE TABLE `h_user_compact` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '员工劳动合同',
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL COMMENT '姓名',
  `sex` varchar(255) DEFAULT NULL COMMENT '性别',
  `part` varchar(255) DEFAULT NULL COMMENT '专兼职',
  `birth` varchar(255) DEFAULT NULL COMMENT '出生日期',
  `card_id` varchar(255) DEFAULT NULL,
  `entry_time` datetime DEFAULT NULL COMMENT '入职时间',
  `compact_start` varchar(255) DEFAULT NULL COMMENT '劳动合同起',
  `compact_end` varchar(255) DEFAULT NULL COMMENT '劳动合同止',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of h_user_compact
-- ----------------------------

-- ----------------------------
-- Table structure for h_user_contacts
-- ----------------------------
DROP TABLE IF EXISTS `h_user_contacts`;
CREATE TABLE `h_user_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '员工通讯录',
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL COMMENT '姓名',
  `phone1` varchar(255) DEFAULT NULL COMMENT '电话1',
  `phone2` varchar(255) DEFAULT NULL COMMENT '电话2',
  `qq` varchar(255) DEFAULT NULL COMMENT 'QQ',
  `home_address` varchar(255) DEFAULT NULL COMMENT '家庭住址',
  `emergency` varchar(255) DEFAULT NULL COMMENT '紧急联系人',
  `emergency_relation` varchar(255) DEFAULT NULL COMMENT '紧急联系人与当事人关系',
  `link_phone` varchar(255) DEFAULT NULL COMMENT '联系电话',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of h_user_contacts
-- ----------------------------

-- ----------------------------
-- Table structure for h_user_education
-- ----------------------------
DROP TABLE IF EXISTS `h_user_education`;
CREATE TABLE `h_user_education` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '学历表',
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `one_major` varchar(255) DEFAULT NULL COMMENT '专业',
  `one_school` varchar(255) DEFAULT NULL COMMENT '学校',
  `one_education` varchar(255) DEFAULT NULL COMMENT '学历',
  `one_graduation` varchar(255) DEFAULT NULL COMMENT '毕业时间',
  `tow_major` varchar(255) DEFAULT NULL,
  `tow_school` varchar(255) DEFAULT NULL,
  `tow_education` varchar(255) DEFAULT NULL,
  `tow_graduation` varchar(255) DEFAULT NULL,
  `three_major` varchar(255) DEFAULT NULL,
  `three_school` varchar(255) DEFAULT NULL,
  `three_education` varchar(255) DEFAULT NULL,
  `three_graduation` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of h_user_education
-- ----------------------------

-- ----------------------------
-- Table structure for h_user_expert
-- ----------------------------
DROP TABLE IF EXISTS `h_user_expert`;
CREATE TABLE `h_user_expert` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '专家库',
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `major` varchar(255) DEFAULT NULL COMMENT '专业',
  `education` varchar(255) DEFAULT NULL COMMENT '学历',
  `company` varchar(255) DEFAULT NULL COMMENT '单位i',
  `duties` varchar(255) DEFAULT NULL COMMENT '职务',
  `title` varchar(255) DEFAULT NULL COMMENT '职称',
  `phone1` varchar(255) DEFAULT NULL,
  `phone2` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of h_user_expert
-- ----------------------------

-- ----------------------------
-- Table structure for h_user_group
-- ----------------------------
DROP TABLE IF EXISTS `h_user_group`;
CREATE TABLE `h_user_group` (
  `gid` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户组id',
  `group_name` varchar(200) DEFAULT NULL COMMENT '用户组名',
  `alias` varchar(200) DEFAULT NULL COMMENT '别名',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `status` int(10) DEFAULT '1' COMMENT '状态',
  `perm` text COMMENT '权限',
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`gid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of h_user_group
-- ----------------------------
INSERT INTO `h_user_group` VALUES ('1', '超级管理员', '超级管理员', 'upload/icon/2017-08-15_093738.jpg', '1', '[{\"id\":\"1\",\"name\":\"管理员 | 用户\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"member\",\"url_type\":null,\"style\":\"am-icon-user-secret\"},{\"id\":\"3\",\"name\":\"权限管理\",\"status\":\"1\",\"pid\":\"1\",\"addtime\":\"2017-08-14 15:29:42\",\"url\":\"Member\\/power\",\"url_type\":null,\"style\":null},{\"id\":\"4\",\"name\":\"添加权限\",\"status\":\"0\",\"pid\":\"3\",\"addtime\":\"2017-08-14 15:31:18\",\"url\":\"Member\\/add_power\",\"url_type\":null,\"style\":null},{\"id\":\"9\",\"name\":\"编辑权限\",\"status\":\"0\",\"pid\":\"3\",\"addtime\":\"2017-08-15 11:35:43\",\"url\":\"Member\\/edit_power\",\"url_type\":null,\"style\":null},{\"id\":\"10\",\"name\":\"删除权限\",\"status\":\"0\",\"pid\":\"3\",\"addtime\":\"2017-08-15 11:36:05\",\"url\":\"Member\\/del_power\",\"url_type\":null,\"style\":null},{\"id\":\"11\",\"name\":\"成员组管理\",\"status\":\"1\",\"pid\":\"1\",\"addtime\":\"2017-08-15 11:37:22\",\"url\":\"Member\\/userGroup\",\"url_type\":null,\"style\":null},{\"id\":\"12\",\"name\":\"新增成员组\",\"status\":\"0\",\"pid\":\"11\",\"addtime\":\"2017-08-15 12:03:42\",\"url\":\"Member\\/add_userGroup\",\"url_type\":null,\"style\":null},{\"id\":\"13\",\"name\":\"编辑成员组\",\"status\":\"0\",\"pid\":\"11\",\"addtime\":\"2017-08-15 12:04:22\",\"url\":\"Member\\/edit_userGroup\",\"url_type\":null,\"style\":null},{\"id\":\"14\",\"name\":\"删除成员组\",\"status\":\"0\",\"pid\":\"11\",\"addtime\":\"2017-08-15 12:04:57\",\"url\":\"Member\\/del_userGroup\",\"url_type\":null,\"style\":null},{\"id\":\"15\",\"name\":\"修改成员组权限\",\"status\":\"0\",\"pid\":\"11\",\"addtime\":\"2017-08-15 12:05:45\",\"url\":\"Member\\/edit_group_power\",\"url_type\":null,\"style\":null},{\"id\":\"2\",\"name\":\"客户管理\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":\"2017-08-14 14:35:07\",\"url\":\"Customer\\/index\",\"url_type\":null,\"style\":\"234567890\"}]', '2017-08-15 09:37:38');
INSERT INTO `h_user_group` VALUES ('2', '人力资源123', '人力资源管理组234', 'upload/icon/2017-08-15_141941.png', '1', '[\r\n    {\r\n        \"id\": \"1\",\r\n        \"name\": \"管理员 | 用户\",\r\n        \"status\": \"1\",\r\n        \"pid\": \"0\",\r\n        \"addtime\": null,\r\n        \"url\": \"member\",\r\n        \"url_type\": null,\r\n        \"style\": null\r\n    },\r\n    {\r\n        \"id\": \"3\",\r\n        \"name\": \"权限管理\",\r\n        \"status\": \"1\",\r\n        \"pid\": \"1\",\r\n        \"addtime\": \"2017-08-14 15:29:42\",\r\n        \"url\": \"Member/power\",\r\n        \"url_type\": null,\r\n        \"style\": null\r\n    },\r\n    {\r\n        \"id\": \"4\",\r\n        \"name\": \"添加权限\",\r\n        \"status\": \"0\",\r\n        \"pid\": \"3\",\r\n        \"addtime\": \"2017-08-14 15:31:18\",\r\n        \"url\": \"Member/add_power\",\r\n        \"url_type\": null,\r\n        \"style\": null\r\n    }\r\n]', '2017-08-15 09:54:55');

-- ----------------------------
-- Table structure for h_user_member
-- ----------------------------
DROP TABLE IF EXISTS `h_user_member`;
CREATE TABLE `h_user_member` (
  `user_id` int(10) NOT NULL,
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `avatar` varchar(350) DEFAULT NULL COMMENT '头像',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `status` int(1) DEFAULT NULL COMMENT '用户状态',
  `gid` int(10) DEFAULT NULL COMMENT '用户组',
  `incumbency` int(1) DEFAULT '1' COMMENT '在职状态   1在职   0离职',
  `
part_time` varchar(200) DEFAULT NULL COMMENT '专兼职',
  `id_card` varchar(200) DEFAULT NULL COMMENT '身份证号码',
  `birth_date` varchar(200) DEFAULT NULL COMMENT '出生日期   身份证取',
  `qq` varchar(200) DEFAULT NULL COMMENT 'QQ',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `education` varchar(50) DEFAULT NULL COMMENT '最高学历',
  `entry_time` varchar(50) DEFAULT NULL COMMENT '入职时间',
  `employment` varchar(50) DEFAULT NULL COMMENT '转正时间',
  `social_state` int(1) DEFAULT '1' COMMENT '是否本公司购买社保  1是  0否',
  `social_security` varchar(200) DEFAULT NULL COMMENT '社保卡号',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注',
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `super_admin` int(1) DEFAULT '0' COMMENT '是否是超级管理员 1是有一切权限 0不是 需要配置权限',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of h_user_member
-- ----------------------------
INSERT INTO `h_user_member` VALUES ('1', 'admin', null, 'e10adc3949ba59abbe56e057f20f883e', '1', '1', '1', null, null, null, null, null, null, null, null, '1', null, null, '2017-08-10 15:20:08', '0');

-- ----------------------------
-- Table structure for h_user_message
-- ----------------------------
DROP TABLE IF EXISTS `h_user_message`;
CREATE TABLE `h_user_message` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '消息表',
  `user_id` int(10) DEFAULT NULL,
  `to_user_id` int(10) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of h_user_message
-- ----------------------------

-- ----------------------------
-- Table structure for h_user_qualifications
-- ----------------------------
DROP TABLE IF EXISTS `h_user_qualifications`;
CREATE TABLE `h_user_qualifications` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '职卫人员',
  `user_id` int(10) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL COMMENT '职称',
  `education` varchar(50) DEFAULT NULL COMMENT '学历',
  `major` varchar(200) DEFAULT NULL COMMENT '专业',
  `evaluate` varchar(200) DEFAULT NULL COMMENT '评价能力认定',
  `evaluate_certificate` varchar(200) DEFAULT NULL COMMENT '评价证书编号',
  `testing_certificate` varchar(200) DEFAULT NULL COMMENT '检测证书编号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of h_user_qualifications
-- ----------------------------

-- ----------------------------
-- Table structure for h_user_regsecurity
-- ----------------------------
DROP TABLE IF EXISTS `h_user_regsecurity`;
CREATE TABLE `h_user_regsecurity` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '注安师',
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `reg_profession` varchar(255) DEFAULT NULL COMMENT '注册专业',
  `basis` varchar(255) DEFAULT NULL COMMENT '认定一句',
  `practice_number` varchar(255) DEFAULT NULL COMMENT '执业资格证书编号',
  `practising_certificate` varchar(255) DEFAULT NULL COMMENT '执业证书编号',
  `reg_type` varchar(255) DEFAULT NULL COMMENT '注册类别',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of h_user_regsecurity
-- ----------------------------

-- ----------------------------
-- Table structure for h_user_safetyevaluation
-- ----------------------------
DROP TABLE IF EXISTS `h_user_safetyevaluation`;
CREATE TABLE `h_user_safetyevaluation` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `certificate_num` int(11) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `reg_nature` varchar(255) DEFAULT NULL COMMENT '注册性质',
  `company_name` varchar(255) DEFAULT NULL COMMENT '单位名称',
  `reg_start` varchar(255) DEFAULT NULL,
  `reg_end` varchar(255) DEFAULT NULL,
  `one_cognizance_major` varchar(255) DEFAULT NULL COMMENT '认定专业1',
  `one_cognizance_basis` varchar(255) DEFAULT NULL COMMENT '认定依据1',
  `tow_cognizance_major` varchar(255) DEFAULT NULL,
  `tow_cognizance_basis` varchar(255) DEFAULT NULL,
  `three_cognizance_major` varchar(255) DEFAULT NULL,
  `ap_regPassword` varchar(255) DEFAULT NULL COMMENT 'Ap注册密码',
  `ap_education_pwd` varchar(255) DEFAULT NULL COMMENT 'AP再教育密码',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of h_user_safetyevaluation
-- ----------------------------

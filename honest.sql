/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : honest

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-08-27 18:16:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for h_category
-- ----------------------------
DROP TABLE IF EXISTS `h_category`;
CREATE TABLE `h_category` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '分类类别',
  `cate_name` varchar(255) DEFAULT NULL,
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT '1' COMMENT '状态',
  `type` int(10) DEFAULT NULL COMMENT '分类类型  1行业  2 服务  3技术',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of h_category
-- ----------------------------
INSERT INTO `h_category` VALUES ('1', '时间', '2017-08-24 15:55:26', '1', '1');
INSERT INTO `h_category` VALUES ('2', '到底', '2017-08-24 15:55:43', '1', '1');
INSERT INTO `h_category` VALUES ('3', '矿产', '2017-08-24 16:03:42', '1', '1');
INSERT INTO `h_category` VALUES ('4', '石油1', '2017-08-24 16:04:02', '1', '1');
INSERT INTO `h_category` VALUES ('5', '工业1', '2017-08-24 16:04:59', '1', '1');
INSERT INTO `h_category` VALUES ('6', '信息安全', '2017-08-24 16:26:13', '1', '1');
INSERT INTO `h_category` VALUES ('7', '信息安全', '2017-08-24 16:27:22', '1', '2');
INSERT INTO `h_category` VALUES ('8', '12345', '2017-08-24 16:29:50', '1', '2');
INSERT INTO `h_category` VALUES ('9', '信息技术', '2017-08-25 09:21:34', '1', '3');

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
  `title` varchar(255) DEFAULT NULL COMMENT '合同名称',
  `customer_id` int(10) DEFAULT NULL COMMENT '客户id',
  `del_state` int(2) DEFAULT '0' COMMENT '删除状态   0正常   1删除',
  PRIMARY KEY (`contract_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of h_contract
-- ----------------------------
INSERT INTO `h_contract` VALUES ('1', '2017', '2017CD001', '四川', '成都', '高新', '1', '1', '1', '1', '2017-08-02', '海洋', '20000', '2017-08-25 09:20:02', '安全信息', null, '0');
INSERT INTO `h_contract` VALUES ('2', '2017', '2018', '安徽', '合肥市', '庐阳区', '9', '2', '0', '8', '2017-08-08', '23423', '234234', '2017-08-27 17:40:18', 'w32', '2', '1');
INSERT INTO `h_contract` VALUES ('3', '2017', '2017083', '江苏', '南京市', '鼓楼区', '9', '1', '1', '7', '2017-08-10', '56456456', '1', '2017-08-27 17:44:52', 'sdfsdf', '2', '0');

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
  `state` int(1) DEFAULT '1' COMMENT '客户状态    0已删除    1正常',
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of h_customer
-- ----------------------------
INSERT INTO `h_customer` VALUES ('1', '23', '', '123123', '123123', null, null, null, '12313', '1313', '12313', '12313', '123123', '12313', '12313', '12313123', '1313', null, '0', '2017-08-27 11:28:04');
INSERT INTO `h_customer` VALUES ('2', '测试1', '4', '123455', '21', null, null, null, '12121', '21212', '212', '2323', '213123', '123123', '23123', '123123', '123123', null, '1', '2017-08-27 11:28:04');

-- ----------------------------
-- Table structure for h_customer_contacts
-- ----------------------------
DROP TABLE IF EXISTS `h_customer_contacts`;
CREATE TABLE `h_customer_contacts` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '客户联系人',
  `company_id` int(10) NOT NULL COMMENT '单位iid',
  `name` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL COMMENT '部门',
  `duties` varchar(255) DEFAULT NULL COMMENT '职务',
  `phone` varchar(255) DEFAULT NULL,
  `qq` varchar(255) DEFAULT NULL COMMENT 'qq',
  `wechat` varchar(255) DEFAULT NULL COMMENT '微信',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `tel` varchar(255) DEFAULT NULL COMMENT '座机',
  `facsimile` varchar(255) DEFAULT NULL COMMENT '传真',
  `link_man` varchar(255) DEFAULT NULL COMMENT '本公司对口人',
  `remaks` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of h_customer_contacts
-- ----------------------------
INSERT INTO `h_customer_contacts` VALUES ('1', '1', 'ddf1', '3432', 'sdfsdf', '234243', '23423', '3434', '234234', '234234234', 'dfsdf', 'sdfsdf', 'sdfsdfs', 'dsdfsdf');

-- ----------------------------
-- Table structure for h_project
-- ----------------------------
DROP TABLE IF EXISTS `h_project`;
CREATE TABLE `h_project` (
  `c_id` int(10) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '项目表',
  `year` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `town` varchar(255) DEFAULT NULL,
  `contacts` varchar(255) DEFAULT NULL,
  `contacts_address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `signing` varchar(255) DEFAULT NULL,
  `signing_date` varchar(255) DEFAULT NULL,
  `military` int(11) DEFAULT NULL,
  `technology_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `industry_id` int(11) DEFAULT NULL,
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of h_project
-- ----------------------------
INSERT INTO `h_project` VALUES ('1', '1', '2017', '456787', '天津', '市辖区', '河西区', '345354', '3534', '34535', '53535', '2017-08-25', '1', '9', '7', '2', '2017-08-25 09:22:31', null);
INSERT INTO `h_project` VALUES ('1', '2', '2017', '测试项目', '天津', '市辖区', '请选择', '测试人', '成都市中和镇', '1582877663', '刘3', '2017-08-25', '1', '9', '8', '4', '2017-08-25 10:40:27', null);

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
) ENGINE=MyISAM AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4;

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
INSERT INTO `h_system_log` VALUES ('37', 'Member/group_power', '1', 'admin', '2017-08-16 09:31:35', '127.0.0.1', null, '0', '修改用户组权限成功,用户组名称id为2');
INSERT INTO `h_system_log` VALUES ('38', 'Member/group_power', '1', 'admin', '2017-08-16 09:36:59', '127.0.0.1', null, '0', '修改用户组权限成功,用户组名称id为2');
INSERT INTO `h_system_log` VALUES ('39', 'Member/group_power', '1', 'admin', '2017-08-16 09:37:14', '127.0.0.1', null, '0', '修改用户组权限成功,用户组名称id为2');
INSERT INTO `h_system_log` VALUES ('40', 'Member/group_power', '1', 'admin', '2017-08-16 09:37:31', '127.0.0.1', null, '0', '修改用户组权限成功,用户组名称id为2');
INSERT INTO `h_system_log` VALUES ('41', 'Member/group_power', '1', 'admin', '2017-08-16 09:39:43', '127.0.0.1', null, '0', '修改用户组权限成功,用户组名称id为1');
INSERT INTO `h_system_log` VALUES ('42', 'Member/group_power', '1', 'admin', '2017-08-16 09:45:42', '127.0.0.1', null, '0', '修改用户组权限成功,用户组名称id为1');
INSERT INTO `h_system_log` VALUES ('43', 'Member/group_power', '1', 'admin', '2017-08-16 09:45:54', '127.0.0.1', null, '0', '修改用户组权限成功,用户组名称id为1');
INSERT INTO `h_system_log` VALUES ('44', 'Member/del_userGroup', '1', 'admin', '2017-08-16 10:16:33', '127.0.0.1', null, '1', '删除用户组成功,用户组id为2');
INSERT INTO `h_system_log` VALUES ('45', 'Member/add_userGroup', '1', 'admin', '2017-08-16 10:23:43', '127.0.0.1', null, '1', '新增用户组成功,用户组名称为测试用户组');
INSERT INTO `h_system_log` VALUES ('46', 'Member/group_power', '1', 'admin', '2017-08-16 10:24:11', '127.0.0.1', null, '1', '修改用户组权限成功,用户组名称id为3');
INSERT INTO `h_system_log` VALUES ('47', 'Member/add_power_level', '1', 'admin', '2017-08-16 10:29:49', '127.0.0.1', null, '1', '新增权限成功,权限名称为用户列表');
INSERT INTO `h_system_log` VALUES ('48', 'Member/add_user', '1', 'admin', '2017-08-22 17:21:11', '::1', null, '1', '新增用户成功,用户名称为测试三');
INSERT INTO `h_system_log` VALUES ('49', 'Member/user_communication', '1', 'admin', '2017-08-23 10:18:31', '::1', null, '1', '新增用户联系人成功,用户名称为测试三');
INSERT INTO `h_system_log` VALUES ('50', 'Member/user_communication', '1', 'admin', '2017-08-23 10:20:11', '::1', null, '1', '修改用户联系人成功,用户名称为测试三1');
INSERT INTO `h_system_log` VALUES ('51', 'Member/user_communication', '1', 'admin', '2017-08-23 10:20:50', '::1', null, '1', '修改用户联系人成功,用户名称为测试三1');
INSERT INTO `h_system_log` VALUES ('52', 'Member/user_laborContract', '1', 'admin', '2017-08-23 11:03:03', '::1', null, '1', '修改用户联系人成功,用户名称为测试三');
INSERT INTO `h_system_log` VALUES ('53', 'Member/user_laborContract', '1', 'admin', '2017-08-23 11:04:40', '::1', null, '1', '新增用户联系人成功,用户名称为测试三');
INSERT INTO `h_system_log` VALUES ('54', 'Member/add_power', '1', 'admin', '2017-08-24 15:00:23', '::1', null, '1', '新增权限成功,权限名称为分类管理');
INSERT INTO `h_system_log` VALUES ('55', 'Member/add_power_level', '1', 'admin', '2017-08-24 15:01:20', '::1', null, '1', '新增权限成功,权限名称为行业类别');
INSERT INTO `h_system_log` VALUES ('56', 'Member/add_power_level', '1', 'admin', '2017-08-24 15:01:58', '::1', null, '1', '新增权限成功,权限名称为服务类别');
INSERT INTO `h_system_log` VALUES ('57', 'Member/add_power_level', '1', 'admin', '2017-08-24 15:02:32', '::1', null, '1', '新增权限成功,权限名称为技术板块');
INSERT INTO `h_system_log` VALUES ('58', 'Member/group_power', '1', 'admin', '2017-08-24 15:02:49', '::1', null, '1', '修改用户组权限成功,用户组名称id为1');
INSERT INTO `h_system_log` VALUES ('59', 'Member/add_power_level', '1', 'admin', '2017-08-24 15:26:00', '::1', null, '1', '新增权限成功,权限名称为新增行业分类');
INSERT INTO `h_system_log` VALUES ('60', 'Member/group_power', '1', 'admin', '2017-08-24 15:54:46', '::1', null, '1', '修改用户组权限成功,用户组名称id为1');
INSERT INTO `h_system_log` VALUES ('61', 'Category/add_industry', '1', 'admin', '2017-08-24 15:55:26', '::1', null, '1', '新增行业类别成功,行业名称为时间');
INSERT INTO `h_system_log` VALUES ('62', 'Category/add_industry', '1', 'admin', '2017-08-24 15:55:43', '::1', null, '1', '新增行业类别成功,行业名称为到底');
INSERT INTO `h_system_log` VALUES ('63', 'Category/add_industry', '1', 'admin', '2017-08-24 16:03:42', '::1', null, '1', '新增行业类别成功,行业名称为矿产');
INSERT INTO `h_system_log` VALUES ('64', 'Category/add_industry', '1', 'admin', '2017-08-24 16:04:02', '::1', null, '1', '新增行业类别成功,行业名称为石油');
INSERT INTO `h_system_log` VALUES ('65', 'Category/add_industry', '1', 'admin', '2017-08-24 16:04:59', '::1', null, '1', '新增行业类别成功,行业名称为工业');
INSERT INTO `h_system_log` VALUES ('66', 'Member/add_power_level', '1', 'admin', '2017-08-24 16:11:15', '::1', null, '1', '新增权限成功,权限名称为编辑行业类别');
INSERT INTO `h_system_log` VALUES ('67', 'Member/group_power', '1', 'admin', '2017-08-24 16:11:27', '::1', null, '1', '修改用户组权限成功,用户组名称id为1');
INSERT INTO `h_system_log` VALUES ('68', 'Category/edit_industry', '1', 'admin', '2017-08-24 16:12:26', '::1', null, '1', '新增行业类别成功,行业名称为工业1');
INSERT INTO `h_system_log` VALUES ('69', 'Category/edit_industry', '1', 'admin', '2017-08-24 16:12:50', '::1', null, '1', '新增行业类别成功,行业名称为石油1');
INSERT INTO `h_system_log` VALUES ('70', 'Member/add_power_level', '1', 'admin', '2017-08-24 16:15:58', '::1', null, '1', '新增权限成功,权限名称为删除行业类别');
INSERT INTO `h_system_log` VALUES ('71', 'Category/add_service', '1', 'admin', '2017-08-24 16:26:13', '::1', null, '1', '新增服务类别成功,服务名称为信息安全');
INSERT INTO `h_system_log` VALUES ('72', 'Category/add_service', '1', 'admin', '2017-08-24 16:27:22', '::1', null, '1', '新增服务类别成功,服务名称为信息安全');
INSERT INTO `h_system_log` VALUES ('73', 'Category/add_service', '1', 'admin', '2017-08-24 16:29:50', '::1', null, '1', '新增服务类别成功,服务名称为12345');
INSERT INTO `h_system_log` VALUES ('74', 'Member/add_power_level', '1', 'admin', '2017-08-24 17:11:32', '::1', null, '1', '新增权限成功,权限名称为新增服务类型');
INSERT INTO `h_system_log` VALUES ('75', 'Member/add_power_level', '1', 'admin', '2017-08-24 17:12:00', '::1', null, '1', '新增权限成功,权限名称为编辑服务类型');
INSERT INTO `h_system_log` VALUES ('76', 'Member/add_power_level', '1', 'admin', '2017-08-24 17:12:30', '::1', null, '1', '新增权限成功,权限名称为删除服务类型');
INSERT INTO `h_system_log` VALUES ('77', 'Member/add_power_level', '1', 'admin', '2017-08-24 17:12:56', '::1', null, '1', '新增权限成功,权限名称为新增技术板块');
INSERT INTO `h_system_log` VALUES ('78', 'Member/add_power_level', '1', 'admin', '2017-08-24 17:13:57', '::1', null, '1', '新增权限成功,权限名称为编辑技术板块');
INSERT INTO `h_system_log` VALUES ('79', 'Member/add_power_level', '1', 'admin', '2017-08-24 17:14:33', '::1', null, '1', '新增权限成功,权限名称为删除技术板块');
INSERT INTO `h_system_log` VALUES ('80', 'Customer/add_customer', '1', 'admin', '2017-08-24 18:58:53', '::1', null, '1', '新增客户成功,客户名称为');
INSERT INTO `h_system_log` VALUES ('81', 'Member/add_power', '1', 'admin', '2017-08-25 09:05:03', '::1', null, '1', '新增权限成功,权限名称为合同管理');
INSERT INTO `h_system_log` VALUES ('82', 'Member/add_power', '1', 'admin', '2017-08-25 09:05:41', '::1', null, '1', '新增权限成功,权限名称为项目管理');
INSERT INTO `h_system_log` VALUES ('83', 'Project/add_project', '1', 'admin', '2017-08-25 09:22:31', '::1', null, '1', '新增项目成功,项目名称为456787');
INSERT INTO `h_system_log` VALUES ('84', 'Project/add_project', '1', 'admin', '2017-08-25 10:40:27', '::1', null, '1', '新增项目成功,项目名称为测试项目');
INSERT INTO `h_system_log` VALUES ('85', 'Member/add_power_level', '1', 'admin', '2017-08-25 16:30:36', '::1', null, '1', '新增权限成功,权限名称为新增客户');
INSERT INTO `h_system_log` VALUES ('86', 'Member/add_power_level', '1', 'admin', '2017-08-25 17:56:01', '::1', null, '1', '新增权限成功,权限名称为新增客户联系人');
INSERT INTO `h_system_log` VALUES ('87', 'Member/group_power', '1', 'admin', '2017-08-25 17:56:23', '::1', null, '1', '修改用户组权限成功,用户组名称id为1');
INSERT INTO `h_system_log` VALUES ('88', 'Customer/add_customer_user', '1', 'admin', '2017-08-25 17:58:01', '::1', null, '1', '新增客户联系人成功,联系人名称为ddf');
INSERT INTO `h_system_log` VALUES ('89', 'Customer/add_customer', '1', 'admin', '2017-08-27 10:26:30', '::1', null, '1', '新增客户成功,客户名称为测试1');
INSERT INTO `h_system_log` VALUES ('90', 'Member/add_power_level', '1', 'admin', '2017-08-27 11:29:15', '::1', null, '1', '新增权限成功,权限名称为修改客户联系人');
INSERT INTO `h_system_log` VALUES ('91', 'Member/add_power_level', '1', 'admin', '2017-08-27 11:29:36', '::1', null, '1', '新增权限成功,权限名称为删除客户');
INSERT INTO `h_system_log` VALUES ('92', 'Member/group_power', '1', 'admin', '2017-08-27 11:29:48', '::1', null, '1', '修改用户组权限成功,用户组名称id为1');
INSERT INTO `h_system_log` VALUES ('93', 'Customer/edit_customer_user', '1', 'admin', '2017-08-27 11:30:25', '::1', null, '1', '修改客户联系人成功,联系人名称为ddf1');
INSERT INTO `h_system_log` VALUES ('94', 'Customer/edit_customer_status', '1', 'admin', '2017-08-27 11:36:17', '::1', null, '1', '删除客户联系人成功,联系人id为1');
INSERT INTO `h_system_log` VALUES ('95', 'Member/add_power_level', '1', 'admin', '2017-08-27 17:36:58', '::1', null, '1', '新增权限成功,权限名称为新增合同');
INSERT INTO `h_system_log` VALUES ('96', 'Member/add_power_level', '1', 'admin', '2017-08-27 17:37:19', '::1', null, '1', '新增权限成功,权限名称为编辑合同');
INSERT INTO `h_system_log` VALUES ('97', 'Member/add_power_level', '1', 'admin', '2017-08-27 17:37:49', '::1', null, '1', '新增权限成功,权限名称为删除合同');
INSERT INTO `h_system_log` VALUES ('98', 'Member/group_power', '1', 'admin', '2017-08-27 17:38:00', '::1', null, '1', '修改用户组权限成功,用户组名称id为1');
INSERT INTO `h_system_log` VALUES ('99', 'Contract/add_contract', '1', 'admin', '2017-08-27 17:40:18', '::1', null, '1', '新增合同成功,合同名称为w32');
INSERT INTO `h_system_log` VALUES ('100', 'Contract/add_contract', '1', 'admin', '2017-08-27 17:44:52', '::1', null, '1', '新增合同成功,合同名称为456532456');
INSERT INTO `h_system_log` VALUES ('101', 'Contract/edit_contract', '1', 'admin', '2017-08-27 17:47:04', '::1', null, '1', '修改合同成功,合同名称为sdfsdf');
INSERT INTO `h_system_log` VALUES ('102', 'Contract/del_contract_state', '1', 'admin', '2017-08-27 18:10:10', '::1', null, '1', '删除合同成功,合同id为');
INSERT INTO `h_system_log` VALUES ('103', 'Contract/del_contract_state', '1', 'admin', '2017-08-27 18:13:53', '::1', null, '1', '删除合同成功,合同id为');
INSERT INTO `h_system_log` VALUES ('104', 'Contract/del_contract_state', '1', 'admin', '2017-08-27 18:14:24', '::1', null, '1', '删除合同成功,合同id为');
INSERT INTO `h_system_log` VALUES ('105', 'Contract/del_contract_state', '1', 'admin', '2017-08-27 18:14:52', '::1', null, '1', '删除合同成功,合同id为1');
INSERT INTO `h_system_log` VALUES ('106', 'Contract/del_contract_state', '1', 'admin', '2017-08-27 18:14:57', '::1', null, '1', '删除合同成功,合同id为1');
INSERT INTO `h_system_log` VALUES ('107', 'Contract/del_contract_state', '1', 'admin', '2017-08-27 18:14:59', '::1', null, '1', '删除合同成功,合同id为1');
INSERT INTO `h_system_log` VALUES ('108', 'Contract/del_contract_state', '1', 'admin', '2017-08-27 18:15:40', '::1', null, '1', '删除合同成功,合同id为2');

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
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4;

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
INSERT INTO `h_system_nav` VALUES ('16', '用户列表', '1', '1', '2017-08-16 10:29:49', 'Member/user_List', null, null);
INSERT INTO `h_system_nav` VALUES ('17', '分类管理', '1', '0', '2017-08-24 15:00:23', 'Category', null, 'am-icon-tags');
INSERT INTO `h_system_nav` VALUES ('18', '行业类别', '1', '17', '2017-08-24 15:01:20', 'Category/industry', null, null);
INSERT INTO `h_system_nav` VALUES ('19', '服务类别', '1', '17', '2017-08-24 15:01:58', 'Category/service', null, null);
INSERT INTO `h_system_nav` VALUES ('20', '技术板块', '1', '17', '2017-08-24 15:02:32', 'Category/technology', null, null);
INSERT INTO `h_system_nav` VALUES ('21', '新增行业分类', '0', '18', '2017-08-24 15:26:00', 'Category/add_industry', null, null);
INSERT INTO `h_system_nav` VALUES ('22', '编辑行业类别', '0', '18', '2017-08-24 16:11:15', 'Category/edit_industry', null, null);
INSERT INTO `h_system_nav` VALUES ('23', '删除行业类别', '0', '18', '2017-08-24 16:15:58', 'Category/del_industry', null, null);
INSERT INTO `h_system_nav` VALUES ('24', '新增服务类型', '0', '19', '2017-08-24 17:11:32', 'Category/add_service', null, null);
INSERT INTO `h_system_nav` VALUES ('25', '编辑服务类型', '0', '19', '2017-08-24 17:12:00', 'Category/edit_service', null, null);
INSERT INTO `h_system_nav` VALUES ('26', '删除服务类型', '0', '19', '2017-08-24 17:12:30', 'Category/del_service', null, null);
INSERT INTO `h_system_nav` VALUES ('27', '新增技术板块', '0', '20', '2017-08-24 17:12:56', 'Category/add_technology', null, null);
INSERT INTO `h_system_nav` VALUES ('28', '编辑技术板块', '0', '20', '2017-08-24 17:13:57', 'Category/edit_technology', null, null);
INSERT INTO `h_system_nav` VALUES ('29', '删除技术板块', '0', '20', '2017-08-24 17:14:33', 'Category/del_technology', null, null);
INSERT INTO `h_system_nav` VALUES ('30', '合同管理', '1', '0', '2017-08-25 09:05:03', 'Contract/index', null, 'am-icon-tags');
INSERT INTO `h_system_nav` VALUES ('31', '项目管理', '1', '0', '2017-08-25 09:05:41', 'Project/index', null, 'am-icon-tags');
INSERT INTO `h_system_nav` VALUES ('32', '新增客户', '0', '2', '2017-08-25 16:30:36', 'Customer/add_customer', null, null);
INSERT INTO `h_system_nav` VALUES ('33', '新增客户联系人', '0', '2', '2017-08-25 17:56:01', 'Customer/add_customer_user', null, null);
INSERT INTO `h_system_nav` VALUES ('34', '修改客户联系人', '0', '2', '2017-08-27 11:29:15', 'Customer/edit_customer_user', null, null);
INSERT INTO `h_system_nav` VALUES ('35', '删除客户', '0', '2', '2017-08-27 11:29:36', 'Customer/edit_customer_status', null, null);
INSERT INTO `h_system_nav` VALUES ('36', '新增合同', '0', '30', '2017-08-27 17:36:58', 'Contract/add_contract', null, null);
INSERT INTO `h_system_nav` VALUES ('37', '编辑合同', '0', '30', '2017-08-27 17:37:19', 'Contract/edit_contract', null, null);
INSERT INTO `h_system_nav` VALUES ('38', '删除合同', '0', '30', '2017-08-27 17:37:49', 'Contract/del_contract_state', null, null);

-- ----------------------------
-- Table structure for h_user_compact
-- ----------------------------
DROP TABLE IF EXISTS `h_user_compact`;
CREATE TABLE `h_user_compact` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '员工劳动合同',
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL COMMENT '姓名',
  `sex` varchar(10) DEFAULT NULL COMMENT '性别',
  `part` varchar(50) DEFAULT NULL COMMENT '专兼职',
  `birth` varchar(50) DEFAULT NULL COMMENT '出生日期',
  `card_id` varchar(50) DEFAULT NULL,
  `entry_time` varchar(199) DEFAULT NULL COMMENT '入职时间',
  `compact_start` varchar(100) DEFAULT NULL COMMENT '劳动合同起',
  `compact_end` varchar(100) DEFAULT NULL COMMENT '劳动合同止',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of h_user_compact
-- ----------------------------
INSERT INTO `h_user_compact` VALUES ('1', '3', '测试三', '男', '1', '45678', '345678', '', '6789', '3456789', '3245234324');

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of h_user_contacts
-- ----------------------------
INSERT INTO `h_user_contacts` VALUES ('1', '3', '测试三1', '456789', '234567890', '34535', '3453453', '345345', '广东广东省', '大师傅士大夫');

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of h_user_group
-- ----------------------------
INSERT INTO `h_user_group` VALUES ('1', '超级管理员', '超级管理员', 'upload/icon/2017-08-15_093738.jpg', '1', '[{\"id\":\"1\",\"name\":\"管理员 | 用户\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"member\",\"url_type\":null,\"style\":\"am-icon-user-secret\"},{\"id\":\"3\",\"name\":\"权限管理\",\"status\":\"1\",\"pid\":\"1\",\"addtime\":\"2017-08-14 15:29:42\",\"url\":\"Member\\/power\",\"url_type\":null,\"style\":\"\"},{\"id\":\"4\",\"name\":\"添加权限\",\"status\":\"0\",\"pid\":\"3\",\"addtime\":\"2017-08-14 15:31:18\",\"url\":\"Member\\/add_power\",\"url_type\":null,\"style\":\"\"},{\"id\":\"9\",\"name\":\"编辑权限\",\"status\":\"0\",\"pid\":\"3\",\"addtime\":\"2017-08-15 11:35:43\",\"url\":\"Member\\/edit_power\",\"url_type\":null,\"style\":null},{\"id\":\"10\",\"name\":\"删除权限\",\"status\":\"0\",\"pid\":\"3\",\"addtime\":\"2017-08-15 11:36:05\",\"url\":\"Member\\/del_power\",\"url_type\":null,\"style\":null},{\"id\":\"11\",\"name\":\"成员组管理\",\"status\":\"1\",\"pid\":\"1\",\"addtime\":\"2017-08-15 11:37:22\",\"url\":\"Member\\/userGroup\",\"url_type\":null,\"style\":null},{\"id\":\"12\",\"name\":\"新增成员组\",\"status\":\"0\",\"pid\":\"11\",\"addtime\":\"2017-08-15 12:03:42\",\"url\":\"Member\\/add_userGroup\",\"url_type\":null,\"style\":null},{\"id\":\"13\",\"name\":\"编辑成员组\",\"status\":\"0\",\"pid\":\"11\",\"addtime\":\"2017-08-15 12:04:22\",\"url\":\"Member\\/edit_userGroup\",\"url_type\":null,\"style\":null},{\"id\":\"14\",\"name\":\"删除成员组\",\"status\":\"0\",\"pid\":\"11\",\"addtime\":\"2017-08-15 12:04:57\",\"url\":\"Member\\/del_userGroup\",\"url_type\":null,\"style\":null},{\"id\":\"15\",\"name\":\"修改成员组权限\",\"status\":\"0\",\"pid\":\"11\",\"addtime\":\"2017-08-15 12:05:45\",\"url\":\"Member\\/edit_group_power\",\"url_type\":null,\"style\":null},{\"id\":\"16\",\"name\":\"用户列表\",\"status\":\"1\",\"pid\":\"1\",\"addtime\":\"2017-08-16 10:29:49\",\"url\":\"Member\\/user_List\",\"url_type\":null,\"style\":null},{\"id\":\"2\",\"name\":\"客户管理\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":\"2017-08-14 14:35:07\",\"url\":\"Customer\\/index\",\"url_type\":null,\"style\":\"am-icon-user-secret\"},{\"id\":\"32\",\"name\":\"新增客户\",\"status\":\"0\",\"pid\":\"2\",\"addtime\":\"2017-08-25 16:30:36\",\"url\":\"Customer\\/add_customer\",\"url_type\":null,\"style\":null},{\"id\":\"33\",\"name\":\"新增客户联系人\",\"status\":\"0\",\"pid\":\"2\",\"addtime\":\"2017-08-25 17:56:01\",\"url\":\"Customer\\/add_customer_user\",\"url_type\":null,\"style\":null},{\"id\":\"34\",\"name\":\"修改客户联系人\",\"status\":\"0\",\"pid\":\"2\",\"addtime\":\"2017-08-27 11:29:15\",\"url\":\"Customer\\/edit_customer_user\",\"url_type\":null,\"style\":null},{\"id\":\"35\",\"name\":\"删除客户\",\"status\":\"0\",\"pid\":\"2\",\"addtime\":\"2017-08-27 11:29:36\",\"url\":\"Customer\\/edit_customer_status\",\"url_type\":null,\"style\":null},{\"id\":\"17\",\"name\":\"分类管理\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":\"2017-08-24 15:00:23\",\"url\":\"Category\",\"url_type\":null,\"style\":\"am-icon-tags\"},{\"id\":\"18\",\"name\":\"行业类别\",\"status\":\"1\",\"pid\":\"17\",\"addtime\":\"2017-08-24 15:01:20\",\"url\":\"Category\\/industry\",\"url_type\":null,\"style\":null},{\"id\":\"21\",\"name\":\"新增行业分类\",\"status\":\"0\",\"pid\":\"18\",\"addtime\":\"2017-08-24 15:26:00\",\"url\":\"Category\\/add_industry\",\"url_type\":null,\"style\":null},{\"id\":\"22\",\"name\":\"编辑行业类别\",\"status\":\"0\",\"pid\":\"18\",\"addtime\":\"2017-08-24 16:11:15\",\"url\":\"Category\\/edit_industry\",\"url_type\":null,\"style\":null},{\"id\":\"23\",\"name\":\"删除行业类别\",\"status\":\"0\",\"pid\":\"18\",\"addtime\":\"2017-08-24 16:15:58\",\"url\":\"Category\\/del_industry\",\"url_type\":null,\"style\":null},{\"id\":\"19\",\"name\":\"服务类别\",\"status\":\"1\",\"pid\":\"17\",\"addtime\":\"2017-08-24 15:01:58\",\"url\":\"Category\\/service\",\"url_type\":null,\"style\":null},{\"id\":\"24\",\"name\":\"新增服务类型\",\"status\":\"0\",\"pid\":\"19\",\"addtime\":\"2017-08-24 17:11:32\",\"url\":\"Category\\/add_service\",\"url_type\":null,\"style\":null},{\"id\":\"25\",\"name\":\"编辑服务类型\",\"status\":\"0\",\"pid\":\"19\",\"addtime\":\"2017-08-24 17:12:00\",\"url\":\"Category\\/edit_service\",\"url_type\":null,\"style\":null},{\"id\":\"26\",\"name\":\"删除服务类型\",\"status\":\"0\",\"pid\":\"19\",\"addtime\":\"2017-08-24 17:12:30\",\"url\":\"Category\\/del_service\",\"url_type\":null,\"style\":null},{\"id\":\"20\",\"name\":\"技术板块\",\"status\":\"1\",\"pid\":\"17\",\"addtime\":\"2017-08-24 15:02:32\",\"url\":\"Category\\/technology\",\"url_type\":null,\"style\":null},{\"id\":\"27\",\"name\":\"新增技术板块\",\"status\":\"0\",\"pid\":\"20\",\"addtime\":\"2017-08-24 17:12:56\",\"url\":\"Category\\/add_technology\",\"url_type\":null,\"style\":null},{\"id\":\"28\",\"name\":\"编辑技术板块\",\"status\":\"0\",\"pid\":\"20\",\"addtime\":\"2017-08-24 17:13:57\",\"url\":\"Category\\/edit_technology\",\"url_type\":null,\"style\":null},{\"id\":\"29\",\"name\":\"删除技术板块\",\"status\":\"0\",\"pid\":\"20\",\"addtime\":\"2017-08-24 17:14:33\",\"url\":\"Category\\/del_technology\",\"url_type\":null,\"style\":null},{\"id\":\"30\",\"name\":\"合同管理\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":\"2017-08-25 09:05:03\",\"url\":\"Contract\\/index\",\"url_type\":null,\"style\":\"am-icon-tags\"},{\"id\":\"36\",\"name\":\"新增合同\",\"status\":\"0\",\"pid\":\"30\",\"addtime\":\"2017-08-27 17:36:58\",\"url\":\"Contract\\/add_contract\",\"url_type\":null,\"style\":null},{\"id\":\"37\",\"name\":\"编辑合同\",\"status\":\"0\",\"pid\":\"30\",\"addtime\":\"2017-08-27 17:37:19\",\"url\":\"Contract\\/edit_contract\",\"url_type\":null,\"style\":null},{\"id\":\"38\",\"name\":\"删除合同\",\"status\":\"0\",\"pid\":\"30\",\"addtime\":\"2017-08-27 17:37:49\",\"url\":\"Contract\\/del_contract_state\",\"url_type\":null,\"style\":null},{\"id\":\"31\",\"name\":\"项目管理\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":\"2017-08-25 09:05:41\",\"url\":\"Project\\/index\",\"url_type\":null,\"style\":\"am-icon-tags\"}]', '2017-08-15 09:37:38');
INSERT INTO `h_user_group` VALUES ('3', '测试用户组', '测试用户组', 'upload/icon/2017-08-16_102343.png', '1', '[{\"id\":\"1\",\"name\":\"管理员 | 用户\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"member\",\"url_type\":null,\"style\":\"am-icon-user-secret\"},{\"id\":\"3\",\"name\":\"权限管理\",\"status\":\"1\",\"pid\":\"1\",\"addtime\":\"2017-08-14 15:29:42\",\"url\":\"Member\\/power\",\"url_type\":null,\"style\":\"\"},{\"id\":\"4\",\"name\":\"添加权限\",\"status\":\"0\",\"pid\":\"3\",\"addtime\":\"2017-08-14 15:31:18\",\"url\":\"Member\\/add_power\",\"url_type\":null,\"style\":\"\"},{\"id\":\"9\",\"name\":\"编辑权限\",\"status\":\"0\",\"pid\":\"3\",\"addtime\":\"2017-08-15 11:35:43\",\"url\":\"Member\\/edit_power\",\"url_type\":null,\"style\":null},{\"id\":\"10\",\"name\":\"删除权限\",\"status\":\"0\",\"pid\":\"3\",\"addtime\":\"2017-08-15 11:36:05\",\"url\":\"Member\\/del_power\",\"url_type\":null,\"style\":null}]', '2017-08-16 10:23:43');

-- ----------------------------
-- Table structure for h_user_member
-- ----------------------------
DROP TABLE IF EXISTS `h_user_member`;
CREATE TABLE `h_user_member` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `avatar` varchar(350) DEFAULT NULL COMMENT '头像',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `status` int(1) DEFAULT '0' COMMENT '用户状态   用户待审核0   用户正常1',
  `gid` int(10) DEFAULT NULL COMMENT '用户组',
  `incumbency` varchar(10) DEFAULT NULL COMMENT '在职状态  ',
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
  `part` int(2) DEFAULT NULL COMMENT '专兼职   1专职  0兼职',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of h_user_member
-- ----------------------------
INSERT INTO `h_user_member` VALUES ('1', 'admin', null, 'e10adc3949ba59abbe56e057f20f883e', '1', '1', '1', null, null, null, null, null, null, null, '1', null, null, '2017-08-10 15:20:08', '1', null);
INSERT INTO `h_user_member` VALUES ('2', '测试1234', 'upload/avater/2017-08-22_171254.jpg', null, null, '3', '在职', '1838478362833', '12313', '234242', '4241234@qq.com', '34234', '234234', '234234', '1', '', '234234', '2017-08-22 17:16:09', '0', '1');
INSERT INTO `h_user_member` VALUES ('3', '测试三', 'upload/avater/2017-08-22_172111.jpg', 'e10adc3949ba59abbe56e057f20f883e', '0', '3', '在职', '345898765434567898765', '345678765432', '45345', '35434535@qq.com', '3456', '23456', '345678', '0', '', '23234234', '2017-08-22 17:21:11', '0', '1');

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

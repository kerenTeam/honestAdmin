/*
Navicat MySQL Data Transfer

Source Server         : 120.78.73.217
Source Server Version : 50505
Source Host           : 120.78.73.217:3306
Source Database       : honestv1mysql

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-10-19 12:27:45
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of h_category
-- ----------------------------
INSERT INTO `h_category` VALUES ('1', '城镇燃气', '2017-08-24 15:55:26', '1', '1');
INSERT INTO `h_category` VALUES ('2', '道路桥梁', '2017-08-24 15:55:43', '1', '1');
INSERT INTO `h_category` VALUES ('3', '电力', '2017-08-24 16:03:42', '1', '1');
INSERT INTO `h_category` VALUES ('4', '非煤矿山', '2017-08-24 16:04:02', '1', '1');
INSERT INTO `h_category` VALUES ('5', '工贸', '2017-08-24 16:04:59', '1', '1');
INSERT INTO `h_category` VALUES ('6', '化工', '2017-08-24 16:26:13', '1', '1');
INSERT INTO `h_category` VALUES ('7', '安标', '2017-08-24 16:27:22', '1', '2');
INSERT INTO `h_category` VALUES ('8', '安标复审', '2017-08-24 16:29:50', '1', '2');
INSERT INTO `h_category` VALUES ('9', '委外', '2017-08-25 09:21:34', '1', '3');
INSERT INTO `h_category` VALUES ('10', '机械电子', '2017-08-30 09:49:18', '1', '1');
INSERT INTO `h_category` VALUES ('11', '加油加气站', '2017-08-30 09:49:26', '1', '1');
INSERT INTO `h_category` VALUES ('12', '涉路施工', '2017-08-30 09:49:35', '1', '1');
INSERT INTO `h_category` VALUES ('13', '石油天然气', '2017-08-30 09:49:48', '1', '1');
INSERT INTO `h_category` VALUES ('14', '铁路', '2017-08-30 09:49:58', '1', '1');
INSERT INTO `h_category` VALUES ('15', '尾矿', '2017-08-30 09:51:54', '1', '1');
INSERT INTO `h_category` VALUES ('16', '冶金', '2017-08-30 09:52:06', '1', '1');
INSERT INTO `h_category` VALUES ('17', '安全评估', '2017-08-30 09:52:40', '1', '2');
INSERT INTO `h_category` VALUES ('18', '地灾', '2017-08-30 09:52:53', '1', '2');
INSERT INTO `h_category` VALUES ('19', '环评', '2017-08-30 09:53:00', '1', '2');
INSERT INTO `h_category` VALUES ('20', '控评', '2017-08-30 09:53:47', '1', '2');
INSERT INTO `h_category` VALUES ('21', '论证', '2017-08-30 09:53:55', '1', '2');
INSERT INTO `h_category` VALUES ('22', '能评', '2017-08-30 09:54:03', '1', '2');
INSERT INTO `h_category` VALUES ('23', '其它', '2017-08-30 09:54:10', '1', '2');
INSERT INTO `h_category` VALUES ('24', '现状', '2017-08-30 09:54:17', '1', '2');
INSERT INTO `h_category` VALUES ('25', '验收', '2017-08-30 09:54:25', '1', '2');
INSERT INTO `h_category` VALUES ('26', '应急预案', '2017-08-30 09:54:34', '1', '2');
INSERT INTO `h_category` VALUES ('27', '预评', '2017-08-30 09:54:42', '1', '2');
INSERT INTO `h_category` VALUES ('28', '职检', '2017-08-30 09:54:50', '1', '2');
INSERT INTO `h_category` VALUES ('29', '重大危险源', '2017-08-30 09:54:58', '1', '2');
INSERT INTO `h_category` VALUES ('30', '专篇', '2017-08-30 09:55:04', '1', '2');
INSERT INTO `h_category` VALUES ('31', '专项评价', '2017-08-30 09:55:12', '1', '2');
INSERT INTO `h_category` VALUES ('32', '咨询', '2017-08-30 09:55:23', '1', '2');
INSERT INTO `h_category` VALUES ('33', '综合分析', '2017-08-30 09:55:29', '1', '2');
INSERT INTO `h_category` VALUES ('34', '职卫', '2017-08-30 09:55:56', '1', '3');
INSERT INTO `h_category` VALUES ('35', '安全', '2017-08-30 09:56:03', '1', '3');
INSERT INTO `h_category` VALUES ('36', '咨询', '2017-08-30 09:56:15', '1', '3');

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
  `contract_price` varchar(100) DEFAULT '' COMMENT '合同金额',
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  `title` varchar(255) DEFAULT NULL COMMENT '合同名称',
  `customer_id` int(10) DEFAULT NULL COMMENT '客户id',
  `del_state` int(2) DEFAULT '0' COMMENT '删除状态   0正常   1删除',
  `contract_situation` varchar(500) DEFAULT NULL COMMENT '合同情况',
  `estimate_price` varchar(50) DEFAULT NULL COMMENT '预估金额',
  `review_price` varchar(20) DEFAULT NULL COMMENT '约定评审费',
  `prepay` varchar(20) DEFAULT NULL COMMENT '约定预付',
  `expenditure` varchar(20) DEFAULT NULL COMMENT '约定代支',
  `remaks` varchar(255) DEFAULT NULL COMMENT '备注',
  `completion_status` int(11) DEFAULT '0' COMMENT '完成状态   0未完成   1已完成待财务收款   2收款完成 待归档  3归档完成  ',
  `complete_time` datetime DEFAULT NULL COMMENT '完成时间',
  `contract_file` varchar(255) DEFAULT NULL COMMENT '合同文件',
  `entrust_file` varchar(255) DEFAULT NULL COMMENT '委托书文件',
  `receivables_state` varchar(255) DEFAULT '1' COMMENT '收款状态  1待收款  2已收款',
  `lssued_state` int(11) DEFAULT '1' COMMENT '合同分项状态。0已分发。 1未分发',
  `projectNum` int(11) DEFAULT '1' COMMENT '合同下属有多少个项目',
  PRIMARY KEY (`contract_id`)
) ENGINE=MyISAM AUTO_INCREMENT=542 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of h_contract
-- ----------------------------
INSERT INTO `h_contract` VALUES ('541', '2013', '13AB001', '四川', '阿坝', null, '12', '10', '0', '23', '2017-09-29', '225', '10000', '2017-10-18 16:08:59', '黑水县冰川加气站', '9', '0', null, null, null, null, null, null, '0', null, null, null, '1', '0', '1');
INSERT INTO `h_contract` VALUES ('536', '2017', '201710152', '安徽', '池州市', '东至县', '35', '14', '0', '31', '2017-10-15', '2', '234234', '2017-10-15 16:28:54', '324234', '9', '0', null, '234', '23423423', '423432', '423423', '4234234234', '0', null, null, null, '1', '1', '1');
INSERT INTO `h_contract` VALUES ('537', '2017', '201710153', '江西', '萍乡市', '上栗县', '34', '14', '0', '31', '2017-10-14', '141', '2342342', '2017-10-15 16:54:41', '3424234', '9', '0', null, '42343434', '2342342', '23424', '234234', '24234234', '0', null, 'upload/contract/3424234.docx', 'upload/entrust/34242341.docx', '1', '0', '0');

-- ----------------------------
-- Table structure for h_contract_account
-- ----------------------------
DROP TABLE IF EXISTS `h_contract_account`;
CREATE TABLE `h_contract_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '合同收支表',
  `type` int(11) DEFAULT NULL COMMENT '收支类型   1收入    2支出    3开票',
  `contract_id` int(11) DEFAULT NULL COMMENT '合同id',
  `price` varchar(255) DEFAULT NULL COMMENT '金额',
  `voucher` varchar(255) DEFAULT NULL COMMENT '凭证',
  `time` varchar(200) DEFAULT NULL COMMENT '收款时间',
  `handler` varchar(255) DEFAULT NULL COMMENT '经办人',
  `receivables` varchar(255) DEFAULT NULL COMMENT '收款方式',
  `detailed` varchar(255) DEFAULT NULL COMMENT '明细',
  `reimbursement` varchar(255) DEFAULT NULL COMMENT '报销人',
  `approval` varchar(255) DEFAULT NULL COMMENT '批准人',
  `billing_type` varchar(255) DEFAULT NULL COMMENT '开票类型',
  `invoice_num` varchar(255) DEFAULT NULL COMMENT '发票号',
  `remaks` varchar(255) DEFAULT NULL COMMENT '备注',
  `expenditure_type` int(11) DEFAULT NULL COMMENT '支出类型',
  `contract_number` varchar(200) DEFAULT NULL COMMENT '合同号',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of h_contract_account
-- ----------------------------
INSERT INTO `h_contract_account` VALUES ('1', '1', '541', '5000', '123', '12-10-2017', '142', '现金', '', null, null, null, null, '', null, null, null);
INSERT INTO `h_contract_account` VALUES ('2', '3', '541', '5000', null, '14-10-2017', null, null, null, null, null, '', '232323', '', null, null, null);
INSERT INTO `h_contract_account` VALUES ('3', '2', '541', '1000', null, '43031', null, '现金', null, '225', '142', null, null, null, '3', '13AB001', null);
INSERT INTO `h_contract_account` VALUES ('4', '2', '541', '1000', null, '2017-10-23', null, '现金', null, '225', '142', null, null, null, '3', '13AB001', null);
INSERT INTO `h_contract_account` VALUES ('5', '3', '541', '1200', null, '2013-04-03', null, null, null, null, null, null, '1234566543', '2342342', null, '13AB001', null);
INSERT INTO `h_contract_account` VALUES ('6', '3', '541', '1200', null, '2013-04-03', null, null, null, null, null, null, '1234566543', '2342342', null, '13AB001', null);

-- ----------------------------
-- Table structure for h_customer
-- ----------------------------
DROP TABLE IF EXISTS `h_customer`;
CREATE TABLE `h_customer` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '客户表',
  `contract_number` varchar(20) DEFAULT '' COMMENT '合同号',
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
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of h_customer
-- ----------------------------
INSERT INTO `h_customer` VALUES ('9', '13AB001', '示例1', '1', '南充市丝绸路1号', null, '四川', '南充', '顺庆区', '12345678', null, null, '123123', '123123', '213123', '123123', null, '123123', '142', '1', '2017-09-29 21:54:06');

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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of h_customer_contacts
-- ----------------------------
INSERT INTO `h_customer_contacts` VALUES ('7', '9', '张捷', '示例1', '1', '1', '1582727232', null, null, '2323', null, '12', '142', null);

-- ----------------------------
-- Table structure for h_project
-- ----------------------------
DROP TABLE IF EXISTS `h_project`;
CREATE TABLE `h_project` (
  `c_id` int(20) NOT NULL COMMENT '所属合同',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '项目表',
  `c_number` varchar(20) DEFAULT NULL COMMENT '合同号',
  `year` varchar(255) DEFAULT NULL COMMENT '年度',
  `title` varchar(255) DEFAULT NULL COMMENT '项目名称',
  `province` varchar(255) DEFAULT NULL COMMENT '省',
  `city` varchar(255) DEFAULT NULL COMMENT '市',
  `town` varchar(255) DEFAULT NULL COMMENT '区',
  `contacts` varchar(255) DEFAULT NULL COMMENT '联系人',
  `contacts_address` varchar(255) DEFAULT NULL COMMENT '联系人地址',
  `phone` varchar(255) DEFAULT NULL COMMENT '联系电话',
  `signing` varchar(255) DEFAULT NULL COMMENT '签订人',
  `signing_date` varchar(255) DEFAULT NULL COMMENT '签订时间',
  `military` int(11) DEFAULT NULL COMMENT '是否军工  1是  0 否',
  `technology_id` int(11) DEFAULT NULL COMMENT '技术板块',
  `service_id` int(11) DEFAULT NULL COMMENT '服务类型',
  `industry_id` int(11) DEFAULT NULL COMMENT '行业',
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `del_state` int(11) DEFAULT '0' COMMENT '删除状态  1是  0正常状态',
  `cycle` varchar(255) DEFAULT NULL COMMENT '完成周期',
  `requirement` varchar(255) DEFAULT NULL COMMENT '附带要求',
  `project_status` int(1) DEFAULT '0' COMMENT '项目完成状态   1完成   0 未完成  ',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `responsible_user` int(11) DEFAULT NULL COMMENT '第一负责人',
  `scene_time` varchar(23) DEFAULT NULL COMMENT '去现场时间',
  PRIMARY KEY (`id`,`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of h_project
-- ----------------------------
INSERT INTO `h_project` VALUES ('537', '84', '201710153', '2017', '测试项目', '上海', '县', '崇明县', '7', null, null, null, null, '1', '34', '19', '5', '2017-10-16 16:32:49', '0', '70', '没有', '0', '2123', '142', '');
INSERT INTO `h_project` VALUES ('536', '88', '201710152', '2017', '12212', '安徽', '亳州市', '利辛县', '7', null, null, null, null, '1', '35', '20', '5', '2017-10-18 15:07:26', '0', '', '', '0', '', '142', '12马克思');
INSERT INTO `h_project` VALUES ('541', '90', '13AB001', '2013', '中国石油天然气股份有限公司四川南充销售分公司东观加油站', '四川', '南充', null, '7', null, null, null, null, '0', '9', '23', '13', '2017-10-18 16:09:16', '0', '无', null, '1', null, null, null);
INSERT INTO `h_project` VALUES ('541', '91', '13AB001', '2013', '中国石油天然气股份有限公司四川南充销售分公司东观加油站', '四川', '南充', null, '7', null, null, null, null, '0', '9', '23', '13', '2017-10-18 16:36:51', '0', '无', null, '1', null, '142', null);
INSERT INTO `h_project` VALUES ('541', '92', '13AB001', '2013', '中国石油天然气股份有限公司四川南充销售分公司东观加油站', '四川', '南充', null, '7', null, null, null, null, '0', '9', '23', '13', '2017-10-18 16:37:40', '0', '无', null, '1', null, '142', null);
INSERT INTO `h_project` VALUES ('541', '93', '13AB001', '2013', '中国石油天然气股份有限公司四川南充销售分公司东观加油站', '四川', '南充', null, '7', null, null, null, null, '0', '9', '23', '13', '2017-10-18 16:38:08', '0', '无', null, '1', null, '142', null);

-- ----------------------------
-- Table structure for h_project_edition
-- ----------------------------
DROP TABLE IF EXISTS `h_project_edition`;
CREATE TABLE `h_project_edition` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务三大节点',
  `type` int(1) DEFAULT '1' COMMENT '所属状态  1送审版  2修订版  3最终版 ',
  `situation` varchar(255) DEFAULT NULL COMMENT '内容',
  `deliver_time` datetime DEFAULT NULL COMMENT '交付时间',
  `express_num` varchar(255) DEFAULT NULL COMMENT '快递单号',
  `express_name` varchar(255) DEFAULT NULL COMMENT '快递公司',
  `project_id` int(11) DEFAULT NULL COMMENT '所属任务',
  `file_name` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT '0' COMMENT '版本状态。0未审核  1审核成功。2审核失败',
  `auditor` int(11) DEFAULT NULL COMMENT '审核专家',
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of h_project_edition
-- ----------------------------
INSERT INTO `h_project_edition` VALUES ('68', '1', '信息', '2017-10-18 00:00:00', '2323', '345', '93', '23223', null, '0', null);
INSERT INTO `h_project_edition` VALUES ('69', '2', '2013/5/29交雷静瑶', '2013-05-29 00:00:00', null, null, '90', null, null, '0', null);

-- ----------------------------
-- Table structure for h_project_group
-- ----------------------------
DROP TABLE IF EXISTS `h_project_group`;
CREATE TABLE `h_project_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务组',
  `project_id` int(11) DEFAULT NULL COMMENT '任务id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户',
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `type` int(11) DEFAULT '1' COMMENT '任务类型。1第一编织人。2去现场人员。3收集资料人员。 4技术负责人。 5 审核人。6项目负责人。',
  `state` int(1) DEFAULT '1' COMMENT '人员状态。 1正常。0取消任务',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of h_project_group
-- ----------------------------
INSERT INTO `h_project_group` VALUES ('1', '76', '143', '2017-09-29 23:31:10', '1', '1');
INSERT INTO `h_project_group` VALUES ('2', '77', '142', '2017-10-16 16:52:53', '1', '1');
INSERT INTO `h_project_group` VALUES ('3', '77', '2', '2017-10-16 16:52:53', '2', '1');

-- ----------------------------
-- Table structure for h_project_message
-- ----------------------------
DROP TABLE IF EXISTS `h_project_message`;
CREATE TABLE `h_project_message` (
  `m_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '任务留言',
  `user_id` int(11) DEFAULT NULL COMMENT '用户',
  `project_id` int(11) DEFAULT NULL COMMENT '任务',
  `content` varchar(11) DEFAULT NULL COMMENT '留言内容',
  `to_user_id` int(11) DEFAULT '0' COMMENT '恢复留言id',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '时间',
  PRIMARY KEY (`m_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of h_project_message
-- ----------------------------
INSERT INTO `h_project_message` VALUES ('1', '142', '77', '2342432', '0', '2017-10-17 10:55:12');
INSERT INTO `h_project_message` VALUES ('2', '142', '77', '12344', '0', '2017-10-17 10:55:20');
INSERT INTO `h_project_message` VALUES ('3', '142', '77', '123', '0', '2017-10-17 10:55:18');
INSERT INTO `h_project_message` VALUES ('12', '142', '77', '12', '0', '2017-10-17 10:55:29');
INSERT INTO `h_project_message` VALUES ('11', '142', '77', '2', '0', '2017-10-17 10:55:27');
INSERT INTO `h_project_message` VALUES ('10', '142', '77', '', '0', '2017-10-17 10:55:32');
INSERT INTO `h_project_message` VALUES ('9', '142', '77', '123', '0', '2017-10-17 10:55:16');
INSERT INTO `h_project_message` VALUES ('13', '142', '77', '12', '0', '2017-10-17 10:55:23');
INSERT INTO `h_project_message` VALUES ('14', '142', '77', '2323', '0', '2017-10-17 10:55:25');
INSERT INTO `h_project_message` VALUES ('15', '142', '77', '1231233123', '10', '2017-10-17 10:41:33');
INSERT INTO `h_project_message` VALUES ('16', '142', '77', '1231233123', '10', '2017-10-17 10:41:47');
INSERT INTO `h_project_message` VALUES ('17', '142', '77', '二房东舒服', '14', '2017-10-17 10:42:04');
INSERT INTO `h_project_message` VALUES ('18', '142', '77', '2345654', '0', '2017-10-17 11:05:05');

-- ----------------------------
-- Table structure for h_project_record
-- ----------------------------
DROP TABLE IF EXISTS `h_project_record`;
CREATE TABLE `h_project_record` (
  `record_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '纪录表',
  `project_id` int(11) DEFAULT NULL COMMENT '任务类型',
  `file_name` varchar(50) DEFAULT NULL COMMENT '文件名称',
  `file_path` varchar(255) DEFAULT NULL COMMENT '文件路径',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `content` varchar(255) DEFAULT NULL COMMENT '内容',
  `task_id` int(11) DEFAULT NULL COMMENT '所属任务',
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of h_project_record
-- ----------------------------

-- ----------------------------
-- Table structure for h_project_task
-- ----------------------------
DROP TABLE IF EXISTS `h_project_task`;
CREATE TABLE `h_project_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务表',
  `project_id` int(11) DEFAULT NULL COMMENT '项目id',
  `contract_number` varchar(20) DEFAULT NULL COMMENT '合同号',
  `Issued_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '下达时间',
  `completion_time` varchar(255) DEFAULT NULL COMMENT '完成时限',
  `go_scene` varchar(255) DEFAULT NULL COMMENT '去现场时间',
  `compiling_personnel` varchar(255) DEFAULT NULL COMMENT '第一编制人',
  `state` varchar(255) DEFAULT '1' COMMENT '任务状态   0删除    1正常',
  `content` varchar(255) DEFAULT NULL COMMENT '任务内容',
  `technology_personnel` varchar(255) DEFAULT NULL COMMENT '技术负责人',
  `admin_user` int(11) DEFAULT NULL COMMENT '发布人',
  `responsibility` varchar(255) DEFAULT NULL COMMENT '项目负责人',
  `examine` varchar(255) DEFAULT NULL COMMENT '审核人',
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立时间',
  `scene_user` varchar(10) DEFAULT NULL COMMENT '现场人员',
  `signature` varchar(255) DEFAULT NULL COMMENT '署名',
  `compiling` varchar(255) DEFAULT NULL COMMENT '编制人',
  `task_status` int(11) DEFAULT '0' COMMENT '完成状态   0未完成  1已完成',
  `complete_time` varchar(0) DEFAULT NULL COMMENT '完成时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of h_project_task
-- ----------------------------
INSERT INTO `h_project_task` VALUES ('75', '81', '13AB001', '2017-09-29 22:43:48', '60', '2017-03-20', '165', '1', null, '273', null, '224', '139', '2017-09-29 22:43:48', '142', '朱建立刘海峰', '165', '1', null);
INSERT INTO `h_project_task` VALUES ('77', '84', '201710153', '2017-10-16 16:52:53', '78', '下周一', '142', '1', null, '', '1', '', '', '2017-10-16 16:52:53', '2', '23', null, '0', null);

-- ----------------------------
-- Table structure for h_project_type
-- ----------------------------
DROP TABLE IF EXISTS `h_project_type`;
CREATE TABLE `h_project_type` (
  `type_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '任务纪录',
  `content` varchar(255) DEFAULT NULL COMMENT '纪录内容',
  `type` int(11) DEFAULT NULL COMMENT '纪录类型',
  `completion` int(11) DEFAULT '0' COMMENT '完成比例',
  `updataTime` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `project_id` int(11) DEFAULT NULL COMMENT '所属任务',
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of h_project_type
-- ----------------------------
INSERT INTO `h_project_type` VALUES ('1', '233', '1', '50', '2017-10-16 00:00:00', '77');

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
) ENGINE=MyISAM AUTO_INCREMENT=352 DEFAULT CHARSET=utf8mb4;

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
INSERT INTO `h_system_log` VALUES ('109', 'Category/edit_industry', '1', 'admin', '2017-08-30 09:48:16', '::1', null, '1', '修改行业类别成功,行业名称为城镇燃气');
INSERT INTO `h_system_log` VALUES ('110', 'Category/edit_industry', '1', 'admin', '2017-08-30 09:48:28', '::1', null, '1', '修改行业类别成功,行业名称为道路桥梁');
INSERT INTO `h_system_log` VALUES ('111', 'Category/edit_industry', '1', 'admin', '2017-08-30 09:48:38', '::1', null, '1', '修改行业类别成功,行业名称为电力');
INSERT INTO `h_system_log` VALUES ('112', 'Category/edit_industry', '1', 'admin', '2017-08-30 09:48:48', '::1', null, '1', '修改行业类别成功,行业名称为非煤矿山');
INSERT INTO `h_system_log` VALUES ('113', 'Category/edit_industry', '1', 'admin', '2017-08-30 09:49:01', '::1', null, '1', '修改行业类别成功,行业名称为工贸');
INSERT INTO `h_system_log` VALUES ('114', 'Category/edit_industry', '1', 'admin', '2017-08-30 09:49:09', '::1', null, '1', '修改行业类别成功,行业名称为化工');
INSERT INTO `h_system_log` VALUES ('115', 'Category/add_industry', '1', 'admin', '2017-08-30 09:49:18', '::1', null, '1', '新增行业类别成功,行业名称为机械电子');
INSERT INTO `h_system_log` VALUES ('116', 'Category/add_industry', '1', 'admin', '2017-08-30 09:49:26', '::1', null, '1', '新增行业类别成功,行业名称为加油加气站');
INSERT INTO `h_system_log` VALUES ('117', 'Category/add_industry', '1', 'admin', '2017-08-30 09:49:35', '::1', null, '1', '新增行业类别成功,行业名称为涉路施工');
INSERT INTO `h_system_log` VALUES ('118', 'Category/add_industry', '1', 'admin', '2017-08-30 09:49:48', '::1', null, '1', '新增行业类别成功,行业名称为石油天然气');
INSERT INTO `h_system_log` VALUES ('119', 'Category/add_industry', '1', 'admin', '2017-08-30 09:49:58', '::1', null, '1', '新增行业类别成功,行业名称为铁路');
INSERT INTO `h_system_log` VALUES ('120', 'Category/add_industry', '1', 'admin', '2017-08-30 09:51:54', '::1', null, '1', '新增行业类别成功,行业名称为尾矿');
INSERT INTO `h_system_log` VALUES ('121', 'Category/add_industry', '1', 'admin', '2017-08-30 09:52:06', '::1', null, '1', '新增行业类别成功,行业名称为冶金');
INSERT INTO `h_system_log` VALUES ('122', 'Category/edit_service', '1', 'admin', '2017-08-30 09:52:23', '::1', null, '1', '修改服务类别成功,服务名称为安标');
INSERT INTO `h_system_log` VALUES ('123', 'Category/edit_service', '1', 'admin', '2017-08-30 09:52:32', '::1', null, '1', '修改服务类别成功,服务名称为安标复审');
INSERT INTO `h_system_log` VALUES ('124', 'Category/add_service', '1', 'admin', '2017-08-30 09:52:40', '::1', null, '1', '新增服务类别成功,服务名称为安全评估');
INSERT INTO `h_system_log` VALUES ('125', 'Category/add_service', '1', 'admin', '2017-08-30 09:52:53', '::1', null, '1', '新增服务类别成功,服务名称为地灾');
INSERT INTO `h_system_log` VALUES ('126', 'Category/add_service', '1', 'admin', '2017-08-30 09:53:00', '::1', null, '1', '新增服务类别成功,服务名称为环评');
INSERT INTO `h_system_log` VALUES ('127', 'Category/add_service', '1', 'admin', '2017-08-30 09:53:47', '::1', null, '1', '新增服务类别成功,服务名称为控评');
INSERT INTO `h_system_log` VALUES ('128', 'Category/add_service', '1', 'admin', '2017-08-30 09:53:55', '::1', null, '1', '新增服务类别成功,服务名称为论证');
INSERT INTO `h_system_log` VALUES ('129', 'Category/add_service', '1', 'admin', '2017-08-30 09:54:03', '::1', null, '1', '新增服务类别成功,服务名称为能评');
INSERT INTO `h_system_log` VALUES ('130', 'Category/add_service', '1', 'admin', '2017-08-30 09:54:10', '::1', null, '1', '新增服务类别成功,服务名称为其它');
INSERT INTO `h_system_log` VALUES ('131', 'Category/add_service', '1', 'admin', '2017-08-30 09:54:17', '::1', null, '1', '新增服务类别成功,服务名称为现状');
INSERT INTO `h_system_log` VALUES ('132', 'Category/add_service', '1', 'admin', '2017-08-30 09:54:25', '::1', null, '1', '新增服务类别成功,服务名称为验收');
INSERT INTO `h_system_log` VALUES ('133', 'Category/add_service', '1', 'admin', '2017-08-30 09:54:34', '::1', null, '1', '新增服务类别成功,服务名称为应急预案');
INSERT INTO `h_system_log` VALUES ('134', 'Category/add_service', '1', 'admin', '2017-08-30 09:54:42', '::1', null, '1', '新增服务类别成功,服务名称为预评');
INSERT INTO `h_system_log` VALUES ('135', 'Category/add_service', '1', 'admin', '2017-08-30 09:54:50', '::1', null, '1', '新增服务类别成功,服务名称为职检');
INSERT INTO `h_system_log` VALUES ('136', 'Category/add_service', '1', 'admin', '2017-08-30 09:54:58', '::1', null, '1', '新增服务类别成功,服务名称为重大危险源');
INSERT INTO `h_system_log` VALUES ('137', 'Category/add_service', '1', 'admin', '2017-08-30 09:55:04', '::1', null, '1', '新增服务类别成功,服务名称为专篇');
INSERT INTO `h_system_log` VALUES ('138', 'Category/add_service', '1', 'admin', '2017-08-30 09:55:12', '::1', null, '1', '新增服务类别成功,服务名称为专项评价');
INSERT INTO `h_system_log` VALUES ('139', 'Category/add_service', '1', 'admin', '2017-08-30 09:55:23', '::1', null, '1', '新增服务类别成功,服务名称为咨询');
INSERT INTO `h_system_log` VALUES ('140', 'Category/add_service', '1', 'admin', '2017-08-30 09:55:29', '::1', null, '1', '新增服务类别成功,服务名称为综合分析');
INSERT INTO `h_system_log` VALUES ('141', 'Category/edit_technology', '1', 'admin', '2017-08-30 09:55:47', '::1', null, '1', '修改技术类别成功,技术名称为委外');
INSERT INTO `h_system_log` VALUES ('142', 'Category/add_technology', '1', 'admin', '2017-08-30 09:55:56', '::1', null, '1', '新增技术类别成功,技术名称为职卫');
INSERT INTO `h_system_log` VALUES ('143', 'Category/add_technology', '1', 'admin', '2017-08-30 09:56:03', '::1', null, '1', '新增技术类别成功,技术名称为安全');
INSERT INTO `h_system_log` VALUES ('144', 'Category/add_technology', '1', 'admin', '2017-08-30 09:56:15', '::1', null, '1', '新增技术类别成功,技术名称为咨询');
INSERT INTO `h_system_log` VALUES ('145', 'Project/import_Project', '1', 'admin', '2017-08-30 10:12:08', '::1', null, '1', '导入了项目信息，导入成功48条，失败0条，失败条目：');
INSERT INTO `h_system_log` VALUES ('146', 'Project/del_project', '1', 'admin', '2017-08-30 10:20:10', '::1', null, '1', '删除项目到回收站成功,项目id为1');
INSERT INTO `h_system_log` VALUES ('147', 'Project/edit_project', '1', 'admin', '2017-08-30 11:01:37', '::1', null, '1', '编辑项目成功,项目名称为南部县流马加油站新建项目');
INSERT INTO `h_system_log` VALUES ('148', 'Customer/import_customer', '1', 'admin', '2017-09-03 16:48:05', '::1', null, '1', '导入了客户信息，导入成功1条，失败0条，失败条目：');
INSERT INTO `h_system_log` VALUES ('149', 'Customer/add_customer_user', '1', 'admin', '2017-09-03 16:53:48', '::1', null, '1', '新增客户联系人成功,联系人名称为12');
INSERT INTO `h_system_log` VALUES ('150', 'Member/edit_power', '1', 'admin', '2017-09-03 17:08:41', '::1', null, '1', '编辑权限成功,权限名称为职员组管理');
INSERT INTO `h_system_log` VALUES ('151', 'Member/edit_power', '1', 'admin', '2017-09-03 17:09:02', '::1', null, '1', '编辑权限成功,权限名称为职员列表');
INSERT INTO `h_system_log` VALUES ('152', 'Member/import_userList', '1', 'admin', '2017-09-03 17:18:22', '::1', null, '1', '导入了职员信息，导入成功135条，失败0条，失败条目：');
INSERT INTO `h_system_log` VALUES ('153', 'Member/import_userList', '1', 'admin', '2017-09-03 17:20:46', '::1', null, '1', '导入了职员信息，导入成功135条，失败0条，失败条目：');
INSERT INTO `h_system_log` VALUES ('154', 'Member/add_power_level', '1', 'admin', '2017-09-04 09:20:34', '::1', null, '1', '新增权限成功,权限名称为新增项目');
INSERT INTO `h_system_log` VALUES ('155', 'Member/add_power_level', '1', 'admin', '2017-09-04 09:21:25', '::1', null, '1', '新增权限成功,权限名称为编辑项目');
INSERT INTO `h_system_log` VALUES ('156', 'Member/add_power_level', '1', 'admin', '2017-09-04 09:23:01', '::1', null, '1', '新增权限成功,权限名称为导入项目');
INSERT INTO `h_system_log` VALUES ('157', 'Member/add_power_level', '1', 'admin', '2017-09-04 09:23:37', '::1', null, '1', '新增权限成功,权限名称为导入合同');
INSERT INTO `h_system_log` VALUES ('158', 'Member/add_power_level', '1', 'admin', '2017-09-04 09:23:58', '::1', null, '1', '新增权限成功,权限名称为新增职员');
INSERT INTO `h_system_log` VALUES ('159', 'Member/edit_power', '1', 'admin', '2017-09-04 09:39:41', '::1', null, '1', '编辑权限成功,权限名称为新增职员');
INSERT INTO `h_system_log` VALUES ('160', 'Member/add_power_level', '1', 'admin', '2017-09-04 09:40:23', '::1', null, '1', '新增权限成功,权限名称为编辑职员');
INSERT INTO `h_system_log` VALUES ('161', 'Member/add_power_level', '1', 'admin', '2017-09-04 09:42:48', '::1', null, '1', '新增权限成功,权限名称为导入职员');
INSERT INTO `h_system_log` VALUES ('162', 'Member/group_power', '1', 'admin', '2017-09-04 09:43:22', '::1', null, '1', '修改用户组权限成功,用户组名称id为1');
INSERT INTO `h_system_log` VALUES ('163', 'Member/occupational', '1', 'admin', '2017-09-07 18:22:49', '::1', null, '1', '新增用户职卫信息成功,用户id为139');
INSERT INTO `h_system_log` VALUES ('164', 'Member/occupational', '1', 'admin', '2017-09-07 18:24:18', '::1', null, '1', '新增用户职卫信息成功,用户id为139');
INSERT INTO `h_system_log` VALUES ('165', 'Member/occupational', '1', 'admin', '2017-09-07 18:25:07', '::1', null, '1', '编辑用户职卫信息成功,用户id为139');
INSERT INTO `h_system_log` VALUES ('166', 'Member/security', '1', 'admin', '2017-09-07 18:34:34', '::1', null, '1', '新增用户学历成功,用户id为139');
INSERT INTO `h_system_log` VALUES ('167', 'Member/evaluate', '1', 'admin', '2017-09-07 18:55:17', '::1', null, '1', '新增用户学历成功,用户id为139');
INSERT INTO `h_system_log` VALUES ('168', 'Member/evaluate', '1', 'admin', '2017-09-07 19:31:18', '::1', null, '1', '编辑用户学历成功,用户id为139');
INSERT INTO `h_system_log` VALUES ('169', 'Member/expert', '1', 'admin', '2017-09-07 19:41:38', '::1', null, '1', '新增专家信息成功,用户id为139');
INSERT INTO `h_system_log` VALUES ('170', 'Member/expert', '1', 'admin', '2017-09-07 19:41:48', '::1', null, '1', '新增专家信息成功,用户id为139');
INSERT INTO `h_system_log` VALUES ('171', 'Member/expert', '1', 'admin', '2017-09-07 19:42:28', '::1', null, '1', '编辑专家信息成功,用户id为139');
INSERT INTO `h_system_log` VALUES ('172', 'Member/add_power', '1', 'admin', '2017-09-07 21:11:49', '::1', null, '1', '新增权限成功,权限名称为任务管理');
INSERT INTO `h_system_log` VALUES ('173', 'Member/group_power', '1', 'admin', '2017-09-07 21:12:06', '::1', null, '1', '修改用户组权限成功,用户组名称id为1');
INSERT INTO `h_system_log` VALUES ('174', 'Project/add_project', '1', 'admin', '2017-09-07 22:54:19', '::1', null, '1', '新增项目成功,项目名称为23456');
INSERT INTO `h_system_log` VALUES ('175', 'Project/add_project', '1', 'admin', '2017-09-07 22:54:20', '::1', null, '1', '新增项目成功,项目名称为23456');
INSERT INTO `h_system_log` VALUES ('176', 'Project/add_project', '1', 'admin', '2017-09-07 22:54:24', '::1', null, '1', '新增项目成功,项目名称为23456');
INSERT INTO `h_system_log` VALUES ('177', 'Project/add_project', '1', 'admin', '2017-09-07 22:54:25', '::1', null, '1', '新增项目成功,项目名称为23456');
INSERT INTO `h_system_log` VALUES ('178', 'Project/add_project', '1', 'admin', '2017-09-07 22:54:26', '::1', null, '1', '新增项目成功,项目名称为23456');
INSERT INTO `h_system_log` VALUES ('179', 'Project/add_project', '1', 'admin', '2017-09-07 22:54:27', '::1', null, '1', '新增项目成功,项目名称为23456');
INSERT INTO `h_system_log` VALUES ('180', 'Project/add_project', '1', 'admin', '2017-09-07 22:54:28', '::1', null, '1', '新增项目成功,项目名称为23456');
INSERT INTO `h_system_log` VALUES ('181', 'Project/add_project', '1', 'admin', '2017-09-07 22:54:29', '::1', null, '1', '新增项目成功,项目名称为23456');
INSERT INTO `h_system_log` VALUES ('182', 'Project/add_project', '1', 'admin', '2017-09-07 22:54:30', '::1', null, '1', '新增项目成功,项目名称为23456');
INSERT INTO `h_system_log` VALUES ('183', 'Project/add_project', '1', 'admin', '2017-09-07 22:54:54', '::1', null, '1', '新增项目成功,项目名称为23456');
INSERT INTO `h_system_log` VALUES ('184', 'Project/add_project', '1', 'admin', '2017-09-07 22:54:55', '::1', null, '1', '新增项目成功,项目名称为23456');
INSERT INTO `h_system_log` VALUES ('185', 'Project/add_project', '1', 'admin', '2017-09-07 22:54:56', '::1', null, '1', '新增项目成功,项目名称为23456');
INSERT INTO `h_system_log` VALUES ('186', 'Project/add_project', '1', 'admin', '2017-09-07 22:54:57', '::1', null, '1', '新增项目成功,项目名称为23456');
INSERT INTO `h_system_log` VALUES ('187', 'Project/add_project', '1', 'admin', '2017-09-07 22:55:12', '::1', null, '1', '新增项目成功,项目名称为23456');
INSERT INTO `h_system_log` VALUES ('188', 'Project/add_project', '1', 'admin', '2017-09-07 22:55:13', '::1', null, '1', '新增项目成功,项目名称为23456');
INSERT INTO `h_system_log` VALUES ('189', 'Project/add_project', '1', 'admin', '2017-09-07 22:55:14', '::1', null, '1', '新增项目成功,项目名称为23456');
INSERT INTO `h_system_log` VALUES ('190', 'Project/add_project', '1', 'admin', '2017-09-07 22:55:34', '::1', null, '1', '新增项目成功,项目名称为23456');
INSERT INTO `h_system_log` VALUES ('191', 'Project/add_project', '1', 'admin', '2017-09-07 22:55:45', '::1', null, '1', '新增项目成功,项目名称为23456');
INSERT INTO `h_system_log` VALUES ('192', 'Project/add_project', '1', 'admin', '2017-09-07 22:55:49', '::1', null, '1', '新增项目成功,项目名称为23456');
INSERT INTO `h_system_log` VALUES ('193', 'Project/add_project', '1', 'admin', '2017-09-07 22:55:50', '::1', null, '1', '新增项目成功,项目名称为23456');
INSERT INTO `h_system_log` VALUES ('194', 'Project/add_project', '1', 'admin', '2017-09-07 22:55:50', '::1', null, '1', '新增项目成功,项目名称为23456');
INSERT INTO `h_system_log` VALUES ('195', 'Project/add_project', '1', 'admin', '2017-09-07 22:55:50', '::1', null, '1', '新增项目成功,项目名称为23456');
INSERT INTO `h_system_log` VALUES ('196', 'Project/add_project', '1', 'admin', '2017-09-07 22:55:51', '::1', null, '1', '新增项目成功,项目名称为23456');
INSERT INTO `h_system_log` VALUES ('197', 'Project/add_project', '1', 'admin', '2017-09-07 22:55:51', '::1', null, '1', '新增项目成功,项目名称为23456');
INSERT INTO `h_system_log` VALUES ('198', 'Project/add_project', '1', 'admin', '2017-09-07 22:55:52', '::1', null, '1', '新增项目成功,项目名称为23456');
INSERT INTO `h_system_log` VALUES ('199', 'Project/add_project', '1', 'admin', '2017-09-07 22:56:52', '::1', null, '1', '新增项目成功,项目名称为345678');
INSERT INTO `h_system_log` VALUES ('200', 'Project/edit_project', '1', 'admin', '2017-09-07 23:02:08', '::1', null, '1', '编辑项目成功,项目名称为345678所属');
INSERT INTO `h_system_log` VALUES ('201', 'Project/edit_project', '1', 'admin', '2017-09-07 23:03:05', '::1', null, '1', '编辑项目成功,项目名称为345678所属123');
INSERT INTO `h_system_log` VALUES ('202', 'Project/edit_project', '1', 'admin', '2017-09-07 23:08:43', '::1', null, '1', '编辑项目成功,项目名称为345678所属1231');
INSERT INTO `h_system_log` VALUES ('203', 'Task/add_task', '1', 'admin', '2017-09-08 11:59:58', '::1', null, '1', '新增任务成功,项目id为6');
INSERT INTO `h_system_log` VALUES ('204', 'Task/edit_task', '1', 'admin', '2017-09-08 15:25:07', '::1', null, '1', '编辑任务成功,项目id为6');
INSERT INTO `h_system_log` VALUES ('205', 'Task/del_task', '1', 'admin', '2017-09-08 15:27:51', '::1', null, '1', '删除任务成功,任务id为1');
INSERT INTO `h_system_log` VALUES ('206', 'Task/add_task_edition', '1', 'admin', '2017-09-09 11:53:37', '::1', null, '1', '新增任务送审版成功,任务id为2');
INSERT INTO `h_system_log` VALUES ('207', 'Task/add_task_edition', '1', 'admin', '2017-09-09 14:49:50', '::1', null, '1', '新增任务送审版成功,任务id为2');
INSERT INTO `h_system_log` VALUES ('208', 'Task/final_edition', '1', 'admin', '2017-09-09 14:51:14', '::1', null, '1', '新增任务最终版成功,任务id为2');
INSERT INTO `h_system_log` VALUES ('209', 'Member/add_power', '1', 'admin', '2017-09-09 15:06:48', '::1', null, '1', '新增权限成功,权限名称为个人中心');
INSERT INTO `h_system_log` VALUES ('210', 'Member/group_power', '1', 'admin', '2017-09-09 15:08:18', '::1', null, '1', '修改用户组权限成功,用户组名称id为1');
INSERT INTO `h_system_log` VALUES ('211', 'Member/add_power_level', '1', 'admin', '2017-09-09 15:09:23', '::1', null, '1', '新增权限成功,权限名称为个人信息');
INSERT INTO `h_system_log` VALUES ('212', 'Member/add_power_level', '1', 'admin', '2017-09-09 15:10:00', '::1', null, '1', '新增权限成功,权限名称为个人任务');
INSERT INTO `h_system_log` VALUES ('213', 'Member/group_power', '1', 'admin', '2017-09-09 15:10:11', '::1', null, '1', '修改用户组权限成功,用户组名称id为1');
INSERT INTO `h_system_log` VALUES ('214', 'Member/add_power', '1', 'admin', '2017-09-09 15:22:40', '::1', null, '1', '新增权限成功,权限名称为财务管理');
INSERT INTO `h_system_log` VALUES ('215', 'Member/group_power', '1', 'admin', '2017-09-09 15:22:59', '::1', null, '1', '修改用户组权限成功,用户组名称id为1');
INSERT INTO `h_system_log` VALUES ('216', 'Finance/complete_add', '1', 'admin', '2017-09-10 15:31:34', '::1', null, '1', '新增收入记录成功,合同id为');
INSERT INTO `h_system_log` VALUES ('217', 'Finance/complete_add', '1', 'admin', '2017-09-10 15:32:15', '::1', null, '1', '新增收入记录成功,合同id为6');
INSERT INTO `h_system_log` VALUES ('218', 'Finance/complete_add', '1', 'admin', '2017-09-10 15:33:17', '::1', null, '1', '新增收入记录成功,合同id为6');
INSERT INTO `h_system_log` VALUES ('219', 'Finance/edit_complete', '1', 'admin', '2017-09-10 15:33:56', '::1', null, '1', '修改收入记录成功,记录id为3');
INSERT INTO `h_system_log` VALUES ('220', 'Finance/expenditure_add', '1', 'admin', '2017-09-10 17:17:24', '::1', null, '1', '新增支出记录成功,合同id为6');
INSERT INTO `h_system_log` VALUES ('221', 'Finance/edit_expenditure', '1', 'admin', '2017-09-10 17:19:00', '::1', null, '1', '修改支出记录成功,记录id为2');
INSERT INTO `h_system_log` VALUES ('222', 'Finance/edit_expenditure', '1', 'admin', '2017-09-10 17:20:12', '::1', null, '1', '修改支出记录成功,记录id为6');
INSERT INTO `h_system_log` VALUES ('223', 'Finance/expenditure_add', '1', 'admin', '2017-09-10 17:36:34', '::1', null, '1', '新增支出记录成功,合同id为6');
INSERT INTO `h_system_log` VALUES ('224', 'Finance/expenditure_add', '1', 'admin', '2017-09-10 17:37:12', '::1', null, '1', '新增支出记录成功,合同id为6');
INSERT INTO `h_system_log` VALUES ('225', 'Finance/billing_add', '1', 'admin', '2017-09-10 18:09:20', '::1', null, '1', '新增开票记录成功,合同id为6');
INSERT INTO `h_system_log` VALUES ('226', 'Finance/edit_billing', '1', 'admin', '2017-09-10 18:11:18', '::1', null, '1', '修改开票记录成功,记录id为9');
INSERT INTO `h_system_log` VALUES ('227', 'Finance/del_Balance', '1', 'admin', '2017-09-10 18:19:51', '::1', null, '1', '删除收入记录成功,合同id为6');
INSERT INTO `h_system_log` VALUES ('228', 'Finance/billing_add', '1', 'admin', '2017-09-10 18:21:30', '::1', null, '1', '新增开票记录成功,合同id为6');
INSERT INTO `h_system_log` VALUES ('229', 'Contract/add_contract', '1', 'admin', '2017-09-13 19:47:17', '::1', null, '1', '新增合同成功,合同名称为2345打发士大夫');
INSERT INTO `h_system_log` VALUES ('230', 'Contract/add_contract', '1', 'admin', '2017-09-13 19:59:44', '::1', null, '1', '新增合同成功,合同名称为ytyrty');
INSERT INTO `h_system_log` VALUES ('231', 'Contract/edit_contract', '1', 'admin', '2017-09-14 09:46:26', '::1', null, '1', '修改合同成功,合同名称为ytyrty');
INSERT INTO `h_system_log` VALUES ('232', 'Member/add_power', '1', 'admin', '2017-09-14 10:02:02', '::1', null, '1', '新增权限成功,权限名称为系统日志');
INSERT INTO `h_system_log` VALUES ('233', 'Member/group_power', '1', 'admin', '2017-09-14 10:02:14', '::1', null, '1', '修改用户组权限成功,用户组名称id为1');
INSERT INTO `h_system_log` VALUES ('234', 'Customer/add_customer', '1', 'admin', '2017-09-15 11:09:05', '::1', null, '1', '新增客户成功,客户名称为成都市高兴');
INSERT INTO `h_system_log` VALUES ('235', 'Contract/add_contract', '1', 'admin', '2017-09-15 11:16:54', '::1', null, '1', '新增合同成功,合同名称为cedhi ');
INSERT INTO `h_system_log` VALUES ('236', 'Member/add_power_level', '1', 'admin', '2017-09-28 13:43:08', '::1', null, '1', '新增权限成功,权限名称为导入客户信息');
INSERT INTO `h_system_log` VALUES ('237', 'Project/edit_project', '1', 'admin', '2017-09-29 11:56:17', '::1', null, '1', '编辑项目成功,项目名称为345678所属1231');
INSERT INTO `h_system_log` VALUES ('238', 'Member/group_power', '1', 'admin', '2017-09-29 13:55:46', '::1', null, '1', '修改用户组权限成功,用户组名称id为2');
INSERT INTO `h_system_log` VALUES ('239', 'Customer/import_customer', '1', 'admin', '2017-09-29 15:30:38', '::1', null, '1', '导入了客户信息，导入成功1条，失败0条，失败条目：');
INSERT INTO `h_system_log` VALUES ('240', 'contract/import_contract', '1', 'admin', '2017-09-29 16:00:46', '::1', null, '1', '导入了商品信息，导入成功36条，失败0条，失败条目：');
INSERT INTO `h_system_log` VALUES ('241', 'contract/import_contract', '1', 'admin', '2017-09-29 16:04:08', '::1', null, '1', '导入了商品信息，导入成功36条，失败0条，失败条目：');
INSERT INTO `h_system_log` VALUES ('242', 'contract/import_contract', '1', 'admin', '2017-09-29 16:25:40', '::1', null, '1', '导入了商品信息，导入成功1条，失败0条，失败条目：');
INSERT INTO `h_system_log` VALUES ('243', 'contract/import_contract', '1', 'admin', '2017-09-29 16:26:20', '::1', null, '1', '导入了商品信息，导入成功1条，失败0条，失败条目：');
INSERT INTO `h_system_log` VALUES ('244', 'contract/import_contract', '1', 'admin', '2017-09-29 16:27:10', '::1', null, '1', '导入了商品信息，导入成功1条，失败0条，失败条目：');
INSERT INTO `h_system_log` VALUES ('245', 'Project/import_Project', '1', 'admin', '2017-09-29 16:53:48', '::1', null, '1', '导入了项目信息，导入成功1条，失败0条，失败条目：');
INSERT INTO `h_system_log` VALUES ('246', 'Contract/del_contract_state', '1', 'admin', '2017-09-29 16:55:29', '::1', null, '1', '删除合同成功,合同id为531');
INSERT INTO `h_system_log` VALUES ('247', 'Contract/del_contract_state', '1', 'admin', '2017-09-29 16:55:33', '::1', null, '1', '删除合同成功,合同id为532');
INSERT INTO `h_system_log` VALUES ('248', 'Project/import_Project', '1', 'admin', '2017-09-29 17:15:34', '::1', null, '1', '导入了项目信息，导入成功1条，失败0条，失败条目：');
INSERT INTO `h_system_log` VALUES ('249', 'Project/import_Project', '1', 'admin', '2017-09-29 17:23:04', '::1', null, '1', '导入了项目信息，导入成功1条，失败0条，失败条目：');
INSERT INTO `h_system_log` VALUES ('250', 'Project/import_Project', '1', 'admin', '2017-09-29 17:24:49', '::1', null, '1', '导入了项目信息，导入成功1条，失败0条，失败条目：');
INSERT INTO `h_system_log` VALUES ('251', 'Customer/import_customer', '1', 'admin', '2017-09-29 21:46:58', '::1', null, '1', '导入了客户信息，导入成功1条，失败0条，失败条目：');
INSERT INTO `h_system_log` VALUES ('252', 'Customer/edit_customer_status', '1', 'admin', '2017-09-29 21:47:48', '::1', null, '1', '删除客户联系人成功,联系人id为1');
INSERT INTO `h_system_log` VALUES ('253', 'Customer/edit_customer_status', '1', 'admin', '2017-09-29 21:49:44', '::1', null, '1', '删除客户联系人成功,联系人id为6');
INSERT INTO `h_system_log` VALUES ('254', 'Customer/import_customer', '1', 'admin', '2017-09-29 21:49:51', '::1', null, '1', '导入了客户信息，导入成功1条，失败0条，失败条目：');
INSERT INTO `h_system_log` VALUES ('255', 'Customer/edit_customer_status', '1', 'admin', '2017-09-29 21:51:29', '::1', null, '1', '删除客户联系人成功,联系人id为7');
INSERT INTO `h_system_log` VALUES ('256', 'Customer/import_customer', '1', 'admin', '2017-09-29 21:52:06', '::1', null, '1', '导入了客户信息，导入成功1条，失败0条，失败条目：');
INSERT INTO `h_system_log` VALUES ('257', 'Customer/edit_customer_status', '1', 'admin', '2017-09-29 21:53:33', '::1', null, '1', '删除客户联系人成功,联系人id为8');
INSERT INTO `h_system_log` VALUES ('258', 'Customer/import_customer', '1', 'admin', '2017-09-29 21:54:06', '::1', null, '1', '导入了客户信息，导入成功1条，失败0条，失败条目：');
INSERT INTO `h_system_log` VALUES ('259', 'contract/import_contract', '1', 'admin', '2017-09-29 21:55:49', '::1', null, '1', '导入了商品信息，导入成功1条，失败0条，失败条目：');
INSERT INTO `h_system_log` VALUES ('260', 'contract/import_contract', '1', 'admin', '2017-09-29 21:58:15', '::1', null, '1', '导入了商品信息，导入成功1条，失败0条，失败条目：');
INSERT INTO `h_system_log` VALUES ('261', 'Project/import_Project', '1', 'admin', '2017-09-29 21:58:49', '::1', null, '1', '导入了项目信息，导入成功1条，失败0条，失败条目：');
INSERT INTO `h_system_log` VALUES ('262', 'Task/del_task', '1', 'admin', '2017-09-29 22:07:48', '::1', null, '1', '删除任务成功,任务id为2');
INSERT INTO `h_system_log` VALUES ('263', 'task/import_task', '1', 'admin', '2017-09-29 22:42:53', '::1', null, '1', '导入了项目信息，导入成功1条，失败0条，失败条目：');
INSERT INTO `h_system_log` VALUES ('264', 'task/import_task', '1', 'admin', '2017-09-29 22:43:48', '::1', null, '1', '导入了项目信息，导入成功1条，失败0条，失败条目：');
INSERT INTO `h_system_log` VALUES ('265', 'Task/add_task_edition', '1', 'admin', '2017-09-29 23:10:23', '::1', null, '1', '编辑任务送审版成功,任务id为');
INSERT INTO `h_system_log` VALUES ('266', 'Task/add_task_edition', '1', 'admin', '2017-09-29 23:11:26', '::1', null, '1', '编辑任务送审版成功,任务id为');
INSERT INTO `h_system_log` VALUES ('267', 'Task/add_task_edition', '1', 'admin', '2017-09-29 23:11:42', '::1', null, '1', '编辑任务送审版成功,任务id为');
INSERT INTO `h_system_log` VALUES ('268', 'Task/add_task_edition', '1', 'admin', '2017-09-29 23:12:27', '::1', null, '1', '编辑任务送审版成功,任务id为');
INSERT INTO `h_system_log` VALUES ('269', 'Task/add_task_edition', '1', 'admin', '2017-09-29 23:25:06', '::1', null, '1', '编辑任务送审版成功,任务id为75');
INSERT INTO `h_system_log` VALUES ('270', 'Task/revise_edition', '1', 'admin', '2017-09-29 23:26:43', '::1', null, '1', '编辑任务修订版成功,任务id为75');
INSERT INTO `h_system_log` VALUES ('271', 'Task/add_task', '1', 'admin', '2017-09-29 23:31:10', '::1', null, '1', '新增任务成功,项目id为81');
INSERT INTO `h_system_log` VALUES ('272', 'Task/final_edition', '1', 'admin', '2017-09-29 23:38:25', '::1', null, '1', '新增任务最终版成功,任务id为76');
INSERT INTO `h_system_log` VALUES ('273', 'Project/add_project', '1', 'admin', '2017-09-30 00:48:57', '::1', null, '1', '新增项目成功,项目名称为213123');
INSERT INTO `h_system_log` VALUES ('274', 'Project/add_project', '1', 'admin', '2017-09-30 00:49:28', '::1', null, '1', '新增项目成功,项目名称为2345');
INSERT INTO `h_system_log` VALUES ('275', 'Member/del_power', '1', 'admin', '2017-09-30 10:17:29', '::1', null, '1', '删除权限成功');
INSERT INTO `h_system_log` VALUES ('276', 'Member/add_power_level', '1', 'admin', '2017-09-30 10:18:22', '::1', null, '1', '新增权限成功,权限名称为删除项目');
INSERT INTO `h_system_log` VALUES ('277', 'Project/del_project', '1', 'admin', '2017-09-30 12:42:08', '::1', null, '1', '删除项目到回收站成功,项目id为82');
INSERT INTO `h_system_log` VALUES ('278', 'Project/del_project', '1', 'admin', '2017-09-30 12:42:28', '::1', null, '1', '删除项目到回收站成功,项目id为83');
INSERT INTO `h_system_log` VALUES ('279', 'Project/del_project', '1', 'admin', '2017-09-30 12:42:49', '::1', null, '1', '删除项目到回收站成功,项目id为81');
INSERT INTO `h_system_log` VALUES ('280', 'Task/edit_task_status/76', '1', 'admin', '2017-10-14 11:56:45', '::1', null, '0', '确认任务完成,任务id为76');
INSERT INTO `h_system_log` VALUES ('281', 'Task/edit_task_status/76', '1', 'admin', '2017-10-14 11:56:46', '::1', null, '0', '确认任务完成,任务id为76');
INSERT INTO `h_system_log` VALUES ('282', 'Task/edit_task_status/76', '1', 'admin', '2017-10-14 11:56:48', '::1', null, '0', '确认任务完成,任务id为76');
INSERT INTO `h_system_log` VALUES ('283', 'Task/edit_task_status/76', '1', 'admin', '2017-10-14 11:56:49', '::1', null, '0', '确认任务完成,任务id为76');
INSERT INTO `h_system_log` VALUES ('284', 'Task/edit_task_status/76', '1', 'admin', '2017-10-14 11:56:50', '::1', null, '0', '确认任务完成,任务id为76');
INSERT INTO `h_system_log` VALUES ('285', 'Task/edit_task_status/76', '1', 'admin', '2017-10-14 11:56:52', '::1', null, '0', '确认任务完成,任务id为76');
INSERT INTO `h_system_log` VALUES ('286', 'Task/edit_task_status/76', '1', 'admin', '2017-10-14 11:56:53', '::1', null, '0', '确认任务完成,任务id为76');
INSERT INTO `h_system_log` VALUES ('287', 'Task/edit_task_status/76', '1', 'admin', '2017-10-14 11:56:53', '::1', null, '0', '确认任务完成,任务id为76');
INSERT INTO `h_system_log` VALUES ('288', 'task/Import_projectState', '1', 'admin', '2017-10-14 16:54:10', '::1', null, '1', '导入了任务状态信息，导入成功2条，失败0条，失败条目：');
INSERT INTO `h_system_log` VALUES ('289', 'task/Import_projectState', '1', 'admin', '2017-10-14 16:55:00', '::1', null, '1', '导入了任务状态信息，导入成功2条，失败0条，失败条目：');
INSERT INTO `h_system_log` VALUES ('290', 'task/Import_projectState', '1', 'admin', '2017-10-14 16:58:44', '::1', null, '1', '导入了任务状态信息，导入成功2条，失败0条，失败条目：');
INSERT INTO `h_system_log` VALUES ('291', 'task/Import_projectState', '1', 'admin', '2017-10-14 17:01:19', '::1', null, '1', '导入了任务状态信息，导入成功2条，失败0条，失败条目：');
INSERT INTO `h_system_log` VALUES ('292', 'task/Import_projectState', '1', 'admin', '2017-10-14 17:01:44', '::1', null, '1', '导入了任务状态信息，导入成功2条，失败0条，失败条目：');
INSERT INTO `h_system_log` VALUES ('293', 'task/Import_projectState', '1', 'admin', '2017-10-14 17:04:01', '::1', null, '1', '导入了任务状态信息，导入成功2条，失败0条，失败条目：');
INSERT INTO `h_system_log` VALUES ('294', 'Task/add_task_edition', '1', 'admin', '2017-10-15 13:02:40', '::1', null, '1', '新增任务记录成功,任务类型为1');
INSERT INTO `h_system_log` VALUES ('295', 'Task/edit_task_edition', '1', 'admin', '2017-10-15 16:12:48', '::1', null, '1', '编辑任务记录成功,任务类型为1,任务记录id是：65');
INSERT INTO `h_system_log` VALUES ('296', 'Contract/add_contract', '1', 'admin', '2017-10-15 16:28:54', '::1', null, '1', '新增合同成功,合同名称为324234');
INSERT INTO `h_system_log` VALUES ('297', 'Contract/add_contract', '1', 'admin', '2017-10-15 16:54:41', '::1', null, '1', '新增合同成功,合同名称为3424234');
INSERT INTO `h_system_log` VALUES ('298', 'Project/del_project', '1', 'admin', '2017-10-16 16:20:58', '::1', null, '1', '删除项目到回收站成功,项目id为82');
INSERT INTO `h_system_log` VALUES ('299', 'Project/add_project', '1', 'admin', '2017-10-16 16:32:49', '::1', null, '1', '新增项目成功,项目名称为测试项目');
INSERT INTO `h_system_log` VALUES ('300', 'Task/add_task', '1', 'admin', '2017-10-16 16:52:53', '::1', null, '1', '新增任务成功,项目id为84');
INSERT INTO `h_system_log` VALUES ('301', 'Member/group_power', '1', 'admin', '2017-10-16 16:56:00', '::1', null, '1', '修改用户组权限成功,用户组名称id为2');
INSERT INTO `h_system_log` VALUES ('302', 'UserCenter/add_message', '142', '唐蓉生', '2017-10-17 10:22:26', '::1', null, '1', '新增留言成功,任务id为77');
INSERT INTO `h_system_log` VALUES ('303', 'UserCenter/add_message', '142', '唐蓉生', '2017-10-17 10:27:09', '::1', null, '1', '新增留言成功,任务id为77');
INSERT INTO `h_system_log` VALUES ('304', 'UserCenter/add_message', '142', '唐蓉生', '2017-10-17 10:28:40', '::1', null, '1', '新增留言成功,任务id为77');
INSERT INTO `h_system_log` VALUES ('305', 'UserCenter/add_message', '142', '唐蓉生', '2017-10-17 10:31:53', '::1', null, '1', '新增留言成功,任务id为77');
INSERT INTO `h_system_log` VALUES ('306', 'UserCenter/add_message', '142', '唐蓉生', '2017-10-17 10:31:57', '::1', null, '1', '新增留言成功,任务id为77');
INSERT INTO `h_system_log` VALUES ('307', 'UserCenter/add_message', '142', '唐蓉生', '2017-10-17 10:33:49', '::1', null, '1', '新增留言成功,任务id为77');
INSERT INTO `h_system_log` VALUES ('308', 'UserCenter/add_message', '142', '唐蓉生', '2017-10-17 10:33:51', '::1', null, '1', '新增留言成功,任务id为77');
INSERT INTO `h_system_log` VALUES ('309', 'UserCenter/add_message', '142', '唐蓉生', '2017-10-17 10:33:55', '::1', null, '1', '新增留言成功,任务id为77');
INSERT INTO `h_system_log` VALUES ('310', 'UserCenter/add_message', '142', '唐蓉生', '2017-10-17 10:34:56', '::1', null, '1', '新增留言成功,任务id为77');
INSERT INTO `h_system_log` VALUES ('311', 'UserCenter/add_message', '142', '唐蓉生', '2017-10-17 10:36:27', '::1', null, '1', '新增留言成功,任务id为77');
INSERT INTO `h_system_log` VALUES ('312', 'UserCenter/add_message', '142', '唐蓉生', '2017-10-17 10:36:34', '::1', null, '1', '新增留言成功,任务id为77');
INSERT INTO `h_system_log` VALUES ('313', 'UserCenter/add_message', '142', '唐蓉生', '2017-10-17 10:37:01', '::1', null, '1', '新增留言成功,任务id为77');
INSERT INTO `h_system_log` VALUES ('314', 'UserCenter/add_message', '142', '唐蓉生', '2017-10-17 10:37:16', '::1', null, '1', '新增留言成功,任务id为77');
INSERT INTO `h_system_log` VALUES ('315', 'UserCenter/add_message', '142', '唐蓉生', '2017-10-17 10:37:24', '::1', null, '1', '新增留言成功,任务id为77');
INSERT INTO `h_system_log` VALUES ('316', 'UserCenter/add_message', '142', '唐蓉生', '2017-10-17 10:41:33', '::1', null, '1', '新增留言成功,任务id为77');
INSERT INTO `h_system_log` VALUES ('317', 'UserCenter/add_message', '142', '唐蓉生', '2017-10-17 10:41:47', '::1', null, '1', '新增留言成功,任务id为77');
INSERT INTO `h_system_log` VALUES ('318', 'UserCenter/add_message', '142', '唐蓉生', '2017-10-17 10:42:04', '::1', null, '1', '新增留言成功,任务id为77');
INSERT INTO `h_system_log` VALUES ('319', 'UserCenter/add_message', '142', '唐蓉生', '2017-10-17 11:05:05', '::1', null, '1', '新增留言成功,任务id为77');
INSERT INTO `h_system_log` VALUES ('320', 'Contract/edit_contract', '1', 'admin', '2017-10-17 16:57:48', '::1', null, '1', '修改合同成功,合同名称为3424234');
INSERT INTO `h_system_log` VALUES ('321', 'Contract/del_contract_state', '1', 'admin', '2017-10-18 10:34:44', '::1', null, '1', '删除合同成功,合同id为537');
INSERT INTO `h_system_log` VALUES ('322', 'Contract/del_contract_state', '1', 'admin', '2017-10-18 10:34:46', '::1', null, '1', '删除合同成功,合同id为537');
INSERT INTO `h_system_log` VALUES ('323', 'Project/edit_project', '1', 'admin', '2017-10-18 11:54:06', '::1', null, '1', '编辑项目成功,项目名称为3424234');
INSERT INTO `h_system_log` VALUES ('324', 'Project/edit_project', '1', 'admin', '2017-10-18 11:54:09', '::1', null, '1', '编辑项目成功,项目名称为3424234');
INSERT INTO `h_system_log` VALUES ('325', 'Project/edit_project', '1', 'admin', '2017-10-18 11:54:11', '::1', null, '1', '编辑项目成功,项目名称为3424234');
INSERT INTO `h_system_log` VALUES ('326', 'Project/edit_project', '1', 'admin', '2017-10-18 11:54:18', '::1', null, '1', '编辑项目成功,项目名称为3424234');
INSERT INTO `h_system_log` VALUES ('327', 'Contract/add_project', '1', 'admin', '2017-10-18 11:56:48', '::1', null, '1', '新增项目成功,项目名称为3424234');
INSERT INTO `h_system_log` VALUES ('328', 'Contract/add_project', '1', 'admin', '2017-10-18 12:10:50', '::1', null, '1', '新增项目成功,项目名称为3424234');
INSERT INTO `h_system_log` VALUES ('329', 'Project/add_project', '1', 'admin', '2017-10-18 15:07:26', '::1', null, '1', '新增项目成功,项目名称为12212');
INSERT INTO `h_system_log` VALUES ('330', 'Project/edit_project', '1', 'admin', '2017-10-18 15:25:47', '::1', null, '1', '编辑项目成功,项目名称为测试项目');
INSERT INTO `h_system_log` VALUES ('331', 'contract/import_contract', '1', 'admin', '2017-10-18 15:52:59', '::1', null, '1', '导入了商品信息，导入成功1条，失败0条，失败条目：');
INSERT INTO `h_system_log` VALUES ('332', 'Project/import_Project', '1', 'admin', '2017-10-18 16:04:46', '::1', null, '1', '导入了项目信息，导入成功1条，失败0条，失败条目：');
INSERT INTO `h_system_log` VALUES ('333', 'Contract/del_contract_state', '1', 'admin', '2017-10-18 16:05:12', '::1', null, '1', '删除合同成功,合同id为535');
INSERT INTO `h_system_log` VALUES ('334', 'Project/del_project', '1', 'admin', '2017-10-18 16:05:19', '::1', null, '1', '删除项目到回收站成功,项目id为89');
INSERT INTO `h_system_log` VALUES ('335', 'Project/del_project', '1', 'admin', '2017-10-18 16:05:20', '::1', null, '1', '删除项目到回收站成功,项目id为89');
INSERT INTO `h_system_log` VALUES ('336', 'Project/import_Project', '1', 'admin', '2017-10-18 16:06:36', '::1', null, '1', '导入了项目信息，导入成功0条，失败1条，失败条目：2');
INSERT INTO `h_system_log` VALUES ('337', 'contract/import_contract', '1', 'admin', '2017-10-18 16:09:00', '::1', null, '1', '导入了商品信息，导入成功1条，失败0条，失败条目：');
INSERT INTO `h_system_log` VALUES ('338', 'Project/import_Project', '1', 'admin', '2017-10-18 16:09:16', '::1', null, '1', '导入了项目信息，导入成功1条，失败0条，失败条目：');
INSERT INTO `h_system_log` VALUES ('339', 'Project/import_Project', '1', 'admin', '2017-10-18 16:36:52', '::1', null, '1', '导入了项目信息，导入成功1条，失败10条，失败条目：3,4,5,6,7,8,9,10,11,12');
INSERT INTO `h_system_log` VALUES ('340', 'Project/import_Project', '1', 'admin', '2017-10-18 16:37:41', '::1', null, '1', '导入了项目信息，导入成功1条，失败10条，失败条目：3,4,5,6,7,8,9,10,11,12');
INSERT INTO `h_system_log` VALUES ('341', 'Project/import_Project', '1', 'admin', '2017-10-18 16:38:08', '::1', null, '1', '导入了项目信息，导入成功1条，失败10条，失败条目：3,4,5,6,7,8,9,10,11,12');
INSERT INTO `h_system_log` VALUES ('342', 'Project/add_task_edition', '1', 'admin', '2017-10-18 17:39:03', '::1', null, '1', '新增任务记录成功,任务类型为1');
INSERT INTO `h_system_log` VALUES ('343', 'Project/add_task_edition', '1', 'admin', '2017-10-18 17:39:22', '::1', null, '1', '新增任务记录成功,任务类型为1');
INSERT INTO `h_system_log` VALUES ('344', 'Project/add_task_edition', '1', 'admin', '2017-10-18 17:45:11', '::1', null, '1', '新增任务记录成功,任务类型为1');
INSERT INTO `h_system_log` VALUES ('345', 'Project/Import_projectState', '1', 'admin', '2017-10-18 18:03:22', '::1', null, '1', '导入了任务状态信息，导入成功2条，失败0条，失败条目：');
INSERT INTO `h_system_log` VALUES ('346', 'Project/del_edition', '1', 'admin', '2017-10-18 18:22:47', '::1', null, '1', '删除任务记录成功,任务记录id是：70');
INSERT INTO `h_system_log` VALUES ('347', 'Finance/complete_add', '1', 'admin', '2017-10-19 10:20:35', '::1', null, '1', '新增收入记录成功,合同id为541');
INSERT INTO `h_system_log` VALUES ('348', 'Finance/billing_add', '1', 'admin', '2017-10-19 10:21:21', '::1', null, '1', '新增开票记录成功,合同id为541');
INSERT INTO `h_system_log` VALUES ('349', 'Finance/Import_expenditure', '1', 'admin', '2017-10-19 11:58:52', '::1', null, '1', '导入了合同支出信息，导入成功1条，失败8条，失败条目：3,4,5,6,7,8,9,10');
INSERT INTO `h_system_log` VALUES ('350', 'Finance/Import_expenditure', '1', 'admin', '2017-10-19 12:07:19', '::1', null, '1', '导入了合同支出信息，导入成功1条，失败8条，失败条目：3,4,5,6,7,8,9,10');
INSERT INTO `h_system_log` VALUES ('351', 'Finance/Import_billing', '1', 'admin', '2017-10-19 12:22:17', '::1', null, '1', '导入了合同开票信息，导入成功1条，失败0条，失败条目：');

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
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of h_system_nav
-- ----------------------------
INSERT INTO `h_system_nav` VALUES ('1', '管理员 | 用户', '1', '0', null, 'member', null, 'am-icon-user-secret');
INSERT INTO `h_system_nav` VALUES ('2', '客户管理', '1', '0', '2017-08-14 14:35:07', 'Customer/index', null, 'am-icon-user-secret');
INSERT INTO `h_system_nav` VALUES ('3', '权限管理', '1', '1', '2017-08-14 15:29:42', 'Member/power', null, '');
INSERT INTO `h_system_nav` VALUES ('4', '添加权限', '0', '3', '2017-08-14 15:31:18', 'Member/add_power', null, '');
INSERT INTO `h_system_nav` VALUES ('9', '编辑权限', '0', '3', '2017-08-15 11:35:43', 'Member/edit_power', null, null);
INSERT INTO `h_system_nav` VALUES ('10', '删除权限', '0', '3', '2017-08-15 11:36:05', 'Member/del_power', null, null);
INSERT INTO `h_system_nav` VALUES ('11', '职员组管理', '1', '1', '2017-08-15 11:37:22', 'Member/userGroup', null, '');
INSERT INTO `h_system_nav` VALUES ('12', '新增成员组', '0', '11', '2017-08-15 12:03:42', 'Member/add_userGroup', null, null);
INSERT INTO `h_system_nav` VALUES ('13', '编辑成员组', '0', '11', '2017-08-15 12:04:22', 'Member/edit_userGroup', null, null);
INSERT INTO `h_system_nav` VALUES ('14', '删除成员组', '0', '11', '2017-08-15 12:04:57', 'Member/del_userGroup', null, null);
INSERT INTO `h_system_nav` VALUES ('15', '修改成员组权限', '0', '11', '2017-08-15 12:05:45', 'Member/edit_group_power', null, null);
INSERT INTO `h_system_nav` VALUES ('16', '职员列表', '1', '1', '2017-08-16 10:29:49', 'Member/user_List', null, '');
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
INSERT INTO `h_system_nav` VALUES ('39', '新增项目', '0', '31', '2017-09-04 09:20:34', 'Project/add_project', null, null);
INSERT INTO `h_system_nav` VALUES ('40', '编辑项目', '0', '31', '2017-09-04 09:21:25', 'Project/edit_project', null, null);
INSERT INTO `h_system_nav` VALUES ('41', '导入项目', '0', '31', '2017-09-04 09:23:01', 'Project/import_project', null, null);
INSERT INTO `h_system_nav` VALUES ('42', '导入合同', '0', '30', '2017-09-04 09:23:37', 'Contract/import_contract', null, null);
INSERT INTO `h_system_nav` VALUES ('43', '新增职员', '0', '16', '2017-09-04 09:23:58', 'Member/add_user', null, '');
INSERT INTO `h_system_nav` VALUES ('44', '编辑职员', '0', '16', '2017-09-04 09:40:23', 'Member/edit_user', null, null);
INSERT INTO `h_system_nav` VALUES ('45', '导入职员', '0', '16', '2017-09-04 09:42:48', 'Member/import_userList', null, null);
INSERT INTO `h_system_nav` VALUES ('46', '任务管理', '0', '0', '2017-09-07 21:11:49', 'Task/task_list', null, 'am-icon-tags');
INSERT INTO `h_system_nav` VALUES ('47', '个人中心', '1', '0', '2017-09-09 15:06:48', 'userCenter', null, 'am-icon-tags');
INSERT INTO `h_system_nav` VALUES ('48', '个人信息', '1', '47', '2017-09-09 15:09:23', 'UserCenter/userinfo', null, null);
INSERT INTO `h_system_nav` VALUES ('49', '个人任务', '1', '47', '2017-09-09 15:10:00', 'UserCenter/task', null, null);
INSERT INTO `h_system_nav` VALUES ('50', '财务管理', '1', '0', '2017-09-09 15:22:40', 'Finance/contract', null, 'am-icon-tags');
INSERT INTO `h_system_nav` VALUES ('51', '系统日志', '1', '0', '2017-09-14 10:02:02', 'Welcome/system_log', null, 'am-icon-list-alt');
INSERT INTO `h_system_nav` VALUES ('53', '删除项目', '0', '31', '2017-09-30 10:18:22', 'Project/del_project', null, null);

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
  `remarks` varchar(255) DEFAULT NULL,
  `education` varchar(255) DEFAULT NULL COMMENT '学历',
  `company` varchar(255) DEFAULT NULL COMMENT '单位i',
  `duties` varchar(255) DEFAULT NULL COMMENT '职务',
  `title` varchar(255) DEFAULT NULL COMMENT '职称',
  `phone1` varchar(255) DEFAULT NULL,
  `phone2` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of h_user_expert
-- ----------------------------
INSERT INTO `h_user_expert` VALUES ('1', '139', null, '3456', '', null, '234234', '打广告1', '地方', '2345665432', '3432423');

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
INSERT INTO `h_user_group` VALUES ('1', '超级管理员', '超级管理员', 'upload/icon/2017-08-15_093738.jpg', '1', '[{\"id\":\"1\",\"name\":\"管理员 | 用户\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"member\",\"url_type\":null,\"style\":\"am-icon-user-secret\"},{\"id\":\"3\",\"name\":\"权限管理\",\"status\":\"1\",\"pid\":\"1\",\"addtime\":\"2017-08-14 15:29:42\",\"url\":\"Member\\/power\",\"url_type\":null,\"style\":\"\"},{\"id\":\"4\",\"name\":\"添加权限\",\"status\":\"0\",\"pid\":\"3\",\"addtime\":\"2017-08-14 15:31:18\",\"url\":\"Member\\/add_power\",\"url_type\":null,\"style\":\"\"},{\"id\":\"9\",\"name\":\"编辑权限\",\"status\":\"0\",\"pid\":\"3\",\"addtime\":\"2017-08-15 11:35:43\",\"url\":\"Member\\/edit_power\",\"url_type\":null,\"style\":null},{\"id\":\"10\",\"name\":\"删除权限\",\"status\":\"0\",\"pid\":\"3\",\"addtime\":\"2017-08-15 11:36:05\",\"url\":\"Member\\/del_power\",\"url_type\":null,\"style\":null},{\"id\":\"11\",\"name\":\"职员组管理\",\"status\":\"1\",\"pid\":\"1\",\"addtime\":\"2017-08-15 11:37:22\",\"url\":\"Member\\/userGroup\",\"url_type\":null,\"style\":\"\"},{\"id\":\"12\",\"name\":\"新增成员组\",\"status\":\"0\",\"pid\":\"11\",\"addtime\":\"2017-08-15 12:03:42\",\"url\":\"Member\\/add_userGroup\",\"url_type\":null,\"style\":null},{\"id\":\"13\",\"name\":\"编辑成员组\",\"status\":\"0\",\"pid\":\"11\",\"addtime\":\"2017-08-15 12:04:22\",\"url\":\"Member\\/edit_userGroup\",\"url_type\":null,\"style\":null},{\"id\":\"14\",\"name\":\"删除成员组\",\"status\":\"0\",\"pid\":\"11\",\"addtime\":\"2017-08-15 12:04:57\",\"url\":\"Member\\/del_userGroup\",\"url_type\":null,\"style\":null},{\"id\":\"15\",\"name\":\"修改成员组权限\",\"status\":\"0\",\"pid\":\"11\",\"addtime\":\"2017-08-15 12:05:45\",\"url\":\"Member\\/edit_group_power\",\"url_type\":null,\"style\":null},{\"id\":\"16\",\"name\":\"职员列表\",\"status\":\"1\",\"pid\":\"1\",\"addtime\":\"2017-08-16 10:29:49\",\"url\":\"Member\\/user_List\",\"url_type\":null,\"style\":\"\"},{\"id\":\"43\",\"name\":\"新增职员\",\"status\":\"0\",\"pid\":\"16\",\"addtime\":\"2017-09-04 09:23:58\",\"url\":\"Member\\/add_user\",\"url_type\":null,\"style\":\"\"},{\"id\":\"44\",\"name\":\"编辑职员\",\"status\":\"0\",\"pid\":\"16\",\"addtime\":\"2017-09-04 09:40:23\",\"url\":\"Member\\/edit_user\",\"url_type\":null,\"style\":null},{\"id\":\"45\",\"name\":\"导入职员\",\"status\":\"0\",\"pid\":\"16\",\"addtime\":\"2017-09-04 09:42:48\",\"url\":\"Member\\/import_userList\",\"url_type\":null,\"style\":null},{\"id\":\"2\",\"name\":\"客户管理\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":\"2017-08-14 14:35:07\",\"url\":\"Customer\\/index\",\"url_type\":null,\"style\":\"am-icon-user-secret\"},{\"id\":\"32\",\"name\":\"新增客户\",\"status\":\"0\",\"pid\":\"2\",\"addtime\":\"2017-08-25 16:30:36\",\"url\":\"Customer\\/add_customer\",\"url_type\":null,\"style\":null},{\"id\":\"33\",\"name\":\"新增客户联系人\",\"status\":\"0\",\"pid\":\"2\",\"addtime\":\"2017-08-25 17:56:01\",\"url\":\"Customer\\/add_customer_user\",\"url_type\":null,\"style\":null},{\"id\":\"34\",\"name\":\"修改客户联系人\",\"status\":\"0\",\"pid\":\"2\",\"addtime\":\"2017-08-27 11:29:15\",\"url\":\"Customer\\/edit_customer_user\",\"url_type\":null,\"style\":null},{\"id\":\"35\",\"name\":\"删除客户\",\"status\":\"0\",\"pid\":\"2\",\"addtime\":\"2017-08-27 11:29:36\",\"url\":\"Customer\\/edit_customer_status\",\"url_type\":null,\"style\":null},{\"id\":\"17\",\"name\":\"分类管理\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":\"2017-08-24 15:00:23\",\"url\":\"Category\",\"url_type\":null,\"style\":\"am-icon-tags\"},{\"id\":\"18\",\"name\":\"行业类别\",\"status\":\"1\",\"pid\":\"17\",\"addtime\":\"2017-08-24 15:01:20\",\"url\":\"Category\\/industry\",\"url_type\":null,\"style\":null},{\"id\":\"21\",\"name\":\"新增行业分类\",\"status\":\"0\",\"pid\":\"18\",\"addtime\":\"2017-08-24 15:26:00\",\"url\":\"Category\\/add_industry\",\"url_type\":null,\"style\":null},{\"id\":\"22\",\"name\":\"编辑行业类别\",\"status\":\"0\",\"pid\":\"18\",\"addtime\":\"2017-08-24 16:11:15\",\"url\":\"Category\\/edit_industry\",\"url_type\":null,\"style\":null},{\"id\":\"23\",\"name\":\"删除行业类别\",\"status\":\"0\",\"pid\":\"18\",\"addtime\":\"2017-08-24 16:15:58\",\"url\":\"Category\\/del_industry\",\"url_type\":null,\"style\":null},{\"id\":\"19\",\"name\":\"服务类别\",\"status\":\"1\",\"pid\":\"17\",\"addtime\":\"2017-08-24 15:01:58\",\"url\":\"Category\\/service\",\"url_type\":null,\"style\":null},{\"id\":\"24\",\"name\":\"新增服务类型\",\"status\":\"0\",\"pid\":\"19\",\"addtime\":\"2017-08-24 17:11:32\",\"url\":\"Category\\/add_service\",\"url_type\":null,\"style\":null},{\"id\":\"25\",\"name\":\"编辑服务类型\",\"status\":\"0\",\"pid\":\"19\",\"addtime\":\"2017-08-24 17:12:00\",\"url\":\"Category\\/edit_service\",\"url_type\":null,\"style\":null},{\"id\":\"26\",\"name\":\"删除服务类型\",\"status\":\"0\",\"pid\":\"19\",\"addtime\":\"2017-08-24 17:12:30\",\"url\":\"Category\\/del_service\",\"url_type\":null,\"style\":null},{\"id\":\"20\",\"name\":\"技术板块\",\"status\":\"1\",\"pid\":\"17\",\"addtime\":\"2017-08-24 15:02:32\",\"url\":\"Category\\/technology\",\"url_type\":null,\"style\":null},{\"id\":\"27\",\"name\":\"新增技术板块\",\"status\":\"0\",\"pid\":\"20\",\"addtime\":\"2017-08-24 17:12:56\",\"url\":\"Category\\/add_technology\",\"url_type\":null,\"style\":null},{\"id\":\"28\",\"name\":\"编辑技术板块\",\"status\":\"0\",\"pid\":\"20\",\"addtime\":\"2017-08-24 17:13:57\",\"url\":\"Category\\/edit_technology\",\"url_type\":null,\"style\":null},{\"id\":\"29\",\"name\":\"删除技术板块\",\"status\":\"0\",\"pid\":\"20\",\"addtime\":\"2017-08-24 17:14:33\",\"url\":\"Category\\/del_technology\",\"url_type\":null,\"style\":null},{\"id\":\"30\",\"name\":\"合同管理\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":\"2017-08-25 09:05:03\",\"url\":\"Contract\\/index\",\"url_type\":null,\"style\":\"am-icon-tags\"},{\"id\":\"36\",\"name\":\"新增合同\",\"status\":\"0\",\"pid\":\"30\",\"addtime\":\"2017-08-27 17:36:58\",\"url\":\"Contract\\/add_contract\",\"url_type\":null,\"style\":null},{\"id\":\"37\",\"name\":\"编辑合同\",\"status\":\"0\",\"pid\":\"30\",\"addtime\":\"2017-08-27 17:37:19\",\"url\":\"Contract\\/edit_contract\",\"url_type\":null,\"style\":null},{\"id\":\"38\",\"name\":\"删除合同\",\"status\":\"0\",\"pid\":\"30\",\"addtime\":\"2017-08-27 17:37:49\",\"url\":\"Contract\\/del_contract_state\",\"url_type\":null,\"style\":null},{\"id\":\"42\",\"name\":\"导入合同\",\"status\":\"0\",\"pid\":\"30\",\"addtime\":\"2017-09-04 09:23:37\",\"url\":\"Contract\\/import_contract\",\"url_type\":null,\"style\":null},{\"id\":\"31\",\"name\":\"项目管理\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":\"2017-08-25 09:05:41\",\"url\":\"Project\\/index\",\"url_type\":null,\"style\":\"am-icon-tags\"},{\"id\":\"39\",\"name\":\"新增项目\",\"status\":\"0\",\"pid\":\"31\",\"addtime\":\"2017-09-04 09:20:34\",\"url\":\"Project\\/add_project\",\"url_type\":null,\"style\":null},{\"id\":\"40\",\"name\":\"编辑项目\",\"status\":\"0\",\"pid\":\"31\",\"addtime\":\"2017-09-04 09:21:25\",\"url\":\"Project\\/edit_project\",\"url_type\":null,\"style\":null},{\"id\":\"41\",\"name\":\"导入项目\",\"status\":\"0\",\"pid\":\"31\",\"addtime\":\"2017-09-04 09:23:01\",\"url\":\"Project\\/import_project\",\"url_type\":null,\"style\":null},{\"id\":\"46\",\"name\":\"任务管理\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":\"2017-09-07 21:11:49\",\"url\":\"Task\\/task_list\",\"url_type\":null,\"style\":\"am-icon-tags\"},{\"id\":\"47\",\"name\":\"个人中心\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":\"2017-09-09 15:06:48\",\"url\":\"userCenter\",\"url_type\":null,\"style\":\"am-icon-tags\"},{\"id\":\"48\",\"name\":\"个人信息\",\"status\":\"1\",\"pid\":\"47\",\"addtime\":\"2017-09-09 15:09:23\",\"url\":\"UserCenter\\/userinfo\",\"url_type\":null,\"style\":null},{\"id\":\"49\",\"name\":\"个人任务\",\"status\":\"1\",\"pid\":\"47\",\"addtime\":\"2017-09-09 15:10:00\",\"url\":\"UserCenter\\/task\",\"url_type\":null,\"style\":null},{\"id\":\"50\",\"name\":\"财务管理\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":\"2017-09-09 15:22:40\",\"url\":\"Finance\\/contract\",\"url_type\":null,\"style\":\"am-icon-tags\"},{\"id\":\"51\",\"name\":\"系统日志\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":\"2017-09-14 10:02:02\",\"url\":\"Welcome\\/system_log\",\"url_type\":null,\"style\":\"am-icon-list-alt\"}]', '2017-08-15 09:37:38');
INSERT INTO `h_user_group` VALUES ('3', '测试用户组', '测试用户组', 'upload/icon/2017-08-16_102343.png', '1', '[{\"id\":\"1\",\"name\":\"管理员 | 用户\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"member\",\"url_type\":null,\"style\":\"am-icon-user-secret\"},{\"id\":\"3\",\"name\":\"权限管理\",\"status\":\"1\",\"pid\":\"1\",\"addtime\":\"2017-08-14 15:29:42\",\"url\":\"Member\\/power\",\"url_type\":null,\"style\":\"\"},{\"id\":\"4\",\"name\":\"添加权限\",\"status\":\"0\",\"pid\":\"3\",\"addtime\":\"2017-08-14 15:31:18\",\"url\":\"Member\\/add_power\",\"url_type\":null,\"style\":\"\"},{\"id\":\"9\",\"name\":\"编辑权限\",\"status\":\"0\",\"pid\":\"3\",\"addtime\":\"2017-08-15 11:35:43\",\"url\":\"Member\\/edit_power\",\"url_type\":null,\"style\":null},{\"id\":\"10\",\"name\":\"删除权限\",\"status\":\"0\",\"pid\":\"3\",\"addtime\":\"2017-08-15 11:36:05\",\"url\":\"Member\\/del_power\",\"url_type\":null,\"style\":null}]', '2017-08-16 10:23:43');
INSERT INTO `h_user_group` VALUES ('2', '普通职员组', '普通职员组', null, '1', '[{\"id\":\"2\",\"name\":\"客户管理\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":\"2017-08-14 14:35:07\",\"url\":\"Customer\\/index\",\"url_type\":null,\"style\":\"am-icon-user-secret\"},{\"id\":\"32\",\"name\":\"新增客户\",\"status\":\"0\",\"pid\":\"2\",\"addtime\":\"2017-08-25 16:30:36\",\"url\":\"Customer\\/add_customer\",\"url_type\":null,\"style\":null},{\"id\":\"33\",\"name\":\"新增客户联系人\",\"status\":\"0\",\"pid\":\"2\",\"addtime\":\"2017-08-25 17:56:01\",\"url\":\"Customer\\/add_customer_user\",\"url_type\":null,\"style\":null},{\"id\":\"34\",\"name\":\"修改客户联系人\",\"status\":\"0\",\"pid\":\"2\",\"addtime\":\"2017-08-27 11:29:15\",\"url\":\"Customer\\/edit_customer_user\",\"url_type\":null,\"style\":null},{\"id\":\"30\",\"name\":\"合同管理\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":\"2017-08-25 09:05:03\",\"url\":\"Contract\\/index\",\"url_type\":null,\"style\":\"am-icon-tags\"},{\"id\":\"36\",\"name\":\"新增合同\",\"status\":\"0\",\"pid\":\"30\",\"addtime\":\"2017-08-27 17:36:58\",\"url\":\"Contract\\/add_contract\",\"url_type\":null,\"style\":null},{\"id\":\"37\",\"name\":\"编辑合同\",\"status\":\"0\",\"pid\":\"30\",\"addtime\":\"2017-08-27 17:37:19\",\"url\":\"Contract\\/edit_contract\",\"url_type\":null,\"style\":null},{\"id\":\"38\",\"name\":\"删除合同\",\"status\":\"0\",\"pid\":\"30\",\"addtime\":\"2017-08-27 17:37:49\",\"url\":\"Contract\\/del_contract_state\",\"url_type\":null,\"style\":null},{\"id\":\"31\",\"name\":\"项目管理\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":\"2017-08-25 09:05:41\",\"url\":\"Project\\/index\",\"url_type\":null,\"style\":\"am-icon-tags\"},{\"id\":\"39\",\"name\":\"新增项目\",\"status\":\"0\",\"pid\":\"31\",\"addtime\":\"2017-09-04 09:20:34\",\"url\":\"Project\\/add_project\",\"url_type\":null,\"style\":null},{\"id\":\"40\",\"name\":\"编辑项目\",\"status\":\"0\",\"pid\":\"31\",\"addtime\":\"2017-09-04 09:21:25\",\"url\":\"Project\\/edit_project\",\"url_type\":null,\"style\":null},{\"id\":\"47\",\"name\":\"个人中心\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":\"2017-09-09 15:06:48\",\"url\":\"userCenter\",\"url_type\":null,\"style\":\"am-icon-tags\"},{\"id\":\"48\",\"name\":\"个人信息\",\"status\":\"1\",\"pid\":\"47\",\"addtime\":\"2017-09-09 15:09:23\",\"url\":\"UserCenter\\/userinfo\",\"url_type\":null,\"style\":null},{\"id\":\"49\",\"name\":\"个人任务\",\"status\":\"1\",\"pid\":\"47\",\"addtime\":\"2017-09-09 15:10:00\",\"url\":\"UserCenter\\/task\",\"url_type\":null,\"style\":null}]', '2017-09-03 17:24:29');

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
  `employee_num` int(11) DEFAULT NULL COMMENT '员工编号',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=274 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of h_user_member
-- ----------------------------
INSERT INTO `h_user_member` VALUES ('1', 'admin', 'upload/avater/2017-09-30_1100002.jpg', 'e10adc3949ba59abbe56e057f20f883e', '1', '1', '1', '324234', '234234', '234234', '234234', '234234', null, null, '1', null, null, '2017-08-10 15:20:08', '1', null, null);
INSERT INTO `h_user_member` VALUES ('2', '测试1234', 'upload/avater/2017-08-22_171254.jpg', null, null, '3', '在职', '1838478362833', '12313', '234242', '4241234@qq.com', '34234', '234234', '234234', '1', '', '234234', '2017-08-22 17:16:09', '0', '1', null);
INSERT INTO `h_user_member` VALUES ('139', '刘东', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '511002197502271210', '27452', '304278936', '304278936@qq.com', '本科', '37561', null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '1');
INSERT INTO `h_user_member` VALUES ('140', '金红英', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '510103196609183444', '24368', null, null, '本科', '37681', null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '2');
INSERT INTO `h_user_member` VALUES ('141', '汪彪', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '511027195505067811', '20215', null, null, '大专', '37561', null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '3');
INSERT INTO `h_user_member` VALUES ('142', '唐蓉生', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '511027197405240014', '27173', null, 'chengshianquan@163.com', '本科', '37561', null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '4');
INSERT INTO `h_user_member` VALUES ('143', '丁婕汀', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '510311198702041766', '31812', '429014017', null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '5');
INSERT INTO `h_user_member` VALUES ('144', '陈佳', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '510105198201170529', '29968', null, null, '大专', '37834', null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '6');
INSERT INTO `h_user_member` VALUES ('145', '龚礼春', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '513624198010067472', '29500', '1203618487', '1203618487@qq.com', '本科', '39508', null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '7');
INSERT INTO `h_user_member` VALUES ('146', '李声敏', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '511521198109286820', '29857', null, null, '大专', '38108', null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '8');
INSERT INTO `h_user_member` VALUES ('147', '殷隽', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '511202198201041345', '29955', null, null, '本科', '38152', null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '9');
INSERT INTO `h_user_member` VALUES ('148', '彭超', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '513426198708305024', '32019', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '10');
INSERT INTO `h_user_member` VALUES ('149', '胡晓', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '510202197910281821', '29156', '631856161', null, '本科', '42779', null, '1', '017469378', null, '2017-09-03 17:20:46', '0', '1', '11');
INSERT INTO `h_user_member` VALUES ('150', '郑超', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '513721199002027332', '32906', null, null, '本科', '41396', null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '12');
INSERT INTO `h_user_member` VALUES ('151', '刘相元', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '510111196704261973', '24588', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '13');
INSERT INTO `h_user_member` VALUES ('152', '李多顺', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '540102195910303518', '21853', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '14');
INSERT INTO `h_user_member` VALUES ('153', '王晓波', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '512902197007020473', '25751', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '15');
INSERT INTO `h_user_member` VALUES ('154', '胡春梅', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '512926196203215266', '22726', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '16');
INSERT INTO `h_user_member` VALUES ('155', '郭三俊', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '513021197109076057', '26183', null, null, null, '38824', null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '17');
INSERT INTO `h_user_member` VALUES ('156', '况月康', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '500102198611248455\n', '31740', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '18');
INSERT INTO `h_user_member` VALUES ('157', '黎永泽', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '511324198408214737', '30915', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '19');
INSERT INTO `h_user_member` VALUES ('158', '罗志成', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '510103197301121911', '26676', null, null, '大专', '38633', null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '20');
INSERT INTO `h_user_member` VALUES ('159', '肖翔', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '510502197309282555', '26935', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '21');
INSERT INTO `h_user_member` VALUES ('160', '黎晓彬', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '511381198010165274', '29510', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '22');
INSERT INTO `h_user_member` VALUES ('161', '陈莲', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '511011198306088321', '30475', null, 'clian305@163.com', '本科', '40283', null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '23');
INSERT INTO `h_user_member` VALUES ('162', '花年祺', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '510105199206070513', '33762', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '24');
INSERT INTO `h_user_member` VALUES ('163', '徐月霞', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '370782198210140021', '30238', null, 'clearbabyabc@163.com', '硕士', '39264', null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '25');
INSERT INTO `h_user_member` VALUES ('164', '杨天义', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '510811198405032932', '30805', null, 'gzbcareer@163.com', '本科', '40575', null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '26');
INSERT INTO `h_user_member` VALUES ('165', '郑碧涛', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '510122198311149575', '30634', '153532001', '153532001@qq.com', '本科', '39174', null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '27');
INSERT INTO `h_user_member` VALUES ('166', '周才鹏', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '511126198912202112', '32862', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '28');
INSERT INTO `h_user_member` VALUES ('167', '邹彪', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '510113198912102039', '32852', null, null, '本科', '41456', null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '29');
INSERT INTO `h_user_member` VALUES ('168', '曾謇', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '511002198204210035', '30062', '6830244', '6830244@qq.com', '本科', '38572', null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '30');
INSERT INTO `h_user_member` VALUES ('169', '曾国会', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '53212619880604272X', '32298', null, 'zengguohui086@163.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '31');
INSERT INTO `h_user_member` VALUES ('170', '左灿', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '511622198808059418', '32360', '291101515', '291101515@QQ.COM', '本科', '41505', null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '32');
INSERT INTO `h_user_member` VALUES ('171', '余锦徽', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '340824198709196610', '32039', null, null, '本科', '41337', null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '33');
INSERT INTO `h_user_member` VALUES ('172', '陈帮玲', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '512928197204092621', '26398', null, null, '本科', '41000', null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '34');
INSERT INTO `h_user_member` VALUES ('173', '陈保华', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '411024198610153210', '31700', null, null, '本科', '41183', null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '35');
INSERT INTO `h_user_member` VALUES ('174', '代茂莲', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '510521199012160184', '33223', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '36');
INSERT INTO `h_user_member` VALUES ('175', '龚文正', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '510922198807101210', '32334', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '37');
INSERT INTO `h_user_member` VALUES ('176', '何丹', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '511922198807072086', '32331', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '38');
INSERT INTO `h_user_member` VALUES ('177', '胡晓平', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '513424198806080612', '32302', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '39');
INSERT INTO `h_user_member` VALUES ('178', '黄力', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '511523198711180052', '32099', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '40');
INSERT INTO `h_user_member` VALUES ('179', '寇元成', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '513022198709111937', '32031', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '41');
INSERT INTO `h_user_member` VALUES ('180', '李虹', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '512930197209275082', '26569', null, null, '本科', '40909', null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '42');
INSERT INTO `h_user_member` VALUES ('181', '李累', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '500236198910022252', '32783', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '43');
INSERT INTO `h_user_member` VALUES ('182', '刘小兰', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '511025198902030861', '32542', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '44');
INSERT INTO `h_user_member` VALUES ('183', '刘晓玉', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '510112198912112441', '32853', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '45');
INSERT INTO `h_user_member` VALUES ('184', '刘宇琦', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '510503198910037017', '32784', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '46');
INSERT INTO `h_user_member` VALUES ('185', '潘学良', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '510524198904271191', '32625', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '47');
INSERT INTO `h_user_member` VALUES ('186', '唐侄香', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '511023198801259269', '32167', null, null, '本科', '40909', null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '48');
INSERT INTO `h_user_member` VALUES ('187', '王志斌', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '410728198606123177', '31575', '416640835', '416640835@qq.com', '本科', '41334', null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '49');
INSERT INTO `h_user_member` VALUES ('188', '杨凡', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '510923199010175678', '33163', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '50');
INSERT INTO `h_user_member` VALUES ('189', '张大桓', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '510126197112156415', '26282', null, null, '大专', '40969', null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '51');
INSERT INTO `h_user_member` VALUES ('190', '赵明', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '511521198910126953', '32793', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '52');
INSERT INTO `h_user_member` VALUES ('191', '何昭明', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '510103196103260713', '22366', null, null, null, '42802', null, '0', null, '（卫生检验）         主管检验师', '2017-09-03 17:20:46', '0', '1', '53');
INSERT INTO `h_user_member` VALUES ('192', '江光平', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '519003195409050098', '19972', '404368909', '404368909@qq.com', '本科', '40118', null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '54');
INSERT INTO `h_user_member` VALUES ('193', '陈月', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '51010719860901002X', '31656', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '55');
INSERT INTO `h_user_member` VALUES ('194', '冯文', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '511102196808211422', '25071', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '56');
INSERT INTO `h_user_member` VALUES ('195', '黄志猛', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '511321198806085134', '32302', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '57');
INSERT INTO `h_user_member` VALUES ('196', '江恒', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '510104198207222119', '30154', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '58');
INSERT INTO `h_user_member` VALUES ('197', '江黎', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '510123198802294327', '32202', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '59');
INSERT INTO `h_user_member` VALUES ('198', '金锐', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '513027198002190012', '29270', '264039', '264039@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '60');
INSERT INTO `h_user_member` VALUES ('199', '雷静瑶', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '510129197808302125', '28732', '945365879', '945365879@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '61');
INSERT INTO `h_user_member` VALUES ('200', '李铭', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '513701198101030019', '29589', '37765223', '37765223@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '62');
INSERT INTO `h_user_member` VALUES ('201', '李霞', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '513401198802295726\n', '32202', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '63');
INSERT INTO `h_user_member` VALUES ('202', '李羽林', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '513021199308268712', '34207', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '64');
INSERT INTO `h_user_member` VALUES ('203', '廖帅', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '51102319880710783X', '32334', '978402033', '978402033@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '65');
INSERT INTO `h_user_member` VALUES ('204', '罗彬', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '51112319880728353X', '32352', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '66');
INSERT INTO `h_user_member` VALUES ('205', '罗利影', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '513601197908136228', '29080', '9298206', '9298206@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '67');
INSERT INTO `h_user_member` VALUES ('206', '罗志远', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '120104197111026810', '26239', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '68');
INSERT INTO `h_user_member` VALUES ('207', '吕亦瑭', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '510902199108179165', '33467', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '69');
INSERT INTO `h_user_member` VALUES ('208', '马谦强', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '142322198411243036', '31010', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '70');
INSERT INTO `h_user_member` VALUES ('209', '欧江波', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '513922198609124692', '31667', '3893547', '3893547@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '71');
INSERT INTO `h_user_member` VALUES ('210', '荣丹', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '511124198704086011', '31875', '550543786', '550543786@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '72');
INSERT INTO `h_user_member` VALUES ('211', '石建伟', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '511622198710146433', '32064', '375683278', '375683278@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '73');
INSERT INTO `h_user_member` VALUES ('212', '石思琴', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '512529197208126782', '26523', null, 'SSQ812@souhu.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '74');
INSERT INTO `h_user_member` VALUES ('213', '宋利强', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '500107198611161634', '31732', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '75');
INSERT INTO `h_user_member` VALUES ('214', '汪敬', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '51132119870205419X', '31813', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '76');
INSERT INTO `h_user_member` VALUES ('215', '汪洋', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '510821199601121331', '35076', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '77');
INSERT INTO `h_user_member` VALUES ('216', '王明', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '51101119880825705X', '32380', '361172316', '361172316@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '78');
INSERT INTO `h_user_member` VALUES ('217', '王宁', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '510181198511133631', '31364', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '79');
INSERT INTO `h_user_member` VALUES ('218', '王琼慧', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '510923198901107121', '32518', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '80');
INSERT INTO `h_user_member` VALUES ('219', '王隋', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '510824198208083724', '30171', '748800454', '748800454@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '81');
INSERT INTO `h_user_member` VALUES ('220', '王伟', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '510184198706210931', '31949', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '82');
INSERT INTO `h_user_member` VALUES ('221', '伍燕', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '511622198901114020', '32519', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '83');
INSERT INTO `h_user_member` VALUES ('222', '张浩', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '511002198912283614', '32870', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '84');
INSERT INTO `h_user_member` VALUES ('223', '张洪林', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '510623198702030612', '31811', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '85');
INSERT INTO `h_user_member` VALUES ('224', '朱建立', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '511121197502017938', '27426', null, 'chengshianquan@163.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '86');
INSERT INTO `h_user_member` VALUES ('225', '朱新国', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '510113194806180414', '17702', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '87');
INSERT INTO `h_user_member` VALUES ('226', '朱小燕', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '510522196803080263', '24905', null, 'chengshianquan@163.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '88');
INSERT INTO `h_user_member` VALUES ('227', '周树兴', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '530127680824453', '25074', '277810677', '277810677@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '89');
INSERT INTO `h_user_member` VALUES ('228', '郑自文', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '53038119851111155x', '31362', null, 'zzw8511@126.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '90');
INSERT INTO `h_user_member` VALUES ('229', '赵艳', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '610502197612227827', '28116', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '91');
INSERT INTO `h_user_member` VALUES ('230', '张忠敏', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '520102197110302467', '26236', null, 'ysdk@vip.sina.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '92');
INSERT INTO `h_user_member` VALUES ('231', '张振韬', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '450221198008091959', '29442', '317854637', '317854637@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '93');
INSERT INTO `h_user_member` VALUES ('232', '张念念', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '412702198809160048', '32402', '1301687978', '1301687978@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '94');
INSERT INTO `h_user_member` VALUES ('233', '张建军', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '610526198506282553', '31226', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '95');
INSERT INTO `h_user_member` VALUES ('234', '张丹丹', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '33072419830524341X', '30460', '5635150', '5635150@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '96');
INSERT INTO `h_user_member` VALUES ('235', '余杰珉', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '511102198806060412', '32300', '279830954', '279830954@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '97');
INSERT INTO `h_user_member` VALUES ('236', '于媛', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '610323198511285927', '31379', '348665826', '348665826@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '98');
INSERT INTO `h_user_member` VALUES ('237', '杨颖', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '511222198108010144', '29799', null, 'xalgs02@126.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '99');
INSERT INTO `h_user_member` VALUES ('238', '杨坤', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '510502197312282521', '27026', '393978055', '393978055@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '100');
INSERT INTO `h_user_member` VALUES ('239', '徐泽树', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '510521197210143554', '26586', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '101');
INSERT INTO `h_user_member` VALUES ('240', '徐安铭', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '41292419670222315X', '24525', null, 'nyanming@163.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '102');
INSERT INTO `h_user_member` VALUES ('241', '谢代安', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '512322196308274870', '23250', '514546419', '514546419@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '103');
INSERT INTO `h_user_member` VALUES ('242', '王志云', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '430403196304172054', '23118', null, 'ynjxcaoh@163.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '104');
INSERT INTO `h_user_member` VALUES ('243', '王杨福', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '510721197107297214', '26143', null, 'wangyangfu890022188@sina.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '105');
INSERT INTO `h_user_member` VALUES ('244', '王清君', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '53230119880313311X', '32215', '2438580411', '2438580411@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '106');
INSERT INTO `h_user_member` VALUES ('245', '王昊', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '610124198502273911', '31105', null, 'wanghao2872@sina.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '107');
INSERT INTO `h_user_member` VALUES ('246', '田宗斌', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '510411196601090012', '24116', '2221895597', '2221895597@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '108');
INSERT INTO `h_user_member` VALUES ('247', '唐静', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '511121198011117883', '29536', null, 'xalgs02@126.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '109');
INSERT INTO `h_user_member` VALUES ('248', '帅茧强', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '511102198902274613', '32566', '331953048', '331953048@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '110');
INSERT INTO `h_user_member` VALUES ('249', '石丽英', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '510502195304261123', '19475', '304278936', '304278936@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '111');
INSERT INTO `h_user_member` VALUES ('250', '申兴兵', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '510922197503240153', '27477', '304278936', '304278936@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '112');
INSERT INTO `h_user_member` VALUES ('251', '秦林', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '51021219760101081X', '27760', '178119519', '178119519@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '113');
INSERT INTO `h_user_member` VALUES ('252', '钱慧', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '511623198806195244', '32313', '627906176', '627906176@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '114');
INSERT INTO `h_user_member` VALUES ('253', '彭树全', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '51023019820107335X', '29958', '45323184', '45323184@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '115');
INSERT INTO `h_user_member` VALUES ('254', '罗旭', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '513030197209120613', '26554', null, 'chengshianquan@163.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '116');
INSERT INTO `h_user_member` VALUES ('255', '罗红艳', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '512501196803162146', '24913', null, 'duyangxiao@163.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '117');
INSERT INTO `h_user_member` VALUES ('256', '龙朝晖', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '510102196611078460', '24418', null, 'Zhaohuilong77@126.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '118');
INSERT INTO `h_user_member` VALUES ('257', '刘新定', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '411081198506058376', '31203', '550560868', '550560868@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '119');
INSERT INTO `h_user_member` VALUES ('258', '刘海峰', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '510122197009180278', '25829', null, 'chengshianquan@163.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '120');
INSERT INTO `h_user_member` VALUES ('259', '梁柏华', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '510823198804024724', '32235', '410335895', '410335895@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '121');
INSERT INTO `h_user_member` VALUES ('260', '李寓馨', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '610581198403064160', '30747', '282767426', '282767426@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '122');
INSERT INTO `h_user_member` VALUES ('261', '李永健', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '510125197701039819', '28128', '921381607', '921381607@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '123');
INSERT INTO `h_user_member` VALUES ('262', '李颜红', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '371102197808120027', '28714', null, 'LYH19780812@163.COM', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '124');
INSERT INTO `h_user_member` VALUES ('263', '李雪芹', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '431003197911285046', '29187', null, 'xueqinli@swjtu.edu.cn', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '125');
INSERT INTO `h_user_member` VALUES ('264', '李朋飞', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '510821197004121334', '25670', '626738397', '626738397@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '126');
INSERT INTO `h_user_member` VALUES ('265', '雷群', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '51010219690726406X', '25410', '690709569', '690709569@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '127');
INSERT INTO `h_user_member` VALUES ('266', '江玉文', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '510110196505246598', '23886', null, 'jyw524@126.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '128');
INSERT INTO `h_user_member` VALUES ('267', '邓建江', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', '511028197004210312', '25679', null, 'jjcat@vip.sina.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '129');
INSERT INTO `h_user_member` VALUES ('268', '陈刚', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '离职', '511025197401051694', '27034', '4211740', '4211740@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '130');
INSERT INTO `h_user_member` VALUES ('269', '林元', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', null, null, null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '131');
INSERT INTO `h_user_member` VALUES ('270', '刘焱渝', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '在职', null, null, null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '132');
INSERT INTO `h_user_member` VALUES ('271', '胡忠直', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '离职', null, null, null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '133');
INSERT INTO `h_user_member` VALUES ('272', '黄山', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '离职', null, null, null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '134');
INSERT INTO `h_user_member` VALUES ('273', '高阳', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '2', '离职', null, null, null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '135');

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
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of h_user_qualifications
-- ----------------------------
INSERT INTO `h_user_qualifications` VALUES ('1', '139', null, '信息1', '2', '324', '', '', '', '');

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
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of h_user_regsecurity
-- ----------------------------
INSERT INTO `h_user_regsecurity` VALUES ('1', '139', null, '234', '34', '3434', '23442', '', '');

-- ----------------------------
-- Table structure for h_user_safetyevaluation
-- ----------------------------
DROP TABLE IF EXISTS `h_user_safetyevaluation`;
CREATE TABLE `h_user_safetyevaluation` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
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
  `practitioners_num` int(100) DEFAULT NULL COMMENT '从业编号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of h_user_safetyevaluation
-- ----------------------------
INSERT INTO `h_user_safetyevaluation` VALUES ('1', '139', '34567890', '三级', '专职', 'sdfsdfsf士大夫', '', '', '', '', '', null, '', '', '', '23234234234', '3453');

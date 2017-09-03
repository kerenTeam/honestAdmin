/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : honest

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-09-03 17:30:41
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
  `contract_price` varchar(100) DEFAULT NULL COMMENT '合同金额',
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
  PRIMARY KEY (`contract_id`)
) ENGINE=MyISAM AUTO_INCREMENT=456 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of h_contract
-- ----------------------------
INSERT INTO `h_contract` VALUES ('1', '2013', '13CD001', '四川', '成都', null, null, null, '1', null, '41275', '金红英', '195000', '2017-08-29 16:43:41', '中国电子科技集团公司第十研究所XXX生产能力建设项目（含评审费）', '1', '0', null, null, null, null, null, null);
INSERT INTO `h_contract` VALUES ('32', '2013', '13AB001', '四川', '阿坝', null, null, null, '0', null, '41275', '朱新国', '10000', '2017-08-29 16:43:41', '黑水县冰川加气站', '1', '0', null, null, null, null, null, null);
INSERT INTO `h_contract` VALUES ('33', '2013', '13AB002', '四川', '阿坝', null, null, null, '0', null, '41275', '朱新国', '10000', '2017-08-29 16:43:41', '红原县白河液化气储配站', '1', '0', null, null, null, null, null, null);
INSERT INTO `h_contract` VALUES ('23', '2013', '13BZH002', '四川', '成都', null, null, null, '0', null, '41275', '唐蓉生', '30000', '2017-08-29 16:43:41', '四川新路设备吊装工程有限公司（成都傲鼎新路件运输有限公司）安全生产标准化三级达标咨询（项目停止，不退款）', '1', '0', null, null, null, null, null, null);
INSERT INTO `h_contract` VALUES ('2', '2013', '13CD002', '四川', '成都', null, null, null, '1', null, '41275', '金红英', '98000', '2017-08-29 16:43:41', '中国电子科技集团公司第十研究所XXX研制保障条件建设项目（含评审费）', '1', '0', null, null, null, null, null, null);
INSERT INTO `h_contract` VALUES ('3', '2013', '13CD003', '四川', '成都', null, null, null, '0', null, '41275', '公司', '5000', '2017-08-29 16:43:41', '四川鑫达实业有限公司青羊加油站', '1', '0', null, null, null, null, null, null);
INSERT INTO `h_contract` VALUES ('4', '2013', '13CD004', '四川', '成都', null, null, null, '0', null, '41275', '朱新国', '35000', '2017-08-29 16:43:41', '家得润生态房屋有限公司（含评审费）', '1', '0', null, null, null, null, null, null);
INSERT INTO `h_contract` VALUES ('31', '2013', '13CD007', '四川', '成都', null, null, null, '0', null, '41275', '曹燕', '5000', '2017-08-29 16:43:41', '成都申华贸易有限公司经营危险化学品', '1', '0', null, null, null, null, null, null);
INSERT INTO `h_contract` VALUES ('35', '2013', '13CD008', '四川', '成都', null, null, null, '0', null, '41275', '曹燕', '8000', '2017-08-29 16:43:41', '成都荆竹花涂料有限公司危险化学品生产现状（无合同）', '1', '0', null, null, null, null, null, null);
INSERT INTO `h_contract` VALUES ('36', '2013', '13CD009', '四川', '成都', null, null, null, '0', null, '41275', '公司', '3500', '2017-08-29 16:43:41', '中石化四川销售有限公司金牛永宏加油站', '1', '0', null, null, null, null, null, null);
INSERT INTO `h_contract` VALUES ('37', '2013', '13CD010-1', '四川', '成都', null, null, null, '0', null, '41275', '金红英', '100000', '2017-08-29 16:43:41', '中嘉汽车制造（成都）有限公司（含评审费）', '1', '0', null, null, null, null, null, null);
INSERT INTO `h_contract` VALUES ('38', '2013', '13CD010-2', '四川', '成都', null, null, null, '0', null, '41275', '金红英', '150000', '2017-08-29 16:43:41', '中嘉汽车制造（成都）有限公司（含评审费）', '1', '0', null, null, null, null, null, null);
INSERT INTO `h_contract` VALUES ('40', '2013', '13CD011', '四川', '成都', null, null, null, '0', null, '41275', '公司', '2600', '2017-08-29 16:43:41', '双流县华阳经济区供销合作社', '1', '0', null, null, null, null, null, null);
INSERT INTO `h_contract` VALUES ('51', '2013', '13CD012', '四川', '成都', null, null, null, '0', null, '41306', '金红英', '25000', '2017-08-29 16:43:41', '成都时代立夫科技有限公司半导体及精密抛光材料项目（含评审费）', '1', '0', null, null, null, null, null, null);
INSERT INTO `h_contract` VALUES ('52', '2013', '13CD013', '四川', '成都', null, null, null, '0', null, '41306', '金红英', '25000', '2017-08-29 16:43:41', '成都时代立夫科技有限公司半导体及精密抛光材料项目（含评审费）', '1', '0', null, null, null, null, null, null);
INSERT INTO `h_contract` VALUES ('60', '2013', '13CD014-1', '四川', '成都', null, null, null, '0', null, '41306', '汪彪', '10000', '2017-08-29 16:43:41', '中国航油集团四川铁投石油有限责任公司宜泸高速宜宾长宁服务区南北加油站（宜宾长宁服务区加油站A站）（含评审费）', '1', '0', null, null, null, null, null, null);
INSERT INTO `h_contract` VALUES ('61', '2013', '13CD014-2', '四川', '成都', null, null, null, '0', null, '41306', '汪彪', '10000', '2017-08-29 16:43:41', '中国航油集团四川铁投石油有限责任公司宜泸高速宜宾长宁服务区南北加油站（宜宾长宁服务区加油站A站）（含评审费）', '1', '0', null, null, null, null, null, null);
INSERT INTO `h_contract` VALUES ('62', '2013', '13CD014-3', '四川', '成都', null, null, null, '0', null, '41306', '汪彪', '10000', '2017-08-29 16:43:41', '中国航油集团四川铁投石油有限责任公司宜泸高速宜宾长宁服务区南北加油站（宜宾长宁服务区加油站B站）（含评审费）', '1', '0', null, null, null, null, null, null);
INSERT INTO `h_contract` VALUES ('86', '2013', '13CD021', '四川', '成都', null, null, null, '0', null, '41334', '汪彪', '3500', '2017-08-29 16:43:41', '中国石油化工股份有限公司四川成都石油分公司建工加油站（无合同）', '1', '0', null, null, null, null, null, null);
INSERT INTO `h_contract` VALUES ('251', '2013', '13CD061', '四川', '成都', null, null, null, '0', null, '41426', '汪彪', '3500', '2017-08-29 16:43:41', '成都市市政十陵加油站（无合同）', '1', '0', null, null, null, null, null, null);
INSERT INTO `h_contract` VALUES ('56', '2013', '13DY001', '四川', '德阳', null, null, null, '0', null, '41306', '天成', '95000', '2017-08-29 16:43:41', '四川汉龙新材料有限公司核电及重装高性能特种焊接材料产业化项目（含评审费）', '1', '0', null, null, null, null, null, null);
INSERT INTO `h_contract` VALUES ('45', '2013', '13DZ001-1', '四川', '达州', null, null, null, '0', null, '41275', '郭三俊', '6000', '2017-08-29 16:43:41', '万源市方欣实业有限责任公司茶垭加油站新建项目', '1', '0', null, null, null, null, null, null);
INSERT INTO `h_contract` VALUES ('46', '2013', '13DZ001-2', '四川', '达州', null, null, null, '0', null, '41275', '郭三俊', '7000', '2017-08-29 16:43:41', '万源市方欣实业有限责任公司茶垭加油站新建项目', '1', '0', null, null, null, null, null, null);
INSERT INTO `h_contract` VALUES ('10', '2013', '13GA001', '四川', '广安', null, null, null, '0', null, '41275', '罗志远', '5000', '2017-08-29 16:43:41', '广安徐易商贸有限责任公司', '1', '0', null, null, null, null, null, null);
INSERT INTO `h_contract` VALUES ('5', '2013', '13LSZ001-1', '四川', '凉山州', null, null, null, '0', null, '41275', '陈光军', '17500', '2017-08-29 16:43:41', '凉山州通达科技有限公司会理县溢壕矿业开发有限公司箐门口尾矿矿库新建工程', '1', '0', null, null, null, null, null, null);
INSERT INTO `h_contract` VALUES ('6', '2013', '13LSZ001-2', '四川', '凉山州', null, null, null, '0', null, '41275', '陈光军', '17500', '2017-08-29 16:43:41', '凉山州通达科技有限公司会理县溢壕矿业开发有限公司箐门口尾矿矿库新建工程', '1', '0', null, null, null, null, null, null);
INSERT INTO `h_contract` VALUES ('11', '2013', '13LZ001', '四川', '泸州', null, null, null, '0', null, '41275', '朱新国', '5000', '2017-08-29 16:43:41', '中石化泸州头塘加油站安全现状', '1', '0', null, null, null, null, null, null);
INSERT INTO `h_contract` VALUES ('30', '2013', '13MY001', '四川', '绵阳', null, null, null, '0', null, '41275', '罗志远', '3500', '2017-08-29 16:43:41', '江油市绍伦商贸有限公司让水加油站', '1', '0', null, null, null, null, null, null);
INSERT INTO `h_contract` VALUES ('455', '2013', '13MY021', '四川', '绵阳', null, null, null, '0', null, '41487', '汪彪', '3500', '2017-08-29 16:43:41', '中国石油化工股份有限公司四川绵阳石油分公司山江加油站（无合同）', '1', '0', null, null, null, null, null, null);
INSERT INTO `h_contract` VALUES ('41', '2013', '13NC002-1', '四川', '南充', null, null, null, '0', null, '41275', '汪彪', '5000', '2017-08-29 16:43:41', '中国石油化工股份有限公司四川南充石油分公司广安华蓥明月加油站', '1', '0', null, null, null, null, null, null);
INSERT INTO `h_contract` VALUES ('42', '2013', '13NC002-2', '四川', '南充', null, null, null, '0', null, '41275', '汪彪', '5000', '2017-08-29 16:43:41', '中国石油化工股份有限公司四川南充石油分公司广安华蓥明月加油站', '1', '0', null, null, null, null, null, null);
INSERT INTO `h_contract` VALUES ('53', '2013', '13NC003-1', '四川', '南充', null, null, null, '0', null, '41306', '罗志成', '4000', '2017-08-29 16:43:41', '南部县流马加油站新建加油站项目', '1', '0', null, null, null, null, null, null);
INSERT INTO `h_contract` VALUES ('54', '2013', '13NC003-2', '四川', '南充', null, null, null, '0', null, '41306', '罗志成', '4000', '2017-08-29 16:43:41', '南部县流马加油站新建加油站项目', '1', '0', null, null, null, null, null, null);
INSERT INTO `h_contract` VALUES ('55', '2013', '13NC004', '四川', '南充', null, null, null, '0', null, '41306', '罗志成', '8000', '2017-08-29 16:43:41', '南部县流马加油站新建加油站项目', '1', '0', null, null, null, null, null, null);
INSERT INTO `h_contract` VALUES ('34', '2013', '13TL001', '四川', '德阳', null, null, null, '0', null, '41275', '汪彪', '35000', '2017-08-29 16:43:41', '四川龙蟒磷化工有限公司铁路专用线及其附属设施安全现状评价', '1', '0', null, null, null, null, null, null);
INSERT INTO `h_contract` VALUES ('39', '2013', '13TL002', '四川', '自贡', null, null, null, '0', null, '41275', '朱新国', '26000', '2017-08-29 16:43:41', '中国石油四川自贡销售分公司舒平油库铁路专用线及附属设施安全现状', '1', '0', null, null, null, null, null, null);

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of h_customer
-- ----------------------------
INSERT INTO `h_customer` VALUES ('1', '23', '', '123123', '123123', null, null, null, '12313', '1313', '12313', '12313', '123123', '12313', '12313', '12313123', '1313', null, '0', '2017-08-27 11:28:04');
INSERT INTO `h_customer` VALUES ('2', '测试1', '4', '123455', '21', null, null, null, '12121', '21212', '212', '2323', '213123', '123123', '23123', '123123', '123123', null, '1', '2017-08-27 11:28:04');
INSERT INTO `h_customer` VALUES ('3', '打发打发撒旦1', '1', '手动阀手动阀手动阀', '2', '四川', '成都', null, '12345678', '1234567', '213123', '123123', '123123', '213123', '123123', '123123', '123123', '123123', '1', '2017-09-03 16:48:05');

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of h_customer_contacts
-- ----------------------------
INSERT INTO `h_customer_contacts` VALUES ('1', '1', 'ddf1', '3432', 'sdfsdf', '234243', '23423', '3434', '234234', '234234234', 'dfsdf', 'sdfsdf', 'sdfsdfs', 'dsdfsdf');
INSERT INTO `h_customer_contacts` VALUES ('2', '3', '12', '23', '53', '24', '23', '53', '34', '34', '34', '23', '2342', '234234');

-- ----------------------------
-- Table structure for h_project
-- ----------------------------
DROP TABLE IF EXISTS `h_project`;
CREATE TABLE `h_project` (
  `c_id` int(10) NOT NULL COMMENT '所属合同',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '项目表',
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
  `de_state` int(11) DEFAULT '0' COMMENT '删除状态  1是  0正常状态',
  `cycle` varchar(255) DEFAULT NULL COMMENT '完成周期',
  `requirement` varchar(255) DEFAULT NULL COMMENT '附带要求',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`,`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of h_project
-- ----------------------------
INSERT INTO `h_project` VALUES ('1', '1', '2017', '456787', '天津', '市辖区', '河西区', '345354', '3534', '34535', '53535', '2017-08-25', '1', '9', '7', '2', '2017-08-25 09:22:31', '1', null, null, null);
INSERT INTO `h_project` VALUES ('1', '2', '2017', '测试项目', '天津', '市辖区', '请选择', '测试人', '成都市中和镇', '1582877663', '刘3', '2017-08-25', '1', '9', '8', '4', '2017-08-25 10:40:27', '0', null, null, null);
INSERT INTO `h_project` VALUES ('1', '3', '2013', '中国石油天然气股份有限公司四川南充销售分公司东观加油站', '四川', '南充', null, '张捷', '南充市丝绸路1号', '13508087992', null, null, '0', '0', '0', '0', '2017-08-30 10:12:08', '0', '无', null, null);
INSERT INTO `h_project` VALUES ('1', '4', '2013', '中国电子科技集团公司第十研究所×××系统研制保障条件建设项目', '四川', '成都', null, '张蓉', null, '028-87555291', null, null, '0', '0', '0', '0', '2017-08-30 10:12:08', '0', '20', null, null);
INSERT INTO `h_project` VALUES ('2', '5', '2013', '中国电子科技集团公司第十研究所×××生产能力建设项目', '四川', '成都', null, '张蓉', null, '028-87555291', null, null, '0', '0', '0', '0', '2017-08-30 10:12:08', '0', '无', null, null);
INSERT INTO `h_project` VALUES ('3', '6', '2013', '四川鑫达实业有限公司青羊加油站', '四川', '成都', null, '缪红玉', null, null, null, null, '0', '0', '0', '0', '2017-08-30 10:12:08', '0', '8', null, null);
INSERT INTO `h_project` VALUES ('11', '7', '2013', '中国石油化工股份有限公司四川泸州石油分公司头塘加油站', '四川', '泸州', null, '李卫刚', null, null, null, null, '0', '0', '0', '0', '2017-08-30 10:12:08', '0', '无', null, null);
INSERT INTO `h_project` VALUES ('4', '8', '2013', '家得润生态房屋有限公司年产1125万m2CSIP’s板材及异形材生产项目', '四川', '成都', '青白江', '宋', '青白江区工业园区敬业路433号', null, null, null, '0', '0', '0', '0', '2017-08-30 10:12:08', '0', '45', null, null);
INSERT INTO `h_project` VALUES ('5', '9', '2013', '会理县溢壕矿业开发有限公司箐门口尾矿库新建工程', '四川', '凉山', null, null, '会理县绿水乡白云村', null, null, null, '0', '0', '0', '0', '2017-08-30 10:12:08', '0', '25', null, null);
INSERT INTO `h_project` VALUES ('6', '10', '2013', '会理县溢壕矿业开发有限公司箐门口尾矿库新建工程', '四川', '凉山', null, null, '会理县绿水乡白云村', null, null, null, '0', '0', '0', '0', '2017-08-30 10:12:08', '0', '25', null, null);
INSERT INTO `h_project` VALUES ('1', '11', '2013', '成都天泽减速机制造有限公司', '四川', '成都', '郫县', '鲍经理', '郫县现代工业港北区港东三路567号', '028-61778209/18628053068', null, null, '0', '0', '0', '0', '2017-08-30 10:12:08', '0', '无', null, '2017/4/14唐总确认不做了');
INSERT INTO `h_project` VALUES ('1', '12', '2013', '成都天泽减速机制造有限公司机械制造项目', '四川', '成都', '郫县', '鲍经理', '郫县现代工业港北区港东三路567号', '028-6177820918628053068', null, null, '0', '0', '0', '0', '2017-08-30 10:12:08', '0', '无', null, '2017/4/14唐总确认，不做了');
INSERT INTO `h_project` VALUES ('1', '13', '2013', '中国石油天然气股份有限公司西南油气田分公司川中油气矿大英县工业集中发展区供气工程', '四川', '遂宁', null, '甘凤明', '遂宁市凯旋下路162号', '0825-2516122/13982588189', null, null, '0', '0', '0', '0', '2017-08-30 10:12:08', '0', '无', null, null);
INSERT INTO `h_project` VALUES ('1', '14', '2013', '中国石油天然气股份有限公司西南油气田分公司川中油气矿龙岗001-30井地面集输工程', '四川', '遂宁', null, '甘凤明', '遂宁市凯旋下路163号', '0825-2516122/13982588189', null, null, '0', '0', '0', '0', '2017-08-30 10:12:08', '0', '无', null, null);
INSERT INTO `h_project` VALUES ('1', '15', '2013', '中国石油天然气股份有限公司西南油气田分公司川中油气矿龙岗18井气田水回注工程', '四川', '遂宁', null, '甘凤明', '遂宁市凯旋下路162号', '0825-2516122/13982588189', null, null, '0', '0', '0', '0', '2017-08-30 10:12:08', '0', '无', null, null);
INSERT INTO `h_project` VALUES ('10', '16', '2013', '广安徐易商贸有限责任公司', '四川', '广安', null, '徐仁国', '广安市广安区广罗乡', null, null, null, '0', '0', '0', '0', '2017-08-30 10:12:08', '0', '30', null, null);
INSERT INTO `h_project` VALUES ('1', '17', '2013', '攀枝花秉扬科技开发有限公司年产10万吨石油支撑剂生产项目', '四川', '攀枝花', null, '曹春蓉', '攀枝花市钒钛产业园区', '15181288398/0812-6211027', null, null, '0', '0', '0', '0', '2017-08-30 10:12:08', '0', '30', null, null);
INSERT INTO `h_project` VALUES ('23', '18', '2013', '四川新路设备吊装工程有限公司', '四川', '成都', '郫县', '张奕', '郫县现代工业港北区港东三路', '028-61837938/13882185660', null, null, '0', '0', '0', '0', '2017-08-30 10:12:08', '0', '无', null, null);
INSERT INTO `h_project` VALUES ('1', '19', '2013', '成都威腾树脂化工有限公司', '四川', '成都', '龙泉', null, '龙泉驿洪安乡', null, null, null, '0', '0', '0', '0', '2017-08-30 10:12:08', '0', '无', null, null);
INSERT INTO `h_project` VALUES ('1', '20', '2013', '成都威腾树脂化工有限公司', '四川', '成都', '龙泉', null, '龙泉驿洪安乡', null, null, null, '0', '0', '0', '0', '2017-08-30 10:12:08', '0', '无', null, null);
INSERT INTO `h_project` VALUES ('1', '21', '2013', '四川能宝电源制造有限公司超级电容(器)电池产业化项目', '四川', '遂宁', null, '景辉', '遂宁市大英县', null, null, null, '0', '0', '0', '0', '2017-08-30 10:12:08', '0', '20', null, null);
INSERT INTO `h_project` VALUES ('1', '22', '2013', '四川能宝电源制造有限公司超级电容(器)电池产业化项目', '四川', '遂宁', null, '景辉', '遂宁市大英县', null, null, null, '0', '0', '0', '0', '2017-08-30 10:12:08', '0', '20', null, null);
INSERT INTO `h_project` VALUES ('251', '23', '2013', '成都市市政十陵加油站', '四川', '成都', null, null, null, null, null, null, '0', '0', '0', '0', '2017-08-30 10:12:08', '0', '无', null, null);
INSERT INTO `h_project` VALUES ('86', '24', '2013', '中国石油化工股份有限公司四川成都石油分公司建工加油站', '四川', '成都', null, null, null, null, null, null, '0', '0', '0', '0', '2017-08-30 10:12:08', '0', '无', null, null);
INSERT INTO `h_project` VALUES ('31', '25', '2013', '成都申华贸易有限公司', '四川', '成都', '新都', '高红', '新都', '13628054336', null, null, '0', '0', '0', '0', '2017-08-30 10:12:08', '0', '15', null, null);
INSERT INTO `h_project` VALUES ('35', '26', '2013', '成都荆竹花涂料有限公司', '四川', '成都', null, '周雄', '成都市新都区成都家具产业园金亿路', '18982253799', null, null, '0', '0', '0', '0', '2017-08-30 10:12:08', '0', '无', null, null);
INSERT INTO `h_project` VALUES ('30', '27', '2013', '江油市绍伦商贸有限责任公司让水加油站', '四川', '绵阳', null, '敬孝英', '江油市太平镇荞坝村', '13198677089', null, null, '0', '0', '0', '0', '2017-08-30 10:12:08', '0', '20', null, null);
INSERT INTO `h_project` VALUES ('41', '28', '2013', '中国石油化工股份有限公司四川达州石油分公司广安华蓥明月加油站原址改造项目', '四川', '广安', null, '周天文', '南充市丝绸路工行大厦14楼', '15508170606', null, null, '0', '0', '0', '0', '2017-08-30 10:12:08', '0', '无', null, null);
INSERT INTO `h_project` VALUES ('42', '29', '2013', '中国石油化工股份有限公司四川达州石油分公司广安华蓥明月加油站原址改造项目', '四川', '广安', null, '周天文', '南充市丝绸路工行大厦14楼', '15508170606', null, null, '0', '0', '0', '0', '2017-08-30 10:12:08', '0', '无', null, null);
INSERT INTO `h_project` VALUES ('1', '30', '2013', '中国石油天然气股份有限公司西南油气田分公司川中油气矿安岳气田龙王庙组气藏试采干法脱硫装置', '四川', '遂宁', null, '甘凤明', '遂宁市凯旋下路162号', '0825-2516122/13982588189', null, null, '0', '0', '0', '0', '2017-08-30 10:12:08', '0', '无', null, null);
INSERT INTO `h_project` VALUES ('34', '31', '2013', '四川龙蟒磷化工有限公司', '四川', '德阳', null, '詹元玺', '绵竹市火车站', '13508023159', null, null, '0', '0', '0', '0', '2017-08-30 10:12:08', '0', '30', null, null);
INSERT INTO `h_project` VALUES ('32', '32', '2013', '黑水县冰川液化气加气站', '四川', '阿坝', '黑水', '柯勇', null, '15983719288', null, null, '0', '0', '0', '0', '2017-08-30 10:12:08', '0', '无', null, null);
INSERT INTO `h_project` VALUES ('33', '33', '2013', '红原县白河液化气储配站', '四川', '阿坝', '红原', '何志全', null, null, null, null, '0', '0', '0', '0', '2017-08-30 10:12:08', '0', '无', null, null);
INSERT INTO `h_project` VALUES ('56', '34', '2013', '四川汉龙新材料有限公司核电及重装高性能特种焊接材料产业化项目', '四川', '德阳', null, null, null, null, null, null, '0', '0', '0', '0', '2017-08-30 10:12:08', '0', '30', null, null);
INSERT INTO `h_project` VALUES ('40', '35', '2013', '双流县华阳经济区供销合作社', '四川', '成都', null, null, null, null, null, null, '0', '0', '0', '0', '2017-08-30 10:12:08', '0', '无', null, null);
INSERT INTO `h_project` VALUES ('36', '36', '2013', '中石化四川销售有限公司金牛永宏加油站', '四川', '成都', null, null, null, null, null, null, '0', '0', '0', '0', '2017-08-30 10:12:08', '0', '无', null, null);
INSERT INTO `h_project` VALUES ('455', '37', '2013', '中国石油化工股份有限公司四川绵阳石油分公司山江加油站', '四川', '绵阳', null, '高利', null, null, null, null, '0', '0', '0', '0', '2017-08-30 10:12:08', '0', '无', null, null);
INSERT INTO `h_project` VALUES ('45', '38', '2013', '万源市方欣实业有限责任公司茶垭加油站新建项目', '四川', '达州', null, '温明伟', null, '13882811168', null, null, '0', '0', '0', '0', '2017-08-30 10:12:08', '0', '无', null, null);
INSERT INTO `h_project` VALUES ('46', '39', '2013', '万源市方欣实业有限责任公司茶垭加油站新建项目', '四川', '达州', null, '温明伟', null, '13882811168', null, null, '0', '0', '0', '0', '2017-08-30 10:12:08', '0', '无', null, null);
INSERT INTO `h_project` VALUES ('39', '40', '2013', '中国石油天然气股份有限公司四川自贡销售分公司(舒平油库)', '四川', '自贡', null, '付家良', null, null, null, null, '0', '0', '0', '0', '2017-08-30 10:12:08', '0', '无', null, null);
INSERT INTO `h_project` VALUES ('37', '41', '2013', '(中嘉汽车制造(成都)有限公司)浙江豪情汽车制造有限公司成都分公司乘用车项目', '四川', '成都', null, '陈', null, null, null, null, '0', '0', '0', '0', '2017-08-30 10:12:08', '0', '30', null, null);
INSERT INTO `h_project` VALUES ('38', '42', '2013', '(中嘉汽车制造(成都)有限公司)浙江豪情汽车制造有限公司成都分公司乘用车项目', '四川', '成都', null, '陈', null, null, null, null, '0', '0', '0', '0', '2017-08-30 10:12:08', '0', '45', null, null);
INSERT INTO `h_project` VALUES ('53', '43', '2013', '南部县流马加油站新建项目', '天津', '县', '宁河县', '黄小林', '南充市南部县流马镇', '13909074736', null, null, '0', '35', '28', '14', '2017-08-30 10:12:08', '0', '30', '1', '1');
INSERT INTO `h_project` VALUES ('54', '44', '2013', '南部县流马加油站新建项目', '四川', '南充', null, '黄小林', '南充市南部县流马镇', '13909074736', null, null, '0', '0', '0', '0', '2017-08-30 10:12:08', '0', '30', null, null);
INSERT INTO `h_project` VALUES ('55', '45', '2013', '南部县流马加油站新建项目', '四川', '南充', null, '黄小林', '南充市南部县流马镇', '13909074736', null, null, '0', '0', '0', '0', '2017-08-30 10:12:08', '0', '30', null, null);
INSERT INTO `h_project` VALUES ('51', '46', '2013', '成都时代立夫科技有限公司半导体及精密抛光材料项目', '四川', '成都', '双流', '杜小燕', '双流西南航空港经济开发区物联网产业园区内', '18602890626', null, null, '0', '0', '0', '0', '2017-08-30 10:12:08', '0', '30', null, null);
INSERT INTO `h_project` VALUES ('52', '47', '2013', '成都时代立夫科技有限公司半导体及精密抛光材料项目', '四川', '成都', '双流', '杜小燕', '双流西南航空港经济开发区物联网产业园区内', '18602890626', null, null, '0', '0', '0', '0', '2017-08-30 10:12:08', '0', '45', null, null);
INSERT INTO `h_project` VALUES ('60', '48', '2013', '中国航油集团四川铁投石油有限责任公司宜泸高速长宁服务区南站加油站新建项目', '四川', '成都', null, '杨旭', null, '15102899629', null, null, '0', '0', '0', '0', '2017-08-30 10:12:08', '0', '30', null, '中航油铁投');
INSERT INTO `h_project` VALUES ('61', '49', '2013', '中国航油集团四川铁投石油有限责任公司宜泸高速长宁服务区南站加油站新建项目', '四川', '成都', null, '杨旭', null, '15102899629', null, null, '0', '0', '0', '0', '2017-08-30 10:12:08', '0', '30', null, '中航油铁投');
INSERT INTO `h_project` VALUES ('62', '50', '2013', '中国航油集团四川铁投石油有限责任公司宜泸高速长宁服务区北站加油站新建项目', '四川', '成都', null, '杨旭', null, '15102899629', null, null, '0', '0', '0', '0', '2017-08-30 10:12:08', '0', '30', null, '中航油铁投');

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
) ENGINE=MyISAM AUTO_INCREMENT=154 DEFAULT CHARSET=utf8mb4;

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
INSERT INTO `h_user_group` VALUES ('2', '普通职员组', '普通职员组', null, '1', null, '2017-09-03 17:24:29');

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
INSERT INTO `h_user_member` VALUES ('1', 'admin', null, 'e10adc3949ba59abbe56e057f20f883e', '1', '1', '1', null, null, null, null, null, null, null, '1', null, null, '2017-08-10 15:20:08', '1', null, null);
INSERT INTO `h_user_member` VALUES ('2', '测试1234', 'upload/avater/2017-08-22_171254.jpg', null, null, '3', '在职', '1838478362833', '12313', '234242', '4241234@qq.com', '34234', '234234', '234234', '1', '', '234234', '2017-08-22 17:16:09', '0', '1', null);
INSERT INTO `h_user_member` VALUES ('3', '测试三', 'upload/avater/2017-08-22_172111.jpg', 'e10adc3949ba59abbe56e057f20f883e', '0', '3', '在职', '345898765434567898765', '345678765432', '45345', '35434535@qq.com', '3456', '23456', '345678', '0', '', '23234234', '2017-08-22 17:21:11', '0', '1', null);
INSERT INTO `h_user_member` VALUES ('139', '刘东', null, null, '0', '2', '在职', '511002197502271210', '27452', '304278936', '304278936@qq.com', '本科', '37561', null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '1');
INSERT INTO `h_user_member` VALUES ('140', '金红英', null, null, '0', '2', '在职', '510103196609183444', '24368', null, null, '本科', '37681', null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '2');
INSERT INTO `h_user_member` VALUES ('141', '汪彪', null, null, '0', '2', '在职', '511027195505067811', '20215', null, null, '大专', '37561', null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '3');
INSERT INTO `h_user_member` VALUES ('142', '唐蓉生', null, null, '0', '2', '在职', '511027197405240014', '27173', null, 'chengshianquan@163.com', '本科', '37561', null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '4');
INSERT INTO `h_user_member` VALUES ('143', '丁婕汀', null, null, '0', '2', '在职', '510311198702041766', '31812', '429014017', null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '5');
INSERT INTO `h_user_member` VALUES ('144', '陈佳', null, null, '0', '2', '在职', '510105198201170529', '29968', null, null, '大专', '37834', null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '6');
INSERT INTO `h_user_member` VALUES ('145', '龚礼春', null, null, '0', '2', '在职', '513624198010067472', '29500', '1203618487', '1203618487@qq.com', '本科', '39508', null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '7');
INSERT INTO `h_user_member` VALUES ('146', '李声敏', null, null, '0', '2', '在职', '511521198109286820', '29857', null, null, '大专', '38108', null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '8');
INSERT INTO `h_user_member` VALUES ('147', '殷隽', null, null, '0', '2', '在职', '511202198201041345', '29955', null, null, '本科', '38152', null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '9');
INSERT INTO `h_user_member` VALUES ('148', '彭超', null, null, '0', '2', '在职', '513426198708305024', '32019', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '10');
INSERT INTO `h_user_member` VALUES ('149', '胡晓', null, null, '0', '2', '在职', '510202197910281821', '29156', '631856161', null, '本科', '42779', null, '1', '017469378', null, '2017-09-03 17:20:46', '0', '1', '11');
INSERT INTO `h_user_member` VALUES ('150', '郑超', null, null, '0', '2', '在职', '513721199002027332', '32906', null, null, '本科', '41396', null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '12');
INSERT INTO `h_user_member` VALUES ('151', '刘相元', null, null, '0', '2', '在职', '510111196704261973', '24588', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '13');
INSERT INTO `h_user_member` VALUES ('152', '李多顺', null, null, '0', '2', '在职', '540102195910303518', '21853', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '14');
INSERT INTO `h_user_member` VALUES ('153', '王晓波', null, null, '0', '2', '在职', '512902197007020473', '25751', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '15');
INSERT INTO `h_user_member` VALUES ('154', '胡春梅', null, null, '0', '2', '在职', '512926196203215266', '22726', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '16');
INSERT INTO `h_user_member` VALUES ('155', '郭三俊', null, null, '0', '2', '在职', '513021197109076057', '26183', null, null, null, '38824', null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '17');
INSERT INTO `h_user_member` VALUES ('156', '况月康', null, null, '0', '2', '在职', '500102198611248455\n', '31740', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '18');
INSERT INTO `h_user_member` VALUES ('157', '黎永泽', null, null, '0', '2', '在职', '511324198408214737', '30915', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '19');
INSERT INTO `h_user_member` VALUES ('158', '罗志成', null, null, '0', '2', '在职', '510103197301121911', '26676', null, null, '大专', '38633', null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '20');
INSERT INTO `h_user_member` VALUES ('159', '肖翔', null, null, '0', '2', '在职', '510502197309282555', '26935', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '21');
INSERT INTO `h_user_member` VALUES ('160', '黎晓彬', null, null, '0', '2', '在职', '511381198010165274', '29510', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '22');
INSERT INTO `h_user_member` VALUES ('161', '陈莲', null, null, '0', '2', '在职', '511011198306088321', '30475', null, 'clian305@163.com', '本科', '40283', null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '23');
INSERT INTO `h_user_member` VALUES ('162', '花年祺', null, null, '0', '2', '在职', '510105199206070513', '33762', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '24');
INSERT INTO `h_user_member` VALUES ('163', '徐月霞', null, null, '0', '2', '在职', '370782198210140021', '30238', null, 'clearbabyabc@163.com', '硕士', '39264', null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '25');
INSERT INTO `h_user_member` VALUES ('164', '杨天义', null, null, '0', '2', '在职', '510811198405032932', '30805', null, 'gzbcareer@163.com', '本科', '40575', null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '26');
INSERT INTO `h_user_member` VALUES ('165', '郑碧涛', null, null, '0', '2', '在职', '510122198311149575', '30634', '153532001', '153532001@qq.com', '本科', '39174', null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '27');
INSERT INTO `h_user_member` VALUES ('166', '周才鹏', null, null, '0', '2', '在职', '511126198912202112', '32862', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '28');
INSERT INTO `h_user_member` VALUES ('167', '邹彪', null, null, '0', '2', '在职', '510113198912102039', '32852', null, null, '本科', '41456', null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '29');
INSERT INTO `h_user_member` VALUES ('168', '曾謇', null, null, '0', '2', '在职', '511002198204210035', '30062', '6830244', '6830244@qq.com', '本科', '38572', null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '30');
INSERT INTO `h_user_member` VALUES ('169', '曾国会', null, null, '0', '2', '在职', '53212619880604272X', '32298', null, 'zengguohui086@163.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '31');
INSERT INTO `h_user_member` VALUES ('170', '左灿', null, null, '0', '2', '在职', '511622198808059418', '32360', '291101515', '291101515@QQ.COM', '本科', '41505', null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '32');
INSERT INTO `h_user_member` VALUES ('171', '余锦徽', null, null, '0', '2', '在职', '340824198709196610', '32039', null, null, '本科', '41337', null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '33');
INSERT INTO `h_user_member` VALUES ('172', '陈帮玲', null, null, '0', '2', '在职', '512928197204092621', '26398', null, null, '本科', '41000', null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '34');
INSERT INTO `h_user_member` VALUES ('173', '陈保华', null, null, '0', '2', '在职', '411024198610153210', '31700', null, null, '本科', '41183', null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '35');
INSERT INTO `h_user_member` VALUES ('174', '代茂莲', null, null, '0', '2', '在职', '510521199012160184', '33223', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '36');
INSERT INTO `h_user_member` VALUES ('175', '龚文正', null, null, '0', '2', '在职', '510922198807101210', '32334', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '37');
INSERT INTO `h_user_member` VALUES ('176', '何丹', null, null, '0', '2', '在职', '511922198807072086', '32331', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '38');
INSERT INTO `h_user_member` VALUES ('177', '胡晓平', null, null, '0', '2', '在职', '513424198806080612', '32302', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '39');
INSERT INTO `h_user_member` VALUES ('178', '黄力', null, null, '0', '2', '在职', '511523198711180052', '32099', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '40');
INSERT INTO `h_user_member` VALUES ('179', '寇元成', null, null, '0', '2', '在职', '513022198709111937', '32031', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '41');
INSERT INTO `h_user_member` VALUES ('180', '李虹', null, null, '0', '2', '在职', '512930197209275082', '26569', null, null, '本科', '40909', null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '42');
INSERT INTO `h_user_member` VALUES ('181', '李累', null, null, '0', '2', '在职', '500236198910022252', '32783', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '43');
INSERT INTO `h_user_member` VALUES ('182', '刘小兰', null, null, '0', '2', '在职', '511025198902030861', '32542', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '44');
INSERT INTO `h_user_member` VALUES ('183', '刘晓玉', null, null, '0', '2', '在职', '510112198912112441', '32853', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '45');
INSERT INTO `h_user_member` VALUES ('184', '刘宇琦', null, null, '0', '2', '在职', '510503198910037017', '32784', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '46');
INSERT INTO `h_user_member` VALUES ('185', '潘学良', null, null, '0', '2', '在职', '510524198904271191', '32625', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '47');
INSERT INTO `h_user_member` VALUES ('186', '唐侄香', null, null, '0', '2', '在职', '511023198801259269', '32167', null, null, '本科', '40909', null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '48');
INSERT INTO `h_user_member` VALUES ('187', '王志斌', null, null, '0', '2', '在职', '410728198606123177', '31575', '416640835', '416640835@qq.com', '本科', '41334', null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '49');
INSERT INTO `h_user_member` VALUES ('188', '杨凡', null, null, '0', '2', '在职', '510923199010175678', '33163', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '50');
INSERT INTO `h_user_member` VALUES ('189', '张大桓', null, null, '0', '2', '在职', '510126197112156415', '26282', null, null, '大专', '40969', null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '51');
INSERT INTO `h_user_member` VALUES ('190', '赵明', null, null, '0', '2', '在职', '511521198910126953', '32793', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '52');
INSERT INTO `h_user_member` VALUES ('191', '何昭明', null, null, '0', '2', '在职', '510103196103260713', '22366', null, null, null, '42802', null, '0', null, '（卫生检验）         主管检验师', '2017-09-03 17:20:46', '0', '1', '53');
INSERT INTO `h_user_member` VALUES ('192', '江光平', null, null, '0', '2', '在职', '519003195409050098', '19972', '404368909', '404368909@qq.com', '本科', '40118', null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '54');
INSERT INTO `h_user_member` VALUES ('193', '陈月', null, null, '0', '2', '在职', '51010719860901002X', '31656', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '55');
INSERT INTO `h_user_member` VALUES ('194', '冯文', null, null, '0', '2', '在职', '511102196808211422', '25071', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '56');
INSERT INTO `h_user_member` VALUES ('195', '黄志猛', null, null, '0', '2', '在职', '511321198806085134', '32302', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '57');
INSERT INTO `h_user_member` VALUES ('196', '江恒', null, null, '0', '2', '在职', '510104198207222119', '30154', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '58');
INSERT INTO `h_user_member` VALUES ('197', '江黎', null, null, '0', '2', '在职', '510123198802294327', '32202', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '59');
INSERT INTO `h_user_member` VALUES ('198', '金锐', null, null, '0', '2', '在职', '513027198002190012', '29270', '264039', '264039@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '60');
INSERT INTO `h_user_member` VALUES ('199', '雷静瑶', null, null, '0', '2', '在职', '510129197808302125', '28732', '945365879', '945365879@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '61');
INSERT INTO `h_user_member` VALUES ('200', '李铭', null, null, '0', '2', '在职', '513701198101030019', '29589', '37765223', '37765223@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '62');
INSERT INTO `h_user_member` VALUES ('201', '李霞', null, null, '0', '2', '在职', '513401198802295726\n', '32202', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '63');
INSERT INTO `h_user_member` VALUES ('202', '李羽林', null, null, '0', '2', '在职', '513021199308268712', '34207', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '64');
INSERT INTO `h_user_member` VALUES ('203', '廖帅', null, null, '0', '2', '在职', '51102319880710783X', '32334', '978402033', '978402033@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '65');
INSERT INTO `h_user_member` VALUES ('204', '罗彬', null, null, '0', '2', '在职', '51112319880728353X', '32352', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '66');
INSERT INTO `h_user_member` VALUES ('205', '罗利影', null, null, '0', '2', '在职', '513601197908136228', '29080', '9298206', '9298206@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '67');
INSERT INTO `h_user_member` VALUES ('206', '罗志远', null, null, '0', '2', '在职', '120104197111026810', '26239', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '68');
INSERT INTO `h_user_member` VALUES ('207', '吕亦瑭', null, null, '0', '2', '在职', '510902199108179165', '33467', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '69');
INSERT INTO `h_user_member` VALUES ('208', '马谦强', null, null, '0', '2', '在职', '142322198411243036', '31010', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '70');
INSERT INTO `h_user_member` VALUES ('209', '欧江波', null, null, '0', '2', '在职', '513922198609124692', '31667', '3893547', '3893547@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '71');
INSERT INTO `h_user_member` VALUES ('210', '荣丹', null, null, '0', '2', '在职', '511124198704086011', '31875', '550543786', '550543786@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '72');
INSERT INTO `h_user_member` VALUES ('211', '石建伟', null, null, '0', '2', '在职', '511622198710146433', '32064', '375683278', '375683278@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '73');
INSERT INTO `h_user_member` VALUES ('212', '石思琴', null, null, '0', '2', '在职', '512529197208126782', '26523', null, 'SSQ812@souhu.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '74');
INSERT INTO `h_user_member` VALUES ('213', '宋利强', null, null, '0', '2', '在职', '500107198611161634', '31732', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '75');
INSERT INTO `h_user_member` VALUES ('214', '汪敬', null, null, '0', '2', '在职', '51132119870205419X', '31813', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '76');
INSERT INTO `h_user_member` VALUES ('215', '汪洋', null, null, '0', '2', '在职', '510821199601121331', '35076', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '77');
INSERT INTO `h_user_member` VALUES ('216', '王明', null, null, '0', '2', '在职', '51101119880825705X', '32380', '361172316', '361172316@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '78');
INSERT INTO `h_user_member` VALUES ('217', '王宁', null, null, '0', '2', '在职', '510181198511133631', '31364', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '79');
INSERT INTO `h_user_member` VALUES ('218', '王琼慧', null, null, '0', '2', '在职', '510923198901107121', '32518', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '80');
INSERT INTO `h_user_member` VALUES ('219', '王隋', null, null, '0', '2', '在职', '510824198208083724', '30171', '748800454', '748800454@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '81');
INSERT INTO `h_user_member` VALUES ('220', '王伟', null, null, '0', '2', '在职', '510184198706210931', '31949', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '82');
INSERT INTO `h_user_member` VALUES ('221', '伍燕', null, null, '0', '2', '在职', '511622198901114020', '32519', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '83');
INSERT INTO `h_user_member` VALUES ('222', '张浩', null, null, '0', '2', '在职', '511002198912283614', '32870', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '84');
INSERT INTO `h_user_member` VALUES ('223', '张洪林', null, null, '0', '2', '在职', '510623198702030612', '31811', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '85');
INSERT INTO `h_user_member` VALUES ('224', '朱建立', null, null, '0', '2', '在职', '511121197502017938', '27426', null, 'chengshianquan@163.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '86');
INSERT INTO `h_user_member` VALUES ('225', '朱新国', null, null, '0', '2', '在职', '510113194806180414', '17702', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '87');
INSERT INTO `h_user_member` VALUES ('226', '朱小燕', null, null, '0', '2', '在职', '510522196803080263', '24905', null, 'chengshianquan@163.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '88');
INSERT INTO `h_user_member` VALUES ('227', '周树兴', null, null, '0', '2', '在职', '530127680824453', '25074', '277810677', '277810677@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '89');
INSERT INTO `h_user_member` VALUES ('228', '郑自文', null, null, '0', '2', '在职', '53038119851111155x', '31362', null, 'zzw8511@126.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '90');
INSERT INTO `h_user_member` VALUES ('229', '赵艳', null, null, '0', '2', '在职', '610502197612227827', '28116', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '91');
INSERT INTO `h_user_member` VALUES ('230', '张忠敏', null, null, '0', '2', '在职', '520102197110302467', '26236', null, 'ysdk@vip.sina.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '92');
INSERT INTO `h_user_member` VALUES ('231', '张振韬', null, null, '0', '2', '在职', '450221198008091959', '29442', '317854637', '317854637@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '93');
INSERT INTO `h_user_member` VALUES ('232', '张念念', null, null, '0', '2', '在职', '412702198809160048', '32402', '1301687978', '1301687978@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '94');
INSERT INTO `h_user_member` VALUES ('233', '张建军', null, null, '0', '2', '在职', '610526198506282553', '31226', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '95');
INSERT INTO `h_user_member` VALUES ('234', '张丹丹', null, null, '0', '2', '在职', '33072419830524341X', '30460', '5635150', '5635150@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '96');
INSERT INTO `h_user_member` VALUES ('235', '余杰珉', null, null, '0', '2', '在职', '511102198806060412', '32300', '279830954', '279830954@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '97');
INSERT INTO `h_user_member` VALUES ('236', '于媛', null, null, '0', '2', '在职', '610323198511285927', '31379', '348665826', '348665826@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '98');
INSERT INTO `h_user_member` VALUES ('237', '杨颖', null, null, '0', '2', '在职', '511222198108010144', '29799', null, 'xalgs02@126.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '99');
INSERT INTO `h_user_member` VALUES ('238', '杨坤', null, null, '0', '2', '在职', '510502197312282521', '27026', '393978055', '393978055@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '100');
INSERT INTO `h_user_member` VALUES ('239', '徐泽树', null, null, '0', '2', '在职', '510521197210143554', '26586', null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '101');
INSERT INTO `h_user_member` VALUES ('240', '徐安铭', null, null, '0', '2', '在职', '41292419670222315X', '24525', null, 'nyanming@163.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '102');
INSERT INTO `h_user_member` VALUES ('241', '谢代安', null, null, '0', '2', '在职', '512322196308274870', '23250', '514546419', '514546419@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '103');
INSERT INTO `h_user_member` VALUES ('242', '王志云', null, null, '0', '2', '在职', '430403196304172054', '23118', null, 'ynjxcaoh@163.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '104');
INSERT INTO `h_user_member` VALUES ('243', '王杨福', null, null, '0', '2', '在职', '510721197107297214', '26143', null, 'wangyangfu890022188@sina.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '105');
INSERT INTO `h_user_member` VALUES ('244', '王清君', null, null, '0', '2', '在职', '53230119880313311X', '32215', '2438580411', '2438580411@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '106');
INSERT INTO `h_user_member` VALUES ('245', '王昊', null, null, '0', '2', '在职', '610124198502273911', '31105', null, 'wanghao2872@sina.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '107');
INSERT INTO `h_user_member` VALUES ('246', '田宗斌', null, null, '0', '2', '在职', '510411196601090012', '24116', '2221895597', '2221895597@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '108');
INSERT INTO `h_user_member` VALUES ('247', '唐静', null, null, '0', '2', '在职', '511121198011117883', '29536', null, 'xalgs02@126.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '109');
INSERT INTO `h_user_member` VALUES ('248', '帅茧强', null, null, '0', '2', '在职', '511102198902274613', '32566', '331953048', '331953048@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '110');
INSERT INTO `h_user_member` VALUES ('249', '石丽英', null, null, '0', '2', '在职', '510502195304261123', '19475', '304278936', '304278936@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '111');
INSERT INTO `h_user_member` VALUES ('250', '申兴兵', null, null, '0', '2', '在职', '510922197503240153', '27477', '304278936', '304278936@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '112');
INSERT INTO `h_user_member` VALUES ('251', '秦林', null, null, '0', '2', '在职', '51021219760101081X', '27760', '178119519', '178119519@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '113');
INSERT INTO `h_user_member` VALUES ('252', '钱慧', null, null, '0', '2', '在职', '511623198806195244', '32313', '627906176', '627906176@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '114');
INSERT INTO `h_user_member` VALUES ('253', '彭树全', null, null, '0', '2', '在职', '51023019820107335X', '29958', '45323184', '45323184@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '115');
INSERT INTO `h_user_member` VALUES ('254', '罗旭', null, null, '0', '2', '在职', '513030197209120613', '26554', null, 'chengshianquan@163.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '116');
INSERT INTO `h_user_member` VALUES ('255', '罗红艳', null, null, '0', '2', '在职', '512501196803162146', '24913', null, 'duyangxiao@163.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '117');
INSERT INTO `h_user_member` VALUES ('256', '龙朝晖', null, null, '0', '2', '在职', '510102196611078460', '24418', null, 'Zhaohuilong77@126.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '118');
INSERT INTO `h_user_member` VALUES ('257', '刘新定', null, null, '0', '2', '在职', '411081198506058376', '31203', '550560868', '550560868@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '119');
INSERT INTO `h_user_member` VALUES ('258', '刘海峰', null, null, '0', '2', '在职', '510122197009180278', '25829', null, 'chengshianquan@163.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '120');
INSERT INTO `h_user_member` VALUES ('259', '梁柏华', null, null, '0', '2', '在职', '510823198804024724', '32235', '410335895', '410335895@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '121');
INSERT INTO `h_user_member` VALUES ('260', '李寓馨', null, null, '0', '2', '在职', '610581198403064160', '30747', '282767426', '282767426@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '122');
INSERT INTO `h_user_member` VALUES ('261', '李永健', null, null, '0', '2', '在职', '510125197701039819', '28128', '921381607', '921381607@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '123');
INSERT INTO `h_user_member` VALUES ('262', '李颜红', null, null, '0', '2', '在职', '371102197808120027', '28714', null, 'LYH19780812@163.COM', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '124');
INSERT INTO `h_user_member` VALUES ('263', '李雪芹', null, null, '0', '2', '在职', '431003197911285046', '29187', null, 'xueqinli@swjtu.edu.cn', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '125');
INSERT INTO `h_user_member` VALUES ('264', '李朋飞', null, null, '0', '2', '在职', '510821197004121334', '25670', '626738397', '626738397@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '126');
INSERT INTO `h_user_member` VALUES ('265', '雷群', null, null, '0', '2', '在职', '51010219690726406X', '25410', '690709569', '690709569@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '127');
INSERT INTO `h_user_member` VALUES ('266', '江玉文', null, null, '0', '2', '在职', '510110196505246598', '23886', null, 'jyw524@126.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '128');
INSERT INTO `h_user_member` VALUES ('267', '邓建江', null, null, '0', '2', '在职', '511028197004210312', '25679', null, 'jjcat@vip.sina.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '129');
INSERT INTO `h_user_member` VALUES ('268', '陈刚', null, null, '0', '2', '离职', '511025197401051694', '27034', '4211740', '4211740@qq.com', null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '130');
INSERT INTO `h_user_member` VALUES ('269', '林元', null, null, '0', '2', '在职', null, null, null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '131');
INSERT INTO `h_user_member` VALUES ('270', '刘焱渝', null, null, '0', '2', '在职', null, null, null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '1', '132');
INSERT INTO `h_user_member` VALUES ('271', '胡忠直', null, null, '0', '2', '离职', null, null, null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '133');
INSERT INTO `h_user_member` VALUES ('272', '黄山', null, null, '0', '2', '离职', null, null, null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '134');
INSERT INTO `h_user_member` VALUES ('273', '高阳', null, null, '0', '2', '离职', null, null, null, null, null, null, null, '0', null, null, '2017-09-03 17:20:46', '0', '0', '135');

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

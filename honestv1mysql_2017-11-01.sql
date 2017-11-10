# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 120.78.73.217 (MySQL 5.5.5-10.1.22-MariaDB)
# Database: honestv1mysql
# Generation Time: 2017-11-01 09:14:11 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table h_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `h_category`;

CREATE TABLE `h_category` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '分类类别',
  `cate_name` varchar(255) DEFAULT NULL,
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT '1' COMMENT '状态',
  `type` int(10) DEFAULT NULL COMMENT '分类类型  1行业  2 服务  3技术',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `h_category` WRITE;
/*!40000 ALTER TABLE `h_category` DISABLE KEYS */;

INSERT INTO `h_category` (`id`, `cate_name`, `addtime`, `status`, `type`)
VALUES
	(1,'城镇燃气','2017-08-24 15:55:26',1,1),
	(2,'道路桥梁','2017-08-24 15:55:43',1,1),
	(3,'电力','2017-08-24 16:03:42',1,1),
	(4,'非煤矿山','2017-08-24 16:04:02',1,1),
	(5,'工贸','2017-08-24 16:04:59',1,1),
	(6,'化工','2017-08-24 16:26:13',1,1),
	(7,'安标','2017-08-24 16:27:22',1,2),
	(8,'安标复审','2017-08-24 16:29:50',1,2),
	(9,'委外','2017-08-25 09:21:34',1,3),
	(10,'机械电子','2017-08-30 09:49:18',1,1),
	(11,'加油加气站','2017-08-30 09:49:26',1,1),
	(12,'涉路施工','2017-08-30 09:49:35',1,1),
	(13,'石油天然气','2017-08-30 09:49:48',1,1),
	(14,'铁路','2017-08-30 09:49:58',1,1),
	(15,'尾矿','2017-08-30 09:51:54',1,1),
	(16,'冶金','2017-08-30 09:52:06',1,1),
	(17,'安全评估','2017-08-30 09:52:40',1,2),
	(18,'地灾','2017-08-30 09:52:53',1,2),
	(19,'环评','2017-08-30 09:53:00',1,2),
	(20,'控评','2017-08-30 09:53:47',1,2),
	(21,'论证','2017-08-30 09:53:55',1,2),
	(22,'能评','2017-08-30 09:54:03',1,2),
	(23,'其它','2017-08-30 09:54:10',1,2),
	(24,'现状','2017-08-30 09:54:17',1,2),
	(25,'验收','2017-08-30 09:54:25',1,2),
	(26,'应急预案','2017-08-30 09:54:34',1,2),
	(27,'预评','2017-08-30 09:54:42',1,2),
	(28,'职检','2017-08-30 09:54:50',1,2),
	(29,'重大危险源','2017-08-30 09:54:58',1,2),
	(30,'专篇','2017-08-30 09:55:04',1,2),
	(31,'专项评价','2017-08-30 09:55:12',1,2),
	(32,'咨询','2017-08-30 09:55:23',1,2),
	(33,'综合分析','2017-08-30 09:55:29',1,2),
	(34,'职卫','2017-08-30 09:55:56',1,3),
	(35,'安全','2017-08-30 09:56:03',1,3),
	(36,'咨询','2017-08-30 09:56:15',1,3);

/*!40000 ALTER TABLE `h_category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table h_contract
# ------------------------------------------------------------

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

LOCK TABLES `h_contract` WRITE;
/*!40000 ALTER TABLE `h_contract` DISABLE KEYS */;

INSERT INTO `h_contract` (`contract_id`, `contract_year`, `contract_number`, `province`, `city`, `area`, `plate`, `industry`, `army`, `service_tyep`, `sign_date`, `sign_user`, `contract_price`, `addtime`, `title`, `customer_id`, `del_state`, `contract_situation`, `estimate_price`, `review_price`, `prepay`, `expenditure`, `remaks`, `completion_status`, `complete_time`, `contract_file`, `entrust_file`, `receivables_state`, `lssued_state`, `projectNum`)
VALUES
	(546,'2013','13CD001','四川','成都',NULL,'36','6',1,'23','2013-01-01','140','195000','2017-11-01 11:19:19','中国电子科技集团公司第十研究所XXX生产能力建设项目（含评审费）',14,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'1',0,1),
	(545,'2013','13BZH002','四川','成都',NULL,'34','6',0,'23','2013-01-01','142','30000','2017-11-01 11:19:19','四川新路设备吊装工程有限公司（成都傲鼎新路件运输有限公司）安全生产标准化三级达标咨询（项目停止，不退款）',14,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'1',0,1),
	(543,'2013','13AB001','四川','阿坝',NULL,'35','6',0,'23','2013-01-01','225','10000','2017-11-01 11:19:19','黑水县冰川加气站',12,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'1',1,1),
	(544,'2013','13AB002','四川','阿坝',NULL,'35','6',0,'23','2013-01-01','225','10000','2017-11-01 11:19:19','红原县白河液化气储配站',14,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'1',0,1),
	(547,'2013','13CD002','四川','成都',NULL,'34','6',1,'24','2013-01-01','140','98000','2017-11-01 11:19:19','中国电子科技集团公司第十研究所XXX研制保障条件建设项目（含评审费）',14,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'1',0,1),
	(548,'2013','13CD003','四川','成都',NULL,'35','6',0,'25','2013-01-01',NULL,'5000','2017-11-01 11:19:20','四川鑫达实业有限公司青羊加油站',14,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'1',0,1),
	(549,'2013','13CD004','四川','成都',NULL,'5','6',0,'22','2013-01-01','225','35000','2017-11-01 11:19:20','家得润生态房屋有限公司（含评审费）',14,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'1',0,1),
	(550,'2013','13CD007','四川','成都',NULL,'34','6',0,'21','2013-01-01',NULL,'5000','2017-11-01 11:19:20','成都申华贸易有限公司经营危险化学品',14,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'1',1,1);

/*!40000 ALTER TABLE `h_contract` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table h_contract_account
# ------------------------------------------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `h_contract_account` WRITE;
/*!40000 ALTER TABLE `h_contract_account` DISABLE KEYS */;

INSERT INTO `h_contract_account` (`id`, `type`, `contract_id`, `price`, `voucher`, `time`, `handler`, `receivables`, `detailed`, `reimbursement`, `approval`, `billing_type`, `invoice_num`, `remaks`, `expenditure_type`, `contract_number`, `create_time`)
VALUES
	(27,1,543,'10000',NULL,'2013-01-01',NULL,'银行转账','合同收入',NULL,NULL,NULL,NULL,NULL,NULL,'13AB001',NULL),
	(28,1,544,'10000',NULL,'2013-01-01',NULL,'银行转账','合同收入',NULL,NULL,NULL,NULL,NULL,NULL,'13AB002',NULL),
	(29,1,546,'195000',NULL,'2013-02-01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13CD001',NULL),
	(30,1,547,'98000',NULL,'2013-07-01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13CD002',NULL),
	(31,1,548,'5000',NULL,'2013-01-01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13CD003',NULL);

/*!40000 ALTER TABLE `h_contract_account` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table h_customer
# ------------------------------------------------------------

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

LOCK TABLES `h_customer` WRITE;
/*!40000 ALTER TABLE `h_customer` DISABLE KEYS */;

INSERT INTO `h_customer` (`id`, `contract_number`, `title`, `industry`, `address`, `postcode`, `province`, `city`, `area`, `phone1`, `phone2`, `facsimile`, `tax_on`, `open_bank`, `bank_account`, `email`, `http`, `remarks`, `linkman`, `state`, `addtime`)
VALUES
	(13,'13NC001','中国石油天然气股份有限公司','1','南充市丝绸路1号',NULL,'四川','南充',NULL,'13508087992',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'142',1,'2017-11-01 11:12:48'),
	(14,'13CD001','中国电子科技集团公司','10',NULL,NULL,'四川','成都',NULL,'028-87555291',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'140',1,'2017-11-01 11:12:48'),
	(12,'13AB001','示例1','1','南充市丝绸路1号',NULL,'四川','南充','顺庆区','12345678',NULL,NULL,'123123','123123','213123','123123',NULL,'123123','142',1,'2017-11-01 11:12:48');

/*!40000 ALTER TABLE `h_customer` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table h_customer_contacts
# ------------------------------------------------------------

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

LOCK TABLES `h_customer_contacts` WRITE;
/*!40000 ALTER TABLE `h_customer_contacts` DISABLE KEYS */;

INSERT INTO `h_customer_contacts` (`id`, `company_id`, `name`, `company_name`, `department`, `duties`, `phone`, `qq`, `wechat`, `email`, `tel`, `facsimile`, `link_man`, `remaks`)
VALUES
	(9,12,'张捷','示例1','1','1','1582727232',NULL,NULL,'2323',NULL,'12','142',NULL),
	(10,13,'张捷','中国石油天然气股份有限公司','1','1','13508087992',NULL,NULL,NULL,NULL,NULL,'142',NULL),
	(11,14,'张蓉','中国电子科技集团公司',NULL,NULL,'028-87555291',NULL,NULL,NULL,NULL,NULL,'140',NULL);

/*!40000 ALTER TABLE `h_customer_contacts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table h_project
# ------------------------------------------------------------

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
  `signature` varchar(255) DEFAULT NULL COMMENT '署名',
  PRIMARY KEY (`id`,`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `h_project` WRITE;
/*!40000 ALTER TABLE `h_project` DISABLE KEYS */;

INSERT INTO `h_project` (`c_id`, `id`, `c_number`, `year`, `title`, `province`, `city`, `town`, `contacts`, `contacts_address`, `phone`, `signing`, `signing_date`, `military`, `technology_id`, `service_id`, `industry_id`, `addtime`, `del_state`, `cycle`, `requirement`, `project_status`, `remarks`, `responsible_user`, `scene_time`, `signature`)
VALUES
	(546,99,'13CD001','2013','中国电子科技集团公司','四川','成都',NULL,'11',NULL,NULL,NULL,NULL,0,35,27,1,'2017-11-01 15:03:45',0,NULL,NULL,1,NULL,140,NULL,'李铭陈刚朱建立'),
	(544,100,'13AB002','2013','红原县白河液化气储配站','四川','阿坝','红原','11',NULL,NULL,NULL,NULL,0,35,24,1,'2017-11-01 15:22:57',0,'41408',NULL,NULL,NULL,140,NULL,NULL),
	(546,101,'13CD001','2013','中国电子科技集团公司','四川','成都',NULL,'11',NULL,NULL,NULL,NULL,0,35,27,1,'2017-11-01 15:22:58',0,NULL,NULL,NULL,NULL,140,NULL,NULL),
	(547,102,'13CD002','2013','成都天泽减速机制造有限公司','四川','成都','郫县','11',NULL,NULL,NULL,NULL,0,35,27,10,'2017-11-01 15:22:58',0,'41288',NULL,1,NULL,142,NULL,'李铭陈刚朱建立'),
	(548,103,'13CD003','2013','成都威腾树脂化工有限公司','四川','成都','龙泉','11',NULL,NULL,NULL,NULL,0,35,24,6,'2017-11-01 15:22:59',0,NULL,NULL,1,NULL,NULL,NULL,'秦林刘海峰朱建立'),
	(549,104,'13CD004','2013','成都申华贸易有限公司','四川','成都','新都','11',NULL,NULL,NULL,NULL,0,35,24,5,'2017-11-01 15:22:59',0,'41284',NULL,1,NULL,NULL,NULL,'陈刚李颜红龙朝晖朱建立'),
	(545,105,'13BZH002','2013','成都荆竹花涂料有限公司','四川','成都',NULL,'11',NULL,NULL,NULL,NULL,0,35,24,6,'2017-11-01 15:22:59',0,NULL,NULL,1,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `h_project` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table h_project_edition
# ------------------------------------------------------------

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
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `h_project_edition` WRITE;
/*!40000 ALTER TABLE `h_project_edition` DISABLE KEYS */;

INSERT INTO `h_project_edition` (`record_id`, `type`, `situation`, `deliver_time`, `express_num`, `express_name`, `project_id`, `file_name`, `file_path`, `state`, `auditor`, `create_time`)
VALUES
	(72,1,'2013/5/29交雷静瑶','2013-05-29 00:00:00',NULL,NULL,99,NULL,NULL,0,NULL,'2017-11-01 16:49:25'),
	(73,1,'2013/1/17交雷静瑶','2013-01-17 00:00:00',NULL,NULL,102,NULL,NULL,0,NULL,'2017-11-01 16:49:25'),
	(74,1,'已邮2013/5/16','2013-05-15 00:00:00',NULL,NULL,NULL,NULL,NULL,0,NULL,'2017-11-01 16:49:25'),
	(75,1,'已邮2013/6/25,2013/7/4退回','2013-06-24 00:00:00',NULL,NULL,100,NULL,NULL,0,NULL,'2017-11-01 16:49:26');

/*!40000 ALTER TABLE `h_project_edition` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table h_project_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `h_project_group`;

CREATE TABLE `h_project_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务组',
  `project_id` int(11) DEFAULT NULL COMMENT '任务id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户',
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `type` int(11) DEFAULT '1' COMMENT '任务类型。1第一编织人。 2技术负责人。 3 审核人。4项目负责人。5现场人员 6其他职员',
  `state` int(1) DEFAULT '1' COMMENT '人员状态。 1正常。0取消任务',
  `price` int(11) DEFAULT NULL COMMENT '提成金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `h_project_group` WRITE;
/*!40000 ALTER TABLE `h_project_group` DISABLE KEYS */;

INSERT INTO `h_project_group` (`id`, `project_id`, `user_id`, `addtime`, `type`, `state`, `price`)
VALUES
	(22,97,140,'2017-11-01 14:58:16',1,1,NULL),
	(23,98,140,'2017-11-01 15:00:42',1,1,NULL),
	(24,99,140,'2017-11-01 15:03:45',1,1,NULL),
	(25,100,140,'2017-11-01 15:22:57',1,1,NULL),
	(26,101,140,'2017-11-01 15:22:58',1,1,NULL),
	(27,102,142,'2017-11-01 15:22:58',1,1,NULL),
	(28,103,140,'2017-11-01 15:22:59',1,1,NULL),
	(29,104,142,'2017-11-01 15:22:59',1,1,NULL),
	(30,105,140,'2017-11-01 15:22:59',1,1,NULL),
	(52,103,258,'2017-11-01 16:36:35',4,1,NULL),
	(53,103,273,'2017-11-01 16:36:35',2,1,NULL),
	(54,104,268,'2017-11-01 16:36:35',4,1,NULL),
	(55,104,139,'2017-11-01 16:36:35',3,1,NULL),
	(56,104,273,'2017-11-01 16:36:36',2,1,NULL),
	(57,99,199,'2017-11-01 16:36:36',4,1,NULL),
	(58,99,139,'2017-11-01 16:36:36',3,1,NULL),
	(59,99,268,'2017-11-01 16:36:36',2,1,NULL),
	(60,102,199,'2017-11-01 16:36:36',4,1,NULL),
	(61,102,139,'2017-11-01 16:36:37',3,1,NULL),
	(62,102,268,'2017-11-01 16:36:37',2,1,NULL);

/*!40000 ALTER TABLE `h_project_group` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table h_project_message
# ------------------------------------------------------------

DROP TABLE IF EXISTS `h_project_message`;

CREATE TABLE `h_project_message` (
  `m_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '任务留言',
  `user_id` int(11) DEFAULT NULL COMMENT '用户',
  `project_id` int(11) DEFAULT NULL COMMENT '任务',
  `content` varchar(11) DEFAULT NULL COMMENT '留言内容',
  `to_user_id` int(11) DEFAULT '0' COMMENT '恢复留言id',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '时间',
  `file_name` varchar(50) DEFAULT NULL COMMENT '文件名称',
  `file_path` varchar(255) DEFAULT NULL COMMENT '文件路径',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `type` int(11) DEFAULT NULL COMMENT '留言阶段',
  PRIMARY KEY (`m_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;



# Dump of table h_project_record
# ------------------------------------------------------------

DROP TABLE IF EXISTS `h_project_record`;

CREATE TABLE `h_project_record` (
  `record_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '纪录表',
  `type` int(11) DEFAULT NULL COMMENT '任务类型',
  `file_name` varchar(50) DEFAULT NULL COMMENT '文件名称',
  `file_path` varchar(255) DEFAULT NULL COMMENT '文件路径',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `content` varchar(255) DEFAULT NULL COMMENT '内容',
  `project_id` int(11) DEFAULT NULL COMMENT '所属任务',
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table h_project_task
# ------------------------------------------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `h_project_task` WRITE;
/*!40000 ALTER TABLE `h_project_task` DISABLE KEYS */;

INSERT INTO `h_project_task` (`id`, `project_id`, `contract_number`, `Issued_time`, `completion_time`, `go_scene`, `compiling_personnel`, `state`, `content`, `technology_personnel`, `admin_user`, `responsibility`, `examine`, `addtime`, `scene_user`, `signature`, `compiling`, `task_status`, `complete_time`)
VALUES
	(75,81,'13AB001','2017-09-29 22:43:48','60','2017-03-20','165','1',NULL,'273',NULL,'224','139','2017-09-29 22:43:48','142','朱建立刘海峰','165',1,NULL),
	(77,84,'201710153','2017-10-16 16:52:53','78','下周一','142','1',NULL,'',1,'','','2017-10-16 16:52:53','2','23',NULL,0,NULL);

/*!40000 ALTER TABLE `h_project_task` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table h_project_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `h_project_type`;

CREATE TABLE `h_project_type` (
  `type_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '任务纪录',
  `content` varchar(255) DEFAULT NULL COMMENT '纪录内容',
  `type` int(11) DEFAULT NULL COMMENT '纪录类型',
  `completion` int(11) DEFAULT '0' COMMENT '完成比例',
  `updataTime` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `project_id` int(11) DEFAULT NULL COMMENT '所属任务',
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;



# Dump of table h_system_log
# ------------------------------------------------------------

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

LOCK TABLES `h_system_log` WRITE;
/*!40000 ALTER TABLE `h_system_log` DISABLE KEYS */;

INSERT INTO `h_system_log` (`log_id`, `log_url`, `user_id`, `username`, `log_time`, `log_ip`, `log_sql`, `log_status`, `log_message`)
VALUES
	(1,'Category/add_industry',1,'admin','2017-11-01 11:10:53','::1',NULL,1,'新增行业类别成功,行业名称为信息'),
	(2,'Category/del_industry',1,'admin','2017-11-01 11:11:00','::1',NULL,1,'删除行业类别成功,行业id为37'),
	(3,'contract/import_contract',1,'admin','2017-11-01 11:19:20','::1',NULL,1,'导入了商品信息，导入成功8条，失败0条，失败条目：'),
	(4,'Project/import_Project',1,'admin','2017-11-01 14:58:16','::1',NULL,1,'导入了项目信息，导入成功1条，失败8条，失败条目：2,3,4,6,7,8,9,10'),
	(5,'Project/import_Project',1,'admin','2017-11-01 15:00:42','::1',NULL,1,'导入了项目信息，导入成功1条，失败8条，失败条目：2,3,4,6,7,8,9,10'),
	(6,'Project/import_Project',1,'admin','2017-11-01 15:03:45','::1',NULL,1,'导入了项目信息，导入成功1条，失败8条，失败条目：2,3,4,6,7,8,9,10'),
	(7,'Project/import_Project',1,'admin','2017-11-01 15:06:42','::1',NULL,1,'导入了项目信息，导入成功0条，失败8条，失败条目：2,3,4,6,7,8,9,10'),
	(8,'contract/import_contract',1,'admin','2017-11-01 15:16:41','::1',NULL,1,'导入了商品信息，导入成功8条，失败0条，失败条目：'),
	(9,'Project/import_Project',1,'admin','2017-11-01 15:22:59','::1',NULL,1,'导入了项目信息，导入成功6条，失败3条，失败条目：2,4,10'),
	(10,'Project/importProjectTask',1,'admin','2017-11-01 16:32:13','::1',NULL,1,'导入了项目信息，导入成功6条，失败0条，失败条目：'),
	(11,'Project/importProjectTask',1,'admin','2017-11-01 16:36:37','::1',NULL,1,'导入了项目任务纪录信息，导入成功6条，失败0条，失败条目：'),
	(12,'Project/Import_projectState',1,'admin','2017-11-01 16:49:26','::1',NULL,1,'导入了任务状态信息，导入成功4条，失败0条，失败条目：'),
	(13,'Finance/Import_income',1,'admin','2017-11-01 16:54:04','::1',NULL,1,'导入了合同收入信息，导入成功0条，失败9条，失败条目：2,3,4,5,6,7,8,9,10'),
	(14,'Finance/Import_expenditure',1,'admin','2017-11-01 17:00:19','::1',NULL,1,'导入了合同支出信息，导入成功0条，失败9条，失败条目：2,3,4,5,6,7,8,9,10'),
	(15,'Finance/Import_income',1,'admin','2017-11-01 17:04:11','::1',NULL,1,'导入了合同收入信息，导入成功5条，失败0条，失败条目：');

/*!40000 ALTER TABLE `h_system_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table h_system_nav
# ------------------------------------------------------------

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

LOCK TABLES `h_system_nav` WRITE;
/*!40000 ALTER TABLE `h_system_nav` DISABLE KEYS */;

INSERT INTO `h_system_nav` (`id`, `name`, `status`, `pid`, `addtime`, `url`, `url_type`, `style`)
VALUES
	(1,'管理员 | 用户',1,0,NULL,'member',NULL,'am-icon-user-secret'),
	(2,'客户管理',1,0,'2017-08-14 14:35:07','Customer/index',NULL,'am-icon-user-secret'),
	(3,'权限管理',1,1,'2017-08-14 15:29:42','Member/power',NULL,''),
	(4,'添加权限',0,3,'2017-08-14 15:31:18','Member/add_power',NULL,''),
	(9,'编辑权限',0,3,'2017-08-15 11:35:43','Member/edit_power',NULL,NULL),
	(10,'删除权限',0,3,'2017-08-15 11:36:05','Member/del_power',NULL,NULL),
	(11,'职员组管理',1,1,'2017-08-15 11:37:22','Member/userGroup',NULL,''),
	(12,'新增成员组',0,11,'2017-08-15 12:03:42','Member/add_userGroup',NULL,NULL),
	(13,'编辑成员组',0,11,'2017-08-15 12:04:22','Member/edit_userGroup',NULL,NULL),
	(14,'删除成员组',0,11,'2017-08-15 12:04:57','Member/del_userGroup',NULL,NULL),
	(15,'修改成员组权限',0,11,'2017-08-15 12:05:45','Member/edit_group_power',NULL,NULL),
	(16,'职员列表',1,1,'2017-08-16 10:29:49','Member/user_List',NULL,''),
	(17,'分类管理',1,0,'2017-08-24 15:00:23','Category',NULL,'am-icon-tags'),
	(18,'行业类别',1,17,'2017-08-24 15:01:20','Category/industry',NULL,NULL),
	(19,'服务类别',1,17,'2017-08-24 15:01:58','Category/service',NULL,NULL),
	(20,'技术板块',1,17,'2017-08-24 15:02:32','Category/technology',NULL,NULL),
	(21,'新增行业分类',0,18,'2017-08-24 15:26:00','Category/add_industry',NULL,NULL),
	(22,'编辑行业类别',0,18,'2017-08-24 16:11:15','Category/edit_industry',NULL,NULL),
	(23,'删除行业类别',0,18,'2017-08-24 16:15:58','Category/del_industry',NULL,NULL),
	(24,'新增服务类型',0,19,'2017-08-24 17:11:32','Category/add_service',NULL,NULL),
	(25,'编辑服务类型',0,19,'2017-08-24 17:12:00','Category/edit_service',NULL,NULL),
	(26,'删除服务类型',0,19,'2017-08-24 17:12:30','Category/del_service',NULL,NULL),
	(27,'新增技术板块',0,20,'2017-08-24 17:12:56','Category/add_technology',NULL,NULL),
	(28,'编辑技术板块',0,20,'2017-08-24 17:13:57','Category/edit_technology',NULL,NULL),
	(29,'删除技术板块',0,20,'2017-08-24 17:14:33','Category/del_technology',NULL,NULL),
	(30,'合同管理',1,0,'2017-08-25 09:05:03','Contract/index',NULL,'am-icon-tags'),
	(31,'项目管理',1,0,'2017-08-25 09:05:41','Project/index',NULL,'am-icon-tags'),
	(32,'新增客户',0,2,'2017-08-25 16:30:36','Customer/add_customer',NULL,NULL),
	(33,'新增客户联系人',0,2,'2017-08-25 17:56:01','Customer/add_customer_user',NULL,NULL),
	(34,'修改客户联系人',0,2,'2017-08-27 11:29:15','Customer/edit_customer_user',NULL,NULL),
	(35,'删除客户',0,2,'2017-08-27 11:29:36','Customer/edit_customer_status',NULL,NULL),
	(36,'新增合同',0,30,'2017-08-27 17:36:58','Contract/add_contract',NULL,NULL),
	(37,'编辑合同',0,30,'2017-08-27 17:37:19','Contract/edit_contract',NULL,NULL),
	(38,'删除合同',0,30,'2017-08-27 17:37:49','Contract/del_contract_state',NULL,NULL),
	(39,'新增项目',0,31,'2017-09-04 09:20:34','Project/add_project',NULL,NULL),
	(40,'编辑项目',0,31,'2017-09-04 09:21:25','Project/edit_project',NULL,NULL),
	(41,'导入项目',0,31,'2017-09-04 09:23:01','Project/import_project',NULL,NULL),
	(42,'导入合同',0,30,'2017-09-04 09:23:37','Contract/import_contract',NULL,NULL),
	(43,'新增职员',0,16,'2017-09-04 09:23:58','Member/add_user',NULL,''),
	(44,'编辑职员',0,16,'2017-09-04 09:40:23','Member/edit_user',NULL,NULL),
	(45,'导入职员',0,16,'2017-09-04 09:42:48','Member/import_userList',NULL,NULL),
	(46,'任务管理',0,0,'2017-09-07 21:11:49','Task/task_list',NULL,'am-icon-tags'),
	(47,'个人中心',1,0,'2017-09-09 15:06:48','userCenter',NULL,'am-icon-tags'),
	(48,'个人信息',1,47,'2017-09-09 15:09:23','UserCenter/userinfo',NULL,NULL),
	(49,'个人任务',1,47,'2017-09-09 15:10:00','UserCenter/task',NULL,NULL),
	(50,'财务管理',1,0,'2017-09-09 15:22:40','Finance/contract',NULL,'am-icon-tags'),
	(51,'系统日志',1,0,'2017-09-14 10:02:02','Welcome/system_log',NULL,'am-icon-list-alt'),
	(53,'删除项目',0,31,'2017-09-30 10:18:22','Project/del_project',NULL,NULL),
	(54,'导入历史纪录',1,0,'2017-10-24 10:05:58','Welcome/Import_Record',NULL,'am-icon-tags');

/*!40000 ALTER TABLE `h_system_nav` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table h_user_compact
# ------------------------------------------------------------

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;



# Dump of table h_user_contacts
# ------------------------------------------------------------

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



# Dump of table h_user_education
# ------------------------------------------------------------

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



# Dump of table h_user_expert
# ------------------------------------------------------------

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

LOCK TABLES `h_user_expert` WRITE;
/*!40000 ALTER TABLE `h_user_expert` DISABLE KEYS */;

INSERT INTO `h_user_expert` (`id`, `user_id`, `username`, `major`, `remarks`, `education`, `company`, `duties`, `title`, `phone1`, `phone2`)
VALUES
	(1,139,NULL,'3456','',NULL,'234234','打广告1','地方','2345665432','3432423');

/*!40000 ALTER TABLE `h_user_expert` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table h_user_group
# ------------------------------------------------------------

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

LOCK TABLES `h_user_group` WRITE;
/*!40000 ALTER TABLE `h_user_group` DISABLE KEYS */;

INSERT INTO `h_user_group` (`gid`, `group_name`, `alias`, `icon`, `status`, `perm`, `addtime`)
VALUES
	(1,'超级管理员','超级管理员','upload/icon/2017-08-15_093738.jpg',1,'[{\"id\":\"1\",\"name\":\"管理员 | 用户\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"member\",\"url_type\":null,\"style\":\"am-icon-user-secret\"},{\"id\":\"3\",\"name\":\"权限管理\",\"status\":\"1\",\"pid\":\"1\",\"addtime\":\"2017-08-14 15:29:42\",\"url\":\"Member\\/power\",\"url_type\":null,\"style\":\"\"},{\"id\":\"4\",\"name\":\"添加权限\",\"status\":\"0\",\"pid\":\"3\",\"addtime\":\"2017-08-14 15:31:18\",\"url\":\"Member\\/add_power\",\"url_type\":null,\"style\":\"\"},{\"id\":\"9\",\"name\":\"编辑权限\",\"status\":\"0\",\"pid\":\"3\",\"addtime\":\"2017-08-15 11:35:43\",\"url\":\"Member\\/edit_power\",\"url_type\":null,\"style\":null},{\"id\":\"10\",\"name\":\"删除权限\",\"status\":\"0\",\"pid\":\"3\",\"addtime\":\"2017-08-15 11:36:05\",\"url\":\"Member\\/del_power\",\"url_type\":null,\"style\":null},{\"id\":\"11\",\"name\":\"职员组管理\",\"status\":\"1\",\"pid\":\"1\",\"addtime\":\"2017-08-15 11:37:22\",\"url\":\"Member\\/userGroup\",\"url_type\":null,\"style\":\"\"},{\"id\":\"12\",\"name\":\"新增成员组\",\"status\":\"0\",\"pid\":\"11\",\"addtime\":\"2017-08-15 12:03:42\",\"url\":\"Member\\/add_userGroup\",\"url_type\":null,\"style\":null},{\"id\":\"13\",\"name\":\"编辑成员组\",\"status\":\"0\",\"pid\":\"11\",\"addtime\":\"2017-08-15 12:04:22\",\"url\":\"Member\\/edit_userGroup\",\"url_type\":null,\"style\":null},{\"id\":\"14\",\"name\":\"删除成员组\",\"status\":\"0\",\"pid\":\"11\",\"addtime\":\"2017-08-15 12:04:57\",\"url\":\"Member\\/del_userGroup\",\"url_type\":null,\"style\":null},{\"id\":\"15\",\"name\":\"修改成员组权限\",\"status\":\"0\",\"pid\":\"11\",\"addtime\":\"2017-08-15 12:05:45\",\"url\":\"Member\\/edit_group_power\",\"url_type\":null,\"style\":null},{\"id\":\"16\",\"name\":\"职员列表\",\"status\":\"1\",\"pid\":\"1\",\"addtime\":\"2017-08-16 10:29:49\",\"url\":\"Member\\/user_List\",\"url_type\":null,\"style\":\"\"},{\"id\":\"43\",\"name\":\"新增职员\",\"status\":\"0\",\"pid\":\"16\",\"addtime\":\"2017-09-04 09:23:58\",\"url\":\"Member\\/add_user\",\"url_type\":null,\"style\":\"\"},{\"id\":\"44\",\"name\":\"编辑职员\",\"status\":\"0\",\"pid\":\"16\",\"addtime\":\"2017-09-04 09:40:23\",\"url\":\"Member\\/edit_user\",\"url_type\":null,\"style\":null},{\"id\":\"45\",\"name\":\"导入职员\",\"status\":\"0\",\"pid\":\"16\",\"addtime\":\"2017-09-04 09:42:48\",\"url\":\"Member\\/import_userList\",\"url_type\":null,\"style\":null},{\"id\":\"2\",\"name\":\"客户管理\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":\"2017-08-14 14:35:07\",\"url\":\"Customer\\/index\",\"url_type\":null,\"style\":\"am-icon-user-secret\"},{\"id\":\"32\",\"name\":\"新增客户\",\"status\":\"0\",\"pid\":\"2\",\"addtime\":\"2017-08-25 16:30:36\",\"url\":\"Customer\\/add_customer\",\"url_type\":null,\"style\":null},{\"id\":\"33\",\"name\":\"新增客户联系人\",\"status\":\"0\",\"pid\":\"2\",\"addtime\":\"2017-08-25 17:56:01\",\"url\":\"Customer\\/add_customer_user\",\"url_type\":null,\"style\":null},{\"id\":\"34\",\"name\":\"修改客户联系人\",\"status\":\"0\",\"pid\":\"2\",\"addtime\":\"2017-08-27 11:29:15\",\"url\":\"Customer\\/edit_customer_user\",\"url_type\":null,\"style\":null},{\"id\":\"35\",\"name\":\"删除客户\",\"status\":\"0\",\"pid\":\"2\",\"addtime\":\"2017-08-27 11:29:36\",\"url\":\"Customer\\/edit_customer_status\",\"url_type\":null,\"style\":null},{\"id\":\"17\",\"name\":\"分类管理\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":\"2017-08-24 15:00:23\",\"url\":\"Category\",\"url_type\":null,\"style\":\"am-icon-tags\"},{\"id\":\"18\",\"name\":\"行业类别\",\"status\":\"1\",\"pid\":\"17\",\"addtime\":\"2017-08-24 15:01:20\",\"url\":\"Category\\/industry\",\"url_type\":null,\"style\":null},{\"id\":\"21\",\"name\":\"新增行业分类\",\"status\":\"0\",\"pid\":\"18\",\"addtime\":\"2017-08-24 15:26:00\",\"url\":\"Category\\/add_industry\",\"url_type\":null,\"style\":null},{\"id\":\"22\",\"name\":\"编辑行业类别\",\"status\":\"0\",\"pid\":\"18\",\"addtime\":\"2017-08-24 16:11:15\",\"url\":\"Category\\/edit_industry\",\"url_type\":null,\"style\":null},{\"id\":\"23\",\"name\":\"删除行业类别\",\"status\":\"0\",\"pid\":\"18\",\"addtime\":\"2017-08-24 16:15:58\",\"url\":\"Category\\/del_industry\",\"url_type\":null,\"style\":null},{\"id\":\"19\",\"name\":\"服务类别\",\"status\":\"1\",\"pid\":\"17\",\"addtime\":\"2017-08-24 15:01:58\",\"url\":\"Category\\/service\",\"url_type\":null,\"style\":null},{\"id\":\"24\",\"name\":\"新增服务类型\",\"status\":\"0\",\"pid\":\"19\",\"addtime\":\"2017-08-24 17:11:32\",\"url\":\"Category\\/add_service\",\"url_type\":null,\"style\":null},{\"id\":\"25\",\"name\":\"编辑服务类型\",\"status\":\"0\",\"pid\":\"19\",\"addtime\":\"2017-08-24 17:12:00\",\"url\":\"Category\\/edit_service\",\"url_type\":null,\"style\":null},{\"id\":\"26\",\"name\":\"删除服务类型\",\"status\":\"0\",\"pid\":\"19\",\"addtime\":\"2017-08-24 17:12:30\",\"url\":\"Category\\/del_service\",\"url_type\":null,\"style\":null},{\"id\":\"20\",\"name\":\"技术板块\",\"status\":\"1\",\"pid\":\"17\",\"addtime\":\"2017-08-24 15:02:32\",\"url\":\"Category\\/technology\",\"url_type\":null,\"style\":null},{\"id\":\"27\",\"name\":\"新增技术板块\",\"status\":\"0\",\"pid\":\"20\",\"addtime\":\"2017-08-24 17:12:56\",\"url\":\"Category\\/add_technology\",\"url_type\":null,\"style\":null},{\"id\":\"28\",\"name\":\"编辑技术板块\",\"status\":\"0\",\"pid\":\"20\",\"addtime\":\"2017-08-24 17:13:57\",\"url\":\"Category\\/edit_technology\",\"url_type\":null,\"style\":null},{\"id\":\"29\",\"name\":\"删除技术板块\",\"status\":\"0\",\"pid\":\"20\",\"addtime\":\"2017-08-24 17:14:33\",\"url\":\"Category\\/del_technology\",\"url_type\":null,\"style\":null},{\"id\":\"30\",\"name\":\"合同管理\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":\"2017-08-25 09:05:03\",\"url\":\"Contract\\/index\",\"url_type\":null,\"style\":\"am-icon-tags\"},{\"id\":\"36\",\"name\":\"新增合同\",\"status\":\"0\",\"pid\":\"30\",\"addtime\":\"2017-08-27 17:36:58\",\"url\":\"Contract\\/add_contract\",\"url_type\":null,\"style\":null},{\"id\":\"37\",\"name\":\"编辑合同\",\"status\":\"0\",\"pid\":\"30\",\"addtime\":\"2017-08-27 17:37:19\",\"url\":\"Contract\\/edit_contract\",\"url_type\":null,\"style\":null},{\"id\":\"38\",\"name\":\"删除合同\",\"status\":\"0\",\"pid\":\"30\",\"addtime\":\"2017-08-27 17:37:49\",\"url\":\"Contract\\/del_contract_state\",\"url_type\":null,\"style\":null},{\"id\":\"42\",\"name\":\"导入合同\",\"status\":\"0\",\"pid\":\"30\",\"addtime\":\"2017-09-04 09:23:37\",\"url\":\"Contract\\/import_contract\",\"url_type\":null,\"style\":null},{\"id\":\"31\",\"name\":\"项目管理\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":\"2017-08-25 09:05:41\",\"url\":\"Project\\/index\",\"url_type\":null,\"style\":\"am-icon-tags\"},{\"id\":\"39\",\"name\":\"新增项目\",\"status\":\"0\",\"pid\":\"31\",\"addtime\":\"2017-09-04 09:20:34\",\"url\":\"Project\\/add_project\",\"url_type\":null,\"style\":null},{\"id\":\"40\",\"name\":\"编辑项目\",\"status\":\"0\",\"pid\":\"31\",\"addtime\":\"2017-09-04 09:21:25\",\"url\":\"Project\\/edit_project\",\"url_type\":null,\"style\":null},{\"id\":\"41\",\"name\":\"导入项目\",\"status\":\"0\",\"pid\":\"31\",\"addtime\":\"2017-09-04 09:23:01\",\"url\":\"Project\\/import_project\",\"url_type\":null,\"style\":null},{\"id\":\"53\",\"name\":\"删除项目\",\"status\":\"0\",\"pid\":\"31\",\"addtime\":\"2017-09-30 10:18:22\",\"url\":\"Project\\/del_project\",\"url_type\":null,\"style\":null},{\"id\":\"46\",\"name\":\"任务管理\",\"status\":\"0\",\"pid\":\"0\",\"addtime\":\"2017-09-07 21:11:49\",\"url\":\"Task\\/task_list\",\"url_type\":null,\"style\":\"am-icon-tags\"},{\"id\":\"47\",\"name\":\"个人中心\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":\"2017-09-09 15:06:48\",\"url\":\"userCenter\",\"url_type\":null,\"style\":\"am-icon-tags\"},{\"id\":\"48\",\"name\":\"个人信息\",\"status\":\"1\",\"pid\":\"47\",\"addtime\":\"2017-09-09 15:09:23\",\"url\":\"UserCenter\\/userinfo\",\"url_type\":null,\"style\":null},{\"id\":\"49\",\"name\":\"个人任务\",\"status\":\"1\",\"pid\":\"47\",\"addtime\":\"2017-09-09 15:10:00\",\"url\":\"UserCenter\\/task\",\"url_type\":null,\"style\":null},{\"id\":\"50\",\"name\":\"财务管理\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":\"2017-09-09 15:22:40\",\"url\":\"Finance\\/contract\",\"url_type\":null,\"style\":\"am-icon-tags\"},{\"id\":\"51\",\"name\":\"系统日志\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":\"2017-09-14 10:02:02\",\"url\":\"Welcome\\/system_log\",\"url_type\":null,\"style\":\"am-icon-list-alt\"},{\"id\":\"54\",\"name\":\"导入历史纪录\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":\"2017-10-24 10:05:58\",\"url\":\"Welcome\\/Import_Record\",\"url_type\":null,\"style\":\"am-icon-tags\"}]','2017-08-15 09:37:38'),
	(3,'测试用户组','测试用户组','upload/icon/2017-08-16_102343.png',1,'[{\"id\":\"1\",\"name\":\"管理员 | 用户\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":null,\"url\":\"member\",\"url_type\":null,\"style\":\"am-icon-user-secret\"},{\"id\":\"3\",\"name\":\"权限管理\",\"status\":\"1\",\"pid\":\"1\",\"addtime\":\"2017-08-14 15:29:42\",\"url\":\"Member\\/power\",\"url_type\":null,\"style\":\"\"},{\"id\":\"4\",\"name\":\"添加权限\",\"status\":\"0\",\"pid\":\"3\",\"addtime\":\"2017-08-14 15:31:18\",\"url\":\"Member\\/add_power\",\"url_type\":null,\"style\":\"\"},{\"id\":\"9\",\"name\":\"编辑权限\",\"status\":\"0\",\"pid\":\"3\",\"addtime\":\"2017-08-15 11:35:43\",\"url\":\"Member\\/edit_power\",\"url_type\":null,\"style\":null},{\"id\":\"10\",\"name\":\"删除权限\",\"status\":\"0\",\"pid\":\"3\",\"addtime\":\"2017-08-15 11:36:05\",\"url\":\"Member\\/del_power\",\"url_type\":null,\"style\":null}]','2017-08-16 10:23:43'),
	(2,'普通职员组','普通职员组',NULL,1,'[{\"id\":\"2\",\"name\":\"客户管理\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":\"2017-08-14 14:35:07\",\"url\":\"Customer\\/index\",\"url_type\":null,\"style\":\"am-icon-user-secret\"},{\"id\":\"32\",\"name\":\"新增客户\",\"status\":\"0\",\"pid\":\"2\",\"addtime\":\"2017-08-25 16:30:36\",\"url\":\"Customer\\/add_customer\",\"url_type\":null,\"style\":null},{\"id\":\"33\",\"name\":\"新增客户联系人\",\"status\":\"0\",\"pid\":\"2\",\"addtime\":\"2017-08-25 17:56:01\",\"url\":\"Customer\\/add_customer_user\",\"url_type\":null,\"style\":null},{\"id\":\"34\",\"name\":\"修改客户联系人\",\"status\":\"0\",\"pid\":\"2\",\"addtime\":\"2017-08-27 11:29:15\",\"url\":\"Customer\\/edit_customer_user\",\"url_type\":null,\"style\":null},{\"id\":\"30\",\"name\":\"合同管理\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":\"2017-08-25 09:05:03\",\"url\":\"Contract\\/index\",\"url_type\":null,\"style\":\"am-icon-tags\"},{\"id\":\"36\",\"name\":\"新增合同\",\"status\":\"0\",\"pid\":\"30\",\"addtime\":\"2017-08-27 17:36:58\",\"url\":\"Contract\\/add_contract\",\"url_type\":null,\"style\":null},{\"id\":\"37\",\"name\":\"编辑合同\",\"status\":\"0\",\"pid\":\"30\",\"addtime\":\"2017-08-27 17:37:19\",\"url\":\"Contract\\/edit_contract\",\"url_type\":null,\"style\":null},{\"id\":\"38\",\"name\":\"删除合同\",\"status\":\"0\",\"pid\":\"30\",\"addtime\":\"2017-08-27 17:37:49\",\"url\":\"Contract\\/del_contract_state\",\"url_type\":null,\"style\":null},{\"id\":\"31\",\"name\":\"项目管理\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":\"2017-08-25 09:05:41\",\"url\":\"Project\\/index\",\"url_type\":null,\"style\":\"am-icon-tags\"},{\"id\":\"39\",\"name\":\"新增项目\",\"status\":\"0\",\"pid\":\"31\",\"addtime\":\"2017-09-04 09:20:34\",\"url\":\"Project\\/add_project\",\"url_type\":null,\"style\":null},{\"id\":\"40\",\"name\":\"编辑项目\",\"status\":\"0\",\"pid\":\"31\",\"addtime\":\"2017-09-04 09:21:25\",\"url\":\"Project\\/edit_project\",\"url_type\":null,\"style\":null},{\"id\":\"47\",\"name\":\"个人中心\",\"status\":\"1\",\"pid\":\"0\",\"addtime\":\"2017-09-09 15:06:48\",\"url\":\"userCenter\",\"url_type\":null,\"style\":\"am-icon-tags\"},{\"id\":\"48\",\"name\":\"个人信息\",\"status\":\"1\",\"pid\":\"47\",\"addtime\":\"2017-09-09 15:09:23\",\"url\":\"UserCenter\\/userinfo\",\"url_type\":null,\"style\":null},{\"id\":\"49\",\"name\":\"个人任务\",\"status\":\"1\",\"pid\":\"47\",\"addtime\":\"2017-09-09 15:10:00\",\"url\":\"UserCenter\\/task\",\"url_type\":null,\"style\":null}]','2017-09-03 17:24:29');

/*!40000 ALTER TABLE `h_user_group` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table h_user_member
# ------------------------------------------------------------

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

LOCK TABLES `h_user_member` WRITE;
/*!40000 ALTER TABLE `h_user_member` DISABLE KEYS */;

INSERT INTO `h_user_member` (`user_id`, `username`, `avatar`, `password`, `status`, `gid`, `incumbency`, `id_card`, `birth_date`, `qq`, `email`, `education`, `entry_time`, `employment`, `social_state`, `social_security`, `remarks`, `addtime`, `super_admin`, `part`, `employee_num`)
VALUES
	(1,'admin','upload/avater/2017-09-30_1100002.jpg','e10adc3949ba59abbe56e057f20f883e',1,1,'1','324234','234234','234234','234234','234234',NULL,NULL,1,NULL,NULL,'2017-08-10 15:20:08',1,NULL,NULL),
	(2,'测试1234','upload/avater/2017-08-22_171254.jpg',NULL,NULL,3,'在职','1838478362833','12313','234242','4241234@qq.com','34234','234234','234234',1,'','234234','2017-08-22 17:16:09',0,1,NULL),
	(139,'刘东',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','511002197502271210','27452','304278936','304278936@qq.com','本科','37561',NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,1),
	(140,'金红英',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','510103196609183444','24368',NULL,NULL,'本科','37681',NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,2),
	(141,'汪彪',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','511027195505067811','20215',NULL,NULL,'大专','37561',NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,3),
	(142,'唐蓉生',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','511027197405240014','27173',NULL,'chengshianquan@163.com','本科','37561',NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,4),
	(143,'丁婕汀',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','510311198702041766','31812','429014017',NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,5),
	(144,'陈佳',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','510105198201170529','29968',NULL,NULL,'大专','37834',NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,6),
	(145,'龚礼春',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','513624198010067472','29500','1203618487','1203618487@qq.com','本科','39508',NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,7),
	(146,'李声敏',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','511521198109286820','29857',NULL,NULL,'大专','38108',NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,8),
	(147,'殷隽',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','511202198201041345','29955',NULL,NULL,'本科','38152',NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,9),
	(148,'彭超',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','513426198708305024','32019',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,10),
	(149,'胡晓',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','510202197910281821','29156','631856161',NULL,'本科','42779',NULL,1,'017469378',NULL,'2017-09-03 17:20:46',0,1,11),
	(150,'郑超',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','513721199002027332','32906',NULL,NULL,'本科','41396',NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,12),
	(151,'刘相元',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','510111196704261973','24588',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,13),
	(152,'李多顺',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','540102195910303518','21853',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,14),
	(153,'王晓波',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','512902197007020473','25751',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,15),
	(154,'胡春梅',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','512926196203215266','22726',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,16),
	(155,'郭三俊',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','513021197109076057','26183',NULL,NULL,NULL,'38824',NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,17),
	(156,'况月康',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','500102198611248455\n','31740',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,18),
	(157,'黎永泽',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','511324198408214737','30915',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,19),
	(158,'罗志成',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','510103197301121911','26676',NULL,NULL,'大专','38633',NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,20),
	(159,'肖翔',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','510502197309282555','26935',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,21),
	(160,'黎晓彬',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','511381198010165274','29510',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,22),
	(161,'陈莲',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','511011198306088321','30475',NULL,'clian305@163.com','本科','40283',NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,23),
	(162,'花年祺',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','510105199206070513','33762',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,24),
	(163,'徐月霞',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','370782198210140021','30238',NULL,'clearbabyabc@163.com','硕士','39264',NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,25),
	(164,'杨天义',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','510811198405032932','30805',NULL,'gzbcareer@163.com','本科','40575',NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,26),
	(165,'郑碧涛',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','510122198311149575','30634','153532001','153532001@qq.com','本科','39174',NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,27),
	(166,'周才鹏',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','511126198912202112','32862',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,28),
	(167,'邹彪',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','510113198912102039','32852',NULL,NULL,'本科','41456',NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,29),
	(168,'曾謇',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','511002198204210035','30062','6830244','6830244@qq.com','本科','38572',NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,30),
	(169,'曾国会',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','53212619880604272X','32298',NULL,'zengguohui086@163.com',NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,31),
	(170,'左灿',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','511622198808059418','32360','291101515','291101515@QQ.COM','本科','41505',NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,32),
	(171,'余锦徽',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','340824198709196610','32039',NULL,NULL,'本科','41337',NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,33),
	(172,'陈帮玲',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','512928197204092621','26398',NULL,NULL,'本科','41000',NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,34),
	(173,'陈保华',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','411024198610153210','31700',NULL,NULL,'本科','41183',NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,35),
	(174,'代茂莲',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','510521199012160184','33223',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,36),
	(175,'龚文正',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','510922198807101210','32334',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,37),
	(176,'何丹',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','511922198807072086','32331',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,38),
	(177,'胡晓平',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','513424198806080612','32302',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,39),
	(178,'黄力',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','511523198711180052','32099',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,40),
	(179,'寇元成',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','513022198709111937','32031',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,41),
	(180,'李虹',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','512930197209275082','26569',NULL,NULL,'本科','40909',NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,42),
	(181,'李累',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','500236198910022252','32783',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,43),
	(182,'刘小兰',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','511025198902030861','32542',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,44),
	(183,'刘晓玉',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','510112198912112441','32853',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,45),
	(184,'刘宇琦',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','510503198910037017','32784',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,46),
	(185,'潘学良',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','510524198904271191','32625',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,47),
	(186,'唐侄香',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','511023198801259269','32167',NULL,NULL,'本科','40909',NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,48),
	(187,'王志斌',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','410728198606123177','31575','416640835','416640835@qq.com','本科','41334',NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,49),
	(188,'杨凡',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','510923199010175678','33163',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,50),
	(189,'张大桓',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','510126197112156415','26282',NULL,NULL,'大专','40969',NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,51),
	(190,'赵明',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','511521198910126953','32793',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,52),
	(191,'何昭明',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','510103196103260713','22366',NULL,NULL,NULL,'42802',NULL,0,NULL,'（卫生检验）         主管检验师','2017-09-03 17:20:46',0,1,53),
	(192,'江光平',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','519003195409050098','19972','404368909','404368909@qq.com','本科','40118',NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,54),
	(193,'陈月',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','51010719860901002X','31656',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,55),
	(194,'冯文',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','511102196808211422','25071',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,56),
	(195,'黄志猛',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','511321198806085134','32302',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,57),
	(196,'江恒',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','510104198207222119','30154',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,58),
	(197,'江黎',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','510123198802294327','32202',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,59),
	(198,'金锐',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','513027198002190012','29270','264039','264039@qq.com',NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,60),
	(199,'雷静瑶',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','510129197808302125','28732','945365879','945365879@qq.com',NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,61),
	(200,'李铭',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','513701198101030019','29589','37765223','37765223@qq.com',NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,62),
	(201,'李霞',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','513401198802295726\n','32202',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,63),
	(202,'李羽林',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','513021199308268712','34207',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,64),
	(203,'廖帅',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','51102319880710783X','32334','978402033','978402033@qq.com',NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,65),
	(204,'罗彬',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','51112319880728353X','32352',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,66),
	(205,'罗利影',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','513601197908136228','29080','9298206','9298206@qq.com',NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,67),
	(206,'罗志远',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','120104197111026810','26239',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,68),
	(207,'吕亦瑭',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','510902199108179165','33467',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,69),
	(208,'马谦强',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','142322198411243036','31010',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,70),
	(209,'欧江波',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','513922198609124692','31667','3893547','3893547@qq.com',NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,71),
	(210,'荣丹',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','511124198704086011','31875','550543786','550543786@qq.com',NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,72),
	(211,'石建伟',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','511622198710146433','32064','375683278','375683278@qq.com',NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,73),
	(212,'石思琴',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','512529197208126782','26523',NULL,'SSQ812@souhu.com',NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,74),
	(213,'宋利强',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','500107198611161634','31732',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,75),
	(214,'汪敬',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','51132119870205419X','31813',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,76),
	(215,'汪洋',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','510821199601121331','35076',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,77),
	(216,'王明',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','51101119880825705X','32380','361172316','361172316@qq.com',NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,78),
	(217,'王宁',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','510181198511133631','31364',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,79),
	(218,'王琼慧',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','510923198901107121','32518',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,80),
	(219,'王隋',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','510824198208083724','30171','748800454','748800454@qq.com',NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,81),
	(220,'王伟',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','510184198706210931','31949',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,82),
	(221,'伍燕',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','511622198901114020','32519',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,83),
	(222,'张浩',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','511002198912283614','32870',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,84),
	(223,'张洪林',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','510623198702030612','31811',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,85),
	(224,'朱建立',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','511121197502017938','27426',NULL,'chengshianquan@163.com',NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,86),
	(225,'朱新国',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','510113194806180414','17702',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,87),
	(226,'朱小燕',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','510522196803080263','24905',NULL,'chengshianquan@163.com',NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,0,88),
	(227,'周树兴',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','530127680824453','25074','277810677','277810677@qq.com',NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,0,89),
	(228,'郑自文',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','53038119851111155x','31362',NULL,'zzw8511@126.com',NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,0,90),
	(229,'赵艳',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','610502197612227827','28116',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,0,91),
	(230,'张忠敏',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','520102197110302467','26236',NULL,'ysdk@vip.sina.com',NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,0,92),
	(231,'张振韬',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','450221198008091959','29442','317854637','317854637@qq.com',NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,93),
	(232,'张念念',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','412702198809160048','32402','1301687978','1301687978@qq.com',NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,0,94),
	(233,'张建军',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','610526198506282553','31226',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,0,95),
	(234,'张丹丹',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','33072419830524341X','30460','5635150','5635150@qq.com',NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,96),
	(235,'余杰珉',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','511102198806060412','32300','279830954','279830954@qq.com',NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,97),
	(236,'于媛',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','610323198511285927','31379','348665826','348665826@qq.com',NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,98),
	(237,'杨颖',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','511222198108010144','29799',NULL,'xalgs02@126.com',NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,99),
	(238,'杨坤',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','510502197312282521','27026','393978055','393978055@qq.com',NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,0,100),
	(239,'徐泽树',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','510521197210143554','26586',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,0,101),
	(240,'徐安铭',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','41292419670222315X','24525',NULL,'nyanming@163.com',NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,0,102),
	(241,'谢代安',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','512322196308274870','23250','514546419','514546419@qq.com',NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,0,103),
	(242,'王志云',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','430403196304172054','23118',NULL,'ynjxcaoh@163.com',NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,0,104),
	(243,'王杨福',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','510721197107297214','26143',NULL,'wangyangfu890022188@sina.com',NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,0,105),
	(244,'王清君',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','53230119880313311X','32215','2438580411','2438580411@qq.com',NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,0,106),
	(245,'王昊',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','610124198502273911','31105',NULL,'wanghao2872@sina.com',NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,107),
	(246,'田宗斌',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','510411196601090012','24116','2221895597','2221895597@qq.com',NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,0,108),
	(247,'唐静',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','511121198011117883','29536',NULL,'xalgs02@126.com',NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,0,109),
	(248,'帅茧强',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','511102198902274613','32566','331953048','331953048@qq.com',NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,0,110),
	(249,'石丽英',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','510502195304261123','19475','304278936','304278936@qq.com',NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,0,111),
	(250,'申兴兵',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','510922197503240153','27477','304278936','304278936@qq.com',NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,0,112),
	(251,'秦林',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','51021219760101081X','27760','178119519','178119519@qq.com',NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,0,113),
	(252,'钱慧',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','511623198806195244','32313','627906176','627906176@qq.com',NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,0,114),
	(253,'彭树全',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','51023019820107335X','29958','45323184','45323184@qq.com',NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,0,115),
	(254,'罗旭',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','513030197209120613','26554',NULL,'chengshianquan@163.com',NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,0,116),
	(255,'罗红艳',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','512501196803162146','24913',NULL,'duyangxiao@163.com',NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,0,117),
	(256,'龙朝晖',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','510102196611078460','24418',NULL,'Zhaohuilong77@126.com',NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,0,118),
	(257,'刘新定',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','411081198506058376','31203','550560868','550560868@qq.com',NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,0,119),
	(258,'刘海峰',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','510122197009180278','25829',NULL,'chengshianquan@163.com',NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,0,120),
	(259,'梁柏华',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','510823198804024724','32235','410335895','410335895@qq.com',NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,0,121),
	(260,'李寓馨',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','610581198403064160','30747','282767426','282767426@qq.com',NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,0,122),
	(261,'李永健',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','510125197701039819','28128','921381607','921381607@qq.com',NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,0,123),
	(262,'李颜红',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','371102197808120027','28714',NULL,'LYH19780812@163.COM',NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,0,124),
	(263,'李雪芹',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','431003197911285046','29187',NULL,'xueqinli@swjtu.edu.cn',NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,0,125),
	(264,'李朋飞',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','510821197004121334','25670','626738397','626738397@qq.com',NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,0,126),
	(265,'雷群',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','51010219690726406X','25410','690709569','690709569@qq.com',NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,0,127),
	(266,'江玉文',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','510110196505246598','23886',NULL,'jyw524@126.com',NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,0,128),
	(267,'邓建江',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职','511028197004210312','25679',NULL,'jjcat@vip.sina.com',NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,0,129),
	(268,'陈刚',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'离职','511025197401051694','27034','4211740','4211740@qq.com',NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,0,130),
	(269,'林元',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,131),
	(270,'刘焱渝',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'在职',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,1,132),
	(271,'胡忠直',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'离职',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,0,133),
	(272,'黄山',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'离职',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,0,134),
	(273,'高阳',NULL,'e10adc3949ba59abbe56e057f20f883e',0,2,'离职',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2017-09-03 17:20:46',0,0,135);

/*!40000 ALTER TABLE `h_user_member` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table h_user_message
# ------------------------------------------------------------

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



# Dump of table h_user_qualifications
# ------------------------------------------------------------

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

LOCK TABLES `h_user_qualifications` WRITE;
/*!40000 ALTER TABLE `h_user_qualifications` DISABLE KEYS */;

INSERT INTO `h_user_qualifications` (`id`, `user_id`, `username`, `title`, `education`, `major`, `evaluate`, `evaluate_certificate`, `testing_certificate`, `remarks`)
VALUES
	(1,139,NULL,'信息1','2','324','','','','');

/*!40000 ALTER TABLE `h_user_qualifications` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table h_user_regsecurity
# ------------------------------------------------------------

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

LOCK TABLES `h_user_regsecurity` WRITE;
/*!40000 ALTER TABLE `h_user_regsecurity` DISABLE KEYS */;

INSERT INTO `h_user_regsecurity` (`id`, `user_id`, `username`, `reg_profession`, `basis`, `practice_number`, `practising_certificate`, `reg_type`, `remarks`)
VALUES
	(1,139,NULL,'234','34','3434','23442','','');

/*!40000 ALTER TABLE `h_user_regsecurity` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table h_user_safetyevaluation
# ------------------------------------------------------------

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

LOCK TABLES `h_user_safetyevaluation` WRITE;
/*!40000 ALTER TABLE `h_user_safetyevaluation` DISABLE KEYS */;

INSERT INTO `h_user_safetyevaluation` (`id`, `user_id`, `certificate_num`, `level`, `reg_nature`, `company_name`, `reg_start`, `reg_end`, `one_cognizance_major`, `one_cognizance_basis`, `tow_cognizance_major`, `tow_cognizance_basis`, `three_cognizance_major`, `ap_regPassword`, `ap_education_pwd`, `remark`, `practitioners_num`)
VALUES
	(1,139,34567890,'三级','专职','sdfsdfsf士大夫','','','','','',NULL,'','','','23234234234',3453);

/*!40000 ALTER TABLE `h_user_safetyevaluation` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

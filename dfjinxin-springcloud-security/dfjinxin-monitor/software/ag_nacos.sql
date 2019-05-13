/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : ag_nacos

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2019-05-13 16:26:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `c_use` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `effect` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `c_schema` text COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfo_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info';

-- ----------------------------
-- Records of config_info
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfoaggr_datagrouptenantdatum` (`data_id`,`group_id`,`tenant_id`,`datum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='增加租户字段';

-- ----------------------------
-- Records of config_info_aggr
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfobeta_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info_beta';

-- ----------------------------
-- Records of config_info_beta
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfotag_datagrouptenanttag` (`data_id`,`group_id`,`tenant_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info_tag';

-- ----------------------------
-- Records of config_info_tag
-- ----------------------------

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tag_name` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`),
  UNIQUE KEY `uk_configtagrelation_configidtag` (`id`,`tag_name`,`tag_type`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_tag_relation';

-- ----------------------------
-- Records of config_tags_relation
-- ----------------------------

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='集群、各Group容量信息表';

-- ----------------------------
-- Records of group_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info` (
  `id` bigint(64) unsigned NOT NULL,
  `nid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL,
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL,
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL,
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00',
  `src_user` text COLLATE utf8_bin,
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `op_type` char(10) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`nid`),
  KEY `idx_gmt_create` (`gmt_create`),
  KEY `idx_gmt_modified` (`gmt_modified`),
  KEY `idx_did` (`data_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='多租户改造';

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
INSERT INTO `his_config_info` VALUES ('2', '1', 'ace-admin-dev.yaml', 'DEFAULT_GROUP', '', 0x6C6F6767696E673A0A2020206C6576656C3A0A232020202020202020746B2E6D7962617469733A2044454255470A20202020202020636F6D2E6769746875622E777869616F71692E73656375726974792E61646D696E3A2044454255470A737072696E673A0A2020206170706C69636174696F6E3A0A202020202020206E616D653A206163652D61646D696E0A2020206A61636B736F6E3A0A20202020202020646174652D666F726D61743A20797979792D4D4D2D64642048483A6D6D3A73730A2020202020202074696D652D7A6F6E653A20474D542B380A2020202020202064656661756C742D70726F70657274792D696E636C7573696F6E3A206E6F6E5F6E756C6C0A20202064617461736F757263653A0A202020202020206E616D653A20746573740A2020202020202075726C3A206A6462633A6D7973716C3A2F2F247B4D5953514C5F484F53543A6C6F63616C686F73747D3A247B4D5953514C5F504F52543A333330367D2F61675F61646D696E5F76313F757365556E69636F64653D7472756526636861726163746572456E636F64696E673D555446380A20202020202020757365726E616D653A20726F6F740A2020202020202070617373776F72643A203132333435360A202020202020202320E4BDBFE794A86472756964E695B0E68DAEE6BA900A20202020202020747970653A20636F6D2E616C69626162612E64727569642E706F6F6C2E447275696444617461536F757263650A202020202020206472697665722D636C6173732D6E616D653A20636F6D2E6D7973716C2E6A6462632E4472697665720A2020202020202066696C746572733A20737461740A202020202020206D61784163746976653A2032300A20202020202020696E697469616C53697A653A20310A202020202020206D6178576169743A2036303030300A202020202020206D696E49646C653A20310A2020202020202074696D654265747765656E4576696374696F6E52756E734D696C6C69733A2036303030300A202020202020206D696E457669637461626C6549646C6554696D654D696C6C69733A203330303030300A2020202020202076616C69646174696F6E51756572793A2073656C656374202778270A20202020202020746573745768696C6549646C653A20747275650A20202020202020746573744F6E426F72726F773A2066616C73650A20202020202020746573744F6E52657475726E3A2066616C73650A20202020202020706F6F6C507265706172656453746174656D656E74733A20747275650A202020202020206D61784F70656E507265706172656453746174656D656E74733A2032300A2020207261626269746D713A0A20202020202020686F73743A20247B5241424249545F4D515F484F53543A6C6F63616C686F73747D0A20202020202020706F72743A2020247B5241424249545F4D515F504F52543A353637327D0A20202020202020757365726E616D653A2067756573740A2020202020202070617373776F72643A2067756573740A202020736C657574683A0A2020202020656E61626C65643A20747275650A2020202020687474703A0A202020202020206C65676163793A0A202020202020202020656E61626C65643A20747275650A202020636C6F75643A0A20202020206E61636F733A0A20202020202020646973636F766572793A0A2020202020202020207365727665722D616464723A203132372E302E302E313A383834380A202020202073656E74696E656C3A0A202020202020207472616E73706F72743A0A20202020202020202064617368626F6172643A206C6F63616C686F73743A383038300A73616D706C653A0A207A69706B696E3A0A20202023205768656E20656E61626C65643D66616C73652C20747261636573206C6F6720746F2074686520636F6E736F6C652E20436F6D6D656E7420746F2073656E6420746F207A69706B696E0A202020656E61626C65643A2066616C73650A0A6D7962617469733A0A202020626173657061636B6167653A20636F6D2E6769746875622E777869616F71692E73656375726974792E61646D696E2E6D61707065720A202020786D6C4C6F636174696F6E3A20636C617373706174683A6D61707065722F2A2A2F2A2E786D6C0A2020206D61707065722D6C6F636174696F6E733A2022636C617373706174682A3A6D61707065722F2A2E786D6C220A0A7365727665723A0A202020706F72743A20383736320A0A2320E5BF85E9A1BBE9858DE7BDAE0A666569676E3A0A2068747470636C69656E743A0A202020656E61626C65643A2066616C73650A206F6B687474703A0A202020656E61626C65643A20747275650A0A726962626F6E3A0A20657572656B613A0A202020656E61626C65643A20747275650A205265616454696D656F75743A203130303030300A20436F6E6E65637454696D656F75743A203130303030300A204D61784175746F526574726965733A20300A204D61784175746F526574726965734E6578745365727665723A20310A204F6B546F52657472794F6E416C6C4F7065726174696F6E733A2066616C73650A0A687973747269783A0A20746872656164706F6F6C3A0A20202064656661756C743A0A2020202020636F726553697A653A2031303030202323E5B9B6E58F91E689A7E8A18CE79A84E69C80E5A4A7E7BABFE7A88BE695B0EFBC8CE9BB98E8AEA431300A20202020206D6178517565756553697A653A2031303030202323426C6F636B696E675175657565E79A84E69C80E5A4A7E9989FE58897E695B00A2020202020717565756553697A6552656A656374696F6E5468726573686F6C643A20353030202323E58DB3E4BDBF6D6178517565756553697A65E6B2A1E69C89E8BEBEE588B0EFBC8CE8BEBEE588B0717565756553697A6552656A656374696F6E5468726573686F6C64E8AFA5E580BCE5908EEFBC8CE8AFB7E6B182E4B99FE4BC9AE8A2ABE68B92E7BB9D0A20636F6D6D616E643A0A20202064656661756C743A0A2020202020657865637574696F6E3A0A2020202020202069736F6C6174696F6E3A0A2020202020202020207468726561643A0A202020202020202020202074696D656F7574496E4D696C6C697365636F6E64733A203131303030300A0A0A2320E9858DE7BDAE737761676765720A737761676765723A0A202020656E61626C65643A20747275650A202020626173652D7061636B6167653A20636F6D2E6769746875622E777869616F71692E73656375726974792E61646D696E0A2020207469746C653A206163652D61646D696E0A20202076657273696F6E3A20312E302E302E534E415053484F540A2020206465736372697074696F6E3A20E7AEA1E79086E5908EE7ABAFE69C8DE58AA10A202020636F6E746163743A0A202020202020206E616D653A2061646D696E0A0A617574683A0A207365727669636549643A206163652D617574680A20757365723A0A202020746F6B656E2D6865616465723A20417574686F72697A6174696F6E0A20636C69656E743A0A20202069643A206163652D61646D696E0A2020207365637265743A203132333435360A202020746F6B656E2D6865616465723A20782D636C69656E742D746F6B656E0A0A2372656469732D636163686520E79BB8E585B30A72656469733A0A202020706F6F6C3A0A20202020202020206D61784163746976653A203330300A20202020202020206D617849646C653A203130300A20202020202020206D6178576169743A20313030300A202020686F73743A20247B52454449535F484F53543A6C6F63616C686F73747D0A202020706F72743A2020247B52454449535F504F52543A363337397D0A20202070617373776F72643A0A20202074696D656F75743A20323030300A2020202320E69C8DE58AA1E68896E5BA94E794A8E5908D0A2020207379734E616D653A206163652D61646D696E0A202020656E61626C653A20747275650A20202064617461626173653A20300A0A6D616E6167656D656E743A0A20656E64706F696E74733A0A2020207765623A0A20202020206578706F737572653A0A20202020202020696E636C7564653A20272A270A2073656375726974793A0A202020656E61626C65643A2066616C73650A0A, '8a70da456f86dfb53253351ab9e4d42e', '2010-05-05 00:00:00', '2019-05-13 16:25:07', null, '0:0:0:0:0:0:0:1', 'D', '');
INSERT INTO `his_config_info` VALUES ('1', '2', 'ace-auth-dev.yaml', 'DEFAULT_GROUP', '', 0x737072696E673A0A2020206170706C69636174696F6E3A0A202020202020206E616D653A206163652D617574680A2020206A61636B736F6E3A0A20202020202020646174652D666F726D61743A20797979792D4D4D2D64642048483A6D6D3A73730A2020202020202074696D652D7A6F6E653A20474D542B380A2020202020202064656661756C742D70726F70657274792D696E636C7573696F6E3A206E6F6E5F6E756C6C0A20202072656469733A0A2020202020202064617461626173653A20320A20202020202020686F73743A20247B52454449535F484F53543A6C6F63616C686F73747D0A20202020202020706F72743A20247B52454449535F504F52543A363337397D0A20202020202020706F6F6C3A0A202020202020206D61782D6163746976653A2032300A20202064617461736F757263653A0A20202020206E616D653A20746573740A202020202075726C3A206A6462633A6D7973716C3A2F2F247B4D5953514C5F484F53543A6C6F63616C686F73747D3A247B4D5953514C5F504F52543A333330367D2F61675F617574685F76313F757365556E69636F64653D7472756526636861726163746572456E636F64696E673D555446380A2020202020757365726E616D653A20726F6F740A202020202070617373776F72643A203132333435360A20202020202320E4BDBFE794A86472756964E695B0E68DAEE6BA900A2020202020747970653A20636F6D2E616C69626162612E64727569642E706F6F6C2E447275696444617461536F757263650A20202020206472697665722D636C6173732D6E616D653A20636F6D2E6D7973716C2E6A6462632E4472697665720A202020202066696C746572733A20737461740A20202020206D61784163746976653A2032300A2020202020696E697469616C53697A653A20310A20202020206D6178576169743A2036303030300A20202020206D696E49646C653A20310A202020202074696D654265747765656E4576696374696F6E52756E734D696C6C69733A2036303030300A20202020206D696E457669637461626C6549646C6554696D654D696C6C69733A203330303030300A202020202076616C69646174696F6E51756572793A2073656C656374202778270A2020202020746573745768696C6549646C653A20747275650A2020202020746573744F6E426F72726F773A2066616C73650A2020202020746573744F6E52657475726E3A2066616C73650A2020202020706F6F6C507265706172656453746174656D656E74733A20747275650A20202020206D61784F70656E507265706172656453746174656D656E74733A2032300A2020207261626269746D713A0A2020202020686F73743A20247B5241424249545F4D515F484F53543A6C6F63616C686F73747D0A2020202020706F72743A2020247B5241424249545F4D515F504F52543A353637327D0A2020202020757365726E616D653A2067756573740A202020202070617373776F72643A2067756573740A202020736C657574683A0A2020202020656E61626C65643A20747275650A2020202020687474703A0A202020202020206C65676163793A0A202020202020202020656E61626C65643A20747275650A202020636C6F75643A0A20202020206E61636F733A0A20202020202020646973636F766572793A0A20202020202020202020207365727665722D616464723A203132372E302E302E313A383834380A202020202073656E74696E656C3A0A202020202020207472616E73706F72743A0A20202020202020202064617368626F6172643A206C6F63616C686F73743A383038300A6D7962617469733A0A202020626173657061636B6167653A20636F6D2E6769746875622E777869616F71692E73656375726974792E617574682E6D61707065720A202020786D6C4C6F636174696F6E3A20636C617373706174683A6D61707065722F2A2A2F2A2E786D6C0A2020206D61707065722D6C6F636174696F6E733A2022636C617373706174682A3A6D61707065722F2A2E786D6C220A0A7365727665723A0A202020706F72743A20393737372023E590AFE58AA8E7ABAFE58FA30A0A666569676E3A0A2068747470636C69656E743A0A202020656E61626C65643A2066616C73650A206F6B687474703A0A202020656E61626C65643A20747275650A0A726962626F6E3A0A20657572656B613A0A202020656E61626C65643A20747275650A205265616454696D656F75743A2036303030300A20436F6E6E65637454696D656F75743A2036303030300A204D61784175746F526574726965733A20300A204D61784175746F526574726965734E6578745365727665723A20310A204F6B546F52657472794F6E416C6C4F7065726174696F6E733A2066616C73650A0A687973747269783A0A20746872656164706F6F6C3A0A20202064656661756C743A0A2020202020636F726553697A653A2031303030202323E5B9B6E58F91E689A7E8A18CE79A84E69C80E5A4A7E7BABFE7A88BE695B0EFBC8CE9BB98E8AEA431300A20202020206D6178517565756553697A653A2031303030202323426C6F636B696E675175657565E79A84E69C80E5A4A7E9989FE58897E695B00A2020202020717565756553697A6552656A656374696F6E5468726573686F6C643A20353030202323E58DB3E4BDBF6D6178517565756553697A65E6B2A1E69C89E8BEBEE588B0EFBC8CE8BEBEE588B0717565756553697A6552656A656374696F6E5468726573686F6C64E8AFA5E580BCE5908EEFBC8CE8AFB7E6B182E4B99FE4BC9AE8A2ABE68B92E7BB9D0A20636F6D6D616E643A0A20202064656661756C743A0A2020202020657865637574696F6E3A0A2020202020202069736F6C6174696F6E3A0A2020202020202020207468726561643A0A202020202020202020202074696D656F7574496E4D696C6C697365636F6E64733A2031303030300A0A6A77743A0A20746F6B656E2D6865616465723A20417574686F72697A6174696F6E0A206578706972653A2031343430300A207273612D7365637265743A2078783157455431325E25335E28574534350A0A636C69656E743A0A2069643A206163652D617574680A207365637265743A203132333435360A20746F6B656E2D6865616465723A20782D636C69656E742D746F6B656E0A206578706972653A2031343430300A207273612D7365637265743A2078323331385E5E282A57525951575228515726540A0A6C6F6767696E673A0A2020206C6576656C3A0A232020202020202020746B2E6D7962617469733A2044454255470A20202020202020636F6D2E6769746875622E777869616F71692E73656375726974792E617574683A2044454255470A0A6D616E6167656D656E743A0A20656E64706F696E74733A0A2020207765623A0A20202020206578706F737572653A0A20202020202020696E636C7564653A20272A270A2073656375726974793A0A202020656E61626C65643A2066616C73650A, 'e991ab23752535fb5aa0a75b42bb6fa5', '2010-05-05 00:00:00', '2019-05-13 16:25:11', null, '0:0:0:0:0:0:0:1', 'D', '');
INSERT INTO `his_config_info` VALUES ('3', '3', 'ace-gateway-dev.yaml', 'DEFAULT_GROUP', '', 0x7365727665723A0A20706F72743A20383736350A0A23E8AFB7E6B182E5928CE5938DE5BA94475A4950E58E8BE7BCA9E694AFE68C810A666569676E3A0A2068747470636C69656E743A0A202020656E61626C65643A2066616C73650A206F6B687474703A0A202020656E61626C65643A20747275650A20636F6D7072657373696F6E3A0A202020726571756573743A0A2020202020656E61626C65643A20747275650A20202020206D696D652D74797065733A20746578742F786D6C2C6170706C69636174696F6E2F786D6C2C6170706C69636174696F6E2F6A736F6E0A20202020206D696E2D726571756573742D73697A653A20323034380A202020726573706F6E73653A0A2020202020656E61626C65643A20747275650A0A737072696E673A0A206170706C69636174696F6E3A0A20202020206E616D653A206163652D676174657761790A2072656469733A0A202020202064617461626173653A20320A2020202020686F73743A203132372E302E302E310A20202020206A656469733A0A20202020202020706F6F6C3A0A20202020202020202020206D61782D6163746976653A2032300A207261626269746D713A0A2020202020686F73743A20247B5241424249545F4D515F484F53543A6C6F63616C686F73747D0A2020202020706F72743A2020247B5241424249545F4D515F504F52543A353637327D0A2020202020757365726E616D653A2067756573740A202020202070617373776F72643A2067756573740A20736C657574683A0A202020656E61626C65643A20747275650A202020687474703A0A20202020206C65676163793A0A20202020202020656E61626C65643A20747275650A20636C6F75643A0A20202020676174657761793A0A202020202020646973636F766572793A0A20202020202020206C6F6361746F723A0A202020202020202020206C6F776572436173655365727669636549643A20747275650A20202020202020202020656E61626C65643A20747275650A202020202020726F757465733A0A2020202020202023203D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D0A202020202020202D2069643A206163652D617574680A2020202020202020207572693A206C623A2F2F6163652D617574680A2020202020202020206F726465723A20383030300A202020202020202020707265646963617465733A0A2020202020202020202D20506174683D2F6170692F617574682F2A2A0A2020202020202020202D2052657175657374426F64793D310A20202020202020202066696C746572733A0A2020202020202020202D2053747269705072656669783D320A202020202020202D2069643A206163652D61646D696E0A2020202020202020207572693A206C623A2F2F6163652D61646D696E0A2020202020202020206F726465723A20383030310A202020202020202020707265646963617465733A0A2020202020202020202D20506174683D2F6170692F61646D696E2F2A2A0A2020202020202020202D2052657175657374426F64793D310A20202020202020202066696C746572733A0A2020202020202020202D2053747269705072656669783D320A202020206E61636F733A0A20202020202020646973636F766572793A0A2020202020202020207365727665722D616464723A203132372E302E302E313A383834380A2073656E74696E656C3A0A2020207472616E73706F72743A0A202020202064617368626F6172643A206C6F63616C686F73743A383038300A6C6F6767696E673A0A206C6576656C3A0A202020636F6D2E6769746875622E777869616F71692E73656375726974792E676174652E76323A20696E666F0A0A6D616E6167656D656E743A0A20656E64706F696E74733A0A2020207765623A0A20202020206578706F737572653A0A20202020202020696E636C7564653A20272A270A2073656375726974793A0A202020656E61626C65643A2066616C73650A0A0A676174653A0A2069676E6F72653A0A2020207374617274576974683A202F617574682F6A77740A0A0A617574683A0A207365727669636549643A206163652D617574680A20757365723A0A202020746F6B656E2D6865616465723A20417574686F72697A6174696F6E0A20636C69656E743A0A202020746F6B656E2D6865616465723A20782D636C69656E742D746F6B656E0A20202069643A206163652D67617465202023E4B88DE5A1ABE58899E9BB98E8AEA4E8AFBBE58F96737072696E672E6170706C69636174696F6E2E6E616D650A2020207365637265743A203132333435360A0A0A726962626F6E3A0A20657572656B613A0A202020656E61626C65643A20747275650A205265616454696D656F75743A2036303030300A20436F6E6E65637454696D656F75743A2036303030300A204D61784175746F526574726965733A20300A204D61784175746F526574726965734E6578745365727665723A20310A204F6B546F52657472794F6E416C6C4F7065726174696F6E733A2066616C73650A0A687973747269783A0A20746872656164706F6F6C3A0A20202064656661756C743A0A2020202020636F726553697A653A2031303030202323E5B9B6E58F91E689A7E8A18CE79A84E69C80E5A4A7E7BABFE7A88BE695B0EFBC8CE9BB98E8AEA431300A20202020206D6178517565756553697A653A2031303030202323426C6F636B696E675175657565E79A84E69C80E5A4A7E9989FE58897E695B00A2020202020717565756553697A6552656A656374696F6E5468726573686F6C643A20353030202323E58DB3E4BDBF6D6178517565756553697A65E6B2A1E69C89E8BEBEE588B0EFBC8CE8BEBEE588B0717565756553697A6552656A656374696F6E5468726573686F6C64E8AFA5E580BCE5908EEFBC8CE8AFB7E6B182E4B99FE4BC9AE8A2ABE68B92E7BB9D0A20636F6D6D616E643A0A20202064656661756C743A0A2020202020657865637574696F6E3A0A2020202020202069736F6C6174696F6E3A0A2020202020202020207468726561643A0A202020202020202020202074696D656F7574496E4D696C6C697365636F6E64733A203130303030, 'eb8050d11dfea6bdf6516b85458095c2', '2010-05-05 00:00:00', '2019-05-13 16:25:55', null, '0:0:0:0:0:0:0:1', 'D', '');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `username` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('nacos', 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数',
  `max_aggr_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='租户容量信息表';

-- ----------------------------
-- Records of tenant_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint(20) NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_info_kptenantid` (`kp`,`tenant_id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='tenant_info';

-- ----------------------------
-- Records of tenant_info
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('nacos', '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu', '1');

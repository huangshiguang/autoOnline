CREATE TABLE IF NOT EXISTS `${tableName}` (
  `id` VARCHAR(20) NOT NULL AUTO_INCREMENT,
   <#list params as param>
   `${param.columnName}` ${param.columnType} <#if param.isNullable == true > DEFAULT NULL <#else> NOT NULL </#if> COMMENT '${param.memo}',
   </#list>
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `modify_date` datetime DEFAULT NULL COMMENT '修改日期',
  `orders` bigint(20) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='${memo}';
CREATE TABLE IF NOT EXISTS `tb_admin` (
  `id` VARCHAR(20) NOT NULL AUTO_INCREMENT,
   `name` VARCHAR(100)  NOT NULL  COMMENT '姓名',
   `username` VARCHAR(100)  NOT NULL  COMMENT '用户名',
   `password` VARCHAR(100)  NOT NULL  COMMENT '密码',
   `date` DATETIME  DEFAULT NULL  COMMENT '时间',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `modify_date` datetime DEFAULT NULL COMMENT '修改日期',
  `orders` bigint(20) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='管理员';
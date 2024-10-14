package com.tao.springboot.entity;

import lombok.Data;
import org.apache.ibatis.type.Alias;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Admin-管理员
 * @version: v1.0
 * @Description: 管理员
 * @author: yanjiantao
 * @date: 2018-12-03 09:54:02
 */
@Alias("Admin")
@Data
public class Admin extends BaseEntity {

	private static final long serialVersionUID = 1L;
	
	/** 姓名 */
	private String name;
	
	/** 用户名 */
	private String username;
	
	/** 密码 */
	private String password;
	
	/** 时间 */
	private Date date;
	

    public void buildId() {
        this.id = "CR" + globalId.nextId();
    }
}

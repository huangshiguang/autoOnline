
package com.tao.springboot.dao;

import com.tao.springboot.entity.Admin;


/**
 * AdminDao-管理员
 * @version: v1.0
 * @Description: 管理员
 * @author: yanjiantao
 * @date: 2018-12-03 09:54:02
 */
public interface AdminDao extends BaseDao<Admin> {

	/**
	 * 根据id查找管理员
	 * 
	 * @param id 管理员id
	 * @return 若不存在则返回null
	 * @throws Exception 
	 */
	Admin find(String id) throws Exception;

}
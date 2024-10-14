package com.tao.springboot.dao.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.tao.springboot.dao.AdminDao;
import com.tao.springboot.entity.Admin;

/**
 * AdminDaoImpl-管理员
 * @version: v1.0
 * @Description: 管理员
 * @author: yanjiantao
 * @date: 2018-12-03 09:54:02
 */
/**
 * Dao - 管理员
 */
@Repository("adminDaoImpl")
public class AdminDaoImpl extends BaseDaoImpl<Admin> implements AdminDao {

	@Override
	public Admin find(String mapper, Map<String, Object> parameters) throws Exception {
		return super.find(mapper, parameters);
	}

	public Admin find(String id) throws Exception {
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("id", id);
		return super.find("AdminMapper.findById", parameters);
	}
	
}
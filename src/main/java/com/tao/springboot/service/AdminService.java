package com.tao.springboot.service;

import com.tao.springboot.Page;
import com.tao.springboot.Pageable;
import com.tao.springboot.entity.Admin;

/**
 * AdminService-管理员
 * @version: v1.0
 * @Description: 管理员
 * @author: yanjiantao
 * @date: 2018-12-03 09:54:02
 */
public interface AdminService extends BaseService<Admin> {
	
	Admin findById(String id) throws Exception;

	Page<Admin> findPage(Pageable pageable) throws Exception;
	
	Admin save(Admin admin) throws Exception;
	
	Admin update(Admin admin) throws Exception;
	
}
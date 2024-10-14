package com.tao.springboot.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tao.springboot.Page;
import com.tao.springboot.Pageable;
import com.tao.springboot.dao.AdminDao;
import com.tao.springboot.entity.Admin;
import com.tao.springboot.service.AdminService;

/**
 * AdminServiceImpl-管理员
 * @version: v1.0
 * @Description: 管理员
 * @author: yanjiantao
 * @date: 2018-12-03 09:54:02
 */
@Service("adminServiceImpl")
public class AdminServiceImpl extends BaseServiceImpl<Admin> implements AdminService {

	@Resource(name = "adminDaoImpl")
	private AdminDao adminDao;

	@Resource(name = "adminDaoImpl")
	public void setBaseDao(AdminDao adminDao) {
		super.setBaseDao(adminDao);
	}
	
	public Admin save(Admin admin) throws Exception {
		return adminDao.save("AdminMapper.save", admin);
	}
	
	public Admin update(Admin admin) throws Exception {
		return adminDao.update("AdminMapper.update", admin);
	}
	
	public int delete(String[] ids) throws Exception {
		return adminDao.delete("AdminMapper.deleteAll", ids);
	}

	public Admin findById(String id) throws Exception {
		return adminDao.find(id);
	}

	public Page<Admin> findPage(Pageable pageable) throws Exception {
		
		int pageNumber = pageable.getPageNumber();
		int pageSize = pageable.getPageSize();
		int startIndex = (pageNumber - 1) * pageSize;

		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("startIndex", startIndex);
		parameters.put("pageSize", pageSize);
		parameters.put(pageable.getSearchProperty(), pageable.getSearchValue());
		if(pageable.getFilter() != null){
			parameters.putAll(pageable.getFilter());
		}
		
		List<Admin> admins = adminDao.findList("AdminMapper.findPage", parameters);
		if(admins == null || admins.size() == 0){
			return new Page<Admin>(admins, 0, pageable);
		}else{
			return new Page<Admin>(admins, adminDao.count("AdminMapper.count", parameters), pageable);
		}
	}
}
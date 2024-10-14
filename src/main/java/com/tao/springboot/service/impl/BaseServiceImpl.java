package com.tao.springboot.service.impl;

import java.util.List;
import java.util.Map;

import com.tao.springboot.dao.BaseDao;
import com.tao.springboot.service.BaseService;
import org.springframework.transaction.annotation.Transactional;

/**
 * Service - 基类
 */
@Transactional
public abstract class BaseServiceImpl<T> implements BaseService<T> {

	/** 更新忽略属性 */
	//private static final String[] UPDATE_IGNORE_PROPERTIES = new String[] { BaseEntity.ID_PROPERTY_NAME, BaseEntity.CREATE_DATE_PROPERTY_NAME, BaseEntity.MODIFY_DATE_PROPERTY_NAME };

	/** baseDao */
	private BaseDao<T> baseDao;

	public void setBaseDao(BaseDao<T> baseDao) {
		this.baseDao = baseDao;
	}

	@Transactional
	public T save(String mapper, T entity) throws Exception {
		return baseDao.save(mapper, entity);
	}

	@Transactional
	public T update(String mapper, T entity) throws Exception {
		return baseDao.update(mapper, entity);
	}
	
	@Transactional
	public int delete(String mapper, String id) throws Exception {
		return baseDao.delete(mapper, id);
	}

	@Transactional
	public T find(String mapper, Map<String, Object> parameters) throws Exception {		
		return baseDao.find(mapper, parameters);
	}

	@Transactional
	public int update(String mapper, Map<String, Object> parameter) throws Exception {
		return baseDao.update(mapper, parameter);
	}

	@Transactional
	public int delete(String mapper, String[] ids) throws Exception {
		return baseDao.delete(mapper, ids);
	}

	@Transactional
	public int delete(String mapper, Map<String, Object> parameter) throws Exception {
		return baseDao.delete(mapper, parameter);
	}

	public List<T> findList(String mapper, Map<String, Object> parameter) throws Exception {
		return baseDao.findList(mapper, parameter);
	}
	
	public Long count(String mapper, Map<String, Object> parameter) throws Exception {
		return baseDao.count(mapper, parameter);
	}

	/*public void handle(Payment payment) throws Exception {
		// TODO Auto-generated method stub
		
	}*/
	
}
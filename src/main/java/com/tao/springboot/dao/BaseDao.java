package com.tao.springboot.dao;

import java.util.List;
import java.util.Map;

public interface BaseDao<T> {

	public T find(String mapper, Map<String, Object> parameters) throws Exception;

	public Object findObj(String mapper, Map<String, Object> parameters) throws Exception;
	
	public T save(String mapper, T entity) throws Exception;
	
	public int save(String mapper, Map<String, Object> parameter) throws Exception;
	
	public T update(String mapper, T entity) throws Exception;
	
	public int update(String mapper, Map<String, Object> parameter) throws Exception;

	public int delete(String mapper, String id) throws Exception;
	
	public int delete(String mapper, String[] ids) throws Exception;

	public int delete(String mapper, Map<String, Object> parameter) throws Exception;

	public List<T> findList(String mapper, Map<String, Object> parameter) throws Exception;
	
	public List<Object> findObjList(String mapper, Map<String, Object> parameter) throws Exception;

	public Map<String, Map<String, String>> findMap(String statement, Map<String, Object> parameter, String mapper) throws Exception;

	public Long count(String mapper, Map<String, Object> parameter) throws Exception;
	
	public Double sum(String mapper, Map<String, Object> parameter) throws Exception;
	
	public List<String> findRe(String str, List<String> list) throws Exception;
	
}

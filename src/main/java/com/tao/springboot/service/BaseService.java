package com.tao.springboot.service;

import java.util.List;
import java.util.Map;

/**
 * Service - 基类
 */
public interface BaseService<T> {

	public T find(String mapper, Map<String, Object> parameters) throws Exception;

	public T save(String mapper, T entity) throws Exception;

	public T update(String mapper, T entity) throws Exception;

	public int update(String mapper, Map<String, Object> parameter) throws Exception;

	public int delete(String mapper, String id) throws Exception;

	public int delete(String[] ids) throws Exception;

	public int delete(String mapper, Map<String, Object> parameter) throws Exception;

	public List<T> findList(String mapper, Map<String, Object> parameter) throws Exception;

	public Long count(String mapper, Map<String, Object> parameter) throws Exception;

}
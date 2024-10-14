package com.tao.springboot.service;

import com.tao.springboot.entity.CreateItem;

import java.util.List;
import java.util.Map;

public interface CreateCodeService extends BaseService<CreateItem> {

	List<CreateItem> findColum(Map<String, Object> parameter) throws Exception;

}

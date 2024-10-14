package com.tao.springboot.service.impl;


import com.tao.springboot.dao.CreateCodeDao;
import com.tao.springboot.entity.CreateItem;
import com.tao.springboot.service.CreateCodeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("createCodeServiceImpl")
public class CreateCodeServiceImpl extends BaseServiceImpl<CreateItem> implements CreateCodeService {

	@Resource(name = "createCodeDaoImpl")
	private CreateCodeDao createCodeDao;
	
	@Override
	public int delete(String[] ids) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<CreateItem> findColum(Map<String, Object> parameter) throws Exception {
		// TODO Auto-generated method stub
		return createCodeDao.findList("CreateCodeMapper.findColumn", parameter);
	}

	

}

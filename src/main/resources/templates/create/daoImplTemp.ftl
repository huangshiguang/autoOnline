package ${BASE_PACKAGE}.dao.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ${BASE_PACKAGE}.dao.${objectName}Dao;
import ${BASE_PACKAGE}.entity.${objectName};

/**
 * ${objectName}DaoImpl-${memo}
 * @version: v1.0
 * @Description: ${memo}
 * @author: ${AUTHOR}
 * @date: ${DATE}
 */
/**
 * Dao - 管理员
 */
@Repository("${objectNameLower}DaoImpl")
public class ${objectName}DaoImpl extends BaseDaoImpl<${objectName}> implements ${objectName}Dao {

	@Override
	public ${objectName} find(String mapper, Map<String, Object> parameters) throws Exception {
		return super.find(mapper, parameters);
	}

	public ${objectName} find(String id) throws Exception {
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("id", id);
		return super.find("${objectName}Mapper.findById", parameters);
	}
	
}
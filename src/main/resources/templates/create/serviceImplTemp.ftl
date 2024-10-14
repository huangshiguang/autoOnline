package ${BASE_PACKAGE}.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ${BASE_PACKAGE}.Page;
import ${BASE_PACKAGE}.Pageable;
import ${BASE_PACKAGE}.dao.${objectName}Dao;
import ${BASE_PACKAGE}.entity.${objectName};
import ${BASE_PACKAGE}.service.${objectName}Service;

/**
 * ${objectName}ServiceImpl-${memo}
 * @version: v1.0
 * @Description: ${memo}
 * @author: ${AUTHOR}
 * @date: ${DATE}
 */
@Service("${objectNameLower}ServiceImpl")
public class ${objectName}ServiceImpl extends BaseServiceImpl<${objectName}> implements ${objectName}Service {

	@Resource(name = "${objectNameLower}DaoImpl")
	private ${objectName}Dao ${objectNameLower}Dao;

	@Resource(name = "${objectNameLower}DaoImpl")
	public void setBaseDao(${objectName}Dao ${objectNameLower}Dao) {
		super.setBaseDao(${objectNameLower}Dao);
	}
	
	public ${objectName} save(${objectName} ${objectNameLower}) throws Exception {
		return ${objectNameLower}Dao.save("${objectName}Mapper.save", ${objectNameLower});
	}
	
	public ${objectName} update(${objectName} ${objectNameLower}) throws Exception {
		return ${objectNameLower}Dao.update("${objectName}Mapper.update", ${objectNameLower});
	}
	
	public int delete(String[] ids) throws Exception {
		return ${objectNameLower}Dao.delete("${objectName}Mapper.deleteAll", ids);
	}

	public ${objectName} findById(String id) throws Exception {
		return ${objectNameLower}Dao.find(id);
	}

	public Page<${objectName}> findPage(Pageable pageable) throws Exception {
		
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
		
		List<${objectName}> ${objectNameLower}s = ${objectNameLower}Dao.findList("${objectName}Mapper.findPage", parameters);
		if(${objectNameLower}s == null || ${objectNameLower}s.size() == 0){
			return new Page<${objectName}>(${objectNameLower}s, 0, pageable);
		}else{
			return new Page<${objectName}>(${objectNameLower}s, ${objectNameLower}Dao.count("${objectName}Mapper.count", parameters), pageable);
		}
	}
}
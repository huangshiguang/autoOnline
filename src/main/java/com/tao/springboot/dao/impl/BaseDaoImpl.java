package com.tao.springboot.dao.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.tao.springboot.dao.BaseDao;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("daoSupport")
public abstract class BaseDaoImpl<T> implements BaseDao<T> {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	public T save(String str, T entity) throws Exception {
		sqlSessionTemplate.insert(str, entity);
		return entity;
	}

	public List<T> save(String str, List<T> entitys) throws Exception {
		sqlSessionTemplate.insert(str, entitys);
		return entitys;
	}
	
	public int save(String str, Map<String, Object> parameter) throws Exception {
		return sqlSessionTemplate.insert(str, parameter);		
	}

	public int update(String mapper, Map<String, Object> parameter) throws Exception {
		return sqlSessionTemplate.update(mapper, parameter);
	}
	
	public T update(String str, T entity) throws Exception {
		sqlSessionTemplate.update(str, entity);
		return entity;
	}
	
	public int delete(String mapper, String id) throws Exception {
		return sqlSessionTemplate.delete(mapper, id);
	}

	public int delete(String str, String[] ids) throws Exception {
		return sqlSessionTemplate.delete(str, ids);
	}
	
	public int delete(String mapper, Map<String, Object> parameter) throws Exception {
		return sqlSessionTemplate.delete(mapper, parameter);
	}
	
	public T find(String str, Map<String,Object> parameter) throws Exception {
		return sqlSessionTemplate.selectOne(str, parameter);
    }
	
	public Object findObj(String str, Map<String,Object> parameter) throws Exception {
		return sqlSessionTemplate.selectOne(str, parameter);
    }
	
	public Long count(String str, Map<String,Object> parameter) throws Exception {
		Long count = sqlSessionTemplate.selectOne(str, parameter);
		if(count == null){
			return 0L;
		}else{
			return count;
		}
    }
	
	public Double sum(String str, Map<String, Object> parameter) throws Exception{
		Double sum = sqlSessionTemplate.selectOne(str, parameter);
		if(sum == null){
			return 0.0;
		}else{
			return sum;
		}
	}
    
    public List<T> findList(String str, Map<String,Object> parameter) throws Exception {
        return sqlSessionTemplate.selectList(str, parameter);
    }
    
    public List<Object> findObjList(String str, Map<String,Object> parameter) throws Exception {
        return sqlSessionTemplate.selectList(str, parameter);
    }

    public Map<String,Map<String,String>> findMap(String mapper, Map<String,Object> parameter, String mapKey) throws Exception {
        return sqlSessionTemplate.selectMap(mapper, parameter, mapKey);
    }

	public List<String> findRe(String str, List<String> list) throws Exception {
		 return sqlSessionTemplate.selectList(str, list);
	}

}


package com.tao.springboot.entity;

import java.util.List;

public class CreateCodeVo {
	
	private List<CreateItem> createItems;
	private String entityName;
	private String tableName;
	
	public List<CreateItem> getCreateItems() {
		return createItems;
	}
	public void setCreateItems(List<CreateItem> createItems) {
		this.createItems = createItems;
	}
	public String getEntityName() {
		return entityName;
	}
	public void setEntityName(String entityName) {
		this.entityName = entityName;
	}
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

}

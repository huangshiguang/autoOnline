package com.tao.springboot.entity;

/**
 * 调用平台翻译工具实体类
 * @author tao
 *
 */
public class Translation {

	/**
	 * 名称
	 */
	private String name;
	
	/**
	 * 值
	 */
	private Object value;
	
	private Boolean isString;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Object getValue() {
		return value;
	}

	public void setValue(Object value) {
		this.value = value;
	}
	
	
	public Boolean getIsString() {
		return isString;
	}

	public void setIsString(Boolean isString) {
		this.isString = isString;
	}

	public Translation() {
		super();
	}

	public Translation(String name, Object value, Boolean isString) {
		super();
		this.name = name;
		this.value = value;
		this.isString = isString;
	}
	
	
	

	
	
	
	
}

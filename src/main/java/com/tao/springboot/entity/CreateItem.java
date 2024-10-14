package com.tao.springboot.entity;

import com.tao.springboot.utils.StringUtils;

public class CreateItem {

	private String name;// 属性名
	private String type;// 属性类型
	private String columnName;// 数据表名
	private String memo;// 备注
	private boolean isNullable;//是否允许位null

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public boolean getIsNullable() {
		return isNullable;
	}
	public boolean isIsNullable() {
		return isNullable;
	}

	public void setIsNullable(String isNullable) {
		if ("YES".equalsIgnoreCase(isNullable)) {
			this.isNullable = true;
		}else if ("NO".equalsIgnoreCase(isNullable)) {
			this.isNullable = false;
		}
	}

	public String getColumnName() {
		return columnName;
	}

	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}

	public String getMybatisJdbcType() {
		String javaType = getType();
		String temp = "";
		if (javaType.equals("String")) {
			temp = "VARCHAR";
		} else if (javaType.equals("Integer")) {
			temp = "INTEGER";
		} else if (javaType.equals("Long")) {
			temp = "BIGINT";
		} else if (javaType.equals("Double")) {
			temp = "DOUBLE";
		} else if (javaType.equals("Boolean")) {
			temp = "BIT";
		} else if (javaType.equals("Date")) {
			temp = "TIMESTAMP";
		} else if (javaType.equals("BigDecimal")) {
			temp = "DECIMAL";
		} else if (javaType.equals("enum")) {
			temp = "INTEGER";
		} else {
			temp = "VARCHAR";
		}
		return temp;
	}
	
	public String getColumnType() {
		String javaType = getType();
		String temp = "";
		if (javaType.equals("String")) {
			temp = "VARCHAR(100)";
		} else if (javaType.equals("Integer")) {
			temp = "INT(11)";
		} else if (javaType.equals("Long")) {
			temp = "BIGINT(20)";
		} else if (javaType.equals("Double")) {
			temp = "DOUBLE";
		} else if (javaType.equals("Boolean")) {
			temp = "BIT(1)";
		} else if (javaType.equals("Date")) {
			temp = "DATETIME";
		} else if (javaType.equals("BigDecimal")) {
			temp = "DECIMAL(10,0)";
		} else if (javaType.equals("enum")) {
			temp = "INT(11)";
		} else {
			temp = "VARCHAR(100)";
		}
		return temp;
	}
	
	public String getJavaType() {
		String type = getType();
		String temp = "";
		if (type.equalsIgnoreCase("VARCHAR")) {
			temp = "String";
		} else if (type.equalsIgnoreCase("INTEGER") || type.equalsIgnoreCase("INT")) {
			temp = "Integer";
		} else if (type.equalsIgnoreCase("BIGINT")) {
			temp = "Long";
		} else if (type.equalsIgnoreCase("DOUBLE")) {
			temp = "Double";
		} else if (type.equalsIgnoreCase("BIT")) {
			temp = "Boolean";
		} else if (type.equalsIgnoreCase("DATETIME")) {
			temp = "Date";
		} else if (type.equalsIgnoreCase("DECIMAL")) {
			temp = "BigDecimal";
		} else {
			temp = "String";
		}
		return temp;
	}
	
	public String getJavaName() {
		String name = getColumnName();
		if(name==null || name.isEmpty()) {
			return "";
		}
		return StringUtils.camelName(name);
	}
	
}

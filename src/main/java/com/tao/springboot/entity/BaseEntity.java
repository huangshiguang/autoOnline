package com.tao.springboot.entity;

import java.io.Serializable;
import java.util.Date;

public abstract class BaseEntity implements Serializable {

	protected static final long serialVersionUID = 1L;

	protected static GlobalId globalId = new GlobalId(0L, 0L);
	
	/** ID */
	protected String id;

	/** 创建日期 */
	protected Date createDate;

	/** 修改日期 */
	protected Date modifyDate;

	/** 排序索引 */
	protected Long orders;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public Long getOrders() {
		return orders;
	}

	public void setOrders(Long orders) {
		this.orders = orders;
	}
}

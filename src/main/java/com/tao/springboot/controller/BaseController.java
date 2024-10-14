package com.tao.springboot.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.tao.springboot.Message;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

/**
 * 基类
 */
public class BaseController {

	protected Logger logger = LogManager.getLogger(this.getClass());

	protected static final int RESULT_CODE_SUCCESS = 200;

	protected static final int RESULT_CODE_WARN = 300;

	protected static final int RESULT_CODE = 100;

	protected static final int RESULT_CODE_ERROR = 400;

	protected static final String RESULT_MSG_SUCCESS = "操作成功";

	protected static final String RESULT_MSG_ERROR = "操作失败";
	
	/** 错误视图 */
	protected static final String ERROR_VIEW = "/admin/common/error";

	/** 错误消息 */
	protected static final Message ERROR_MESSAGE = Message.error("操作错误");

	/** 成功消息 */
	protected static final Message SUCCESS_MESSAGE = Message.success("操作成功");
	
	/**
	 * 数据绑定
	 * @param binder
	 */
	@InitBinder  
	protected  void initBinder(WebDataBinder binder) {  
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");  
	    binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));  
	}  
	
	protected Object errorMsg(String msg){
		if(msg == null || msg.isEmpty()){
			return null;
		}
		Map<String,String> map = new HashMap<String,String>();
		map.put("resultCode", "400");
		map.put("resultMsg", msg);
		return map;
	}


	protected Object successMsg(String msg){
		if(msg == null || msg.isEmpty()){
			return null;
		}
		Map<String,String> map = new HashMap<String,String>();
		map.put("resultCode", "200");
		map.put("resultMsg", msg);
		return map;
	}
	
}
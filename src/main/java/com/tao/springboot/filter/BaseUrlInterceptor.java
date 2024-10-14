package com.tao.springboot.filter;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BaseUrlInterceptor extends HandlerInterceptorAdapter {

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) throws Exception {
		String path = request.getContextPath();
		String scheme = request.getScheme();
		String serverName = request.getServerName();
		int port = request.getServerPort();
		if (port == 80) {
			String basePath = scheme + "://" + serverName + path;
			request.setAttribute("base", basePath);
		} else {
			String basePath = scheme + "://" + serverName + ":" + port + path;
			request.setAttribute("base", basePath);
		}
	}

}

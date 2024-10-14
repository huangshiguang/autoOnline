package com.tao.springboot.configuration;

import com.tao.springboot.filter.BaseUrlInterceptor;
import com.tao.springboot.interceptor.ExecuteTimeInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class InterceptorConfig extends WebMvcConfigurerAdapter {

	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new BaseUrlInterceptor()).addPathPatterns("/**").addPathPatterns("/**");
		registry.addInterceptor(new ExecuteTimeInterceptor()).addPathPatterns("/wechat/**");
	}

}

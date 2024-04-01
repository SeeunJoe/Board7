package com.board.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.board.interceptor.LoginCheckInterceptor;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer{
	
	/* 폴더 위치 중요 : WebMvcConfig.java
	   main()함수가 있는 클래스(Board6Application.java)의 패키지(com.board)가 저장된 곳 
	   아래에 .config를 생성해서 저장 -> com.board.config
	   
	  com.config용도
	    
	   각종 설정정보를 저장하는 곳
	*/
	@Autowired //LoginCheckInterceptor class @Component
	   private  LoginCheckInterceptor   loginCheckInterceptor;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		WebMvcConfigurer.super.addInterceptors(registry);
		
		System.out.println("okokok");
		registry.addInterceptor( loginCheckInterceptor )
                .addPathPatterns("/**")      // http://localhost:9090/
                .addPathPatterns("/**/*")    
                .excludePathPatterns("/log*","/css/**", "/img/**", "/js/**");
	}

    
}

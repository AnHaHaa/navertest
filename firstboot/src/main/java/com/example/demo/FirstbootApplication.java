package com.example.demo;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import upload.MyPathConfig;

@SpringBootApplication
@ComponentScan /* (basePackages = "com.example.demo") */ //없으면 현재 패키지 의미.
@ComponentScan(basePackageClasses = MyPathConfig.class)
@ComponentScan(basePackages = "errors")
@ComponentScan(basePackages = "board.spring.mybatis")
@MapperScan(basePackages = "board.spring.mybatis")
public class FirstbootApplication {

	//1. 스프링부트 메인클래스 @패키지 스캔까지 포함하여 서버 시작. Tomcat 자동내장
	//2. jsp파일 경로/확장자 비포함 - 수동 추가 설정 필요
	//3. xml 최소화 / application.properties 파일 설정필요 - 서버포트, jsp확장자/경로 설정 
	public static void main(String[] args) {
		SpringApplication.run(FirstbootApplication.class, args);
		System.out.println("서버시작중");
	}
	
}

/*
 4. ajax 라이브러리 - 추가할 필요 X 
 	jquary 라이브러리 - 추가 필요 src/main/resources/static/...
 								  url = http://localhost:8063/js/jquary...(src~static까지 기본)
 
 5. file upload 라이브러리 - 추가할 필요 X 
 	jquary 라이브러리 - 추가 필요 src/main/resources
 
 
 
 */

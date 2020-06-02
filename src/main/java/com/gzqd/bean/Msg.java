package com.gzqd.bean;

import java.util.HashMap;
import java.util.Map;

/**
 * 统一返回类
 * @author lwm
 * @date  2020年5月28日
 */
public class Msg {
	
	//code=100 成功、200失败
	private int code;
	//返回信息
	private String mes;
	//其他参数
	private Map<String, Object> data = new HashMap<String, Object>();
	
	public static Msg success() {
		
		Msg msg = new Msg();
		msg.setCode(100);
		msg.setMes("处理成功。");
		return msg;
	}
	
	public static Msg fail() {
		
		Msg msg = new Msg();
		msg.setCode(200);
		msg.setMes("处理失败！");
		return msg;
	}
	
	public Msg add(String key,Object value) {
		
		this.getData().put(key, value);
		return this;
	}
	
	
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMes() {
		return mes;
	}
	public void setMes(String mes) {
		this.mes = mes;
	}

	public Map<String, Object> getData() {
		return data;
	}

	public void setData(Map<String, Object> data) {
		this.data = data;
	}
 
	
	
}

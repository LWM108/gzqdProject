package com.gzqd.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping; 
import org.springframework.web.bind.annotation.ResponseBody;
 
import com.gzqd.bean.Department; 
import com.gzqd.bean.Msg;
import com.gzqd.service.DepartmentService;

/**
 * 处理和部门有关的请求
 * @author lwm
 * @date  2020年5月29日
 */
@RequestMapping("department")
@Controller
public class DepartmentController {
	
	@Autowired
	DepartmentService departmentService;
	
	 /**
	  * 查询所有部门信息
	  * @return
	  */
	 @RequestMapping("list")
	 @ResponseBody
	 public Msg list( ) {
		 
		System.out.println("进入到list界面。");
 
		//数据库查询出的原始数据
		 List<Department> departmentsList = departmentService.getEmployees();
		 
		 return Msg.success().add("departmentsList", departmentsList);
	}
	 
}

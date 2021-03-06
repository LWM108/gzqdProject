package com.gzqd.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gzqd.bean.Employee;
import com.gzqd.bean.Msg;
import com.gzqd.service.EmployeeService;
 

/**
 * RESULT风格   /emp/{id}（ get查询、 post保存、put修改、delete删除）
 * 
 * 员工信息controller,处理相关curd操作
 * @author lwm
 * @date  2020年5月28日
 */
@RequestMapping("employee")
@Controller  
public class EmployeeController {
	
	@Autowired 
	EmployeeService employeeService;
	
	 /** 
	  * 单个批量二合一，删除
	  * 单个删除：1
	  * 批量删除1-2-3 
	  * 根据id，删除员工信息
	  * @param id 员工id
	  * @return
	  */ 
	 @RequestMapping( value = "deleteEmpById/{id}",method = RequestMethod.DELETE)
	 @ResponseBody
	 public Msg deleteEmpById( @PathVariable("id") String ids ) {
		 
		  System.out.println("deleteEmpById："+ids);
		//批量删除 
		if (ids.contains("-")) {
			
			List<Integer> idList = new ArrayList<Integer>();
			String[] str_ids = ids.split("-");
			for (String id : str_ids) { 
				idList.add(Integer.parseInt(id));
			}
			  
			employeeService.deleteEmpBatch(idList);
			
		}else {
			//单个删除
			int id = Integer.parseInt(ids);
			employeeService.deleteEmpById(id); 
		}
		 
		 return Msg.success(); 
	}
	
	/** 
	  * 根据id，更新员工信息
	  * @param id 员工id
	  * @return
	  */ 
	 @RequestMapping( value = "updateEmployee/{empId}",method = RequestMethod.PUT)
	 @ResponseBody
	 public Msg updateEmployee( Employee employee ) {
		   
		 System.out.println("employee:"+employee.toString());
		 employeeService.updateEmployee(employee);
		 
		 return Msg.success(); 
	}
	
	/** 
	  * 根据id，查询员工信息
	  * @param id 员工id
	  * @return
	  */ 
	 @RequestMapping( value = "getEmployee/{id}",method = RequestMethod.GET)
	 @ResponseBody
	 public Msg getEmployee( @PathVariable("id")Integer id ) {
		   
		 Employee employee = employeeService.getEmployee(id);
	 
		 return Msg.success().add("emp", employee); 
	}
	
	
	 /**
	  * 检查员工姓名是否已经存在
	  * @return
	  */
	 @RequestMapping( value = "checkEmpName",method = RequestMethod.POST)
	 @ResponseBody
	 public Msg checkEmpName(@RequestParam("empName")String empName ) {
		
		 System.out.println(empName);
		 
		 //先判断用户名称是否符合正则表达式
		String regx = "(^[a-z0-9_-]{3,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
		
		System.out.println(empName.matches(regx));
		if ( !empName.matches(regx)) {
			return Msg.fail().add("va_msg", "用户名可必须为中文2-5位，或者3-16英文和数字组合。"); 
		}
		 
		boolean flag = employeeService.checkEmpName(empName);
		if (flag) {
			 return Msg.success(); 
		}else {
			 return Msg.fail().add("va_msg", "用户名不可用。");  
		}    
	}
	
	 /**
	  * 内置员工类的正则校验@Valid ，验证结果返回BindingResult result
	  * 查询员工信息（分页查询）
	  * @return
	  */
	 @RequestMapping( value = "saveEmployee",method = RequestMethod.POST)
	 @ResponseBody
	 public Msg saveEmployee( @Valid Employee employee ,BindingResult result) {
		  System.out.println("邮箱校验："+result.hasErrors());
		 if (result.hasErrors()) {
			 //校验失败的话，返回错误的信息
			 HashMap<String, Object> map = new HashMap<String,Object>();
			 List<FieldError> fieldErrors = result.getFieldErrors();
			 for (FieldError fieldError : fieldErrors) {
				 //字段名：fieldError.getField()  错误信息：fieldError.getDefaultMessage()
				 map.put(fieldError.getField(), fieldError.getDefaultMessage());
			} 
			 return Msg.fail().add("errorFi", map);
			 
		}else {
			 employeeService.saveEmployee(employee); 
			 return Msg.success();
		}

	}
	
	 /**
	  * 查询员工信息（分页查询）
	  * @return
	  */
	 @RequestMapping("list")
	 @ResponseBody
	 public Msg list(@RequestParam(value = "pn",defaultValue = "1")Integer pn  ) {
		 
		System.out.println("进入到list界面。");
		//这不是一个分页查询
		//引入pageHelper分页插件
		PageHelper.startPage(pn, 10);//起始页码，每页显示多少条数据 
		//数据库查询出的原始数据
		List<Employee> employeesList = employeeService.getAll();
		
		//用PageInfo对结果进行包装,以及连续显示的 页数(5)
		PageInfo page = new PageInfo(employeesList,5);
		   
		 return Msg.success().add("pageInfo", page);
	}
	
	 /**
	  * 旧的_不用
	  * 查询员工信息（分页查询）
	  * @return
	  */
//	 @RequestMapping("list")
//	 public String list(@RequestParam(value = "pn",defaultValue = "1")Integer pn , Model model) {
//		 
//		System.out.println("进入到list界面。");
//		//这不是一个分页查询
//		//引入pageHelper分页插件
//		PageHelper.startPage(pn, 10);//起始页码，每页显示多少条数据 
//		//数据库查询出的原始数据
//		List<Employee> employeesList = employeeService.getAll();
//		
//		//用PageInfo对结果进行包装,以及连续显示的 页数(5)
//		PageInfo page = new PageInfo(employeesList,5);
//		 
//		model.addAttribute("pageInfo", page);
//		
//		 return "list";
//	}
 
	 
}

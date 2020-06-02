package com.gzqd.controller;

import java.util.HashMap;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
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
 * index
 * @author lwm
 * @date  2020年5月28日
 */
//@RequestMapping("")
@Controller  
public class IdnexController {
	
	@Autowired 
	EmployeeService employeeService;
	
	 /**
	  *  
	  * @return
	  */
	 @RequestMapping("index")
	 public String index(@RequestParam(value = "pn",defaultValue = "1")Integer pn , Model model) {
		 
		System.out.println("进入到index界面。");
		//这不是一个分页查询
		//引入pageHelper分页插件
//		PageHelper.startPage(pn, 10);//起始页码，每页显示多少条数据 
		//数据库查询出的原始数据
//		List<Employee> employeesList = employeeService.getAll();
		
		//用PageInfo对结果进行包装,以及连续显示的 页数(5)
//		PageInfo page = new PageInfo(employeesList,5);
		 
//		model.addAttribute("pageInfo", page);
		
		 return "/console/console1";
	}
	 /**
	  *  
	  * @return
	  */
	 @RequestMapping("systemPerson")
	 public String systemPerson(@RequestParam(value = "pn",defaultValue = "1")Integer pn , Model model) {
		 
		System.out.println("进入到index界面。");
  
		 return "/system/person";
	}
	 
	
//	 /**
//	  * 检查员工姓名是否已经存在
//	  * @return
//	  */
//	 @RequestMapping( value = "checkEmpName",method = RequestMethod.POST)
//	 @ResponseBody
//	 public Msg checkEmpName(@RequestParam("empName")String empName ) {
//		
//		 //先判断用户名称是否符合正则表达式
//		String regx = "(^[a-z0-9_-]{3,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
//		if (empName.matches(regx)) {
//			return Msg.fail().add("va_msg", "用户名可必须为中文2-5位，或者3-16英文和数字组合。"); 
//		}
//		 
//		boolean flag = employeeService.checkEmpName(empName);
//		if (flag) {
//			 return Msg.success(); 
//		}else {
//			 return Msg.fail().add("va_msg", "用户名不可用。");  
//		}    
//	}
//	
//	 /**
//	  * 内置员工类的正则校验@Valid ，验证结果返回BindingResult result
//	  * 查询员工信息（分页查询）
//	  * @return
//	  */
//	 @RequestMapping( value = "saveEmployee",method = RequestMethod.POST)
//	 @ResponseBody
//	 public Msg saveEmployee( @Valid Employee employee ,BindingResult result) {
//		  
//		 if (result.hasErrors()) {
//			 //校验失败的话，返回错误的信息
//			 HashMap<String, Object> map = new HashMap<String,Object>();
//			 List<FieldError> fieldErrors = result.getFieldErrors();
//			 for (FieldError fieldError : fieldErrors) {
//				 //字段名：fieldError.getField()  错误信息：fieldError.getDefaultMessage()
//				 map.put(fieldError.getField(), fieldError.getDefaultMessage());
//			} 
//			 return Msg.fail().add("errorFi", map);
//			 
//		}else {
//			 employeeService.saveEmployee(employee); 
//			 return Msg.success();
//		}
//
//	}
//	
//	 /**
//	  * 查询员工信息（分页查询）
//	  * @return
//	  */
//	 @RequestMapping("list")
//	 @ResponseBody
//	 public Msg list(@RequestParam(value = "pn",defaultValue = "1")Integer pn  ) {
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
//		 return Msg.success().add("pageInfo", page);
//	}
	
//	 /**
//	  * 旧的_不用
//	  * 查询员工信息（分页查询）
//	  * @return
//	  */
////	 @RequestMapping("list")
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

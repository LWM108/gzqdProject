package com.gzqd.test;

import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gzqd.bean.Department;
import com.gzqd.bean.Employee;
import com.gzqd.dao.DepartmentMapper;
import com.gzqd.dao.EmployeeMapper;

/**
 * Mapper类的测试，测试dao层数据
 * @author lwm
 * @date  2020年5月28日
 * 
 * spring项目就直接使用springTest的单元测试组件 来进行模拟测试，可以自动注入我们需要的组件
 * 1、导入springTest模块     
 * 2、@ContextConfiguration中指定对应spring配置文件内容
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {
	
	@Autowired
	DepartmentMapper departmentMapper;
	@Autowired
	EmployeeMapper employeeMapper;
	@Autowired
	SqlSession sqlSession;
	
	@Test
	public void testCURD() {
		
		/**
		 * 原生自带的加载spring ioc容器方法
		 */
//		//1、创建spring ioc容器
//		ClassPathXmlApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
//		//2、从容器中取出mapper信息
//		DepartmentMapper bean = ioc.getBean(DepartmentMapper.class);
		
		
		System.out.println(departmentMapper);
		//1、插入部门信息
//		departmentMapper.insertSelective(new Department(null,"开发部"));
//		departmentMapper.insertSelective(new Department(null,"测试部"));
		
//		2、插入一条员工信息
//		employeeMapper.insertSelective(new Employee(null, "张三","M", "zhansan@qq.com", 1));
		
//		3、批量添加 员工测试数据
//		for (int i = 0; i <1000; i++) { //批量添加不建议，时间过于长； 建议用数据库批量操作
//			employeeMapper.insertSelective(new Employee(null, "张三","M", "zhansan@qq.com", 1));
//		}
//		3、1 数据库sqlsession 进行批量操作
		EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
		for (int i = 0; i < 30; i++) {
			
			String uuid = UUID.randomUUID().toString().substring(0, 5) + i;
			mapper.insertSelective(new Employee(null, uuid,"M", uuid+"@qq.com", 1));
		}
		
		System.out.println("junit  testCURD    运行完成。");
		
	}

}

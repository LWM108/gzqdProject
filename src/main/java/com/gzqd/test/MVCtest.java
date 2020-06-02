package com.gzqd.test;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.github.pagehelper.PageInfo;
import com.gzqd.bean.Employee;

/**
 * controller层的数据测试
 * 使用spring单元测试请求功能，来测试curd的完整性
 * 
 * @author lwm
 * @date  2020年5月28日
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:applicationContext.xml","file:src/main/webapp/WEB-INF/dispatcherServlet-servlet.xml"})
public class MVCtest {
	
	//传入springmvc的ioc
	@Autowired
	WebApplicationContext context;
	
	//虚拟mvc的网络请求,获取结果
	MockMvc mockMvc;
	
	/**
	 * 在每次加载前都运行
	 */
	@Before
	public void initMockMvc() {
		
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
		
	}
	
	@Test
	public void testPage() throws Exception {
		
		//模拟请求并拿到返回值
		MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/list").param("pn", "2")).andReturn();
		//请求成功后，请求域中会有pageInfo,我们这边可以去除pageInfo进行验证
		MockHttpServletRequest request = result.getRequest();
		PageInfo pgInfo = (PageInfo)request.getAttribute("pageInfo");
		
		System.out.println("当前页码："+pgInfo.getPageNum());
		System.out.println("总页码："+pgInfo.getPages());
		System.out.println("总记录数："+pgInfo.getTotal());
		System.out.println("在页面连续显示的页码：");
		
		int[] num = pgInfo.getNavigatepageNums();
		for (int i : num) {
			System.out.println(" "+i);
		}
		
		
		//显示员工信息
		List<Employee> list = pgInfo.getList();
		for (Employee employee : list) {
			System.out.println("员工id：:"+employee.getEmpId() +" -》 姓名："+ employee.getEmpName());
		}
		
	}
	
}

package com.gzqd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gzqd.bean.Employee;
import com.gzqd.bean.EmployeeExample;
import com.gzqd.bean.EmployeeExample.Criteria;
import com.gzqd.dao.EmployeeMapper;

/**
 * service 查询员工的逻辑方法
 * @author lwm
 * @date  2020年5月28日
 */ 
@Service
public class EmployeeService {
	
	@Autowired
	EmployeeMapper employeeMapper;
	
	/**
	 * 查询所有员工信息
	 * @return
	 */
	public List<Employee> getAll() {
		
		return employeeMapper.selectByExampleWithDept(null);
	}
 
	/**
	 * 保存员工信息
	 * @param employee
	 */
	public void saveEmployee(Employee employee) {
		 
		employeeMapper.insertSelective(employee); 
	}
	
	/**
	 * 检查是否有重复的员工 姓名
	 * @param empName
	 * @return true:代表当前姓名可用，false：不可用
	 */
	public boolean checkEmpName(String empName) {
		// TODO Auto-generated method stub
		EmployeeExample example = new EmployeeExample();
		Criteria criteria = example.createCriteria();
		criteria.andEmpNameEqualTo(empName);
		
		long count = employeeMapper.countByExample(example);
		
		return count == 0;
	}
	
	/**
	 * 查询员工信息
	 * @param id
	 * @return
	 */
	public Employee getEmployee(Integer id) {
		// TODO Auto-generated method stub
		Employee employee = employeeMapper.selectByPrimaryKey(id);
		return employee;
	}
	
	/**
	 * 更新员工信息
	 * @param employee
	 * @return
	 */
	public void updateEmployee(Employee employee) {
		// TODO Auto-generated method stub
		employeeMapper.updateByPrimaryKeySelective(employee);
	 
	}
	
	/**
	 * 根据id，进行数据删除
	 * @param id
	 */
	public void deleteEmpById(Integer id) {
		// TODO Auto-generated method stub
		employeeMapper.deleteByPrimaryKey(id);
	}

	/**
	 * 根据id，批量删除员工信息
	 * @param idList
	 */
	public void deleteEmpBatch(List<Integer> idList) {
		// TODO Auto-generated method stub
		EmployeeExample example = new EmployeeExample();
		Criteria criteria = example.createCriteria();
		//delete from  xxx where emp_id in (1,2,3)
		criteria.andEmpIdIn(idList);
		
		employeeMapper.deleteByExample(example);
		
	}
	
	
}

package com.gzqd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gzqd.bean.Department;
import com.gzqd.dao.DepartmentMapper; 

@Service
public class DepartmentService {
	
	@Autowired
	DepartmentMapper departmentMapper;
	
	/**
	 * 查询所有部门信息
	 * @return
	 */
	public List<Department> getEmployees() {
		
		List<Department> list = departmentMapper.selectByExample(null);
		
		return list;
	}

}

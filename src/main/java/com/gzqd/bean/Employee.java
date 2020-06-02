package com.gzqd.bean;

import java.io.Serializable;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;

/**
 * 员工表
 * @author lwm
 * @date  2020年5月28日
 */
public class Employee implements Serializable {
    private Integer empId;
    //姓名
    @Pattern(regexp = "(^[a-z0-9_-]{3,16}$)|(^[\u2E80-\u9FFF]{2,5})",
    		message = "用户名可必须为中文2-5位，或者3-16英文和数字组合。")
    private String empName;
    //性别 男M  女F
    private String gender;
    //邮箱
//    @Email
    @Pattern(regexp = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$",
    		message = "邮箱格式不正确。")
    private String email;
    //关联部门id
    private Integer dId;
    
    //关联部门类
    private Department department;

    private static final long serialVersionUID = 1L;
    
     
    public Employee() {
		super();
	}

	public Employee(Integer empId, String empName, String gender, String email, Integer dId) {
		super();
		this.empId = empId;
		this.empName = empName;
		this.gender = gender;
		this.email = email;
		this.dId = dId;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName == null ? null : empName.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Integer getdId() {
        return dId;
    }

    public void setdId(Integer dId) {
        this.dId = dId;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", empId=").append(empId);
        sb.append(", empName=").append(empName);
        sb.append(", gender=").append(gender);
        sb.append(", email=").append(email);
        sb.append(", dId=").append(dId);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}
package com.gzqd.bean;

import java.io.Serializable;

/**
 * 部门表
 * @author lwm
 * @date  2020年5月28日
 */
public class Department implements Serializable {
    private Integer depId;

    private String depName;

    private static final long serialVersionUID = 1L;
    
    

    public Department(Integer depId, String depName) {
		super();
		this.depId = depId;
		this.depName = depName;
	}
    

	public Department() {
		super();
	}


	public Integer getDepId() {
        return depId;
    }

    public void setDepId(Integer depId) {
        this.depId = depId;
    }

    public String getDepName() {
        return depName;
    }

    public void setDepName(String depName) {
        this.depName = depName == null ? null : depName.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", depId=").append(depId);
        sb.append(", depName=").append(depName);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}
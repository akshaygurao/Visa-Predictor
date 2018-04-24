package com.bigdata.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.Pattern;

@Entity
public class Eligibility {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	
	@Pattern(regexp="[a-zA-Z0-9 ]*$",message="Please enter alphanumeric characters only")
	private String state;
	
	@Pattern(regexp="[a-zA-Z0-9 ]*$",message="Please enter alphanumeric characters only")
	private String fulltime;
	
	@Pattern(regexp="[0-9]*$",message="Please enter alphanumeric characters only")
	private float salary;
	
	@Pattern(regexp="[a-zA-Z0-9 ]*$",message="Please enter alphanumeric characters only")
	private String workField;
	
	private String status;

	public String getFulltime() {
		return fulltime;
	}

	public void setFulltime(String fulltime) {
		this.fulltime = fulltime;
	}

	public float getSalary() {
		return salary;
	}

	public void setSalary(float salary) {
		this.salary = salary;
	}

	public String getWorkField() {
		return workField;
	}

	public void setWorkField(String workField) {
		this.workField = workField;
	}


	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
	
}

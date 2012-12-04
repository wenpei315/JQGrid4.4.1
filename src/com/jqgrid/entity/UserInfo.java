package com.jqgrid.entity;

import java.util.Date;

public class UserInfo implements java.io.Serializable {
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 1L;

	private String id;
	private String name;
	private String sex;
	private Integer age;
	private Date birthday;

	public UserInfo() {
	}

	public UserInfo(String name, String sex, Integer age, Date birthday) {
		this.name = name;
		this.sex = sex;
		this.age = age;
		this.birthday = birthday;
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Integer getAge() {
		return this.age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public Date getBirthday() {
		return this.birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
}
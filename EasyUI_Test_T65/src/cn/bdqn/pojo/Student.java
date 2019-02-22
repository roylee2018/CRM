package cn.bdqn.pojo;

import java.io.Serializable;
/**
 * 学生类
 * @author Administrator
 */
public class Student implements Serializable {

	private Integer sid;  //学号
	private String sname; //学生姓名
	//多个学生对应同一班级  多对一  一个班级对象
	private ClassInfo classInfo;
	
	public Integer getSid() {
		return sid;
	}
	public void setSid(Integer sid) {
		this.sid = sid;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public ClassInfo getClassInfo() {
		return classInfo;
	}
	public void setClassInfo(ClassInfo classInfo) {
		this.classInfo = classInfo;
	}
}

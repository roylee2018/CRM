package cn.bdqn.pojo;

import java.io.Serializable;
/**
 * ѧ����
 * @author Administrator
 */
public class Student implements Serializable {

	private Integer sid;  //ѧ��
	private String sname; //ѧ������
	//���ѧ����Ӧͬһ�༶  ���һ  һ���༶����
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

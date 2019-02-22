package cn.bdqn.pojo;

import java.io.Serializable;
/**
 * 班级类 对应t_class表
 * @author Administrator
 */
public class ClassInfo implements Serializable  {

	private Integer cid;  //班级编号
	
	private String cname; //班级名称
	
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
}

package cn.bdqn.action;

import net.sf.json.JSONObject;
import cn.bdqn.pojo.Student;
import cn.bdqn.service.StudentService;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class StudentAction extends ActionSupport 
					 implements ModelDriven<Student> {
	
	//声明Student对象 增删改通用
	Student stu = new Student();
	//增删改通用的结果变量   默认失败
	private String result = "error";
	
	//接收easyui的分页参数
	private Integer page; //当前页码
	private Integer rows; //页面大小
	
	private JSONObject obj;  //用于保存返回的json数据

	private StudentService studentService;
	
	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public JSONObject getObj() {
		return obj;
	}

	public void setObj(JSONObject obj) {
		this.obj = obj;
	}
	
	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	public StudentService getStudentService() {
		return studentService;
	}

	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}
	
	//查询
	public String show(){
		obj = studentService.findDataForJson(page,rows);
		return "success";
	}
	
	//删除
	public String remove(){
		int count = studentService.delStuById(stu.getSid());
		if(count > 0){
			result = "suc";  //表示成功
		}
		return "success";
	}

	//增加
	public String insert(){
		int count = studentService.addStudent(stu);
		if(count > 0){
			result = "suc";  //表示成功
		}
		return "success";
	}
	
	//修改
	public String modify(){
		int count = studentService.modStudent(stu);
		if(count > 0){
			result = "suc";  //表示成功
		}
		return "success";
	}
	
	
	
	
	@Override
	public Student getModel() {
		return stu;
	}
}

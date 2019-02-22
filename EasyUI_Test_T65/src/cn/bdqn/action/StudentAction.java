package cn.bdqn.action;

import net.sf.json.JSONObject;
import cn.bdqn.pojo.Student;
import cn.bdqn.service.StudentService;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class StudentAction extends ActionSupport 
					 implements ModelDriven<Student> {
	
	//����Student���� ��ɾ��ͨ��
	Student stu = new Student();
	//��ɾ��ͨ�õĽ������   Ĭ��ʧ��
	private String result = "error";
	
	//����easyui�ķ�ҳ����
	private Integer page; //��ǰҳ��
	private Integer rows; //ҳ���С
	
	private JSONObject obj;  //���ڱ��淵�ص�json����

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
	
	//��ѯ
	public String show(){
		obj = studentService.findDataForJson(page,rows);
		return "success";
	}
	
	//ɾ��
	public String remove(){
		int count = studentService.delStuById(stu.getSid());
		if(count > 0){
			result = "suc";  //��ʾ�ɹ�
		}
		return "success";
	}

	//����
	public String insert(){
		int count = studentService.addStudent(stu);
		if(count > 0){
			result = "suc";  //��ʾ�ɹ�
		}
		return "success";
	}
	
	//�޸�
	public String modify(){
		int count = studentService.modStudent(stu);
		if(count > 0){
			result = "suc";  //��ʾ�ɹ�
		}
		return "success";
	}
	
	
	
	
	@Override
	public Student getModel() {
		return stu;
	}
}

package cn.bdqn.service;

import cn.bdqn.pojo.Student;
import net.sf.json.JSONObject;

public interface StudentService {

	//在service层将数据保存到jsonObject对象中
	public JSONObject findDataForJson(int pageIndex, int pageSize);
	
	public int findCount();
	//删除
	public int delStuById(int sid);

	//增加
	public int addStudent(Student stu);
	
	//修改
	public int modStudent(Student stu);
}

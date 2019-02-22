package cn.bdqn.service.impl;

import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import cn.bdqn.dao.StudentDao;
import cn.bdqn.pojo.Student;
import cn.bdqn.service.StudentService;

public class StudentServiceImpl implements StudentService {
	
	//引用StudentDao
	private StudentDao studentDao;

	public void setStudentDao(StudentDao studentDao) {
		this.studentDao = studentDao;
	}

	@Override
	public JSONObject findDataForJson(int pageIndex,int pageSize) {
		//创建JSONObject对象
		JSONObject obj = new JSONObject();
		//调用查询方法
		List<Student> list = studentDao.findList((pageIndex-1)*pageSize,pageSize);
		//将集合转换成json数组 保证必须有两个key 分别为total 和 rows
		obj.put("total", findCount());
		//借助JSONArray将集合转为数组
		obj.put("rows", JSONArray.fromObject(list).toString());
		
		return obj;
	}

	@Override
	public int findCount() {
		return studentDao.getTotal();
	}

	@Override
	public int delStuById(int sid) {
		return studentDao.delById(sid);
	}

	@Override
	public int addStudent(Student stu) {
		return studentDao.addInfo(stu);
	}

	@Override
	public int modStudent(Student stu) {
		return studentDao.modInfo(stu);
	}
}

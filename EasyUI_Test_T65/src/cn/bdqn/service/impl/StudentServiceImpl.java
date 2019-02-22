package cn.bdqn.service.impl;

import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import cn.bdqn.dao.StudentDao;
import cn.bdqn.pojo.Student;
import cn.bdqn.service.StudentService;

public class StudentServiceImpl implements StudentService {
	
	//����StudentDao
	private StudentDao studentDao;

	public void setStudentDao(StudentDao studentDao) {
		this.studentDao = studentDao;
	}

	@Override
	public JSONObject findDataForJson(int pageIndex,int pageSize) {
		//����JSONObject����
		JSONObject obj = new JSONObject();
		//���ò�ѯ����
		List<Student> list = studentDao.findList((pageIndex-1)*pageSize,pageSize);
		//������ת����json���� ��֤����������key �ֱ�Ϊtotal �� rows
		obj.put("total", findCount());
		//����JSONArray������תΪ����
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

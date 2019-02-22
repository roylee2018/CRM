package cn.bdqn.dao;

import java.util.List;
import cn.bdqn.pojo.Student;

public interface StudentDao {
	/**
	 * 查询所有
	 */
	public List<Student> findList(int start, int end);
	
	/**
	 * 查询总数
	 */
	public int getTotal();
	
	/**
	 * 删除
	 */
	public int delById(int sid);
	
	/**
	 * 增加
	 */
	public int addInfo(Student stu);
	
	/**
	 * 修改
	 */
	public int modInfo(Student stu);
	
}

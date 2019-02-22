package cn.bdqn.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

import cn.bdqn.dao.StudentDao;
import cn.bdqn.pojo.Student;

public class StudentDaoImpl implements StudentDao {
	
	private HibernateTemplate ht;

	public void setHt(HibernateTemplate ht) {
		this.ht = ht;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Student> findList(final int start, final int end) {
		//不需要手动关闭session
		return this.ht.executeFind(new HibernateCallback<List<Student>>() {
			@Override
			public List<Student> doInHibernate(Session session)
					throws HibernateException, SQLException {
				String hql = "from Student s left join fetch s.classInfo c";
				//创建Query对象
				Query query = session.createQuery(hql);
				query.setFirstResult(start);
				query.setMaxResults(end);
				return query.list();
			}
		});
		
		//卡顿的问题：缓存导致
		/*String hql = "from Student s left join fetch s.classInfo c";
		Query query = this.ht.getSessionFactory().
						openSession().createQuery(hql);
		query.setFirstResult(start);
		query.setMaxResults(end);
		return query.list();*/
	}

	@Override
	public int getTotal() {
		String hql = "from Student s left join fetch s.classInfo c";
		return ht.find(hql).size();
	}

	@Override
	public int delById(int sid) {
		int rows = 0;
		try {
			ht.delete(ht.get(Student.class, sid));
			rows = 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rows;
	}

	@Override
	public int addInfo(Student stu) {
		int rows = 0;
		try {
			ht.save(stu);
			rows = 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rows;
	}

	@Override
	public int modInfo(Student stu) {
		int rows = 0;
		try {
			ht.update(stu);
			rows = 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rows;
	}
}

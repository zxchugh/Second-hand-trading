package com.dao;

import java.util.List;
import java.util.ArrayList;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import com.entity.Seller;

public class SellerDAO extends HibernateDaoSupport {
	// 调用HibernateDaoSupport中的save方法保存数据
	public void save(Seller seller) {
		try {
			super.getHibernateTemplate().save(seller);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	// 调用update方法更新数据
	public void update(Seller seller) {
		try {
			super.getHibernateTemplate().update(seller);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	// 按照Entity删除数据
	public void delete(Seller seller) {
		try {
			super.getHibernateTemplate().delete(seller);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	// 按主键删除数据
	public void delete(int id) {
		try {
			super.getHibernateTemplate().delete(getHibernateTemplate().get("com.entity.Seller", id));
		} catch (RuntimeException re) {
			throw re;
		}
	}

	// 调用Find方法查询全部数据
	public void delete(String id) {
		try {
			super.getHibernateTemplate().delete(getHibernateTemplate().get("com.entity.Seller", id));
		} catch (RuntimeException re) {
			throw re;
		}
	}

	// 通过条件使用HQL语句精确查询
	@SuppressWarnings("unchecked")
	public List<Seller> show() {
		try {
			return super.getHibernateTemplate().find("From Seller");
		} catch (RuntimeException re) {
			throw re;
		}
	}

	// 通过HQL语句模糊查询数据)
	@SuppressWarnings("unchecked")
	public List<Seller> queryByUsername(String name) {
		List<Seller> list = new ArrayList<Seller>();
		String hql = "From Seller where username = ?";
		Session session = this.getSessionFactory().openSession();
		Query query = session.createQuery(hql);
		query.setString(0, name);
		list = query.list();
		session.close();
		return list;
	}

	// 通过HQL语句模糊查询数据)
	@SuppressWarnings("unchecked")
	public List<Seller> queryByPassword(String name) {
		List<Seller> list = new ArrayList<Seller>();
		String hql = "From Seller where password = ?";
		Session session = this.getSessionFactory().openSession();
		Query query = session.createQuery(hql);
		query.setString(0, name);
		list = query.list();
		session.close();
		return list;
	}

	// 通过HQL语句模糊查询数据)
	@SuppressWarnings("unchecked")
	public List<Seller> queryByRealname(String name) {
		List<Seller> list = new ArrayList<Seller>();
		String hql = "From Seller where realname = ?";
		Session session = this.getSessionFactory().openSession();
		Query query = session.createQuery(hql);
		query.setString(0, name);
		list = query.list();
		session.close();
		return list;
	}

	// 通过HQL语句模糊查询数据)
	@SuppressWarnings("unchecked")
	public List<Seller> queryBySex(String name) {
		List<Seller> list = new ArrayList<Seller>();
		String hql = "From Seller where sex = ?";
		Session session = this.getSessionFactory().openSession();
		Query query = session.createQuery(hql);
		query.setString(0, name);
		list = query.list();
		session.close();
		return list;
	}

	// 通过HQL语句模糊查询数据)
	@SuppressWarnings("unchecked")
	public List<Seller> queryByBirthday(String name) {
		List<Seller> list = new ArrayList<Seller>();
		String hql = "From Seller where birthday = ?";
		Session session = this.getSessionFactory().openSession();
		Query query = session.createQuery(hql);
		query.setString(0, name);
		list = query.list();
		session.close();
		return list;
	}

	// 通过HQL语句模糊查询数据)
	@SuppressWarnings("unchecked")
	public List<Seller> queryByContact(String name) {
		List<Seller> list = new ArrayList<Seller>();
		String hql = "From Seller where contact = ?";
		Session session = this.getSessionFactory().openSession();
		Query query = session.createQuery(hql);
		query.setString(0, name);
		list = query.list();
		session.close();
		return list;
	}

	// 通过HQL语句模糊查询数据)
	@SuppressWarnings("unchecked")
	public List<Seller> queryByQq(String name) {
		List<Seller> list = new ArrayList<Seller>();
		String hql = "From Seller where qq = ?";
		Session session = this.getSessionFactory().openSession();
		Query query = session.createQuery(hql);
		query.setString(0, name);
		list = query.list();
		session.close();
		return list;
	}

	// 通过HQL语句模糊查询数据)
	@SuppressWarnings("unchecked")
	public List<Seller> queryByStatus(String name) {
		List<Seller> list = new ArrayList<Seller>();
		String hql = "From Seller where status = ?";
		Session session = this.getSessionFactory().openSession();
		Query query = session.createQuery(hql);
		query.setString(0, name);
		list = query.list();
		session.close();
		return list;
	}

	// 通过HQL语句模糊查询数据)
	@SuppressWarnings("unchecked")
	public List<Seller> queryByRegdate(String name) {
		List<Seller> list = new ArrayList<Seller>();
		String hql = "From Seller where regdate = ?";
		Session session = this.getSessionFactory().openSession();
		Query query = session.createQuery(hql);
		query.setString(0, name);
		list = query.list();
		session.close();
		return list;
	}

	// 按条件查询数据(模糊查询)
	@SuppressWarnings("unchecked")
	public List<Seller> queryLikeByUsername(String name) {
		List<Seller> list = new ArrayList<Seller>();
		String hql = "From Seller where username like ?";
		Session session = this.getSessionFactory().openSession();
		Query query = session.createQuery(hql);
		query.setString(0, "%" + name + "%");
		list = query.list();
		session.close();
		return list;
	}

	// 按条件查询数据(模糊查询)
	@SuppressWarnings("unchecked")
	public List<Seller> queryLikeByPassword(String name) {
		List<Seller> list = new ArrayList<Seller>();
		String hql = "From Seller where password like ?";
		Session session = this.getSessionFactory().openSession();
		Query query = session.createQuery(hql);
		query.setString(0, "%" + name + "%");
		list = query.list();
		session.close();
		return list;
	}

	// 按条件查询数据(模糊查询)
	@SuppressWarnings("unchecked")
	public List<Seller> queryLikeByRealname(String name) {
		List<Seller> list = new ArrayList<Seller>();
		String hql = "From Seller where realname like ?";
		Session session = this.getSessionFactory().openSession();
		Query query = session.createQuery(hql);
		query.setString(0, "%" + name + "%");
		list = query.list();
		session.close();
		return list;
	}

	// 按条件查询数据(模糊查询)
	@SuppressWarnings("unchecked")
	public List<Seller> queryLikeBySex(String name) {
		List<Seller> list = new ArrayList<Seller>();
		String hql = "From Seller where sex like ?";
		Session session = this.getSessionFactory().openSession();
		Query query = session.createQuery(hql);
		query.setString(0, "%" + name + "%");
		list = query.list();
		session.close();
		return list;
	}

	// 按条件查询数据(模糊查询)
	@SuppressWarnings("unchecked")
	public List<Seller> queryLikeByBirthday(String name) {
		List<Seller> list = new ArrayList<Seller>();
		String hql = "From Seller where birthday like ?";
		Session session = this.getSessionFactory().openSession();
		Query query = session.createQuery(hql);
		query.setString(0, "%" + name + "%");
		list = query.list();
		session.close();
		return list;
	}

	// 按条件查询数据(模糊查询)
	@SuppressWarnings("unchecked")
	public List<Seller> queryLikeByContact(String name) {
		List<Seller> list = new ArrayList<Seller>();
		String hql = "From Seller where contact like ?";
		Session session = this.getSessionFactory().openSession();
		Query query = session.createQuery(hql);
		query.setString(0, "%" + name + "%");
		list = query.list();
		session.close();
		return list;
	}

	// 按条件查询数据(模糊查询)
	@SuppressWarnings("unchecked")
	public List<Seller> queryLikeByQq(String name) {
		List<Seller> list = new ArrayList<Seller>();
		String hql = "From Seller where qq like ?";
		Session session = this.getSessionFactory().openSession();
		Query query = session.createQuery(hql);
		query.setString(0, "%" + name + "%");
		list = query.list();
		session.close();
		return list;
	}

	// 按条件查询数据(模糊查询)
	@SuppressWarnings("unchecked")
	public List<Seller> queryLikeByStatus(String name) {
		List<Seller> list = new ArrayList<Seller>();
		String hql = "From Seller where status like ?";
		Session session = this.getSessionFactory().openSession();
		Query query = session.createQuery(hql);
		query.setString(0, "%" + name + "%");
		list = query.list();
		session.close();
		return list;
	}

	// 按条件查询数据(模糊查询)
	@SuppressWarnings("unchecked")
	public List<Seller> queryLikeByRegdate(String name) {
		List<Seller> list = new ArrayList<Seller>();
		String hql = "From Seller where regdate like ?";
		Session session = this.getSessionFactory().openSession();
		Query query = session.createQuery(hql);
		query.setString(0, "%" + name + "%");
		list = query.list();
		session.close();
		return list;
	}

	// 按主键查询 返回的是Entity的实例
	public Seller queryById(int sellerid) {
		try {
			Seller seller = (Seller) super.getHibernateTemplate().get("com.entity.Seller", sellerid);
			return seller;
		} catch (RuntimeException re) {
			throw re;
		}
	}

	// 按主键查询 返回的是Entity的实例
	public Seller queryById(String sellerid) {
		try {
			Seller seller = (Seller) super.getHibernateTemplate().get("com.entity.Seller", sellerid);
			return seller;
		} catch (RuntimeException re) {
			throw re;
		}
	}

}

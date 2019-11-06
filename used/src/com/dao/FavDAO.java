package com.dao;

import java.util.List;
import java.util.ArrayList;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import com.entity.Fav;

public class FavDAO extends HibernateDaoSupport {
	// 调用HibernateDaoSupport中的save方法保存数据
	public void save(Fav fav) {
		try {
			super.getHibernateTemplate().save(fav);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	// 调用update方法更新数据
	public void update(Fav fav) {
		try {
			super.getHibernateTemplate().update(fav);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	// 按照Entity删除数据
	public void delete(Fav fav) {
		try {
			super.getHibernateTemplate().delete(fav);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	// 按主键删除数据
	public void delete(int id) {
		try {
			super.getHibernateTemplate().delete(getHibernateTemplate().get("com.entity.Fav", id));
		} catch (RuntimeException re) {
			throw re;
		}
	}

	// 调用Find方法查询全部数据
	public void delete(String id) {
		try {
			super.getHibernateTemplate().delete(getHibernateTemplate().get("com.entity.Fav", id));
		} catch (RuntimeException re) {
			throw re;
		}
	}

	// 通过条件使用HQL语句精确查询
	@SuppressWarnings("unchecked")
	public List<Fav> show() {
		try {
			return super.getHibernateTemplate().find("From Fav");
		} catch (RuntimeException re) {
			throw re;
		}
	}

	// 通过HQL语句模糊查询数据)
	@SuppressWarnings("unchecked")
	public List<Fav> queryByUsersid(String name) {
		List<Fav> list = new ArrayList<Fav>();
		String hql = "From Fav where usersid = ?";
		Session session = this.getSessionFactory().openSession();
		Query query = session.createQuery(hql);
		query.setString(0, name);
		list = query.list();
		session.close();
		return list;
	}

	// 通过HQL语句模糊查询数据)
	@SuppressWarnings("unchecked")
	public List<Fav> queryByGoodsid(String name) {
		List<Fav> list = new ArrayList<Fav>();
		String hql = "From Fav where goodsid = ?";
		Session session = this.getSessionFactory().openSession();
		Query query = session.createQuery(hql);
		query.setString(0, name);
		list = query.list();
		session.close();
		return list;
	}

	// 通过HQL语句模糊查询数据)
	@SuppressWarnings("unchecked")
	public List<Fav> queryByAddtime(String name) {
		List<Fav> list = new ArrayList<Fav>();
		String hql = "From Fav where addtime = ?";
		Session session = this.getSessionFactory().openSession();
		Query query = session.createQuery(hql);
		query.setString(0, name);
		list = query.list();
		session.close();
		return list;
	}

	// 按条件查询数据(模糊查询)
	@SuppressWarnings("unchecked")
	public List<Fav> queryLikeByUsersid(String name) {
		List<Fav> list = new ArrayList<Fav>();
		String hql = "From Fav where usersid like ?";
		Session session = this.getSessionFactory().openSession();
		Query query = session.createQuery(hql);
		query.setString(0, "%" + name + "%");
		list = query.list();
		session.close();
		return list;
	}

	// 按条件查询数据(模糊查询)
	@SuppressWarnings("unchecked")
	public List<Fav> queryLikeByGoodsid(String name) {
		List<Fav> list = new ArrayList<Fav>();
		String hql = "From Fav where goodsid like ?";
		Session session = this.getSessionFactory().openSession();
		Query query = session.createQuery(hql);
		query.setString(0, "%" + name + "%");
		list = query.list();
		session.close();
		return list;
	}

	// 按条件查询数据(模糊查询)
	@SuppressWarnings("unchecked")
	public List<Fav> queryLikeByAddtime(String name) {
		List<Fav> list = new ArrayList<Fav>();
		String hql = "From Fav where addtime like ?";
		Session session = this.getSessionFactory().openSession();
		Query query = session.createQuery(hql);
		query.setString(0, "%" + name + "%");
		list = query.list();
		session.close();
		return list;
	}

	// 按主键查询 返回的是Entity的实例
	public Fav queryById(int favid) {
		try {
			Fav fav = (Fav) super.getHibernateTemplate().get("com.entity.Fav", favid);
			return fav;
		} catch (RuntimeException re) {
			throw re;
		}
	}

	// 按主键查询 返回的是Entity的实例
	public Fav queryById(String favid) {
		try {
			Fav fav = (Fav) super.getHibernateTemplate().get("com.entity.Fav", favid);
			return fav;
		} catch (RuntimeException re) {
			throw re;
		}
	}

}

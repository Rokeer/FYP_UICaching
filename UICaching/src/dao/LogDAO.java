package dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import config.HibernateSessionFactory;
import entity.Log;

public class LogDAO {
	private Session session;
	private Transaction transaction;
	private Query query;

	public void addLog(Log log) {
		session = HibernateSessionFactory.getSession();
		try {
			transaction = session.beginTransaction();
			session.save(log);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
	}

	public void editLog(Log log) {
		session = HibernateSessionFactory.getSession();
		try {
			transaction = session.beginTransaction();
			session.update(log);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
	}

	public Log getLog(int logId) {
		session = HibernateSessionFactory.getSession();
		Log log = (Log) session.get(Log.class, logId);
		HibernateSessionFactory.closeSession();
		return log;
	}

	public boolean checkHave(String key, String value) {
		session = HibernateSessionFactory.getSession();
		String hql = "select " + key + " from Log as log where " + key + "='"
				+ value + "'";
		query = session.createQuery(hql);
		try {
			String tmp = (String) query.uniqueResult();
			if (tmp.equals("")) {
				HibernateSessionFactory.closeSession();
				return false;
			} else {
				HibernateSessionFactory.closeSession();
				return true;
			}
		} catch (Exception e) {
			HibernateSessionFactory.closeSession();
			return false;
		}

	}
}

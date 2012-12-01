package dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import config.HibernateSessionFactory;
import entity.UiCachePicture;

public class UiCachePictureDAO {
	private Session session;
	private Transaction transaction;
	private Query query;

	public void addUiCachePicture(UiCachePicture uiCachePicture) {
		session = HibernateSessionFactory.getSession();
		try {
			transaction = session.beginTransaction();
			session.save(uiCachePicture);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
	}

	public void editUiCachePicture(UiCachePicture uiCachePicture) {
		session = HibernateSessionFactory.getSession();
		try {
			transaction = session.beginTransaction();
			session.update(uiCachePicture);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
	}

	public UiCachePicture getUiCachePicture(int uiCachePictureId) {
		session = HibernateSessionFactory.getSession();
		UiCachePicture cachePicture = (UiCachePicture) session.get(UiCachePicture.class, uiCachePictureId);
		HibernateSessionFactory.closeSession();
		return cachePicture;
	}

	public boolean checkHave(String key, String value) {
		session = HibernateSessionFactory.getSession();
		String hql = "select " + key + " from UICachePicture as uicachepicture where " + key + "='"
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

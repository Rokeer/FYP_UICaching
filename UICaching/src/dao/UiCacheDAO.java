package dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import config.ComparatorUICache;
import config.HibernateSessionFactory;
import config.MapMethods;
import entity.Log;
import entity.UiCache;
import entity.User;

public class UiCacheDAO {
	private Session session;
	private Transaction transaction;
	private Query query;

	public void addUiCache(UiCache uiCache) {
		session = HibernateSessionFactory.getSession();
		try {
			transaction = session.beginTransaction();
			session.save(uiCache);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
	}

	public void editUiCache(UiCache uiCache) {
		session = HibernateSessionFactory.getSession();
		try {
			transaction = session.beginTransaction();
			session.update(uiCache);
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
	}

	public UiCache getUiCache(int uiCacheId) {
		session = HibernateSessionFactory.getSession();
		UiCache cache = (UiCache) session.get(UiCache.class, uiCacheId);
		HibernateSessionFactory.closeSession();
		return cache;
	}

	public boolean checkHave(String key, String value) {
		session = HibernateSessionFactory.getSession();
		String hql = "select " + key + " from UiCache as uicache where " + key
				+ "='" + value + "'";
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

	public List searchByCoord(double latitude, double longitude, int radius) {
		session = HibernateSessionFactory.getSession();
		String hql = "from UiCache as uicache";
		// 选择所有cache条目
		query = session.createQuery(hql);
		try {
			List<UiCache> result = new ArrayList<UiCache>();
			Iterator<UiCache> itr = query.iterate();
			// 选择所有距离小于需求的caches
			while (itr.hasNext()) {
				UiCache uiCache = (UiCache) itr.next();
				MapMethods mm = new MapMethods();
				uiCache.setTmpDistance(mm.GetDistance(latitude, longitude,
						uiCache.getLatitude(), uiCache.getLongitude()));
				if (uiCache.getTmpDistance() <= radius) {
					result.add(uiCache);
				}
			}
			// 为结果排序
			ComparatorUICache comparator = new ComparatorUICache();
			Collections.sort(result, comparator);
			HibernateSessionFactory.closeSession();
			return result;
		} catch (Exception e) {
			System.out.println(e.toString());
			HibernateSessionFactory.closeSession();
			return null;
		}
	}

	public List searchByCountry(String country) {
		try {
			session = HibernateSessionFactory.getSession();
			String hql = "from UiCache as uicache where uicache.country = '"
					+ country + "'";
			query = session.createQuery(hql);
			List<UiCache> result = (List<UiCache>) query.list();
			HibernateSessionFactory.closeSession();
			return result;
		} catch (Exception e) {
			HibernateSessionFactory.closeSession();
			return null;
		}
	}

	public List searchByCacheName(String cacheName) {
		try {
			session = HibernateSessionFactory.getSession();
			String hql = "from UiCache as uicache where uicache.cacheName like '%"
					+ cacheName + "%'";
			query = session.createQuery(hql);
			List<UiCache> result = (List<UiCache>) query.list();
			HibernateSessionFactory.closeSession();
			return result;
		} catch (Exception e) {
			HibernateSessionFactory.closeSession();
			return null;
		}
	}

	public UiCache searchByUCCode(String UCCode) {
		try {
			session = HibernateSessionFactory.getSession();
			String hql = "select uiCacheId from UiCache as uicache where ucId = '"
					+ UCCode + "'";
			query = session.createQuery(hql);
			int uiCacheId = Integer.parseInt(query.uniqueResult().toString());
			UiCache result = (UiCache) session.get(UiCache.class, uiCacheId);
			//HibernateSessionFactory.closeSession();
			return result;
		} catch (Exception e) {
			System.out.println(e.toString());
			HibernateSessionFactory.closeSession();
			return null;
		}
	}

	public List searchByReporter(String hiddenBy) {
		try {
			session = HibernateSessionFactory.getSession();
			String hql = "from UiCache as uicache where uicache.placedBy = '"
					+ hiddenBy + "'";
			query = session.createQuery(hql);
			List<UiCache> result = (List<UiCache>) query.list();
			HibernateSessionFactory.closeSession();
			return result;
		} catch (Exception e) {
			HibernateSessionFactory.closeSession();
			return null;
		}
	}

	public List searchByFounder(String foundBy) {
		try {
			session = HibernateSessionFactory.getSession();
			String hql = "select uiCache_uiCacheId from log as log where log.type = 1";
			query = session.createQuery(hql);
			List<UiCache> result = new ArrayList<UiCache>();
			Iterator<Log> itr = query.iterate();
			while (itr.hasNext()) {
				UiCache uiCache = itr.next().getUiCache();
				result.add(uiCache);
			}
			HibernateSessionFactory.closeSession();
			return result;
		} catch (Exception e) {
			HibernateSessionFactory.closeSession();
			return null;
		}
	}
}

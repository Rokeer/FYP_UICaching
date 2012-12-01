package action;

import com.opensymphony.xwork2.ActionSupport;

import config.globalMethods;

import dao.UiCacheDAO;
import dao.UserDAO;

import entity.UiCache;
import entity.User;

@SuppressWarnings("serial")
public class ReportNewUiCacheAction extends ActionSupport {
	private UiCache uiCache;
	private User user;

	public String execute() {
		if (uiCache == null) {
			return INPUT;
		} else {
			prepareUiCache();
			UiCacheDAO cd = new UiCacheDAO();
			cd.addUiCache(uiCache);
			updateUCId();
			return SUCCESS;
		}
	}

	public void prepareUiCache() {
		UserDAO ud = new UserDAO();
		user = ud.getUser(user.getUserId());
		uiCache.setUser(user);
	}
	
	public void updateUCId() {
		UiCacheDAO cd = new UiCacheDAO();
		globalMethods gm = new globalMethods();
		uiCache.setUcId(gm.setCacheUCId(uiCache.getUiCacheId()));
		cd.editUiCache(uiCache);
	}

	public UiCache getUiCache() {
		return uiCache;
	}

	public void setUiCache(UiCache uiCache) {
		this.uiCache = uiCache;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}

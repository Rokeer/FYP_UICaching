package action;

import com.opensymphony.xwork2.ActionSupport;

import config.globalMethods;
import dao.UiCacheDAO;

import entity.UiCache;

@SuppressWarnings("serial")
public class ViewCacheDetailAction extends ActionSupport{
	private UiCache uiCache;
	public String execute()
	{
		globalMethods gm = new globalMethods();
		String UCCode = gm.getParameterValue("UCCode");
		if (UCCode == null)
		{
			return INPUT;
		}
		UiCacheDAO ud = new UiCacheDAO();
		uiCache = ud.searchByUCCode(UCCode);
		if (uiCache == null)
		{
			return INPUT;
		}
		return SUCCESS;
	}
	public UiCache getUiCache() {
		return uiCache;
	}
	public void setUiCache(UiCache uiCache) {
		this.uiCache = uiCache;
	}
	
	
}

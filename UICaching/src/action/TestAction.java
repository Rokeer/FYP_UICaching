package action;

import com.opensymphony.xwork2.ActionSupport;

import dao.UiCacheDAO;
import dao.UserDAO;

public class TestAction extends ActionSupport{
	public String execute(){
		UserDAO ud = new UserDAO();
		UiCacheDAO cd = new UiCacheDAO();
		cd.checkHave("ucId", "UC00003");
		return SUCCESS;
	}
}

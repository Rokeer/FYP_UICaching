package action;

import com.opensymphony.xwork2.ActionSupport;

import config.globalMethods;

import dao.UserDAO;
import entity.User;

@SuppressWarnings("serial")
public class RegisterAction extends ActionSupport {
	private User user;

	public String execute() {
		if (user == null) {
			return INPUT;
		} else {
			prepareUser();
			UserDAO ud = new UserDAO();
			ud.regUser(user);
			return SUCCESS;
		}
	}

	public void validate() {
		if (user != null) {
			UserDAO ud = new UserDAO();
			if (ud.checkHave("email", user.getEmail())) {
				addFieldError("user.email", getText("gmvemailDB"));
			}
			if (ud.checkHave("nickname", user.getNickname())) {
				addFieldError("user.nickname", getText("gmvnicknameDB"));
			}
		}
	}

	public void prepareUser() {
		globalMethods gm = new globalMethods();
		user.setRegDate(gm.getDate());
		user.setCertificateCode(gm.getMD5(user.getEmail()));
		user.setHomeLatitude(0.0);
		user.setHomeLongitude(0.0);
		user.setPassword(gm.getMD5(user.getPassword()));
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}

package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import config.globalMethods;

import dao.UserDAO;

import entity.User;

@SuppressWarnings("serial")
public class UserLoginAction extends ActionSupport {
	User user;
	String nicknameOrEmail;
	String password;
	boolean savePWD;
	int maxAge;
	String ref;
	globalMethods gm = new globalMethods();
	UserDAO ud = new UserDAO();

	public String execute() {

		// 获取登录前的页面
		//String tmp = gm.getParameterValue("ref");
		//if (tmp != null) {
		//	ref = tmp;
		//}

		// 检查是否输入密码
		if (nicknameOrEmail == null) {

			// 未输入密码，则查看是否存在cookie
			if (gm.getCookie("userId") == null) {
				System.out.println("1");
				return LOGIN;
			} else {

				// 获得user
				user = ud.getUser(Integer.parseInt(gm.getCookie("userId")));

				System.out
						.println("loginToken = " + gm.getCookie("loginToken"));
				System.out.println("loginSeries = "
						+ gm.getCookie("loginSeries"));
				// 检查Login Token和Login Series
				if (user.getLoginToken().equals(gm.getCookie("loginToken"))
						&& user.getLoginSeries().equals(
								gm.getCookie("loginSeries"))) {

					// Login Token和Login Series都相同，则更新Login Token
					String temp = Long.toString(Math
							.round(Math.random() * 9999));
					temp = gm.getMD5(temp);
					gm.updateCookie("loginToken", temp);
					user.setLoginToken(temp);
					ud.editUser(user);
				} else {

					// Login Token或Login Series不同则设置Cookie失效
					gm.clearCookie("userId");
					gm.clearCookie("loginToken");
					gm.clearCookie("loginSeries");
					System.out.println("2");
					return LOGIN;
				}
			}
		} else {
			// 若输入密码，检查输入的是邮箱还是昵称，并获取user对象
			if (nicknameOrEmail.contains("@")) {
				user = ud.getUserByKey("email", nicknameOrEmail);
			} else {
				user = ud.getUserByKey("nickname", nicknameOrEmail);
			}
			password = gm.getMD5(password);
			// 检查密码是否相同
			if (password.equals(user.getPassword())) {
				if (savePWD) {
					maxAge = 60 * 60 * 24 * 14;
				} else {
					maxAge = -1;
				}

				// 清空Cookie
				gm.clearCookie("userId");
				gm.clearCookie("loginToken");
				gm.clearCookie("loginSeries");

				// 重新设置Cookie中的User ID，Login Token和Login Series
				gm.addCookie("userId", Integer.toString(user.getUserId()),
						maxAge);

				String temp = Long.toString(Math.round(Math.random() * 9999));
				temp = gm.getMD5(temp);
				gm.addCookie("loginToken", temp, maxAge);
				user.setLoginToken(temp);

				temp = Long.toString(Math.round(Math.random() * 9999));
				temp = gm.getMD5(temp);
				gm.addCookie("loginSeries", temp, maxAge);
				user.setLoginSeries(temp);

				// 更新数据库中的user表的相关数据
				ud.editUser(user);
			} else {
				System.out.println("3");
				return LOGIN;
			}
		}
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();

		// 将userId写入session，以便后续检查用户登录或获取用户id
		session.setAttribute("uid", Integer.toString(user.getUserId()));
		session.setAttribute("uname", user.getNickname());
		if (ref != null && !ref.equals("")) {
			return "ref";
		}
		return SUCCESS;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getNicknameOrEmail() {
		return nicknameOrEmail;
	}

	public void setNicknameOrEmail(String nicknameOrEmail) {
		this.nicknameOrEmail = nicknameOrEmail;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isSavePWD() {
		return savePWD;
	}

	public void setSavePWD(boolean savePWD) {
		this.savePWD = savePWD;
	}

	public int getMaxAge() {
		return maxAge;
	}

	public void setMaxAge(int maxAge) {
		this.maxAge = maxAge;
	}

	public String getRef() {
		return ref;
	}

	public void setRef(String ref) {
		this.ref = ref;
	}

	public globalMethods getGm() {
		return gm;
	}

	public void setGm(globalMethods gm) {
		this.gm = gm;
	}

	public UserDAO getUd() {
		return ud;
	}

	public void setUd(UserDAO ud) {
		this.ud = ud;
	}

}

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

		// ��ȡ��¼ǰ��ҳ��
		//String tmp = gm.getParameterValue("ref");
		//if (tmp != null) {
		//	ref = tmp;
		//}

		// ����Ƿ���������
		if (nicknameOrEmail == null) {

			// δ�������룬��鿴�Ƿ����cookie
			if (gm.getCookie("userId") == null) {
				System.out.println("1");
				return LOGIN;
			} else {

				// ���user
				user = ud.getUser(Integer.parseInt(gm.getCookie("userId")));

				System.out
						.println("loginToken = " + gm.getCookie("loginToken"));
				System.out.println("loginSeries = "
						+ gm.getCookie("loginSeries"));
				// ���Login Token��Login Series
				if (user.getLoginToken().equals(gm.getCookie("loginToken"))
						&& user.getLoginSeries().equals(
								gm.getCookie("loginSeries"))) {

					// Login Token��Login Series����ͬ�������Login Token
					String temp = Long.toString(Math
							.round(Math.random() * 9999));
					temp = gm.getMD5(temp);
					gm.updateCookie("loginToken", temp);
					user.setLoginToken(temp);
					ud.editUser(user);
				} else {

					// Login Token��Login Series��ͬ������CookieʧЧ
					gm.clearCookie("userId");
					gm.clearCookie("loginToken");
					gm.clearCookie("loginSeries");
					System.out.println("2");
					return LOGIN;
				}
			}
		} else {
			// ���������룬�������������仹���ǳƣ�����ȡuser����
			if (nicknameOrEmail.contains("@")) {
				user = ud.getUserByKey("email", nicknameOrEmail);
			} else {
				user = ud.getUserByKey("nickname", nicknameOrEmail);
			}
			password = gm.getMD5(password);
			// ��������Ƿ���ͬ
			if (password.equals(user.getPassword())) {
				if (savePWD) {
					maxAge = 60 * 60 * 24 * 14;
				} else {
					maxAge = -1;
				}

				// ���Cookie
				gm.clearCookie("userId");
				gm.clearCookie("loginToken");
				gm.clearCookie("loginSeries");

				// ��������Cookie�е�User ID��Login Token��Login Series
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

				// �������ݿ��е�user����������
				ud.editUser(user);
			} else {
				System.out.println("3");
				return LOGIN;
			}
		}
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();

		// ��userIdд��session���Ա��������û���¼���ȡ�û�id
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

package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import config.globalMethods;

@SuppressWarnings("serial")
public class LogoutAction extends ActionSupport{
	public String execute()
	{
		globalMethods gm = new globalMethods();
		gm.clearCookie("userId");
		gm.clearCookie("loginToken");
		gm.clearCookie("loginSeries");

		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();

		// 将userId写入session，以便后续检查用户登录或获取用户id
		session.setAttribute("uid", "");
		session.setAttribute("uname", "");
		return SUCCESS;
	}
}

package action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import dao.UserDAO;

import entity.User;

@SuppressWarnings("serial")
public class UploadAvatarAction extends ActionSupport {
	private File avatar;
	private String avatarContentType;
	private String avatarFileName;
	private String path;
	private User user;

	public String execute() throws Exception {
		if (avatar == null) {
			return INPUT;
		} else {
			UserDAO ud = new UserDAO();
			user = ud.getUser(user.getUserId());
			if (uploadAvatar()) {
				user.setAvatar("upload/avatar/" + avatarFileName);
				ud.editUser(user);
			}
			return SUCCESS;
		}
	}

	public boolean uploadAvatar() throws Exception {
		avatarFileName = user.getUserId() + "_avatar.jpg";
		FileOutputStream fos = new FileOutputStream(getPath() + "\\"
				+ avatarFileName);
		FileInputStream fis = new FileInputStream(avatar);
		byte[] b = new byte[1024];
		int length = 0;
		while ((length = fis.read(b)) > 0) {
			fos.write(b, 0, length);
		}
		return true;
	}

	public File getAvatar() {
		return avatar;
	}

	public void setAvatar(File avatar) {
		this.avatar = avatar;
	}

	public String getAvatarContentType() {
		return avatarContentType;
	}

	public void setAvatarContentType(String avatarContentType) {
		this.avatarContentType = avatarContentType;
	}

	public String getAvatarFileName() {
		return avatarFileName;
	}

	public void setAvatarFileName(String avatarFileName) {
		this.avatarFileName = avatarFileName;
	}

	public String getPath() {
		return ServletActionContext.getRequest().getRealPath(path);
	}

	public void setPath(String path) {
		this.path = path;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}

package action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import config.globalMethods;

import dao.UiCacheDAO;
import dao.UiCachePictureDAO;
import dao.UserDAO;

import entity.UiCache;
import entity.UiCachePicture;
import entity.User;

@SuppressWarnings("serial")
public class UploadCachePicturesAction extends ActionSupport {
	private File picture;
	private String pictureContentType;
	private String pictureFileName;
	private String path;
	private User user;
	private UiCache uiCache;
	private UiCachePicture uiCachePicture;

	public String execute() throws Exception {
		if (picture == null) {
			return INPUT;
		} else {
			UserDAO ud = new UserDAO();
			user = ud.getUser(user.getUserId());
			UiCacheDAO cd = new UiCacheDAO();
			uiCache = cd.getUiCache(uiCache.getUiCacheId());
			uiCachePicture.setUiCache(uiCache);
			uiCachePicture.setUser(user);
			//path = "\\upload\\cache\\"+uiCache.getUcId()+"\\picture";
			if (uploadPicture()) {
				UiCachePictureDAO cpd = new UiCachePictureDAO();
				uiCachePicture.setPath("upload/cache/picture/"+pictureFileName);
				cpd.addUiCachePicture(uiCachePicture);
			}
			return SUCCESS;
		}
	}

	public boolean uploadPicture() throws Exception {
		globalMethods gm = new globalMethods();
		pictureFileName = uiCache.getUcId()+"_UICachePic_"+gm.getMD5(Integer.toString(user.getUserId())) + "_"+gm.getMD5(gm.getDate())+".jpg";
		FileOutputStream fos = new FileOutputStream(getPath() + "\\"
				+ pictureFileName);
		FileInputStream fis = new FileInputStream(picture);
		byte[] b = new byte[1024];
		int length = 0;
		while ((length = fis.read(b)) > 0) {
			fos.write(b, 0, length);
		}
		return true;
	}

	public File getPicture() {
		return picture;
	}

	public void setPicture(File picture) {
		this.picture = picture;
	}

	public String getPictureContentType() {
		return pictureContentType;
	}

	public void setPictureContentType(String pictureContentType) {
		this.pictureContentType = pictureContentType;
	}

	public String getPictureFileName() {
		return pictureFileName;
	}

	public void setPictureFileName(String pictureFileName) {
		this.pictureFileName = pictureFileName;
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

	public UiCache getUiCache() {
		return uiCache;
	}

	public void setUiCache(UiCache uiCache) {
		this.uiCache = uiCache;
	}

	public UiCachePicture getUiCachePicture() {
		return uiCachePicture;
	}

	public void setUiCachePicture(UiCachePicture uiCachePicture) {
		this.uiCachePicture = uiCachePicture;
	}

}

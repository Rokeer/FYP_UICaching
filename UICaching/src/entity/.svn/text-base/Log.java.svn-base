package entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

@SuppressWarnings("serial")
public class Log implements Serializable {
	private int logId;
	private int type;
	private String dateLogged;
	private String comments;
	private boolean isEncrypt;
	private boolean hasCoordinate;
	private double latitude;
	private double longitude;
	private int statusCode;
	private User user;
	private UiCache uiCache;
	private Set logPictures = new HashSet();

	public Log() {
		super();
	}

	public Log(int logId, int type, String dateLogged, String comments,
			boolean isEncrypt, boolean hasCoordinate, double latitude,
			double longitude, int statusCode, User user, UiCache uiCache,
			Set logPictures) {
		super();
		this.logId = logId;
		this.type = type;
		this.dateLogged = dateLogged;
		this.comments = comments;
		this.isEncrypt = isEncrypt;
		this.hasCoordinate = hasCoordinate;
		this.latitude = latitude;
		this.longitude = longitude;
		this.statusCode = statusCode;
		this.user = user;
		this.uiCache = uiCache;
		this.logPictures = logPictures;
	}

	public int getLogId() {
		return logId;
	}

	public void setLogId(int logId) {
		this.logId = logId;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getDateLogged() {
		return dateLogged;
	}

	public void setDateLogged(String dateLogged) {
		this.dateLogged = dateLogged;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public boolean getIsEncrypt() {
		return isEncrypt;
	}

	public void setIsEncrypt(boolean isEncrypt) {
		this.isEncrypt = isEncrypt;
	}

	public boolean getHasCoordinate() {
		return hasCoordinate;
	}

	public void setHasCoordinate(boolean hasCoordinate) {
		this.hasCoordinate = hasCoordinate;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	public int getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(int statusCode) {
		this.statusCode = statusCode;
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

	public Set getLogPictures() {
		return logPictures;
	}

	public void setLogPictures(Set logPictures) {
		this.logPictures = logPictures;
	}
}

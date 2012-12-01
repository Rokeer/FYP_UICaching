package entity;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Favorite implements Serializable {
	private int favoriteId;
	private boolean sendNotice;
	private User user;
	private UiCache uiCache;

	public Favorite() {
		super();
	}

	public Favorite(int favoriteId, boolean sendNotice, User user,
			UiCache uiCache) {
		super();
		this.favoriteId = favoriteId;
		this.sendNotice = sendNotice;
		this.user = user;
		this.uiCache = uiCache;
	}

	public int getFavoriteId() {
		return favoriteId;
	}

	public void setFavoriteId(int favoriteId) {
		this.favoriteId = favoriteId;
	}

	public boolean getSendNotice() {
		return sendNotice;
	}

	public void setSendNotice(boolean sendNotice) {
		this.sendNotice = sendNotice;
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
}

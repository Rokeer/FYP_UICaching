package entity;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Digger implements Serializable {
	private int diggerId;
	private User user;
	private UiCache uiCache;

	public Digger() {
		super();
	}

	public Digger(int diggerId, User user, UiCache uiCache) {
		super();
		this.diggerId = diggerId;
		this.user = user;
		this.uiCache = uiCache;
	}

	public int getDiggerId() {
		return diggerId;
	}

	public void setDiggerId(int diggerId) {
		this.diggerId = diggerId;
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

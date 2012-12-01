package config;

import java.util.Comparator;

import entity.UiCache;

public class ComparatorUICache implements Comparator {
	public int compare(Object arg0, Object arg1) {
		UiCache uiCache0 = (UiCache) arg0;
		UiCache uiCache1 = (UiCache) arg1;

		// 首先比较距离，如果距离相同，则比较UCID

		int flag = (int) (uiCache0.getTmpDistance() - uiCache1.getTmpDistance());
		if (flag == 0) {
			return (int) (uiCache0.getUiCacheId() - uiCache1.getUiCacheId());
		} else {
			return flag;
		}
	}
}

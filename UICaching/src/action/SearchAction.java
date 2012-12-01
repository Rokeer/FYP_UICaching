package action;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

import config.MapMethods;

import dao.UiCacheDAO;
import entity.UiCache;

public class SearchAction extends ActionSupport {
	public String address;
	public int addressRadius;
	public String postalCode;
	public int postalCodeRadius;
	public String country;
	public double latitude;
	public double longitude;
	public int radius;
	public String latNS;
	public int latHDDD;
	public double latMMMM;
	public double latSSSS;
	public String lonWE;
	public int lonHDDD;
	public double lonMMMM;
	public double lonSSSS;
	public int WGS84Radius;
	public String cacheName;
	public String UCCode;
	public String foundBy;
	public String hiddenBy;
	public int submit;
	public List result;
	public UiCache uiCache;

	// 直接按原始地理坐标搜索
	public String searchByCoord() {
		UiCacheDAO ud = new UiCacheDAO();
		result = ud.searchByCoord(latitude, longitude, radius);
		return SUCCESS;
	}

	// 按地址搜索
	public String searchByAddress() {
		UiCacheDAO ud = new UiCacheDAO();
		MapMethods mm = new MapMethods();
		String tmp = mm.parseAddressAndPoint(address);
		String[] tmpary = new String[4];
		tmpary = tmp.split(",");
		latitude = Double.parseDouble(tmpary[2]);
		longitude = Double.parseDouble(tmpary[3]);
		result = ud.searchByCoord(latitude, longitude, addressRadius);
		return SUCCESS;
	}

	// 按国家搜索
	public String searchByCountry() {
		UiCacheDAO ud = new UiCacheDAO();
		result = ud.searchByCountry(country);
		return SUCCESS;
	}

	// 按Cache name搜索
	public String searchByCacheName() {
		UiCacheDAO ud = new UiCacheDAO();
		result = ud.searchByCacheName(cacheName);
		return SUCCESS;
	}

	// 按UCCode搜索
	public String searchByUCCode() {
		UiCacheDAO ud = new UiCacheDAO();
		uiCache = ud.searchByUCCode(UCCode);
		return "uccode";
	}

	// 按藏宝人搜索
	public String searchByReporter() {
		UiCacheDAO ud = new UiCacheDAO();
		MapMethods mm = new MapMethods();
		result = ud.searchByReporter(hiddenBy);
		return SUCCESS;
	}

	// 按发现人搜索
	public String searchByFounder() {
		UiCacheDAO ud = new UiCacheDAO();
		MapMethods mm = new MapMethods();
		result = ud.searchByFounder(foundBy);
		return SUCCESS;
	}

	// 按WGS84坐标系搜索 DM
	public String searchByWGSDM() {
		UiCacheDAO ud = new UiCacheDAO();
		MapMethods mm = new MapMethods();
		latitude = mm.WGS842Dec(latNS, latHDDD, latMMMM);
		longitude = mm.WGS842Dec(lonWE, lonHDDD, lonMMMM);
		result = ud.searchByCoord(latitude, longitude, WGS84Radius);
		return SUCCESS;
	}

	// 按WGS84坐标系搜索 DMS
	public String searchByWGSDMS() {
		UiCacheDAO ud = new UiCacheDAO();
		MapMethods mm = new MapMethods();
		latitude = mm.WGS842Dec(latNS, latHDDD, latMMMM, latSSSS);
		longitude = mm.WGS842Dec(lonWE, lonHDDD, lonMMMM, latSSSS);
		result = ud.searchByCoord(latitude, longitude, WGS84Radius);
		return SUCCESS;
	}

	public String searchByPostalCode() {
		UiCacheDAO ud = new UiCacheDAO();
		MapMethods mm = new MapMethods();
		String tmp = mm.parseAddressAndPoint(postalCode);
		String[] tmpary = new String[4];
		tmpary = tmp.split(",");
		latitude = Double.parseDouble(tmpary[2]);
		longitude = Double.parseDouble(tmpary[3]);
		result = ud.searchByCoord(latitude, longitude, postalCodeRadius);
		return SUCCESS;
	}

	public String execute() {
		return INPUT;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getAddressRadius() {
		return addressRadius;
	}

	public void setAddressRadius(int addressRadius) {
		this.addressRadius = addressRadius;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public int getPostalCodeRadius() {
		return postalCodeRadius;
	}

	public void setPostalCodeRadius(int postalCodeRadius) {
		this.postalCodeRadius = postalCodeRadius;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
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

	public int getRadius() {
		return radius;
	}

	public void setRadius(int radius) {
		this.radius = radius;
	}

	public String getLatNS() {
		return latNS;
	}

	public void setLatNS(String latNS) {
		this.latNS = latNS;
	}

	public int getLatHDDD() {
		return latHDDD;
	}

	public void setLatHDDD(int latHDDD) {
		this.latHDDD = latHDDD;
	}

	public double getLatMMMM() {
		return latMMMM;
	}

	public void setLatMMMM(double latMMMM) {
		this.latMMMM = latMMMM;
	}

	public double getLatSSSS() {
		return latSSSS;
	}

	public void setLatSSSS(double latSSSS) {
		this.latSSSS = latSSSS;
	}

	public String getLonWE() {
		return lonWE;
	}

	public void setLonWE(String lonWE) {
		this.lonWE = lonWE;
	}

	public int getLonHDDD() {
		return lonHDDD;
	}

	public void setLonHDDD(int lonHDDD) {
		this.lonHDDD = lonHDDD;
	}

	public double getLonMMMM() {
		return lonMMMM;
	}

	public void setLonMMMM(double lonMMMM) {
		this.lonMMMM = lonMMMM;
	}

	public double getLonSSSS() {
		return lonSSSS;
	}

	public void setLonSSSS(double lonSSSS) {
		this.lonSSSS = lonSSSS;
	}

	public int getWGS84Radius() {
		return WGS84Radius;
	}

	public void setWGS84Radius(int wGS84Radius) {
		WGS84Radius = wGS84Radius;
	}

	public String getCacheName() {
		return cacheName;
	}

	public void setCacheName(String cacheName) {
		this.cacheName = cacheName;
	}

	public String getUCCode() {
		return UCCode;
	}

	public void setUCCode(String uCCode) {
		UCCode = uCCode;
	}

	public String getFoundBy() {
		return foundBy;
	}

	public void setFoundBy(String foundBy) {
		this.foundBy = foundBy;
	}

	public String getHiddenBy() {
		return hiddenBy;
	}

	public void setHiddenBy(String hiddenBy) {
		this.hiddenBy = hiddenBy;
	}

	public int getSubmit() {
		return submit;
	}

	public void setSubmit(int submit) {
		this.submit = submit;
	}

	public List getResult() {
		return result;
	}

	public void setResult(List result) {
		this.result = result;
	}

	public UiCache getUiCache() {
		return uiCache;
	}

	public void setUiCache(UiCache uiCache) {
		this.uiCache = uiCache;
	}

}

package action;

import com.opensymphony.xwork2.ActionSupport;

import config.globalMethods;

@SuppressWarnings("serial")
public class ShowOnMapAction extends ActionSupport{
	private double latitude;
	private double longitude;
	
	public String execute()
	{
		globalMethods gm = new globalMethods();
		longitude = Double.parseDouble(gm.getParameterValue("longitude"));
		latitude = Double.parseDouble(gm.getParameterValue("latitude"));
		return SUCCESS;
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
	
	
	
}

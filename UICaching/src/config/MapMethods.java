package config;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;

public class MapMethods {

	private static double EARTH_RADIUS = 6378.137;

	public MapMethods() {

	}

	// WGS842Dec ֻ�ж�
	public double WGS842Dec(String NSWE, double HDDD) {
		if (NSWE.equals("N") || NSWE.equals("E")) {
			return HDDD;
		} else {
			return -1 * HDDD;
		}
	}

	// WGS842Dec ��+��
	public double WGS842Dec(String NSWE, int HDDD, double MMMM) {
		double result = (double) HDDD + (MMMM / 60);
		if (NSWE.equals("N") || NSWE.equals("E")) {
			return result;
		} else {
			return -1 * result;
		}
	}

	// WGS842Dec ��+��+��
	public double WGS842Dec(String NSWE, int HDDD, double MMMM, double SSSS) {
		double result = (double) HDDD + ((MMMM + (SSSS / 60)) / 60);
		if (NSWE.equals("N") || NSWE.equals("E")) {
			return result;
		} else {
			return -1 * result;
		}
	}

	private static double rad(double d) {
		return d * Math.PI / 180.0;
	}

	public double GetDistance(double lat1, double lng1, double lat2, double lng2) {
		double radLat1 = rad(lat1);
		double radLat2 = rad(lat2);
		double a = radLat1 - radLat2;
		double b = rad(lng1) - rad(lng2);
		double s = 2 * Math.asin(Math.sqrt(Math.pow(Math.sin(a / 2), 2)
				+ Math.cos(radLat1) * Math.cos(radLat2)
				* Math.pow(Math.sin(b / 2), 2)));
		s = s * EARTH_RADIUS;
		s = Math.round(s * 10.0) / 10.0;
		// ��λkm����ȷһλС��
		return s;
	}

	/**
	 * ����googlemap api ͨ�� HTTP ���е�ַ����
	 * 
	 * @param address
	 *            ��ַ
	 * @return HTTP״̬����,��ȷ�ȣ���μ���ȷ�ȳ�����,γ��,����
	 */
	public String parseAddressAndPoint(String addressOrPoint) {
		String ret = "";
		try {
			// http://ditu.google.cn ������ http;//map.google.com ԭ���ǲ���������������
			String url = "http://ditu.google.cn/maps/geo?output=csv&q="
					+ java.net.URLEncoder.encode(addressOrPoint, "UTF-8")
					+ "&sensor=false";
			URL urlmy = null;
			urlmy = new URL(url);
			HttpURLConnection con = (HttpURLConnection) urlmy.openConnection();
			con.setFollowRedirects(true);
			con.setInstanceFollowRedirects(false);
			con.connect();
			BufferedReader br = new BufferedReader(new InputStreamReader(con
					.getInputStream(), "UTF-8"));
			String s = "";
			StringBuffer sb = new StringBuffer("");
			while ((s = br.readLine()) != null) {
				sb.append(s + "\r\n");
			}
			ret = "" + sb;
		} catch (MalformedURLException e) {
			System.out.println("ͨ��http��ʽ��ȡ��ַ��Ϣʧ��");
		} catch (IOException e) {
			System.out.println("�ļ���ȡʧ��");
		}
		return ret;
	}
}

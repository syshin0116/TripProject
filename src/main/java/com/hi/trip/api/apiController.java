package com.hi.trip.api;


import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class apiController {

	@ResponseBody
	@GetMapping("/weather")
	public StringBuilder fetchPublicWeatherData(String site) throws Exception {
		// weatherAPI.js에서 불러온 값을 site 변수에 넣어서 url에 넣고 그 url을 API서버에 보낸 후 값을 가지고 온 후 다시 weatherAPI.js로 보낸다.
//		String servicekey= "?serviceKey=fXHE%2F%2B0Os5mkfzup7JRN4tQ02vjXoVpEmPPaEc1d%2F%2F9v51j04k3L9gAtyoPon07S3821Zcak2KiTz9XuAPja4A%3D%3D";
//		String servicekey = "fXHE%2F%2B0Os5mkfzup7JRN4tQ02vjXoVpEmPPaEc1d%2F%2F9v51j04k3L9gAtyoPon07S3821Zcak2KiTz9XuAPja4A%3D%3D"; 
//    	String ForecastGribURL = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst";
//    	ForecastGribURL += "?serviceKey=" +  servicekey;
	
    	
		URL url = new URL(site); 
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
//		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
//			System.out.println(line + "\n");
			sb.append(line);
		}
		rd.close();
		conn.disconnect();

		return sb;
}

}
package com.ohana0.test.jstl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WeatherController {
	
	@GetMapping("/jstl/weather")
	public String weatherHistory() {
		return "jstl/weatherInfo";
	}
}

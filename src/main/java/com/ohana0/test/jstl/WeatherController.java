package com.ohana0.test.jstl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ohana0.test.jstl.domain.Weather;
import com.ohana0.test.jstl.service.WeatherService;

@Controller
@RequestMapping("/jstl/weather")
public class WeatherController {
	@Autowired
	private WeatherService weatherService; 
	
	@GetMapping("")
	public String weatherHistory(Model model) {
		
		List<Weather> weatherHistory = weatherService.getWeatherHistory();
		
		model.addAttribute("weatherHistory",weatherHistory);
		return "jstl/weatherInfo";
	}
	
	@GetMapping("/input")
	private String weatherInput() {
		
		return "jstl/add_weather";
	}
	
	@GetMapping("/add")
	private String createWeather(
			@RequestParam("date") String dateString
			,@RequestParam("weather") String weather
			,@RequestParam("temperature") Double temperatures
			,@RequestParam("precipitation") Double precipitation
			,@RequestParam("microDust") String microDust
			,@RequestParam("windSpeed") Double windSpeed){
		Weather weatherToday = new Weather();

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date date;
		try {
			date = formatter.parse(dateString);
		} catch (ParseException e) {
			date= null;
			e.printStackTrace();
		}
		weatherToday.setDate(date);
		weatherToday.setWeather(weather);
		weatherToday.setTemperatures(temperatures);
		weatherToday.setPrecipitation(precipitation);
		weatherToday.setMicroDust(microDust);
		weatherToday.setWindSpeed(windSpeed);
		
		weatherService.addWeather(weatherToday);

		return "redirect:/jstl/weather";
	}
	


	
	
}

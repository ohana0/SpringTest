package com.ohana0.test.jstl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ohana0.test.jstl.domain.Weather;
import com.ohana0.test.jstl.repository.WeatherRepository;

@Service
public class WeatherService {
	@Autowired
	private WeatherRepository weatherRepository;
	
	public List<Weather> getWeatherHistory(){
		List<Weather> weatherHistory= weatherRepository.getWeatherHistory();
		return weatherHistory;
	}
	
	public int addWeather(Weather weather) {
		int count = weatherRepository.insertWeather(weather);
		return count;
	}

	
	
}

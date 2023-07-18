package com.ohana0.test.jstl.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ohana0.test.jstl.domain.Weather;

@Repository
public interface WeatherRepository {
	public List<Weather> getWeatherHistory();
	
	
	public int insertWeather(Weather weather);
}



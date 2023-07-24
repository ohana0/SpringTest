package com.ohana0.test.ajax.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ohana0.test.ajax.domain.Booking;
import com.ohana0.test.ajax.repository.BookingRepository;

@Service
public class BookingService {
	@Autowired
	public BookingRepository bookingRepository;
	
	public List<Booking> getList() {
		List<Booking> bookingList = bookingRepository.getBookingList();
		return bookingList;
	}

	public int addBooking(String name, int headcount, int day, Date date, String phoneNumber, String state) {
		int count = bookingRepository.insertBooking(name,headcount,day,date,phoneNumber,state);
		return count;
		
	}

	public int deleteBooking(int id) {
		int count = bookingRepository.deleteBooking(id);
		return count;
	}

}

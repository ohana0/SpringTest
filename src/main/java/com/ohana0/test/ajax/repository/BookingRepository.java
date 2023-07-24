package com.ohana0.test.ajax.repository;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ohana0.test.ajax.domain.Booking;

@Repository
public interface BookingRepository {

	public List<Booking> getBookingList();

	public int insertBooking(@Param("name") String name
			,@Param("headcount") int headcount
			,@Param("day") int day
			,@Param("date") Date date
			,@Param("phoneNumber")String phoneNumber
			,@Param("state") String state);

	public int deleteBooking(@Param("id") int id);

	public List<Booking> checkBooking(@Param("name")String name, @Param("phoneNumber")String phoneNumber);
}
package com.ohana0.test.ajax;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ohana0.test.ajax.domain.Booking;
import com.ohana0.test.ajax.service.BookingService;
@RequestMapping("/booking")
@Controller
public class BookingController {
	
	@Autowired
	private BookingService bookingService;
	
	@RequestMapping("/home")
	public String bookingHome() {
		return "/ajax/booking/booking";
	}
	
	@GetMapping("/list")
	public String bookingList(Model model) {
		List<Booking> list = bookingService.getList();
		
		model.addAttribute("booking", list);
		
		
		return "/ajax/booking/booking_list";
	}
	@GetMapping("/reserve")
	public String bookingReservePage() {
		
		return "/ajax/booking/booking_reserve";
	}
	
	@ResponseBody
	@PostMapping("/add")
	public Map<String,String> createBooking(
			@RequestParam("name") String name
			,@RequestParam("headcount") int headcount 
			,@RequestParam("day") int day
			,@RequestParam("date") String dateString
			,@RequestParam("phoneNumber") String phoneNumber
			) {
		String state="대기중";
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date date;

			try {
				date = formatter.parse(dateString);
			} catch (ParseException e) {
				e.printStackTrace();
				date=null;
			}

		int count = bookingService.addBooking(name,headcount,day,date,phoneNumber,state);
		
		Map<String,String> resultMap = new HashMap<>();
		
		if(count==1) {
			resultMap.put("result", "success");
		}
		else {
			resultMap.put("result", "fail");
		}
		return resultMap;
		
	}
	
	public Map<String,String> deleteBooking(@RequestParam("id") int id){
		int count = bookingService.deleteBooking(id);
		Map<String,String> resultMap = new HashMap<>();
		if(count == 1) {
			resultMap.put("result", "success");
		}
		else {
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
	
	
	
}

package com.ohana0.test.jsp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ohana0.test.jsp.domain.Realtor;
import com.ohana0.test.jsp.service.RealtorService;

@Controller
@RequestMapping("/jsp/realtor")
public class RealtorController {
	@Autowired
	private RealtorService realtorService;
	
	@PostMapping("/add")
	public String createRealtor(
			@RequestParam("office") String office
			,@RequestParam("phoneNumber")String phoneNumber
			,@RequestParam("address") String address
			,@RequestParam("grade") String grade
			,Model model
			){
		
		Realtor realtor = new Realtor();
		realtor.setOffice(office);
		realtor.setPhoneNumber(phoneNumber);
		realtor.setAddress(address);
		realtor.setGrade(grade);
		
		model.addAttribute("realtor", realtor);
		realtorService.addRealtor(realtor);
		return "jsp/realtorInfo";
	}
	
	@GetMapping("/input")
	public String realtorInput() {
		return "jsp/add_realtor";
	}
}

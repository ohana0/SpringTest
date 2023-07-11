package com.ohana0.test.jsp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.ohana0.test.jsp.domain.Seller;
import com.ohana0.test.jsp.service.SellerService;

@Controller
public class SellerController {
	
	@Autowired
	private SellerService sellerService;
	
	public String createSeller(Model model) {
		Seller seller = sellerService.addSeller();
		model.addAttribute("result",seller);
		return "jsp/seller"
	}
		
}

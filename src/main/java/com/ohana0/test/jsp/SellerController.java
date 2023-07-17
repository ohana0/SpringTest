package com.ohana0.test.jsp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ohana0.test.jsp.domain.Seller;
import com.ohana0.test.jsp.service.SellerService;

@Controller
@RequestMapping("/jsp/seller")
public class SellerController {
	
	@Autowired
	private SellerService sellerService;
	
	
	@ResponseBody
	@PostMapping("/add")
	public String createSeller(
			@RequestParam("nickname") String nickname
			,@RequestParam("prifileUrl") String profileUrl
			,@RequestParam("temperature") double temperature){
		
		int count = sellerService.addSeller(nickname,profileUrl,temperature);
		return "삽입성공: " + count;
	}
	
	@GetMapping("/input")
	public String sellerInput() {
		return "jsp/add_seller";
	}
	
	@GetMapping("/lastseller")
	public String lastSeller(Model model) {
		
		Seller seller = sellerService.getLastSeller();
		
		model.addAttribute("seller", seller);
		
		return "jsp/sellerInfo";
	}
	@RequestMapping(path="/info", method = RequestMethod.GET)
//	@GetMapping("/info")
	public String seller(@RequestParam(value="id",required=false) Integer id, Model model) {
		
		if (id==null) {
			Seller seller = sellerService.getLastSeller();
			
			model.addAttribute("seller", seller);
			
			return "jsp/sellerInfo";
			
		}
		else {
			
		Seller seller = sellerService.getSeller(id);
		model.addAttribute("seller", seller);
		return "jsp/sellerInfo";
		}
	}
		
}

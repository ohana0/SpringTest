package com.ohana0.test.mybatis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ohana0.test.mybatis.domain.RealEstate;
import com.ohana0.test.mybatis.service.RealEstateService;

@Controller
@RequestMapping("/mybatis/test01")
public class RealEstateController {
	
	@Autowired
	private RealEstateService realEstateService;
	
	@ResponseBody
	@RequestMapping("/1")
	public RealEstate realEstate(@RequestParam("id") int id) {
		RealEstate realEstate = realEstateService.getRealEstate(id);
		return realEstate;
		
	}
	
	// 월세전달받고 그거모다 낮은매물을 담는다.
	@ResponseBody
	@RequestMapping("/2")
	public List<RealEstate> realEstateByRentPrice(@RequestParam("rent") int rentPrice){
		List<RealEstate> realEstateList = realEstateService.getRealEstateByRentPrice(rentPrice);
		return realEstateList;
	}
	
	@ResponseBody
	@RequestMapping("/3")
	public List<RealEstate> realEstateByAreaPrice(@RequestParam("area") int area , @RequestParam("price") int price){
		List<RealEstate> realEstateList = realEstateService.getRealEstateByAreaPrice(area,price);
		
		return realEstateList;
	}
	
//	realtorId : 3
//	address : 푸르지용 리버 303동 1104호
//	area : 89
//	type : 매매
//	price : 100000
	@ResponseBody
	@RequestMapping("4")
	public String createRealEstateByObject() {
		RealEstate realEstate = new RealEstate();
		realEstate.setRealtorId(3);
		realEstate.setAddress("푸르지용 리버 303동 1104호");
		realEstate.setArea(89);
		realEstate.setType("매매");
		realEstate.setPrice(100000);
		
		int count = realEstateService.addRealEstateByObject(realEstate);
		
		return "입력 성공 : " + count;  
		
	}
	
	
//	address : 썅떼빌리버 오피스텔 814호
//	area : 45
//	type : 월세
//	price : 100000
//	rentPrice : 120
	@ResponseBody
	@RequestMapping("/5")
	public String createRealEstate(@RequestParam("realtor") int realtorId) {

		int count = realEstateService.addRealEstate(realtorId,"썅떼빌리버 오피스텔 814호",45,"월세",100000,120);
		
		return count + "개 추가완료";
	}
	@ResponseBody
	@RequestMapping("/6")
	public String updateRealEstate() {
		//int count = realEstateService.updateRealEstate("id","type","price");
		int count = realEstateService.updateRealEstate(34,"전세",70000);
		return "수정 성공 : " + count;
	}
	@ResponseBody
	@RequestMapping("/7")
	public String deleteRealEstate(@RequestParam("id") int id) {
		
		int count = realEstateService.deleteRealEstate(id);
		
		return count + "개 삭제완료";
	}
}

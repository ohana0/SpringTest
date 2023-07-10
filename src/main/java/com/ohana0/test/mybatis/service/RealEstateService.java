package com.ohana0.test.mybatis.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ohana0.test.mybatis.domain.RealEstate;
import com.ohana0.test.mybatis.repository.RealEstateRepository;

@Service
public class RealEstateService {
	@Autowired
	private RealEstateRepository realEstateRepository;
	
	public RealEstate getRealEstate(int id){
		
		RealEstate realEstate = realEstateRepository.selectRealEstate(id);
		
		return realEstate;
	}
	
	public List<RealEstate> getRealEstateByRentPrice(int rentPrice) {
		
		List<RealEstate> realEstateList = realEstateRepository.selectRealEstateByRentPrice(rentPrice);
		
		return realEstateList;
		
	}
	
	public List<RealEstate> getRealEstateByAreaPrice(int area, int price){
		List<RealEstate> realEstateList = realEstateRepository.selectRealEstateByAreaPrice(area,price);
		return realEstateList;
	}
	public int addRealEstateByObject(RealEstate realEstate) {
		int count = realEstateRepository.insertRealEstateByObject(realEstate);
		return count;
	}
	
	
//	realtorId : 3
//	address : 푸르지용 리버 303동 1104호
//	area : 89
//	type : 매매
//	price : 100000
	public int addRealEstate(int realtorId,String address,int area,String type,int price,int rentPrice) {
		int count = realEstateRepository.insertRealEstate(realtorId,address,area,type,price,rentPrice);
		return count;
	}
	
	public int updateRealEstate(int id,String type,int price) {
		int count = realEstateRepository.updateRealEstate(id,type,price);
		return count;
		
	}

}

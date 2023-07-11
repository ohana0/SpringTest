package com.ohana0.test.mybatis.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ohana0.test.mybatis.domain.RealEstate;

@Repository
public interface RealEstateRepository {
	
	public RealEstate selectRealEstate(@Param("id") int id);
	
	public List<RealEstate> selectRealEstateByRentPrice(@Param("rentPrice") int rentPrice);
	
	public List<RealEstate> selectRealEstateByAreaPrice(@Param("area") int area, @Param("price") int price);
	
	public int insertRealEstateByObject(RealEstate realEstate);
	
//	realtorId : 3
//	address : 푸르지용 리버 303동 1104호
//	area : 89
//	type : 매매
//	price : 100000
	public int insertRealEstate(
			@Param("realtorId") int realtorId
			,@Param("address") String address
			,@Param("area") int area
			,@Param("type") String type
			,@Param("price") int price
			,@Param("rentPrice") int rentPrice);
	
	public int updateRealEstate(
			@Param("id") int id
			,@Param("type") String type
			,@Param("price") int price);
			
			
	public int deleteRealEstate(@Param("id") int id);
			
	
	
	
	
	
	
}

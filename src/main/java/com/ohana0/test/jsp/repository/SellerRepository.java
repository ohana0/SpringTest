package com.ohana0.test.jsp.repository;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ohana0.test.jsp.domain.Seller;

@Repository
public interface SellerRepository {

	public int insertSeller(
			@Param("nickname") String nickname
			,@Param("profileUrl") String profileUrl
			,@Param("temperature") double temperature);
	public Seller selectLastSeller();
	
	public Seller selectSeller(@Param("id") int id);

}

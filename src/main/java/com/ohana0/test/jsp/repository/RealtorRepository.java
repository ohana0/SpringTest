package com.ohana0.test.jsp.repository;

import org.springframework.stereotype.Repository;

import com.ohana0.test.jsp.domain.Realtor;

@Repository
public interface RealtorRepository {

	public int insertRealtor(Realtor realtor);
	
}

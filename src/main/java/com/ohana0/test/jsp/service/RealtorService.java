package com.ohana0.test.jsp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ohana0.test.jsp.domain.Realtor;
import com.ohana0.test.jsp.repository.RealtorRepository;

@Service
public class RealtorService {
	@Autowired
	RealtorRepository realtorRepository;
	
	
	
	
	public int addRealtor(Realtor realtor) {
		int count =  realtorRepository.insertRealtor(realtor);
		return count;
	}
	

}

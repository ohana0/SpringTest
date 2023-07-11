package com.ohana0.test.jsp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ohana0.test.jsp.repository.SellerRepository;

@Service
public class SellerService {
	@Autowired
	public SellerRepository sellerRepository();
}

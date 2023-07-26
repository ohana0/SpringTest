package com.ohana0.test.jpa.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ohana0.test.jpa.domain.Company;
import com.ohana0.test.jpa.repository.CompanyRepository;

@Service
public class CompanyService {

	@Autowired
	private CompanyRepository companyRepository;
	
	public Company addCompany(Company company) {
		company = companyRepository.save(company);
		return company;
	}

	public Company updateCompany(int id, String scale, int headcount) {
		Company company = companyRepository.findById(id).orElse(null);
		
		if(company != null) {
			company.toBuilder()
			.scale(scale)
			.headcount(headcount)
			.build();
			System.out.println(company.getScale());
			company = companyRepository.save(company);

		}
		return company;
	}

	public void deleteCompany(int id) {
		Company company = companyRepository.findById(id).orElse(null);
		if(company !=null) {
			companyRepository.delete(company);
		}
		
	}

	
}

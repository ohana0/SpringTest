package com.ohana0.test.ajax.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ohana0.test.ajax.domain.Faborite;
import com.ohana0.test.ajax.repository.FaboriteRepository;

@Service
public class FaboriteService {
	@Autowired
	public FaboriteRepository faboriteRepository;
	


	public List<Faborite> getFaboriteList() {
		List<Faborite> faboriteList = faboriteRepository.getFaboriteList();
		
		return faboriteList;
	}



	public int addFaborite(String name, String url) {
		int count = faboriteRepository.insertFaborite(name,url);
		return count;
	}



	public boolean isDuplicateUrl(String url) {
		int count = faboriteRepository.selectCountUrl(url);
		if(count > 0) {
			return true;
		}
		else {
			return false;
		}
		
	}



	public int deleteFaborite(int id) {
		int count = faboriteRepository.deleteFaborite(id);
		return count;
	}
	
}

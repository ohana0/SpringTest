package com.ohana0.test.database.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ohana0.test.database.domain.Store;

@Repository
public interface StoreRepository {
	public List<Store> selectStoreList();

}

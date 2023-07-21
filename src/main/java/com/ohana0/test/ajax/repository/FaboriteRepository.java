package com.ohana0.test.ajax.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ohana0.test.ajax.domain.Faborite;

@Repository
public interface FaboriteRepository {

	public List<Faborite> getFaboriteList();

	public int insertFaborite(@Param("name") String name, @Param("url") String url);

	public int selectCountUrl(@Param("url") String url);

	public int deleteFaborite(@Param("id") int id);

}

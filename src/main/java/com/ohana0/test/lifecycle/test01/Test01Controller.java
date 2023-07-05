package com.ohana0.test.lifecycle.test01;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/lifecycle/test01")
public class Test01Controller {
	
	@RequestMapping("/2")
	@ResponseBody
	public String test01() {
		return "<h2>테스트 프로젝트 완성</h2> <h4>해당 프로젝트를 통해서 문제 풀이를 진행 합니다.</h4>";
	}
	
	@RequestMapping("/3")
	@ResponseBody
	public Map<String,Integer> scoreData(){
		Map<String, Integer> scoreMap = new HashMap<>();
		scoreMap.put("국어",90);
		scoreMap.put("수학", 95);
		scoreMap.put("영어",100);
		
		return scoreMap;
		
	}
	
	
	
	
	
	

}

package com.ohana0.test.ajax;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ohana0.test.ajax.domain.Faborite;
import com.ohana0.test.ajax.service.FaboriteService;

@Controller
public class FaboriteController {
	
	@Autowired
	public FaboriteService faboriteService;
	
	@GetMapping("/faborite/list")
	public String getfaboriteList(Model model) {
		List<Faborite> faboriteList = faboriteService.getFaboriteList();
		
		model.addAttribute("faboriteList",faboriteList);
		return "/ajax/faborite/list";
	}
	@GetMapping("/faborite/input")
	public String inputFaborite() {
		return "/ajax/faborite/add_faborite";
	}
	@ResponseBody
	@PostMapping("/faborite/add")
	public Map<String,String> createFaborite(
			@RequestParam("name") String name
			,@RequestParam("url") String url
			){
		
		int count = faboriteService.addFaborite(name,url);
		Map<String,String> resultMap = new HashMap<>();
		if(count == 1) {
			resultMap.put("result", "success");
		}
		else {
			resultMap.put("result", "fail");
		}
		return resultMap;
		
		
		
	}
	@ResponseBody
	@GetMapping("/faborite/url_confirm")
	public Map<String,Boolean> duplicateUrl(@RequestParam("url") String url){
		
		Map<String, Boolean> resultMap = new HashMap<>();
		
		if(faboriteService.isDuplicateUrl(url)) {
			resultMap.put("result", true);
		}
		else {
			resultMap.put("result", false);
		}
		
		return resultMap;
	}
	
	
	@ResponseBody
	@PostMapping("/faborite/delete")
	public Map<String,String> deleteFaborite(@RequestParam("id") int id){
		int count = faboriteService.deleteFaborite(id);
		Map<String,String> resultMap = new HashMap<>();
		if(count == 1) {
			resultMap.put("result", "success");
		}
		else {
			resultMap.put("result","fail");
		}
		return resultMap;
	}
	
	
	
	
	
}

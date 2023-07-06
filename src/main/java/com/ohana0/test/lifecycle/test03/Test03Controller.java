package com.ohana0.test.lifecycle.test03;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Test03Controller {
	
	@RequestMapping("/lifecycle/test03")
	public String jspPage() {
		return "lifecycle/test03";
	}
}

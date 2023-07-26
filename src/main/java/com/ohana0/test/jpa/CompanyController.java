package com.ohana0.test.jpa;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ohana0.test.jpa.domain.Company;
import com.ohana0.test.jpa.service.CompanyService;

@RequestMapping("/jpa/company")
@Controller
public class CompanyController {

	@Autowired
	private CompanyService companyService;
	
	
	@RequestMapping("/insert")
	@ResponseBody
	public List<Company> createCompany() {
		
		List<Company> companyList = new ArrayList<>();
//		회사명 : 넥손
//		사업내용 : 컨텐츠 게임
//		규모 : 대기업
//		사원수 : 3585명
		Company company1 = Company.builder()
				.name("넥슨")
				.business("컨텐츠 게임")
				.scale("대기업")
				.headcount(3585)
				.build();
		companyService.addCompany(company1);
		companyList.add(company1);
		
//		회사명 : 버블팡
//		사업내용 : 여신 금융업
//		규모 : 대기업
//		사원수 : 6834명
		Company company2 = Company.builder()
				.name("버블팡")
				.business("여신금융업")
				.scale("대기업")
				.headcount(6834)
				.build();
		companyService.addCompany(company2);
		companyList.add(company2);
		
		return companyList;
	}
	
//	2. Update
//	버블팡이 극심한 경영 악화로 회사 정보가 변경되었다.
//	규모를 중소기업, 사원수를 34명 으로 수정하세요. (버블팡의 pk id번호로 업데이트 - workbench에서 조회)
//	수정된 내용을 아래와 같이 출력 하세요.
//	
	@ResponseBody
	@RequestMapping("/update")
	public Company updateCompany() {
		int id = 8;
		String scale="중소기업";
		int headcount = 34;
		Company company = companyService.updateCompany(id,scale,headcount);
		return company;
	}
	
	@ResponseBody
	@RequestMapping("delete")
	public String deleteCompany() {
		companyService.deleteCompany(8);
		return "삭제성공";
	}
	
	
	
}

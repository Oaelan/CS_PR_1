package org.hj.controller;

import javax.servlet.http.HttpSession;

import org.hj.model.ExVO;
import org.hj.service.ExService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class MainController {

	
	@Autowired
	ExService es;
	
	// 로그인 서버
	@PostMapping("/calender")
	public String login(HttpSession session, ExVO evo, Model model) {
		System.out.println("로그인서버");
		if (es.isLogin(evo) != null) {
			session.setAttribute("id", es.isLogin(evo).getId());
			session.setAttribute("name", es.showTName(evo).getName());
			model.addAttribute(session.getAttribute("id"));
			model.addAttribute(session.getAttribute("name"));
			System.out.println("로그인 성공");
			// 세션에 아이디 값 저장
			// redirect 다른 컨트롤러에있는 맵핑값으로 이동한다!!!!
			// 제발 잊어버리지마..
			return "calender";

		} else {
			System.out.println("로그인 실패");
			return "login";
		}

	}

	
}

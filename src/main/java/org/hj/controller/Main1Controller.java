package org.hj.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.hj.model.LoginVO;
import org.hj.model.ReservationVO;
import org.hj.service.LoginService;
import org.hj.service.ReservationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Main1Controller {
	@Autowired
	private LoginService ls;
	
	@Autowired
    private ReservationService rs;
    

	// 메인 페이지로 이동
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String goMain() {		
		System.out.println("메인 페이지로 이동");
		return "hospital";
	}
	
	
		
	/*// 환자 예약 페이지로 이동
	@RequestMapping(value = "/pReservation", method = RequestMethod.GET)
	public String pReservation() {
		System.out.println("환자 예약 페이지로 이동");
		return "pReservation";
	}*/
	
	// 로그인 페이지로 이동
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		System.out.println("로그인 페이지로 이동");
		return "login";
	}
	
	/*// 예약 정보 저장
	@RequestMapping(value = "/finish", method = RequestMethod.POST)
	public String putReserveInfo(ReservationVO rvo) {
		System.out.println("예약 완료");
		rs.putReserveInfo(rvo);
		return "finish";
	}*/
	
	// 로그인 성공 처리
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginSuccess(HttpSession session, LoginVO lvo, Model model) {
		System.out.println(ls.login(lvo));
		session.setAttribute("loginId", (ls.login(lvo)).getId());
		session.setAttribute("name", (ls.login(lvo)).getName());
		model.addAttribute("id",session.getAttribute("loginId"));
		model.addAttribute("name",session.getAttribute("name"));
		System.out.println(model);
		// 로그인 페이지 이동
		if (session.getAttribute("loginId") == null) {
			System.out.println("아이디 없어서 다시 로그인 페이지로");
			return "login";
		} 
		
		else {
			//로그인 후 환자일 경우 메인 페이지
			if(((ls.login(lvo)).getUserType()).equals("1")) {
				System.out.println("환자" + (ls.login(lvo)).getUserType());				
				return "hospital";	
			}
			
			//로그인 후 의사일 경우 스케줄 관리 페이지
			else {
				System.out.println("의사" + (ls.login(lvo)).getUserType());
				return "calender";	
			}
		}
	}
	
	// 로그아웃 처리
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginId");
		return "redirect:/";
	}
	
	// 환자 회원가입 페이지로 이동
	@RequestMapping(value = "/patient_join", method = RequestMethod.GET)
	public String join() {
		return "patient_join";
	}
	
	// 의사 회원가입 페이지로 이동
	@RequestMapping(value = "/doctor_join", method = RequestMethod.GET)
	public String doctor_join() {
		return "doctor_join";
	}
	
	// 환자 회원가입 처리
	@RequestMapping(value = "/patient_join", method = RequestMethod.POST)
	public String pjoinSuccess(LoginVO lvo) {
		System.out.println("환자 회원가입 성공");
		ls.pjoinSuccess(lvo);
		// 환자 회원가입 성공 후 로그인
		return "login";
	}
	
	// 의사 회원가입 처리
	@RequestMapping(value = "/doctor_join", method = RequestMethod.POST)
	public String djoinSuccess(LoginVO lvo) {
		System.out.println("의사 회원가입 성공");
		ls.djoinSuccess(lvo);
		// 의사 회원가입 성공 후 로그인
		return "login";
	}
	
	
	// 예약 페이지로 이동
		@RequestMapping(value = "/reservation", method = RequestMethod.GET)
		public String goReservation(Model model, HttpSession session, LoginVO lvo) {
			lvo.setId((String)session.getAttribute("loginId"));
			model.addAttribute("name",session.getAttribute("name"));
			model.addAttribute("birth",ls.reserveInfo(lvo).getBirth());
			//			model.addAttribute("birth",ls.login(lvo).getBirth());
			return "reservation";
		}
		
		
		
	// 예약 확인 페이지로 이동
	@RequestMapping(value = "/rvlist", method = RequestMethod.GET)
	public String goRvlist(ReservationVO rvo, Model model, LoginVO lvo, HttpSession session) {
		System.out.println("예약 확인 페이지로 이동");
		lvo.setId((String)session.getAttribute("loginId"));
		rvo.setTitle((String)session.getAttribute("name"));
		rvo.setBirth(ls.reserveInfo(lvo).getBirth());
		rs.selectReserveInfo(rvo);
		
		List<ReservationVO> reservations = rs.selectReserveInfo(rvo);

	    // tName과 start 값을 추출
	    List<String> tName = new ArrayList<>();
	    List<String> start = new ArrayList<>();
	    List<String> examination = new ArrayList<>();
	    List<String> no = new ArrayList<>();
	    
	    
	    for (ReservationVO reservation : reservations) {
	        tName.add(reservation.gettName());
	        start.add(reservation.getStart());
	        examination.add(reservation.getBackgroundColor());
	        no.add(Integer.toString(reservation.getNo()));
	    }
	    
		model.addAttribute("tName",tName);
		model.addAttribute("start",start);
		model.addAttribute("examination",examination);
		model.addAttribute("no",no);
		System.out.println(rs.selectReserveInfo(rvo));
		return "rvlist";
	}
		
}

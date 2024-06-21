package org.hj.controller;

import java.awt.PageAttributes.MediaType;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.hj.model.ExVO;
import org.hj.model.ReservationVO;
import org.hj.service.ExService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
public class ExRestController {

	public ExRestController() {
		// TODO Auto-generated constructor stub
	}

	@Autowired
	ExService es;

	// 의사별로 보여지는 스케쥴표

	@RequestMapping(value = "/api/doctor", produces = "application/json; charset=UTF-8", method = RequestMethod.GET)
	public ResponseEntity<String> getDoctorSchedule(ExVO evo, HttpSession session) throws JsonProcessingException {

		// ExVO에 로그인한 의사의 아이디 설정하기
		evo.setId((String) session.getAttribute("loginId"));

		// evo에 담긴 아이디 값을 변수로 던져주고 sql문을 실행하여 데이터 베이스에서 데이터 조회
		List<ReservationVO> schedule = es.showSchedule(evo);

		// 조회된 데이터를 json으로 변환
		// ObjectMapper는 JSON 데이터와 Java 객체 간의 변환을 수행하는 데 사용
		ObjectMapper objectmapper = new ObjectMapper();

		// writeValueAsString() 메서드 호출: ObjectMapper 인스턴스의 writeValueAsString() 메서드를
		// 사용하여
		// Java 객체를 JSON 문자열로 변환합니다. 이 메서드는 주어진 Java 객체를 JSON 형식의 문자열로 직렬화합니다.
		String doctorSchedule = objectmapper.writeValueAsString(schedule);

		// 셀렉트된 의사들의 스케쥴 확인
		//System.out.println(doctorSchedule);

		// HTTP 상태 코드 200(OK)를 갖는 응답을 생성하고, 응답의 본문으로 doctorSchedule 문자열을 포함하여 클라이언트에게
		// 반환하는 작업을 수행합니다.
		return ResponseEntity.ok(doctorSchedule);

	}

	// 의사가 일정 삭제
	@PostMapping("/api/deleteEvent")
	public ResponseEntity<String> cancelReservation(ReservationVO rvo, @RequestParam("eventId") int no) {
		rvo.setNo(no);
		es.deletSchedule(rvo);
		return ResponseEntity.ok ("Reservation with id " + no + " canceled successfully.");
	}

		// 병원 의사들의 전체적인 스케쥴이 나오게
		@PostMapping(value = "/api/allSchedules", produces = "application/json; charset=UTF-8")
		public ResponseEntity<String> allSchedules() throws JsonProcessingException {
			
			List<ReservationVO> allSchedule = es.allSchedules();
			ObjectMapper objectmapper = new ObjectMapper();
	
			String allSchedules = objectmapper.writeValueAsString(allSchedule);
			
			return ResponseEntity.ok(allSchedules);
		}
		
	// 의사가 일정 추가

	@PostMapping("/api/saveEvent")
	 public ResponseEntity<String> addSchedule(@RequestBody ReservationVO rvo, HttpSession session) throws JsonProcessingException {
		//System.out.println("Received Reservation: " + rvo); // 로그로 수신된 데이터 확인
        //System.out.println("Title: " + rvo.getTitle());
        //System.out.println("Start: " + rvo.getStart());
        //System.out.println("BackgroundColor: " + rvo.getBackgroundColor());
        //.out.println("Birth: " + rvo.getBirth());
		
		rvo.setDoctorId((String)session.getAttribute("loginId"));
		rvo.settName(es.selectTname(rvo).getName());
		es.addSchedule(rvo);
		
		return ResponseEntity.ok("일정추가 완료");
	}
	
	
	// 진료과 선택하면 해당 과 의사들 리스트 
	    @PostMapping(value = "/api/doctorList", produces = "application/json; charset=UTF-8")
	    public ResponseEntity<String> doctorList(ExVO evo) throws JsonProcessingException {
	        ArrayList<ExVO> doctorList = es.doctorList(evo); // es는 예시에서 사용한 서비스 클래스 객체
	        //ObjectMapper: Jackson 라이브러리의 ObjectMapper를 사용하여 Java 객체를 JSON 문자열로 변환합니다.
	        ObjectMapper objectMapper = new ObjectMapper();
	        String jsonDoctorList = objectMapper.writeValueAsString(doctorList);
	        return ResponseEntity.ok(jsonDoctorList);
	    }
	    
	    @PostMapping("/api/updateSchedule")
	    											//@RequestBody 어노테이션을 사용하여 JSON 데이터를 매핑합니다.
		 public ResponseEntity<String> updateSchedule(@RequestBody ReservationVO rvo) throws JsonProcessingException {		
			
	    	es.updateSchedule(rvo);	
	    	System.out.println(rvo);
			return ResponseEntity.ok("일정 수정을 완료하였습니다!");
		}
	}


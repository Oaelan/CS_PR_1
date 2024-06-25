package org.hj.controller;

import java.util.List;
import java.util.Map;

import org.hj.model.LoginVO;
import org.hj.model.ReservationVO;
import org.hj.service.DoctorTypeService;
import org.hj.service.ReservationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.PathVariable;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
public class ReserveController {

    @Autowired
    private DoctorTypeService dts;

    @Autowired
    private ReservationService rs;
    
    // 의사 유형에 따라 의사 목록을 가져오는 엔드포인트
    @GetMapping("/getDoctor")
    public List<LoginVO> getDoctor(@RequestParam("userType") String userType) {
        System.out.println("의사 목록 가져오는 컨트롤러");
        return dts.DoctorType(userType);
    }
    
    // 예약 정보를 저장하는 엔드포인트
    @PostMapping("/sendReserve")
    public ResponseEntity<String> sendReserve(@RequestBody ReservationVO rvo) {
        System.out.println("환자 예약 컨트롤러");
        // 예약 정보를 데이터베이스에 저장
        rs.putReserveInfo(rvo);
        return ResponseEntity.ok("예약 완료");
    }
    
    // 예약된 시간을 가져오는 엔드포인트
    @PostMapping("/getTime")
    public ResponseEntity<String> getTime(
    		@RequestParam("doctorId") String doctorId, 
    		ReservationVO rvo
    )throws JsonProcessingException {
        rvo.setDoctorId(doctorId);
        
    	System.out.println("시간 정보 받아오는 컨트롤러");
    	
        List<ReservationVO> allTime = rs.getTime(rvo);
		ObjectMapper objectmapper = new ObjectMapper();

		String allTimes = objectmapper.writeValueAsString(allTime);
        return ResponseEntity.ok(allTimes);
    }
    
    
    // 환자가 예약할 때 선생님을 선택했을 때 이름 들고오기
    /*
    @PostMapping(value = "/selectDoctor")
    public ResponseEntity<String> selectDoctor(@RequestBody Map <String, String> requestData,LoginVO lvo) {
        System.out.println("예약시 선생님 선택="+requestData);
        String id = requestData.get("id");
        lvo.setId(id);
        String docName = rs.selectDoctor(lvo).getName();
        System.out.println(docName);
        return ResponseEntity.ok(docName);
    }*/
    
    @GetMapping(value = "/selectDoctor/{selectedDoctorId}")
    public ResponseEntity<String> selectDoctor(@PathVariable("selectedDoctorId") String selectedDoctorId,LoginVO lvo) {
        System.out.println("예약시 선생님 선택="+selectedDoctorId);
//        String id = requestData.get("id");
        lvo.setId(selectedDoctorId);
        String docName = rs.selectDoctor(lvo).getName();
        System.out.println(docName);
        return new ResponseEntity<>(docName,HttpStatus.OK);
    }
    
   /* // 진료타입 받아오는 컨트롤러
    @GetMapping("/getExType")
    public String selectBack(@RequestParam("no") String no) {
        System.out.println("진료타입 받아오는 컨트롤러");
        return rs.selectBack(no);
    }*/
    
}

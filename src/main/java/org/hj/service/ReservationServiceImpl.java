package org.hj.service;

import java.util.List;

import org.hj.mapper.ReservationMapper;
import org.hj.model.LoginVO;
import org.hj.model.ReservationVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReservationServiceImpl implements ReservationService {
	
    @Autowired
    ReservationMapper rm;
	
    @Override
    public void putReserveInfo(ReservationVO rvo) {
        System.out.println("환자 예약 정보 저장");
        rm.putReserveInfo(rvo);
    }

    @Override
    public List<ReservationVO> getTime(ReservationVO rvo) { 	
        System.out.println("시간 정보 받아오기");
        System.out.println(rm.getTime(rvo));
        return rm.getTime(rvo);
    }
    
    @Override
    public LoginVO selectDoctor(LoginVO lvo) {
    	System.out.println("예약할 선생님 이름:" + rm.selectDoctor(lvo).getName() );
    return rm.selectDoctor(lvo);
    }
    
    @Override
    public List<ReservationVO> selectReserveInfo(ReservationVO rvo){
    	System.out.println("예약된 정보:" + rm.selectReserveInfo(rvo));
    	return rm.selectReserveInfo(rvo);
    }

    @Override
    public List<ReservationVO> selectBack(int no) {
    	System.out.println(no);
    	System.out.println("백서비스: "+rm.selectBack(no));
    	return rm.selectBack(no);
    }
}

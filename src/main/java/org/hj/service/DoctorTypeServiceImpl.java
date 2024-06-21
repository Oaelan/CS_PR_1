package org.hj.service;

import java.util.List;

import org.hj.mapper.DoctorTypeMapper;
import org.hj.model.LoginVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DoctorTypeServiceImpl implements DoctorTypeService{
	 @Autowired
	    private DoctorTypeMapper dtm;

	    @Override
	    public List<LoginVO> DoctorType(String userType) {
	        System.out.println("의사 목록 가져오는 서비스 호출");
	        return dtm.DoctorType(userType);
	    }
}

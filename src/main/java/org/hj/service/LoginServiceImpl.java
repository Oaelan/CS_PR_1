package org.hj.service;

import org.hj.mapper.LoginMapper;
import org.hj.model.LoginVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService {
	
    @Autowired
    LoginMapper lm;
	
    @Override
    public LoginVO login(LoginVO lvo) {
        System.out.println("login service 호출..");
        return lm.login(lvo);
    }
	
    @Override
    public void pjoinSuccess(LoginVO lvo) {
        lm.pjoinSuccess(lvo);
        System.out.println("회원가입 성공");
    }
	
    @Override
    public void djoinSuccess(LoginVO lvo) {
        lm.djoinSuccess(lvo);
        System.out.println("회원가입 성공");
    }
    
    @Override
    public LoginVO reserveInfo(LoginVO lvo) {
    	System.out.println("예약 정보 받기 서비스");
    	return lm.reserveInfo(lvo);
    }
}

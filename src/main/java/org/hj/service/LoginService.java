package org.hj.service;

import org.hj.model.LoginVO;


public interface LoginService {

	public LoginVO login(LoginVO lvo);
	
	public void pjoinSuccess(LoginVO lvo);
	
	public void djoinSuccess(LoginVO lvo);

	public LoginVO reserveInfo(LoginVO lvo);
	
	public void deleteUser(LoginVO lvo);
	
}

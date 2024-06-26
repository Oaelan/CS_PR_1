package org.hj.mapper;

import org.hj.model.LoginVO;

public interface LoginMapper {

	public LoginVO login(LoginVO lvo);
	
	public void pjoinSuccess(LoginVO lvo);
	
	public void djoinSuccess(LoginVO lvo);
	
	public LoginVO reserveInfo(LoginVO lvo);
	
	public void deleteUser(LoginVO lvo);
	
}

package org.hj.service;

import java.util.List;

import org.hj.model.LoginVO;

public interface DoctorTypeService {
	List<LoginVO> DoctorType(String userType);
}

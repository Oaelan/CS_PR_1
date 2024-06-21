package org.hj.mapper;

import java.util.List;

import org.hj.model.LoginVO;

public interface DoctorTypeMapper {
	public List<LoginVO> DoctorType(String userType);
}

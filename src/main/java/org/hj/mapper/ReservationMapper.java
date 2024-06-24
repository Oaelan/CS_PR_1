package org.hj.mapper;

import java.util.List;

import org.hj.model.LoginVO;
import org.hj.model.ReservationVO;

public interface ReservationMapper {
	public void putReserveInfo(ReservationVO rvo);
	
	public List<ReservationVO> getTime(ReservationVO rvo);
	
	public LoginVO selectDoctor(LoginVO lvo);
	
	public List<ReservationVO> selectReserveInfo(ReservationVO rvo);

	public List<ReservationVO> selectBack(int no);
}

package org.hj.mapper;

import java.util.ArrayList;

import org.hj.model.LoginVO;
import org.hj.model.ReservationVO;

public interface ExMapper {

	public  ArrayList<LoginVO> showData();
	
	public  ArrayList<ReservationVO> showSchedule(LoginVO lvo);
	
	public void deletSchedule(ReservationVO rvo);
	
	public  ArrayList<ReservationVO> allSchedules();
	
	public void addSchedule(ReservationVO rvo);
	
	public  LoginVO selectTname(ReservationVO rvo);

	public  ArrayList<LoginVO> doctorList(LoginVO lvo);
	
	public void updateSchedule(ReservationVO rvo);
	
	public void scheduleRequsestOk(ReservationVO rvo);
	
	public LoginVO showTName(LoginVO lvo);
	
	public LoginVO isLogin(LoginVO lvo);
	
	public LoginVO doctorIdForUpdate(LoginVO lvo);
	
	public void scheduleRequsest(ReservationVO rvo);
	
	public ArrayList<ReservationVO> scheduleRequsestList(ReservationVO rvo);
	
	public void scheduleRequsestColorChange(ReservationVO rvo);
	
	public ReservationVO scheduleRequsestDocName(ReservationVO rvo);

	public void rejectSchedule(ReservationVO rvo);
	
	public void rejectScheduleRequest(ReservationVO rvo);
	
	public ReservationVO sendScheduleRequestCheck(ReservationVO rvo);
	
	
}


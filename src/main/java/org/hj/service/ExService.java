package org.hj.service;

import java.util.ArrayList;

import org.hj.model.ExVO;
import org.hj.model.ReservationVO;

public interface ExService {

	public ArrayList<ExVO> showData();

	public ArrayList<ReservationVO> showSchedule(ExVO evo);

	public void deletSchedule(ReservationVO rvo);

	public ArrayList<ReservationVO> allSchedules();

	public void addSchedule(ReservationVO rvo);

	public ExVO selectTname(ReservationVO rvo);

	public ArrayList<ExVO> doctorList(ExVO evo);

	public void updateSchedule(ReservationVO rvo);

	public ExVO showTName(ExVO evo);

	public ExVO isLogin(ExVO evo);
	
	public ExVO doctorIdForUpdate(ExVO evo);
}

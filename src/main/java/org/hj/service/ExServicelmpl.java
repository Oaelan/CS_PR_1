package org.hj.service;

import java.util.ArrayList;

import org.hj.mapper.ExMapper;
import org.hj.model.ExVO;
import org.hj.model.ReservationVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service

public class ExServicelmpl implements ExService {

	public ExServicelmpl() {
		// TODO Auto-generated constructor stub
	}

	@Autowired
	ExMapper exm;

	public ArrayList<ExVO> showData() {
		return exm.showData();
	};

	public ArrayList<ReservationVO> showSchedule(ExVO evo) {

		return exm.showSchedule(evo);
	}

	public void deletSchedule(ReservationVO rvo) {
		exm.deletSchedule(rvo);
	}

	public ArrayList<ReservationVO> allSchedules() {
		return exm.allSchedules();
	}

	public void addSchedule(ReservationVO rvo) {
		exm.addSchedule(rvo);
	}

	public ExVO selectTname(ReservationVO rvo) {
		return exm.selectTname(rvo);
	}

	public ArrayList<ExVO> doctorList(ExVO evo) {
		return exm.doctorList(evo);
	}

	public void updateSchedule(ReservationVO rvo) {
		exm.updateSchedule(rvo);
	}

	public ExVO showTName(ExVO evo) {
		return exm.showTName(evo);
	}

	public ExVO isLogin(ExVO evo) {
		return exm.isLogin(evo);
	}
	
	public ExVO doctorIdForUpdate(ExVO evo) {
		return exm.doctorIdForUpdate(evo);
	}
}

package com.internousdev.beautifulworlds.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.beautifulworlds.dao.ReserveDAO;
import com.internousdev.beautifulworlds.dto.CalendarDTO;
import com.internousdev.beautifulworlds.dto.ReserveDTO;
import com.internousdev.beautifulworlds.dto.TimeDTO;
import com.opensymphony.xwork2.ActionSupport;

import lombok.Getter;
import lombok.Setter;
@Getter @Setter
public class ReservationListAction extends ActionSupport  implements SessionAware {
	public Calendar cal = Calendar.getInstance();
	public List<ReserveDTO> reservationList = new ArrayList<ReserveDTO>();
	public List<CalendarDTO> calendarList = new ArrayList<CalendarDTO>();
	public List<TimeDTO> timeList = new ArrayList<TimeDTO>();
	private Map<String,Object> session;
	private int staffId;

	public String execute() throws SQLException{
		ReserveDAO dao = new ReserveDAO();
		reservationList = dao.selectAllReservation(staffId);
		session.put("reservationList", reservationList);
		if(!session.containsKey("calendarList")){
			SetCalender();
		}
		if(!session.containsKey("timeList")){
			SetTimeList();
		}
		return SUCCESS;
	}

	public void SetCalender(){
		String dayOfWeek;
		for(int i = 0;i<7;i++){
			int day=cal.get(Calendar.DATE);
			int month =cal.get(Calendar.MONTH)+1;
			int num = cal.get(Calendar.DAY_OF_WEEK);
			session.put("today", day);
			CalendarDTO calendardto = new CalendarDTO();
			if(num == 1){
				dayOfWeek = "（日）";
			}else if(num == 2){
				dayOfWeek = "（月）";
			}else if(num == 3){
				dayOfWeek = "（火）";
			}else if(num == 4){
				dayOfWeek = "（水）";
			}else if(num == 5){
				dayOfWeek = "（木）";
			}else if(num == 6){
				dayOfWeek = "（金）";
			}else{
				dayOfWeek = "（土）";
			}
			calendardto.setDay(day);
			calendardto.setMonth(month);
			calendardto.setDayOfWeek(dayOfWeek);
			calendarList.add(calendardto);
			cal.add(Calendar.DAY_OF_MONTH, 1);
			session.put("calendarList", calendarList);
		}
	}
	public void SetTimeList(){
		cal.set(Calendar.HOUR_OF_DAY, 10);
		cal.set(Calendar.MINUTE, 00);
		for(int i=0;i<24;i++){
			TimeDTO timedto = new TimeDTO();
			int hour =cal.get(Calendar.HOUR_OF_DAY);
			int minute = cal.get(Calendar.MINUTE);
			String stminute=null;
			if(minute ==0){
				stminute="00";
			}else if(minute ==30){
				stminute="30";
			}
			timedto.setHour(hour);
			timedto.setMinute(minute);
			timedto.setStminute(stminute);
			timeList.add(timedto);
			cal.add(Calendar.MINUTE,30);
			System.out.println(hour + "時"+minute+"分");
			session.put("timeList", timeList);
		}
	}
}

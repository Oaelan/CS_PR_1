<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset='utf-8' />
<!-- Bootstrap CSS -->
<link href="../resources/CSS/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery 로드 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- fullcalendar 로드 -->
<script src='https://cdn.jsdelivr.net/npm/@fullcalendar/core@6.1.14/index.global.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/@fullcalendar/daygrid@6.1.14/index.global.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/@fullcalendar/timegrid@6.1.14/index.global.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/@fullcalendar/list@6.1.14/index.global.min.js'></script>
<style>
#calendar {
	width: 70%;
}

#shall {
	width: 100%;
	height: 100%;
	padding: 30px;
	display: flex;
	justify-content: center;
	align-items: center;
	display: flex;
	gap: 100px;
}

.fc-allButton-button {
	min-width: 60px;
	/* 버튼 너비 고정 */
}

.fc-dayGridMonth-button, .fc-dayGridWeek-button, .fc-dayGridDay-button,
	.fc-today-button {
	text-transform: uppercase !important;
	/* 텍스트 대문자로 변환 */
}

#loginInfo {
	display: flex;
	justify-content: space-between;
	align-items: center;
	flex-direction: column;
	padding: 20px;
	gap: 15px;
	border: 1px solid black;
	border-right: none;
	border-left: none;
	color: black;
}

#loginInfoShall {
	gap: 10px;
	display: flex;
	flex-direction: column;
	height: 783px;
	display: flex;
}

#scheduleView {
	border: 1px solid black;
	border-right: none;
	border-left: none;
	border-top: none;
	font-weight: bold;
	display: flex;
	flex-direction: column;
	gap: 10px;
	justify-content: center;
	align-items: center;
	padding-bottom: 10px;
}

#selectDate {
	padding: 0px 5px 0px 5px;
}

#confirmChangeSch {
	padding-bottom:10px;
	gap:20px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	border: 1px solid black;
	border-right: none;
	border-left: none;
	border-top: none;
}

#scheduleViewTitle, #confirmChangeSchTitle {
	font-weight: bold;
}
#requestChangeschs{
display: flex;
gap:5px;
}
/*  공휴일 이벤트 스타일 
.fc-event-holiday {
	background-color: rgb(252, 109, 109);  배경색을 빨간색으로 설정 
	color: rgb(255, 255, 255);  텍스트 색상을 흰색으로 설정 
} */

/*달 스타일*/
#fc-dom-1 {
	font-weight: bold;
}

a {
	color: black;
	text-decoration: none;
}

/*일요일날짜 색상*/
.fc-day-sun>.fc-daygrid-day-frame>.fc-daygrid-day-top>.fc-daygrid-day-number
	{
	color: white !important;
}

.fc-day-sun>.fc-scrollgrid-sync-inner>.fc-col-header-cell-cushion {
	color: white !important;
}
/*토요일날짜 색상*/
.fc-day-sat>.fc-daygrid-day-frame>.fc-daygrid-day-top>.fc-daygrid-day-number
	{
	color: white !important;
}

.fc-day-sat>.fc-scrollgrid-sync-inner>.fc-col-header-cell-cushion {
	color: white !important;
}
/*주말 제외 날짜 색상*/
.fc .fc-daygrid-day-number {
	color: black;
}

*[aria-label="일요일"], *[aria-label="토요일"] {
	color: white;
	/* 예시: 텍스트 색상을 빨간색으로 설정 */
}

*[aria-label="월요일"], *[aria-label="화요일"], *[aria-label="수요일"], *[aria-label="목요일"],
	*[aria-label="금요일"] {
	color: black;
}

.fc-day-mon, .fc-day-tue, .fc-day-wed, .fc-day-thu, .fc-day-fri {
	background-color: white;
	/* 배경색을 파란색으로 설정 */
}

/* 주말 날짜 스타일 */
.fc-day-sat /* 토요일 */ {
	background-color: rgb(49, 193, 101);
}

.fc-day-sun {
	background-color: rgb(16, 145, 109);
}

/*일정 색상 변경*/
.fc-event-title {
	color: navy;
}

/*일정시간 색상 변경*/
.fc-event-time {
	color: black;
}
/*타이틀 양옆에 이전달 다음달 버튼 추가*/
.fc-toolbar-chunk:nth-child(2) {
	display: flex;
}

.fc .fc-toolbar-title {
	margin: 0px 9px 0px 0px;
}
</style>
<script> document.addEventListener('DOMContentLoaded', function() {   
    // all/me 유무 로그인시 디폴트값 ME
    var allOrMe = "ME";   
    // 로그인시 가져오는 일정 데이터 
	var jsonData;
	// 상태 변수 추가
	var isShowingAll = false; 	
	//현재 로그인한 의사 아이디
	var isLoginedId = document.getElementById("doctorLoginId").value;
	//일정에 존재하는 담당의 
	var nowDoctorId = document.getElementById('editEventDoctorId');

	// 로그인한 의사의 수정요청 리스트를 불러오는 함수
	function scheduleRequsestList() {
	    $.ajax({
	        url: "/api/scheduleRequsestList", // 서버 API 경로로 변경하십시오.
	        method: 'GET',
	        data: { doctorId: isLoginedId },
	        success: function(response) {
	           // console.log(response);

	            // 받은 요청을 표시하는 컨테이너
	            var container = document.querySelector('.requestChangeschs');
	            // 기존 내용을 비웁니다.
	            container.innerHTML = '';

	            response.forEach(function(item) {
	                var requestDiv = document.createElement('div');
	                requestDiv.className = 'requestItem'; // 요청 항목의 클래스 이름

	                var label = document.createElement('label');
	                label.textContent = item.start;
	               	              
	                requestDiv.appendChild(label);
	               
	                container.appendChild(requestDiv);
	                
	                var endTime = item.end || ''; // endTime 변수 정의, 없을 경우 빈 문자열 설정
	           					
	                // 요청받은 수정 스케줄 요소에 클릭 이벤트 추가 
	                requestDiv.addEventListener('click', function() {	                   	                    
	                 // 서버로 데이터 전송
	    				$.ajax({
	    					type: 'GET',
	    					url: '/api/beforChangeSchtName', // 저장할 데이터를 처리하는 서버의 엔드포인트
	    					contentType: 'application/json; charset=utf-8', // 요청의 Content-Type 설정
	    					dataType: 'json',
	    					data: { reservedNo: item.reservedNo }, 	    			
	    					success: function(response) {
	    						// console.log('수정 전 일정의 담당의 의사 이름:', response);	    			
	    						 // 모달 창에 상세 내용을 추가합니다.                  
	    	                    var detailContent = document.getElementById('detailContent');
	    	                   	detailContent.innerHTML = "<p><strong>의사 이름: </strong>" + response.tName + "</p>"
	    						+"<p><strong>환자 이름: </strong>" + item.title + "</p>"
	    						+"<p><strong>일정 날짜: </strong>" + item.start + " ~ " + endTime.substring(endTime.length - 8) + "</p>"	                                            
	    	                    // 모달 창 열기
	    	                    $('#detailModal').modal('show');
	    						$('#acceptBtn').off('click').on('click', function() {
	    						    $.ajax({
	    						        url: '/api/updateSchedule',
	    						        type: 'POST',
	    						        data: JSON.stringify(item),
	    						        contentType: 'application/json',
	    						        success: function(response) {
	    						            console.log(response);
	    						            calendar.addEvent(item); // 캘린더에 이벤트 추가
	    						            

	    						            $('#detailModal').modal('hide'); // 상세 모달 닫기
	    						            // 해당 이벤트가 일어나면 화면에 보이는 수정 목록 사라지게 하기
	    						            requestDiv.remove();
	    						        },
	    						        error: function(xhr, status, error) {
	    						            console.error("수정 요청에 실패하였습니다.", error);
	    						        }
	    						    });
	    						});

	    						
	    						$('#rejectBtn').click(function() {
	    						    
	    						    $.ajax({
	    			                    url: '/api/rejectSchedule',
	    			                    type: 'POST', // 요청 유형 (POST, GET 등)
	    			                    data: JSON.stringify(item), // 전송할 데이터 (JSON 형식)
	    			                    contentType: 'application/json', // 요청의 콘텐츠 유형
	    			                    success: function(response) {
	    			                        // 요청이 성공했을 때 실행할 코드
	    			                        console.log(response);    	                     
	    			                        $('#detailModal').modal('hide');
	    			                     	// 해당 이벤트가 일어나면 화면에 보이는 수정 목록 사라지게 하기
	    			                        requestDiv.remove(); 
	    			                        
	    			                        
	    			                    },
	    			                    error: function(xhr, status, error) {
	    			                        // 요청이 실패했을 때 실행할 코드
	    			                        console.log("수정 요청 거절에 실패하였습니다.");
	    			                    }
	    			                });
	    						});    
	    						
	    						
	    					},
	    					error: function(err) {
	    						console.error('수정 전 일정의 담당의 의사 이름을 들고오지 못했습니다.', err);  						
	    					}
	    				});	
	                    
	                    
	                   
	                });
	            });
	        },
	        error: function(xhr, status, error) {
	            console.error("Error fetching schedule requests:", status, error);
	        }
	    });
	}


	
	//로그인한 의사의 스케줄을 불러오는 함수
	function loadDoctorSchedule() {	       
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "/api/doctor", true);
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4 && xhr.status === 200) {
			    //console.log(xhr)
				jsonData = JSON.parse(xhr.responseText, 'utf-8');
				calendar.removeAllEvents(); // 기존 이벤트 제거
				calendar.addEventSource(jsonData); // 새로운 이벤트 추가
				isShowingAll = false; // 상태 변수 업데이트
				updateButtonText(); // 버튼 텍스트 업데이트		
				//console.log(isLoginedId)				
			}
		};
		xhr.send();
	}
	
	// 의사가 스케쥴을 수정할 때 진료과 선택 후 불러오는 의사이름
	 const deptSelect = document.getElementById("editEventDeptId");
     const doctorSelect = document.getElementById("editEventTname");   
     deptSelect.addEventListener("change", function() {
         const selectedDeptId = deptSelect.value;
	       
         // 진료과가 선택되었을 경우
         if (selectedDeptId) {
             // 셀렉트 박스 초기화
             doctorSelect.innerHTML = '<option disabled selected value="0" id="chooseDoc" >의사 선택</option>';
             // 서버에 선택된 진료과 ID를 보내고, 해당 진료과의 의사 목록을 받아옵니다.
             $.ajax({
                 url: '/api/doctorList', // 서버 API 경로로 변경하십시오.
                 method: 'POST',
                 data: { userType: selectedDeptId },
                 success: function(response) {
                     
                     //console.log(response)
                     // 의사 목록을 업데이트합니다.                     
                     response.forEach(response => {               
                         const option = document.createElement("option");
                         option.value = response.id;
                         option.textContent = response.name;
                         doctorSelect.appendChild(option);
                     }); 	 
                 },
                 error: function(xhr, status, error) {
                     
                     console.error("Error fetching doctors:", status, error);
                 }
             });
         }
     });
	// 모든 의사의 스케줄을 불러오는 함수
	function loadAllSchedules() {
		var xhr = new XMLHttpRequest();
		xhr.open("POST", "/api/allSchedules", true);
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4 && xhr.status === 200) {
				var allScheduleJson = JSON.parse(xhr.responseText, 'utf-8');
				// 이전 이벤트 제거
				calendar.removeAllEvents();
				// 배열의 각 요소에 대해 반복하면서 title 필드에 tName 값을 더해줌
				allScheduleJson.forEach(function(item) {
					item.title = item.tName + ' 의사';
					//console.log(item)
					// 의사 이름에 대한 스타일 지정
				});
				// 새로운 이벤트 데이터 추가
				calendar.addEventSource(allScheduleJson);
				// 상태 변수 업데이트
				isShowingAll = true;
				// 버튼 텍스트 업데이트
				updateButtonText();
			}
		};
		xhr.send();
	}
	// 버튼 텍스트를 업데이트하는 함수
	function updateButtonText() {
		var button = document.querySelector('.fc-allButton-button');
		if (button) { // 버튼이 존재할 때만 실행
			if (isShowingAll) {
				button.textContent = 'ME'; // 모든 스케줄을 보고 있는 경우
			} else {
				button.textContent = 'ALL'; // 로그인한 의사의 스케줄을 보고 있는 경우
			}
		}
	}
	
	// 수정할때 모달에 해당 일정 정보 채워넣기
	function fillEditModal(eventData) {
		// 전달받은 일정 정보를 사용하여 모달 내용을 채워 넣습니다.
		
		document.getElementById('editEventTitle').value = eventData.title;
		document.getElementById('editEventTime').value = eventData.time;
		document.getElementById('editEventDate').value = eventData.date;
		document.getElementById('editEventBirth').value = eventData.birth;
		nowDoctorId.value = eventData.id;

		
		// 진료유형에 따라 라디오 버튼 선택 상태를 설정합니다.
	    var surgeryRadio = document.getElementById('editEventTypeSurgery');
	    var generalRadio = document.getElementById('editEventTypeRegular');
	    
	    if (eventData.backgroundColor === 'green') {
	        surgeryRadio.checked = true;
	        generalRadio.checked = false;
	    } else if (eventData.backgroundColor === 'blue') {
	        surgeryRadio.checked = false;
	        generalRadio.checked = true;
	    }

		document.getElementById('editEventNowTname').value = eventData.tName;
	}
	

	
	// Save Event Button click handler
	document.getElementById('saveEventBtn').addEventListener('click', function() {
		var title = document.getElementById('eventTitle').value;
		var birth = document.getElementById('eventBirth').value;
		var dateStr = document.getElementById('eventDate').value;
		var timeStr = document.getElementById('eventTime').value;
		// Date 객체 생성
		var dateTimeStr = dateStr + 'T' + timeStr; // "YYYY-MM-DDTHH:MM:SS" 형식
		// 수술 / 일반 진료 타입
		var eventType = document.querySelector('input[name="backgroundColor"]:checked').value;
		// 추가된 일정의 정보
		var addReservation = {
			title: title,
			start: dateTimeStr,
			backgroundColor: eventType,
			birth: birth
		};
		//console.log(JSON.stringify(addReservation))
		// JavaScript Date 객체로 변환 (브라우저의 지역 시간대 사용)
		var date = new Date(dateTimeStr);
		// 유효한 날짜인지 확인	
		if (title && birth && dateStr && timeStr && eventType){ 		
				calendar.addEvent({
					title: title,
					start: dateTimeStr,
					backgroundColor: eventType,
				});
		
				// 서버로 데이터 전송
				$.ajax({
					type: 'POST',
					url: '/api/saveEvent', // 저장할 데이터를 처리하는 서버의 엔드포인트
					data: JSON.stringify(addReservation), // JSON 형태로 데이터 전송
					contentType: 'application/json',
					success: function(response) {
						console.log('Event saved successfully:', response);
						$('#addEventModalOk').modal('show');
					},
					error: function(err) {
						console.error('Error saving event:', err);
						$('#invalidEventModal').modal('show');
					}
				});
				
				var addEventModal = bootstrap.Modal.getInstance(document.getElementById('addEventModal'));
				addEventModal.hide();
				// 입력 필드 초기화
				document.getElementById('eventTitle').value = '';
				document.getElementById('eventDate').value = '';
				document.getElementById('eventTime').value = '';
				document.getElementById('eventBirth').value = '';
				nowDoctorId.value='';
				
				$('input[name="eventType"]').prop('checked', false); // 라디오 버튼 초기화
			
		}else{
		    $('#invalidEventModal').modal('show')
		}
	}); 
	
	// 일정 조회
	document.getElementById('selectDate').addEventListener('change', function() {
        //선택한 날짜
    	var selectedDate = this.value;        
        // 선택한 날짜로 이동
        calendar.gotoDate(selectedDate);
        
    	 // 모든 이벤트 가져오기
        var events = calendar.getEvents();
    	 
        // 선택한 날짜의 스케줄들을 가지는 배열
        var selectedEvents = events.filter(event => {
            var eventDate = event.start;
            //event.start는 Date 객체이므로 toISOString() 메서드를 사용해 ISO 형식의 문자열로 변환한 후,
            //split('T')[0]를 통해 "YYYY-MM-DD" 형식의 날짜 문자열을 추출합니다.
            var eventDateStr = eventDate.toISOString().split('T')[0];
            return eventDateStr === selectedDate;
        });
		
        //일정이 존재할 때
        if (selectedEvents.length > 0) {
            
            var selectScheduel = selectedDate +" 날짜에는 " + selectedEvents.length+"개의 일정이 있습니다."
            // 결과 모달에 일정 개수와 상세 내용 표시
            var modalBody = document.getElementById('scheduleResultText');
            modalBody.innerHTML = '<p>'+selectScheduel+'</p>';
        	 // 결과 모달 열기
           $('#scheduleResultModal').modal('show')
        } else {// 일정이 존재하지 않을 때
            // 결과 모달에 일정이 없다는 메시지 표시
            var modalBody = document.getElementById('scheduleResultText');
            modalBody.innerHTML = '<p>'+ selectedDate + ' 날짜에는 일정이 존재하지 않습니다.</p>';
         	// 결과 모달 열기
            $('#scheduleResultModal').modal('show')
        }

       
    });
	
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
		initialView: 'dayGridMonth', // 초기 뷰 설정
		headerToolbar: { // 헤더 툴바 설정
			start: 'today addSchedule',
			center: 'prev, title ,next',
			end: 'allButton,dayGridMonth,dayGridWeek,dayGridDay'
		},
		
		eventClick: function(info) {
		    if (allOrMe === 'ALL') {
		        // allOrMe 변수의 값이 "ALL"일 때 실행되지 않도록 설정
		        $('#viewingAllSchedulesModal').modal('show')
                return false; // 이벤트 실행 취소		        
		    }else{
		 	// 수정할 일정의 정보를 가져옵니다.
			var date = new Date(info.event.start);
			// 날짜 부분 추출 (년-월-일 형식)
			var year = date.getFullYear();
			var month = ('0' + (date.getMonth() + 1)).slice(-2); // 월은 0부터 시작하므로 +1 해주고 두 자리로 포맷팅
			var day = ('0' + date.getDate()).slice(-2); // 일자도 두 자리로 포맷팅
			// 날짜를 YYYY-MM-DD 형식으로 결합
			var formattedDate = year + '-' + month + '-' + day;
			// 시간 부분 추출 (시:분 형식)
			var hours = ('0' + date.getHours()).slice(-2); // 시간을 두 자리로 포맷팅
			var minutes = ('0' + date.getMinutes()).slice(-2); // 분을 두 자리로 포맷팅
			// 시간을 HH:MM 형식으로 결합
			var formattedTime = hours + ':' + minutes;
			var eventData = {
				no: info.event.extendedProps.no,
				id: info.event.extendedProps.doctorId,
				birth: info.event.extendedProps.birth,
				title: info.event.title,
				date: formattedDate,
				time: formattedTime,
				start: info.event.start,
				tName : info.event.extendedProps.tName,
				backgroundColor: info.event.backgroundColor,				
				// 기타 등등 일정에 관련된 정보들을 가져올 수 있습니다.
			};
			
			//console.log(eventData)
			
			var formattedStartDate = info.event.start.toISOString().slice(0, 10); // 예: YYYY-MM-DD 형식
			// '의사'라는 단어가 포함되어 있는지 확인
			var isDoctor = info.event.title.includes('의사');
			// 메시지를 조건에 따라 동적으로 생성
			// isDoctor가 '의사'를 포함할때 '', 아닐 때는 ' 환자의'
			var message = info.event.title + (isDoctor ? '의 ' : ' 환자의 ') + formattedStartDate + ' 진료일정을 삭제하시겠습니까?';
			// 삭제/수정 여부 물어보기
			$('#confirmModal').modal('show');
			
			// 삭제 버튼을 눌렀을 경우 
				document.getElementById('modal-delete-btn').addEventListener('click', function() {			    
				    $('#confirmModal').modal('hide');
				    
				    if(info.event.backgroundColor == "red"){
				         $('#requestStatusModal').modal('show');
				    }else{
				        // 삭제 여부 한번 더 묻기
					    $('#deleteModal').modal('show');
				    }
				
				});
			
			
			
				$('#delete-event-btn').off('click').on('click', function() {
				    if(info.event.extendedProps.doctorId == document.getElementById("doctorLoginId").value) {
				        $.ajax({
				            type: 'POST',
				            url: '/api/deleteEvent',
				            data: {
				                eventId: info.event.extendedProps.no
				            },
				            success: function(response) {
				                // 선택한 일정의 의사와 로그인한 의사의 일치하면 삭제 진행
				                console.log(allOrMe);
				                console.log('일정이 삭제되었습니다.');
				                // FullCalendar에서 이벤트 삭제
				                info.event.remove();
				                $('#deleteModal').modal('hide');
				                $('#scheduleDeletedModal').modal('show');
				            }
				        });
				    } else {
				        $('#deleteModal').modal('hide');
				        $('#notYourScheduleModal').modal('show');
				    }
				});
									    			
			//수정 버튼 누르면 수정모달 띄우기			
			$('#modal-edit-btn').off('click').on('click', function() {						    

				//수정 삭제 여부 모달 닫기
				$('#confirmModal').modal('hide');					
				// 수정 중인 요청이라면 
				if(info.event.backgroundColor == "red"){
				    console.log(info.event.backgroundColor)
				    $('#requestStatusModal').modal('show');
				    
			    }else{
			    	 // 수정모달 띄우기
					$('#editEventModal').modal('show');
					 console.log(info.event.backgroundColor)
					// 모달 내용을 동적으로 변경할 수 있도록 전달한 정보를 모달에 채워 넣습니다.					
					fillEditModal(eventData);	
			    }
							
				});
				
				
			
				
			// 수정하기 버튼 클릭 이벤트 핸들러
			$('#updateEventBtn').off('click').on('click', function() {
			    $('#editEventModal').modal('show'); // 수정 모달 띄우기

			    // 선택된 옵션의 텍스트와 value 가져오기
			    var selectedODoctorName = doctorSelect.options[doctorSelect.selectedIndex].text;
			    var selectedODoctorId = doctorSelect.value;
			    var selectedBackgroundColor = document.querySelector('input[name="editEventType"]:checked').value;

			    // 수정할 일정 정보 객체 생성
			    var updateStart = new Date(info.event.start).toISOString().slice(0, 19).replace('T', ' ');
			    var updateSchedule = {
			        no: info.event.extendedProps.no,
			        birth: info.event.extendedProps.birth,
			        title: info.event.title,
			        start: updateStart,
			        doctorId: selectedODoctorId,
			        tName: selectedODoctorName,
			        backgroundColor: selectedBackgroundColor,
			        active: false
			    };

			    // 로그인한 의사와 일정의 의사 아이디가 일치하는지 확인
			    if (nowDoctorId.value == isLoginedId) {
			        var departmentType = document.getElementById("editEventDeptId");
			        var chooseDoc = document.getElementById("editEventTname");
			        //console.log(departmentType.value)
				    //console.log(chooseDoc.value)
			        // 진료과와 담당 의사가 선택되었는지 확인
			        if (departmentType.value == "0" && chooseDoc.value == "0") {
			            $('#selectDoctorModal').modal('show'); // 선택 모달 띄우기
			        } else {
			            // 수정 요청 보내기 전에 검증 과정 추가
			            $.ajax({
			                type: 'POST',
			                url: '/api/sendScheduleRequestCheck',
			                data: JSON.stringify(updateSchedule),
			                contentType: 'application/json',
			                success: function(response) {
			                    // 일정 수정 요청 보내기
			                    $.ajax({
			                        type: 'POST',
			                        url: '/api/sendScheduleRequest',
			                        data: JSON.stringify(updateSchedule),
			                        contentType: 'application/json',
			                        success: function(response) {
			                            console.log('Schedule change request sent successfully', response);
			                            $('#editEventModal').modal('hide'); // 수정 모달 닫기
			                            $('#requestCompleteModal').modal('show'); // 요청 완료 모달 띄우기
			                            info.event.setProp('backgroundColor', 'red'); // 일정 색상 변경
			                        },
			                        error: function(err) {
			                            $('#scheduleConflictModal').modal('show'); // 일정 충돌 모달 띄우기
			                        }
			                    });
			                },
			                error: function(err) {
			                    console.error('같은 일정이 있습니다.', err);
			                }
			            });

			            // 진료과 선택 초기화
			            departmentType.value = "0";
			            // 담당 의사 선택 초기화
			            chooseDoc.value = "0";
			        }
			    } else {
			        $('#selectDoctorModal').modal('show'); // 선택 모달 띄우기
			    }
			});

				
		}},
		customButtons: {
			allButton: { // 커스텀 버튼 설정
				text: 'ALL',
				click: function() {				    				    				    
					if (isShowingAll) {
						loadDoctorSchedule(); // 현재 모든 스케줄을 보고 있으면 로그인한 의사의 스케줄을 로드
			            allOrMe = $(this).text(); // jQuery를 사용하여 클릭된 버튼의 텍스트 값을 가져옴			            						
					} else {
						loadAllSchedules(); // 현재 로그인한 의사의 스케줄을 보고 있으면 모든 스케줄을 로드
						allOrMe = $(this).text(); // allButton의 text값을 넣는다.		
					}
				}
			},
			// 스케쥴을 추가하는 버튼
			addSchedule: {
				text: 'ADD',
				click: function() {
					$('#addEventModal').modal('show');
				}
			}
		},
		events: jsonData, // 초기 이벤트 데이터
		titleFormat: function(date) {
			return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
		},
		navLinks: true, // 날짜 클릭시 상세로 이동
		selectable: true, // 날짜 선택 가능
		fixedWeekCount: false,
		dayMaxEvents: true,
		droppable: true,
		editable: true,
		nowIndicator: true,
		locale: 'ko', // 한국어 설정
		datesSet: function() { // 뷰가 변경될 때마다 호출되는 콜백
			updateButtonText(); // 버튼 텍스트 업데이트
		}
	});
	calendar.render();
	loadDoctorSchedule(); // 초기 로드시 로그인한 의사의 스케줄을 불러옴
	scheduleRequsestList(); // 로그인한 의사의 수정 요청 리스트를 불러옴
	//console.log(isLoginedId)
	
	
		
}); </script>
</head>
<body>
	<div id="shall">
		<div id='loginInfoShall'>
			<div id='loginInfo'>
				<h5>현재 로그인 정보</h5>
				<div>
					<lable>의사: </lable>
					<b>${name}</b>
				</div>
				<div>
					<lable>아이디: </lable>
					<b>${id}</b>
				</div>
				<input type="hidden" id="doctorLoginId" value="${id}">
			</div>
			<div id="scheduleView">
				<label id="scheduleViewTitle">일정 조회하기</label> <input type="date" id="selectDate">
			</div>
			<div id="confirmChangeSch">
				<label id="confirmChangeSchTitle">일정 변경 요청</label>
				<div class="requestChangeschs">									
				</div>			
			</div>
		</div>
		<div id='calendar'></div>
	</div>
	<!-- 일정 추가 모달 -->
	<div class="modal fade" id="addEventModal" tabindex="-1" aria-labelledby="addEventModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="addEventModalLabel">일정 추가</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form>
						<div class="mb-3">
							<label for="eventTitle" class="form-label">일정 제목</label> <input type="text" class="form-control" id="eventTitle">
						</div>
						<div class="mb-3">
							<label for="eventTitle" class="form-label">환자 생년월일</label> <input type="date" class="form-control" id="eventBirth">
						</div>
						<div class="mb-3">
							<label for="eventDate" class="form-label">날짜</label> <input type="date" class="form-control" id="eventDate">
						</div>
						<div class="mb-3">
							<label for="eventDate" class="form-label">시간</label> <input type="time" class="form-control" id="eventTime">
						</div>
						<div class="mb-3">
							<label class="form-label">일정 유형</label><br>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="backgroundColor" id="eventTypeSurgery" value="green"> <label class="form-check-label" for="eventTypeSurgery">수술</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="backgroundColor" id="eventTypeRegular" value="blue" checked> <label class="form-check-label" for="eventTypeRegular">일반 진료</label>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" id="saveEventBtn">저장</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 모달 창 -->
	<div id="confirmModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- 모달 헤더 -->
				<div class="modal-header">
					<h5 class="modal-title">일정 삭제 및 수정</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<!-- 모달 본문 -->
				<div class="modal-body">
					<p id="modal-message">삭제 또는 수정을 선택하여 주십시오.</p>
				</div>
				<!-- 모달 푸터 -->
				<div class="modal-footer">
					<button type="button" id="modal-edit-btn" class="btn btn-primary">수정</button>
					<button type="button" id="modal-delete-btn" class="btn btn-danger">삭제</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 일정 추가 모달 -->
	<div class="modal fade" id="addEventModal" tabindex="-1" aria-labelledby="addEventModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="addEventModalLabel">일정 추가</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form>
						<div class="mb-3">
							<label for="eventTitle" class="form-label">일정 제목</label> <input type="text" class="form-control" id="eventTitle">
						</div>
						<div class="mb-3">
							<label for="eventTitle" class="form-label">환자 생년월일</label> <input type="date" class="form-control" id="eventBirth">
						</div>
						<div class="mb-3">
							<label for="eventDate" class="form-label">날짜</label> <input type="date" class="form-control" id="eventDate">
						</div>
						<div class="mb-3">
							<label for="eventDate" class="form-label">시간</label> <input type="time" class="form-control" id="eventTime">
						</div>
						<div class="mb-3">
							<label class="form-label">일정 유형</label><br>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="backgroundColor" id="eventTypeSurgery" value="green"> <label class="form-check-label" for="eventTypeSurgery">수술</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="backgroundColor" id="eventTypeRegular" value="blue" checked> <label class="form-check-label" for="eventTypeRegular">일반 진료</label>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" id="saveEventBtn">저장</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 모달 창 -->
	<div id="confirmModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- 모달 헤더 -->
				<div class="modal-header">
					<h5 class="modal-title">일정 삭제 및 수정</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<!-- 모달 본문 -->
				<div class="modal-body">
					<p id="modal-message">삭제 또는 수정을 선택하여 주십시오.</p>
				</div>
				<!-- 모달 푸터 -->
				<div class="modal-footer">
					<button type="button" id="modal-edit-btn" class="btn btn-primary">수정</button>
					<button type="button" id="modal-delete-btn" class="btn btn-danger">삭제</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 일정 수정 모달 -->
	<div class="modal fade" id="editEventModal" tabindex="-1" aria-labelledby="editEventModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="editEventModalLabel">일정 변경</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form>
						<div class="mb-3">
							<label for="editEventTitle" class="form-label">일정 제목/환자 이름</label> <input readonly type="text" class="form-control" id="editEventTitle">
						</div>
						<div class="mb-3">
							<label for="editEventDate" class="form-label">날짜</label> <input readonly type="date" class="form-control" id="editEventDate">
						</div>
						<div class="mb-3">
							<label for="editEventTime" class="form-label">시간</label> <input readonly  type="time" class="form-control" id="editEventTime">
						</div>
						<div class="mb-3">
							<label for="editEventBirth" class="form-label">환자 생년월일</label> <input readonly type="date" class="form-control" id="editEventBirth">
						</div>
						<div class="mb-3">
							<label for="editEventNowTname" class="form-label">기존 담당의</label> <input type="text" class="form-control" id="editEventNowTname" readonly>
						</div>
						<div class="mb-3">
							<label for="editEventDoctorId" class="form-label"></label> <input type="hidden" class="form-control" id="editEventDoctorId" value="">
						</div>
						<div class="mb-3">
							<label for="editEventDeptId" class="form-label">진료과 선택</label> <select class="form-control" id="editEventDeptId">
								<option disabled selected value="0">진료과</option>
								<option value="2">외과</option>
								<option value="3">내과</option>
								<option value="4">정형외과</option>
								<option value="5">정신과</option>
								<!-- 추가 과를 여기에 추가 -->
							</select>
						</div>
						<div class="mb-3">
							<label for="editEventTname" class="form-label">변경후 담당의</label> <select class="form-control" id="editEventTname">
								<option disabled selected value="0">의사 선택</option>
								<!-- 의사 목록이 여기에 동적으로 추가됩니다 -->
							</select>
						</div>
						<div class="mb-3">
							<label class="form-label">일정 유형</label><br>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="editEventType" id="editEventTypeSurgery" value="green"> <label class="form-check-label" for="editEventTypeSurgery">수술</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="editEventType" id="editEventTypeRegular" value="blue" checked> <label class="form-check-label" for="editEventTypeRegular">일반 진료</label>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" id="updateEventBtn">일정 수정 요청하기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 삭제 모달 -->
	<div id="deleteModal" class="modal fade" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="deleteModalLabel">일정 삭제</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">일정을 삭제하시겠습니까?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" id="btn btn-secondary" data-bs-dismiss="modal">취소</button>
					<button type="button" id="delete-event-btn" class="btn btn-danger">삭제</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 수정 요청 완료 모달 -->
	<div class="modal fade" id="requestCompleteModal" tabindex="-1" aria-labelledby="requestCompleteModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="requestCompleteModalLabel">알림</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">요청이 완료되었습니다.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 일정 추가 완료 모달 -->
	<div class="modal fade" id="addEventModalOk" tabindex="-1" aria-labelledby="addEventModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="addEventModalLabel">알림</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">일정이 추가되었습니다.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 올바른 일정 입력해주세요 모달 -->
	<div class="modal fade" id="invalidEventModal" tabindex="-1" aria-labelledby="invalidEventModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="invalidEventModalLabel">알림</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">올바른 일정을 입력해주세요.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 일정 조회 결과 모달 -->
	<div class="modal fade" id="scheduleResultModal" tabindex="-1" aria-labelledby="scheduleResultModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="scheduleResultModalLabel">일정 조회 결과</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div id="scheduleResultText"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 모달 창 -->
	<div class="modal fade" id="selectDoctorModal" tabindex="-1" role="dialog" aria-labelledby="selectDoctorModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="selectDoctorModalLabel">진료과와 바꿀 담당의를 선택해주세요</h5>
				</div>
				<div class="modal-body">		
					<p>아무곳이나 클릭하여 확인창을 닫아주세요.</p>
				</div>		
			</div>
		</div>
	</div>
	<!-- 수정 처리중인 일정입니다. -->
	<div class="modal fade" id="requestStatusModal" tabindex="-1" role="dialog" aria-labelledby="requestStatusModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="requestStatusModalLabel">알림</h5>
					<button type="button" class="btn-close" aria-label="Close" id="closeRequestStatusModalBtn" data-bs-dismiss="modal"></button>
				</div>
				<div class="modal-body">현재 수정 요청한 일정입니다.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="confirmRequestStatusBtn" data-bs-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 상세 내용을 보여주는 모달 -->
	<div class="modal fade" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="detailModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="detailModalLabel">상세 내용</h5>
				</div>
				<div class="modal-body">
					<div id="detailContent">
						<!-- 여기에 상세 내용이 동적으로 추가될 예정 -->
					</div>
				</div>
				<div class="modal-footer">
					<!-- 수락하기 버튼 -->
					<button type="button" class="btn btn-success" id="acceptBtn">수락하기</button>
					<!-- 거절하기 버튼 -->
					<button type="button" class="btn btn-danger" id="rejectBtn">거절하기</button>
					<!-- 보류하기 버튼 -->
					<button type="button" class="btn btn-secondary" id="pendingBtn" data-bs-dismiss="modal">보류하기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 모달 창 열기 스크립트 (생략) -->
	
	<!-- 수정 요청시 상대 의사가 동일한 일정이 있을 경우 -->
	<div id="scheduleConflictModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="scheduleConflictModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="scheduleConflictModalLabel">수정 요청 실패</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">상대방은 동일한 시간대에 일정이 존재하여 수정 요청을 받을 수 없습니다.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 해당 일정의 담당의가 아닙니다. -->
	<div class="modal fade" id="notYourScheduleModal" tabindex="-1" aria-labelledby="notYourScheduleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="notYourScheduleModalLabel">알림</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">해당 일정의 담당자가 아닙니다.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 모달 창 -->
	<div class="modal fade" id="scheduleDeletedModal" tabindex="-1" aria-labelledby="scheduleDeletedModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="scheduleDeletedModalLabel">알림</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">해당 일정이 삭제되었습니다.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 전체 일정을 조회중일 때 삭제, 추가, 수정 기능을 쓰려고 할 때 -->
	<div class="modal fade" id="viewingAllSchedulesModal" tabindex="-1" role="dialog" aria-labelledby="viewingAllSchedulesModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="viewingAllSchedulesModalLabel">알림</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">전체 일정을 조회 중일 때는 해당 기능을 사용할 수 없습니다.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Bootstrap JS -->
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
 	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
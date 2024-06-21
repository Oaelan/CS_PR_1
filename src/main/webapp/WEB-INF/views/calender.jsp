<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset='utf-8' />
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery 로드 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
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
	padding: 30px;
	display: flex;
	justify-content: center;
	align-items: center;
	display: flex;
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

/*  공휴일 이벤트 스타일 
.fc-event-holiday {
	background-color: rgb(252, 109, 109);  배경색을 빨간색으로 설정 
	color: rgb(255, 255, 255);  텍스트 색상을 흰색으로 설정 
} */

/* .fc-col-header-cell-cushion, .fc-daygrid-day-number {
	color: black;
} */

/*달 스타일*/
#fc-dom-1 {
	font-weight: bold;
}

a {
	color: black;
	text-decoration: none;
}

*[aria-label="일요일"], *[aria-label="토요일"] {
	color: white;
	/* 예시: 텍스트 색상을 빨간색으로 설정 */
}

/* 주말 날짜 스타일 */
.fc-day-sat /* 토요일 */ {
	background-color: rgb(136, 136, 252);
	/* 배경색을 파란색으로 설정 */
}

.fc-day-sun {
	background-color: rgb(252, 132, 152);
	/* 배경색을 빨간색으로 설정 */
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
       
	var jsonData;
	// 상태 변수 추가
	var isShowingAll = false; 	
	
	var isLoginedId;
	
	var nowDoctorId = document.getElementById('editEventDoctorId');
		
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
				isLoginedId = document.getElementById("doctorLoginId").value;
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
                     
                     console.log(response)
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
	

	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
		initialView: 'dayGridMonth', // 초기 뷰 설정
		headerToolbar: { // 헤더 툴바 설정
			start: 'today addSchedule',
			center: 'prev, title ,next',
			end: 'allButton,dayGridMonth,dayGridWeek,dayGridDay'
		},
		
		eventClick: function(info) {		            
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
				    $('#deleteModal').modal('show');
				});
			
			// 삭제 여부 한번 더 묻기
				document.getElementById('delete-event-btn').addEventListener('click', function() {
				   		
						$.ajax({
							type: 'POST',
							url: '/api/deleteEvent',
							data: {
								eventId: info.event.extendedProps.no
							},
							success: function(response) {
								console.log('일정이 삭제되었습니다.');
							}
						});
						info.event.remove();
						$('#deleteModal').modal('hide');
						// FullCalendar에서 이벤트 삭제				
				});
				
				// 삭제 모달에서 취소 버튼 누르면 모달 닫히기
				document.getElementById('btn btn-secondary').addEventListener('click', function() {
				    $('#deleteModal').modal('hide');
				});
			    
				
			//수정 버튼 누르면 수정모달 띄우기			
			document.getElementById('modal-edit-btn').addEventListener('click', function() {						    
			    
				//수정 삭제 여부 모달 닫기
				$('#confirmModal').modal('hide');
				
				// 수정모달 띄우기
				$('#editEventModal').modal('show');
				
				// 모달 내용을 동적으로 변경할 수 있도록 전달한 정보를 모달에 채워 넣습니다.					
				fillEditModal(eventData);				
				});
				
				
			
				
				// 수정하기 버튼 구현 
				document.getElementById('updateEventBtn').addEventListener('click', function(){
				 	
				   	 // 선택된 옵션의 텍스트와 value를 가져옵니다.			 	
				    var selectedODoctorName = doctorSelect.options[doctorSelect.selectedIndex].text;
				    var selectedODoctorId = doctorSelect.value;			   
				    var selectedBackgroundColor = document.querySelector('input[name="editEventType"]:checked').value;	
				   
				    //JavaScript에서 ISO 8601 형식에서 DB의 datetime에서는 
				    //'2024-06-25T07:00:00.000Z' 에서 .000Z는 필요하지 않으므로 잘라주고 보내줄거임	
				    
				   var updateStart = new Date(info.event.start).toISOString();		   
			   
				   // console.log(selectedBackgroundColor)		
				   // console.log(selectedODoctorName)				   
				   // console.log(selectedODoctorId)
				    
				    
				   var updateSchedule = {				           
				           	no: info.event.extendedProps.no,				           
							birth: info.event.extendedProps.birth,
							title: info.event.title,					
							start: updateStart.slice(0, 19).replace('T', ' '),					
							// 의사가 바뀔수 있기 때문에 
							doctorId:selectedODoctorId,
							tName :selectedODoctorName ,
							backgroundColor:selectedBackgroundColor ,
				   } 
				    //console.log(updateSchedule)
				   	
				  console.log("nowDoctorId.value:", nowDoctorId.value);
				console.log("eventData.id:", eventData.id);
				    // 일정에 있는 의사 아이디와 로그인한 아이디가 일치할때 일정 수정 가능
				   if(nowDoctorId.value == isLoginedId){
				       
				       // 진료과 디폴트값
				       var departmentType = document.getElementById("editEventDeptId")
				       // 의사 선택 디폴트값
				       var chooseDoc = document.getElementById("editEventTname")
				       console.log(departmentType.value)
				       console.log(chooseDoc.value)
				       
				       if(departmentType.value == "0" && chooseDoc.value == "0" ){
				           alert("진료과와 바꿀 담당의를 선택해주세요")
				       }else{	
				           $.ajax({
								type: 'POST',
								url: '/api/updateSchedule', // 저장할 데이터를 처리하는 서버의 엔드포인트
								data: JSON.stringify(updateSchedule), // JSON 형태로 데이터 전송
								contentType: 'application/json',
								success: function(response) {				
									console.log('Schedule updateed successfully');
									$('#updateEventBtn').modal('hide');
									alert("일정 수정이 완료되었습니다!")
								},
								error: function(err) {
									console.error('Schedule updationg event:', err);
								}
							});
				       }
				       
				
				 } else{
				    
				     alert("해당 일정의 담당의가 아닙니다.")
				     $('#updateEventBtn').modal('hide');
				 }			    		
			});
				},
		customButtons: {
			allButton: { // 커스텀 버튼 설정
				text: 'ALL',
				click: function() {
					if (isShowingAll) {
						loadDoctorSchedule(); // 현재 모든 스케줄을 보고 있으면 로그인한 의사의 스케줄을 로드
					} else {
						loadAllSchedules(); // 현재 로그인한 의사의 스케줄을 보고 있으면 모든 스케줄을 로드
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
	
	console.log(document.getElementById("doctorLoginId").value)
	
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
		if (title && !isNaN(date.valueOf())) { // 유효한 날짜인지 확인
			if (eventType) {
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
					},
					error: function(err) {
						console.error('Error saving event:', err);
					}
				});
				alert('성공적으로 일정이 추가 되었습니다!');
				var addEventModal = bootstrap.Modal.getInstance(document.getElementById('addEventModal'));
				addEventModal.hide();
				// 입력 필드 초기화
				document.getElementById('eventTitle').value = '';
				document.getElementById('eventDate').value = '';
				document.getElementById('eventTime').value = '';
				document.getElementById('eventBirth').value = '';
				nowDoctorId.value='';
				
				$('input[name="eventType"]').prop('checked', false); // 라디오 버튼 초기화
			} else {
				alert('올바른 일정을 입력해주세요.');
			}
		}
	});
}); </script>
</head>
<body>
	<div id="shall">
		<div id='loginInfo'>
			<h3>현재 로그인 정보</h3>
			<lable>의사: </lable><h4 >${name}</h4>
			<lable>아이디: </lable><h4 >${id}</h4>
			<input type="hidden" id="doctorLoginId" value="${id}">
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
							<label for="editEventTitle" class="form-label">일정 제목/환자 이름</label> <input type="text" class="form-control" id="editEventTitle">
						</div>
						<div class="mb-3">
							<label for="editEventDate" class="form-label">날짜</label> <input type="date" class="form-control" id="editEventDate">
						</div>
						<div class="mb-3">
							<label for="editEventTime" class="form-label">시간</label> <input type="time" class="form-control" id="editEventTime">
						</div>
						<div class="mb-3">
							<label for="editEventBirth" class="form-label">환자 생년월일</label> <input type="date" class="form-control" id="editEventBirth">
						</div>
						<div class="mb-3">
							<label for="editEventNowTname" class="form-label">기존 담당의</label> <input type="text" class="form-control" id="editEventNowTname" readonly>
						</div>
							<div class="mb-3">
							<label for="editEventDoctorId" class="form-label">기존 담당의 ID</label> <input type="hidden" class="form-control" id="editEventDoctorId" value="">
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
								<option disabled selected  value ="0">의사 선택</option>
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
					<button type="button" class="btn btn-primary" id="updateEventBtn">수정</button>
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
</body>
</html>
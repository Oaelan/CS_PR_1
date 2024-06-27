<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진료예약</title>
<link rel="stylesheet" href="../resources/CSS/header.css">
<link rel="stylesheet" href="../resources/CSS/footer.css">
<link rel="stylesheet" href="../resources/CSS/reservation.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<style>

body{
		line-height: 18px; !important;
	}
#submitB{
	display: flex;
	justify-content: center;
	align-items: center;
}
nav ul {
	margin-right: 100px;
}
#select{
	display: none;
}

.rButton {
    display: inline-block; /* 인라인 블록 요소로 표시 */
    cursor: pointer; /* 포인터 커서 설정 */
    padding: 8px 16px; /* 패딩 설정 */
    border: 1px solid #ccc; /* 테두리 설정 */
    background-color: #f0f0f0; /* 배경색 설정 */
    color: #333; /* 글자색 설정 */
    border-radius: 4px; /* 테두리 반경 설정 */
}

/* 라벨이 선택됐을 때의 스타일 */
input[type="radio"]:checked + .rButton {
    background-color: #007bff; /* 선택됐을 때의 배경색 */
    color: #fff; /* 선택됐을 때의 글자색 */

                
}


.radio-container {
    border: 1px solid #ddd;
    padding: 10px;
    cursor: pointer;
    margin: 5px;
    display: inline-block;
}

/* 라디오 버튼이 선택된 경우 스타일 */
.radio-container.selected {
    background-color: #f0f0f0;
    border-color: #2196F3;
}
</style>
<style>
.btn-check {
	display: none;
}

.btn {
	box-sizing: border-box;
	display: inline-block;
	cursor: pointer;
	border: 2px solid #3498db; /* 테두리 스타일 */
	border-radius: 5px; /* 모서리를 둥글게 */
	transition: background-color 0.3s ease;
	width: 135px; /* 라벨의 고정된 너비 */
}

.btn:hover {
	background-color: #3498db;
	color: white;
}

.btn-check:checked+.btn {
	background-color: #3498db;
	color: white;
}

#rv {
	display: flex;
	width: 100%;
}

.cate_op {
	margin: 0px 5px 40px 5px
}
		.btn-group {
            display: grid;
            grid-template-columns: repeat(2, 1fr); /* 2개의 컬럼으로 그리드 설정 */
            gap: 10px; /* 버튼 간의 간격 설정 */
        }
        .btn-group .btn {
        	width: 100px;
            font-size: 0.8rem; /* 버튼 텍스트 크기 조정 */
            padding: 5px 10px; /* 버튼 내부 여백 조정 */
        }
        .btn-disabled {
            color: #737474 !important;
            border-color: #737474 !important; 
        }
</style>


<!-- Datepicker 스타일 -->
<style>
/* Datepicker 셀 크기 및 글꼴 크기 설정 */
.datepicker td, .datepicker th {
    width: 3.5rem;
    height: 3.5rem;
    font-size: 1rem;
}

/* Datepicker 하단 마진 설정 */
.datepicker {
    margin-bottom: 3rem;
}
.datepicker-dropdown {
            transform: translate(5%,15%); /* 조정된 위치로 이동 */
        }
        

</style>
</head>
<body>



	<jsp:include page="header.jsp"></jsp:include>
	<div class="entire">
		<div class="container">
				<div class="wrap">
					<p>인터넷 진료예약</p>
					<img src="../resources/img/tel.PNG">
				</div>
			</div>
			<div class="container1">
				<div class="wrap1">
					<div class="content1">
							<div id="rv">
								<ul id="rv2">
									<li class="cate_op">
										<input type="radio" class="btn-check" name="userType" value="2" id="userType1" autocomplete="off">
										<label class="btn btn-outline-primary" for="userType1">호흡기내과</label>
									</li>
									<li class="cate_op">
										<input type="radio" class="btn-check" name="userType" value="3" id="userType2" autocomplete="off">
										<label class="btn btn-outline-primary" for="userType2">순환기내과</label>
									</li>
									<li class="cate_op">
										<input type="radio" class="btn-check" name="userType" value="4" id="userType3" autocomplete="off">
										<label class="btn btn-outline-primary" for="userType3">소화기내과</label>
									</li>
								</ul>
								<ul id="rv2">
									<li class="cate_op">
										<input type="radio" class="btn-check" name="userType" value="5" id="userType4" autocomplete="off">
										<label class="btn btn-outline-primary" for="userType4">혈액종양내과</label>
									</li>
									<li class="cate_op">
										<input type="radio" class="btn-check" name="userType" value="6" id="userType5" autocomplete="off">
										<label class="btn btn-outline-primary" for="userType5">내분비대사내과</label>
									</li>
									<li class="cate_op">
										<input type="radio" class="btn-check" name="userType" value="7" id="userType6" autocomplete="off">
										<label class="btn btn-outline-primary" for="userType6">알레르기내과</label>
									</li>
								</ul>
								<ul id="rv2">
									<li class="cate_op">
										<input type="radio" class="btn-check" name="userType" value="8" id="userType7" autocomplete="off">
										<label class="btn btn-outline-primary" for="userType7">신장내과</label>
									</li>
									<li class="cate_op">
										<input type="radio" class="btn-check" name="userType" value="9" id="userType8" autocomplete="off">
										<label class="btn btn-outline-primary" for="userType8">감염내과</label>
									</li>
									<li class="cate_op">
										<input type="radio" class="btn-check" name="userType" value="10" id="userType9" autocomplete="off">
										<label class="btn btn-outline-primary" for="userType9">류마티스내과</label>
									</li>
								</ul>
								<ul id="rv2">
									<li class="cate_op">
										<input type="radio" class="btn-check" name="userType" value="11" id="userType10" autocomplete="off">
										<label class="btn btn-outline-primary" for="userType10">내과(일반)</label>
									</li>
									<li class="cate_op">
										<input type="radio" class="btn-check" name="userType" value="12" id="userType11" autocomplete="off">
										<label class="btn btn-outline-primary" for="userType11">내과</label>
									</li>
									<li class="cate_op">
										<input type="radio" class="btn-check" name="userType" value="13" id="userType12" autocomplete="off">
										<label class="btn btn-outline-primary" for="userType12">외과</label>
									</li>
								</ul>
							</div>
						
					</div>
					
				</div>
				
				<div class="wrap2">
					<div class="content2">
						<p id="check">예약하실 정보확인</p>
						<p>환자명: ${name}</p>
						<input type = "hidden" id = "patientName" value = "${name}">
						<p>생년월일: ${birth}</p>
						<input type = "hidden" id = "patientBirth" value = "${birth}">
						<ul id="rv3">
								<li><a href="MyPage" role="button">환자정보확인</a></li>
								<li><a href="rvlist" role="button">최근예약</a></li>
						</ul>
						<br><br>
						<div>
						<p id="doctorKind">병원/진료과:</p>
						<p id = "docName">의료진: </p>
						<p id ="reserveTime" >진료일시:</p>
						</div>
					</div>
				</div>
			</div>
			
		</div>
		<div class="container2">
			<div class="wrap3">
				<div class="content3">
					<div class="list">
						<h2>의료진 목록</h2>
					</div>
						
					<div class="box3" id = "result">
						
					</div>
				</div>
			
			<div class="wrap4">
				<div class="content4">
				<h3>진료일정</h3>
				
					<!-- 날짜 선택 -->
					<div class="mb-2">
						<label for="reserveDate" class="form-label">예약일</label>
						<div class="form-group mb-2">
							<div class="datepicker date input-group p-0 shadow-sm">
								<input type="text" placeholder="예약 날짜 선택"
									class="form-control py-3 px-4 mt-3" id="reserveDate"
									name="start">
								<div class="visually-hidden">
									<div class="input-group-append">
										<span class="input-group-text px-4"> <i
											class="fa fa-clock-o"></i>
										</span>
									</div>
								</div>
							</div>
						</div>
					</div>



					<!-- 시간  선택 -->
					<div class="mt-3">
						<div class="mt-5">
							<label class="form-label"></label>
							<div class="btn-group" role="group" aria-label="Time picker">
								<!-- JavaScript로 버튼 생성 -->
							</div>
							<div class="mt-3">
								<label for="selectedTime" class="form-label"></label> <input
									type="hidden" id="selectedTime" class="form-control" readonly>
							</div>
						</div>

						<div id = "submitB">
							<button type="button" id="sendDoctor" class="btn btn-outline-info">전송</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- <script type="text/javascript" src="../JS/reservation.js"> 
	
	</script>-->

	<script type="text/javascript">
		function displaySelectedRadio() {
			var radios = document.querySelectorAll('input[name="userType"]');
			
			radios.forEach(function(radio) {
				if (radio.checked) {
					let doctorKind = document.getElementById("doctorKind")
					doctorKind.innerText = "병원/진료과: " + document.querySelector('label[for="' + radio.id + '"]').innerText
				}
			});
		}

		document.addEventListener('DOMContentLoaded', function() {
			var radios = document.querySelectorAll('input[name="userType"]');
			radios.forEach(function(radio) {
				radio.addEventListener('change', displaySelectedRadio);
			});
		});
	</script>

<script type="text/javascript">
var start;
var reserveInfo;
var selectedDoctorId;
var docName;
        
$(document).ready(function() {
    // 사용자 유형 변경 이벤트 핸들러
    $('.btn-check').change(function() {
        var userType = $(this).val();
        $.ajax({
            url: '/getDoctor',
            type: 'GET',
            data: { userType: userType },
            dataType: 'json', // 서버에서 JSON 데이터 수신
            success: function(data) {
            	reserveInfo = '<div class="op1">';
                data.forEach(function(user) {
                	var userInfo = JSON.stringify({
                        id: user.id,
                        name: user.name,
                    });
                    reserveInfo += 
                        '<div class="radio-container">'
                            +'<img src="../resources/img/doctor.PNG">'
                            +'<input id='+ user.id +'  class = "doctors" type="radio" name="tName" value="' + user.id + '">'
	                        +'<div class="op1">' 
	                            +'<div class="inform">'
	                                +'<b>'+ user.name +'</b><br>'
	                                +'<p>내과(일반)</p>'
	                            +'</div>'
	                        +'</div>'
                        +'</div>';
                });
                reserveInfo += '</div>';
                $('#result').html(reserveInfo);
                
                
                // 라디오 버튼 선택 이벤트 핸들러
/*                 $('.radio-container').click(function() {
                	$('.radio-container').removeClass('selected');
                    $(this).addClass('selected');
                    $(this).find('input[type="radio"]').prop('checked', true); */
                      
                    $('.doctors').click(function() {
                    	document.getElementById("docName").innerText =" ";           	   	
                    	 selectedDoctorId = $(this).val();
                    	                   	 
                    	$.ajax({
                    	    url: '/selectDoctor/'+selectedDoctorId+'.json',
                    	    type: 'GET',
                    	   contentType:'application/json; charset=UTF-8',
                    	   dataType:'text',
                    	    //data: JSON.stringify({id:selectedDoctorId}),
                    	    success: function(doctorName) {
                    	    	console.log("aaaaaaa")
                    	    	console.log(doctorName)
                    	   		document.getElementById("docName").innerText = "의료진: " + doctorName;  
                    	   		docName = doctorName;                  	   		
                    	   		$(function() {
                    	     	// DATEPICKER 플러그인 초기화
	                    	     	$('.datepicker').datepicker({
	                    	     		clearBtn : true,
	                    	     		format : "yyyy-mm-dd",
	                    	     		startDate: 'd'
	                    	     		
	                    	     	}).on("changeDate", function(e) {
	                    	     		// e.date 객체에서 연도, 월, 일 추출
	                    	             var year = e.date.getFullYear();
	                    	             var month = (e.date.getMonth() + 1).toString().padStart(2, '0'); // 월은 0부터 시작하므로 1 더함
	                    	             var day = e.date.getDate().toString().padStart(2, '0');
	                    	             
	                    	             // yyyy/mm/dd 형식으로 조합
	                    	             start = month + '월' + day + '일';
	                    	             timeSet();
	                    	             console.log(start); // 변환된 날짜 출력
	                    	        });
                    	     	
                    	     	});
                    	   	 
                    	   		function timeSet() {
                    				// 시작 시간, 종료 시간, 간격을 설정하여 시간 버튼을 생성하는 스크립트
                    				var startTime = 9; // 시작 시간 (9시)
                    				var endTime = 17; // 종료 시간 (18시)
                    				var interval = 30; // 간격 (30분)
                    				var timeString;
                    				
                    				// 버튼 그룹 선택
                    				var btnGroup = $('.btn-group');
                    				btnGroup.empty();
                    				var reserveDate = $('#reserveDate').val();

                    				// 시작 시간부터 종료 시간까지 버튼 생성
                    				for (var hour = startTime; hour <= endTime; hour++) {
                    					for (var minute = 0; minute < 60; minute += interval) {
                    						timeString = formatTime(hour) + ':' + formatTime(minute);
                    						var dateTimeString = reserveDate + ' ' + timeString;
                    						var button = $('<button type="button" name="start" class="btn btn-outline-primary time-btn" data-time="' + dateTimeString + '">'
                    								+ timeString + '</button>');
                    						btnGroup.append(button);
                    					}
                    				}

                    				// 시간을 두 자리 수로 포맷하는 함수
                    				function formatTime(time) {
                    					return (time < 10) ? '0' + time : time;
                    				}
                    				var doctorData = {
                    			            doctorId: selectedDoctorId,
                    			        };
                    					
                    					
                    					$.ajax({
                    						url: '/getTime',  // 서버에서 예약된 시간 데이터를 가져오는 엔드포인트
                    						type: 'POST',
                    			            data: {
                        			            doctorId: selectedDoctorId,
                        			        },
                    						success: function(data) {

                    							console.log('전송 성공:', data);          
                    							// 받아온 데이터를 기반으로 버튼 상태 설정
                    							let responTime = JSON.parse(data)
                    							
                		                    	
                    		                	for (var i = 0; i < responTime.length; i++) {					
                    		                		$('.time-btn').each(function() {
                        		                    	var time = $(this).data('time');
                        		                    	// 예약 시간 중복시 버튼 비활성화  
                        				                    if (time === responTime[i].start.slice(0,16)) {
                        				                        	$(this).addClass('btn-disabled').attr('disabled', true);
                        				                    	console.log(responTime[i].start.slice(0,16))
                        				                    }
                        		                		});
                    	            			}
                    							
                    							//날짜 선택 후 버튼 클릭 가능하게 설정
                    							$('.time-btn').click(function() {
                    								
                    								if(start == undefined){
                    									window.alert("날짜를 선택하세요!")
                    									$('.time-btn').focusout();
                    								}
                    								
                    								else{
                    									selectedTime = $(this).data('time');
                    									$('#selectedTime').val(selectedTime);
                    									$('.time-btn').removeClass('active');
                    									$(this).addClass('active');
                    									document.getElementById("reserveTime").innerText = "진료일시: " + selectedTime.slice(5,16);
                    								}
                    							});
                    							
                    						},
                    						error: function(xhr, status, error) {
                    						console.error('Failed to fetch availability data:', error);
                    						console.log('XHR:', xhr);
                    						console.log('Status:', status);
                    						console.log('Error:', error);
                    						// 실패 시 기본적으로 모든 버튼 활성화
                    						}
                    					});
                    							 
                    					// 버튼 클릭 처리
                    					
                    			}
                    	    }
                    	});
                    });
             /*    }); */
            }
        });
    });
    
 
   
    
    // 의사 예약 정보 전송 이벤트 핸들러
    $('#sendDoctor').click(function() {
    	console.log("ss",document.getElementById("docName").value)
    	var reserveInfo = {
            tName: docName,
            doctorId: selectedDoctorId,
            title: $('#patientName').val(),
            birth: $('#patientBirth').val(),
            start: $('#selectedTime').val()
        };
        $.ajax({
            url: '/sendReserve',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(reserveInfo),
            success: function(response) {
            	
                console.log('전송 성공1:', response);
                window.location.href = '/rvfinish';
            }
        });
        reserveInfo = null;
    });
});



$('.rButton').click(function() {
    $('.rButton').removeClass('selected');
    $(this).addClass('selected');
    $(this).find('input[type="radio"]').prop('checked', true);
});

</script>

</body>
</html>
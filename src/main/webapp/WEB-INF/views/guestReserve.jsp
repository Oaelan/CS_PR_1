<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<link rel="stylesheet" href="../resources/CSS/header.css">
<link rel="stylesheet" href="../resources/CSS/footer.css">

<!-- Bootstrap Datepicker CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" rel="stylesheet">

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

<!-- Popper.js for Bootstrap 도구팁과 팝오버 -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>

<!-- Bootstrap 5 JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>

<!-- jQuery 라이브러리 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Bootstrap Datepicker JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>

<!-- 사용자 정의 스크립트 -->
<script type="text/javascript">
var reserveInfo;
var userInfo;

$(document).ready(function() {
    // 사용자 유형 변경 이벤트 핸들러
    $('#userType').change(function() {
        var userType = $(this).val();
        $.ajax({
            url: '/getDoctor',
            type: 'GET',
            data: { userType: userType },
            dataType: 'json', // 서버에서 JSON 데이터 수신
            success: function(data) {
                reserveInfo = '<div>';
                data.forEach(function(user) {
                    userInfo = JSON.stringify({
                        id: user.id,
                        name: user.name,
                    });
                    reserveInfo += 
                        '<div>'
                        + '<div class="radio-container">' 
                        +'<input type="radio" name="tName" value="' + user.id + '">' 
                        + user.name + ' 선생님' +
                        '</div>';                   
                });
                reserveInfo += '</div>';
                $('#result').html(reserveInfo);
                // 라디오 버튼 선택 이벤트 핸들러
                $('.radio-container').click(function() {
                    $('.radio-container').removeClass('selected');
                    $(this).addClass('selected');
                    $(this).find('input[type="radio"]').prop('checked', true);
                });
            }
        });
    });
    
    // 의사 예약 정보 전송 이벤트 핸들러
    $('#sendDoctor').click(function() {
    	var user = JSON.parse(userInfo) 
    	
        var reserveInfo = {
            tName: user.name,
            doctorId: user.id,
            title: $('#patientName').val(),
            birth: $('#patientBirth').val(),
            start: $('#reserveDate').val() + ' ' + $('#selectedTime').val()
        };
        $.ajax({
            url: '/sendReserve',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(reserveInfo),
            success: function(response) {
                console.log('전송 성공:', response);
                // 필요에 따라 추가 작업 수행
                window.location.href = '/login';
            }
        });
        reserveInfo = null;
    });
});
</script>

<!-- 생년월일 선택 스크립트 (데이트 픽커) -->
<!-- Datepicker 초기화 스크립트 -->
<script>
$(function () {
    // DATEPICKER 플러그인 초기화
    $('.datepicker').datepicker({
        clearBtn: true,
        format: "yyyy/mm/dd",
        
    });

    
});
</script>

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
        
/* 라디오 버튼 숨기기 */
input[type="radio"] {
    display: none;
}

/* 라디오 버튼이 숨겨진 상태에서 상위 div 스타일 */
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

<!-- 시간버튼 생성 및 조절 -->
<script>
	$(document).ready(
		//
		function() {
			// 시작 시간, 종료 시간, 간격을 설정하여 시간 버튼을 생성하는 스크립트
			var startTime = 9; // 시작 시간 (9시)
			var endTime = 17; // 종료 시간 (18시)
			var interval = 30; // 간격 (30분)

			// 버튼 그룹 선택
			var btnGroup = $('.btn-group');

			// 시작 시간부터 종료 시간까지 버튼 생성
			for (var hour = startTime; hour <= endTime; hour++) {
				for (var minute = 0; minute < 60; minute += interval) {
					var timeString = formatTime(hour) + ':'
						+ formatTime(minute);
					var button = $('<button type="button" name="start" class="btn btn-outline-primary time-btn" data-time="' + timeString + '">'
							+ timeString + '</button>');
					btnGroup.append(button);
				}
			}

			// 시간을 두 자리 수로 포맷하는 함수
			function formatTime(time) {
				return (time < 10) ? '0' + time : time;
			}
		
				$.ajax({
					url: '/getTime',  // 서버에서 예약된 시간 데이터를 가져오는 엔드포인트
					type: 'GET',
					dataType: 'json',
					success: function(data) {
						console.log('Received data:', data);  // 응답 데이터 확인
						console.log('Received data:', typeof data[1]);  // 응답 데이터 확인
						            
						// 받아온 데이터를 기반으로 버튼 상태 설정
						            
						for (var i = 0; i < data.length; i++) {
							let responTime = JSON.stringify(data[i].start)
							console.log('responTime data:', responTime.length);
							console.log('responTime data:', responTime);// 응답 데이터 확인
	                		let endTime = responTime.slice(12, 17); 
	                		console.log('endTime data:', endTime);// 응답 데이터 확인
	                						
	                		$('.time-btn').each(function() {
	                    	var time = $(this).data('time');
	                    	console.log(time)
			                    if (time === endTime) {
			                        	$(this).addClass('btn-disabled').attr('disabled', true);
			                    }
	                		});
            			}
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
				$('.time-btn').click(function() {
					var selectedTime = $(this).data('time');
					$('#selectedTime').val(selectedTime);
					$('.time-btn').removeClass('active');
					$(this).addClass('active');
				});
		}
	);
</script>


</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div class="container mt-3">
		<!-- 진료자 성명 입력 -->

		<div class="mb-3 border-bottom pb-5">
			<label for="patientName" class="form-label">이름</label> 
			<input
				type="text" class="form-control py-3 px-4 mt-3" id="patientName"
				placeholder="진료받을 사람의 이름을 입력하세요">
		</div>


		<!-- 생년월일 선택 -->
		<div class="mb-3 border-bottom pb-1">
			<label for="patientBirth" class="form-label">생년월일</label>
			<div class="form-group mb-2">
				<div class="datepicker date input-group p-0 shadow-sm">
					<input type="text" placeholder="생년월일 선택('yyyy/mm/dd' 형태로 입력)"
						class="form-control py-3 px-4 mt-3" id="patientBirth" name="birth">
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


		<!-- 전공선택 select -->
		<div class="mb-3 border-bottom pb-4">
			<label for="userType" class="form-label">진료과</label> 
			<table>
				<tr>
					<td id="select"><select class="form-select" id="userType"
						name="userType" aria-label="Default select example">
							<option value="" selected>진료과 선택</option>
							<option value="2">정형외과</option>
							<option value="3">소아과</option>
							<option value="4">피부과</option>
							<option value="5">정신과</option>
							<option value="6">외과</option>
							<option value="7">내과</option>
							<option value="8">산부인과</option>
							<option value="9">비뇨기과</option>
							<option value="10">소화기내과</option>
							<option value="11">안과</option>
							<option value="12">이비인후과</option>
					</select></td>
				</tr>
			</table>
	
			<!-- 받아온 데이터 출력 div-->
			<div id="result" class="mb-3 mt-3"></div>

		</div>

		<!-- 예약 날짜 설정  -->
		<div class="mb-3 border-bottom pb-1">
			<label for="reserveDate" class="form-label">예약일</label>
			<div class="form-group mb-2">
				<div class="datepicker date input-group p-0 shadow-sm">
					<input type="text" placeholder="예약 날짜 선택"
						class="form-control py-3 px-4 mt-3" id="reserveDate" name="start">
					<div class="visually-hidden">
						<div class="input-group-append">
							<span class="input-group-text px-4"> 
								<i class="fa fa-clock-o"></i>
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>




		<!-- 시간 선택 -->
		<div class="mt-5 border-bottom pb-1">
			<div class="mt-5">
				<label class="form-label">시간 선택</label>
				<div class="btn-group" role="group" aria-label="Time picker">
					<!-- JavaScript로 버튼 생성 -->
				</div>
				<div class="mt-3">
            <label for="selectedTime" class="form-label">선택된 시간</label>
            <input type="hidden" id="selectedTime" class="form-control" readonly>
        </div>
			</div>

			<div class="form-text mt-5">※진료시간은 9시~18시까지이며 진료마감 30분 전까지 예약 가능합니다.
			</div>
		</div>
		
		<div class="mt-5">
			<button type="button" id="sendDoctor" class="btn btn-outline-info">전송</button>
		</div>	
	</div>

	


 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script> 
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
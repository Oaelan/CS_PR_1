# 👤 환자 실시간 진료예약 및 의료진 진료 스케줄 관리 웹 서비스 개발
### 👥 CARE SIGHT 팀원 : 이지호, 김승주, 오애란

환자 실시간 진료예역 및 진료 스케줄 관리 기능을 구현하는 프로젝트를 진행하였습니다.

#### 🐶 사용된 테이블

**-- 사용자 테이블 생성**
CREATE TABLE user (
    VARCHAR(20) PRIMARY KEY,
    password VARCHAR(20) NOT NULL,
    name VARCHAR(20) NOT NULL,
    birth DATE NOT NULL,
    phone VARCHAR(17),
    userType INT
);


| id | password | name | birth | phone | userType |
| --- | --- | --- | --- | --- | --- |
| VARCHAR(20)| VARCHAR(20) | VARCHAR(20)| DATE | VARCHAR(20) |  INT |
| PRIMARY KEY| NOT NULL | NOT NULL | NOT NULL | NOT NULL | NOT NULL |
| 아이디 | 비밀번호 | 이름 | 생년월일 | 휴대폰 번호 | 의료진 /환자 구분 |



**-- 예약 테이블 생성**
CREATE TABLE reservation (
    no INT(20) PRIMARY KEY,
    doctorId VARCHAR(20),
    tName VARCHAR(20),
    title VARCHAR(255),
    birth DATE,
    start DATETIME,
    end DATETIME,
    backgroundColor VARCHAR(7),
    active BOOLEAN,
    isRequest BOOLEAN,
    state INT,
    reservedNo VARCHAR(10),
    FOREIGN KEY (doctorId) REFERENCES user(id)
);

| no | doctorId | tName | title | birth | start | end | backgroundColor | active | isRequest | state | reservedNo | 
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | 
| INT(20) | VARCHAR(20) | VARCHAR(20) | VARCHAR(255) | DATE | DATETIME | DATETIME | VARCHAR(7) | BOOLEAN | BOOLEAN | INT | VARCHAR(10) | 
| PRIMARY KEY | NOT NULL | NOT NULL | NOT NULL | NOT NULL | NOT NULL | NOT NULL | NOT NULL | NULL | NULL | NULL | NULL | 

### 😀 프론트엔드 화면 설계
화면 설계는 서울대학병원 사이트를 모작하였습니다.
(이미지 넣기)





### 😀 백엔드 기능 설계

#### 👩‍💻 환자 예약 시스템 
1. 환자 진료 예약
2. 예약 내역 확인

- 예약 중 내용 실시간 확인
- 선택한 값에 따른 실시간 적용(비동기식 처리 활용)
- 라이브러리를 통한 예약일 선택과 세부 기능 추가
- 이미 예약된 시간대 비활성화

#### 👩‍💻 의사 일정 관리 시스템 
1. 일정 확인 및 조회
2. 일정 추가, 삭제
3. 일정 수정 및 변경

- 예약 된 일정을 캘린더에 조회 가능(전체 일정 / 개인 일정)
- 원하는 날짜의 일정 조회 가능
- 일정 추가 / 삭제 / 수정 시 캘린더에 실시간 적용
- 일정 수정 요청 시 상대방이 거절 / 받기 가능하게 기능 추가

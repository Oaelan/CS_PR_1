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
![image](https://github.com/user-attachments/assets/b6529331-c624-459a-9ce8-2d28c6b97f58)
![image](https://github.com/user-attachments/assets/5a9f211d-45d6-428e-8680-6d7c13d35907)
![image](https://github.com/user-attachments/assets/a702233d-c728-45cf-8f93-c41e775deda7)







### 😀 백엔드 기능 설계

#### 👩‍💻 환자 예약 시스템 
1. 환자 진료 예약
2. 예약 내역 확인
![image](https://github.com/user-attachments/assets/357467b6-d1c5-4ce0-973e-361c2a434a02)
![image](https://github.com/user-attachments/assets/38941d88-2559-4e24-941e-af8b05dc7344)

- 예약 중 내용 실시간 확인
- 선택한 값에 따른 실시간 적용(비동기식 처리 활용)
- 라이브러리를 통한 예약일 선택과 세부 기능 추가
- 이미 예약된 시간대 비활성화

#### 👩‍💻 의사 일정 관리 시스템 
1. 일정 확인 및 조회
2. 일정 추가, 삭제
3. 일정 수정 및 변경
![image](https://github.com/user-attachments/assets/1f0db7da-d3c7-49f3-a8a0-8bc3f8b2c944)
![image](https://github.com/user-attachments/assets/fd704dbe-7d87-49a0-98e4-1f247f508669)
![image](https://github.com/user-attachments/assets/79be4078-35a6-4df1-bc70-e191549d0680)
![image](https://github.com/user-attachments/assets/6169be63-1a18-4b1d-bf59-715fdb996bd7)

- 예약 된 일정을 캘린더에 조회 가능(전체 일정 / 개인 일정)
- 원하는 날짜의 일정 조회 가능
- 일정 추가 / 삭제 / 수정 시 캘린더에 실시간 적용
- 일정 수정 요청 시 상대방이 거절 / 받기 가능하게 기능 추가


### 😀 실제 기능별 영상


#### 👩‍💻 회원가입
https://github.com/user-attachments/assets/f657baa9-6af1-4964-a229-98c5bdeb85a6

#### 👩‍💻 회원탈퇴
https://github.com/user-attachments/assets/21df5907-4296-4c2e-9598-7b16f2cadc9e

#### 👩‍💻 환자 예약 기능
https://github.com/user-attachments/assets/3fdf4535-482c-4b32-92e1-889f2ae50176
https://github.com/user-attachments/assets/21ade2c5-e3bf-40a4-8900-14f1536745e2

#### 👩‍💻 환자 예약 확인 기능
https://github.com/user-attachments/assets/86e8f238-3544-4bec-84ae-9d3044300e40

#### 👩‍💻 의사 일정 관리 기능(일정추가)
https://github.com/user-attachments/assets/fd4bfa8c-cedb-4c65-b233-f86e4c47c2ce
https://github.com/user-attachments/assets/6f5a0d73-86f8-4ed8-9de8-fab02292e366

#### 👩‍💻 의사 일정 관리 기능(수정)
https://github.com/user-attachments/assets/0e42ed0e-44eb-4561-b909-404faf2f366b
https://github.com/user-attachments/assets/4f693dd0-341c-4ec3-b8a7-27cc6c4362ea

#### 👩‍💻 의사 일정 관리 기능(일정 조회)
https://github.com/user-attachments/assets/b3add481-4e49-4a55-b4d0-cea6c3aa87db





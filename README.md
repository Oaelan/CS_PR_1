CREATE TABLE user (
    id VARCHAR(20) PRIMARY KEY NOT NULL,
    pw VARCHAR(20) NOT NULL,
    name VARCHAR(20) NOT NULL,
    phone VARCHAR(14) NOT NULL,
    s_team VARCHAR(20) NULL
);


CREATE TABLE patient (
    p_no VARCHAR(20) PRIMARY KEY NOT NULL,
    p_name VARCHAR(20) NOT NULL,
    p_gender VARCHAR(20) NOT NULL,
    p_id VARCHAR(20) NOT NULL,
    p_phone VARCHAR(20) NOT NULL,
    p_subPhone VARCHAR(20) NOT NULL,
    p_room VARCHAR(20) NOT NULL,
    s_id VARCHAR(20) NOT NULL
);


CREATE TABLE patient_GPS (
    p_no VARCHAR(20) NOT NULL,
    p_name VARCHAR(20) NOT NULL,
    p_gender VARCHAR(20) NOT NULL,
    p_phone VARCHAR(20) NOT NULL,
    p_subPhone VARCHAR(20) NOT NULL,
    p_room VARCHAR(20) NOT NULL,
    x DOUBLE NOT NULL,
    y DOUBLE NOT NULL
);


CREATE TABLE GPS_Info (
    id VARCHAR(20) NOT NULL,
    x DOUBLE NOT NULL,
    y DOUBLE NOT NULL
);

DELIMITER //
CREATE PROCEDURE insert_gpsInfoP(IN px DOUBLE, IN py DOUBLE, IN pno VARCHAR(20))
BEGIN
    -- 기존 행 삭제
    DELETE FROM patient_GPS WHERE id = pid;

    -- 새로운 행 삽입
    INSERT INTO patient_GPS (x, y, p_no) VALUES (px, py, pno);
END;

//
DELIMITER ;

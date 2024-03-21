
USE db_ticketing;

CREATE TABLE 회원 (
	회원번호 VARCHAR(20) NOT NULL check (회원번호 LIKE "%TK___"),
	ID VARCHAR(20) NOT NULL,
	PW VARCHAR(20) NOT NULL,
	이름 VARCHAR(20) NOT NULL,
	생년월일 INT NOT NULL,
	전화번호 INT NOT NULL,
	이메일 VARCHAR(20) NOT NULL,
	주소 VARCHAR(20),
	PRIMARY KEY(회원번호));


CREATE TABLE 예매자 (
	회원번호 VARCHAR(20) NOT NULL,
	이름 VARCHAR(20) NOT NULL,
	전화번호 INT NOT NULL,
	이메일 VARCHAR(20) NOT NULL,
	티켓번호 VARCHAR(20) NOT NULL,
	결제번호 VARCHAR(20) NOT NULL CHECK (결제번호 LIKE "C___" OR 결제번호 LIKE "D___"),
	티켓수 INT NOT NULL DEFAULT 0 CHECK (티켓수 <= 4),
	PRIMARY KEY(결제번호),
	FOREIGN KEY (회원번호) REFERENCES 회원(회원번호),
	UNIQUE(티켓번호));


CREATE TABLE 주최자 (
	주최자번호 VARCHAR(20) NOT NULL DEFAULT 0 CHECK (CHAR_LENGTH(주최자번호) = 3 AND 주최자번호 LIKE "1%"),
	회사명 VARCHAR(20) NOT NULL,
	회사이메일 VARCHAR(40) NOT NULL,
	회사주소 VARCHAR(20) NOT NULL,
	PRIMARY KEY(주최자번호));

CREATE TABLE 공연 (
	공연번호 VARCHAR(20) NOT NULL CHECK (공연번호 LIKE "CC%" OR 공연번호 LIKE "OP%" OR 공연번호 LIKE "MS%" OR 공연번호 LIKE "FV%"),
	공연이름 VARCHAR(20) NOT NULL,
	공연종류 VARCHAR(20) NOT NULL,
	공연시간 INT NOT NULL DEFAULT 0,
	공연날짜 INT NOT NULL,
	공연규모 INT NOT NULL,
	공연장소 VARCHAR(20) NOT NULL,
	출연진 VARCHAR(20) NOT NULL,
    주최자번호 VARCHAR(20) NOT NULL,
	PRIMARY KEY(공연번호));
    
ALTER TABLE 공연 ADD FOREIGN KEY (주최자번호) REFERENCES 주최자(주최자번호) ON UPDATE CASCADE ON DELETE CASCADE;


CREATE TABLE 티켓금액 (
	좌석등급 VARCHAR(20) NOT NULL,
	금액 INT NOT NULL DEFAULT 0,
	PRIMARY KEY(좌석등급));


CREATE TABLE 결제 (
	결제번호 VARCHAR(20) NOT NULL ,
	공연번호 VARCHAR(20) NOT NULL,
	결제수단 VARCHAR(20) NOT NULL,
	FOREIGN KEY	(결제번호) REFERENCES 예매자(결제번호),
	FOREIGN KEY (공연번호) REFERENCES 공연(공연번호));


INSERT INTO `db_ticketing`.`티켓금액` (`좌석등급`, `금액`)
	VALUES ('N',90000);
INSERT INTO `db_ticketing`.`티켓금액` (`좌석등급`, `금액`)
	VALUES ('V',150000);
INSERT INTO `db_ticketing`.`티켓금액` (`좌석등급`, `금액`)
	VALUES ('R',130000);
INSERT INTO `db_ticketing`.`티켓금액` (`좌석등급`, `금액`)
	VALUES ('S',100000);
INSERT INTO `db_ticketing`.`티켓금액` (`좌석등급`, `금액`)
	VALUES ('A',70000);


INSERT INTO `db_ticketing`.`회원` (`회원번호`, `이름`, `ID`, `PW`, `생년월일`,`전화번호`, `주소`,`이메일`)
VALUES ('TK001', '전소연', 'soyeon', 'idle', 980826,50030502, '서울특별시강남구', 'soyeon@naver.com');
INSERT INTO `db_ticketing`.`회원` (`회원번호`, `이름`, `ID`, `PW`, `생년월일`,`전화번호`, `주소`,`이메일`)
VALUES ('TK002','조미연','miyeon','idle',970131,50010502,'인천광역시서구','miyeon@naver.com');
INSERT INTO `db_ticketing`.`회원` (`회원번호`, `이름`, `ID`, `PW`, `생년월일`,`전화번호`, `주소`,`이메일`)
VALUES ('TK003','박수영','joy','redvelvet',960903,50040801,'서울특별시도봉구','joy@naver.com');
INSERT INTO `db_ticketing`.`회원` (`회원번호`, `이름`, `ID`, `PW`, `생년월일`,`전화번호`, `주소`,`이메일`)
VALUES ('TK004','손승완','wendy','redvelvet',940221,50030801,'서울특별시성북구','wendy@naver.com');
INSERT INTO `db_ticketing`.`회원` (`회원번호`, `이름`, `ID`, `PW`, `생년월일`,`전화번호`, `주소`,`이메일`)
VALUES ('TK005','강슬기','seulgi','redvelvet',940210,50020801,'경기도안산시','seulgi@naver.com');
INSERT INTO `db_ticketing`.`회원` (`회원번호`, `이름`, `ID`, `PW`, `생년월일`,`전화번호`, `주소`,`이메일`)
VALUES ('TK006','송민호','minho','winner',930330,40030817,'경기도용인군','minho@naver.com');
INSERT INTO `db_ticketing`.`회원` (`회원번호`, `이름`, `ID`, `PW`, `생년월일`,`전화번호`, `주소`,`이메일`)
VALUES ('TK007','강승윤','seungyoon','winner',940121,40040817,'부산광역시해운대구','seungyoon@naver.com');
INSERT INTO `db_ticketing`.`회원` (`회원번호`, `이름`, `ID`, `PW`, `생년월일`,`전화번호`, `주소`,`이메일`)
VALUES ('TK008','이승훈','seunghoon','winner',920111,40020817,'부산광역시동래구','seunghoon@naver.com');
INSERT INTO `db_ticketing`.`회원` (`회원번호`, `이름`, `ID`, `PW`, `생년월일`,`전화번호`, `주소`,`이메일`)
VALUES ('TK009','김진우','jinwoo','winner',910926,40010817,'전라남도영암군','jinwoo@naver.com');
INSERT INTO `db_ticketing`.`회원` (`회원번호`, `이름`, `ID`, `PW`, `생년월일`,`전화번호`, `주소`,`이메일`)
VALUES ('TK010','유희열','toy','antenna',710419,15011024,'서울특별시종로구','toy@naver.com');
INSERT INTO `db_ticketing`.`회원` (`회원번호`, `이름`, `ID`, `PW`, `생년월일`,`전화번호`, `주소`,`이메일`)
VALUES ('TK011','유재석','jaeseok','antenna',720814,15020505,'서울특별시성북구','jaeseok@naver.com');
INSERT INTO `db_ticketing`.`회원` (`회원번호`, `이름`, `ID`, `PW`, `생년월일`,`전화번호`, `주소`,`이메일`)
VALUES ('TK012','정승환','seunghwan','antenna',980219,20161129,'강원도정선군','seunghwan@naver.com');
INSERT INTO `db_ticketing`.`회원` (`회원번호`, `이름`, `ID`, `PW`, `생년월일`,`전화번호`, `주소`,`이메일`)
VALUES ('TK013','백예린','yerin','thevolunteers',970626,20121005,'대전광역시중구','yerin@naver.com');
INSERT INTO `db_ticketing`.`회원` (`회원번호`, `이름`, `ID`, `PW`, `생년월일`,`전화번호`, `주소`,`이메일`)
VALUES ('TK014','신효섭','crush','pnation',920503,20121207,'서울특별시서초구','crush@naver.com');
INSERT INTO `db_ticketing`.`회원` (`회원번호`, `이름`, `ID`, `PW`, `생년월일`,`전화번호`, `주소`,`이메일`)
VALUES ('TK015','이하이','hi','aomg',960923,20121029,'경기도부천시','hi@naver.com');
INSERT INTO `db_ticketing`.`회원` (`회원번호`, `이름`, `ID`, `PW`, `생년월일`,`전화번호`, `주소`,`이메일`)
VALUES ('TK020','임성빈','beenjino','1llionaire',870912,20090227,'서울특별시강남구','beenjino@naver.com');
INSERT INTO `db_ticketing`.`회원` (`회원번호`, `이름`, `ID`, `PW`, `생년월일`,`전화번호`, `주소`,`이메일`)
VALUES ('TK021','조성우','codekunst','aomg',891218,20130628,'인천광역시연수구','codekunst@naver.com');


INSERT INTO `db_ticketing`.`예매자` (`티켓번호`, `결제번호`, `회원번호`, `이름`, `티켓수`,`이메일`, `전화번호`)
	VALUES ('CC001N001','C001','TK001','전소연',3,'soyeon@naver.com',50030502);
INSERT INTO `db_ticketing`.`예매자` (`티켓번호`, `결제번호`, `회원번호`, `이름`, `티켓수`,`이메일`, `전화번호`)
	VALUES ('CC001N002','C002','TK002','조미연',1,'miyeon@naver.com',50010502);
INSERT INTO `db_ticketing`.`예매자` (`티켓번호`, `결제번호`, `회원번호`, `이름`, `티켓수`,`이메일`, `전화번호`)
	VALUES ('OP001S001','C003','TK003','박수영',4,'joy@naver.com',50040801);
INSERT INTO `db_ticketing`.`예매자` (`티켓번호`, `결제번호`, `회원번호`, `이름`, `티켓수`,`이메일`, `전화번호`)
	VALUES ('OP001V001','C004','TK004','손승완',3,'wendy@naver.com',50030801);
INSERT INTO `db_ticketing`.`예매자` (`티켓번호`, `결제번호`, `회원번호`, `이름`, `티켓수`,`이메일`, `전화번호`)
	VALUES ('OP001R001','C005','TK005','강슬기',2,'seulgi@naver.com',50020801);
INSERT INTO `db_ticketing`.`예매자` (`티켓번호`, `결제번호`, `회원번호`, `이름`, `티켓수`,`이메일`, `전화번호`)
	VALUES ('MS001V001','C006','TK006','송민호',3,'minho@naver.com',40030817);
INSERT INTO `db_ticketing`.`예매자` (`티켓번호`, `결제번호`, `회원번호`, `이름`, `티켓수`,`이메일`, `전화번호`)
	VALUES ('MS001R001','C007','TK007','강승윤',4,'seungyoon@naver.com',40040817);
INSERT INTO `db_ticketing`.`예매자` (`티켓번호`, `결제번호`, `회원번호`, `이름`, `티켓수`,`이메일`, `전화번호`)
	VALUES ('MS001A001','C008','TK008','이승훈',2,'seunghoon@naver.com',40020817);
INSERT INTO `db_ticketing`.`예매자` (`티켓번호`, `결제번호`, `회원번호`, `이름`, `티켓수`,`이메일`, `전화번호`)
	VALUES ('MS001S001','C009','TK009','김진우',1,'jinwoo@naver.com',40010817);
INSERT INTO `db_ticketing`.`예매자` (`티켓번호`, `결제번호`, `회원번호`, `이름`, `티켓수`,`이메일`, `전화번호`)
	VALUES ('CC002N001','D001','TK010','유희열',1,'toy@naver.com',15011024);
INSERT INTO `db_ticketing`.`예매자` (`티켓번호`, `결제번호`, `회원번호`, `이름`, `티켓수`,`이메일`, `전화번호`)
	VALUES ('CC002N002','D002','TK011','유재석',2,'jaeseok@naver.com',15020505);
INSERT INTO `db_ticketing`.`예매자` (`티켓번호`, `결제번호`, `회원번호`, `이름`, `티켓수`,`이메일`, `전화번호`)
	VALUES ('CC002N003','C010','TK012','정승환',3,'seunghwan@naver.com',20161129);
INSERT INTO `db_ticketing`.`예매자` (`티켓번호`, `결제번호`, `회원번호`, `이름`, `티켓수`,`이메일`, `전화번호`)
	VALUES ('FV001N001','C012','TK014','신효섭',1,'crush@naver.com',20121207);
INSERT INTO `db_ticketing`.`예매자` (`티켓번호`, `결제번호`, `회원번호`, `이름`, `티켓수`,`이메일`, `전화번호`)
	VALUES ('FV001N002','C013','TK015','이하이',2,'hi@naver.com',20121029);
INSERT INTO `db_ticketing`.`예매자` (`티켓번호`, `결제번호`, `회원번호`, `이름`, `티켓수`,`이메일`, `전화번호`)
	VALUES ('FV001N003','D007','TK020','임성빈',1,'beenjino@naver.com',20090227);
INSERT INTO `db_ticketing`.`예매자` (`티켓번호`, `결제번호`, `회원번호`, `이름`, `티켓수`,`이메일`, `전화번호`)
	VALUES ('FV001N004','D008','TK021','조성우',1,'codekunst@naver.com',20130628);
    
    
INSERT INTO `db_ticketing`.`주최자` (`주최자번호`,`회사명`,`회사이메일`,`회사주소`)
	VALUES ('101','큐브엔터','a@cubeent.co.kr','서울시 성동구');
INSERT INTO `db_ticketing`.`주최자` (`주최자번호`,`회사명`,`회사이메일`,`회사주소`)
	VALUES ('102','신시컴퍼니','web@iseensee.com','서울시서초구');
INSERT INTO `db_ticketing`.`주최자` (`주최자번호`,`회사명`,`회사이메일`,`회사주소`)
	VALUES ('103','안테나','au@antenna.co.kr','서울시강남구');
INSERT INTO `db_ticketing`.`주최자` (`주최자번호`,`회사명`,`회사이메일`,`회사주소`)
	VALUES ('104','비이피씨탄젠트','info@bepc.co.kr','서울시강남구');
INSERT INTO `db_ticketing`.`주최자` (`주최자번호`,`회사명`,`회사이메일`,`회사주소`)
	VALUES ('105','국립오페라단','kno@nopera.org','서울시서초구');
    
    
INSERT INTO `db_ticketing`.`공연` (`공연번호`,`공연이름`,`공연종류`,`공연시간`,`공연날짜` ,`공연규모` ,`공연장소` ,`출연진`, `주최자번호`)
	VALUES ('CC001','JUSTMEI-DLE','CONCERT',150,2022061720,3000,'올림픽공원올림픽홀','(G)I-DLE', '101');
INSERT INTO `db_ticketing`.`공연` (`공연번호`,`공연이름`,`공연종류`,`공연시간`,`공연날짜` ,`공연규모` ,`공연장소` ,`출연진`, `주최자번호`)
	VALUES ('MS001','아이다','MUSICAL',160,2022060614,1700,'블루스퀘어신한카드홀','아이다팀', '102');
INSERT INTO `db_ticketing`.`공연` (`공연번호`,`공연이름`,`공연종류`,`공연시간`,`공연날짜` ,`공연규모` ,`공연장소` ,`출연진`, `주최자번호`)
	VALUES ('CC002','TheDreamer','CONCERT',120,2022060320,2700,'블루스퀘어마스터카드홀','권진아', '103');
INSERT INTO `db_ticketing`.`공연` (`공연번호`,`공연이름`,`공연종류`,`공연시간`,`공연날짜` ,`공연규모` ,`공연장소` ,`출연진`, `주최자번호`)
	VALUES ('FV001','2022서울파크뮤직페스티벌','FESTIVAL',420,2022062514,10000,'올림픽공원88잔디마당','다수', '104');
INSERT INTO `db_ticketing`.`공연` (`공연번호`,`공연이름`,`공연종류`,`공연시간`,`공연날짜` ,`공연규모` ,`공연장소` ,`출연진`, `주최자번호`)
	VALUES ('OP001','시칠리아섬의저녁기도','OPERA',205,2022060415,2200,'예술의전당오페라극장','국립오페라단', '105');


INSERT INTO `db_ticketing`.`결제` (`결제번호`, `결제수단`, `공연번호`)
	VALUES ('C001','CARD','CC001');
INSERT INTO `db_ticketing`.`결제` (`결제번호`, `결제수단`, `공연번호`)
	VALUES ('C002','CARD','CC001');
INSERT INTO `db_ticketing`.`결제` (`결제번호`, `결제수단`, `공연번호`)
	VALUES ('C003','CARD','OP001');
INSERT INTO `db_ticketing`.`결제` (`결제번호`, `결제수단`, `공연번호`)
	VALUES ('C004','CARD','OP001');
INSERT INTO `db_ticketing`.`결제` (`결제번호`, `결제수단`, `공연번호`)
	VALUES ('C005','CARD','OP001');
INSERT INTO `db_ticketing`.`결제` (`결제번호`, `결제수단`, `공연번호`)
	VALUES ('C006','CARD','MS001');
INSERT INTO `db_ticketing`.`결제` (`결제번호`, `결제수단`, `공연번호`)
	VALUES ('C007','CARD','MS001');
INSERT INTO `db_ticketing`.`결제` (`결제번호`, `결제수단`, `공연번호`)
	VALUES ('C008','CARD','MS001');
INSERT INTO `db_ticketing`.`결제` (`결제번호`, `결제수단`, `공연번호`)
	VALUES ('C009','CARD','MS001');
INSERT INTO `db_ticketing`.`결제` (`결제번호`, `결제수단`, `공연번호`)
	VALUES ('D001','DEPOSIT','CC002');
INSERT INTO `db_ticketing`.`결제` (`결제번호`, `결제수단`, `공연번호`)
	VALUES ('D002','DEPOSIT','CC002');
INSERT INTO `db_ticketing`.`결제` (`결제번호`, `결제수단`, `공연번호`)
	VALUES ('C010','CARD','CC002');
INSERT INTO `db_ticketing`.`결제` (`결제번호`, `결제수단`, `공연번호`)
	VALUES ('C012','CARD','FV001');
INSERT INTO `db_ticketing`.`결제` (`결제번호`, `결제수단`, `공연번호`)
	VALUES ('C013','CARD','FV001');
INSERT INTO `db_ticketing`.`결제` (`결제번호`, `결제수단`, `공연번호`)
	VALUES ('D007','DEPOSIT','FV001');
INSERT INTO `db_ticketing`.`결제` (`결제번호`, `결제수단`, `공연번호`)
	VALUES ('D008','DEPOSIT','FV001');


SELECT 예매자.결제번호, 티켓수*금액 as 총결제금액 
FROM 예매자, 티켓금액, 결제 
WHERE 예매자.결제번호 = 결제.결제번호 AND substring(티켓번호,6,1)=좌석등급; 

SELECT ANY_VALUE(공연번호) AS "공연번호", COUNT(공연번호)  AS 주최공연횟수
FROM 공연
GROUP BY 공연.주최자번호;

SELECT ANY_VALUE(substring(티켓번호,1,5)) AS 공연, SUM(티켓수) AS 총관객수 
FROM 결제, 예매자
group by 공연번호 HAVING 공연 = 공연번호;

SELECT ANY_VALUE(공연번호) AS 공연번호, SUM(총결제금액) AS 총수익
FROM  공연, (select 티켓수*금액 as 총결제금액
					FROM 예매자 B, 티켓금액 C, (select 결제번호 from 결제) A, 공연 D
                    WHERE B.결제번호 = A.결제번호 AND substring(티켓번호,6,1)=좌석등급 AND D.공연번호 = substring(티켓번호,1,5)) TM;
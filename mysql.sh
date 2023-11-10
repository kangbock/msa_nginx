#! /bin/bash
# mysql
sudo apt-get install -y mysql-client=8.*
wget --no-check-certificate https://dl.cacerts.digicert.com/DigiCertGlobalRootCA.crt.pem
export LANG="ko_KR.UTF-8"
mysql -h prod-kb97-mysql.mysql.database.azure.com -u admin1 -pIt12345! --ssl-ca=DigiCertGlobalRootCA.crt.pem << FOE
  create database project;
  use project;
  create table member (
	  id int AUTO_INCREMENT NOT NULL primary key,
	  email varchar(30) NOT NULL,
	  full_name varchar(20) NOT NULL,
	  password varchar(20) NOT NULL,
	  phone_number varchar(20) DEFAULT NULL,
	  department_name varchar(20) NOT NULL
  	);

  create table board (
  	board_id int AUTO_INCREMENT NOT NULL primary key,
  	member_id int(10) NOT NULL,
  	title varchar(20) NOT NULL,
  	content varchar(200) NOT NULL,
  	time DATETIME DEFAULT now(),
  	FOREIGN KEY (member_id) REFERENCES member(id)
  	);

CREATE USER 'admin1'@'prod-kb97-mysql.mysql.database.azure.com' IDENTIFIED BY 'It12345!';
GRANT ALL ON project.* TO 'admin1'@'prod-kb97-mysql.mysql.database.azure.com';
  flush privileges;

  SHOW GRANTS FOR CURRENT_USER;

  use project;

  ALTER TABLE member convert to charset utf8;
  ALTER TABLE board convert to charset utf8;

  ALTER TABLE board AUTO_INCREMENT=1;
  SET @COUNT = 0;
  UPDATE board SET board_id = @COUNT:=@COUNT+1;

  SELECT * FROM board, member WHERE member.id = board.member_id;
FOE

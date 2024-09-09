| 권한 유형 | MySQL | PostgreSQL | 설명 |
|----------|-------|------------|------|
| 데이터 조회 | SELECT | SELECT | 테이블이나 뷰의 데이터를 읽을 수 있음 |
| 데이터 삽입 | INSERT | INSERT | 새로운 데이터를 테이블에 삽입할 수 있음 |
| 데이터 수정 | UPDATE | UPDATE | 기존 데이터를 수정할 수 있음 |
| 데이터 삭제 | DELETE | DELETE | 데이터를 삭제할 수 있음 |
| 테이블 생성 | CREATE | CREATE | 새로운 테이블을 생성할 수 있음 |
| 테이블 변경 | ALTER | ALTER | 테이블 구조를 변경할 수 있음 |
| 테이블 삭제 | DROP | DROP | 테이블을 삭제할 수 있음 |
| 인덱스 관리 | INDEX | INDEX | 인덱스를 생성하거나 삭제할 수 있음 |
| 외래 키 | REFERENCES | REFERENCES | 외래 키 제약 조건을 생성할 수 있음 |
| 권한 부여 | GRANT OPTION | WITH GRANT OPTION | 다른 사용자에게 권한을 부여할 수 있음 |
| 프로시저 실행 | EXECUTE | EXECUTE | 저장 프로시저나 함수를 실행할 수 있음 |
| 임시 테이블 | CREATE TEMPORARY TABLES | TEMPORARY | 임시 테이블을 생성할 수 있음 |
| 트리거 | TRIGGER | TRIGGER | 트리거를 생성하거나 실행할 수 있음 |
| 복제 클라이언트 | REPLICATION CLIENT | - | 복제 상태를 확인하고 binlog 정보를 볼 수 있음 |
| 복제 슬레이브 | REPLICATION SLAVE | - | 복제 슬레이브로 작동할 수 있음 |
| 시스템 명령 | SUPER | SUPERUSER | 다양한 관리 작업을 수행할 수 있음 |
| 파일 접근 | FILE | - | 서버의 파일을 읽거나 쓸 수 있음 |
| 프로세스 관리 | PROCESS | - | 서버 프로세스 정보를 볼 수 있음 |
| 사용자 관리 | CREATE USER | CREATEROLE | 새로운 사용자나 역할을 생성할 수 있음 |
| DB 연결 | - | CONNECT | 데이터베이스에 연결할 수 있음 |
| 스키마 사용 | - | USAGE | 스키마를 사용할 수 있음 |
| 전체 삭제 | - | TRUNCATE | 테이블의 모든 데이터를 빠르게 삭제할 수 있음 |


### 권한 주기
```
SHOW MASTER STATUS;

-- 1. 외부 접속 가능한 권한 없는 유저 만들기
CREATE USER 'externaluser'@'%' IDENTIFIED BY 'strong_password';

-- 2. 새로 만든 사용자의 권한 확인
SHOW GRANTS FOR 'externaluser'@'%';

-- 3. REPLICATION CLIENT 권한 지정 후 저장
GRANT RELOAD, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'externaluser'@'%'
GRANT REPLICATION CLIENT ON *.* TO 'externaluser'@'%';
FLUSH PRIVILEGES;

-- 4. SELECT 권한 지정 후 저장 (예: mydb 데이터베이스의 mytable 테이블에 대해)
GRANT SELECT ON mydb.mytable TO 'externaluser'@'%';
FLUSH PRIVILEGES;

-- 5. INSERT 권한 추가 지정 후 저장 (예: mydb 데이터베이스의 mytable 테이블에 대해)
GRANT INSERT ON mydb.mytable TO 'externaluser'@'%';
FLUSH PRIVILEGES;

-- 추가: 현재 사용자(관리자)의 권한 확인
SHOW GRANTS FOR CURRENT_USER();
```

# 테스트
```
-- 1. 데이터베이스 생성
CREATE DATABASE IF NOT EXISTS core;
CREATE DATABASE IF NOT EXISTS core1;

-- 2. core 데이터베이스에 ddd_event 테이블 생성
USE core;
CREATE TABLE IF NOT EXISTS ddd_event (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data VARCHAR(255)
);

-- 3. core1 데이터베이스에 ddd_event 테이블 생성
USE core1;
CREATE TABLE IF NOT EXISTS ddd_event (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data VARCHAR(255)
);

-- 4. 외부 접속 가능한 사용자 생성 (이미 존재하는 경우 이 줄은 제외)
-- CREATE USER 'externaluser'@'%' IDENTIFIED BY 'strong_password';

-- 5. 전역 권한 부여
GRANT RELOAD, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'externaluser'@'%';

-- 6. core.ddd_event 테이블에 대한 특정 권한 부여 (예: SELECT, INSERT, UPDATE, DELETE)
GRANT SELECT, INSERT, UPDATE, DELETE ON core.* TO 'externaluser'@'%';
GRANT SELECT ON core.* TO 'externaluser'@'%';
REVOKE INSERT, UPDATE, DELETE ON core.* FROM 'externaluser'@'%';

-- 7. 권한 변경사항 적용
FLUSH PRIVILEGES;

-- 8. 부여된 권한 확인
SHOW GRANTS FOR 'externaluser'@'%';


INSERT INTO core1.ddd_event (data)  VALUES ('rrr'); 
```
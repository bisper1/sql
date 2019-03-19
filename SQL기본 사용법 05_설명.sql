# 트랜젝션 : 데이터 베이스의 추가, 수정, 삭제,
# 조회 명령 실행 시 특정 세이브 포인트를 두고
# 정상적으로 실행되지 않았을 경우 세이브 포인트로
# 데이터를 되돌리는 작업

# 트랜젝션 사용 시 모든 SQL 실행 내용은 메모리에
# 저장이되고 실제 DB에는 적용되지 않음
# commit 명령이 실행되어야만 실제 DB에 적용됨

# 트랜젝션을 사용할 수 없는 범위
# DROP DATABASE;
# DROP TRABLE;
# ALTER TABLE;

# TCL 기본 명령어
# commit : SQL 명령을 DB에 적용함
# rollback : SQL 명령을 취소함(세이브 포인트로 이동)
# savepoint : 세이브 포인트 지정
# rollback to savepoint [index] : 지정한 세이브
# 포인트로 이동
# release savepoint [index] : 지정한 세이브 포인트
# 삭제

# ROLLBACK / COMMIT 명령을 사용하면 모든 세이브
# 포인트가 삭제 됨

# start transaction;
# SQL 명령 (추가, 삭제, 수정)
# commit / rollback

# start transaction;
# savepoint a;
# SQL 명령
# savepoint b;
# SQL 명령
# rollback to savepoint INDEX;


# 인덱스 : 데이터 베이스의 정보 조회 시간을 단축
# 하기 위해서 인덱스의 개념을 사용
# DDL 중의 하나임
# CREATE, ALTER, DROP 명령을 사용하여 index를
# 추가, 수정, 삭제 함
# DBMS의 종류에 따라 index의 수정이 불가능할 수
# 있기 때문에 index를 수정할 경우 index를 삭제하고
# 다시 생성하는 것이 좋음

# ALTER TABLE 테이블
# ADD INDEX 인덱스명(컬럼);

# ALTER TABLE 테이블
# DROP INDEX 인덱스명

# SHOW INDEX FROM 테이블


# VIEW : 기존의 쿼리문을 기반으로 생성되는
# 가상의 테이블
# join이나 다중 쿼리문을 사용하여 가상의 테이블을
# 생성하고, 단순 쿼리문으로 사용함
# 뷰는 수정이 불가능하여 생성과 삭제만 가능

# 뷰는 데이터 베이스의 보안성을 높여줌
# DB 사용권한을 제어하여 사용자에게 실제 테이블은
# 숨기고 뷰만 제공하여 보안성을 높임

# 장점 : 논리적 데이터 독립성을 제공
# 사용자의 데이터 관리를 간단하게 제공
# 접근 제어를 통한 보안이 제공
# 동일 데이터에 대해서 동시에 여러 사용자의 요구를
# 지원함

# 단점 : 독립적인 인덱스가 없음
# 뷰의 수정이 불가능함
# 뷰로 구성된 테이블은 추가, 수정, 삭제에 제약이 있음

# CREATE VIEW 뷰이름 AS SELECT문
# DROP VIEW 뷰이름










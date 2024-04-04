-- 페이징 --

---------------------------------------------------------------------------

1.ROWNUM 사용

SELECT ROWNUM,BNO,MENU_ID,TITLE,CONTENT,WRITER,REGDATE,HIT
FROM BOARD;


2.ROW_NUMBER() 사용

SELECT * FROM(
              SELECT ROW_NUMBER() OVER (ORDER BY BNO DESC) RN,BNO,MENU_ID,TITLE,
              CONTENT,WRITER,REGDATE,HIT           FROM BOARD) T
WHERE RN BETWEEN 1 AND 10;

--SET TIMING ON : 실행까지 도달하는 시간
SET TIMING ON
  SELECT * FROM(
              SELECT ROW_NUMBER() OVER (ORDER BY BNO DESC) RN,BNO,MENU_ID,TITLE,
              CONTENT,WRITER,REGDATE,HIT           FROM BOARD) T
WHERE RN BETWEEN 1 AND 10;

3.OFFSET..FETCH..

SELECT BNO,
       MENU_ID,
       TITLE,
       CONTENT,
       WRITER,
       TO_CHAR(REGDATE,'YYYY-MM-DD') REGDATE,
       HIT
FROM BOARD
ORDER BY BNO DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;

-------------------------------------------------------------------------------
-- 게시물 1000번까지 추가 --

DECLARE  
  DATA1 VARCHAR2(100) := 'HTML 게시물 ';
BEGIN
  FOR  I  IN   13 .. 1000
  LOOP
    INSERT INTO BOARD (  BNO,  MENU_ID,  TITLE,          CONTENT,  WRITER,  REGDATE,  HIT ) 
    VALUES            (  I,  'MENU01', DATA1 || I ,  '내용',   'user05',   sysdate,  0  );    
  END LOOP;
  COMMIT;
END;
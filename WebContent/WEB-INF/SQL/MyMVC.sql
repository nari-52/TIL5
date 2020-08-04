    ------ *** JSP & Sevlet MyMVC 에서 작업한 것 *** -------

    show user;
    -- USER이(가) "MYORAUSER"입니다.
    
    -- /memberRegister.do 을 했을때 회원가입을 위한 테이블 생성한다. --
    create table mymvc_member
    (userid        varchar2(20) not null
    ,passwd        varchar2(20) not null
    ,name          varchar2(20) not null
    ,email         varchar2(50) not null
    ,gender        varchar2(1)  not null
    ,interest      varchar2(80)
    ,registerday   date default sysdate   -- RR/MM/DD  to_char(sysdate,'yyyy-mm-dd hh24:mi:ss')
    ,constraint PK_mymvc_member primary key(userid)
    ,constraint UQ_mymvc_member_email unique(email)
    );
    
    select *
    from mymvc_member;
    
    
    select userid, name, email, gender, interest, 
           to_char(registerday, 'yyyy-mm-dd hh24:mi:ss') AS registerday
    from mymvc_member
    where userid = 'Leess';
    
    
    select userid, name, email, gender, interest, 
           to_char(registerday, 'yyyy-mm-dd hh24:mi:ss') AS registerday
    from mymvc_member
    order by registerday desc;
    
    
    update mymvc_member set 
    where userid = 'Eomjh';
    
    
    --mymvc_member 테이블에 가입인사(introduce) 컬럼을 추가한다.
    
    alter table mymvc_member
    add introduce varchar2(500);
    
    select userid, name, email, gender, interest, 
           to_char(registerday, 'yyyy-mm-dd hh24:mi:ss') AS registerday,
           introduce
    from mymvc_member
    order by registerday desc;
    
    commit;
    
    update mymvc_member set introduce = '<script>window.onload=function(){ var arrBody = document.getElementsByTagName("body"); arrBody[0].style.backgroundColor="red"; arrBody[0].style.fontSize="20pt"; }</script>'
    where userid = 'Iyou12';
    

    ------------------------ >>> 쇼핑몰 <<< --------------------------------
    
    create table mymvc_main_image
    (imgno           number not null
    ,imgfilename     varchar2(100) not null
    ,constraint PK_mymvc_main_image primary key(imgno)
    );
    
    create sequence seq_main_image
    start with 1
    increment by 1
    nomaxvalue
    nominvalue
    nocycle
    nocache;
    
    insert into mymvc_main_image(imgno, imgfilename) values(seq_main_image.nextval, '미샤.png');  
    insert into mymvc_main_image(imgno, imgfilename) values(seq_main_image.nextval, '원더플레이스.png'); 
    insert into mymvc_main_image(imgno, imgfilename) values(seq_main_image.nextval, '레노보.png'); 
    insert into mymvc_main_image(imgno, imgfilename) values(seq_main_image.nextval, '동원.png'); 
    
    commit;
    
    select imgno, imgfilename 
    from mymvc_main_image
    order by imgno asc;
    
    -------------------------- >>> quiztest <<< --------------------------------
    create table tbl_quiztest
    (userid         varchar2(20) not null
    ,name          varchar2(10) not null
    ,gender         varchar2(10) not null       
    ,constraint PK_tbl_quiztest primary key(userid)
    );
    
    select *
    from tbl_quiztest;
    
    
    create table ncstest_member
    (userId varchar2(20) not null
    ,userName varchar2(20) not null
    ,birthday varchar2(10) not null
    ,gender number(1) not null
    ,registerDay date default sysdate
    ,constraint PK_ncstest_member_userid primary key(userId)
    ,constraint CK_ncstest_member_gender check( gender in(1,2) )
    );
    
    select userId, userName, birthday, gender
    from ncstest_member;
    
    insert into ncstest_member(userId, userName, birthday, gender)
    values('kimth', '김태희', '19950502', 2);
    
    ------------ *** ajaxstudy 관련 *** ------------------
    create table test_ajaxnews
    (seqtitleno   number not null
    ,title        varchar2(200) not null
    ,registerday  date default sysdate not null
    ,constraint PK_test_ajaxnews_seqtitleno primary key(seqtitleno)
    );
    
    create sequence seq_test_ajaxnews_seqtitleno
    start with 1
    increment by 1
    nomaxvalue
    nominvalue
    nocycle
    nocache;
    
    insert into test_ajaxnews(seqtitleno, title) values(seq_test_ajaxnews_seqtitleno.nextval, '''남달라'' 박성현 LPGA 투어 텍사스 클래식 우승, 시즌 첫 승' );
    insert into test_ajaxnews(seqtitleno, title) values(seq_test_ajaxnews_seqtitleno.nextval, '뼈아픈 연패-전패, 아직 한번도 못 이겼다고?' );
    insert into test_ajaxnews(seqtitleno, title) values(seq_test_ajaxnews_seqtitleno.nextval, '전설들과 어깨 나란히 한 김해림 "4연패도 노려봐야죠"');
    insert into test_ajaxnews(seqtitleno, title) values(seq_test_ajaxnews_seqtitleno.nextval, '삼성·현대차 들쑤신 엘리엇, 이번엔 伊 최대통신사 삼켰다');
    insert into test_ajaxnews(seqtitleno, title) values(seq_test_ajaxnews_seqtitleno.nextval, '"야구장, 어떤 음악으로 채우나" 응원단장들도 괴롭다');
    insert into test_ajaxnews(seqtitleno, title) values(seq_test_ajaxnews_seqtitleno.nextval, '"공부 후 10분의 휴식, 기억력 높인다"');
    insert into test_ajaxnews(seqtitleno, title) values(seq_test_ajaxnews_seqtitleno.nextval, '현대차, 쏘나타 ''익스트림 셀렉션'' 트림 출시… 사양과 가격은?');
    insert into test_ajaxnews(seqtitleno, title) values(seq_test_ajaxnews_seqtitleno.nextval, '날씨무더위 계속…곳곳 강한 소나기');
    
    commit;
    
    select *
    from test_ajaxnews;
    
    select seqtitleno 
         , case when length(title) > 22 then substr(title, 1, 20)||'..'
           else title end AS title
         , to_char(registerday, 'yyyy-mm-dd hh24:mi:ss') AS registerday
    from test_ajaxnews
    order by seqtitleno desc;
    
    create table test_ajaxnews_contents
    ( fk_seqtitleno         number not null
    , newscontents          varchar2(4000) not null
    , constraint PK_test_ajaxnews_contents primary key(fk_seqtitleno)
    , constraint FK__test_ajaxnews_contents foreign key (fk_seqtitleno) 
                                                        references test_ajaxnews (seqtitleno) on delete cascade
    );
    
    insert into test_ajaxnews_contents (fk_seqtitleno, newscontents)
    values (1, ' 박성현 LPGA 기사 내용 입니다.');
    
    insert into test_ajaxnews_contents (fk_seqtitleno, newscontents)
    values (2, '연패, 전패 기사 내용 입니다. ');

    insert into test_ajaxnews_contents (fk_seqtitleno, newscontents)
    values (3, '김해림 기사 내용 입니다. ');

    insert into test_ajaxnews_contents (fk_seqtitleno, newscontents)
    values (4, '삼성 현대차 기사 내용 입니다. ');
    
    insert into test_ajaxnews_contents (fk_seqtitleno, newscontents)
    values (5, '야구장 응원 음악 기사 내용 입니다. ');
    
    insert into test_ajaxnews_contents (fk_seqtitleno, newscontents)
    values (6, '공부 후 10분 휴식 기사 내용 입니다. ');
    
    insert into test_ajaxnews_contents (fk_seqtitleno, newscontents)
    values (7, '현대차 쏘나타 기사 내용 입니다. ');
    
    insert into test_ajaxnews_contents (fk_seqtitleno, newscontents)
    values (8, '날씨 무더위 기사 내용 입니다. ');

    commit;
    
    select fk_seqtitleno, newscontents
    from test_ajaxnews_contents
    order by fk_seqtitleno desc;
    
    select fk_seqtitleno, newscontents
    from test_ajaxnews_contents
    where fk_seqtitleno = 8;
    
    select fk_seqtitleno, newscontents
    from test_ajaxnews_contents
    where fk_seqtitleno = '2' ;
    
    
    select seq_test_ajaxnews_seqtitleno.nextval
    from dual;
    
    ------ === GSON 관련 === -----
    create table test_ajaxemp
    (ename varchar2(20)
    ,jik   varchar2(10)
    ,tel   varchar2(20)
    ,email varchar2(30) unique not null
    ,birthday varchar2(20)
    );
    
    select ename, jik, tel, email, birthday 
    from test_ajaxemp
    order by ename;
    
    
    --- === 6/10 === ---
    --- *** 회원 테이블 생성 *** ---  
    
    drop table mymvc_shopping_member purge;
    drop sequence seq_shopping_member;
    
    
    create table mymvc_shopping_member
    (idx                number(10)     not null       -- 회원번호(시퀀스로 데이터가 들어온다)
    ,userid             varchar2(20)   not null       -- 회원아이디
    ,name               varchar2(30)   not null       -- 회원명
    ,pwd                varchar2(200)  not null       -- 비밀번호 (SHA-256 암호화 대상)
    ,email              varchar2(200)  not null       -- 이메일   (AES-256 암호화/복호화 대상)
    ,hp1                varchar2(3)                   -- 연락처
    ,hp2                varchar2(200)                 --         (AES-256 암호화/복호화 대상) 
    ,hp3                varchar2(200)                 --         (AES-256 암호화/복호화 대상)
    ,postcode           varchar2(5)                    -- 우편번호
    ,address            varchar2(200)                  -- 주소
    ,detailaddress      varchar2(200)                 -- 상세주소
    ,extraaddress       varchar2(200)                 -- 참고항목
    ,gender             varchar2(1)                    -- 성별     남자 : 1 / 여자 : 2
    ,birthday           varchar2(8)                   -- 생년월일 
    ,coin               number default 0              -- 코인액
    ,point              number default 0              -- 포인트 
    ,registerday        date default sysdate          -- 가입일자
    ,status             number(1) default 1           -- 회원탈퇴유무   1:사용가능(가입중) / 0:사용불능(탈퇴) 
    ,lastLoginDate      date default sysdate          -- 마지막으로 로그인 한 날짜시간 기록용
    ,lastPwdChangeDate  date default sysdate          -- 마지막으로 암호를 변경한 날짜시간 기록용
    ,clientip           varchar2(20)                  -- 클라이언트의 IP 주소
    ,constraint   PK_mymvc_shopping_member primary key(idx)
    ,constraint   UQ_mymvc_shopping_member unique(userid)
    ,constraint   CK_mymvc_shopping_member_gen check( gender in('1','2') ) 
    ,constraint   CK_mymvc_shopping_member_sta check( status in(0,1) ) 
    );
    
    create sequence seq_shopping_member
    start with 1
    increment by 1
    nomaxvalue
    nominvalue
    nocycle
    nocache;
    
    -- 쇼핑몰 회원정보 확인하기    
    select *
    from mymvc_shopping_member
    order by idx desc;
    
    select *
    from mymvc_shopping_member
    where userid = 'chaew' and 
          pwd = '9695b88a59a1610320897fa84cb7e144cc51f2984520efb77111d94b402a8382';
    
    
    select idx, userid, name, email, hp1, hp2, hp3, postcode, address, detailaddress, extraAddress, gender   
         , substr(birthday,1,4) AS birthyyyy, substr(birthday,5,2) AS birthmm, substr(birthday, 7) AS birthdd  
         , coin, point, to_char(registerday,'yyyy-mm-dd') AS registerday  
         , trunc( months_between(sysdate, lastPwdChangeDate) ) AS pwdchangegap  
         , trunc( months_between(sysdate, lastLoginDate) ) AS lastlogindategap 
    from mymvc_shopping_member 
    order by idx asc;
    
    select 10 + 20, 10+'20'
    from dual;
    
    
    -- 회원 대량 가입
    create or replace procedure pcd_shopping_member_insert
    (p_userid  IN  varchar2
    ,p_name    IN  varchar2
    ,p_gender  IN  char)
    is
    begin
        for i in 1..100 loop 
            insert into mymvc_shopping_member(idx, userid, name, pwd, email, hp1, hp2, hp3, postcode, address, detailAddress, extraAddress, gender, birthday, coin, point, registerday, status, lastlogindate, lastpwdchangedate, clientip) 
            values(seq_shopping_member.nextval, p_userid||i, p_name||i, '9695b88a59a1610320897fa84cb7e144cc51f2984520efb77111d94b402a8382', 'WexRoSCUR+DTsl8Bq6/LGgMaf23t3lAvQOsOoiwF4ec=' , '010', 'iDv/rCj9QUBuWZXKog0G9A==', '2ZzeSz8AqzlhPjutqsXUfw==', '50234', '서울 송파구 오금로 95', '337동 708호', '오금동 현대아파트', p_gender, '19960920', default, default, default, default, default, default, '127.0.0.1');         
        end loop;
    end pcd_shopping_member_insert;   
    -- Procedure PCD_SHOPPING_MEMBER_INSERT이(가) 컴파일되었습니다.      
    
    execute pcd_shopping_member_insert('kimmr','김마리','2');
    
    execute pcd_shopping_member_insert('jojw','조진웅','1');
    
    commit;
    
    insert into mymvc_shopping_member(idx, userid, name, pwd, email, hp1, hp2, hp3, postcode, address, detailAddress, extraAddress, gender, birthday, coin, point, registerday, status, lastlogindate, lastpwdchangedate, clientip) 
    values(seq_shopping_member.nextval, 'youjs1', '유재석1', '9695b88a59a1610320897fa84cb7e144cc51f2984520efb77111d94b402a8382', 'KaDz2RcfIWg51HF/fFWvOxLoX5Y6H9S5+AmisF8ovv0=' , '010', '5vlo5ZBnIbLMyMz3NtK38A==', 'TYENQOsy0AExa9/mtma0ow==', '50234', '서울 송파구 오금로 95', '337동 708호', '오금동 현대아파트', '1', '19960920', default, default, default, default, default, default, '127.0.0.1');
    
    insert into mymvc_shopping_member(idx, userid, name, pwd, email, hp1, hp2, hp3, postcode, address, detailAddress, extraAddress, gender, birthday, coin, point, registerday, status, lastlogindate, lastpwdchangedate, clientip) 
    values(seq_shopping_member.nextval, 'youjs2', '유재석2', '9695b88a59a1610320897fa84cb7e144cc51f2984520efb77111d94b402a8382', 'KaDz2RcfIWg51HF/fFWvOxLoX5Y6H9S5+AmisF8ovv0=' , '010', '5vlo5ZBnIbLMyMz3NtK38A==', 'TYENQOsy0AExa9/mtma0ow==', '50234', '서울 송파구 오금로 95', '337동 708호', '오금동 현대아파트', '1', '19960920', default, default, default, default, default, default, '127.0.0.1');
        
    commit;        
    
    -------- *** 페이징 처리하기 *** --------------
    -- 1페이지당 보여줄 회원의 명 수 (3, 5, 10)
    
    -- rownum은 행번호 인데, where 절에 바로 사용할 수 없지만,
    -- inline view를 통해서 where 절에 사용할 수 있다.
    
    
    
    select RNO, idx, userid, name, email, gender
    from    
    (
        select rownum AS RNO, idx, userid, name, email, gender
        from 
        (
        select idx, userid, name, email, gender
        from mymvc_shopping_member
        order by idx desc
        ) V
    ) T
    where T.RNO between 1 and 10; -- 1페이지당 10개씩 보여줄 때 1페이지 내용
    
    
    select RNO, idx, userid, name, email, gender
    from    
    (
        select rownum AS RNO, idx, userid, name, email, gender
        from 
        (
        select idx, userid, name, email, gender
        from mymvc_shopping_member
        order by idx desc
        ) V
    ) T
    where T.RNO between 1 and 5; -- 1페이지당 5개씩 보여줄 때 1페이지 내용
    
    select RNO, idx, userid, name, email, gender
    from    
    (
        select rownum AS RNO, idx, userid, name, email, gender
        from 
        (
        select idx, userid, name, email, gender
        from mymvc_shopping_member
        order by idx desc
        ) V
    ) T
    where T.RNO between 1 and 3; -- 1페이지당 3개씩 보여줄 때 1페이지 내용
            
    select RNO, idx, userid, name, email, gender
    from 
    (
        select rownum AS RNO, idx, userid, name, email, gender
        from
        (
        select idx, userid, name, email, gender
        from mymvc_shopping_member
        order by idx desc
        ) V
    ) T
    where T.RNO between 11 and 20; ------ 1페이지당 10개씩 보여줄 때 2 페이지 내용
    
    select RNO, idx, userid, name, email, gender
    from 
    (
        select rownum AS RNO, idx, userid, name, email, gender
        from
        (
        select idx, userid, name, email, gender
        from mymvc_shopping_member
        order by idx desc
        ) V
    ) T
    where T.RNO between 6 and 10; ------ 1페이지당 2개씩 보여줄 때 2 페이지 내용
    
    select RNO, idx, userid, name, email, gender
    from 
    (
        select rownum AS RNO, idx, userid, name, email, gender
        from
        (
        select idx, userid, name, email, gender
        from mymvc_shopping_member
        order by idx desc
        ) V
    ) T
    where T.RNO between 4 and 6; ------ 1페이지당 3개씩 보여줄 때 2 페이지 내용
    
    select RNO, idx, userid, name, email, gender
    from 
    (
        select rownum AS RNO, idx, userid, name, email, gender
        from
        (
        select idx, userid, name, email, gender
        from mymvc_shopping_member
        order by idx desc
        ) V
    ) T
    where T.RNO between 21 and 30; ------ 1페이지당 10개씩 보여줄 때 3 페이지 내용
    
    --- 1페이지당 10명(개)씩 보여주고자 할 때 총 페이지갯수는 얼마일까요?
    select count(*)
    from mymvc_shopping_member; -- 행 갯수 => 207개
    
    select ( select count(*)  from mymvc_shopping_member ) /10
    from dual; -- 20.7
    -- 1 2 3 4 ..... 19 20 21

    select ceil( count(*)/10 ) AS 총페이지수
    from mymvc_shopping_member      -- 21
    
    select ceil( count(*)/5 ) AS 총페이지수
    from mymvc_shopping_member      -- 42

    select ceil( count(*)/3 ) AS 총페이지수
    from mymvc_shopping_member      -- 69  
    
    ---------------------------------------------------------------------------------------------------------------------------------------------------------
    -------- *** 검색되어진 결과물 페이징 처리하기 *** --------------
    
    select RNO, idx, userid, name, email, gender
    from    
    (
        select rownum AS RNO, idx, userid, name, email, gender
        from 
        (
        select idx, userid, name, email, gender
        from mymvc_shopping_member
        where name like '%' || '리' || '%'
        order by idx desc
        ) V
    ) T
    where T.RNO between 1 and 10; -- 1페이지당 10개씩 보여줄 때 1페이지 내용
    
    
    select RNO, idx, userid, name, email, gender
    from    
    (
        select rownum AS RNO, idx, userid, name, email, gender
        from 
        (
        select idx, userid, name, email, gender
        from mymvc_shopping_member
        where name like '%' || '리' || '%'
        order by idx desc
        ) V
    ) T
    where T.RNO between 1 and 5; -- 1페이지당 5개씩 보여줄 때 1페이지 내용
    
    select RNO, idx, userid, name, email, gender
    from    
    (
        select rownum AS RNO, idx, userid, name, email, gender
        from 
        (
        select idx, userid, name, email, gender
        from mymvc_shopping_member
        where name like '%' || '리' || '%'
        order by idx desc
        ) V
    ) T
    where T.RNO between 1 and 3; -- 1페이지당 3개씩 보여줄 때 1페이지 내용
    

    
     --- 검색되어진 결과물을 페이징 처리 할 때 1페이지당 10명(개)씩 보여주고자 할 때 총 페이지갯수는 얼마일까요?
    select count(*)
    from mymvc_shopping_member
    where name like '%' || '리' || '%'; -- 행 갯수 => 102개
    
    select ( select count(*)  from mymvc_shopping_member where name like '%' || '리' || '%' ) /10
    from dual; -- 10.2
    -- 1 2 3 4 ..... 11

    select ceil( count(*)/10 ) AS 총페이지수
    from mymvc_shopping_member
    where name like '%' || '리' || '%'; -- 11
    
    select ceil( count(*)/5 ) AS 총페이지수
    from mymvc_shopping_member  
    where name like '%' || '리' || '%'; -- 21

    select ceil( count(*)/3 ) AS 총페이지수
    from mymvc_shopping_member  
    where name like '%' || '리' || '%'; -- 34  
    
    -- 6/19 ----------------------------------------------------------------------------------------------------------------------------------------------------
    
    /*
       카테고리 테이블명 : shopping_category
    
       컬럼정의 
         -- 카테고리 대분류 번호  : 시퀀스(seq_shopping_category_cnum)로 증가함.(Primary Key)
         -- 카테고리 코드(unique) : ex) 전자제품  '100000'
                                      의류      '200000'
                                      도서      '300000' 
         -- 카테고리명(not null)  : 전자제품, 의류, 도서           
      
    */ 
     
    create table shopping_category
    (cnum    number(8)     not null  -- 카테고리 대분류 번호
    ,code    varchar2(20)  not null  -- 카테고리 코드
    ,cname   varchar2(100) not null  -- 카테고리명
    ,constraint PK_shopping_category_cnum primary key(cnum)
    ,constraint UQ_shopping_category_code unique(code)
    );
    
    create sequence seq_shopping_category_cnum
    start with 1
    increment by 1
    nomaxvalue
    nominvalue
    nocycle
    nocache;
    
    insert into shopping_category values(seq_shopping_category_cnum.nextval, '100000', '전자제품');
    insert into shopping_category values(seq_shopping_category_cnum.nextval, '200000', '의류');
    insert into shopping_category values(seq_shopping_category_cnum.nextval, '300000', '도서');
    commit;
    
    -- 나중에 넣습니다.
    --insert into shopping_category values(seq_shopping_category_cnum.nextval, '400000', '식품');
    --commit;
    
    select cnum, code, cname
    from shopping_category
    order by cnum asc;
    
    
    create table shopping_spec
    (snum    number(8)     not null  -- 스펙번호       
    ,sname   varchar2(100) not null  -- 스펙명         
    ,constraint PK_shopping_spec_snum primary key(snum)
    ,constraint UQ_shopping_spec_sname unique(sname)
    );
    
    create sequence seq_shopping_spec
    start with 1
    increment by 1
    nomaxvalue
    nominvalue
    nocycle
    nocache;
    
    insert into shopping_spec(snum, sname) values(seq_shopping_spec.nextval, 'HIT');
    insert into shopping_spec(snum, sname) values(seq_shopping_spec.nextval, 'NEW');
    insert into shopping_spec(snum, sname) values(seq_shopping_spec.nextval, 'BEST');
    
    commit;
    
    select snum, sname
    from shopping_spec
    order by snum asc;
    
    
    ---- *** 제품 테이블 : shopping_product *** ----
    create table shopping_product
    (pnum           number(8) not null       -- 제품번호(Primary Key)
    ,pname          varchar2(100) not null   -- 제품명
    ,pcategory_fk   varchar2(20)             -- 카테고리코드(Foreign Key)
    ,pcompany       varchar2(50)             -- 제조회사명
    ,pimage1        varchar2(100) default 'noimage.png' -- 제품이미지1   이미지파일명
    ,pimage2        varchar2(100) default 'noimage.png' -- 제품이미지2   이미지파일명 
    ,pqty           number(8) default 0      -- 제품 재고량
    ,price          number(8) default 0      -- 제품 정가
    ,saleprice      number(8) default 0      -- 제품 판매가(할인해서 팔 것이므로)
    ,pspec          varchar2(20)             -- 'HIT', 'BEST', 'NEW' 등의 값을 가짐.
    ,pcontent       varchar2(4000)           -- 제품설명  varchar2는 varchar2(4000) 최대값이므로
                                             --          4000 byte 를 초과하는 경우 clob 를 사용한다.
                                             --          clob 는 최대 4GB 까지 지원한다.
                                             
    ,point          number(8) default 0      -- 포인트 점수                                         
    ,pinputdate     date default sysdate     -- 제품입고일자
    ,constraint  PK_shopping_product_pnum primary key(pnum)
    ,constraint  FK_shopping_product foreign key(pcategory_fk) references shopping_category(code)
    );
    
    create sequence seq_shopping_product_pnum
    start with 1
    increment by 1
    nomaxvalue
    nominvalue
    nocycle
    nocache;
    
    insert into shopping_product(pnum, pname, pcategory_fk, pcompany, 
                                 pimage1, pimage2, pqty, price, saleprice,
                                 pspec, pcontent, point)
    values(seq_shopping_product_pnum.nextval, '스마트TV', '100000', '삼성',
           'tv_samsung_h450_1.png','tv_samsung_h450_2.png',
           100,1200000,800000,'HIT','42인치 스마트 TV. 기능 짱!!', 50);
    
    
    insert into shopping_product(pnum, pname, pcategory_fk, pcompany, 
                                 pimage1, pimage2, pqty, price, saleprice,
                                 pspec, pcontent, point)
    values(seq_shopping_product_pnum.nextval, '노트북', '100000', '엘지',
           'notebook_lg_gt50k_1.png','notebook_lg_gt50k_2.png',
           150,900000,750000,'HIT','노트북. 기능 짱!!', 30);  
           
    
    insert into shopping_product(pnum, pname, pcategory_fk, pcompany, 
                                 pimage1, pimage2, pqty, price, saleprice,
                                 pspec, pcontent, point)
    values(seq_shopping_product_pnum.nextval, '바지', '200000', 'S사',
           'cloth_canmart_1.png','cloth_canmart_2.png',
           20,12000,10000,'HIT','예뻐요!!', 5);       
           
    
    insert into shopping_product(pnum, pname, pcategory_fk, pcompany, 
                                 pimage1, pimage2, pqty, price, saleprice,
                                 pspec, pcontent, point)
    values(seq_shopping_product_pnum.nextval, '남방', '200000', '버카루',
           'cloth_buckaroo_1.png','cloth_buckaroo_2.png',
           50,15000,13000,'HIT','멋져요!!', 10);       
           
    
    insert into shopping_product(pnum, pname, pcategory_fk, pcompany, 
                                 pimage1, pimage2, pqty, price, saleprice,
                                 pspec, pcontent, point)
    values(seq_shopping_product_pnum.nextval, '세계탐험보물찾기시리즈', '300000', '아이세움',
           'book_bomul_1.png','book_bomul_2.png',
           100,35000,33000,'HIT','만화로 보는 세계여행', 20);       
           
           
    insert into shopping_product(pnum, pname, pcategory_fk, pcompany, 
                                 pimage1, pimage2, pqty, price, saleprice,
                                 pspec, pcontent, point)
    values(seq_shopping_product_pnum.nextval, '만화한국사', '300000', '녹색지팡이',
           'book_koreahistory_1.png','book_koreahistory_2.png',
           80,130000,120000,'HIT','만화로 보는 이야기 한국사 전집', 60);
           
    commit;     
    
    
    select pnum, pname, pcategory_fk, pcompany, pimage1, pimage2, pqty, price, saleprice, pspec, pcontent, point
         , to_char(pinputdate, 'yyyy-mm-dd') as pinputdate
    from shopping_product
    where pspec = 'HIT'
    order by pnum asc;
    
    
    
    -- 예시
    create table shopping_spec
    (snum    number(8)     not null  -- 스펙번호       
    ,sname   varchar2(100) not null  -- 스펙명         
    ,constraint PK_shopping_spec_snum primary key(snum)
    ,constraint UQ_shopping_spec_sname unique(sname)
    );
    
    -- [Starbucks] -------------------------------------------------------------------------------------------------
    -- 공지사항 게시판
    drop table notice_post purge;
    drop sequence seq_notice_post;

    
    -- 수정
     create table notice_post
    ( notice_seq        number(4)   not null        -- 공지사항시퀀스
    , title             varchar2(100)   not null    -- 글제목
    , contents          varchar2(4000)  not null    -- 글내용
    , write_day         date default sysdate        -- 작성일
    , hit               Number(4) default 0         -- 조회수
    , constraint PK_notice_post_notice_seq primary key(notice_seq)
    );
    
    
    
  /* 
    alter table notice_post
    modify hit default 0;
  */  
    -- rownum
     
    -- 공지사항시퀀스
    create sequence seq_notice_post
    start with 1
    increment by 1
    nomaxvalue
    nominvalue
    nocycle
    nocache;
    
    select *
    from notice_post
    
    -- 공지사항 대량기입
    create or replace procedure pcd_notice_post_insert
    (p_title  IN  varchar2
    ,p_contents    IN  varchar2)
    is
    begin
        for i in 1..150 loop 
            insert into notice_post(notice_seq, title, contents, write_day, hit)
            values(seq_notice_post.nextval, p_title||i, p_contents||i, sysdate, 73);
        end loop;
    end pcd_notice_post_insert;   
    -- Procedure pcd_notice_post_insert(가) 컴파일되었습니다.      
    
    execute pcd_notice_post_insert('시스템 개선 및 점검 안내 ','안녕하세요. 스타벅스커피 코리아입니다.');
    
    commit;
    
    
    -- 공지사항 대량기입
    create or replace procedure pcd_notice_post_in
    (p_title  IN  varchar2
    ,p_contents    IN  varchar2)
    is
    begin
        for i in 1..15 loop 
            insert into notice_post(notice_seq, title, contents, write_day, hit)
            values(seq_notice_post.nextval, p_title||i, p_contents||i, sysdate, 73);
        end loop;
    end pcd_notice_post_in;   
    -- Procedure pcd_notice_post_in(가) 컴파일되었습니다.      
    
    execute pcd_notice_post_in('앱 서비스/홈페이지 서비스의 중단안내 ','안녕하세요. 스타벅스커피 코리아입니다. 보다 나은 서비스를 제공해 드리고자 시스템 서버 점검을 아래와 같이 진행합니다.');
    
    commit;
    rollback;
    
    
           
    insert into notice_post (notice_seq, title, contents, write_day)
    values (seq_notice_post.nextval, '공지1', '공지 내용 1', default); 
    insert into notice_post (notice_seq, title, contents, write_day)
    values (seq_notice_post.nextval, '공지2', '공지 내용 2', default); 
    insert into notice_post (notice_seq, title, contents, write_day)
    values (seq_notice_post.nextval, '공지3', '공지 내용 3', default); 

    insert into notice_post (notice_seq, title, contents, write_day)
    values (seq_notice_post.nextval, '페이징1', '페이징 내용1', default); 
    insert into notice_post (notice_seq, title, contents, write_day)
    values (seq_notice_post.nextval, '페이징2', '페이징 내용2', default); 
    insert into notice_post (notice_seq, title, contents, write_day)
    values (seq_notice_post.nextval, '페이징3', '페이징 내용3', default); 

    commit;
    
    select *
    from notice_post
    order by 1 desc;
    
    delete from notice_post
    where notice_seq = 24;
    
  --  update notice_post set hit = 0;
  --  commit;
    
    select seq_notice_post.nextval
    from dual;
    
    select notice_seq, title, to_char(write_day,'yyyy-mm-dd'), hit
    from notice_post
    order by 1 desc;
    
    select notice_seq, title, to_char(write_day,'yyyy-mm-dd') AS write_day , hit 
    from notice_post 
    order by 1 desc;
    
   select rownum AS RNO, notice_seq, title, write_day , hit 
   from  
   ( 
    select notice_seq, notice_seq, to_char(write_day,'yyyy-mm-dd') AS write_day , hit 
    from notice_post 
    order by 1 asc
   ) V;
   
   
   -- 공지사항 글 위 아래 글제목 가져오기
 select rno, notice_seq, title, contents, write_day, hit
  from 
  (
        select rno, notice_seq, title, contents, write_day, hit
     from  
     ( 
       select rownum AS RNO, notice_seq, contents, title, write_day , hit 
       from  
       ( 
        select notice_seq, title, contents, to_char(write_day,'yyyy-mm-dd') AS write_day , hit 
        from notice_post 
        order by 1 asc
       ) V 
      ) T 
      order by T.rno desc
  ) p
  where P.rno = '21'
  
String sql = "   select rno, notice_seq, title, write_day, hit\n"+
"  from \n"+
"  (\n"+
"        select rno, notice_seq, title, write_day, hit\n"+
"     from  \n"+
"     ( \n"+
"       select rownum AS RNO, notice_seq, title, write_day , hit \n"+
"       from  \n"+
"       ( \n"+
"        select notice_seq, title, to_char(write_day,'yyyy-mm-dd') AS write_day , hit \n"+
"        from notice_post \n"+
"        order by 1 asc\n"+
"       ) V \n"+
"      ) T \n"+
"      order by T.rno desc\n"+
"  ) p\n"+
"  where P.rno = '21'";
   
   
  select title
  from 
  (
        select rno, notice_seq, title, write_day, hit
     from  
     ( 
       select rownum AS RNO, notice_seq, title, write_day , hit 
       from  
       ( 
        select notice_seq, title, to_char(write_day,'yyyy-mm-dd') AS write_day , hit 
        from notice_post 
        order by 1 asc
       ) V 
      ) T 
      order by T.rno desc
  ) p
  where P.rno = '21'
  
   
 
 -- 공지사항 글번호 순차적으로 보이기 
 select rno, notice_seq, title, write_day, hit
 from  
 ( 
   select rownum AS RNO, notice_seq, title, write_day , hit 
   from  
   ( 
    select notice_seq, title, to_char(write_day,'yyyy-mm-dd') AS write_day , hit 
    from notice_post 
    order by 1 asc
   ) V 
  ) T 
  order by T.rno desc;
    
    
    select title, contents, hit
    from notice_post
    where to_char(notice_seq) = '13';
    
    update notice_post set hit = hit + 1 
	where to_char(notice_seq) = '13';

    select title, contents
    from notice_post
    where notice_seq = 5; 
    
    drop table store_location purge;
    drop sequence seq_store_location;
    
    ----- *** 페이징 처리하기 *** ------
     select rno, notice_seq, title, write_day, hit
     from  
     ( 
       select rownum AS RNO, notice_seq, title, write_day , hit 
       from  
       ( 
        select notice_seq, title, to_char(write_day,'yyyy-mm-dd') AS write_day , hit 
        from notice_post 
        order by 1 asc
       ) V 
      ) T 
      where T.RNO between 11 and 20;
      
-----------------------

select RNO, notice_seq, title, write_day, hit
from  
 ( 
   select rownum AS RNO, notice_seq, title, write_day , hit 
   from  
   ( 
    select notice_seq, title, to_char(write_day,'yyyy-mm-dd') AS write_day , hit 
    from notice_post 
    order by notice_seq desc
   ) V 
 ) T 
where T.RNO between (1*10)-(10-1) and (1*10);

-- 페이징 처리하기 번호 순차적으로 보이기
select (select count(*) from notice_post) - rowno + 1 AS RNO, notice_seq, title, write_day, hit
from  
 ( 
   select rownum AS ROWNO, notice_seq, title, write_day , hit 
   from  
   ( 
    select notice_seq, title, to_char(write_day,'yyyy-mm-dd') AS write_day , hit 
    from notice_post 
    order by notice_seq desc
   ) V 
 ) T 
where T.ROWNO between (1*10)-(10-1) and (1*10);


select (select count(*) from notice_post) - rowno + 1 AS RNO, notice_seq, title, write_day, hit
from  
 ( 
   select rownum AS ROWNO, notice_seq, title, write_day , hit 
   from  
   ( 
    select notice_seq, title, to_char(write_day,'yyyy-mm-dd') AS write_day , hit 
    from notice_post 
    where title like '%' || '앱' || '%'
    order by notice_seq desc
   ) V 
 ) T 
where T.ROWNO between (1*10)-(10-1) and (1*10);



-------------------------
      
      select rno, notice_seq, title, write_day, hit
     from  
     ( 
       select rownum AS RNO, notice_seq, title, write_day , hit 
       from  
       ( 
        select notice_seq, title, to_char(write_day,'yyyy-mm-dd') AS write_day , hit 
        from notice_post 
        order by 1 asc
       ) V 
      ) T 
      where T.RNO between 4 and 6;
    
    select count(*)
    from notice_post; -- 행 개수 => 13개
    
    select ceil(count(*)/10) AS totalPage
    from notice_post; -- 총 페이지수
    
    
    
    
    
    -- 매장위치 테이블 시퀀스 삭제
    drop table store_location purge;
    drop sequence seq_store_location;
    
    -- 매장위치
    create table store_location
    ( store_id          varchar2(30)   not null     -- 매장아이디
    , store_sequence    number(4)   not null        -- 매장시퀀스
    , store_name        varchar2(50)   not null     -- 매장명
    , address           varchar2(200)  not null     -- 주소
    , url               varchar2(200)   not null    -- 매장 홈페이지 url
    , latitude          number  not null            -- 위도
    , longitude         number  not null            -- 경도
    , zindex            number(4)   not null        -- zindex
    , constraint PK_store_location_sid primary key(store_id)
    );
    
    -- 매장위치 매장시퀀스
    create sequence seq_store_location
    start with 1
    increment by 1
    nomaxvalue
    nominvalue
    nocycle
    nocache;
    
    select *
    from store_location;
    
    -- 매장위치 데이터 삽입
    insert into store_location (store_id, store_sequence, store_name, address, url, latitude, longitude, zindex)
    values (1, seq_store_location.nextval, '스타벅스 을지로삼화타워점', '서울특별시 중구 수하동 을지로5길 16', 'https://place.map.kakao.com/17884783', 37.566996, 126.984612, seq_store_location.nextval);
    insert into store_location (store_id, store_sequence, store_name, address, url, latitude, longitude, zindex)
    values (2, seq_store_location.nextval, '스타벅스 종로관철점', '서울특별시 종로구 관철동 종로12길 21', 'https://place.map.kakao.com/12700362', 37.569023, 126.986006, seq_store_location.nextval);
    insert into store_location (store_id, store_sequence, store_name, address, url, latitude, longitude, zindex)
    values (3, seq_store_location.nextval, '스타벅스 종각점', '서울특별시 종로구 종로2가 종로 64', 'https://place.map.kakao.com/8405079', 37.569993, 126.984534, seq_store_location.nextval);
    insert into store_location (store_id, store_sequence, store_name, address, url, latitude, longitude, zindex)
    values (4, seq_store_location.nextval, '스타벅스 을지로한국빌딩점', '서울특별시 중구 명동 을지로 50', 'https://place.map.kakao.com/27090421', 37.565690, 126.983299, seq_store_location.nextval);
    insert into store_location (store_id, store_sequence, store_name, address, url, latitude, longitude, zindex)
    values (5, seq_store_location.nextval, '스타벅스 환구단점', '서울특별시 중구 소공동', 'https://place.map.kakao.com/22894118', 37.564907, 126.979189, seq_store_location.nextval);
    insert into store_location (store_id, store_sequence, store_name, address, url, latitude, longitude, zindex)
    values (6, seq_store_location.nextval, '스타벅스 남산단암점', '서울특별시 중구 회현동 소월로 10', 'https://place.map.kakao.com/12108441', 37.558648, 126.975294, seq_store_location.nextval);
    
    commit;
    
    -- 매장위치 데이터 삽입2
    insert into store_location (store_id, store_sequence, store_name, address, url, latitude, longitude, zindex)
    values (7, seq_store_location.nextval, '스타벅스 인사점', '서울 종로구 인사동길 14', 'https://place.map.kakao.com/8430510', 37.572234, 126.986929, seq_store_location.nextval);
    insert into store_location (store_id, store_sequence, store_name, address, url, latitude, longitude, zindex)
    values (8, seq_store_location.nextval, '스타벅스 삼선교점', '서울 성북구 동소문로 10 1~2층', 'https://place.map.kakao.com/23325995', 37.588659, 127.007306, seq_store_location.nextval);
    insert into store_location (store_id, store_sequence, store_name, address, url, latitude, longitude, zindex)
    values (9, seq_store_location.nextval, '스타벅스 제주시청점', '제주특별자치도 제주시 중앙로 215', 'https://place.map.kakao.com/1551305286', 33.500555, 126.529747, seq_store_location.nextval);
    insert into store_location (store_id, store_sequence, store_name, address, url, latitude, longitude, zindex)
    values (10, seq_store_location.nextval, '스타벅스 더해운대R점', '부산 해운대구 해운대해변로 197 해운대경동제이드아파트 101동', 'https://place.map.kakao.com/1461263034', 35.158474, 129.153036, seq_store_location.nextval);
    insert into store_location (store_id, store_sequence, store_name, address, url, latitude, longitude, zindex)
    values (11, seq_store_location.nextval, '스타벅스 강릉안목항점', '강원 강릉시 창해로14번길 40', 'https://place.map.kakao.com/20494147', 37.771372, 128.948691, seq_store_location.nextval);
    insert into store_location (store_id, store_sequence, store_name, address, url, latitude, longitude, zindex)
    values (12, seq_store_location.nextval, '스타벅스 대전노은점', '대전 유성구 은구비남로33번길 26', 'https://place.map.kakao.com/22547066', 36.373456, 127.319509, seq_store_location.nextval);
    
    insert into store_location (store_id, store_sequence, store_name, address, url, latitude, longitude, zindex)
    values (13, seq_store_location.nextval, '스타벅스 서판교', '경기 성남시 분당구 운중로 132', 'https://place.map.kakao.com/26911884', 37.391361, 127.077720, seq_store_location.nextval);
    insert into store_location (store_id, store_sequence, store_name, address, url, latitude, longitude, zindex)
    values (14, seq_store_location.nextval, '스타벅스 수원매산점', '경기 수원시 팔달구 매산로 11', 'https://place.map.kakao.com/11316780', 37.267399, 127.002667, seq_store_location.nextval);
    insert into store_location (store_id, store_sequence, store_name, address, url, latitude, longitude, zindex)
    values (15, seq_store_location.nextval, '스타벅스 전남광양DT', '전남 광양시 중마중앙로 143', 'https://place.map.kakao.com/583550832', 34.943073, 127.697901, seq_store_location.nextval);
    insert into store_location (store_id, store_sequence, store_name, address, url, latitude, longitude, zindex)
    values (16, seq_store_location.nextval, '스타벅스 상봉역점', '서울 중랑구 망우로 307', 'https://place.map.kakao.com/17884784', 37.596906, 127.086434, seq_store_location.nextval);
    insert into store_location (store_id, store_sequence, store_name, address, url, latitude, longitude, zindex)
    values (17, seq_store_location.nextval, '스타벅스 안산중앙점', '경기 안산시 단원구 고잔로 102', 'https://place.map.kakao.com/21580662', 37.318765, 126.837608, seq_store_location.nextval);
    insert into store_location (store_id, store_sequence, store_name, address, url, latitude, longitude, zindex)
    values (18, seq_store_location.nextval, '스타벅스 김포시청점', '경기 김포시 사우중로 35', 'https://place.map.kakao.com/24165747', 37.618455, 126.717842, seq_store_location.nextval);
    
    --- 매장 관리자페이지 --
    select store_id, store_sequence, store_name, address, url, latitude, longitude, zindex
    from store_location
    order by zindex asc;
    
    
select RNO, store_id, store_sequence, store_name, address, url, latitude, longitude, zindex
from    
(
    select rownum AS RNO, store_id, store_sequence, store_name, address, url, latitude, longitude, zindex
    from 
    (
    select store_id, store_sequence, store_name, address, url, latitude, longitude, zindex
    from store_location
    order by zindex asc
    ) V
) T
where T.RNO between 1 and 10; 

select RNO, store_id, store_sequence, store_name, address, url, latitude, longitude, zindex
from    
(
    select rownum AS RNO, store_id, store_sequence, store_name, address, url, latitude, longitude, zindex
    from 
    (
    select store_id, store_sequence, store_name, address, url, latitude, longitude, zindex
    from store_location
    order by zindex asc
    ) V
) T
where T.RNO between 11 and 20; 


-- 매장 관리자페이지 페이징

select ceil(count(*)/10) AS totalPage 
from store_location
    
    
    
    
    
    
    -- 회원
    create table starbucks_Member
    (Member_seq         number(4)      not null       -- 시퀀스
    ,userid             varchar2(20)   not null       -- 아이디
    ,password           varchar2(200)  not null       -- 비밀번호 (SHA-256 암호화 대상)
    ,name               varchar2(30)   not null       -- 이름
    ,email              varchar2(200)  not null       -- 이메일   (AES-256 암호화/복호화 대상)
    ,hp1                varchar2(3)                   -- 연락처
    ,hp2                varchar2(200)                 --         
    ,hp3                varchar2(200)                 --        
    ,point              number default 0              -- 포인트 
    ,gender             number(1)                     -- 성별     남자 : 1 / 여자 : 2
    ,birthday           varchar2(15)                   -- 생일 
    ,register_day       date default sysdate          -- 가입일
    ,status             number(1) default 1           -- 탈퇴유무   1:사용가능(가입중) / 0:사용불능(탈퇴) 
    ,constraint   UQ_starbucks_Member unique(userid)
    ,constraint   CK_starbucks_Member_gender check( gender in('1','2') ) 
    ,constraint   CK_starbucks_Member_status check( status in(0,1) ) 
    );
    
    --시퀀스
    create sequence seq_starbucks_Member
    start with 1
    increment by 1
    nomaxvalue
    nominvalue
    nocycle
    nocache;
    
    select *
    from starbucks_Member;
    
    
    
    ---------------------------------------------스타벅스 음료
    
    CREATE TABLE nutrition(
   product_id       VARCHAR(4) NOT NULL
  ,nutrition_seq    NUMBER(3) NOT NULL
  ,kcal             NUMBER(5) NOT NULL
  ,sodium           NUMBER(5) NOT NULL
  ,cholesterol      NUMBER(5) NOT NULL
  ,sugar     NUMBER(5) NOT NULL
  ,protein          NUMBER(5) NOT NULL
  ,allergy_triggers VARCHAR2(100)
  ,parent_table     VARCHAR2(10) NOT NULL
  ,constraint PK_nutrition primary key(product_id)
);

drop table nutrition purge;
drop table food purge;
drop table drink purge;

select *
from nutrition

drop table nutrition purge;
drop sequence nutrition_seq;



create sequence nutrition_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;


-- 콜드브루

--나이트로 바닐라 크림
--나이트로 쇼콜라 클라우드
--나이트로 콜드 브루
--돌체 콜드 브루
--바닐라 크림 콜드 브루
--콜드 브루
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d001',nutrition_seq.nextval,75,20,2,10,1,'우유', 'drink');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d002',nutrition_seq.nextval,55,20,2,7,1,'우유', 'drink');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d003',nutrition_seq.nextval,5,5,0,0,0, null, 'drink');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d004',nutrition_seq.nextval,265,115,9,29,8,'우유', 'drink');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d005',nutrition_seq.nextval,125,58,6,11,3,'우유', 'drink');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d006',nutrition_seq.nextval,5,11,0,0,0, null, 'drink');

-- 브루드 커피
-- 아이스커피
-- 오늘의커피
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d007',nutrition_seq.nextval,5,10,0,0,0,null, 'drink');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d008',nutrition_seq.nextval,5,10,0,0,0,null, 'drink');
 
 
-- 에스프레소 음료
-- 아이스 카페 아메리카노
-- 카페 아메리카노
-- 아이스 카라멜 마끼아또 
-- 카라멜 마끼아또
-- 아이스카푸치노
-- 카푸치노
-- 아이스 카페 라떼 
-- 카페라떼 
-- 아이스카페모카
-- 카페모카


-- 아이스 화이트 초콜릿  모카
-- 화이트 초콜릿 모카
-- 에스프레소
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d009',nutrition_seq.nextval,10,5,0,0,1,null, 'drink');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d010',nutrition_seq.nextval,10,5,0,0,1,null, 'drink');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d011',nutrition_seq.nextval,190,110,4,21,6,'우유', 'drink');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d012',nutrition_seq.nextval,200,130,5,22,8,'우유', 'drink');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d013',nutrition_seq.nextval,115,90,4,9,6,'우유', 'drink');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d014',nutrition_seq.nextval,110,70,3,8,6,'우유', 'drink');
 
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d015',nutrition_seq.nextval,110,75,4,8,6,'우유', 'drink');-- 아이스 카페라떼
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d016',nutrition_seq.nextval,180,115,5,13,10,'우유','drink');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d017',nutrition_seq.nextval,250,70,8,21,7,'우유','drink');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d018',nutrition_seq.nextval,290,105,9,25,10,'우유','drink');
 
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d019',nutrition_seq.nextval,350,150,11,41,8,'우유','drink');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d020',nutrition_seq.nextval,390,190,11,45,12,'우유','drink');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d021',nutrition_seq.nextval,5,0,0,0,10,null,'drink');
 

---- 프라푸치노
-- 더블에스프레소칩프라푸치노
-- 모카 프라푸치노
-- 에스프레소 프라푸치노
-- 자바칩프라푸치노
-- 카라멜 프라푸치노
-- 바닐라 크림 프라푸치노
-- 초콜릿크림칩프라푸치노
-- 피스타치오크림프라푸치노
 
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d022',nutrition_seq.nextval,265,140,11,31,3,'우유','drink');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d023',nutrition_seq.nextval,280,180,6,36,5,'우유','drink');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d024',nutrition_seq.nextval,140,125,1,22,3,'우유','drink');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d025',nutrition_seq.nextval,340,180,9,42,6,'대두/우유/밀','drink');
commit
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d026',nutrition_seq.nextval,300,190,7,39,4,'우유','drink'); -- 카라멜 프라푸치노
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d027',nutrition_seq.nextval,310,241,5,38,9,'우유','drink');-- 화이트초콜릿
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d028',nutrition_seq.nextval,370,266,8,44,11,'대두/우유/밀','drink'); -- 초코릿크림칩 프라푸치노
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d029',nutrition_seq.nextval,355,230,8,39,8,'땅콩/우유','drink'); -- 피스타치

-- 블렌디드
--애플망고 요거트 후르츠 블렌디드
-- 피치레몬 블렌디드
-- 망고패션후르츠블렌디드
--딸기요거트블렌디드

INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d030',nutrition_seq.nextval,315,150,2,56,10,'우유','drink'); -- 애플망고
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d031',nutrition_seq.nextval,190,45,0,27,0,'복숭아','drink');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d032',nutrition_seq.nextval,120,70,0,25,1,null,'drink'); -- 망고패션후르츠
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d033',nutrition_seq.nextval,250,128,1,48,8,'우유/토마토','drink'); -- 딸기요거트 

-- 티 
-- 스타벅스 라임 모히토 티
--아이스 얼그레이티 
-- 얼그레이티 
-- 아이스 차이티 
-- 차이티 
-- 아이스 제주 유기녹차 
-- 제주 유기녹차 
-- 아이스 말차 라떼 
--말차라떼 
-- 아이스차이티라떼 
-- 차이티라떼

INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d034',nutrition_seq.nextval,140,5,0,29,0,null,'drink');

INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d035',nutrition_seq.nextval,0,0,0,0,0,null,'drink');--earl grey iced 
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d036',nutrition_seq.nextval,0,0,0,0,0,null,'drink');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d037',nutrition_seq.nextval,0,0,0,0,0,null,'drink'); -- chai
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d038',nutrition_seq.nextval,0,0,0,0,0,null,'drink');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d039',nutrition_seq.nextval,0,0,0,0,0,null,'drink'); -- ice 녹차
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d040',nutrition_seq.nextval,0,0,0,0,0,null,'drink'); -- 녹차


INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d041',nutrition_seq.nextval,155,95,4,16,6,'우유','drink'); -- iced malcha latte
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d042',nutrition_seq.nextval,205,130,5,20,9,'우유','drink'); 
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d043',nutrition_seq.nextval,190,70,3,31,5,'우유','drink');-- iced 차이티라떼
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d044',nutrition_seq.nextval,200,70,3,31,6,'우유','drink');

-- 기타 제조 음료
-- 시그니처 핫 초콜릿
-- 아이스 시그니처 초콜릿
-- 스팀 우유
-- 우유

INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d045',nutrition_seq.nextval,435,114,16,37,12,'우유','drink'); -- chocolate
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d046',nutrition_seq.nextval,435,114,16,37,12,'우유','drink');-- iced chocolate
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d047',nutrition_seq.nextval,215,173,7,18,13,'우유','drink'); 
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d048',nutrition_seq.nextval,240,200,8,18,12,'우유','drink');



-- 베이커리
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f001',nutrition_seq.nextval,'530','950','14','30','12','대두 / 우유 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f002',nutrition_seq.nextval,'550','545','16','24','6','우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f003',nutrition_seq.nextval,'466','490','5','25','9','땅콩 / 호두 / 대두 / 우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f004',nutrition_seq.nextval,'216','508','3','7','5','대두 / 우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f005',nutrition_seq.nextval,'510','490','12','37','5','대두 / 우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f006',nutrition_seq.nextval,'450','520','6','38','5','대두 / 우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f007',nutrition_seq.nextval,'191','396','4','5','6','대두 / 우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f008',nutrition_seq.nextval,'343','527','3.7','17','17','우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f009',nutrition_seq.nextval,'258','539','0.3','10','10','밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f010',nutrition_seq.nextval,'452','304','14','12','7','우유 / 난류 / 밀','food');

-- 케이크
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f031',nutrition_seq.nextval,'984','85','12','26','5','대두 / 우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f032',nutrition_seq.nextval,'565','230','20','43','7','우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f033',nutrition_seq.nextval,'272','130','14','19','3','대두 / 우유 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f034',nutrition_seq.nextval,'660','140','26','39','8','땅콩 / 호두 / 대두 / 우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f035',nutrition_seq.nextval,'582','120','5','19','8','대두 / 우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f036',nutrition_seq.nextval,'292','370','52','27','7','우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f037',nutrition_seq.nextval,'385','270','83','29','11','땅콩 / 호두 / 대두 / 우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f038',nutrition_seq.nextval,'582','128','37','80','3','대두 / 우유 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f039',nutrition_seq.nextval,'371','98','12','8','2','우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f040',nutrition_seq.nextval,'439','278','20','38','9','대두 / 우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f041',nutrition_seq.nextval,'270','138','38','27','6','땅콩 / 호두 / 대두 / 우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f042',nutrition_seq.nextval,'439','278','2','16','12','땅콩 / 호두 / 대두 / 우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f043',nutrition_seq.nextval,'389','183','9','23','9','우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f044',nutrition_seq.nextval,'961','302','8','13','3','대두 / 우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f045',nutrition_seq.nextval,'670','190','12','12','7','땅콩 / 호두 / 대두 / 우유 / 난류 / 밀','food');

-- 푸드_샌드위치&샐러드
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f046',nutrition_seq.nextval,'680','132','3','16','13','땅콩 / 호두 / 대두 / 우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f047',nutrition_seq.nextval,'731','290','12','32','7','땅콩 / 대두 / 우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f048',nutrition_seq.nextval,'832','371','11','21','3','우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f049',nutrition_seq.nextval,'537','280','7','36','8','땅콩 / 호두 / 대두 / 우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f050',nutrition_seq.nextval,'473','196','5','27','11','땅콩 / 대두 / 우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f051',nutrition_seq.nextval,'381','127','3','17','4','우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f052',nutrition_seq.nextval,'572','207','18','28','6','땅콩 / 호두 / 대두 / 우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f053',nutrition_seq.nextval,'620','216','5','29','8','대두 / 우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f054',nutrition_seq.nextval,'853','190','21','32','11','땅콩 / 호두 / 대두 / 우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f055',nutrition_seq.nextval,'593','271','19','11','6','대두 / 우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f056',nutrition_seq.nextval,'428','198','3','19','4','우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f057',nutrition_seq.nextval,'473','137','12','28','5','땅콩 / 호두 / 대두 / 우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f058',nutrition_seq.nextval,'537','128','10','21','10','땅콩 / 호두 / 대두 / 우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f059',nutrition_seq.nextval,'897','260','18','10','7','대두 / 우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f060',nutrition_seq.nextval,'684','276','21','38','9','땅콩 / 대두 / 우유 / 난류 / 밀','food');

-- 푸드_따뜻한음식
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f061',nutrition_seq.nextval,'680','185','12','21','12','땅콩 / 우유 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f062',nutrition_seq.nextval,'628','168','8','27','4','대두 / 우유 / 밀 / 닭고기','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f063',nutrition_seq.nextval,'523','208','19','27','7',null,'food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f064',nutrition_seq.nextval,'579','137','14','38','9','호두 / 우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)

-- 푸드_과일&요거트
VALUES ('f065',nutrition_seq.nextval,'273','138','26','21','9',null,'food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f066',nutrition_seq.nextval,'496','219','3','24','9',null,'food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f067',nutrition_seq.nextval,'421','127','27','19','9',null,'food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f068',nutrition_seq.nextval,'512','167','7','34','9',null,'food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f069',nutrition_seq.nextval,'598','138','32','17','9','땅콩 / 대두 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f070',nutrition_seq.nextval,'532','172','18','21','9','우유','food');

commit;





CREATE TABLE food(
    id              VARCHAR2(20) NOT NULL
    ,category_id  VARCHAR2(20) NOT NULL
    ,food_seq       NUMBER NOT NULL
    ,name           VARCHAR2(100) NOT NULL
    ,name_eng       VARCHAR2(100) NOT NULL
    ,description    VARCHAR2(200) NOT NULL
    ,price          NUMBER(4) NOT NULL
    ,img            VARCHAR2(80) NOT NULL
    ,constraint PK_food primary key(id)
    ,constraint FK_food_id foreign key(id) references nutrition(product_id)
    ,constraint FK_food_category foreign key(category_id) references product_category(category_id)
);

drop sequence food_seq;
create sequence food_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;
-- 푸드_베이커리


INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f001','f_bk',food_seq.nextval,'초코몬드 카라멜 크림치즈 베이글','Chocolate Almond Caramel Cream Cheese Bagel','폭신하고 쫄깃한 식감의 베이글에 초코 아몬드가 콕콕 박힌 카라멜 크림치즈가 듬뿍 샌드되어 달콤하게 즐길 수 있는 브레드입니다.',8000,'f001.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f002','f_bk',food_seq.nextval,'카라멜팅 스콘','Melting Caramel Scone','흘러내리는 듯한 카라멜 토핑과 아몬드의 식감이 부드러운 스콘에 더해진 달콤하고 고소한 스콘입니다.',8000,'f002.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f003','f_bk',food_seq.nextval,'Pick한 시나몬 롤','Pecan Cinnamon Roll','쌀을 넣어 쫄깃한 식감을 더한 브레드에 진한 시나몬, 크림치즈 버터크림, 고소한 피칸이 조화롭게 어루러져 달콤하게 즐길 수 있는 브레드입니다.',8000,'f003.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f004','f_bk',food_seq.nextval,'녹차 머핀','Green Tea Muffin','[제주지역 한정푸드] 녹차가루로 만든 머핀 안에 크림치즈와 통팥을 넣은 녹차 머핀입니다.',8000,'f004.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f005','f_bk',food_seq.nextval,'다크 초콜릿 칩 머핀','Dark Chocolate Chip Muffin','그랑크루 초콜릿을 함유한 더욱 진한 초콜릿의 풍미를 느낄 수 있는 머핀입니다.',8000,'f005.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f006','f_bk',food_seq.nextval,'상큼한 블루베리 머핀','Blueberry Muffin','상큼한 블루베리로 만든 부드럽고 촉촉한 머핀입니다.',8000,'f006.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f007','f_bk',food_seq.nextval,'제주 감귤 머핀','Jeju Tangerine Muffin','[제주지역 한정푸드] 한라봉 주스를 넣은 머핀에 초코칩을 넣어 달콤하면서도 상큼한 머핀입니다.',8000,'f007.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f008','f_bk',food_seq.nextval,'고소한 치즈 베이글','Cheese Bagel','양파 베이글 위에 고다 치즈, 파마산 치즈, 블렌디드 치즈를 얹은 베이글입니다.',8000,'f008.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f009','f_bk',food_seq.nextval,'블루베리 베이글','Blueberry Bagel','블루베리의 상큼한 풍미가 매력적인 베이글로 크림치즈와 함께 더욱 맛있게 즐기실 수 있습니다.',8000,'f009.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f010','f_bk',food_seq.nextval,'미니 클래식 스콘','Mini Classic Scone','미니 사이즈의 담백한 스콘입니다.',8000,'f010.jpg');

-- 푸드 케이크
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f031','f_ca',food_seq.nextval,'블루베리 쿠키 치즈 케이크','Blueberry Cookie Cheese Cake','고소한 쿠키와 크림치즈를 듬뿍 넣어 만든 케이크위에 달콤, 상큼한 블루베리가 올라간 진한 치즈 풍미의 케이크입니다.',8000,'f031.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f032','f_ca',food_seq.nextval,'슈크림 가득 바움쿠헨','Choux Cream Baumkuchen','바닐라 빈이 들어간 부드러운 슈크림과 바움쿠헨이 조화로운 바닐라 풍미의 케이크입니다.',8000,'f032.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f033','f_ca',food_seq.nextval,'진한 녹차 생크림 케이크','Rich Green Tea Cake','입 안 가득 풍부하고 진하게 퍼지는 녹차 맛이 특징인 케이크로 동물성 크림을 더해 더욱 부드럽게 즐길 수 있습니다.',8000,'f033.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f034','f_ca',food_seq.nextval,'진한 얼 그레이 생크림 케이크','Rich Earl Grey Cream Cake','직접 우려낸 얼 그레이를 부드러운 크림에 넣어 입 안 가득 퍼지는 얼 그레이의 진하고 풍부한 맛과 향이 특징인 케이크입니다.',8000,'f034.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f035','f_ca',food_seq.nextval,'진한 초콜릿 크레이프 케이크','Chocolate Crepe Cake','한 장 한 장 정성스럽게 구운 크레이프 사이에 초코 크림과 진한 가나슈를 넣어 만든 케이크입니다.',8000,'f035.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f036','f_ca',food_seq.nextval,'클라우드 초콜릿 케이크','Cloud Chocolate Cake','부드러운 초콜릿 시트에 크림치즈 무스를 올린 달콤한 초콜릿 케이크입니다.',8000,'f036.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f037','f_ca',food_seq.nextval,'클라우드 치즈 케이크','Cloud Cheese Cake','사워크림의 상큼함과 진한 치즈의 맛을 동시에 맛볼 수 있는 케이크입니다.',8000,'f037.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f038','f_ca',food_seq.nextval,'호두 당근 케이크','Walnut Carrot Cake','고소한 호두와 당근이 조화로운 홈메이드 타입 케이크입니다.',8000,'f038.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f039','f_ca',food_seq.nextval,'당근 현무암 케이크','Jeju Carrot Basalt Cake','[제주지역 한정푸드]현무암을 연상케 하는 오징어 먹물 케이크 시트 사이에 새콤한 당근 크림치즈 무스를 샌드한 컵 케이크',8000,'f039.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f040','f_ca',food_seq.nextval,'제주 리얼녹차 티라미수 아일랜드','Jeju Real Green Tea Tiramisu Island','[제주지역 한정푸드] 제주녹차를 사용한 시트와 마스카포네 크림으로 진한 녹차의 풍미를 느낄 수 있는 제주 전용 티라미수입니다.',8000,'f040.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f041','f_ca',food_seq.nextval,'촉촉 초콜릿 생크림 케이크','Chocolate Fresh Cream Cake','촉촉한 초콜릿 시트에 초콜릿 생크림을 층층이 샌드하여 부드럽고 달콤한 맛이 특징인 케이크입니다.',8000,'f041.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f042','f_ca',food_seq.nextval,'청담스타 얼 그레이 밀크 케이크','Cheongdam Star Earl Grey Milk Cake','꿀이 함유된 얼 그레이 시트 사이에 부드러운 얼 그레이 생크림을 샌드한 케이크',8000,'f042.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f043','f_ca',food_seq.nextval,'크레이프 에멘탈 치즈 케이크','Crepe Emmental Cheese Cake','부드러운 카스텔라와 에멘탈 치즈, 크림치즈로 만든 케이크',8000,'f043.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f044','f_ca',food_seq.nextval,'피칸 브라우니','Pecan Brownie','초콜릿 청크를 넣고 고소한 피칸을 듬뿍 올린 진한 브라우니로 품격 있는 선물을 준비하세요.',8000,'f044.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f045','f_ca',food_seq.nextval,'헤븐리 티라미수','Heavenly Tiramisu','촉촉한 커피 시럽의 레이디핑거 쿠키와 100% 마스카포네 크림치즈로 만든 떠 먹는 타입의 티라미수입니다.)',8000,'f045.jpg');

-- 푸드_샌드위치&샐러드
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f046','f_ss',food_seq.nextval,'치킨텐더 콥 샐러드 밀박스','Chicken Tender Cobb Salad Meal Box','치킨텐더, 치즈, 메추리알, 올리브 토핑과 방울토마토, 케일 등의 채소를 요거트 드레싱과 함께 즐기는 샐러드',8000,'f046.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f047','f_ss',food_seq.nextval,'그릴드 쉬림프 치아바타','Grilled Shrimp Ciabatta','그릴드 채소, 그린빈, 그리고 새우가 스위트 칠리 소스와 잘 어우러져서 매콤 달콤한 맛을 즐길 수 있는 치아바타',8000,'f047.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f048','f_ss',food_seq.nextval,'카프레제 샐러드 랩','Caprese Salad Wrap','카프레제 샐러드를 바질 페스토와 함께 그대로 또띠아에 말아 더욱 간편하고 건강하게 즐길 수 있도록 만든 랩 샌드위치입니다.',8000,'f048.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f049','f_ss',food_seq.nextval,'로스트 치킨 샐러드 밀 박스','Roast Chicken Salad Meal Box','퀴노아 위에 로스트 치킨을 올리고 프렌치 드레싱을 곁들인 가벼운 샐러드입니다.',8000,'f049.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f050','f_ss',food_seq.nextval,'B.E.L.T. 샌드위치','B.E.L.T. Sandwich','주 재료인 베이컨, 계란, 로메인 상추, 토마토의 각각의 머리 글자를 따온 이름의 샌드위치',8000,'f050.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f051','f_ss',food_seq.nextval,'DT밀당 샌드위치_바질 모짜렐라','DT Sandwich_Basil Mozzarella','모짜렐라 치즈와 토마토, 루꼴라를 향긋한 향의 바질 페스토를 버무린 담백한 포카치아 샌드위치',8000,'f051.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f052','f_ss',food_seq.nextval,'DT밀당 샌드위치_베이컨 크림치즈','DT Sandwich_Bacon Cream Cheese','다양한 재료를 섞어 넣은 짭짤한 크림치즈를 샌드한 먹물 포카치아 샌드위치',8000,'f052.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f053','f_ss',food_seq.nextval,'과카몰리 크루아상 밀 박스','Guacamole Croissant Meal Box','과카몰리, 달걀프라이, 베이컨이 들어간 크루아상 샌드위치와 그릴드 베지터블로 만든 샐러드 밀 박스',8000,'f053.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f054','f_ss',food_seq.nextval,'단호박 에그 샌드위치','Sweet Pumpkin Egg Sandwich','건강 잡곡 식빵 속에 단호박, 달걀, 토마토, 치즈 등을 넣은 콜드 샌드위치입니다.',8000,'f054.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f055','f_ss',food_seq.nextval,'바비큐 치킨 치즈 치아바타','Barbecue Chicken Cheese Ciabatta','바삭한 치아바타에 새콤달콤한 바비큐 소스 치킨, 베이컨, 치즈가 어우러진 샌드위치입니다.',8000,'f055.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f056','f_ss',food_seq.nextval,'부드러운 크림치즈 샌드위치','Cream Cheese Sandwich','검은 깨가 콕콕 들어있는 건강한 식빵 안에 토마토와 햄, 그리고 부드럽고 산뜻한 크림치즈가 들어있는 샌드위치입니다.',8000,'f056.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f057','f_ss',food_seq.nextval,'어니언 베이컨 체다치즈 파니니','Onion Bacon Cheddar Cheese Panini','베이컨, 체다 치즈, 볶은 양파와 매콤한 치폴레 마요 소스로 만든 치아바타 파니니입니다.',8000,'f057.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f058','f_ss',food_seq.nextval,'에그 베이컨 치즈 백년초 베이글','Egg Bacon Cheese Cactus Bagel','[제주지역 한정푸드] 제주도 특산물인 백년초 베이글에 에그패티와 베이컨, 치즈를 넣은 샌드위치입니다.',8000,'f058.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f059','f_ss',food_seq.nextval,'제주 흑돼지 아보카도 샌드위치','Jeju Black Pork Avocado Sandwich','[제주지역 한정푸드] 제주도 흑돼지 베이컨, 양상추, 아보카도, 토마토가 들어가고 먹물 바게트 샌드위치',8000,'f059.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f060','f_ss',food_seq.nextval,'파인 땡큐 샌드위치','Fine Thank-You Sandwich','여름 대표 열대 과일인 달콤한 파인애플을 매콤한 할라페뇨와 함께 버무리고 토마토 바비큐 소스로 맛을 낸 여름 시즌 한정 샌드위치',8000,'f060.jpg');

-- 푸드_따뜻한음식
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f061','f_wf',food_seq.nextval,'트러플 머쉬룸 수프','Truffle Mushroom Soup','송로 버섯의 향과 양송이 버섯의 진한 풍미가 조화로운 식사 대용 수프입니다. ※ 수프 구매 시 크래커가 함께 제공됩니다.',8000,'f061.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f062','f_wf',food_seq.nextval,'현미 크림 수프','Brown Rice Cream Soup','고소한 현미와 풍부한 우유 크림으로 만든 건강한 컨셉의 수프입니다.',8000,'f062.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f063','f_wf',food_seq.nextval,'우리나라 옥고감','Steamed Corn, Sweet Potato, Potato','우리 땅에서 자란 세 가지 농산물을 오븐에 구워 간편하게 한 끼를 즐길 수 있는 상품입니다.',8000,'f063.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f064','f_wf',food_seq.nextval,'한 입에 쏙 호두','Walnut Mini Bites','고소한 호두와 헤이즐넛, 그리고 달콤한 대추가 들어있는 한 입 크기의 미니 팬 케이크입니다.',8000,'f064.jpg');

-- 푸드_과일&요거트
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f065','f_fy',food_seq.nextval,'사과 가득 핸디 젤리','Apple Handy Jelly','경북 특산물인 사과를 가득 담은 달콤한 맛의 스타벅스 핸디 젤리',8000,'f065.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f066','f_fy',food_seq.nextval,'제주 자연 청 세트','Jeju Marmalade Set','[제주지역 한정푸드] 제주도 청정 자연의 맛과 멋을 담은 건강한 청 선물 세트 입니다.',8000,'f066.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f067','f_fy',food_seq.nextval,'하루 한 컵 GREEN','A Fresh Cup A Day, GREEN','키위와 청포도를 한 컵에 담아 언제 어디서나 편하게 즐길 수 있습니다.',8000,'f067.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f068','f_fy',food_seq.nextval,'한 입에 쏙 열대 과일칩(망고 파인애플)','Frozen Dried Fruit(Mango Pineapple)','대표 열대 과일인 파인애플과 망고를 그대로 동결 건조한 과일 스낵으로 바삭한 식감과 함께 과일 본연의 맛을 즐길 수 있습니다.',8000,'f068.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f069','f_fy',food_seq.nextval,'New 초콜릿 푸딩','New Chocolate Pudding','벨기에 초콜릿과 무항생제 달걀, 신선한 우유로 만든 진한 초콜릿 푸딩입니다. 냉장보관이 필요한 상품입니다.',8000,'f069.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f070','f_fy',food_seq.nextval,'오가닉 그릭 요거트 플레인 JAR','Organic Greek Yogurt Plain JAR','사이렌 로고가 그려진 도자기 안에 진한 크림 치즈처럼 깊고 풍부한 맛의 유기농 그릭 요거트가 담겨 있습니다.',8000,'f070.jpg');
  
  
  commit;

    

--------------------------------------------------------------------------------------------------------------------------------
-- 카테고리

CREATE TABLE product_category(
   category_id         VARCHAR2(10) NOT NULL
  ,category_name       VARCHAR(25) NOT NULL
  ,category_seq        NUMBER  NOT NULL
  ,constraint PK_product_category primary key(category_id)
);

create sequence category_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;


INSERT INTO product_category(category_id,category_name,category_seq) VALUES ('d_cb','콜드 브루 커피',category_seq.nextval);
INSERT INTO product_category(category_id,category_name,category_seq) VALUES ('d_br','브루드 커피',category_seq.nextval);
INSERT INTO product_category(category_id,category_name,category_seq) VALUES ('d_es','에스프레소',category_seq.nextval);
INSERT INTO product_category(category_id,category_name,category_seq) VALUES ('d_fp','프라푸치노' ,category_seq.nextval);
INSERT INTO product_category(category_id,category_name,category_seq) VALUES ('d_bl','블렌디드' ,category_seq.nextval);
INSERT INTO product_category(category_id,category_name,category_seq) VALUES ('d_te','티',category_seq.nextval);
INSERT INTO product_category(category_id,category_name,category_seq) VALUES ('d_nc','기타 제조 음료' ,category_seq.nextval);

INSERT INTO product_category(category_id,category_name,category_seq) VALUES ('f_bk','베이커리' ,category_seq.nextval);
INSERT INTO product_category(category_id,category_name,category_seq) VALUES ('f_ca','케이크' ,category_seq.nextval);
INSERT INTO product_category(category_id,category_name,category_seq) VALUES ('f_ss','샌드위치 샐러드' ,category_seq.nextval);
INSERT INTO product_category(category_id,category_name,category_seq) VALUES ('f_wf','따뜻한 푸드' ,category_seq.nextval);
INSERT INTO product_category(category_id,category_name,category_seq) VALUES ('f_fy','과일 요거트' ,category_seq.nextval);

select * from product_category;

commit;
    
    
    
    ------------------------------------------------------------
    
-- 드링크

select *
from drink

 CREATE TABLE drink(
   id            VARCHAR2(10) NOT NULL
  ,category_id   VARCHAR2(10) NOT NULL
  ,drink_seq     NUMBER(10) NOT NULL
  ,name          VARCHAR(50) NOT NULL
  ,name_eng      VARCHAR2(50) NOT NULL
  ,description   VARCHAR2(200) NOT NULL
  ,price         NUMBER(4) NOT NULL
  ,img           VARCHAR2(20) NOT NULL
  ,shot         NUMBER(1) NOT NULL
  ,syrup         VARCHAR2(30) NOT NULL
  ,whipped_cream VARCHAR2(10) NOT NULL
  ,temperature   VARCHAR2(10) NOT NULL
  ,caffein       NUMBER(3)  NOT NULL
  ,base          VARCHAR2(30) NOT NULL
  ,constraint  PK_drink_id primary key(id)
  ,constraint  FK_drink_id foreign key(id) references nutrition(product_id)
  ,constraint  FK_drink_category_code foreign key(category_id) references product_category(category_id)
);

create sequence drink_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

drop sequence drink_seq;

select * from product_category;

-- cold brew
INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d001','d_cb',drink_seq.nextval,'나이트로 바닐라크림','Nitro Vanilla Cream','부드러운 목넘김의 나이트로 커피와 바닐라 크림의 매력을 한번에 느껴보세요!',5900,'d001.jpg',0,'없음','none','non-iced',245, '물');

INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d002','d_cb', drink_seq.nextval,'나이트로 쇼콜라 클라우드','Nitro Chocolat Cloud','초콜릿과 견과류의 풍미, 초콜릿 파우더 토핑의 부드럽고 달콤한 나이트로 콜드 브루',6100,'d002.jpg',0,'초콜릿시럽','none','non-iced',245, '없음');

INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d003','d_cb',drink_seq.nextval,'나이트로 콜드 브루','Nitro Cold Brew','나이트로 커피 정통의 캐스케이딩과 부드러운 콜드 크레마!',5800,'d003.jpg',0,'없음','none','non-iced',245,'없음');

INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d004','d_cb',drink_seq.nextval,'돌체 콜드 브루','Dolce Cold Brew','동남아 휴가지에서 즐기는 커피를 떠오르게 하는 돌체 콜드 브루',5800,'d004.jpg',0,'돌체시럽','none','iced',150,'우유');

INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d005','d_cb',drink_seq.nextval,'바닐라 크림 콜드 브루','Vanilla Cream Cold Brew','콜드 브루에 더해진 바닐라 크림으로 깔끔하면서 달콤한 콜드 브루를 새롭게 즐길 수 있는 음료입니다.',5500,'d005.jpg',0,'바닐라시럽','none','iced',150,'바닐라크림베이스');

INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d006','d_cb',drink_seq.nextval,'콜드 브루','Cold Brew','스타벅스 바리스타의 정성으로 탄생한 콜드 브루!',4500,'d006.jpg',0,'없음','none','iced',150, '물');

 
 -- brewed coffee
 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d007','d_br',drink_seq.nextval,'아이스 커피','Iced Coffee','깔끔하고 상큼함이 특징인 시원한 아이스 커피',4100,'d007.jpg',0,'없음','none','iced',140, '물');
 
 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d008','d_br',drink_seq.nextval,'오늘의 커피','Brewed Coffee','신선하게 브루드(Brewed)되어 원두의 다양함이 살아있는 커피',3800,'d008.jpg',0,'없음','none','non-iced',260, '물');

-- espresso

 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d009','d_es',drink_seq.nextval,'아이스 카페 아메리카노','Iced Caffe Americano','강렬한 에스프레소 샷에 시원한 물의 조화',4100,'d009.jpg',2,'없음','none','iced',150,'물');

 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d010','d_es',drink_seq.nextval,'카페 아메리카노','Caffe Americano','강렬한 에스프레소 샷에 뜨거운 물의 조화',4100,'d010.jpg',2,'없음','none','non-iced',150,'물');

 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d011','d_es',drink_seq.nextval,'아이스 카라멜 마키아또','Iced Caramel Macchiato','바닐라 시럽, 시원한 우유에 얼음과 에스프레소 샷, 카라멜 드리즐이 어우러진 음료',5600,'d011.jpg',1,'카라멜시럽','none','iced',75,'우유');

 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d012','d_es',drink_seq.nextval,'카라멜 마키아또','Caramel Macchiato','바닐라 시럽과 우유, 그리고 그 위에 얹어진 에스프레소 샷과 달콤한 카라멜 드리즐의 조화',5600,'d012.jpg',1,'카라멜시럽','none','non-iced',75,'우유');

 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d013','d_es',drink_seq.nextval,'아이스 카푸치노','Iced Cappuccino','에스프레소 샷과 시원한 우유에 부드러운 우유 거품이 얹어진 시원한 음료.',4600,'d013.jpg',1,'없음','none','iced',75,'우유');
 
 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d014','d_es',drink_seq.nextval,'카푸치노','Cappuccino','에스프레소 샷과 시원한 우유에 부드러운 우유 거품이 얹어진 음료.',4600,'d014.jpg',1,'없음','none','non-iced',75,'우유');
 
 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d015','d_es',drink_seq.nextval,'아이스 카페 라떼','Iced Caffe Latte','에스프레소 샷과 시원한 우유와 얼음으로 고소한 음료.',4600,'d015.jpg',1,'없음','none','iced',75,'우유');
 
 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d016','d_es',drink_seq.nextval,'카페 라떼','Caffe Latte','에스프레소 샷과 따뜻한 우유로 고소한 음료',4600,'d016.jpg',1,'없음','none','non-iced',75,'우유');

 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d017','d_es',drink_seq.nextval,'아이스 카페 모카','Iced Caffe Mocha','모카시럽과 시원한 우유에 휘핑크림이 토핑된 에스프레소 음료.',4600,'d017.jpg',1,'모카시럽','regular','iced',95,'우유');
 
 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d018','d_es',drink_seq.nextval,'카페 모카','Caffe Mocha','모카시럽과 따뜻한 우유에 휘핑크림이 토핑된 에스프레소 음료.',4600,'d018.jpg',1,'모카시럽','regular','non-iced',95,'우유');

 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d019','d_es',drink_seq.nextval,'아이스 화이트 초콜릿 모카','Iced White Chocolate Mocha','화이트 초콜릿과 시원한 우유가 첨가된 에스프레소 음료.',4600,'d019.jpg',1,'화이트모카시럽','regular','iced',75,'우유');
 
 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d020','d_es',drink_seq.nextval,'화이트 초콜릿 모카','White Chocolate Mocha','화이트 초콜릿과 스팀밀크가 첨가된 에스프레소 음료.',4600,'d020.jpg',1,'화이트모카시럽','regular','non-iced',75,'우유');      
  
 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d021','d_es',drink_seq.nextval,'에스프레소','Espresso','스타벅스의 핵심인 강렬하고 카라멜향이 달콤한 음료',3600,'d021.jpg',1,'없음','none','non-iced',75,'없음');
 
 
 -- 프라푸치노
 
 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d022','d_fp',drink_seq.nextval,'더블 에스프레소 칩 프라푸치노','Double Espresso Chip Frappuccino','에스프레소 2샷과 에스프레소 칩이 어우러진 커피의 기본에 충실한 더블 에스프레소 칩 프라푸치노',6100,'d022.jpg',2,'프라푸치노시럽','regular','iced',130,'우유');      
  
 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d023','d_fp',drink_seq.nextval,'모카 프라푸치노','Mocha Frappuccino','초콜릿, 커피와 얼음이 갈린 음료에 휘핑크림이 토핑된 음료.',5600,'d023.jpg',2,'프라푸치노시럽','regular','iced',90,'우유');      

 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d024','d_fp',drink_seq.nextval,'에스프레소 프라푸치노','Espresso Frappuccino','에스프레소의 강렬함과 약간의 단맛을 시원하게 즐기는 프라푸치노.',5100,'d024.jpg',2,'프라푸치노시럽','regular','iced',120,'우유');      

 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d025','d_fp',drink_seq.nextval,'자바 칩 프라푸치노','Java Chip Frappuccino','커피 프라푸치노에 초콜릿, 초콜릿 칩이 첨가된 아이스 블렌드로 달콤 아삭한 음료.',6100,'d025.jpg',2,'프라푸치노시럽','regular','iced',100,'우유');      

 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d026','d_fp',drink_seq.nextval,'카라멜 프라푸치노','Caramel Frappuccino','카라멜 시럽이 더해진 커피 프라푸치노에 휘핑 크림, 카라멜이 장식된 음료.',5600,'d026.jpg',2,'프라푸치노시럽','regular','iced',85,'우유');      


 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d027','d_fp',drink_seq.nextval,'바닐라 크림 프라푸치노','Vanilla Cream Frappuccino','우유에 바닐라향이 조합된 아이스 블렌드로 휘핑크림이 토핑된 음료.',4800,'d027.jpg',0,'프라푸치노시럽','regular','iced',0,'우유');      

 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d028','d_fp',drink_seq.nextval,'초콜릿 크림 칩 프라푸치노','Chocolate Cream Chip Frappuccino','모카시럽과 자바칩이 혼합된 크림 프라푸치노로 휘핑크림, 초콜렛 드리즐된 음료.',5700,'d028.jpg',0,'프라푸치노시럽','regular','iced',0,'우유');      

 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d029','d_fp',drink_seq.nextval,'피스타치오 크림 프라푸치노','Pistachio Cream Frappuccino','젤라또를 먹는 듯한 크리미함과 고소함이 극에 달한 피스타치오 크림 프라푸치노를 만나보세요.',6300,'d029.jpg',0,'프라푸치노시럽','regular','iced',0,'우유');      
  
  
  -- 블렌디드
  
   INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d030','d_bl',drink_seq.nextval,'애플망고 요거트 블렌디드','Apple Mango Yogurt Blended','말랑한 애플망고 과육과 부드러운 요거트가 산뜻하게 어우러진 애플망고 요거트 블렌디드',6300,'d030.jpg',0,'블렌디드시럽','none','iced',0,'우유');      

 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d031','d_bl',drink_seq.nextval,'피치레몬 블렌디드','Peach Lemon Blended','달콤한 복숭아와 새콤한 레몬, 말랑한 복숭아 젤리가 만난 피치 레몬 블렌디드',6100,'d031.jpg',0,'클래식시럽','none','iced',0,'레모네이드');      

 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d032','d_bl',drink_seq.nextval,'망고 패션 후르츠 블렌디드','Mango Passion Fruit Blended','진한 블랙 티에 망고 패션 후르츠 주스가 조합된 아이스 블렌드 음료',5000,'d032.jpg',0,'블렌디드시럽','none','iced',35,'블랙티');      
  
 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d033','d_bl',drink_seq.nextval,'딸기 요거트 블렌디드','Strawberry Yogurt Blended','딸기와 요거트의 상큼함이 가득 느껴지는 가벼운 컨셉의 블렌디드 음료',6100,'d033.jpg',0,'블렌디드시럽','none','iced',0,'우유');      

-- 티 

 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d034','d_te',drink_seq.nextval,'스타벅스 라임 모히토 티','Starbucks Lime Mojito Tea','라임과 사과 과즙이 팡팡 터지는 맑고 청량한 스타벅스 라임 모히토 티',6100,'d034.jpg',0,'없음','none','iced',11,'그린애플베이스');      
  
 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d035','d_te',drink_seq.nextval,'아이스 얼그레이티','Iced Earl Grey Tea','시원하게 즐기는 뜨거운 물에 우려내 라벤더 향의 블랙 티',4100,'d035.jpg',0,'없음','none','iced',50,'물');      

 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d036','d_te',drink_seq.nextval,'얼 그레이 티','Earl Grey Brewed Tea','뜨거운 물에 우려내 라벤더 향이 특징적인 향긋한 블랙 티',4100,'d036.jpg',0,'없음','none','non-iced',50,'물');      
  
 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d037','d_te',drink_seq.nextval,'아이스 차이 티','Iced Chai Brewed Tea','진저, 카르다몸, 이국적인 풍미의 시나몬 등이 블렌딩된 블랙 티.',4100,'d037.jpg',0,'없음','none','iced',45,'물');      

 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d038','d_te',drink_seq.nextval,'차이 티','Chai Brewed Tea','진저, 카르다몸, 이국적인 풍미의 시나몬 등이 블렌딩된 블랙 티.',4100,'d038.jpg',0,'없음','none','non-iced',45,'물');      

 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d039','d_te',drink_seq.nextval,'아이스 제주 유기 녹차','Iced Jeju Organic Green Tea','제주도 산 유기 녹차로만 이루어져 맑은 수색과 신선한 향, 맛이 뛰어난 녹차.',4100,'d039.jpg',0,'없음','none','iced',16,'물');      

 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d040','d_te',drink_seq.nextval,'제주 유기 녹차','Jeju Organic Green Tea','제주도 산 유기 녹차로만 이루어져 맑은 수색과 신선한 향, 맛이 뛰어난 녹차.',4100,'d040.jpg',0,'없음','none','non-iced',16,'물');      


 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d041','d_te',drink_seq.nextval,'아이스 제주 유기 말차 라떼','Iced Jeju Malcha Latte','깊고 진한 말차 본연의 맛과 향을 시원하고 부드럽게 즐길 수 있는 제주 유기농 말차 라떼',6100,'d041.jpg',0,'클래식시럽','none','iced',60,'우유');      
a

-- 기타 제조 음료

 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d045','d_nc',drink_seq.nextval,'시그니처 핫 초콜릿','Signature Hot Chocolate','유럽 스타일의 진한 핫 초콜릿으로 휘핑크림과 코코아 파우더가 토핑된 음료',5300,'d045.jpg',0,'없음','regular','non-iced',15,'우유');      

 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d046','d_nc',drink_seq.nextval,'아이스 시그니처 초콜릿','Iced Signature Chocolate','진한 초콜릿과 시원한 우유에 휘핑과 코코아 파우더가 얹어진 음료.',5300,'d046.jpg',0,'없음','regular','iced',15,'우유');      
  
  
   INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d047','d_nc',drink_seq.nextval,'스팀 우유','Steamed Milk','부드럽고 담백한 따뜻한 우유.',4100,'d047.jpg',0,'없음','none','non-iced',0,'우유');      

 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d048','d_nc',drink_seq.nextval,'우유','Milk','고소하고 담백한 신선한 우유.',4100,'d048.jpg',0,'없음','none','iced',0,'우유');      

commit;
  
  select * 
  from food
   
    -- 푸드
CREATE TABLE food(
    id              VARCHAR2(20) NOT NULL
    ,category_id  VARCHAR2(20) NOT NULL
    ,food_seq       NUMBER NOT NULL
    ,name           VARCHAR2(100) NOT NULL
    ,name_eng       VARCHAR2(100) NOT NULL
    ,description    VARCHAR2(200) NOT NULL
    ,price          VARCHAR2(80) NOT NULL
    ,img            VARCHAR2(80) NOT NULL
    ,constraint PK_food primary key(id)
    ,constraint FK_food_id foreign key(id) references nutrition(product_id)
    ,constraint FK_food_category foreign key(category_id) references product_category(category_id)
);


create sequence food_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;
-- 푸드_베이커리


INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f001','f_bk',food_seq.nextval,'초코몬드 카라멜 크림치즈 베이글','Chocolate Almond Caramel Cream Cheese Bagel','폭신하고 쫄깃한 식감의 베이글에 초코 아몬드가 콕콕 박힌 카라멜 크림치즈가 듬뿍 샌드되어 달콤하게 즐길 수 있는 브레드입니다.','8000','f001.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f002','f_bk',food_seq.nextval,'카라멜팅 스콘','Melting Caramel Scone','흘러내리는 듯한 카라멜 토핑과 아몬드의 식감이 부드러운 스콘에 더해진 달콤하고 고소한 스콘입니다.','8000','f002.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f003','f_bk',food_seq.nextval,'Pick한 시나몬 롤','Pecan Cinnamon Roll','쌀을 넣어 쫄깃한 식감을 더한 브레드에 진한 시나몬, 크림치즈 버터크림, 고소한 피칸이 조화롭게 어루러져 달콤하게 즐길 수 있는 브레드입니다.','8000','f003.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f004','f_bk',food_seq.nextval,'녹차 머핀','Green Tea Muffin','[제주지역 한정푸드] 녹차가루로 만든 머핀 안에 크림치즈와 통팥을 넣은 녹차 머핀입니다.','8000','f004.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f005','f_bk',food_seq.nextval,'다크 초콜릿 칩 머핀','Dark Chocolate Chip Muffin','그랑크루 초콜릿을 함유한 더욱 진한 초콜릿의 풍미를 느낄 수 있는 머핀입니다.','8000','f005.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f006','f_bk',food_seq.nextval,'상큼한 블루베리 머핀','Blueberry Muffin','상큼한 블루베리로 만든 부드럽고 촉촉한 머핀입니다.','8000','f006.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f007','f_bk',food_seq.nextval,'제주 감귤 머핀','Jeju Tangerine Muffin','[제주지역 한정푸드] 한라봉 주스를 넣은 머핀에 초코칩을 넣어 달콤하면서도 상큼한 머핀입니다.','8000','f007.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f008','f_bk',food_seq.nextval,'고소한 치즈 베이글','Cheese Bagel','양파 베이글 위에 고다 치즈, 파마산 치즈, 블렌디드 치즈를 얹은 베이글입니다.','8000','f008.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f009','f_bk',food_seq.nextval,'블루베리 베이글','Blueberry Bagel','블루베리의 상큼한 풍미가 매력적인 베이글로 크림치즈와 함께 더욱 맛있게 즐기실 수 있습니다.','8000','f009.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f010','f_bk',food_seq.nextval,'미니 클래식 스콘','Mini Classic Scone','미니 사이즈의 담백한 스콘입니다.','8000','f010.jpg');

-- 푸드 케이크
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f031','f_ca',food_seq.nextval,'블루베리 쿠키 치즈 케이크','Blueberry Cookie Cheese Cake','고소한 쿠키와 크림치즈를 듬뿍 넣어 만든 케이크위에 달콤, 상큼한 블루베리가 올라간 진한 치즈 풍미의 케이크입니다.','8000','f031.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f032','f_ca',food_seq.nextval,'슈크림 가득 바움쿠헨','Choux Cream Baumkuchen','바닐라 빈이 들어간 부드러운 슈크림과 바움쿠헨이 조화로운 바닐라 풍미의 케이크입니다.','8000','f032.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f033','f_ca',food_seq.nextval,'진한 녹차 생크림 케이크','Rich Green Tea Cake','입 안 가득 풍부하고 진하게 퍼지는 녹차 맛이 특징인 케이크로 동물성 크림을 더해 더욱 부드럽게 즐길 수 있습니다.','8000','f033.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f034','f_ca',food_seq.nextval,'진한 얼 그레이 생크림 케이크','Rich Earl Grey Cream Cake','직접 우려낸 얼 그레이를 부드러운 크림에 넣어 입 안 가득 퍼지는 얼 그레이의 진하고 풍부한 맛과 향이 특징인 케이크입니다.','8000','f034.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f035','f_ca',food_seq.nextval,'진한 초콜릿 크레이프 케이크','Chocolate Crepe Cake','한 장 한 장 정성스럽게 구운 크레이프 사이에 초코 크림과 진한 가나슈를 넣어 만든 케이크입니다.','8000','f035.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f036','f_ca',food_seq.nextval,'클라우드 초콜릿 케이크','Cloud Chocolate Cake','부드러운 초콜릿 시트에 크림치즈 무스를 올린 달콤한 초콜릿 케이크입니다.','8000','f036.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f037','f_ca',food_seq.nextval,'클라우드 치즈 케이크','Cloud Cheese Cake','사워크림의 상큼함과 진한 치즈의 맛을 동시에 맛볼 수 있는 케이크입니다.','8000','f037.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f038','f_ca',food_seq.nextval,'호두 당근 케이크','Walnut Carrot Cake','고소한 호두와 당근이 조화로운 홈메이드 타입 케이크입니다.','8000','f038.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f039','f_ca',food_seq.nextval,'당근 현무암 케이크','Jeju Carrot Basalt Cake','[제주지역 한정푸드]현무암을 연상케 하는 오징어 먹물 케이크 시트 사이에 새콤한 당근 크림치즈 무스를 샌드한 컵 케이크','8000','f039.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f040','f_ca',food_seq.nextval,'제주 리얼녹차 티라미수 아일랜드','Jeju Real Green Tea Tiramisu Island','[제주지역 한정푸드] 제주녹차를 사용한 시트와 마스카포네 크림으로 진한 녹차의 풍미를 느낄 수 있는 제주 전용 티라미수입니다.','8000','f040.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f041','f_ca',food_seq.nextval,'촉촉 초콜릿 생크림 케이크','Chocolate Fresh Cream Cake','촉촉한 초콜릿 시트에 초콜릿 생크림을 층층이 샌드하여 부드럽고 달콤한 맛이 특징인 케이크입니다.','8000','f041.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f042','f_ca',food_seq.nextval,'청담스타 얼 그레이 밀크 케이크','Cheongdam Star Earl Grey Milk Cake','꿀이 함유된 얼 그레이 시트 사이에 부드러운 얼 그레이 생크림을 샌드한 케이크','8000','f042.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f043','f_ca',food_seq.nextval,'크레이프 에멘탈 치즈 케이크','Crepe Emmental Cheese Cake','부드러운 카스텔라와 에멘탈 치즈, 크림치즈로 만든 케이크','8000','f043.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f044','f_ca',food_seq.nextval,'피칸 브라우니','Pecan Brownie','초콜릿 청크를 넣고 고소한 피칸을 듬뿍 올린 진한 브라우니로 품격 있는 선물을 준비하세요.','8000','f044.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f045','f_ca',food_seq.nextval,'헤븐리 티라미수','Heavenly Tiramisu','촉촉한 커피 시럽의 레이디핑거 쿠키와 100% 마스카포네 크림치즈로 만든 떠 먹는 타입의 티라미수입니다.)','8000','f045.jpg');

-- 푸드_샌드위치&샐러드
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f046','f_ss',food_seq.nextval,'치킨텐더 콥 샐러드 밀박스','Chicken Tender Cobb Salad Meal Box','치킨텐더, 치즈, 메추리알, 올리브 토핑과 방울토마토, 케일 등의 채소를 요거트 드레싱과 함께 즐기는 샐러드','8000','f046.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f047','f_ss',food_seq.nextval,'그릴드 쉬림프 치아바타','Grilled Shrimp Ciabatta','그릴드 채소, 그린빈, 그리고 새우가 스위트 칠리 소스와 잘 어우러져서 매콤 달콤한 맛을 즐길 수 있는 치아바타','8000','f047.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f048','f_ss',food_seq.nextval,'카프레제 샐러드 랩','Caprese Salad Wrap','카프레제 샐러드를 바질 페스토와 함께 그대로 또띠아에 말아 더욱 간편하고 건강하게 즐길 수 있도록 만든 랩 샌드위치입니다.','8000','f048.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f049','f_ss',food_seq.nextval,'로스트 치킨 샐러드 밀 박스','Roast Chicken Salad Meal Box','퀴노아 위에 로스트 치킨을 올리고 프렌치 드레싱을 곁들인 가벼운 샐러드입니다.','8000','f049.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f050','f_ss',food_seq.nextval,'B.E.L.T. 샌드위치','B.E.L.T. Sandwich','주 재료인 베이컨, 계란, 로메인 상추, 토마토의 각각의 머리 글자를 따온 이름의 샌드위치','8000','f050.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f051','f_ss',food_seq.nextval,'DT밀당 샌드위치_바질 모짜렐라','DT Sandwich_Basil Mozzarella','모짜렐라 치즈와 토마토, 루꼴라를 향긋한 향의 바질 페스토를 버무린 담백한 포카치아 샌드위치','8000','f051.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f052','f_ss',food_seq.nextval,'DT밀당 샌드위치_베이컨 크림치즈','DT Sandwich_Bacon Cream Cheese','다양한 재료를 섞어 넣은 짭짤한 크림치즈를 샌드한 먹물 포카치아 샌드위치','8000','f052.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f053','f_ss',food_seq.nextval,'과카몰리 크루아상 밀 박스','Guacamole Croissant Meal Box','과카몰리, 달걀프라이, 베이컨이 들어간 크루아상 샌드위치와 그릴드 베지터블로 만든 샐러드 밀 박스','8000','f053.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f054','f_ss',food_seq.nextval,'단호박 에그 샌드위치','Sweet Pumpkin Egg Sandwich','건강 잡곡 식빵 속에 단호박, 달걀, 토마토, 치즈 등을 넣은 콜드 샌드위치입니다.','8000','f054.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f055','f_ss',food_seq.nextval,'바비큐 치킨 치즈 치아바타','Barbecue Chicken Cheese Ciabatta','바삭한 치아바타에 새콤달콤한 바비큐 소스 치킨, 베이컨, 치즈가 어우러진 샌드위치입니다.','8000','f055.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f056','f_ss',food_seq.nextval,'부드러운 크림치즈 샌드위치','Cream Cheese Sandwich','검은 깨가 콕콕 들어있는 건강한 식빵 안에 토마토와 햄, 그리고 부드럽고 산뜻한 크림치즈가 들어있는 샌드위치입니다.','8000','f056.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f057','f_ss',food_seq.nextval,'어니언 베이컨 체다치즈 파니니','Onion Bacon Cheddar Cheese Panini','베이컨, 체다 치즈, 볶은 양파와 매콤한 치폴레 마요 소스로 만든 치아바타 파니니입니다.','8000','f057.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f058','f_ss',food_seq.nextval,'에그 베이컨 치즈 백년초 베이글','Egg Bacon Cheese Cactus Bagel','[제주지역 한정푸드] 제주도 특산물인 백년초 베이글에 에그패티와 베이컨, 치즈를 넣은 샌드위치입니다.','8000','f058.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f059','f_ss',food_seq.nextval,'제주 흑돼지 아보카도 샌드위치','Jeju Black Pork Avocado Sandwich','[제주지역 한정푸드] 제주도 흑돼지 베이컨, 양상추, 아보카도, 토마토가 들어가고 먹물 바게트 샌드위치','8000','f059.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f060','f_ss',food_seq.nextval,'파인 땡큐 샌드위치','Fine Thank-You Sandwich','여름 대표 열대 과일인 달콤한 파인애플을 매콤한 할라페뇨와 함께 버무리고 토마토 바비큐 소스로 맛을 낸 여름 시즌 한정 샌드위치','8000','f060.jpg');

-- 푸드_따뜻한음식
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f061','f_wf',food_seq.nextval,'트러플 머쉬룸 수프','Truffle Mushroom Soup','송로 버섯의 향과 양송이 버섯의 진한 풍미가 조화로운 식사 대용 수프입니다. ※ 수프 구매 시 크래커가 함께 제공됩니다.','8000','f061.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f062','f_wf',food_seq.nextval,'현미 크림 수프','Brown Rice Cream Soup','고소한 현미와 풍부한 우유 크림으로 만든 건강한 컨셉의 수프입니다.','8000','f062.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f063','f_wf',food_seq.nextval,'우리나라 옥고감','Steamed Corn, Sweet Potato, Potato','우리 땅에서 자란 세 가지 농산물을 오븐에 구워 간편하게 한 끼를 즐길 수 있는 상품입니다.','8000','f063.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f064','f_wf',food_seq.nextval,'한 입에 쏙 호두','Walnut Mini Bites','고소한 호두와 헤이즐넛, 그리고 달콤한 대추가 들어있는 한 입 크기의 미니 팬 케이크입니다.','8000','f064.jpg');

-- 푸드_과일&요거트
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f065','f_fy',food_seq.nextval,'사과 가득 핸디 젤리','Apple Handy Jelly','경북 특산물인 사과를 가득 담은 달콤한 맛의 스타벅스 핸디 젤리','8000','f065.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f066','f_fy',food_seq.nextval,'제주 자연 청 세트','Jeju Marmalade Set','[제주지역 한정푸드] 제주도 청정 자연의 맛과 멋을 담은 건강한 청 선물 세트 입니다.','8000','f066.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f067','f_fy',food_seq.nextval,'하루 한 컵 GREEN','A Fresh Cup A Day, GREEN','키위와 청포도를 한 컵에 담아 언제 어디서나 편하게 즐길 수 있습니다.','8000','f067.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f068','f_fy',food_seq.nextval,'한 입에 쏙 열대 과일칩(망고 파인애플)','Frozen Dried Fruit(Mango Pineapple)','대표 열대 과일인 파인애플과 망고를 그대로 동결 건조한 과일 스낵으로 바삭한 식감과 함께 과일 본연의 맛을 즐길 수 있습니다.','8000','f068.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f069','f_fy',food_seq.nextval,'New 초콜릿 푸딩','New Chocolate Pudding','벨기에 초콜릿과 무항생제 달걀, 신선한 우유로 만든 진한 초콜릿 푸딩입니다. 냉장보관이 필요한 상품입니다.','8000','f069.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f070','f_fy',food_seq.nextval,'오가닉 그릭 요거트 플레인 JAR','Organic Greek Yogurt Plain JAR','사이렌 로고가 그려진 도자기 안에 진한 크림 치즈처럼 깊고 풍부한 맛의 유기농 그릭 요거트가 담겨 있습니다.','8000','f070.jpg');
  
  
  
  commit;




 ---- 커스텀 비용 테이블
 
 CREATE TABLE custom_price(
   name  VARCHAR2(5) NOT NULL
  ,price INTEGER  NOT NULL
);

INSERT INTO custom_price(name,price) VALUES ('샷',500);
INSERT INTO custom_price(name,price) VALUES ('휘핑크림',300);
INSERT INTO custom_price(name,price) VALUES ('시럽',300);





-- 나의 메뉴
create table favorite_menu
(userid          varchar2(20)    not null        -- 아이디
,product_id      varchar2(30)                    -- 제품아이디
,my_menu_seq     number                          -- 나의메뉴시퀀스
,product_name    varchar2(50)                    -- 제품명
,register_day    date default sysdate            -- 등록일
,section         number
,constraint FK_favorite_menu_userid foreign key (userid)
                                      references starbucks_member(userid)
,constraint FK_favorite_menu_proId foreign key (product_id)
                                      references nutrition(product_id)
);



-- 구매 상세
create table purchase_detail
(product_id             varchar2(20)                -- 제품아이디
,slip_num               varchar2(20)                -- 전표번호
,userid                 varchar2(20)   not null     -- 아이디
,store_id               varchar2(20)   not null     -- 매장아이디
,cnt                    number                      -- 주문수량
,price                  number                      -- 금액
,product_code           varchar2(20)                -- 제품코드
,purchase_detail_seq    number                      -- 구매상세시퀀스
,constraint FK_purchase_detail_proId foreign key (product_id)
                                      references nutrition(product_id)
,constraint FK_purchase_detail_slipNum foreign key (slip_num)
                                      references slip(slip_num)
,constraint FK_purchase_detail_userid foreign key (userid)
                                      references starbucks_member(userid)
,constraint FK_purchase_detail_storeId foreign key (store_id)
                                      references store_location(store_id)
);


-- 전표
create table slip
(slip_num           varchar2(20)               -- 전표번호
,userid             varchar2(20)  not null     -- 아이디
,store_id           varchar2(20)  not null     -- 매장아이디
,purchase_day       date default sysdate       -- 판매일자
,slip_seq           number                     -- 전표시퀀스
,constraint PK_slip primary key(slip_num)
,constraint FK_slip foreign key (userid)
                            references starbucks_member(userid)
,constraint FK_slip_storeId foreign key (store_id)
                            references store_location(store_id)
);

-- 회원
create table starbucks_Member
(Member_seq         number(4)      not null       -- 시퀀스
,userid             varchar2(20)   not null       -- 아이디
,password           varchar2(200)  not null       -- 비밀번호 (SHA-256 암호화 대상)
,name               varchar2(30)   not null       -- 이름
,email              varchar2(200)  not null       -- 이메일   (AES-256 암호화/복호화 대상)
,hp1                varchar2(3)                   -- 연락처
,hp2                varchar2(200)                 --         
,hp3                varchar2(200)                 --        
,point              number default 0              -- 포인트 
,gender             number(1)                     -- 성별     남자 : 1 / 여자 : 2
,birthday           varchar2(15)                   -- 생일 
,register_day       date default sysdate          -- 가입일
,status             number(1) default 1           -- 탈퇴유무   1:사용가능(가입중) / 0:사용불능(탈퇴) 
,constraint   UQ_starbucks_Member unique(userid)
,constraint   CK_starbucks_Member_gender check( gender in('1','2') ) 
,constraint   CK_starbucks_Member_status check( status in(0,1) ) 
);

--시퀀스
create sequence seq_starbucks_Member
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

----------------------------------------------------------

--고객의소리 시퀀스
create sequence feedback_board_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

drop table feedback_post purge;

----고객의 소리 게시판-----
create table feedback_post
(
feedback_board_seq   number                    -- 고객의소리시퀀스
,store_id            varchar2(20)    not null  -- 매장아이디
,userid              varchar2(20)    not null  -- 아이디
,category            varchar2(10)    not null  -- 주제 (문의,칭찬,제안,불만)
,title               varchar2(100)   not null  -- 글제목  
,contents            varchar2(2500)  not null  -- 내용
,hp1                 varchar2(3)               -- 연락처
,hp2                 varchar2(200)             --         
,hp3                 varchar2(200)             --     
,file_attached       varchar2(100)             -- 첨부파일
,file_attached2       varchar2(100)             -- 첨부파일2
,hit                 number  default 0         -- 조회수
,username            varchar2(10)              -- 작성자
,write_day           date default sysdate      -- 작성일
,status              varchar2(10)              -- 상태(접수중,완료)
--,constraint PK_feedback_post primary key(feedback_board_seq)
--,constraint FK_feedback_post_store_id foreign key(store_id)
--                            references shopping_map(storeID)
--,constraint FK_feedback_post_userid foreign key(userid)
--                            references starbucks_Member(userid)        
);


select *
from feedback_post;

insert into feedback_post (feedback_board_seq, store_id, userid, category, title, contents, hit, username, write_day, status)
values (seq_notice_post.nextval, 'store1', 'gpwjd1789', '문의', '종각점에 레디백 재고 있나요?', '답변빨리해주세요', default, '주혜정', sysdate, '접수중'); 

insert into feedback_post (feedback_board_seq, store_id, userid, category, title, contents, hit, username, write_day, status)
values (seq_notice_post.nextval, 'store2', 'gpwjd1789', '칭찬', '여기지점 맛있어요', '짱이에요', default, '주혜정', sysdate, '접수중'); 

insert into feedback_post (feedback_board_seq, store_id, userid, category, title, contents, hit, username, write_day, status)
values (seq_notice_post.nextval, 'store3', 'gpwjd1789', '불만', '여기지점 더러워요', '청결에 신경을 써주세요', default, '주혜정', sysdate, '접수중'); 

insert into feedback_post (feedback_board_seq, store_id, userid, category, title, contents, hp1, hp2, hp3, file_attached, hit, username, write_day, status)
values (seq_notice_post.nextval, 'store1', 'gpwjd1789', '문의', '종각점에 레디백 재고 있나요?', '답변빨리해주세요', '', '', '', '', default, '주혜정', sysdate, '접수중'); 

commit;

------------------------------------------------------------------------------------------

select  lag(first_name || ' ' || last_name) over(order by salary desc)    -- 앞에 행의 이름을 보여주자
           , lag(salary) over(order by salary desc)         -- 앞에 행의 월급을 보여주자
           
           ,  employee_id
           , first_name || ' ' || last_name AS ENAME
           , salary
           
           , lead(first_name || ' ' || last_name) over(order by salary desc)    -- 뒤의 행에 이름을 보여주자 
           , lead(salary) over(order by salary desc)    -- 뒤의 행에 월급을 보여주자
      from employees;


-- 윗글 아랫글 글번호 보여주기     

select  lag(notice_seq) over(order by notice_seq desc) AS POSTNUM    -- 앞에 행의 글번호를 보여주자
      , nvl( (lag(title) over(order by notice_seq desc)),'글이 없습니다.' )AS POSTTITLE      -- 앞에 행의 글제목을 보여주자
      , notice_seq  -- 현재 글번호
      , title       -- 현재 글제목
      , contents    -- 현재 글내용
      , lead(notice_seq) over(order by notice_seq desc) AS PRENUM   -- 뒤에 행의 글번호를 보여주자
      , nvl( (lead(title) over(order by notice_seq desc)),'글이 없습니다.' )AS PRETITLE        -- 뒤의 행에 글제목 보여주자
from notice_post;


-- 윗글 아랫글 불러오기 최종
select POSTNUM, POSTTITLE, notice_seq, title, contents, PRENUM, PRETITLE
from 
(
    select  lag(notice_seq) over(order by notice_seq desc) AS POSTNUM    -- 앞에 행의 글번호를 보여주자
          , nvl( (lag(title) over(order by notice_seq desc)),'글이 없습니다.' )AS POSTTITLE      -- 앞에 행의 글제목을 보여주자
          , notice_seq  -- 현재 글번호
          , title       -- 현재 글제목
          , contents    -- 현재 글내용
          , lead(notice_seq) over(order by notice_seq desc) AS PRENUM   -- 뒤에 행의 글번호를 보여주자
          , nvl( (lead(title) over(order by notice_seq desc)),'글이 없습니다.' )AS PRETITLE        -- 뒤의 행에 글제목 보여주자
    from notice_post
) V
where notice_seq = 1;




--- 스타벅스 최종테이블
최종테이블

* 커스텀 테이블 


drop table custom_price;


 CREATE TABLE custom_price(
   name  VARCHAR2(15) NOT NULL
  ,price INTEGER  NOT NULL
);

INSERT INTO custom_price(name,price) VALUES ('shot',500);
INSERT INTO custom_price(name,price) VALUES ('whipped_cream',300);
INSERT INTO custom_price(name,price) VALUES ('syrup',300);
 
select * from custom_price;


commit;


* 공지사항 테이블 

-- 공지사항 게시판
     create table notice_post
    ( notice_seq        number(4)   not null        -- 공지사항시퀀스
    , title             varchar2(100)   not null    -- 글제목
    , contents          varchar2(4000)  not null    -- 글내용
    , write_day         date default sysdate        -- 작성일
    , hit               Number(4) default 0         -- 조회수
    , constraint PK_notice_post_notice_seq primary key(notice_seq)
    );

    -- 공지사항시퀀스
    create sequence seq_notice_post
    start with 1
    increment by 1
    nomaxvalue
    nominvalue
    nocycle
    nocache;
           
     -- 공지사항 대량기입
    create or replace procedure pcd_notice_post_insert
    (p_title  IN  varchar2
    ,p_contents    IN  varchar2)
    is
    begin
        for i in 1..150 loop 
            insert into notice_post(notice_seq, title, contents, write_day, hit)
            values(seq_notice_post.nextval, p_title||i, p_contents||i, sysdate, 73);
        end loop;
    end pcd_notice_post_insert;   
    -- Procedure pcd_notice_post_insert(가) 컴파일되었습니다.      
    
    execute pcd_notice_post_insert('시스템 개선 및 점검 안내 ','안녕하세요. 스타벅스커피 코리아입니다.');
    
    commit;
    
    
    -- 공지사항 대량기입
    create or replace procedure pcd_notice_post_in
    (p_title  IN  varchar2
    ,p_contents    IN  varchar2)
    is
    begin
        for i in 1..15 loop 
            insert into notice_post(notice_seq, title, contents, write_day, hit)
            values(seq_notice_post.nextval, p_title||i, p_contents||i, sysdate, 73);
        end loop;
    end pcd_notice_post_in;   
    -- Procedure pcd_notice_post_in(가) 컴파일되었습니다.      
    
    execute pcd_notice_post_in('앱 서비스/홈페이지 서비스의 중단안내 ','안녕하세요. 스타벅스커피 코리아입니다. 보다 나은 서비스를 제공해 드리고자 시스템 서버 점검을 아래와 같이 진행합니다.');
    
    commit;
    
    select *
    from notice_post;

    select *
    from starbucks_Member
    where userid='nari';
    
    update starbucks_Member set password = '9695b88a59a1610320897fa84cb7e144cc51f2984520efb77111d94b402a8382'
    where userid='nari';
    
    commit

* 멤버 테이블 

    select *
    from starbucks_Member;

create table starbucks_Member
(Member_seq         number(4)      not null       -- 시퀀스
,userid                 varchar2(20)   not null       -- 아이디
,password           varchar2(200)  not null       -- 비밀번호 (SHA-256 암호화 대상)
,name               varchar2(30)   not null       -- 이름
,email              varchar2(200)  not null       -- 이메일   (AES-256 암호화/복호화 대상)
,hp1                varchar2(3)                   -- 연락처
,hp2                varchar2(200)                 --         
,hp3                varchar2(200)                 --        
,point              number default 0              -- 포인트 
,gender             number(1)                     -- 성별     남자 : 1 / 여자 : 2
,birthday           varchar2(15)                   -- 생일 
,register_day       date default sysdate          -- 가입일
,status             number(1) default 1           -- 탈퇴유무   1:사용가능(가입중) / 0:사용불능(탈퇴) 
,constraint   UQ_starbucks_Member unique(userid)
,constraint   CK_starbucks_Member_gender check( gender in('1','2') ) 
,constraint   CK_starbucks_Member_status check( status in(0,1) ) 
);

--시퀀스
create sequence seq_starbucks_Member
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

commit;




* 영양 테이블 


 CREATE TABLE nutrition(
   product_id       VARCHAR(4) NOT NULL
  ,nutrition_seq    NUMBER(3) NOT NULL
  ,kcal             NUMBER(5) NOT NULL
  ,sodium           NUMBER(5) NOT NULL
  ,cholesterol      NUMBER(5) NOT NULL
  ,sugar     NUMBER(5) NOT NULL
  ,protein          NUMBER(5) NOT NULL
  ,allergy_triggers VARCHAR2(100)
  ,parent_table     VARCHAR2(10) NOT NULL
  ,constraint PK_nutrition primary key(product_id)
);


create sequence nutrition_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d001',nutrition_seq.nextval,75,20,2,10,1,'우유', 'drink');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d002',nutrition_seq.nextval,55,20,2,7,1,'우유', 'drink');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d003',nutrition_seq.nextval,5,5,0,0,0, null, 'drink');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d004',nutrition_seq.nextval,265,115,9,29,8,'우유', 'drink');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d005',nutrition_seq.nextval,125,58,6,11,3,'우유', 'drink');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d006',nutrition_seq.nextval,5,11,0,0,0, null, 'drink');

INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d007',nutrition_seq.nextval,5,10,0,0,0,null, 'drink');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d008',nutrition_seq.nextval,5,10,0,0,0,null, 'drink');
 

INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d009',nutrition_seq.nextval,10,5,0,0,1,null, 'drink');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d010',nutrition_seq.nextval,10,5,0,0,1,null, 'drink');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d011',nutrition_seq.nextval,190,110,4,21,6,'우유', 'drink');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d012',nutrition_seq.nextval,200,130,5,22,8,'우유', 'drink');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d013',nutrition_seq.nextval,115,90,4,9,6,'우유', 'drink');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d014',nutrition_seq.nextval,110,70,3,8,6,'우유', 'drink');
 
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d015',nutrition_seq.nextval,110,75,4,8,6,'우유', 'drink');-- 아이스 카페라떼
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d016',nutrition_seq.nextval,180,115,5,13,10,'우유','drink');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d017',nutrition_seq.nextval,250,70,8,21,7,'우유','drink');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d018',nutrition_seq.nextval,290,105,9,25,10,'우유','drink');
 
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d019',nutrition_seq.nextval,350,150,11,41,8,'우유','drink');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d020',nutrition_seq.nextval,390,190,11,45,12,'우유','drink');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d021',nutrition_seq.nextval,5,0,0,0,10,null,'drink');
 

INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d022',nutrition_seq.nextval,265,140,11,31,3,'우유','drink');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d023',nutrition_seq.nextval,280,180,6,36,5,'우유','drink');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d024',nutrition_seq.nextval,140,125,1,22,3,'우유','drink');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d025',nutrition_seq.nextval,340,180,9,42,6,'대두/우유/밀','drink');

INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d026',nutrition_seq.nextval,300,190,7,39,4,'우유','drink'); -- 카라멜 프라푸치노
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d027',nutrition_seq.nextval,310,241,5,38,9,'우유','drink');-- 화이트초콜릿
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d028',nutrition_seq.nextval,370,266,8,44,11,'대두/우유/밀','drink'); -- 초코릿크림칩 프라푸치노
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d029',nutrition_seq.nextval,355,230,8,39,8,'땅콩/우유','drink'); -- 피스타치


INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d030',nutrition_seq.nextval,315,150,2,56,10,'우유','drink'); -- 애플망고
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d031',nutrition_seq.nextval,190,45,0,27,0,'복숭아','drink');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d032',nutrition_seq.nextval,120,70,0,25,1,null,'drink'); -- 망고패션후르츠
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d033',nutrition_seq.nextval,250,128,1,48,8,'우유/토마토','drink'); -- 딸기요거트 

INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d034',nutrition_seq.nextval,140,5,0,29,0,null,'drink');

INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d035',nutrition_seq.nextval,0,0,0,0,0,null,'drink');--earl grey iced 
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d036',nutrition_seq.nextval,0,0,0,0,0,null,'drink');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d037',nutrition_seq.nextval,0,0,0,0,0,null,'drink'); -- chai
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d038',nutrition_seq.nextval,0,0,0,0,0,null,'drink');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d039',nutrition_seq.nextval,0,0,0,0,0,null,'drink'); -- ice 녹차
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d040',nutrition_seq.nextval,0,0,0,0,0,null,'drink'); -- 녹차


INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d041',nutrition_seq.nextval,155,95,4,16,6,'우유','drink'); -- iced malcha latte
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d042',nutrition_seq.nextval,205,130,5,20,9,'우유','drink'); 
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d043',nutrition_seq.nextval,190,70,3,31,5,'우유','drink');-- iced 차이티라떼
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d044',nutrition_seq.nextval,200,70,3,31,6,'우유','drink');

INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d045',nutrition_seq.nextval,435,114,16,37,12,'우유','drink'); -- chocolate
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d046',nutrition_seq.nextval,435,114,16,37,12,'우유','drink');-- iced chocolate
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d047',nutrition_seq.nextval,215,173,7,18,13,'우유','drink'); 
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table) VALUES ('d048',nutrition_seq.nextval,240,200,8,18,12,'우유','drink');

INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f001',nutrition_seq.nextval,'530','950','14','30','12','대두 / 우유 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f002',nutrition_seq.nextval,'550','545','16','24','6','우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f003',nutrition_seq.nextval,'466','490','5','25','9','땅콩 / 호두 / 대두 / 우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f004',nutrition_seq.nextval,'216','508','3','7','5','대두 / 우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f005',nutrition_seq.nextval,'510','490','12','37','5','대두 / 우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f006',nutrition_seq.nextval,'450','520','6','38','5','대두 / 우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f007',nutrition_seq.nextval,'191','396','4','5','6','대두 / 우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f008',nutrition_seq.nextval,'343','527','3.7','17','17','우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f009',nutrition_seq.nextval,'258','539','0.3','10','10','밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f010',nutrition_seq.nextval,'452','304','14','12','7','우유 / 난류 / 밀','food');

INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f031',nutrition_seq.nextval,'984','85','12','26','5','대두 / 우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f032',nutrition_seq.nextval,'565','230','20','43','7','우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f033',nutrition_seq.nextval,'272','130','14','19','3','대두 / 우유 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f034',nutrition_seq.nextval,'660','140','26','39','8','땅콩 / 호두 / 대두 / 우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f035',nutrition_seq.nextval,'582','120','5','19','8','대두 / 우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f036',nutrition_seq.nextval,'292','370','52','27','7','우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f037',nutrition_seq.nextval,'385','270','83','29','11','땅콩 / 호두 / 대두 / 우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f038',nutrition_seq.nextval,'582','128','37','80','3','대두 / 우유 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f039',nutrition_seq.nextval,'371','98','12','8','2','우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f040',nutrition_seq.nextval,'439','278','20','38','9','대두 / 우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f041',nutrition_seq.nextval,'270','138','38','27','6','땅콩 / 호두 / 대두 / 우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f042',nutrition_seq.nextval,'439','278','2','16','12','땅콩 / 호두 / 대두 / 우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f043',nutrition_seq.nextval,'389','183','9','23','9','우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f044',nutrition_seq.nextval,'961','302','8','13','3','대두 / 우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f045',nutrition_seq.nextval,'670','190','12','12','7','땅콩 / 호두 / 대두 / 우유 / 난류 / 밀','food');

INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f046',nutrition_seq.nextval,'680','132','3','16','13','땅콩 / 호두 / 대두 / 우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f047',nutrition_seq.nextval,'731','290','12','32','7','땅콩 / 대두 / 우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f048',nutrition_seq.nextval,'832','371','11','21','3','우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f049',nutrition_seq.nextval,'537','280','7','36','8','땅콩 / 호두 / 대두 / 우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f050',nutrition_seq.nextval,'473','196','5','27','11','땅콩 / 대두 / 우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f051',nutrition_seq.nextval,'381','127','3','17','4','우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f052',nutrition_seq.nextval,'572','207','18','28','6','땅콩 / 호두 / 대두 / 우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f053',nutrition_seq.nextval,'620','216','5','29','8','대두 / 우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f054',nutrition_seq.nextval,'853','190','21','32','11','땅콩 / 호두 / 대두 / 우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f055',nutrition_seq.nextval,'593','271','19','11','6','대두 / 우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f056',nutrition_seq.nextval,'428','198','3','19','4','우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f057',nutrition_seq.nextval,'473','137','12','28','5','땅콩 / 호두 / 대두 / 우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f058',nutrition_seq.nextval,'537','128','10','21','10','땅콩 / 호두 / 대두 / 우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f059',nutrition_seq.nextval,'897','260','18','10','7','대두 / 우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f060',nutrition_seq.nextval,'684','276','21','38','9','땅콩 / 대두 / 우유 / 난류 / 밀','food');

INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f061',nutrition_seq.nextval,'680','185','12','21','12','땅콩 / 우유 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f062',nutrition_seq.nextval,'628','168','8','27','4','대두 / 우유 / 밀 / 닭고기','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f063',nutrition_seq.nextval,'523','208','19','27','7',null,'food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f064',nutrition_seq.nextval,'579','137','14','38','9','호두 / 우유 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)

VALUES ('f065',nutrition_seq.nextval,'273','138','26','21','9',null,'food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f066',nutrition_seq.nextval,'496','219','3','24','9',null,'food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f067',nutrition_seq.nextval,'421','127','27','19','9',null,'food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f068',nutrition_seq.nextval,'512','167','7','34','9',null,'food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f069',nutrition_seq.nextval,'598','138','32','17','9','땅콩 / 대두 / 난류 / 밀','food');
INSERT INTO nutrition(product_id,nutrition_seq,kcal,sodium,cholesterol,sugar,protein,allergy_triggers,parent_table)
VALUES ('f070',nutrition_seq.nextval,'532','172','18','21','9','우유','food');

commit;

select * from nutrition;




* 카테고리 테이블 

CREATE TABLE product_category(
   category_id         VARCHAR2(10) NOT NULL
  ,category_name       VARCHAR(25) NOT NULL
  ,category_seq        NUMBER  NOT NULL
  ,constraint PK_product_category primary key(category_id)
);

create sequence category_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;


INSERT INTO product_category(category_id,category_name,category_seq) VALUES ('d_cb','콜드 브루 커피',category_seq.nextval);
INSERT INTO product_category(category_id,category_name,category_seq) VALUES ('d_br','브루드 커피',category_seq.nextval);
INSERT INTO product_category(category_id,category_name,category_seq) VALUES ('d_es','에스프레소',category_seq.nextval);
INSERT INTO product_category(category_id,category_name,category_seq) VALUES ('d_fp','프라푸치노' ,category_seq.nextval);
INSERT INTO product_category(category_id,category_name,category_seq) VALUES ('d_bl','블렌디드' ,category_seq.nextval);
INSERT INTO product_category(category_id,category_name,category_seq) VALUES ('d_te','티',category_seq.nextval);
INSERT INTO product_category(category_id,category_name,category_seq) VALUES ('d_nc','기타 제조 음료' ,category_seq.nextval);

INSERT INTO product_category(category_id,category_name,category_seq) VALUES ('f_bk','베이커리' ,category_seq.nextval);
INSERT INTO product_category(category_id,category_name,category_seq) VALUES ('f_ca','케이크' ,category_seq.nextval);
INSERT INTO product_category(category_id,category_name,category_seq) VALUES ('f_ss','샌드위치 샐러드' ,category_seq.nextval);
INSERT INTO product_category(category_id,category_name,category_seq) VALUES ('f_wf','따뜻한 푸드' ,category_seq.nextval);
INSERT INTO product_category(category_id,category_name,category_seq) VALUES ('f_fy','과일 요거트' ,category_seq.nextval);

select * from product_category;

commit;


* 매장 테이블

    --- 매장위치 테이블 시퀀스 삭제
    drop table store_location purge;
    drop sequence seq_store_location;
    
    -- 매장위치
    create table store_location
    ( store_id          varchar2(30)   not null     -- 매장아이디
    , store_sequence    number(4)   not null        -- 매장시퀀스
    , store_name        varchar2(50)   not null     -- 매장명
    , address           varchar2(200)  not null     -- 주소
    , url               varchar2(200)   not null    -- 매장 홈페이지 url
    , latitude          number  not null            -- 위도
    , longitude         number  not null            -- 경도
    , zindex            number(4)   not null        -- zindex
    , constraint PK_store_location_sid primary key(store_id)
    );
    
    -- 매장위치 매장시퀀스
    create sequence seq_store_location
    start with 1
    increment by 1
    nomaxvalue
    nominvalue
    nocycle
    nocache;
   
    select *
    from store_location;
    
    -- 매장위치 데이터 삽입
    insert into store_location (store_id, store_sequence, store_name, address, url, latitude, longitude, zindex)
    values (1, seq_store_location.nextval, '스타벅스 을지로삼화타워점', '서울특별시 중구 수하동 을지로5길 16', 'https://place.map.kakao.com/17884783', 37.566996, 126.984612, seq_store_location.nextval);
    insert into store_location (store_id, store_sequence, store_name, address, url, latitude, longitude, zindex)
    values (2, seq_store_location.nextval, '스타벅스 종로관철점', '서울특별시 종로구 관철동 종로12길 21', 'https://place.map.kakao.com/12700362', 37.569023, 126.986006, seq_store_location.nextval);
    insert into store_location (store_id, store_sequence, store_name, address, url, latitude, longitude, zindex)
    values (3, seq_store_location.nextval, '스타벅스 종각점', '서울특별시 종로구 종로2가 종로 64', 'https://place.map.kakao.com/8405079', 37.569993, 126.984534, seq_store_location.nextval);
    insert into store_location (store_id, store_sequence, store_name, address, url, latitude, longitude, zindex)
    values (4, seq_store_location.nextval, '스타벅스 을지로한국빌딩점', '서울특별시 중구 명동 을지로 50', 'https://place.map.kakao.com/27090421', 37.565690, 126.983299, seq_store_location.nextval);
    insert into store_location (store_id, store_sequence, store_name, address, url, latitude, longitude, zindex)
    values (5, seq_store_location.nextval, '스타벅스 환구단점', '서울특별시 중구 소공동', 'https://place.map.kakao.com/22894118', 37.564907, 126.979189, seq_store_location.nextval);
    insert into store_location (store_id, store_sequence, store_name, address, url, latitude, longitude, zindex)
    values (6, seq_store_location.nextval, '스타벅스 남산단암점', '서울특별시 중구 회현동 소월로 10', 'https://place.map.kakao.com/12108441', 37.558648, 126.975294, seq_store_location.nextval);
    
    
        -- 매장위치 데이터 삽입2
    insert into store_location (store_id, store_sequence, store_name, address, url, latitude, longitude, zindex)
    values (7, seq_store_location.nextval, '스타벅스 인사점', '서울 종로구 인사동길 14', 'https://place.map.kakao.com/8430510', 37.572234, 126.986929, seq_store_location.nextval);
    insert into store_location (store_id, store_sequence, store_name, address, url, latitude, longitude, zindex)
    values (8, seq_store_location.nextval, '스타벅스 삼선교점', '서울 성북구 동소문로 10 1~2층', 'https://place.map.kakao.com/23325995', 37.588659, 127.007306, seq_store_location.nextval);
    insert into store_location (store_id, store_sequence, store_name, address, url, latitude, longitude, zindex)
    values (9, seq_store_location.nextval, '스타벅스 제주시청점', '제주특별자치도 제주시 중앙로 215', 'https://place.map.kakao.com/1551305286', 33.500555, 126.529747, seq_store_location.nextval);
    insert into store_location (store_id, store_sequence, store_name, address, url, latitude, longitude, zindex)
    values (10, seq_store_location.nextval, '스타벅스 더해운대R점', '부산 해운대구 해운대해변로 197 해운대경동제이드아파트 101동', 'https://place.map.kakao.com/1461263034', 35.158474, 129.153036, seq_store_location.nextval);
    insert into store_location (store_id, store_sequence, store_name, address, url, latitude, longitude, zindex)
    values (11, seq_store_location.nextval, '스타벅스 강릉안목항점', '강원 강릉시 창해로14번길 40', 'https://place.map.kakao.com/20494147', 37.771372, 128.948691, seq_store_location.nextval);
    insert into store_location (store_id, store_sequence, store_name, address, url, latitude, longitude, zindex)
    values (12, seq_store_location.nextval, '스타벅스 대전노은점', '대전 유성구 은구비남로33번길 26', 'https://place.map.kakao.com/22547066', 36.373456, 127.319509, seq_store_location.nextval);
    
    insert into store_location (store_id, store_sequence, store_name, address, url, latitude, longitude, zindex)
    values (13, seq_store_location.nextval, '스타벅스 서판교', '경기 성남시 분당구 운중로 132', 'https://place.map.kakao.com/26911884', 37.391361, 127.077720, seq_store_location.nextval);
    insert into store_location (store_id, store_sequence, store_name, address, url, latitude, longitude, zindex)
    values (14, seq_store_location.nextval, '스타벅스 수원매산점', '경기 수원시 팔달구 매산로 11', 'https://place.map.kakao.com/11316780', 37.267399, 127.002667, seq_store_location.nextval);
    insert into store_location (store_id, store_sequence, store_name, address, url, latitude, longitude, zindex)
    values (15, seq_store_location.nextval, '스타벅스 전남광양DT', '전남 광양시 중마중앙로 143', 'https://place.map.kakao.com/583550832', 34.943073, 127.697901, seq_store_location.nextval);
    insert into store_location (store_id, store_sequence, store_name, address, url, latitude, longitude, zindex)
    values (16, seq_store_location.nextval, '스타벅스 상봉역점', '서울 중랑구 망우로 307', 'https://place.map.kakao.com/17884784', 37.596906, 127.086434, seq_store_location.nextval);
    insert into store_location (store_id, store_sequence, store_name, address, url, latitude, longitude, zindex)
    values (17, seq_store_location.nextval, '스타벅스 안산중앙점', '경기 안산시 단원구 고잔로 102', 'https://place.map.kakao.com/21580662', 37.318765, 126.837608, seq_store_location.nextval);
    insert into store_location (store_id, store_sequence, store_name, address, url, latitude, longitude, zindex)
    values (18, seq_store_location.nextval, '스타벅스 김포시청점', '경기 김포시 사우중로 35', 'https://place.map.kakao.com/24165747', 37.618455, 126.717842, seq_store_location.nextval);

    commit;





* 고객의소리 테이블 

----고객의 소리 게시판-----
create table feedback_post
(
feedback_board_seq   number                         -- 고객의소리시퀀스
,store_id            varchar2(20)                   -- 매장아이디
,visit_day           varchar2(20)                   -- 매장방문일
,userid              varchar2(20)    not null       -- 아이디
,category            varchar2(10)    not null       -- 주제 (문의,칭찬,제안,불만)
,title               varchar2(100)   not null       -- 글제목  
,contents            varchar2(2500)  not null       -- 내용
,hp1                 varchar2(3)                    -- 연락처
,hp2                 varchar2(200)                  --         
,hp3                 varchar2(200)                  --     
,file_attached       varchar2(100)                  -- 첨부파일
,file_attached2       varchar2(100)                 -- 첨부파일2
,hit                 number  default 0              -- 조회수
,username            varchar2(10)                   -- 작성자
,write_day           date default sysdate           -- 작성일
,status              varchar2(10) default '접수중'   -- 상태(접수중,완료)
,constraint PK_feedback_post primary key(feedback_board_seq)
,constraint FK_feedback_post_store_id foreign key(store_id)
                            references store_location(store_id)
,constraint FK_feedback_post_userid foreign key(userid)
                            references starbucks_Member(userid)        
);

 create sequence feedback_board_seq
 start with 1
 increment by 1
 nomaxvalue
 nominvalue
 nocycle
 nocache;


create or replace procedure pcd_feedback_post_insert
(
p_title      IN  varchar2
,p_contents  IN  varchar2)
is
begin
    for i in 1..100 loop 
        insert into feedback_post(feedback_board_seq, category, hp1, hp2, hp3, store_id, visit_day, title, contents, file_attached, file_attached2, userid, hit, username, write_day, status)
            values(feedback_board_seq.nextval, '문의', '010', '1234', '5647',  '1', sysdate, p_title||i, p_contents||i, 'starback.jpg', 'starback.jpg', 'gpwjd1789', 1, '주혜정', sysdate, '접수중');
        end loop;
end pcd_feedback_post_insert;   
--Procedure PCD_FEEDBACK_POST_INSERT이(가) 컴파일되었습니다.

execute pcd_feedback_post_insert('문의드립니다','고객의소리 게시판 테스트 내용입니다.');
    
commit; 

select *
from feedback_post;



* 전표 테이블

-- 전표
create table slip
(slip_num           varchar2(20)               -- 전표번호
,userid             varchar2(20)  not null     -- 아이디
,store_id           varchar2(20)  not null     -- 매장아이디
,purchase_day       date default sysdate       -- 판매일자
,slip_seq           number                     -- 전표시퀀스
,constraint PK_slip primary key(slip_num)
,constraint FK_slip foreign key (userid)
                            references starbucks_member(userid)
,constraint FK_slip_storeId foreign key (store_id)
                            references store_location(store_id)
);



-- 슬립시퀀스
create sequence slip_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;


* 구매상세 테이블

-- 구매 상세
create table purchase_detail
(product_id             varchar2(20)                -- 제품아이디
,slip_num               varchar2(20)                -- 전표번호
,userid                 varchar2(20)   not null     -- 아이디
,store_id               varchar2(20)   not null     -- 매장아이디
,cnt                    number                      -- 주문수량
,price                  number                      -- 금액
,section                number                      -- 0: 음료,1: 푸드 
,purchase_detail_seq    number                      -- 구매상세시퀀스
,constraint FK_purchase_detail_proId foreign key (product_id)
                                      references nutrition(product_id)
,constraint FK_purchase_detail_slipNum foreign key (slip_num)
                                      references slip(slip_num)
,constraint FK_purchase_detail_userid foreign key (userid)
                                      references starbucks_member(userid)
,constraint FK_purchase_detail_storeId foreign key (store_id)
                                      references store_location(store_id)
);


-- 구매상세시퀀스
create sequence purchase_detail_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;



* 장바구니 테이블


 create table shoppingcart
 (shoppingcart_seq     number               not null   --  장바구니 번호             
 ,userid  varchar2(20)         not null   --  사용자ID            
 ,product_id    varchar2(4)            not null   --  제품번호                  
 ,status     number(1) default 1             --  삭제유무
 ,custom    varchar2(100)                   -- 장바구니
 ,constraint PK_cart_seq primary key(shoppingcart_seq)
 ,constraint FK_cart_userid foreign key(userid)
                                        references starbucks_Member(userid) 
 ,constraint FK_cart_product_id foreign key(product_id)
                                      references nutrition(product_id)
 ,constraint CK_status check( status in(0,1) ) 
 );
 

 create sequence shoppingcart_seq
 start with 1
 increment by 1
 nomaxvalue
 nominvalue
 nocycle
 nocache;



* 장바구니 테이블



-- 나의 메뉴
create table favorite_menu
(userid          varchar2(20)    not null        -- 아이디
,product_id      varchar2(30)                    -- 제품아이디
,my_menu_seq     number                          -- 나의메뉴시퀀스
,product_name    varchar2(50)                    -- 제품명
,register_day    date default sysdate            -- 등록일
,section         number
,constraint FK_favorite_menu_userid foreign key (userid)
                                      references starbucks_member(userid)
,constraint FK_favorite_menu_proId foreign key (product_id)
                                      references nutrition(product_id)
);

create sequence my_menu_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

create sequence favorite_menu
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;



* 푸드 테이블

CREATE TABLE food(
    id              VARCHAR2(20) NOT NULL
    ,category_id  VARCHAR2(20) NOT NULL
    ,food_seq       NUMBER NOT NULL
    ,name           VARCHAR2(100) NOT NULL
    ,name_eng       VARCHAR2(100) NOT NULL
    ,description    VARCHAR2(200) NOT NULL
    ,price          NUMBER(4) NOT NULL
    ,img            VARCHAR2(80) NOT NULL
    ,constraint PK_food primary key(id)
    ,constraint FK_food_id foreign key(id) references nutrition(product_id)
    ,constraint FK_food_category foreign key(category_id) references product_category(category_id)
);


create sequence food_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;
-- 푸드_베이커리


INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f001','f_bk',food_seq.nextval,'초코몬드 카라멜 크림치즈 베이글','Chocolate Almond Caramel Cream Cheese Bagel','폭신하고 쫄깃한 식감의 베이글에 초코 아몬드가 콕콕 박힌 카라멜 크림치즈가 듬뿍 샌드되어 달콤하게 즐길 수 있는 브레드입니다.',8000,'f001.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f002','f_bk',food_seq.nextval,'카라멜팅 스콘','Melting Caramel Scone','흘러내리는 듯한 카라멜 토핑과 아몬드의 식감이 부드러운 스콘에 더해진 달콤하고 고소한 스콘입니다.',8000,'f002.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f003','f_bk',food_seq.nextval,'Pick한 시나몬 롤','Pecan Cinnamon Roll','쌀을 넣어 쫄깃한 식감을 더한 브레드에 진한 시나몬, 크림치즈 버터크림, 고소한 피칸이 조화롭게 어루러져 달콤하게 즐길 수 있는 브레드입니다.',8000,'f003.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f004','f_bk',food_seq.nextval,'녹차 머핀','Green Tea Muffin','[제주지역 한정푸드] 녹차가루로 만든 머핀 안에 크림치즈와 통팥을 넣은 녹차 머핀입니다.',8000,'f004.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f005','f_bk',food_seq.nextval,'다크 초콜릿 칩 머핀','Dark Chocolate Chip Muffin','그랑크루 초콜릿을 함유한 더욱 진한 초콜릿의 풍미를 느낄 수 있는 머핀입니다.',8000,'f005.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f006','f_bk',food_seq.nextval,'상큼한 블루베리 머핀','Blueberry Muffin','상큼한 블루베리로 만든 부드럽고 촉촉한 머핀입니다.',8000,'f006.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f007','f_bk',food_seq.nextval,'제주 감귤 머핀','Jeju Tangerine Muffin','[제주지역 한정푸드] 한라봉 주스를 넣은 머핀에 초코칩을 넣어 달콤하면서도 상큼한 머핀입니다.',8000,'f007.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f008','f_bk',food_seq.nextval,'고소한 치즈 베이글','Cheese Bagel','양파 베이글 위에 고다 치즈, 파마산 치즈, 블렌디드 치즈를 얹은 베이글입니다.',8000,'f008.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f009','f_bk',food_seq.nextval,'블루베리 베이글','Blueberry Bagel','블루베리의 상큼한 풍미가 매력적인 베이글로 크림치즈와 함께 더욱 맛있게 즐기실 수 있습니다.',8000,'f009.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f010','f_bk',food_seq.nextval,'미니 클래식 스콘','Mini Classic Scone','미니 사이즈의 담백한 스콘입니다.',8000,'f010.jpg');

-- 푸드 케이크
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f031','f_ca',food_seq.nextval,'블루베리 쿠키 치즈 케이크','Blueberry Cookie Cheese Cake','고소한 쿠키와 크림치즈를 듬뿍 넣어 만든 케이크위에 달콤, 상큼한 블루베리가 올라간 진한 치즈 풍미의 케이크입니다.',8000,'f031.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f032','f_ca',food_seq.nextval,'슈크림 가득 바움쿠헨','Choux Cream Baumkuchen','바닐라 빈이 들어간 부드러운 슈크림과 바움쿠헨이 조화로운 바닐라 풍미의 케이크입니다.',8000,'f032.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f033','f_ca',food_seq.nextval,'진한 녹차 생크림 케이크','Rich Green Tea Cake','입 안 가득 풍부하고 진하게 퍼지는 녹차 맛이 특징인 케이크로 동물성 크림을 더해 더욱 부드럽게 즐길 수 있습니다.',8000,'f033.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f034','f_ca',food_seq.nextval,'진한 얼 그레이 생크림 케이크','Rich Earl Grey Cream Cake','직접 우려낸 얼 그레이를 부드러운 크림에 넣어 입 안 가득 퍼지는 얼 그레이의 진하고 풍부한 맛과 향이 특징인 케이크입니다.',8000,'f034.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f035','f_ca',food_seq.nextval,'진한 초콜릿 크레이프 케이크','Chocolate Crepe Cake','한 장 한 장 정성스럽게 구운 크레이프 사이에 초코 크림과 진한 가나슈를 넣어 만든 케이크입니다.',8000,'f035.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f036','f_ca',food_seq.nextval,'클라우드 초콜릿 케이크','Cloud Chocolate Cake','부드러운 초콜릿 시트에 크림치즈 무스를 올린 달콤한 초콜릿 케이크입니다.',8000,'f036.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f037','f_ca',food_seq.nextval,'클라우드 치즈 케이크','Cloud Cheese Cake','사워크림의 상큼함과 진한 치즈의 맛을 동시에 맛볼 수 있는 케이크입니다.',8000,'f037.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f038','f_ca',food_seq.nextval,'호두 당근 케이크','Walnut Carrot Cake','고소한 호두와 당근이 조화로운 홈메이드 타입 케이크입니다.',8000,'f038.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f039','f_ca',food_seq.nextval,'당근 현무암 케이크','Jeju Carrot Basalt Cake','[제주지역 한정푸드]현무암을 연상케 하는 오징어 먹물 케이크 시트 사이에 새콤한 당근 크림치즈 무스를 샌드한 컵 케이크',8000,'f039.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f040','f_ca',food_seq.nextval,'제주 리얼녹차 티라미수 아일랜드','Jeju Real Green Tea Tiramisu Island','[제주지역 한정푸드] 제주녹차를 사용한 시트와 마스카포네 크림으로 진한 녹차의 풍미를 느낄 수 있는 제주 전용 티라미수입니다.',8000,'f040.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f041','f_ca',food_seq.nextval,'촉촉 초콜릿 생크림 케이크','Chocolate Fresh Cream Cake','촉촉한 초콜릿 시트에 초콜릿 생크림을 층층이 샌드하여 부드럽고 달콤한 맛이 특징인 케이크입니다.',8000,'f041.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f042','f_ca',food_seq.nextval,'청담스타 얼 그레이 밀크 케이크','Cheongdam Star Earl Grey Milk Cake','꿀이 함유된 얼 그레이 시트 사이에 부드러운 얼 그레이 생크림을 샌드한 케이크',8000,'f042.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f043','f_ca',food_seq.nextval,'크레이프 에멘탈 치즈 케이크','Crepe Emmental Cheese Cake','부드러운 카스텔라와 에멘탈 치즈, 크림치즈로 만든 케이크',8000,'f043.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f044','f_ca',food_seq.nextval,'피칸 브라우니','Pecan Brownie','초콜릿 청크를 넣고 고소한 피칸을 듬뿍 올린 진한 브라우니로 품격 있는 선물을 준비하세요.',8000,'f044.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f045','f_ca',food_seq.nextval,'헤븐리 티라미수','Heavenly Tiramisu','촉촉한 커피 시럽의 레이디핑거 쿠키와 100% 마스카포네 크림치즈로 만든 떠 먹는 타입의 티라미수입니다.)',8000,'f045.jpg');

-- 푸드_샌드위치&샐러드
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f046','f_ss',food_seq.nextval,'치킨텐더 콥 샐러드 밀박스','Chicken Tender Cobb Salad Meal Box','치킨텐더, 치즈, 메추리알, 올리브 토핑과 방울토마토, 케일 등의 채소를 요거트 드레싱과 함께 즐기는 샐러드',8000,'f046.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f047','f_ss',food_seq.nextval,'그릴드 쉬림프 치아바타','Grilled Shrimp Ciabatta','그릴드 채소, 그린빈, 그리고 새우가 스위트 칠리 소스와 잘 어우러져서 매콤 달콤한 맛을 즐길 수 있는 치아바타',8000,'f047.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f048','f_ss',food_seq.nextval,'카프레제 샐러드 랩','Caprese Salad Wrap','카프레제 샐러드를 바질 페스토와 함께 그대로 또띠아에 말아 더욱 간편하고 건강하게 즐길 수 있도록 만든 랩 샌드위치입니다.',8000,'f048.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f049','f_ss',food_seq.nextval,'로스트 치킨 샐러드 밀 박스','Roast Chicken Salad Meal Box','퀴노아 위에 로스트 치킨을 올리고 프렌치 드레싱을 곁들인 가벼운 샐러드입니다.',8000,'f049.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f050','f_ss',food_seq.nextval,'B.E.L.T. 샌드위치','B.E.L.T. Sandwich','주 재료인 베이컨, 계란, 로메인 상추, 토마토의 각각의 머리 글자를 따온 이름의 샌드위치',8000,'f050.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f051','f_ss',food_seq.nextval,'DT밀당 샌드위치_바질 모짜렐라','DT Sandwich_Basil Mozzarella','모짜렐라 치즈와 토마토, 루꼴라를 향긋한 향의 바질 페스토를 버무린 담백한 포카치아 샌드위치',8000,'f051.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f052','f_ss',food_seq.nextval,'DT밀당 샌드위치_베이컨 크림치즈','DT Sandwich_Bacon Cream Cheese','다양한 재료를 섞어 넣은 짭짤한 크림치즈를 샌드한 먹물 포카치아 샌드위치',8000,'f052.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f053','f_ss',food_seq.nextval,'과카몰리 크루아상 밀 박스','Guacamole Croissant Meal Box','과카몰리, 달걀프라이, 베이컨이 들어간 크루아상 샌드위치와 그릴드 베지터블로 만든 샐러드 밀 박스',8000,'f053.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f054','f_ss',food_seq.nextval,'단호박 에그 샌드위치','Sweet Pumpkin Egg Sandwich','건강 잡곡 식빵 속에 단호박, 달걀, 토마토, 치즈 등을 넣은 콜드 샌드위치입니다.',8000,'f054.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f055','f_ss',food_seq.nextval,'바비큐 치킨 치즈 치아바타','Barbecue Chicken Cheese Ciabatta','바삭한 치아바타에 새콤달콤한 바비큐 소스 치킨, 베이컨, 치즈가 어우러진 샌드위치입니다.',8000,'f055.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f056','f_ss',food_seq.nextval,'부드러운 크림치즈 샌드위치','Cream Cheese Sandwich','검은 깨가 콕콕 들어있는 건강한 식빵 안에 토마토와 햄, 그리고 부드럽고 산뜻한 크림치즈가 들어있는 샌드위치입니다.',8000,'f056.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f057','f_ss',food_seq.nextval,'어니언 베이컨 체다치즈 파니니','Onion Bacon Cheddar Cheese Panini','베이컨, 체다 치즈, 볶은 양파와 매콤한 치폴레 마요 소스로 만든 치아바타 파니니입니다.',8000,'f057.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f058','f_ss',food_seq.nextval,'에그 베이컨 치즈 백년초 베이글','Egg Bacon Cheese Cactus Bagel','[제주지역 한정푸드] 제주도 특산물인 백년초 베이글에 에그패티와 베이컨, 치즈를 넣은 샌드위치입니다.',8000,'f058.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f059','f_ss',food_seq.nextval,'제주 흑돼지 아보카도 샌드위치','Jeju Black Pork Avocado Sandwich','[제주지역 한정푸드] 제주도 흑돼지 베이컨, 양상추, 아보카도, 토마토가 들어가고 먹물 바게트 샌드위치',8000,'f059.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f060','f_ss',food_seq.nextval,'파인 땡큐 샌드위치','Fine Thank-You Sandwich','여름 대표 열대 과일인 달콤한 파인애플을 매콤한 할라페뇨와 함께 버무리고 토마토 바비큐 소스로 맛을 낸 여름 시즌 한정 샌드위치',8000,'f060.jpg');

-- 푸드_따뜻한음식
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f061','f_wf',food_seq.nextval,'트러플 머쉬룸 수프','Truffle Mushroom Soup','송로 버섯의 향과 양송이 버섯의 진한 풍미가 조화로운 식사 대용 수프입니다. ※ 수프 구매 시 크래커가 함께 제공됩니다.',8000,'f061.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f062','f_wf',food_seq.nextval,'현미 크림 수프','Brown Rice Cream Soup','고소한 현미와 풍부한 우유 크림으로 만든 건강한 컨셉의 수프입니다.',8000,'f062.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f063','f_wf',food_seq.nextval,'우리나라 옥고감','Steamed Corn, Sweet Potato, Potato','우리 땅에서 자란 세 가지 농산물을 오븐에 구워 간편하게 한 끼를 즐길 수 있는 상품입니다.',8000,'f063.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f064','f_wf',food_seq.nextval,'한 입에 쏙 호두','Walnut Mini Bites','고소한 호두와 헤이즐넛, 그리고 달콤한 대추가 들어있는 한 입 크기의 미니 팬 케이크입니다.',8000,'f064.jpg');

-- 푸드_과일&요거트
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f065','f_fy',food_seq.nextval,'사과 가득 핸디 젤리','Apple Handy Jelly','경북 특산물인 사과를 가득 담은 달콤한 맛의 스타벅스 핸디 젤리',8000,'f065.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f066','f_fy',food_seq.nextval,'제주 자연 청 세트','Jeju Marmalade Set','[제주지역 한정푸드] 제주도 청정 자연의 맛과 멋을 담은 건강한 청 선물 세트 입니다.',8000,'f066.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f067','f_fy',food_seq.nextval,'하루 한 컵 GREEN','A Fresh Cup A Day, GREEN','키위와 청포도를 한 컵에 담아 언제 어디서나 편하게 즐길 수 있습니다.',8000,'f067.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f068','f_fy',food_seq.nextval,'한 입에 쏙 열대 과일칩(망고 파인애플)','Frozen Dried Fruit(Mango Pineapple)','대표 열대 과일인 파인애플과 망고를 그대로 동결 건조한 과일 스낵으로 바삭한 식감과 함께 과일 본연의 맛을 즐길 수 있습니다.',8000,'f068.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f069','f_fy',food_seq.nextval,'New 초콜릿 푸딩','New Chocolate Pudding','벨기에 초콜릿과 무항생제 달걀, 신선한 우유로 만든 진한 초콜릿 푸딩입니다. 냉장보관이 필요한 상품입니다.',8000,'f069.jpg');
INSERT INTO food(id,category_id,food_seq,name,name_eng,description,price,img)
VALUES ('f070','f_fy',food_seq.nextval,'오가닉 그릭 요거트 플레인 JAR','Organic Greek Yogurt Plain JAR','사이렌 로고가 그려진 도자기 안에 진한 크림 치즈처럼 깊고 풍부한 맛의 유기농 그릭 요거트가 담겨 있습니다.',8000,'f070.jpg');
  
  
  commit;
  


* 음료 테이블


 CREATE TABLE drink(
   id            VARCHAR2(10) NOT NULL
  ,category_id   VARCHAR2(10) NOT NULL
  ,drink_seq     NUMBER(10) NOT NULL
  ,name          VARCHAR(50) NOT NULL
  ,name_eng      VARCHAR2(50) NOT NULL
  ,description   VARCHAR2(200) NOT NULL
  ,price         NUMBER(4) NOT NULL
  ,img           VARCHAR2(20) NOT NULL
  ,shot         NUMBER(1) NOT NULL
  ,syrup         VARCHAR2(30) NOT NULL
  ,whipped_cream VARCHAR2(10) NOT NULL
  ,temperature   VARCHAR2(10) NOT NULL
  ,caffein       NUMBER(3)  NOT NULL
  ,base          VARCHAR2(30) NOT NULL
  ,constraint  PK_drink_id primary key(id)
  ,constraint  FK_drink_id foreign key(id) references nutrition(product_id)
  ,constraint  FK_drink_category_code foreign key(category_id) references product_category(category_id)
);

create sequence drink_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

select * from product_category;

-- cold brew
INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d001','d_cb',drink_seq.nextval,'나이트로 바닐라크림','Nitro Vanilla Cream','부드러운 목넘김의 나이트로 커피와 바닐라 크림의 매력을 한번에 느껴보세요!',5900,'d001.jpg',0,'없음','none','non-iced',245, '물');

INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d002','d_cb', drink_seq.nextval,'나이트로 쇼콜라 클라우드','Nitro Chocolat Cloud','초콜릿과 견과류의 풍미, 초콜릿 파우더 토핑의 부드럽고 달콤한 나이트로 콜드 브루',6100,'d002.jpg',0,'초콜릿시럽','none','non-iced',245, '없음');

INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d003','d_cb',drink_seq.nextval,'나이트로 콜드 브루','Nitro Cold Brew','나이트로 커피 정통의 캐스케이딩과 부드러운 콜드 크레마!',5800,'d003.jpg',0,'없음','none','non-iced',245,'없음');

INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d004','d_cb',drink_seq.nextval,'돌체 콜드 브루','Dolce Cold Brew','동남아 휴가지에서 즐기는 커피를 떠오르게 하는 돌체 콜드 브루',5800,'d004.jpg',0,'돌체시럽','none','iced',150,'우유');

INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d005','d_cb',drink_seq.nextval,'바닐라 크림 콜드 브루','Vanilla Cream Cold Brew','콜드 브루에 더해진 바닐라 크림으로 깔끔하면서 달콤한 콜드 브루를 새롭게 즐길 수 있는 음료입니다.',5500,'d005.jpg',0,'바닐라시럽','none','iced',150,'바닐라크림베이스');

INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d006','d_cb',drink_seq.nextval,'콜드 브루','Cold Brew','스타벅스 바리스타의 정성으로 탄생한 콜드 브루!',4500,'d006.jpg',0,'없음','none','iced',150, '물');

 
 -- brewed coffee
 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d007','d_br',drink_seq.nextval,'아이스 커피','Iced Coffee','깔끔하고 상큼함이 특징인 시원한 아이스 커피',4100,'d007.jpg',0,'없음','none','iced',140, '물');
 
 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d008','d_br',drink_seq.nextval,'오늘의 커피','Brewed Coffee','신선하게 브루드(Brewed)되어 원두의 다양함이 살아있는 커피',3800,'d008.jpg',0,'없음','none','non-iced',260, '물');

-- espresso

 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d009','d_es',drink_seq.nextval,'아이스 카페 아메리카노','Iced Caffe Americano','강렬한 에스프레소 샷에 시원한 물의 조화',4100,'d009.jpg',2,'없음','none','iced',150,'물');

 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d010','d_es',drink_seq.nextval,'카페 아메리카노','Caffe Americano','강렬한 에스프레소 샷에 뜨거운 물의 조화',4100,'d010.jpg',2,'없음','none','non-iced',150,'물');

 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d011','d_es',drink_seq.nextval,'아이스 카라멜 마키아또','Iced Caramel Macchiato','바닐라 시럽, 시원한 우유에 얼음과 에스프레소 샷, 카라멜 드리즐이 어우러진 음료',5600,'d011.jpg',1,'카라멜시럽','none','iced',75,'우유');

 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d012','d_es',drink_seq.nextval,'카라멜 마키아또','Caramel Macchiato','바닐라 시럽과 우유, 그리고 그 위에 얹어진 에스프레소 샷과 달콤한 카라멜 드리즐의 조화',5600,'d012.jpg',1,'카라멜시럽','none','non-iced',75,'우유');

 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d013','d_es',drink_seq.nextval,'아이스 카푸치노','Iced Cappuccino','에스프레소 샷과 시원한 우유에 부드러운 우유 거품이 얹어진 시원한 음료.',4600,'d013.jpg',1,'없음','none','iced',75,'우유');
 
 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d014','d_es',drink_seq.nextval,'카푸치노','Cappuccino','에스프레소 샷과 시원한 우유에 부드러운 우유 거품이 얹어진 음료.',4600,'d014.jpg',1,'없음','none','non-iced',75,'우유');
 
 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d015','d_es',drink_seq.nextval,'아이스 카페 라떼','Iced Caffe Latte','에스프레소 샷과 시원한 우유와 얼음으로 고소한 음료.',4600,'d015.jpg',1,'없음','none','iced',75,'우유');
 
 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d016','d_es',drink_seq.nextval,'카페 라떼','Caffe Latte','에스프레소 샷과 따뜻한 우유로 고소한 음료',4600,'d016.jpg',1,'없음','none','non-iced',75,'우유');

 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d017','d_es',drink_seq.nextval,'아이스 카페 모카','Iced Caffe Mocha','모카시럽과 시원한 우유에 휘핑크림이 토핑된 에스프레소 음료.',4600,'d017.jpg',1,'모카시럽','regular','iced',95,'우유');
 
 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d018','d_es',drink_seq.nextval,'카페 모카','Caffe Mocha','모카시럽과 따뜻한 우유에 휘핑크림이 토핑된 에스프레소 음료.',4600,'d018.jpg',1,'모카시럽','regular','non-iced',95,'우유');

 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d019','d_es',drink_seq.nextval,'아이스 화이트 초콜릿 모카','Iced White Chocolate Mocha','화이트 초콜릿과 시원한 우유가 첨가된 에스프레소 음료.',4600,'d019.jpg',1,'화이트모카시럽','regular','iced',75,'우유');
 
 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d020','d_es',drink_seq.nextval,'화이트 초콜릿 모카','White Chocolate Mocha','화이트 초콜릿과 스팀밀크가 첨가된 에스프레소 음료.',4600,'d020.jpg',1,'화이트모카시럽','regular','non-iced',75,'우유');      
  
 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d021','d_es',drink_seq.nextval,'에스프레소','Espresso','스타벅스의 핵심인 강렬하고 카라멜향이 달콤한 음료',3600,'d021.jpg',1,'없음','none','non-iced',75,'없음');
 
 
 -- 프라푸치노
 
 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d022','d_fp',drink_seq.nextval,'더블 에스프레소 칩 프라푸치노','Double Espresso Chip Frappuccino','에스프레소 2샷과 에스프레소 칩이 어우러진 커피의 기본에 충실한 더블 에스프레소 칩 프라푸치노',6100,'d022.jpg',2,'프라푸치노시럽','regular','iced',130,'우유');      
  
 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d023','d_fp',drink_seq.nextval,'모카 프라푸치노','Mocha Frappuccino','초콜릿, 커피와 얼음이 갈린 음료에 휘핑크림이 토핑된 음료.',5600,'d023.jpg',2,'프라푸치노시럽','regular','iced',90,'우유');      

 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d024','d_fp',drink_seq.nextval,'에스프레소 프라푸치노','Espresso Frappuccino','에스프레소의 강렬함과 약간의 단맛을 시원하게 즐기는 프라푸치노.',5100,'d024.jpg',2,'프라푸치노시럽','regular','iced',120,'우유');      

 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d025','d_fp',drink_seq.nextval,'자바 칩 프라푸치노','Java Chip Frappuccino','커피 프라푸치노에 초콜릿, 초콜릿 칩이 첨가된 아이스 블렌드로 달콤 아삭한 음료.',6100,'d025.jpg',2,'프라푸치노시럽','regular','iced',100,'우유');      

 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d026','d_fp',drink_seq.nextval,'카라멜 프라푸치노','Caramel Frappuccino','카라멜 시럽이 더해진 커피 프라푸치노에 휘핑 크림, 카라멜이 장식된 음료.',5600,'d026.jpg',2,'프라푸치노시럽','regular','iced',85,'우유');      


 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d027','d_fp',drink_seq.nextval,'바닐라 크림 프라푸치노','Vanilla Cream Frappuccino','우유에 바닐라향이 조합된 아이스 블렌드로 휘핑크림이 토핑된 음료.',4800,'d027.jpg',0,'프라푸치노시럽','regular','iced',0,'우유');      

 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d028','d_fp',drink_seq.nextval,'초콜릿 크림 칩 프라푸치노','Chocolate Cream Chip Frappuccino','모카시럽과 자바칩이 혼합된 크림 프라푸치노로 휘핑크림, 초콜렛 드리즐된 음료.',5700,'d028.jpg',0,'프라푸치노시럽','regular','iced',0,'우유');      

 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d029','d_fp',drink_seq.nextval,'피스타치오 크림 프라푸치노','Pistachio Cream Frappuccino','젤라또를 먹는 듯한 크리미함과 고소함이 극에 달한 피스타치오 크림 프라푸치노를 만나보세요.',6300,'d029.jpg',0,'프라푸치노시럽','regular','iced',0,'우유');      
  
  
  -- 블렌디드
  
   INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d030','d_bl',drink_seq.nextval,'애플망고 요거트 블렌디드','Apple Mango Yogurt Blended','말랑한 애플망고 과육과 부드러운 요거트가 산뜻하게 어우러진 애플망고 요거트 블렌디드',6300,'d030.jpg',0,'블렌디드시럽','none','iced',0,'우유');      

 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d031','d_bl',drink_seq.nextval,'피치레몬 블렌디드','Peach Lemon Blended','달콤한 복숭아와 새콤한 레몬, 말랑한 복숭아 젤리가 만난 피치 레몬 블렌디드',6100,'d031.jpg',0,'클래식시럽','none','iced',0,'레모네이드');      

 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d032','d_bl',drink_seq.nextval,'망고 패션 후르츠 블렌디드','Mango Passion Fruit Blended','진한 블랙 티에 망고 패션 후르츠 주스가 조합된 아이스 블렌드 음료',5000,'d032.jpg',0,'블렌디드시럽','none','iced',35,'블랙티');      
  
 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d033','d_bl',drink_seq.nextval,'딸기 요거트 블렌디드','Strawberry Yogurt Blended','딸기와 요거트의 상큼함이 가득 느껴지는 가벼운 컨셉의 블렌디드 음료',6100,'d033.jpg',0,'블렌디드시럽','none','iced',0,'우유');      

-- 티 

 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d034','d_te',drink_seq.nextval,'스타벅스 라임 모히토 티','Starbucks Lime Mojito Tea','라임과 사과 과즙이 팡팡 터지는 맑고 청량한 스타벅스 라임 모히토 티',6100,'d034.jpg',0,'없음','none','iced',11,'그린애플베이스');      
  
 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d035','d_te',drink_seq.nextval,'아이스 얼그레이티','Iced Earl Grey Tea','시원하게 즐기는 뜨거운 물에 우려내 라벤더 향의 블랙 티',4100,'d035.jpg',0,'없음','none','iced',50,'물');      

 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d036','d_te',drink_seq.nextval,'얼 그레이 티','Earl Grey Brewed Tea','뜨거운 물에 우려내 라벤더 향이 특징적인 향긋한 블랙 티',4100,'d036.jpg',0,'없음','none','non-iced',50,'물');      
  
 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d037','d_te',drink_seq.nextval,'아이스 차이 티','Iced Chai Brewed Tea','진저, 카르다몸, 이국적인 풍미의 시나몬 등이 블렌딩된 블랙 티.',4100,'d037.jpg',0,'없음','none','iced',45,'물');      

 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d038','d_te',drink_seq.nextval,'차이 티','Chai Brewed Tea','진저, 카르다몸, 이국적인 풍미의 시나몬 등이 블렌딩된 블랙 티.',4100,'d038.jpg',0,'없음','none','non-iced',45,'물');      

 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d039','d_te',drink_seq.nextval,'아이스 제주 유기 녹차','Iced Jeju Organic Green Tea','제주도 산 유기 녹차로만 이루어져 맑은 수색과 신선한 향, 맛이 뛰어난 녹차.',4100,'d039.jpg',0,'없음','none','iced',16,'물');      

 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d040','d_te',drink_seq.nextval,'제주 유기 녹차','Jeju Organic Green Tea','제주도 산 유기 녹차로만 이루어져 맑은 수색과 신선한 향, 맛이 뛰어난 녹차.',4100,'d040.jpg',0,'없음','none','non-iced',16,'물');      


 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d041','d_te',drink_seq.nextval,'아이스 제주 유기 말차 라떼','Iced Jeju Malcha Latte','깊고 진한 말차 본연의 맛과 향을 시원하고 부드럽게 즐길 수 있는 제주 유기농 말차 라떼',6100,'d041.jpg',0,'클래식시럽','none','iced',60,'우유');      

 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d042','d_te',drink_seq.nextval,'제주 유기 말차 라떼','Jeju Malcha Latte','깊고 진한 말차 본연의 맛과 향을 시원하고 부드럽게 즐길 수 있는 제주 유기농 말차 라떼',6100,'d042.jpg',0,'클래식시럽','none','non-iced',60,'우유');      

 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d043','d_te',drink_seq.nextval,'아이스 차이 티 라떼','Iced Chai Tea Latte','부드러운 우유에 이국적인 스파이시한 풍미가 특징적인 티 라떼',5100,'d043.jpg',0,'차이시럽','none','iced',75,'우유');      

 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d044','d_te',drink_seq.nextval,'차이 티 라떼','Chai Tea Latte','부드러운 우유에 이국적인 스파이시한 풍미가 특징적인 티 라떼',5100,'d044.jpg',0,'차이시럽','none','non-iced',75,'우유');      

— 기타 제조 음료

 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d045','d_nc',drink_seq.nextval,'시그니처 핫 초콜릿','Signature Hot Chocolate','유럽 스타일의 진한 핫 초콜릿으로 휘핑크림과 코코아 파우더가 토핑된 음료',5300,'d045.jpg',0,'없음','regular','non-iced',15,'우유');      

 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d046','d_nc',drink_seq.nextval,'아이스 시그니처 초콜릿','Iced Signature Chocolate','진한 초콜릿과 시원한 우유에 휘핑과 코코아 파우더가 얹어진 음료.',5300,'d046.jpg',0,'없음','regular','iced',15,'우유');      
  
  
   INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d047','d_nc',drink_seq.nextval,'스팀 우유','Steamed Milk','부드럽고 담백한 따뜻한 우유.',4100,'d047.jpg',0,'없음','none','non-iced',0,'우유');      

 INSERT INTO drink
(id, category_id, drink_seq,name,name_eng,description,price,img,shot,syrup,whipped_cream,temperature,caffein,base) 
VALUES ('d048','d_nc',drink_seq.nextval,'우유','Milk','고소하고 담백한 신선한 우유.',4100,'d048.jpg',0,'없음','none','iced',0,'우유');      
  
  
  commit;







select  lag(notice_seq) over(order by notice_seq desc) AS POSTNUM    -- 앞에 행의 글번호를 보여주자
      , nvl( (lag(title) over(order by notice_seq desc)),'글이 없습니다.' )AS POSTTITLE      -- 앞에 행의 글제목을 보여주자
      , notice_seq  -- 현재 글번호
      , title       -- 현재 글제목
      , contents    -- 현재 글내용
      , lead(notice_seq) over(order by notice_seq desc) AS PRENUM   -- 뒤에 행의 글번호를 보여주자
      , nvl( (lead(title) over(order by notice_seq desc)),'글이 없습니다.' )AS PRETITLE        -- 뒤의 행에 글제목 보여주자
from notice_post
where notice_seq = 5; 


select  (notice_seq+1) AS POSTNUM    -- 앞에 행의 글번호를 보여주자
      , nvl( (lag(title) over(order by notice_seq desc)),'글이 없습니다.' )AS POSTTITLE      -- 앞에 행의 글제목을 보여주자
      , notice_seq  -- 현재 글번호
      , title       -- 현재 글제목
      , contents    -- 현재 글내용
      , (notice_seq-1) AS PRENUM   -- 뒤에 행의 글번호를 보여주자
      , nvl( (lead(title) over(order by notice_seq desc)),'글이 없습니다.' )AS PRETITLE        -- 뒤의 행에 글제목 보여주자
from notice_post
where notice_seq = 6 or notice_seq = 5 or notice_seq = 7   ; 

select *
from notice_post

String sql = "select  lag(notice_seq) over(order by notice_seq desc) AS POSTNUM    \n"+
"      , nvl( (lag(title) over(order by notice_seq desc)),'글이 없습니다.' )AS POSTTITLE      \n"+
"      , notice_seq  \n"+
"      , title      \n"+
"      , contents    \n"+
"      , lead(notice_seq) over(order by notice_seq desc) AS PRENUM   \n"+
"      , nvl( (lead(title) over(order by notice_seq desc)),'글이 없습니다.' )AS PRETITLE        \n"+
"from notice_post ";



select *
from notice_post;

create or replace procedure pcd_feedback_post_insert
(
p_title      IN  varchar2
,p_contents  IN  varchar2)
is
begin
    for i in 1..100 loop 
        insert into feedback_post(feedback_board_seq, category, hp1, hp2, hp3, store_id, visit_day, title, contents, file_attached, file_attached2, userid, hit, username, write_day, status)
            values(feedback_board_seq.nextval, '문의', '010', '1234', '5647',  '1', sysdate, p_title||i, p_contents||i, 'starback.jpg', 'starback.jpg', 'gpwjd1789', 1, '주혜정', sysdate, '접수중');
        end loop;
end pcd_feedback_post_insert;   
--Procedure PCD_FEEDBACK_POST_INSERT이(가) 컴파일되었습니다.

execute pcd_feedback_post_insert('문의드립니다','고객의소리 게시판 테스트 내용입니다.');
    
commit; 

select * 
from store_location

-- 매출액 찾아오기
select sum(price) 
from purchase_detail
order by 1;
where store_id = 11;

select *
from purchase_detail

    -- 두개의 표에서 보고싶은 부분만 보여주기
    select A.boardno AS 글번호
            , A.subject AS 글제목
            , B.nickname AS 닉네임
            , to_char(A.registerday, 'yyyy-mm-dd hh24:mi:ss')    AS 작성일자
            , A.readcount AS 조회수
    from tbl_board A inner join tbl_member B 
    on A.fk_userid = B.userid;
    
    -- join 해보기
    
    select A.store_id, A.store_sequence, A.store_name, A.address, A.url, A.latitude, A.longitude, A.zindex, sum(B.price)
    from
    (
    select A.store_id, A.store_sequence, A.store_name, A.address, A.url, A.latitude, A.longitude, A.zindex, B.price
    from store_location A inner join purchase_detail B
    on A.store_id = B.store_id
    )V
    
    order by zindex asc

select RNO, store_id, store_sequence, store_name, address, url, latitude, longitude, zindex
from    
(
    select rownum AS RNO, store_id, store_sequence, store_name, address, url, latitude, longitude, zindex
    from 
    (
    select store_id, store_sequence, store_name, address, url, latitude, longitude, zindex
    from store_location
    order by zindex asc
    ) V
) T
where T.RNO between 11 and 20; 


select sum(price) 
select *
from purchase_detail

update starbucks_member set point = '5000'
where userid='nari'
commit;

insert into custom_price (name, price) values('size', 500);

commit;


-------------------------------------------------------- final proj
    drop table eclass_member purge;

    -- 회원정보 테이블
   create table eclass_member
    ( userid                    varchar2(50)   not null     -- 아이디
    , name                      varchar2(30)   not null     -- 성명
    , pwd                       varchar2(200)   not null    -- 비밀번호 (SHA-256 암호화 대상)
    , identity                  number(1) default 1         -- 회원 구분 (학생 1, 교수 2, 관리자 3)
    , university                varchar2(100)   not null    -- 대학명
    , major                     varchar2(100)   not null    -- 학과명
    , student_num               varchar2(100)               -- 학번 (학생만 not null)
    , email                     varchar2(300)   not null    -- 이메일 (AES-256 암호화/복호화 대상)
    , mobile                    varchar2(200)     not null    -- 핸드폰
    , postcode                  varchar2(5)                 -- 우편번호
    , address                   varchar2(200)               -- 주소
    , detailaddress             varchar2(200)               -- 상세주소
    , extraaddress              varchar2(200)               -- 참고항목
    , point                     number default 0            -- 포인트 
    , registerday               date default sysdate        -- 가입일자
    , status                    number(1) default 1         -- 회원상태   1:사용가능(가입중) / 0:사용불능(탈퇴) 
    , last_login_date           date default sysdate        -- 마지막 로그인 날짜
    , pwd_change_date           varchar2(255)               -- 파일이름(WAS 저장용)
    , orgfilename               varchar2(255)               -- 파일이름 (진짜이름)
    , constraint PK_eclass_member_userid primary key (userid)
    , constraint CK_eclass_member_status check(status in(0,1))
    );

    select *
    from eclass_member;
    
    -- 로그인 테이블
    create table login_table
    ( fk_userid                 varchar2(50)   not null     -- 아이디
    , name                      varchar2(30)   not null     -- 성명 
    , constraint FK_login_table_fk_userid foreign key (fk_userid)
                                          references eclass_member (userid)
    );
    
    select *
    from login_table;










  
    
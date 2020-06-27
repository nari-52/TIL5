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
    
    create table notice_post
    ( notice_seq        number(4)   not null        -- 공지사항시퀀스
    , post_no           number(4)   not null        -- 글번호
    , title             varchar2(100)   not null    -- 글제목
    , contents          varchar2(4000)  not null    -- 글내용
    , write_day         date default sysdate        -- 작성일
    , hit               Number(4)                   -- 조회수
    , constraint PK_notice_post_notice_seq primary key(notice_seq)
    );
    
    -- 수정
     create table notice_post
    ( notice_seq        number(4)   not null        -- 공지사항시퀀스
    , title             varchar2(100)   not null    -- 글제목
    , contents          varchar2(4000)  not null    -- 글내용
    , write_day         date default sysdate        -- 작성일
    , hit               Number(4) defatul 0         -- 조회수
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
    from notice_post;
    
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
    select notice_seq, title, to_char(write_day,'yyyy-mm-dd') AS write_day , hit 
    from notice_post 
    order by 1 asc
   ) V;
   
 
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
    where title like '%' || '페이징' || '%'
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
    
    
    
    
    
    
    -- 매장위치
    create table store_location
    ( store_id          varchar2(30)   not null     -- 매장아이디
    , store_sequence    number(4)   not null        -- 매장시퀀스
    , store_name        varchar2(30)   not null     -- 매장명
    , address           varchar2(200)  not null     -- 주소
    , latitude          number  not null        -- 위도
    , longitude         number  not null        -- 경도
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
    
    insert into store_location (store_id, store_sequence, store_name, address, latitude, longitude)
    values (1, seq_store_location.nextval, '을지로삼화타워점', '서울특별시 중구 수하동 을지로5길 16', 37.566996, 126.984612);
    
    insert into store_location (store_id, store_sequence, store_name, address, latitude, longitude)
    values (2, seq_store_location.nextval, '종로관철점', '서울특별시 종로구 관철동 종로12길 21', 37.569023, 126.986006);
    
    insert into store_location (store_id, store_sequence, store_name, address, latitude, longitude)
    values (3, seq_store_location.nextval, '종각점', '서울특별시 종로구 종로2가 종로 64', 37.569993, 126.984534);
    
    
    insert into store_location (store_id, store_sequence, store_name, address, latitude, longitude)
    values (4, seq_store_location.nextval, '을지로한국빌딩점', '서울특별시 중구 명동 을지로 50', 37.565690, 126.983299);
    
    insert into store_location (store_id, store_sequence, store_name, address, latitude, longitude)
    values (5, seq_store_location.nextval, '소공동점', '서울특별시 중구 소공동', 37.564907, 126.979189);
    
    insert into store_location (store_id, store_sequence, store_name, address, latitude, longitude)
    values (6, seq_store_location.nextval, '남산단암점', '서울특별시 중구 회현동 소월로 10', 37.558648, 126.975294);
    
    
    commit;
    
    
    
    
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
    
    
    

    
    
    
    
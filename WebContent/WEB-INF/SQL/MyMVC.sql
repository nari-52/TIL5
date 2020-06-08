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
    
    
    
    
    
    
    
    
    

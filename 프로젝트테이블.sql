create table hotel(
    hotelno number(4) CONSTRAINT hotel_no_pk PRIMARY KEY,
    hotelname varchar(30) CONSTRAINT hotel_name_nn not null,
    hotelyear date,
    hotelloc varchar(50) CONSTRAINT hotel_loc_nn not null,
    hoteltel  varchar(20),
    hotelinfo varchar(150));
    
create table hoteluser(
    userid varchar2(10) CONSTRAINT user_id_pk primary key,
    username varchar2(20) CONSTRAINT user_name_nn not null,
    usergender varchar2(6),
    userbirth date,
    usertel varchar2(20));
    
create table room(
    roomcode number(4) CONSTRAINT room_code_pk primary key,
    bookingyn varchar2(3) CONSTRAINT room_bk_nn not null,
    bedtype varchar2(60),
    viewtype varchar2(60),
    maxpeople number(1) CONSTRAINT room_max_nn not null,
    smokingyn varchar2(3),
    roomprice varchar2(8) CONSTRAINT room_price_nn not null,
    roomno number(4),
    hotelno number(4) CONSTRAINT room_hotelno_fk references hotel(hotelno));

create table booking(
    bookingno number(4) CONSTRAINT booking_no_pk primary key,
    indate date CONSTRAINT booking_in_nn not null,
    outdate date CONSTRAINT booking_out_nn not null,
    pmethod varchar2(30),
    bkpeople number(1) CONSTRAINT booking_pp_nn not null,
    breakfast varchar2(3),
    roomcode number(4) CONSTRAINT booking_code_fk references room(roomcode),
    userid varchar2(10) CONSTRAINT booking_id_fk references hoteluser(userid));
    
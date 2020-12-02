select user from dual;

drop table member_tbl;
drop sequence member_sequence;
drop table money_tbl;
drop view vw_sale;

-- 1. ���̺� ����
create table member_tbl(
    custno     number(6) not null primary key,
    custname varchar2(20),
    phone     varchar2(13),
    address   varchar2(60),
    joindate  date,
    grade     char(1),
    city        char(2)
);

create sequence member_sequence
    start with 100001
    increment by 1
    minvalue 100001;

insert into member_tbl values(member_sequence.nextval, '���ູ', '010-1111-2222','���� ���빮�� �ְ�1��', '20151202', 'A', '60');
insert into member_tbl values(member_sequence.nextval, '���ູ', '010-1111-3333', '���� ���빮�� �ְ�2��', '20151206', 'B', '01');
insert into member_tbl values(member_sequence.nextval, '�����', '010-1111-4444', '�︪�� �︪�� ����1��', '20151001', 'B', '30');
insert into member_tbl values(member_sequence.nextval, '�ֻ��', '010-1111-5555', '�︪�� �︪�� ����2��', '20151113', 'A', '30');
insert into member_tbl values(member_sequence.nextval, '����ȭ', '010-1111-6666', '���ֵ� ���ֽ� �ܳ�����', '20151225', 'B', '60');
insert into member_tbl values(member_sequence.nextval, '������', '010-1111-7777', '���ֵ� ���ֽ� ��������', '20151211', 'C', '60');

create table money_tbl(
	custno number(6) not null,
	salenol number(8) not null,
	pcost number(8),
	amount number(4),
	price number(8),
	pcode varchar2(4),
	sdate date,
	primary key(custno, salenol)
);

insert into money_tbl values(100001, 20160001, 500, 5, 2500, 'A001', '20160101');
insert into money_tbl values(100001, 20160002, 1000, 4, 4000, 'A002', '20160101');

insert into money_tbl values(100001, 20160003, 500, 3, 1500, 'A008', '20160101');
insert into money_tbl values(100002, 20160004, 2000, 1, 2000, 'A004', '20160102');
insert into money_tbl values(100002, 20160005, 500, 1, 500, 'A001', '20160103');
insert into money_tbl values(100003, 20160006, 1500, 2, 3000, 'A003', '20160103');
insert into money_tbl values(100004, 20160007, 500, 2, 1000, 'A001', '20160104');
insert into money_tbl values(100004, 20160008, 300, 1, 300, 'A005', '20160104');
insert into money_tbl values(100004, 20160009, 600, 1, 600, 'A006', '20160104');
insert into money_tbl values(100004, 20160010, 3000, 1, 3000, 'A007', '20160106');

select * from money_tbl;
select * from MEMBER_TBL;

-- ȸ�� ��Ͻ� ȸ����ȣ �ڵ� �߻�
select max(custno) + 1 from MEMBER_TBL;

-- ��� ��ȸ
select custno, custname, phone, address, joindate, grade, city from MEMBER_TBL;

-- ȸ�� ���� ����
--update MEMBER_TBL
--   set custname=?, phone=?, address=?, joindate=?, grade=?, city=?
-- where custno = ?;
 
-- ȸ�� ���� ��ȸ
select * from MEMBER_TBL;
select * from money_tbl;

create view vw_sale as
select n.custno, custname, grade, total
  from MEMBER_TBL m join 
       (select custno, sum(price) as total 
		  from MONEY_TBL 
	   	 group by custno) n 
	   on m.custno = n.custno
  order by total desc;

select custno, custname, grade, total
  from vw_sale;



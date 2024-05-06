create database QLBongDa

use QLBongDa
go

create table QUOCGIA
(
	MAQG varchar(5),
	TENQG nvarchar(60) not null,
	constraint pk_quocgia primary key (MAQG),
)
go

create table TINH 
(
	MATINH varchar(5),
	TENTINH nvarchar(100) not null,
	constraint pk_tinh primary key (MATINH)
)
go

create table SANVD
(
	MASAN varchar(5),
	TENSAN nvarchar(100) not null,
	DIACHI nvarchar(100),
	constraint pk_sanvd primary key (MASAN)
)
go

create table HUANLUYENVIEN
(
	MAHLV varchar(5),
	TENHLV nvarchar(100) not null,
	NGAYSINH datetime,
	DIACHI nvarchar(100),
	DIENTHOAI nvarchar(20),
	MAQG varchar(5) not null,
	constraint pk_hlv primary key (MAHLV),
	constraint fk_hlv foreign key (MAQG) references QUOCGIA(MAQG)
)
go

create table CAULACBO
(
	MACLB varchar(5),
	TENCLB nvarchar(100),
	MASAN varchar(5),
	MATINH varchar(5),

	constraint pk_caulacbo primary key (MACLB),
	constraint fk_caulacbo_sanvd foreign key (MASAN) references SANVD(MASAN),
	constraint fk_caulacbo_tinh foreign key (MATINH) references TINH(MATINH)
)
go

create table HLV_CLB
(
	MAHLV varchar(5),
	MACLB varchar(5),
	VAITRO nvarchar(100)
	
        constraint pk_hlvclb primary key (MAHLV,MACLB),
	constraint fk_hlvclb_hlv foreign key (MAHLV) references HUANLUYENVIEN(MAHLV),
	constraint fk_hlvclb_clb foreign key (MACLB) references CAULACBO(MACLB)
)
go

create table CAUTHU
(
	MACT numeric identity,
	HOTEN nvarchar(100) not null,
	VITRI nvarchar(50) not null,
	NGAYSINH datetime,
	DIACHI nvarchar(200),
	MACLB varchar(5) not null,
	MAQG varchar(5) not null,
	SO int not null,
	constraint pk_cauthu primary key (MACT),
	constraint fk_cauthu_hlv foreign key (MACLB) references CAULACBO(MACLB),
	constraint fk_cauthu_quocgia foreign key (MAQG) references QUOCGIA(MAQG)
)
go

create table TRANDAU
(
	MATRAN numeric identity,
	NAM int not null,
	VONG int not null,
	NGAYTD datetime not null,
	MACLB1 varchar(5) not null,
	MACLB2 varchar(5) not null,
	MASAN varchar(5) not null,
	KETQUA varchar(5) not null,
	constraint pk_trandau primary key (MATRAN),
	constraint fk_clb1 foreign key (MACLB1) references CAULACBO(MACLB),
	constraint fk_clb2 foreign key (MACLB2) references CAULACBO(MACLB),
	constraint fk_clb3 foreign key (MASAN) references SANVD(MASAN)
)
go

create table THAMGIA 
(
	MATD numeric,
	MACT numeric,
	SOTRAI int,
	constraint pk_thamgia primary key (MATD,MACT),
	constraint fk_thamgia_tran foreign key (MATD) references TRANDAU(MATRAN),
	constraint fk_thamgia_cauthu foreign key (MACT) references CAUTHU(MACT)
)
go

create table BANGXH
(
	MACLB varchar(5),
	NAM int,
	VONG int,
	SOTRAN int not null,
	THANG int not null,
	HOA int not null,
	THUA int not null,
	HIEUSO varchar(5) not null,
	DIEM int not null,
	HANG int not null,
	constraint pk_bangxh primary key (MACLB,NAM,VONG),
	constraint fk_bangxh foreign key (MACLB) references CAULACBO(MACLB)
)
go


--------UPDATE CO SO DU LIEU
insert into QUOCGIA(MAQG,TENQG) VALUES
('ANH',N'Anh Quốc'),
('BDN',N'Bồ Đào Nha'),
('BRA',N'Bra-xin'),
('HQ',N'Hàn Quốc'),
('ITA',N'Ý'),
('TBN',N'Tây Ban Nha'),
('THA',N'Thái Lan'),
('THAI',N'Thái Lan'),
('VN',N'Việt Nam')


insert into TINH(MATINH,TENTINH) VALUES
('BD',N'Bình Dương'),
('GL',N'Gia Lai'),
('DN',N'Đà Nẵng'),
('KH',N'Khánh Hòa'),
('PY',N'Phú Yên'),
('LA',N'Long An')



insert into SANVD values
('GD',N'Gò Đậu', N'123 QL1, TX Thủ Dầu Một, Bình Dương'),
('PL',N'Pleiku',N'22 Hồ Tùng Mậu, Thống Nhất, Thị xã Pleiku, Gia Lai'),
('CL',N'Chi Lăng',N'127 Võ Văn Tần, Đà Nẵng'),
('LA',N'Long An',N'102 Hùng Vương, Tp Tân An, Long An'),
('NT',N'Nha Trang',N'128 Phan Chu Trinh, Nha Trang, Khánh Hòa'),
('TH',N'Tuy Hòa',N'57 Trường Chinh, Tuy Hòa, Phú Yên')


insert into HUANLUYENVIEN
values 
('HLV01',N'Vital','1955-10-15',null,'0918011075','BDN'),
('HLV02',N'Lê Huỳnh Đức','1972-5-20',null,'01223456789','VN'),
('HLV03',N'Kiatisuk','1970-12-11',null,'0199123456','THA'),
('HLV04',N'Hoàng Anh Tuấn','1970-6-10',null,'0989112233','VN'),
('HLV05',N'Trần Công Minh','1973-7-7',null,'0909099990','VN'),
('HLV06',N'Trần Văn Phúc','1965-3-2',null,'01650101234','VN')



insert into CAULACBO
values ('BBD',N'BECAMEX BÌNH DƯƠNG','GD','BD'),
('GDT',N'GẠCH ĐỒNG TÂM LONG AN','LA','LA'),
('HAGL',N'HOÀNG ANH GIA LAI','PL','GL'),
('KKH',N'KHATOCO KHÁNH HÒA','NT','KH'),
('SDN',N'SHB ĐÀ NẴNG','CL','DN'),
('TPY',N'THÉP PHÚ YÊN','TH','PY')


insert into HLV_CLB values
('HLV01','GDT',N'HLV Chính'),
('HLV02','SDN',N'HLV Chính'),
('HLV03','HAGL',N'HLV Chính'),
('HLV04','KKH',N'HLV Chính'),
('HLV05','TPY',N'HLV Chính')


insert into CAUTHU (HOTEN,VITRI,NGAYSINH,MACLB,MAQG,SO)
values (N'Nguyễn Vũ Phong',N'Tiền Vệ','2016-10-23','BBD','VN',17),
(N'Nguyễn Công Vinh',N'Tiền Đạo','2016-10-23','HAGL','VN',9),
(N'Nguyễn Hồng Sơn',N'Tiền Vệ','2016-10-23','SDN','VN',9),
(N'Lê Tấn Tài',N'Tiền Vệ','2016-10-23','KKH','VN',14),
(N'Phạm Hồng Sơn',N'Thủ Môn','2016-10-23','HAGL','VN',1),
(N'Ronaldo',N'Tiền Vệ','2016-10-23','SDN','BRA',7),
(N'Ronaldo',N'Tiền Vệ','2016-10-23','SDN','BRA',8),
(N'Vidic',N'Tiền Vệ','2016-10-23','HAGL','ANH',3),
(N'Trần Văn Santos',N'Thủ Môn','2016-10-23','BBD','BRA',1),
(N'Nguyễn Trường Sơn',N'Hậu Vệ','2016-10-23','BBD','VN',4),
(N'Lê Huỳnh Đức',N'Tiền Đạo','2016-10-23','BBD','VN',10),
(N'Huỳnh Hồng Sơn',N'Tiền Vệ','2016-10-23','BBD','VN',9),
(N'Lee Nguyễn',N'Tiền Đạo','2016-10-23','BBD','VN',14),
(N'Bùi Tấn Trường',N'Thủ Môn','2016-10-23','CSDT','VN',1),
(N'Phan Văn Tài Em',N'Tiền Vệ','2016-10-23','GDT','VN',10),
(N'Lý Tiểu Long',N'Tiền Vệ','2016-10-23','TPY','VN',7)


insert into TRANDAU (NAM,VONG,NGAYTD,MACLB1,MACLB2,MASAN,KETQUA) values
(2009,1,'2009-02-07','BBD','SDN','GD','3-0'),
(2009,1,'2009-02-07','KKH','GDT','NT','1-1'),
(2009,2,'2009-02-16','SDN','KKH','CL','2-2'),
(2009,2,'2009-02-16','TPY','BBD','TH','5-0'),
(2009,3,'2009-03-01','TPY','GDT','TH','0-2'),
(2009,3,'2009-03-01','KKH','BBD','NT','0-1'),
(2009,4,'2009-03-07','KKH','TPY','NT','1-0'),
(2009,4,'2009-03-07','BBD','GDT','GD','2-2')


insert into THAMGIA
values
('1','1','2'),
('1','11','1'),
('2','4','1'),
('2','16','1'),
('3','3','1'),
('3','4','2'),
('3','7','1'),
('4','15','5'),
('5','16','2'),
('6','13','1'),
('7','4','1'),
('8','12','2'),
('8','16','2')



insert into BANGXH
values 
('BBD','2009','1','1','1','0','0','3-0','3','1'),
('KKH','2009','1','1','0','1','0','1-1','1','2'),
('GDT','2009','1','1','0','1','0','1-1','1','3'),
('TPY','2009','1','0','0','0','0','0-0','0','3'),
('SDN','2009','1','1','0','0','1','0-3','0','5'),
('TPY','2009','2','1','1','0','0','5-0','3','1'),
('BBD','2009','2','2','1','0','1','3-5','3','2'),
('KKH','2009','2','2','0','2','0','3-3','2','3'),
('GDT','2009','2','1','0','1','0','1-1','1','4'),
('SDN','2009','2','2','1','1','0','2-5','1','5'),
('BBD','2009','3','3','2','0','1','4-5','6','1'),
('GDT','2009','3','2','1','1','0','3-1','4','2'),
('TPY','2009','3','2','1','0','1','5-2','3','3'),
('KKH','2009','3','3','0','2','1','3-4','2','4'),
('SDN','2009','3','2','1','1','0','2-5','1','5'),
('BBD','2009','4','4','2','1','1','6-7','7','1'),
('GDT','2009','4','3','1','2','0','5-1','5','2'),
('KKH','2009','4','4','1','2','1','4-4','5','3'),
('TPY','2009','4','3','1','0','2','5-3','3','4'),
('SDN','2009','4','2','1','1','0','2-5','1','5')

--tao user

create login BDAdmin with password = 'BDAdmin';
create user BDAdmin for login BDAdmin;

create login BDBK with password= 'BDBK';
create user BDUBK for login BDBK;
create login BDRead with password = 'BDRead';
create user BDRead for login BDRead;

create login BDU01 with password = 'BDU01';
create user BDU01 for login BDU01;

create login BDU02 with password = 'BDU02';
create user BDU02 for login BDU02;

create login BDU03 with password = 'BDU03';
create user BDU03 for login BDU03;

create login BDU04 with password = 'BDU04';
create user BDU04 for login BDU04;

create login BDProfile with password = 'BDProfile';
create user BDProfile for login BDProfile;

--phan quyen
grant control on database::QLBongDa to BDAdmin;

grant backup database to BDUBK;

grant select on database::QLBongDa to BDRead;

grant create table to BDU01;

grant update on database::QLBongDa to BDU02;

grant select, insert, update, delete on CAULACBO to BDU03;

create procedure SP_SEL_NO_ENCRYPT
(
	@TenCLB nvarchar(100),
	@TenQG nvarchar(60)
)
as
begin
select SO,HOTEN, NGAYSINH, DIACHI, VITRI from CAUTHU CT 
join
    CAULACBO CLB ON CT.MACLB = CLB.MACLB
join
    QUOCGIA QG ON CT.MAQG = QG.MAQG
where 
    CLB.TENCLB = @TenCLB
    AND QG.TENQG = @TenQG
end
exec SP_SEL_NO_ENCRYPT @TenCLB = N'SHB Đà Nẵng', @TenQG = N'Brazil';


create procedure SP_SEL_ENCRYPT
(
	@TenCLB nvarchar(100),
	@TenQG nvarchar(60)
)
as
begin
select SO,HOTEN, NGAYSINH, DIACHI, VITRI from CAUTHU CT 
join
    CAULACBO CLB ON CT.MACLB = CLB.MACLB
join
    QUOCGIA QG ON CT.MAQG = QG.MAQG
where 
    CLB.TENCLB = @TenCLB
    AND QG.TENQG = @TenQG
end
-- Thực thi stored procedure với mã hóa
exec SP_SEL_ENCRYPT @TenCLB = N'SHB Đà Nẵng', @TenQG = N'Brazil';
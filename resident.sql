create database Passport
go

use Passport
go


create table Resident_data
(
	so_cccd varchar(12) not null,
	hoten nvarchar(50) not null,
	ngaysinh date not null,
	gioitinh bit not null,
	quoctich nvarchar(30) not null,
	quequan nvarchar(100) not null,
	diachi nvarchar(100) not null,
	constraint pk_cccd primary key (so_cccd)
)

create table Form_Register
(
	shs numeric identity,
	trangthai bit,
	xacthuc bit,
	trave bit,
	hoten nvarchar(50) not null,
	diachi nvarchar(100) not null,
	gioitinh bit not null,
	ngaysinh date not null,
	so_cccd varchar(12) not null,
	sdt varchar(10) not null,
	email nvarchar(100),
	constraint fk_cccd foreign key (so_cccd) references Resident_data (so_cccd)
)

create table Nhanvien
(
	tendn varchar(20) not null,
	hoten nvarchar(50) not null,
	bophan varchar(20) not null,

)
create table Luutru
(
	shs int,
	hoten nvarchar(50) not null,
	diachi nvarchar(100) not null,
	gioitinh bit not null,
	ngaysinh date not null,
	so_cccd varchar(12) not null,
	sdt varchar(10) not null,
	email nvarchar(100),
	constraint fk_cccd_lt foreign key (so_cccd) references Resident_data (so_cccd)
)

insert into Nhanvien values
('phuvk', N'Võ Kiến Phú', 'xt'), 
('anhpvt', N'Phan Vũ Tuấn Anh', 'xd'),
('danglta', N'Lai Thị Ánh Đăng', 'lt'),
('linhnta', N'Nguyễn Trần Ánh Linh', 'gs')


insert into Resident_data values
('000000000001', N'Phạm Lê Đức Anh', '1988-02-20', 0, N'Việt Nam', N'Hải Dương', N'123A đường Lý Thường Kiệt, Phường 10, Quận 5, TPHCM'),
('000000000002', N'Phạm Minh Thư', '1983-03-16', 1, N'Việt Nam', N'Huế', N'219 Lê Lợi, phường 2, Quận 3, TPHCM'),
('000000000003', N'Nguyễn Quốc Anh', '1977-12-20', 0, N'Việt Nam', N'Lào Cai', N'298 - phường Kim Tân, thành phố Lào Cai, tỉnh Lào Cai'),
('000000000004', N'Hoàng Phương Hoa', '1999-06-20', 1, N'Việt Nam', N'TPHCM', N'49 Lê Duẩn, Bến Nghé, Quận 1, TPHCM')


insert into Form_Register values
(0,0,0, N'Phạm Lê Đức Anh', N'123A đường Lý Thường Kiệt, Phường 10, Quận 5, TPHCM', 0, '1988-02-20', '000000000001', '0862633127', 'phamleducanh@gmail.com'),
(0,0,0, N'Phạm Minh Thư', N'219 Lê Lợi, phường 2, Quận 3, TPHCM', 1, '1983-03-16', '000000000002', '0336688722', 'minhthu88@gmail.com'),
(0,0,0, N'Nguyễn Quốc Anh', N'298 - phường Kim Tân, thành phố Lào Cai, tỉnh Lào Cai', 0, '1975-12-20', '000000000003', '0336688722', 'anhnq@gmail.com'),
(0,0,0, N'Hoàng Phương Hoa', N'49 Lê Duẩn, Bến Nghé, Quận 1, TPHCM', 1, '1999-06-20', '000000000004', '0373722198', 'phuonghoa99@gmail.com')


--tạo user các nhân viên 
create login namnh with password = 'namnh';
create user namnh for login namnh;

create login phuvk with password = 'phuvk';
create user phuvk for login phuvk;

create login anhpvt with password = 'anhpvt';
create user anhpvt for login anhpvt;

create login danglta with password = 'danglta';
create user danglta for login danglta;

create login linhnta with password = 'linhnta';
create user linhnta for login linhnta;
-- phân quyền 
--grant update on Gs to namnh;

grant control on database::Passport to phuvk;

grant select on Resident_data to anhpvt;
grant select, update on Form_Register to anhpvt;
grant select on Nhanvien to anhpvt;

grant select, update on Form_Register to danglta;
grant select on Nhanvien to danglta;
grant select, insert on Luutru to danglta

grant select on Nhanvien to linhnta;
grant select, update on Form_Register to linhnta;

--grant insert, update on database::Passport to linhnta;

-- các lệnh để test thui 

select hoten from Nhanvien where tendn= 'phuvk'
select * from Nhanvien
drop table Nhanvien
select * from Resident_data
select * from Form_Register

use master
go 
drop database Passport
go 

select * from Form_Register where trave = 0 and trangthai = 0;
select * from Luutru;
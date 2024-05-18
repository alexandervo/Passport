create database Passport
go

use Passport
go

--delete from Form_Register

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
--drop table Form_Register
create table Form_Register
(
	shs numeric identity,
	trangthai bit,
	xacthuc bit,
	trave bit,
	hoten nvarchar(50) COLLATE Latin1_General_CI_AS not null,
	diachi nvarchar(100) COLLATE Latin1_General_CI_AS not null,
	gioitinh bit not null,
	ngaysinh date not null,
	so_cccd varchar(12) not null,
	sdt varchar(10) not null,
	email varchar(100) COLLATE Latin1_General_CI_AS,
	nv varchar(20)
)

create table Nhanvien
(
	tendn varchar(20) not null,
	mk varbinary(max) not null,
	hoten nvarchar(50) not null,
	bophan char(2) not null

)

--drop table Nhanvien

create table Luutru
(
	shs varchar(15),
	hoten nvarchar(50) not null,
	diachi nvarchar(100) not null,
	gioitinh bit not null,
	ngaysinh date not null,
	so_cccd varchar(12) not null,
	sdt varchar(10) not null,
	email nvarchar(100),
	constraint fk_cccd_lt foreign key (so_cccd) references Resident_data (so_cccd)
)

create table GiamSat
(
	bp varchar(2),
	hs varchar(15),
	tt char(1),
	nv varchar(10),
	dt datetime
)

--drop table GiamSat
CREATE PROCEDURE SP_Nhanvien
    @tendn VARCHAR(20),
    @mk VARCHAR(MAX),
    @hoten NVARCHAR(50),
    @bophan CHAR(2)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @hashed_mk VARBINARY(MAX);
    SET @hashed_mk = CAST(HASHBYTES('SHA2_512', @mk) AS Varbinary(MAX))

    BEGIN TRY
        INSERT INTO Nhanvien (tendn, mk, hoten, bophan)
        VALUES (@tendn, @hashed_mk, @hoten, @bophan);
    END TRY
    BEGIN CATCH
        -- Xử lý lỗi ở đây (nếu cần)
        PRINT ERROR_MESSAGE();
    END CATCH
END;

--drop procedure SP_Nhanvien
Delete Nhanvien
--insert into Nhanvien values

Exec SP_Nhanvien 'phuvk', phuvk, N'Võ Kiến Phú', 'ad' 
Exec SP_Nhanvien 'anhpvt', anhpvt, N'Phan Vũ Tuấn Anh', 'xd'
Exec SP_Nhanvien 'danglta', danglta, N'Lai Thị Ánh Đăng', 'lt'
Exec SP_Nhanvien 'linhnta', linhnta, N'Nguyễn Trần Ánh Linh', 'gs'
Exec SP_Nhanvien 'lanptn', lanptn, N'Phan Thị Ngọc Lan', 'xt'

--SELECT * FROM Nhanvien

insert into Resident_data values
('000000000001', N'Phạm Lê Đức Anh', '1988-02-20', 0, N'Việt Nam', N'Hải Dương', N'123A đường Lý Thường Kiệt, Phường 10, Quận 5, TPHCM'),
('000000000002', N'Phạm Minh Thư', '1983-03-16', 1, N'Việt Nam', N'Huế', N'219 Lê Lợi, phường 2, Quận 3, TPHCM'),
('000000000003', N'Nguyễn Quốc Anh', '1977-12-20', 0, N'Việt Nam', N'Lào Cai', N'298 - phường Kim Tân, thành phố Lào Cai, tỉnh Lào Cai'),
('000000000004', N'Hoàng Phương Hoa', '1999-06-20', 1, N'Việt Nam', N'TPHCM', N'49 Lê Duẩn, Bến Nghé, Quận 1, TPHCM'),
('000000000005', N'Nguyễn Lê Hồng Nhung', '2002-06-21', 1, N'Việt Nam', N'Hải Dương', N'362 Kim Mã Q. Ba Đình, Hà Nội'),
('000000000006', N'Phạm Văn Nghĩa', '1999-03-06', 0, N'Việt Nam', N'Huế', N'41 Cát Linh, Q. Đống Đa, Hà Nội'),
('000000000007', N'Nguyễn Hoàng Minh Khôi', '2001-01-02', 0, N'Việt Nam',N'Hà Nội', N'10 Lê Thánh Tông, Q. Hoàn Kiếm, Hà Nội'),
('000000000008', N'Thân Lê Ngọc Xuyến', '2003-05-10', 1, N'Việt Nam', N'Hải Phòng', N' 86 Trần Nhân Tông, Q. Hai Bà Trưng, Hà Nội')


insert into Form_Register values
(0,0,0, N'Phạm Lê Đức Anh', N'123A đường Lý Thường Kiệt, Phường 10, Quận 5, TPHCM', 0, '1988-02-20', '000000000001', '0862633127', 'phamleducanh@gmail.com', ''),
(0,0,0, N'Phạm Minh Thư', N'219 Lê Lợi, phường 2, Quận 3, TPHCM', 1, '1983-03-16', '000000000002', '0336688722', 'minhthu88@gmail.com', ''),
(0,0,0, N'Nguyễn Quốc Anh', N'298 - phường Kim Tân, thành phố Lào Cai, tỉnh Lào Cai', 0, '1975-12-20', '000000000003', '0336688722', 'anhnq@gmail.com', ''),
(0,0,0, N'Hoàng Phương Hoa', N'49 Lê Duẩn, Bến Nghé, Quận 1, TPHCM', 1, '1999-06-20', '000000000004', '0373722198', 'phuonghoa99@gmail.com', ''),
(0,0,0, N'Nguyễn Lê Hồng Nhung', N'362 Kim Mã Q. Ba Đình, Hà Nội', 1, '2002-06-21', '000000000005', '0973256232', 'nhungnhinhanh@gmail.com', ''),
(0,0,0, N'Phạm Văn Nghĩa',  N'41 Cát Linh, Q. Đống Đa, Hà Nội', 0, '1999-03-06', '000000000006', '0236228133', 'nghiapham0399@gmail.com', ''),
(0,0,0, N'Nguyễn Hoàng Minh Khôi', N'10 Lê Thánh Tông, Q. Hoàn Kiếm, Hà Nội', 0, '2001-01-02', '000000000007', '0902231136', 'minhkhoi@gmail.com', ''),
(0,0,0, N'Thân Lê Ngọc Xuyến', N' 86 Trần Nhân Tông, Q. Hai Bà Trưng, Hà Nội', 1, '2003-05-10', '000000000008', '0868683321', 'ngocxuyenthanle2003@gmail.com', '')

delete from Luutru

--tạo user các nhân viên 

create login ad with password = 'ad';
create user ad for login ad;

create login xt with password = 'xt';
create user xt for login xt;


create login xd with password = 'xd';
create user xd for login xd;

create login lt with password = 'lt';
create user lt for login lt;

create login gs with password = 'gs';
create user gs for login gs;

create login nv with password = 'nv';
create user nv for login nv;

drop login nv
drop user nv

-- phân quyền 
grant control on database::Passport to ad;

grant select on Nhanvien to nv;

grant select, update on Form_Register to xt;
grant select on Nhanvien to xt;
grant select on Resident_data to xt;

grant select, update on Form_Register to xd;
grant select on Nhanvien to xd;

grant select, update on Form_Register to lt;
grant select on Nhanvien to lt;
grant select, insert on Luutru to lt;

grant select on Nhanvien to gs;
grant select on GiamSat to gs;
GO

--tạo trigger
create trigger Audit_Update on Form_Register
after update
as
begin
	declare @tt char = ''
	declare @nv varchar(20) = ''
	select 
		@tt = case
			when trave = 1 and trangthai = 1 and xacthuc = 1 then 'l'
			when trave = 1 and (trangthai = 0 or xacthuc = 0) then 't'
			when trave = 0 and trangthai = 0 and xacthuc = 1 and SUSER_NAME() = 'xt' then 'x'
			when trave = 0 and trangthai = 1 and xacthuc = 1 then 'd'
			when trave = 0 and trangthai = 0 and xacthuc = 0 then '1'
			when trave = 0 and trangthai = 0 and xacthuc = 1 and SUSER_NAME() = 'xd' then '2'
			else 'n'
			end
	from inserted
	declare @hs varchar(15)
	select @hs = cast(shs as varchar(15)), @nv = nv from inserted
	if @tt != 'n' insert into GiamSat values (SUSER_NAME(), @hs, @tt, @nv, GETDATE())
end

--drop trigger Audit_Update


-- các lệnh để test thui 
select * from Form_Register
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

select * from GiamSat;
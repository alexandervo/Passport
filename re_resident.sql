CREATE DATABASE Passport
GO

USE Passport
GO

CREATE TABLE Resident_data
(
    so_cccd VARCHAR(12) NOT NULL,
    hoten NVARCHAR(50) NOT NULL,
    ngaysinh DATE NOT NULL,
    gioitinh BIT NOT NULL,
    quoctich NVARCHAR(30) NOT NULL,
    quequan NVARCHAR(100) NOT NULL,
    diachi NVARCHAR(100) NOT NULL,
    CONSTRAINT pk_cccd PRIMARY KEY (so_cccd)
)

CREATE TABLE Form_Register
(
    shs NUMERIC IDENTITY, -- Tăng dần khi được tạo mới
    trangthai BIT,
    xacthuc BIT,
    trave BIT,
    hoten NVARCHAR(50) COLLATE Vietnamese_CI_AS NOT NULL,
    diachi NVARCHAR(100) COLLATE Vietnamese_CI_AS NOT NULL,
    gioitinh BIT NOT NULL,
    ngaysinh DATE NOT NULL,
    so_cccd VARCHAR(12) NOT NULL,
    sdt VARCHAR(10) NOT NULL,
    email NVARCHAR(100),
)

CREATE TABLE Nhanvien
(
    tendn VARCHAR(20) NOT NULL,
    hoten NVARCHAR(50) NOT NULL,
    bophan VARCHAR(20) NOT NULL,

)

CREATE TABLE Luutru
(
    shs VARCHAR(15),
    hoten NVARCHAR(50) NOT NULL,
    diachi NVARCHAR(100) NOT NULL,
    gioitinh BIT NOT NULL,
    ngaysinh DATE NOT NULL,
    so_cccd VARCHAR(12) NOT NULL,
    sdt VARCHAR(10) NOT NULL,
    email NVARCHAR(100),
    CONSTRAINT fk_cccd_lt FOREIGN KEY (so_cccd) REFERENCES Resident_data (so_cccd)
)

CREATE TABLE GiamSat
(
    bp VARCHAR(2),
	hs VARCHAR(15),
	tt CHAR(1),
	nv VARCHAR(10),
	dt DATETIME

)
GO

INSERT INTO Nhanvien VALUES
	('phuvk', N'Võ Kiến Phú', 'ad'),
	('anhpvt', N'Phan Vũ Tuấn Anh', 'xd'),
	('danglta', N'Lai Thị Ánh Đăng', 'lt'),
	('linhnta', N'Nguyễn Trần Ánh Linh', 'gs'),
	('lanptn', N'Phan Thị Ngọc Lan', 'xt')

INSERT INTO Resident_data VALUES
	('000000000001', N'Phạm Lê Đức Anh', '1988-02-20', 0, N'Việt Nam', N'Hải Dương', N'123A đường Lý Thường Kiệt, Phường 10, Quận 5, TPHCM'),
	('000000000002', N'Phạm Minh Thư', '1983-03-16', 1, N'Việt Nam', N'Huế', N'219 Lê Lợi, phường 2, Quận 3, TPHCM'),
	('000000000003', N'Nguyễn Quốc Anh', '1977-12-20', 0, N'Việt Nam', N'Lào Cai', N'298 - phường Kim Tân, thành phố Lào Cai, tỉnh Lào Cai'),
	('000000000004', N'Hoàng Phương Hoa', '1999-06-20', 1, N'Việt Nam', N'TPHCM', N'49 Lê Duẩn, Bến Nghé, Quận 1, TPHCM'),
	('000000000005', N'Nguyễn Lê Hồng Nhung', '2002-06-21', 1, N'Việt Nam', N'Hải Dương', N'362 Kim Mã Q. Ba Đình, Hà Nội'),
	('000000000006', N'Phạm Văn Nghĩa', '1999-03-06', 0, N'Việt Nam', N'Huế', N'41 Cát Linh, Q. Đống Đa, Hà Nội'),
	('000000000007', N'Nguyễn Hoàng Minh Khôi', '2001-01-02', 0, N'Việt Nam',N'Hà Nội', N'10 Lê Thánh Tông, Q. Hoàn Kiếm, Hà Nội'),
	('000000000008', N'Thân Lê Ngọc Xuyến', '2003-05-10', 1, N'Việt Nam', N'Hải Phòng', N' 86 Trần Nhân Tông, Q. Hai Bà Trưng, Hà Nội')


INSERT INTO Form_Register VALUES
	(0,0,0, N'Phạm Lê Đức Anh', N'123A đường Lý Thường Kiệt, Phường 10, Quận 5, TPHCM', 0, '1988-02-20', '000000000001', '0862633127', 'phamleducanh@gmail.com'),
	(0,0,0, N'Phạm Minh Thư', N'219 Lê Lợi, phường 2, Quận 3, TPHCM', 1, '1983-03-16', '000000000002', '0336688722', 'minhthu88@gmail.com'),
	(0,0,0, N'Nguyễn Quốc Anh', N'298 - phường Kim Tân, thành phố Lào Cai, tỉnh Lào Cai', 0, '1975-12-20', '000000000003', '0336688722', 'anhnq@gmail.com'),
	(0,0,0, N'Hoàng Phương Hoa', N'49 Lê Duẩn, Bến Nghé, Quận 1, TPHCM', 1, '1999-06-20', '000000000004', '0373722198', 'phuonghoa99@gmail.com'),
	(0,0,0, N'Nguyễn Lê Hồng Nhung', N'362 Kim Mã Q. Ba Đình, Hà Nội', 1, '2002-06-21', '000000000005', '0973256232', 'nhungnhinhanh@gmail.com'),
	(0,0,0, N'Phạm Văn Nghĩa',  N'41 Cát Linh, Q. Đống Đa, Hà Nội', 0, '1999-03-06', '000000000006', '0236228133', 'nghiapham0399@gmail.com'),
	(0,0,0, N'Nguyễn Hoàng Minh Khôi', N'10 Lê Thánh Tông, Q. Hoàn Kiếm, Hà Nội', 0, '2001-01-02', '000000000007', '0902231136', 'minhkhoi@gmail.com'),
	(0,0,0, N'Thân Lê Ngọc Xuyến', N' 86 Trần Nhân Tông, Q. Hai Bà Trưng, Hà Nội', 1, '2003-05-10', '000000000008', '0868683321', 'ngocxuyenthanle2003@gmail.com')
GO

--tạo user các nhân viên 
CREATE LOGIN namnh WITH PASSWORD = 'namnh';
CREATE USER namnh FOR LOGIN namnh;

CREATE LOGIN phuvk WITH PASSWORD = 'phuvk';
CREATE USER phuvk FOR LOGIN phuvk;

CREATE LOGIN lanptn WITH PASSWORD = 'lanptn';
CREATE USER lanptn FOR LOGIN lanptn;


CREATE LOGIN anhpvt WITH PASSWORD = 'anhpvt';
CREATE USER anhpvt FOR LOGIN anhpvt;

CREATE LOGIN danglta WITH PASSWORD = 'danglta';
CREATE USER danglta FOR LOGIN danglta;

CREATE LOGIN linhnta WITH PASSWORD = 'linhnta';
CREATE USER linhnta FOR LOGIN linhnta;
-- phân quyền 
--grant update on Gs TO namnh;

GRANT CONTROL ON DATABASE::Passport TO phuvk;

GRANT SELECT, UPDATE ON Form_Register TO anhpvt;
GRANT SELECT ON Nhanvien TO anhpvt;

GRANT SELECT ON Resident_data TO lanptn;
GRANT SELECT, UPDATE ON Form_Register TO lanptn;
GRANT SELECT ON Nhanvien TO lanptn;

GRANT SELECT, UPDATE ON Form_Register TO danglta;
GRANT SELECT ON Nhanvien TO danglta;
GRANT SELECT, INSERT ON Luutru TO danglta

GRANT SELECT ON Nhanvien TO linhnta;
GRANT SELECT, UPDATE ON Form_Register TO linhnta;

--tạo trigger
CREATE TRIGGER Audit_Update on Form_Register
AFTER UPDATE
AS
BEGIN
	DECLARE @tt char = ''
	DECLARE @bp VARCHAR(2) = ''
	SELECT 
		@tt = case
			WHEN trave = 1 AND trangthai = 1 AND xacthuc = 1 THEN 'l'
			WHEN trave = 1 AND (trangthai = 1 or xacthuc = 1) THEN 't'
			WHEN trave = 0 AND trangthai = 0 AND xacthuc = 1 THEN 'x'
			WHEN trave = 0 AND trangthai = 1 AND xacthuc = 1 THEN 'd'
			end
	FROM inserted
	DECLARE @hs VARCHAR(15)
	SELECT @hs = cast(shs as VARCHAR(15)) FROM inserted
	SELECT @bp = bophan FROM Nhanvien WHERE tendn = SUSER_NAME()
	INSERT INTO GiamSat VALUES (@bp, @hs, @tt, SUSER_NAME(), GETDATE())
END

DROP TRIGGER Audit_Update


-- các lệnh để test thui 
SELECT * FROM Nhanvien
SELECT * FROM Resident_data
SELECT * FROM Form_Register

SELECT hoten FROM Nhanvien WHERE tendn= 'phuvk'
DELETE FROM Form_Register WHERE;

USE master
GO 
DROP DATABASE Passport
GO

SELECT * FROM Form_Register WHERE trave = 0 AND trangthai = 0;
SELECT * FROM Luutru;

IF EXISTS (SELECT * FROM sys.database_principals WHERE name = N'anhpavt')
DROP USER [namnh]
DROP USER [linhnta]
GO

SELECT * FROM sys.database_principals
GO


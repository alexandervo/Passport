USE Passport

-- tạo role
CREATE ROLE XTVien
CREATE ROLE XDVien
CREATE ROLE LTVien
CREATE ROLE GSVien
CREATE ROLE MASTERVien
GO

ALTER ROLE MASTERVien ADD MEMBER phuvk
ALTER ROLE XTVien ADD MEMBER lanptn
ALTER ROLE XDVien ADD MEMBER anhpvt
ALTER ROLE LTVien ADD MEMBER danglta
ALTER ROLE GSVien ADD MEMBER linhnta
ALTER ROLE GSVien ADD MEMBER namnh
GO

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

CREATE LOGIN hainguoi WITH PASSWORD = 'titan';
CREATE USER hainguoi FOR LOGIN hainguoi;

SELECT dp.name AS DatabasePrincipal, rp.name AS RoleName
FROM sys.database_role_members drm
JOIN sys.database_principals dp ON drm.member_principal_id = dp.principal_id
JOIN sys.database_principals rp ON drm.role_principal_id = rp.principal_id;

SELECT * FROM sys.database_principals;

SELECT * FROM sys.database_role_members;

CREATE PROCEDURE XacThucHoSo (
    shs NUMERIC IDENTITY
    trangthai BIT,
    xacthuc BIT,
    trave BIT,
    hoten NVARCHAR(50),
    so_cccd VARCHAR(12)
)
AS
BEGIN
	DECLARE @Encrypt_SHS VARBINARY(MAX)
END
GO
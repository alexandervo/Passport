/*
MASV: 47.01.104.045
HO TEN: PHAN VU TUAN ANH
LAB: 03
NGAY: 01/04/2024
*/
USE EMPLOYEE
GO
INSERT INTO Class(CLASSID, CLASSNAME, EMPLOYEEID)
			VALUES	('CNTT-K47', 'Cong nghe thong tin K47', NULL),
					('TT-K47', 'Truyen thong K47', NULL),
					('NNA-K47', 'Ngon ngu Anh K47', NULL),
					('QLXD-K47', 'Quan ly xay dung K47', NULL)
GO

EXEC INSERT_STUDENT 'ST01', 'HOANG PHUONG AN', '2003-09-10', 'Xom Chieu', 'TT-K47', 'HPA', '111111'
EXEC INSERT_STUDENT 'ST02', 'CAO HOANG DUY', '2003-10-29', 'Tran Xuan Soan', 'NNA-K47', 'CHD', '222222'
EXEC INSERT_STUDENT 'ST03', 'VO HOANG KHA', '2003-10-20', 'Huynh Tan Phat', 'QLXD-K47', 'VHK', '333333'
GO

EXEC INSERT_EMPLOYEE 'EM01', 'Employee 1', 'em01222@gmail.com', '13500', 'em01', 'password'
EXEC INSERT_EMPLOYEE 'EM02', 'Employee 2', 'em02333@gmail.com', '24200', 'em02', 'password'
EXEC INSERT_EMPLOYEE 'EM03', 'Employee 3', 'em03444@gmail.com', '55700', 'em03', 'password'
GO

EXEC GET_EMPLOYEE_DETAILS
GO

/*
SELECT * FROM Class
SELECT * FROM Student
SELECT * FROM Employee
GO

DELETE FROM Student
DELETE FROM Class
DELETE FROM Employee
GO
*/
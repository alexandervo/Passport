use QLBongDa
go


Insert into CAUTHU (HOTEN, VITRI, NGAYSINH, DIACHI, MACLB, MAQG, SO)
values 
(N'Vidic', N'Hậu vệ', '1987-10-15', NULL, 'HAGL', 'ANH', 3),
(N'Ronaldo', N'Tiền vệ', '1989-12-12', NULL, 'SDN', 'BRA', 7),
(N'Robinho', N'Tiền vệ', '1989-10-12', NULL, 'SDN', 'BRA', 8),
(N'Trần Tấn Tài', N'Tiền vệ', '1989-11-12', NULL, 'BBD', 'VN', 8),
(N'Phan Hồng Sơn', N'Thủ môn', '1991-06-10', NULL, 'HAGL', 'VN', 1),
(N'Trần Văn Santos', N'Thủ môn', '1990-10-21', NULL, 'BBD', 'BRA', 1),
(N'Nguyễn Trường Sơn', N'Hậu vệ', '1993-08-26', NULL, 'BBD', 'VN', 4),
(N'Nguyễn Vũ Phong', N'Tiền vệ', '1990-02-20', NULL, 'BBD', 'VN', 17),
(N'Nguyễn Công Vinh', N'Tiền đạo', '1992-03-10', NULL, 'HAGL', 'VN', 9);



Insert into QUOCGIA (MAQG, TENQG)
values 
('ANH', N'Anh Quốc'),
('BDN', N'Bồ Đào Nha'),
('BRA', N'Brazil'),
('TBN', N'Tây Ban Nha'),
('ITA', N'Ý'),
('THA', N'Thái Lan'),
('VN', N'Việt Nam');


Insert into CAULACBO (MACLB, TENCLB, MASAN, MATINH)
values 
('BBD', N'BECAMEX BÌNH DƯƠNG', 'GD', 'BD'),
('HAGL', N'HOÀNG ANH GIA LAI', 'PL', 'GL'),
('SDN', N'SHB ĐÀ NẴNG', 'CL', 'DN'),
('KKH', N'KHATOCO KHÁNH HÒA', 'NT', 'KH'),
('TPY', N'THÉP PHÚ YÊN', 'TH', 'PY'),
('GDT', N'GẠCH ĐỒNG TÂM LONG AN', 'LA', 'LA');


Insert into TINH (MATINH, TENTINH)
values 
('BD', N'Bình Dương'),
('DN', N'Đà Nẵng'),
('GL', N'Gia Lai'),
('KH', N'Khánh Hòa'),
('PY', N'Phú Yên'),
('LA', N'Long An');


Insert into SANVD (MASAN, TENSAN, DIACHI)
values 
('CL', N'Chi Lăng', N'127 Võ Văn Tần, Đà Nẵng'),
('TH', N'Tuy Hòa', N'57 Trường Chinh, Tuy Hòa, Phú Yên'),
('GD', N'Gò Đậu', N'123 QL1, TX Thủ Dầu Một, Bình Dương'),
('LA', N'Long An', N'102 Hùng Vương, Tp Tân An, Long An'),
('NT', N'Nha Trang', N'128 Phan Chu Trinh, Nha Trang, Khánh Hòa'),
('PL', N'Pleiku', N'22 Hồ Tùng Mậu, Thống Nhất, Thị xã Pleiku, Gia Lai');


Insert into HUANLUYENVIEN (MAHLV, TENHLV, NGAYSINH, DIACHI, DIENTHOAI, MAQG)
values 
('HLV01', N'Vital', '1955-10-15', NULL, '0918011075', 'BDN'),
('HLV02', N'Lê Huỳnh Đức', '1972-05-20', NULL, '01223456789', 'VN'),
('HLV03', N'Kiatisuk', '1970-12-11', NULL, '01990123456', 'THA'),
('HLV04', N'Hoàng Anh Tuấn', '1970-06-10', NULL, '0989112233', 'VN'),
('HLV05', N'Trần Công Minh', '1973-07-07', NULL, '0909099990', 'VN'),
('HLV06', N'Trần Văn Phúc', '1965-03-02', NULL, '01650101234', 'VN');


Insert into HLV_CLB (MAHLV, MACLB, VAITRO)
values 
('HLV01', 'BBD', N'HLV Chính'),
('HLV02', 'SDN', N'HLV Chính'),
('HLV03', 'HAGL', N'HLV Chính'),
('HLV04', 'KKH', N'HLV Chính'),
('HLV05', 'GDT', N'HLV Chính'),
('HLV06', 'BBD', N'HLV thủ môn');


Insert into TRANDAU (NAM, VONG, NGAYTD, MACLB1, MACLB2, MASAN, KETQUA)
values 
(2009, 1, '2009-02-07', 'BBD', 'SDN', 'GD', '3-0'),
(2009, 1, '2009-02-07', 'KKH', 'GDT', 'NT', '1-1'),
(2009, 2, '2009-02-16', 'SDN', 'KKH', 'CL', '2-2'),
(2009, 2, '2009-02-16', 'TPY', 'BBD', 'TH', '5-0'),
(2009, 3, '2009-03-01', 'TPY', 'GDT', 'TH', '0-2'),
(2009, 3, '2009-03-01', 'KKH', 'BBD', 'NT', '0-1'),
(2009, 4, '2009-03-07', 'KKH', 'TPY', 'NT', '1-0'),
(2009, 4, '2009-03-07', 'BBD', 'GDT', 'GD', '2-2');


Insert into BANGXH (MACLB, NAM, VONG, SOTRAN, THANG, HOA, THUA, HIEUSO, DIEM, HANG)
values 
('BBD', 2009, 1, 1, 1, 0, 0, '3-0', 3, 1),
('KKH', 2009, 1, 1, 0, 1, 0, '1-1', 1, 2),
('GDT', 2009, 1, 1, 0, 1, 0, '1-1', 1, 3),
('TPY', 2009, 1, 0, 0, 0, 0, '0-0', 0, 4),
('SDN', 2009, 1, 1, 0, 0, 1, '0-3', 0, 5),
('TPY', 2009, 2, 1, 1, 0, 0, '5-0', 3, 1),
('BBD', 2009, 2, 2, 1, 0, 1, '3-5', 3, 2),
('KKH', 2009, 2, 2, 0, 2, 0, '3-3', 2, 3),
('GDT', 2009, 2, 1, 0, 1, 0, '1-1', 1, 4),
('SDN', 2009, 2, 2, 1, 1, 0, '2-5', 1, 5),
('BBD', 2009, 3, 3, 2, 0, 1, '4-5', 6, 1),
('GDT', 2009, 3, 2, 1, 1, 0, '3-1', 4, 2),
('TPY', 2009, 3, 2, 1, 0, 1, '5-2', 3, 3),
('KKH', 2009, 3, 3, 0, 2, 1, '3-4', 2, 4),
('SDN', 2009, 3, 2, 1, 1, 0, '2-5', 1, 5),
('BBD', 2009, 4, 4, 2, 1, 1, '6-7', 7, 1),
('GDT', 2009, 4, 3, 1, 2, 0, '5-1', 5, 2),
('KKH', 2009, 4, 4, 1, 2, 1, '4-4', 5, 3),
('TPY', 2009, 4, 3, 1, 0, 2, '5-3', 3, 4),
('SDN', 2009, 4, 2, 1, 1, 0, '2-5', 1, 5);

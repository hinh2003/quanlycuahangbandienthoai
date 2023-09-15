
--Nguyen Van Tuan Hinh
--Vuong Trung Hieu


CREATE DATABASE BTL
use BTL

CREATE TABLE NguoiDung (
    MaND INT PRIMARY KEY,
    HoTen NVARCHAR(50) NOT NULL,
    NgaySinh DATE NOT NULL,
    GioiTinh NVARCHAR(10) NOT NULL,
    DiaChi NVARCHAR(100) NOT NULL,
    SoDienThoai NVARCHAR(20) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    LaNhanVien BIT NOT NULL DEFAULT 0 ,
	
);


CREATE TABLE CHUCVU 
(
  MACHUCVU NCHAR(50 ) NOT NULL,
  TENCHUCVU NVARCHAR(100) NOT NULL,
  VITRI NVARCHAR(100) NOT NULL,

  PRIMARY KEY (MACHUCVU)
)


CREATE TABLE KhachHang (
    MaKH INT PRIMARY KEY,
    MaND INT UNIQUE,
	LaNhanVien BIT NOT NULL DEFAULT 0,	
    CONSTRAINT fk_NguoiDung_KhachHang FOREIGN KEY (MaND) REFERENCES NguoiDung(MaND),
    CONSTRAINT ck_LaNhanVien_KhachHang CHECK (LaNhanVien = 0)
);


	

CREATE TABLE NhanVien (
    MaNV INT PRIMARY KEY,
    MaND INT UNIQUE,
	LaNhanVien BIT NOT NULL DEFAULT 1,
    CONSTRAINT fk_NguoiDung_NhanVien FOREIGN KEY (MaND) REFERENCES NguoiDung(MaND),
    NgayVaoLam DATE NOT NULL,
    Luong FLOAT NOT NULL,
    CONSTRAINT ck_LaNhanVien_NhanVien CHECK (LaNhanVien = 1)
);
CREATE TABLE NhaCungCap (
    MaNCC INT ,
    TenNCC VARCHAR(50) NOT NULL,
    DiaChi VARCHAR(100),
    DienThoai VARCHAR(15)
	CONSTRAINT pk_NhaCungCap PRIMARY KEY(MaNCC)
);
CREATE TABLE ThuongHieu (
    MaTH INT ,
    TenTH VARCHAR(50) NOT NULL
	CONSTRAINT pk_ThuongHieu PRIMARY KEY(MaTH)

);
CREATE TABLE SanPham (
    MaSP INT PRIMARY KEY,
    TenSP VARCHAR(50) NOT NULL,
    MaTH INT NOT NULL,
    MaNCC INT NOT NULL,
    DonGia INT NOT NULL,
    SoLuong INT NOT NULL,
    FOREIGN KEY (MaTH) REFERENCES ThuongHieu(MaTH),
    FOREIGN KEY (MaNCC) REFERENCES NhaCungCap(MaNCC)
);
CREATE TABLE DonHang (
    MaDH INT PRIMARY KEY,
    MaKH INT NOT NULL,
    NgayDatHang DATE NOT NULL,
    TongTien INT NOT NULL,
    FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH)
);


CREATE TABLE ChiTietDonHang (
    MaDH INT NOT NULL,
    MaSP INT NOT NULL,
    SoLuong INT NOT NULL,
    FOREIGN KEY (MaDH) REFERENCES DonHang(MaDH),
    FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP),
	CONSTRAINT pk_ChiTietDonHang PRIMARY KEY (MaDH, MaSP)
);

CREATE TABLE PHIEUDANGKY 
(
 MAPHIEUDANGKY NCHAR(50) NOT NULL,
 MaKH NCHAR(50) NOT NULL,
 MaNV NCHAR(50) NOT NULL,
 
)

CREATE TABLE HOADON 
(
 MAHOADON NCHAR(50) NOT NULL,
 MAPHIEUDANGKY NCHAR(50) NOT NULL,
 GIAPHONG INT ,
 GIADICHVU INT

)


CREATE TABLE XUATHOADON
(
  
  MAHOADON NCHAR(50) NOT NULL,
  TONGTIEN INT  ,
  DOVI NVARCHAR(100) NOT NULL,
  NGAYTHANHTOAN DATE NOT NULL,
  TIENMAT NVARCHAR(100)  NULL,
  CHUYENKHOAN NVARCHAR(100) NULL,


)


--MaDH tham chiếu khóa chính của bảng DonHang.
ALTER TABLE ChiTietDonHang
ADD CONSTRAINT fk_DonHang_ChiTietDonHang FOREIGN KEY (MaDH) REFERENCES DonHang(MaDH);
--MaSP tham chiếu khóa chính của bảng SanPham.
ALTER TABLE ChiTietDonHang
ADD CONSTRAINT fk_SanPham_ChiTietDonHang FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP);
--Thiet lap nguoi dung

INSERT INTO NguoiDung (MaND,   HoTen, NgaySinh, GioiTinh, DiaChi, SoDienThoai, Email,LaNhanVien) 
VALUES (1, 'Nguyen Van A', '1990-12-01', 'Nam', '123 Le Loi, Quan 1, TP HCM', '0901234567', 'nguyenvana@gmail.com',0);
INSERT INTO NguoiDung (MaND,   HoTen, NgaySinh, GioiTinh, DiaChi, SoDienThoai, Email,LaNhanVien)
VALUES (2, 'Nguyen Van B', '1990-01-01', 'Nam', '123 Le Loi, Quan 1, TP HCM', '0901234567', 'nguyenvanb@gmail.com',1);
INSERT INTO NguoiDung (MaND,   HoTen, NgaySinh, GioiTinh, DiaChi, SoDienThoai, Email,LaNhanVien) 
VALUES (3, 'Nguyen Van C', '1990-01-01', 'Nam', '123 Le Loi, Quan 1, TP HCM', '0901234567', 'nguyenvanc@gmail.com',1);
INSERT INTO NguoiDung (MaND,   HoTen, NgaySinh, GioiTinh, DiaChi, SoDienThoai, Email,LaNhanVien) 
VALUES (4, 'Nguyen Van D', '1990-01-01', 'Nam', '123 Le Loi, Quan 1, TP HCM', '0901234567', 'nguyenvand@gmail.com',1);
INSERT INTO NguoiDung (MaND,   HoTen, NgaySinh, GioiTinh, DiaChi, SoDienThoai, Email,LaNhanVien) 
VALUES (5, 'Nguyen Van E', '1990-01-01', 'Nam', '123 Le Loi, Quan 1, TP HCM', '0901234567', 'nguyenvane@gmail.com',1);
INSERT INTO NguoiDung (MaND,   HoTen, NgaySinh, GioiTinh, DiaChi, SoDienThoai, Email,LaNhanVien) 
VALUES (6, 'Nguyen Van F', '1990-01-01', 'Nam', '123 Le Loi, Quan 1, TP HCM', '0901234567', 'nguyenvanf@gmail.com',0);
INSERT INTO NguoiDung (MaND,   HoTen, NgaySinh, GioiTinh, DiaChi, SoDienThoai, Email,LaNhanVien) 
VALUES (7, 'Nguyen Van S', '1990-01-01', 'Nam', '123 Le Loi, Quan 1, TP HCM', '0901234567', 'nguyenvans@gmail.com',1);
INSERT INTO NguoiDung (MaND,   HoTen, NgaySinh, GioiTinh, DiaChi, SoDienThoai, Email,LaNhanVien) 
VALUES (8, 'Nguyen Van Q', '1990-01-01', 'Nam', '123 Le Loi, Quan 1, TP HCM', '0901234567', 'nguyenvanq@gmail.com',0);
INSERT INTO NguoiDung (MaND,   HoTen, NgaySinh, GioiTinh, DiaChi, SoDienThoai, Email,LaNhanVien) 
VALUES (9, 'Nguyen Van W', '1990-01-01', 'Nam', '123 Le Loi, Quan 1, TP HCM', '0901234567', 'nguyenvanw@gmail.com',1);
INSERT INTO NguoiDung (MaND,   HoTen, NgaySinh, GioiTinh, DiaChi, SoDienThoai, Email,LaNhanVien) 
VALUES (10, 'Nguyen Van R', '1990-01-01', 'Nam', '123 Le Loi, Quan 1, TP HCM', '0901234567', 'nguyenvanra@gmail.com',1);
INSERT INTO NguoiDung (MaND,   HoTen, NgaySinh, GioiTinh, DiaChi, SoDienThoai, Email,LaNhanVien) 
VALUES (11, 'Nguyen Van T', '1990-01-01', 'Nam', '123 Le Loi, Quan 1, TP HCM', '0901234567', 'nguyenvant@gmail.com',1);
INSERT INTO NguoiDung (MaND,   HoTen, NgaySinh, GioiTinh, DiaChi, SoDienThoai, Email,LaNhanVien) 
VALUES (12, 'Nguyen Van Y', '1990-01-01', 'Nam', '123 Le Loi, Quan 1, TP HCM', '0901234567', 'nguyenvany@gmail.com',1);
INSERT INTO NguoiDung (MaND,   HoTen, NgaySinh, GioiTinh, DiaChi, SoDienThoai, Email,LaNhanVien) 
VALUES (13, 'Nguyen Van U', '1990-01-01', 'Nam', '123 Le Loi, Quan 1, TP HCM', '0901234567', 'nguyenvanu@gmail.com',1);
INSERT INTO NguoiDung (MaND,   HoTen, NgaySinh, GioiTinh, DiaChi, SoDienThoai, Email,LaNhanVien) 
VALUES (14, 'Nguyen Van I', '1990-01-01', 'Nam', '123 Le Loi, Quan 1, TP HCM', '0901234567', 'nguyenvani@gmail.com',1);
INSERT INTO NguoiDung (MaND,   HoTen, NgaySinh, GioiTinh, DiaChi, SoDienThoai, Email,LaNhanVien) 
VALUES (15, 'Nguyen Van O', '1990-01-01', 'Nam', '123 Le Loi, Quan 1, TP HCM', '0901234567', 'nguyenvano@gmail.com',1);
INSERT INTO NguoiDung (MaND,   HoTen, NgaySinh, GioiTinh, DiaChi, SoDienThoai, Email,LaNhanVien) 
VALUES (16, 'Nguyen Van P', '1990-01-01', 'Nam', '123 Le Loi, Quan 1, TP HCM', '0901234567', 'nguyenvanp@gmail.com',1);
INSERT INTO NguoiDung (MaND,   HoTen, NgaySinh, GioiTinh, DiaChi, SoDienThoai, Email,LaNhanVien) 
VALUES (17, 'Nguyen Van G', '1990-01-01', 'Nam', '123 Le Loi, Quan 1, TP HCM', '0901234567', 'nguyenvang@gmail.com',1);
INSERT INTO NguoiDung (MaND,   HoTen, NgaySinh, GioiTinh, DiaChi, SoDienThoai, Email,LaNhanVien) 
VALUES (18, 'Nguyen Van H', '1990-01-01', 'Nam', '123 Le Loi, Quan 1, TP HCM', '0901234567', 'nguyenvanh@gmail.com',1);
INSERT INTO NguoiDung (MaND,   HoTen, NgaySinh, GioiTinh, DiaChi, SoDienThoai, Email,LaNhanVien) 
VALUES (19, 'Nguyen Van J', '1990-01-01', 'Nam', '123 Le Loi, Quan 1, TP HCM', '0901234567', 'nguyenvanj@gmail.com',1);
INSERT INTO NguoiDung (MaND,   HoTen, NgaySinh, GioiTinh, DiaChi, SoDienThoai, Email,LaNhanVien) 
VALUES (20, 'Nguyen Van K', '1990-01-01', 'Nam', '123 Le Loi, Quan 1, TP HCM', '0901234567', 'nguyenvank@gmail.com',1);
--thiet lap khach hang
INSERT INTO KhachHang(MaKH, MaND) VALUES (1, 1);
INSERT INTO KhachHang(MaKH, MaND) VALUES (2, 2);
INSERT INTO KhachHang(MaKH, MaND) VALUES (3, 3);
INSERT INTO KhachHang(MaKH, MaND) VALUES (4, 4);
INSERT INTO KhachHang(MaKH, MaND) VALUES (5, 5);
INSERT INTO KhachHang(MaKH, MaND) VALUES (6, 6);
INSERT INTO KhachHang(MaKH, MaND) VALUES (7, 7);
INSERT INTO KhachHang(MaKH, MaND) VALUES (8, 8);
INSERT INTO KhachHang(MaKH, MaND) VALUES (9, 9);
INSERT INTO KhachHang(MaKH, MaND) VALUES (10, 10);
INSERT INTO KhachHang(MaKH, MaND) VALUES (11, 11);
INSERT INTO KhachHang(MaKH, MaND) VALUES (12, 12);
INSERT INTO KhachHang(MaKH, MaND) VALUES (13, 13);
INSERT INTO KhachHang(MaKH, MaND) VALUES (14, 14);
INSERT INTO KhachHang(MaKH, MaND) VALUES (15, 15);
INSERT INTO KhachHang(MaKH, MaND) VALUES (16, 16);
INSERT INTO KhachHang(MaKH, MaND) VALUES (17, 17);
INSERT INTO KhachHang(MaKH, MaND) VALUES (18, 18);
INSERT INTO KhachHang(MaKH, MaND) VALUES (19, 19);
INSERT INTO KhachHang(MaKH, MaND) VALUES (20, 20);
 -- ---------------CHUCVU
 INSERT INTO CHUCVU(MACHUCVU , TENCHUCVU , VITRI)
   VALUES (N'LT001' , N'LỄ TÂN ' , N'NHÂN VIÊN')
 INSERT INTO CHUCVU(MACHUCVU , TENCHUCVU , VITRI)
   VALUES (N'LT002' , N'LỄ TÂN ' , N'QUẢN LÝ')
    






   SELECT * FROM CHUCVU
--thiet lap nhan vien
INSERT INTO NhanVien (MaNV, MaND, NgayVaoLam, Luong)
VALUES (1, 1, '2020-01-01', 10000000.0);
INSERT INTO NhanVien (MaNV, MaND, NgayVaoLam, Luong)
VALUES (2, 2, '2020-01-01', 10000000.0);
INSERT INTO NhanVien (MaNV, MaND, NgayVaoLam, Luong)
VALUES (3, 3, '2020-01-01', 10000000.0);
INSERT INTO NhanVien (MaNV, MaND, NgayVaoLam, Luong)
VALUES (4, 4, '2020-01-01', 10000000.0);
INSERT INTO NhanVien (MaNV, MaND, NgayVaoLam, Luong)
VALUES (5, 5, '2020-01-01', 10000000.0);
INSERT INTO NhanVien (MaNV, MaND, NgayVaoLam, Luong)
VALUES (6, 6, '2020-01-01', 10000000.0);
INSERT INTO NhanVien (MaNV, MaND, NgayVaoLam, Luong)
VALUES (7, 7, '2020-01-01', 10000000.0);
INSERT INTO NhanVien (MaNV, MaND, NgayVaoLam, Luong)
VALUES (8, 8, '2020-01-01', 10000000.0);
INSERT INTO NhanVien (MaNV, MaND, NgayVaoLam, Luong)
VALUES (9, 9, '2020-01-01', 10000000.0);
INSERT INTO NhanVien (MaNV, MaND, NgayVaoLam, Luong)
VALUES (10 ,10, '2020-01-01', 10000000.0);
INSERT INTO NhanVien (MaNV, MaND, NgayVaoLam, Luong)
VALUES (11, 11, '2020-01-01', 10000000.0);
INSERT INTO NhanVien (MaNV, MaND, NgayVaoLam, Luong)
VALUES (12 ,12, '2020-01-01', 10000000.0);
INSERT INTO NhanVien (MaNV, MaND, NgayVaoLam, Luong)
VALUES (13,13, '2020-01-01', 10000000.0);
INSERT INTO NhanVien (MaNV, MaND, NgayVaoLam, Luong)
VALUES (14, 14, '2020-01-01', 10000000.0);
INSERT INTO NhanVien (MaNV, MaND, NgayVaoLam, Luong)
VALUES (15, 15, '2020-01-01', 10000000.0);
INSERT INTO NhanVien (MaNV, MaND, NgayVaoLam, Luong)
VALUES (16, 16, '2020-01-01', 10000000.0);
INSERT INTO NhanVien (MaNV, MaND, NgayVaoLam, Luong)
VALUES (17, 17, '2020-01-01', 10000000.0);
INSERT INTO NhanVien (MaNV, MaND, NgayVaoLam, Luong)
VALUES (18, 18, '2020-01-01', 10000000.0);
INSERT INTO NhanVien (MaNV, MaND, NgayVaoLam, Luong)
VALUES (19, 19, '2020-01-01', 10000000.0);
INSERT INTO NhanVien (MaNV, MaND, NgayVaoLam, Luong)
VALUES (20, 20, '2020-01-01', 10000000.0);
--nhacungcap
INSERT INTO NhaCungCap (MaNCC, TenNCC, DiaChi, DienThoai) VALUES
(1, 'Công ty TNHH A', N'Địa chỉ A', '0123456789');
INSERT INTO NhaCungCap (MaNCC, TenNCC, DiaChi, DienThoai) VALUES
(2, 'Công ty TNHH B', N'Địa chỉ B', '0123456781');
INSERT INTO NhaCungCap (MaNCC, TenNCC, DiaChi, DienThoai) VALUES
(3, 'Công ty TNHH C', N'Địa chỉ C', '0123456783');
INSERT INTO NhaCungCap (MaNCC, TenNCC, DiaChi, DienThoai) VALUES
(4, 'Công ty TNHH D', N'Địa chỉ D', '0123456784');
INSERT INTO NhaCungCap (MaNCC, TenNCC, DiaChi, DienThoai) VALUES
(5, 'Công ty TNHH E', N'Địa chỉ E', '0123456789');
INSERT INTO NhaCungCap (MaNCC, TenNCC, DiaChi, DienThoai) VALUES
(6, 'Công ty TNHH F', N'Địa chỉ F', '0123456711');
INSERT INTO NhaCungCap (MaNCC, TenNCC, DiaChi, DienThoai) VALUES
(7, 'Công ty TNHH G', N'Địa chỉ G', '0123456719');
INSERT INTO NhaCungCap (MaNCC, TenNCC, DiaChi, DienThoai) VALUES
(8, 'Công ty TNHH H', N'Địa chỉ H', '0123456729');
INSERT INTO NhaCungCap (MaNCC, TenNCC, DiaChi, DienThoai) VALUES
(9, 'Công ty TNHH J', N'Địa chỉ J', '0123456739');
INSERT INTO NhaCungCap (MaNCC, TenNCC, DiaChi, DienThoai) VALUES
(10, 'Công ty TNHH K', N'Địa chỉ K', '0123456749');
INSERT INTO NhaCungCap (MaNCC, TenNCC, DiaChi, DienThoai) VALUES
(11, 'Công ty TNHH L', N'Địa chỉ L', '0123456759');
INSERT INTO NhaCungCap (MaNCC, TenNCC, DiaChi, DienThoai) VALUES
(12, 'Công ty TNHH M', N'Địa chỉ M', '01239');
INSERT INTO NhaCungCap (MaNCC, TenNCC, DiaChi, DienThoai) VALUES
(13, 'Công ty TNHH N', N'Địa chỉ N', '0123489');
INSERT INTO NhaCungCap (MaNCC, TenNCC, DiaChi, DienThoai) VALUES
(14, 'Công ty TNHH V', N'Địa chỉ V', '01456789');
INSERT INTO NhaCungCap (MaNCC, TenNCC, DiaChi, DienThoai) VALUES
(15, 'Công ty TNHH X', N'Địa chỉ X', '0126789');
INSERT INTO NhaCungCap (MaNCC, TenNCC, DiaChi, DienThoai) VALUES
(16, 'Công ty TNHH Z', N'Địa chỉ Z', '01234589');
INSERT INTO NhaCungCap (MaNCC, TenNCC, DiaChi, DienThoai) VALUES
(17, 'Công ty TNHH Q', N'Địa chỉ Q', '01234569');
INSERT INTO NhaCungCap (MaNCC, TenNCC, DiaChi, DienThoai) VALUES
(18, 'Công ty TNHH E', N'Địa chỉ E', '0123456');
INSERT INTO NhaCungCap (MaNCC, TenNCC, DiaChi, DienThoai) VALUES
(19, 'Công ty TNHH W', N'Địa chỉ W', '019');
INSERT INTO NhaCungCap (MaNCC, TenNCC, DiaChi, DienThoai) VALUES
(20, 'Công ty TNHH R', N'Địa chỉ R', '01149');
--thuonghieu
INSERT INTO ThuongHieu (MaTH, TenTH)
VALUES 
    (1, 'Apple'),
    (2, 'Samsung'),
    (3, 'Sony'),
    (4, 'LG'),
    (5, 'Asus'),
    (6, 'Dell'),
    (7, 'Lenovo'),
    (8, 'HP'),
    (9, 'Microsoft'),
    (10, 'Acer'),
    (11, 'Nokia'),
    (12, 'HTC'),
    (13, 'Huawei'),
    (14, 'Xiaomi'),
    (15, 'Oppo'),
    (16, 'Vivo'),
    (17, 'Realme'),
    (18, 'OnePlus'),
    (19, 'Google'),
    (20, 'Motorola');
	--sanpha,
	INSERT INTO SanPham (MaSP, TenSP, MaTH, MaNCC, DonGia, SoLuong)
VALUES 
    (1, 'iphone7', 1, 1, 100000, 10),
    (2, 'iphone11', 1, 1, 200000, 20),
    (3, 'iphone14', 1, 1, 300000, 30),
    (4, 'samsung e2', 2, 2, 400000, 40),
    (5, 'samsung e3', 2, 2, 500000, 50),
    (6, 'samsung e4', 2, 2, 600000, 60),
    (7, 'sony x1', 3, 3, 700000, 70),
    (8, 'sony x2', 3, 3, 800000, 80),
    (9, 'sony x3', 3, 3, 900000, 90),
    (10, 'lg v30', 4, 4, 1000000, 100),
    (11, 'lg v40', 4, 4, 1100000, 110),
    (12, 'lg v50', 4, 4, 1200000, 120),
    (13, 'asus gaming 1', 5, 5, 1300000, 130),
    (14, 'asus gaming 2', 5, 5, 1400000, 140),
    (15, 'asus gaming 3', 5, 5, 1500000, 150),
    (16, 'xioami 7', 6, 14, 1600000, 160),
    (17, 'xioami 8', 6, 14, 1700000, 170),
    (18, 'xioami 8 pro', 6, 14, 1800000, 180),
    (19, 'Realme 3', 7, 17, 1900000, 190),
    (20, 'Realme 4', 7, 17, 2000000, 200);
	


--donhang
INSERT INTO DonHang (MaDH, MaKH, NgayDatHang, TongTien)
VALUES (1, 2, '2023-05-14', 1000000);
INSERT INTO DonHang (MaDH, MaKH, NgayDatHang, TongTien)
VALUES (2, 2, '2023-05-14', 1000000);
INSERT INTO DonHang (MaDH, MaKH, NgayDatHang, TongTien)
VALUES (3, 3, '2023-05-14', 1000000);
INSERT INTO DonHang (MaDH, MaKH, NgayDatHang, TongTien)
VALUES (4, 4, '2023-05-14', 1000000);
INSERT INTO DonHang (MaDH, MaKH, NgayDatHang, TongTien)
VALUES (5, 6, '2023-05-14', 1000000);
INSERT INTO DonHang (MaDH, MaKH, NgayDatHang, TongTien)
VALUES (6, 7, '2023-05-14', 1000000);
INSERT INTO DonHang (MaDH, MaKH, NgayDatHang, TongTien)
VALUES (7, 8, '2023-05-14', 1000000);
INSERT INTO DonHang (MaDH, MaKH, NgayDatHang, TongTien)
VALUES (8, 9, '2023-05-14', 1000000);
INSERT INTO DonHang (MaDH, MaKH, NgayDatHang, TongTien)
VALUES (9,10, '2023-05-12', 1000000);
INSERT INTO DonHang (MaDH, MaKH, NgayDatHang, TongTien)
VALUES (10, 11, '2023-05-4', 1000000);
INSERT INTO DonHang (MaDH, MaKH, NgayDatHang, TongTien)
VALUES (11, 12, '2023-05-14', 1000000);
INSERT INTO DonHang (MaDH, MaKH, NgayDatHang, TongTien)
VALUES (12, 13, '2023-05-14', 1000000);
INSERT INTO DonHang (MaDH, MaKH, NgayDatHang, TongTien)
VALUES (13, 15, '2023-05-11', 1000000);
INSERT INTO DonHang (MaDH, MaKH, NgayDatHang, TongTien)
VALUES (14, 14, '2023-05-05', 1000000);
INSERT INTO DonHang (MaDH, MaKH, NgayDatHang, TongTien)
VALUES (15,16, '2023-05-10', 1000000);
INSERT INTO DonHang (MaDH, MaKH, NgayDatHang, TongTien)
VALUES (16, 17, '2023-05-11', 1000000);
INSERT INTO DonHang (MaDH, MaKH, NgayDatHang, TongTien)
VALUES (17, 18, '2023-05-14', 1000000);
INSERT INTO DonHang (MaDH, MaKH, NgayDatHang, TongTien)
VALUES (18, 15, '2023-05-12', 1000000);
INSERT INTO DonHang (MaDH, MaKH, NgayDatHang, TongTien)
VALUES (19, 20, '2023-05-15', 1000000);
INSERT INTO DonHang (MaDH, MaKH, NgayDatHang, TongTien)
VALUES (20, 20, '2023-05-13', 1000000);

--   -----------PHIEUDANGKY----------
INSERT INTO PHIEUDANGKY (MAPHIEUDANGKY , MaKH , MaNV)
 VALUES (N'MPDK01' , 1 ,1 )
INSERT INTO PHIEUDANGKY (MAPHIEUDANGKY , MaKH , MaNV)
 VALUES (N'MPDK02' , 2 ,2 )
INSERT INTO PHIEUDANGKY (MAPHIEUDANGKY , MaKH , MaNV )
 VALUES (N'MPDK03' , 3 ,3 )
INSERT INTO PHIEUDANGKY (MAPHIEUDANGKY , MaKH , MaNV)
 VALUES (N'MPDK04' , 4 ,4 )
INSERT INTO PHIEUDANGKY (MAPHIEUDANGKY , MaKH , MaNV)
 VALUES (N'MPDK05' , 5 ,5 )
INSERT INTO PHIEUDANGKY (MAPHIEUDANGKY , MaKH , MaNV)
 VALUES (N'MPDK06' , 6 ,6 )
INSERT INTO PHIEUDANGKY (MAPHIEUDANGKY , MaKH , MaNV)
 VALUES (N'MPDK07' , 7 ,7 )
INSERT INTO PHIEUDANGKY (MAPHIEUDANGKY , MaKH , MaNV)
 VALUES (N'MPDK08' , 8 ,8 )
INSERT INTO PHIEUDANGKY (MAPHIEUDANGKY , MaKH , MaNV)
 VALUES (N'MPDK09' , 9 ,9 )
INSERT INTO PHIEUDANGKY (MAPHIEUDANGKY , MaKH , MaNV )
 VALUES (N'MPDK10' , 10 ,10 )
INSERT INTO PHIEUDANGKY (MAPHIEUDANGKY , MaKH , MaNV)
 VALUES (N'MPDK11' , 11 ,11 )
INSERT INTO PHIEUDANGKY (MAPHIEUDANGKY , MaKH , MaNV)
 VALUES (N'MPDK12' , 12 ,12 )
INSERT INTO PHIEUDANGKY (MAPHIEUDANGKY , MaKH , MaNV)
 VALUES (N'MPDK13' , 13 ,13 )
INSERT INTO PHIEUDANGKY (MAPHIEUDANGKY , MaKH , MaNV)
 VALUES (N'MPDK14' , 14 ,14 )
INSERT INTO PHIEUDANGKY (MAPHIEUDANGKY , MaKH , MaNV)
 VALUES (N'MPDK15' , 15 ,15 )
INSERT INTO PHIEUDANGKY (MAPHIEUDANGKY , MaKH , MaNV)
 VALUES (N'MPDK16' , 16 ,16 )
INSERT INTO PHIEUDANGKY (MAPHIEUDANGKY , MaKH , MaNV)
 VALUES (N'MPDK17' , 17 ,17 )
INSERT INTO PHIEUDANGKY (MAPHIEUDANGKY , MaKH , MaNV)
 VALUES (N'MPDK18' , 18 ,18 )
INSERT INTO PHIEUDANGKY (MAPHIEUDANGKY , MaKH , MaNV)
 VALUES (N'MPDK19' , 19 ,19 )
INSERT INTO PHIEUDANGKY (MAPHIEUDANGKY , MaKH , MaNV)
 VALUES (N'MPDK20' , 20 ,20 )


  
SELECT * FROM PHIEUDANGKY
--chitietdonhang
INSERT INTO ChiTietDonHang (MaDH, MaSP, SoLuong)
VALUES
(1, 1, 2),
(1, 2, 1),
(2, 4, 3),
(2, 5, 1),
(2, 6, 2),
(3, 7, 1),
(3, 8, 2),
(3, 9, 3),
(4, 10, 2),
(4, 11, 1),
(4, 12, 1),
(5, 13, 3),
(5, 14, 1),
(5, 15, 2),
(6, 16, 2),
(6, 17, 1),
(6, 18, 1),
(7, 19, 1),
(7, 20, 3),
(8, 1, 2);


--view thong tin cua nhanvien 
GO
CREATE VIEW View_NhanVien
AS
SELECT *
FROM NguoiDung
WHERE LaNhanVien = 0;
Go

--SELECT * FROM View_NhanVien;
GO
--view thong tin cua KhachHang 
CREATE VIEW View_KhachHang
AS
SELECT *
FROM NguoiDung
WHERE LaNhanVien = 1;
GO
--SELECT * FROM View_KhachHang
--view toan bo
CREATE VIEW View_ALl
AS
SELECT dbo.DonHang.MaDH, dbo.ChiTietDonHang.MaSP, dbo.KhachHang.MaKH, dbo.NguoiDung.MaND, dbo.NhaCungCap.MaNCC, dbo.NhanVien.MaNV, dbo.ThuongHieu.MaTH, dbo.SanPham.TenSP, dbo.SanPham.SoLuong, dbo.SanPham.DonGia, 
                  dbo.DonHang.NgayDatHang, dbo.DonHang.TongTien, dbo.KhachHang.LaNhanVien, dbo.NguoiDung.HoTen, dbo.NguoiDung.NgaySinh, dbo.NguoiDung.GioiTinh, dbo.NguoiDung.DiaChi, dbo.NguoiDung.SoDienThoai, dbo.NguoiDung.Email, 
                  dbo.NhaCungCap.TenNCC, dbo.NhaCungCap.DienThoai, dbo.NhanVien.NgayVaoLam, dbo.NhanVien.Luong, dbo.ThuongHieu.TenTH
FROM     dbo.ChiTietDonHang INNER JOIN
                  dbo.DonHang ON dbo.ChiTietDonHang.MaDH = dbo.DonHang.MaDH AND dbo.ChiTietDonHang.MaDH = dbo.DonHang.MaDH INNER JOIN
                  dbo.KhachHang ON dbo.DonHang.MaKH = dbo.KhachHang.MaKH INNER JOIN
                  dbo.NguoiDung ON dbo.KhachHang.MaND = dbo.NguoiDung.MaND INNER JOIN
                  dbo.NhanVien ON dbo.NguoiDung.MaND = dbo.NhanVien.MaND INNER JOIN
                  dbo.SanPham ON dbo.ChiTietDonHang.MaSP = dbo.SanPham.MaSP AND dbo.ChiTietDonHang.MaSP = dbo.SanPham.MaSP INNER JOIN
                  dbo.NhaCungCap ON dbo.SanPham.MaNCC = dbo.NhaCungCap.MaNCC INNER JOIN
                  dbo.ThuongHieu ON dbo.SanPham.MaTH = dbo.ThuongHieu.MaTH
				  GO
-- lấy danh sách khách hàng
SELECT * FROM NguoiDung Where LaNhanVien = 1; 
--lấy danhh sách nhà cung cấp
SELECT * FROM NhaCungCap;
--Lấy danh sách sản phẩm còn lại trong kho có số lượng lớn hơn 0:
SELECT * FROM SanPham WHERE SoLuong > 0;
--Lấy thông tin tất cả đơn hàng của một khách hàng cụ thể:
SELECT * FROM DonHang WHERE MaKH = 2;
--Lấy thông tin tất cả sản phẩm của một thương hiệu cụ thể
SELECT * FROM SanPham WHERE MaTH = 1;
--Lấy thông tin tất cả đơn hàng trong một khoảng thời gian cụ thể
SELECT * FROM DonHang WHERE NgayDatHang BETWEEN 05 AND 18;
--Lấy thông tin chi tiết đơn hàng của một đơn hàng cụ thể
SELECT * FROM ChiTietDonHang WHERE MaDH =5;
--Lấy danh sách tất cả khách hàng và lịch sử đặt hàng của họ
SELECT kh.MaKH, nd.HoTen, dh.MaDH, dh.NgayDatHang, dh.TongTien
FROM KhachHang kh
JOIN NguoiDung nd ON kh.MaND = nd.MaND
JOIN DonHang dh ON kh.MaKH = dh.MaKH
--Nhận danh sách tất cả các sản phẩm và thông tin về nhà cung cấp và thương hiệu tương ứng của chúng:
SELECT sp.MaSP, sp.TenSP, th.TenTH, ncc.TenNCC, sp.DonGia, sp.SoLuong
FROM SanPham sp
JOIN ThuongHieu th ON sp.MaTH = th.MaTH
JOIN NhaCungCap ncc ON sp.MaNCC = ncc.MaNCC
--Nhận danh sách tất cả các đơn đặt hàng và các sản phẩm và số lượng tương ứng của chúng:
SELECT dh.MaDH, sp.TenSP, ctdh.SoLuong
FROM DonHang dh
JOIN ChiTietDonHang ctdh ON dh.MaDH = ctdh.MaDH
JOIN SanPham sp ON ctdh.MaSP = sp.MaSP
--Nhận danh sách tất cả nhân viên và thông tin cá nhân và công việc tương ứng của họ
SELECT nv.MaNV, nd.HoTen, nd.NgaySinh, nd.GioiTinh, nd.DiaChi, nd.SoDienThoai, nd.Email, nv.NgayVaoLam, nv.Luong
FROM NhanVien nv
JOIN NguoiDung nd ON nv.MaND = nd.MaND
--Lấy danh sách tất cả các thương hiệu và sản phẩm tương ứng của họ:
SELECT th.TenTH, sp.TenSP
FROM ThuongHieu th
JOIN SanPham sp ON th.MaTH = sp.MaTH
--Lấy tổng số đơn hàng được đặt trong một khoảng thời gian được chỉ định:
GO
CREATE FUNCTION GetProductsSoldByDay (@Date DATE)
RETURNS TABLE
AS
RETURN (
    SELECT SP.*, SUM(CTDH.SoLuong) AS SoLuongBan, SUM(SP.DonGia * CTDH.SoLuong) AS DoanhThu
    FROM SanPham SP
    INNER JOIN ChiTietDonHang CTDH ON SP.MaSP = CTDH.MaSP
    INNER JOIN DonHang DH ON CTDH.MaDH = DH.MaDH
    WHERE DH.NgayDatHang = @Date
    GROUP BY SP.MaSP, SP.TenSP, SP.MaTH, SP.MaNCC, SP.DonGia, SP.SoLuong
);
GO
SELECT* FROM GetProductsSoldByDay ('2023-05-14');
--Hàm truy vấn danh sách đơn hàng của một khách hàng theo mã khách hàng
GO
CREATE FUNCTION GetBestSellingProduct(@FromDate DATE, @ToDate DATE)
RETURNS TABLE
AS
RETURN
    SELECT TOP 1 sp.MaSP, sp.TenSP, th.TenTH, SUM(ct.SoLuong) AS TongSoLuong
    FROM SanPham sp
    JOIN ChiTietDonHang ct ON sp.MaSP = ct.MaSP
    JOIN DonHang dh ON ct.MaDH = dh.MaDH
    JOIN ThuongHieu th ON sp.MaTH = th.MaTH
    WHERE dh.NgayDatHang BETWEEN @FromDate AND @ToDate
    GROUP BY sp.MaSP, sp.TenSP, th.TenTH
    ORDER BY SUM(ct.SoLuong) DESC;
	GO
SELECT * FROM GetBestSellingProduct('2023-05-4','2023-05-14')
--Hàm truy vấn thông tin chi tiết đơn hàng theo mã đơn hàng
GO
CREATE FUNCTION GetOrderDetailsByOrderId(@MaDH INT)
RETURNS TABLE
AS
RETURN
    SELECT sp.TenSP, th.TenTH, ct.SoLuong, sp.DonGia
    FROM ChiTietDonHang ct
    JOIN SanPham sp ON ct.MaSP = sp.MaSP
    JOIN ThuongHieu th ON sp.MaTH = th.MaTH
    WHERE ct.MaDH = @MaDH;
GO
-- TÌM THÔNG TIN NHÂN VIÊN BẰNG MaNV
			    -- TẠO STORE
		 CREATE PROC SP_NhanVien 
			@MaNV NCHAR(50)
			AS 
			 BEGIN 
			  SELECT * FROM NhanVien WHERE MaNV = @MaNV
			 END
			GO

		 -- THỰC THI :
			--EXEC SP_NhanVien @MaNV = '5'
			GO
SELECT * FROM GetOrderDetailsByOrderId(1)
-- lấy ra số lượng sản phẩm của một thương hiệu:
GO
CREATE FUNCTION dbo.GetNumberOfProductsByBrand(@brandName VARCHAR(50))
RETURNS INT
AS
BEGIN
    DECLARE @numOfProducts INT;
    SELECT @numOfProducts = COUNT(*)
    FROM SanPham
    WHERE MaTH = (SELECT MaTH FROM ThuongHieu WHERE TenTH = @brandName);
    RETURN @numOfProducts;
END
GO
SELECT dbo.GetNumberOfProductsByBrand('Apple');

-- lấy ra giá trung bình của một sản phẩm trong một thương hiệu:
GO
CREATE FUNCTION dbo.GetAveragePriceByBrand(@brandName VARCHAR(50))
RETURNS FLOAT
AS
BEGIN
    DECLARE @avgPrice FLOAT;
    SELECT @avgPrice = AVG(DonGia)
    FROM SanPham
    WHERE MaTH = (SELECT MaTH FROM ThuongHieu WHERE TenTH = @brandName);
    RETURN @avgPrice;
END
GO
SELECT dbo.GetAveragePriceByBrand('lg');
--IN RA THÔNG TIN NGƯỜI DÙNG VÀ THÔNG TIN NHÂN VIÊN TRONG PHIEU ĐĂNG KÝ
GO
CREATE FUNCTION TAKE_INFOR() 
			     RETURNS @TABLE  TABLE
				 (
				   ID NCHAR(50),
				   TEN NVARCHAR(100),
				   GIOITINH BIT ,
				   DIACHI NVARCHAR(100),
				   SDT INT
				 )
			   AS 
			   BEGIN 
			     INSERT INTO @TABLE 
				   SELECT KH.MaKH , KH.MaND FROM KHACHHANG AS KH , PHIEUDANGKY AS PDK 
				     WHERE KH.MaKH = PDK.MaKH


			       INSERT INTO @TABLE 
				   SELECT NV.MaNV , NV.MaND , NV.Ngayvaolam , NV.Luong FROM NHANVIEN AS NV , PHIEUDANGKY AS PDK 
				     WHERE NV.MaNV = PDK.MaNV

				RETURN
			   END
            GO
-- lấy ra số lượng đơn hàng của một khách hàng:
GO
CREATE FUNCTION dbo.GetNumberOfOrdersByCustomer(@customerId INT)
RETURNS INT
AS
BEGIN
    DECLARE @numOfOrders INT;
    SELECT @numOfOrders = COUNT(*)
    FROM DonHang
    WHERE MaKH = @customerId;
    RETURN @numOfOrders;
END
GO
SELECT dbo.GetNumberOfOrdersByCustomer(12);

--Hàm truy vấn danh sách sản phẩm thuộc một thương hiệu xác định
Go
CREATE FUNCTION GetProductsByBrand(@MaTH INT)
RETURNS TABLE
AS
RETURN
    SELECT sp.MaSP, sp.TenSP, sp.DonGia, sp.SoLuong, ncc.TenNCC
    FROM SanPham sp
    JOIN NhaCungCap ncc ON sp.MaNCC = ncc.MaNCC
    WHERE sp.MaTH = @MaTH;
	GO
SELECT * FROM GetProductsByBrand(1)
--Hàm truy vấn danh sách sản phẩm có số lượng trong kho dưới một ngưỡng xác định
GO
CREATE FUNCTION GetProductsUnderStockLevel(@StockLevel INT)
RETURNS TABLE
AS
RETURN
    SELECT sp.MaSP, sp.TenSP, sp.DonGia, sp.SoLuong, th.TenTH
    FROM SanPham sp
    JOIN ThuongHieu th ON sp.MaTH = th.MaTH
    WHERE sp.SoLuong < @StockLevel;
GO
SELECT *FROM GetProductsUnderStockLevel(14)

-- lấy thông tin đơn hàng theo ngày đặt hàng:
GO
CREATE PROCEDURE sp_ByDate
    @NgayDatHang DATE
AS
BEGIN
    SELECT *
    FROM DonHang
    WHERE NgayDatHang = @NgayDatHang
END
GO
--EXEC sp_ByDate '2023-05-14';

-- LẤY RA SỐ LƯỢNG ĐƠN HÀNG CÒN TỒN
	    CREATE FUNCTION EMPTY_ChiTietDonHang()
		 RETURNS INT 
		  AS
		   BEGIN
		    DECLARE @SoLuong INT
			SELECT @SoLuong =  COUNT(SoLuong) FROM ChiTietDonHang
			WHERE SoLuong = 1
			RETURN @SoLuong
	       END
		 GO

	     --  SELECT  DBO.EMPTY_ChiTietDonHang() AS SoLuong
		   SELECT * FROM ChiTietDonHang
--Stored procedure cập nhật số lượng sản phẩm trong kho:
GO
CREATE PROCEDURE sp_UpdateProductQuantity
    @MaSP INT,
    @SoLuong INT
AS
BEGIN
    UPDATE SanPham
    SET SoLuong = SoLuong - @SoLuong
    WHERE MaSP = @MaSP
END
--EXEC sp_UpdateProductQuantity @MaSP = 1, @SoLuong = 20;

--Stored procedure thêm mới một sản phẩm vào danh sách sản phẩm:
GO
CREATE PROCEDURE sp_InsertProduct
    @TenSP VARCHAR(50),
    @MaTH INT,
    @MaNCC INT,
    @DonGia INT,
    @SoLuong INT
AS
BEGIN
    INSERT INTO SanPham (TenSP, MaTH, MaNCC, DonGia, SoLuong)
    VALUES (@TenSP, @MaTH, @MaNCC, @DonGia, @SoLuong);
END
EXEC sp_InsertProduct @TenSP = 'New ', @MaTH = 1, @MaNCC = 1, @DonGia = 100, @SoLuong = 50;


-- để kiểm tra và cập nhật số lượng sản phẩm tồn kho sau khi có đơn đặt hàng mới được thêm vào:
GO
CREATE TRIGGER update_inventory_on_order
ON ChiTietDonHang
AFTER INSERT
AS
BEGIN
    UPDATE SanPham
    SET SoLuong = SanPham.SoLuong - inserted.SoLuong
    FROM SanPham
    JOIN inserted ON SanPham.MaSP = inserted.MaSP
END
GO
--cập nhập đơn giá sản phẩm
CREATE TRIGGER update_product_price
ON SanPham
FOR UPDATE
AS
BEGIN
	UPDATE SanPham
	SET DonGia = inserted.DonGia
	FROM SanPham
	INNER JOIN inserted ON SanPham.MaSP = inserted.MaSP
END;

 --sửa địa chỉ khách hàng
GO
CREATE TRIGGER tr_UpdateDiaChi_KhachHang
ON NguoiDung
AFTER UPDATE
AS
BEGIN
    IF UPDATE(DiaChi)
    BEGIN
        UPDATE NguoiDung
        SET DiaChi = inserted.DiaChi
        FROM NguoiDung
        INNER JOIN inserted ON NguoiDung.MaND = inserted.MaND
        INNER JOIN deleted ON inserted.MaND = deleted.MaND
    END
END;
--Trigger để tự động cập nhật số lượng sản phẩm sau khi thêm đơn hàng
GO
CREATE TRIGGER CapNhatSoLuongSanPham
ON ChiTietDonHang
AFTER INSERT
AS
BEGIN
    UPDATE SP
    SET SP.SoLuong = SP.SoLuong - I.SoLuong
    FROM SanPham SP
    JOIN inserted I ON SP.MaSP = I.MaSP
END

--Trigger để kiểm tra tính hợp lệ khi thêm khách hàng
GO
CREATE TRIGGER KiemTraKhachHangHopLe
ON KhachHang
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted
        JOIN NguoiDung ON inserted.MaND = NguoiDung.MaND
        WHERE NguoiDung.LaNhanVien = 1
    )
    BEGIN
        RAISERROR ('Không thể thêm khách hàng là nhân viên.', 16, 1)
        ROLLBACK TRANSACTION
    END
    ELSE
    BEGIN
        INSERT INTO KhachHang (MaKH, MaND, LaNhanVien)
        SELECT MaKH, MaND, LaNhanVien
        FROM inserted
    END
END
--Trigger để tự động tạo mã đơn hàng khi thêm đơn hàng
GO
CREATE TRIGGER TaoMaDonHang
ON DonHang
INSTEAD OF INSERT
AS
BEGIN
    INSERT INTO DonHang (MaDH, MaKH, NgayDatHang, TongTien)
    SELECT
        CONCAT('DH', RIGHT('00000' + CAST((SELECT MAX(MaDH) FROM DonHang) + ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS VARCHAR), 5)),
        MaKH, NgayDatHang, TongTien
    FROM inserted
END
--Trigger để kiểm tra tính hợp lệ khi cập nhật thông tin nhân viên
GO
CREATE TRIGGER KiemTraCapNhatNhanVien
ON NhanVien
INSTEAD OF UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted
        JOIN NguoiDung ON inserted.MaND = NguoiDung.MaND
        WHERE NguoiDung.LaNhanVien = 0
    )
    BEGIN
        RAISERROR ('Không thể cập nhật thông tin của khách hàng.', 16, 1)
        ROLLBACK TRANSACTION
    END
    ELSE
    BEGIN
        UPDATE NhanVien
        SET MaND = inserted.MaND, NgayVaoLam = inserted.NgayVaoLam, Luong = inserted.Luong
        FROM NhanVien
        JOIN inserted ON NhanVien.MaNV = inserted.MaNV
    END
END


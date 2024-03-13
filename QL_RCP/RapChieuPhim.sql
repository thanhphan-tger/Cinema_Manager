create database RapChieuPhim
go
use RapChieuPhim
go
create table dienvien
(
	madienvien char(10) primary key not null,
	tendienvien nvarchar(50),
	ngaysinh date
)
create table theloai
(
	matheloai char(10) primary key not null,
	tentheloai nvarchar(50)
)
create table daodien
(
	madaodien char(10) primary key not null,
	tendaodien nvarchar(50),
	ngaysinh date
)
create table loairap
(
	maloairap char(10) primary key not null,
	tenloairap nvarchar(50)
)
create table thethanhvien
(
	mathethanhvien char(10) primary key not null,
	tenkhachhang nvarchar(50),
	ngaysinh date,
	diemtichluy int
)
create table rapphim
(
	marap char(10) primary key not null,
	tenrap nvarchar(50),
	succhua int,
	tinhtrang nvarchar(50),
	maloairap char(10)
)
create table chucvu
(
	macv char(10) primary key not null,
	tencv nvarchar(50)
)
create table nhanvien
(
	manhanvien char(10) primary key not null,
	tennhanvien nvarchar(50),
	sdt char(11),
	ngaysinh date,
	password char(20),
	macv char(10)
)
create table hoadondv
(
	mahoadon char(10) primary key not null,
	ngaylap date,
	manhanvien char(10),
	tongtien float
)
create table dichvu
(
	madichvu char(10) primary key not null,
	tendichvu nvarchar(50),
	giadv float,
	maloaidv char(10)
)
create table ct_hoadondv
(
	mahoadon char(10),
	madichvu char(10),
	soluong  int,
	giadv float,
	primary key(mahoadon,madichvu)
)
create table loaidichvu
(
	maloaidv char(10) primary key not null,
	tenloaidv nvarchar(50)
)
create table danhmuchang
(
	madanhmuc char(10) primary key not null,
	tendanhmuc nvarchar(50)
)
create table donvitinh
(
	madvt char(10) primary key not null,
	tendvt nvarchar(50)
)
create table nhacungcap
(
	mancc char(10) primary key not null,
	tenncc nvarchar(50),
	diachi nvarchar(200),
	sdt char(11)
)
create table mathang
(
	mamathang char(10) primary key not null,
	tenmathang nvarchar(50),
	soluong int,
	giamathang float,
	madanhmuc char(10),
	mancc char(10),
	madvt char(10)
)
create table ct_dichvu
(
	madichvu char(10),
	mamathang char(10),
	soluong int
	primary key (madichvu,mamathang)
)
create table phieunhaphang
(
	maphieunhap char(10) primary key not null,
	ngaylap date,
	manhanvien char(10),
	tinhtrang nvarchar(50)
)
create table ct_phieunhaphang
(
	mamathang char(10),
	maphieunhap char(10),
	soluong int,
	primary key(mamathang, maphieunhap)
)
create table phieunhanhang
(
	maphieunhan char(10) primary key not null,
	ngaynhan date,
	manhanvien char(10),
	maphieunhap char(10),
	tongtien float
)
create table ct_phieunhanhang
(
	maphieunhan char(10),
	mamathang char(10),
	gia float,
	soluong int,
	ngaynhan date
)
create table nhasanxuat
(
	mansx char(10) primary key not null,
	tennxs nvarchar(50)
)
create table loaighe
(
	maloaighe char(10) primary key not null,
	tenloaighe nvarchar(50)
)
create table ghe
(
	maghe char(10) primary key not null,
	maloaighe char(10),
	giaghe float,
	mansx char(10),
	madvt char(10)
)
create table thietbi
(
	mathietbi char(10) primary key not null,
	tenthietbi nvarchar(50),
	tinhtrang nvarchar(50),
	mansx char(10),
	madvt char(10),
	marap char(10)
)
create table loaigioihantuoi
(
	maloaigioihantuoi char(10) primary key not null,
	tenloaigioihantuoi nvarchar(50)
)
create table phim
(
	maphim char(10) primary key not null,
	tenphim nvarchar(50),
	ngaysanxuat date,
	maloaigioihantuoi char(10),
	tomtat nvarchar(MAX),
	thoiluong int,
	mansx char(10) not null,
	madaodien char(10),
	madienvien char(10),
	matheloai char(10)
)
create table ct_dienvien
(
	maphim char(10),
	madienvien char(10),
	vaidien nvarchar(50),
	primary key(maphim, madienvien)
)
create table suatchieu
(
	masuatchieu char(10) primary key not null,
	ngaychieu date,
	batdau date,
	ketthuc date,
	maphim char(10),
	marap char(10)
)
create table vexemphim
(
	mave char(10) primary key not null,
	maphim char(10),
	marap char(10),
	mathethanhvien char(10),
	masuatchieu char(10),
	giave float,
	maghe char(10),
	manhanvien char(10)
)
create table ct_theloai
(
	maphim char(10),
	matheloai char(10)
)


--Khóa ngoại
alter table ct_theloai
add constraint FK_CTTHELOAI_PHIM foreign key (maphim) references phim(maphim)
alter table ct_theloai
add constraint FK_CTTHELOAI_THELOAI foreign key (matheloai) references theloai(matheloai)

alter table phim
add constraint FK_PHIM_NSX foreign key (mansx) references nhasanxuat(mansx) --lỗi
alter table phim
add constraint FK_PHIM_DAODIEN foreign key (madaodien) references daodien(madaodien)
alter table phim
add constraint FK_PHIM_DIENVIEN foreign key (madienvien) references dienvien(madienvien)
alter table phim
add constraint FK_PHIM_THELOAI foreign key (matheloai) references theloai(matheloai)
alter table phim
add constraint FK_PHIM_LOAIGIOIHANTUOI foreign key (maloaigioihantuoi) references loaigioihantuoi(maloaigioihantuoi)

alter table nhanvien
add constraint FK_NHANVIEN_CHUCVU foreign key (macv) references chucvu(macv)

alter table ct_dienvien
add constraint FK_CTDIENVIEN_PHIM foreign key (maphim) references phim(maphim)
alter table ct_dienvien
add constraint FK_CTDIENVIEN_DIENVIEN foreign key (madienvien) references dienvien(madienvien)

alter table suatchieu
add constraint FK_SUATCHIEU_PHIM foreign key (maphim) references phim(maphim)
alter table suatchieu
add constraint FK_SUATCHIEU_RAPPHIM foreign key (marap) references rapphim(marap)

alter table rapphim
add constraint FK_RAPPHIM_LOAIRAP foreign key (maloairap) references loairap(maloairap)

alter table vexemphim
add constraint FK_VEXEMPHIM_PHIM foreign key (maphim) references phim(maphim)
alter table vexemphim
add constraint FK_VEXEMPHIM_RAPPHIM foreign key (marap) references rapphim(marap)
alter table vexemphim
add constraint FK_VEXEMPHIM_THETHANHVIEN foreign key (mathethanhvien) references thethanhvien(mathethanhvien)
alter table vexemphim
add constraint FK_VEXEMPHIM_SUATCHIEU foreign key (masuatchieu) references suatchieu(masuatchieu)
alter table vexemphim
add constraint FK_VEXEMPHIM_GHE foreign key (maghe) references ghe(maghe)
alter table vexemphim
add constraint FK_VEXEMPHIM_NHANVIEN foreign key (manhanvien) references nhanvien(manhanvien)

alter table hoadondv
add constraint FK_HOADONDV_NHANVIEN foreign key (manhanvien) references nhanvien(manhanvien)

alter table ct_hoadondv
add constraint FK_CTHOADONDV_HOADONDV foreign key (mahoadon) references hoadondv(mahoadon)
alter table ct_hoadondv
add constraint FK_CTHOADONDV_DICHVU foreign key (madichvu) references dichvu(madichvu)

alter table thietbi
add constraint FK_THIETBI_NHASANXUAT foreign key (mansx) references nhasanxuat(mansx)--lỗi
alter table thietbi
add constraint FK_THIETBI_DONVITINH foreign key (madvt) references donvitinh(madvt)

alter table ghe
add constraint FK_GHE_LOAIGHE foreign key (maloaighe) references loaighe(maloaighe)
alter table ghe
add constraint FK_GHE_NHASANXUAT foreign key (mansx) references nhasanxuat(mansx)--lỗi
alter table ghe
add constraint FK_GHE_DONVITINH foreign key (madvt) references donvitinh(madvt)

alter table mathang
add constraint FK_MATHANG_DANHMUCHANG foreign key (madanhmuc) references danhmuchang(madanhmuc)
alter table mathang
add constraint FK_MATHANG_NHACUNGCAP foreign key (mancc) references nhacungcap(mancc)
alter table mathang
add constraint FK_MATHANG_DONVITINH foreign key (madvt) references donvitinh(madvt)

alter table phieunhaphang
add constraint FK_PHIEUNHAPHANG_NHANVIEN foreign key (manhanvien) references nhanvien(manhanvien)

alter table phieunhanhang
add constraint FK_PHIEUNHANHANG_NHANVIEN foreign key (manhanvien) references nhanvien(manhanvien)
alter table phieunhanhang
add constraint FK_PHIEUNHANHANG_PHIEUNHAPHANG foreign key (maphieunhap) references phieunhaphang(maphieunhap)

alter table ct_phieunhaphang
add constraint FK_CTPHIEUNHAPHANG_MATHANG foreign key (mamathang) references mathang(mamathang)
alter table ct_phieunhaphang
add constraint FK_CTPHIEUNHAPHANG_PHIEUNHAP foreign key (maphieunhap) references phieunhaphang(maphieunhap)

alter table ct_phieunhanhang
add constraint FK_CTPHIEUNHANHANG_MATHANG foreign key (mamathang) references mathang(mamathang)
alter table ct_phieunhanhang
add constraint FK_CTPHIEUNHANHANG_PHIEUNHANHANG foreign key (maphieunhan) references phieunhanhang(maphieunhan)

alter table ct_dichvu
add constraint FK_CTDICHVU_DICHVU foreign key (madichvu) references dichvu(madichvu)
alter table ct_dichvu
add constraint FK_CTDICHVU_MATHANG foreign key (mamathang) references mathang(mamathang)

alter table dichvu
add constraint FK_DICHVU_LOAIDICHVU foreign key(maloaidv) references loaidichvu(maloaidv)



-- Thêm db
INSERT INTO donvitinh
VALUES
('DVT09', N'Ly'),
('DVT01', N'Chai'),
('DVT03', N'Cái'),
('DVT04', N'Kg'),
('DVT05', N'Bịt'),
('DVT07', N'Lon'),
('DVT08', N'Phần')

INSERT INTO nhacungcap
VALUES
('NCC03', N'Công ty Bánh Kẹo', N'Một nơi nào đó ở Hà Nội', '0984545656'),
('NCC01', N'Đại lý nước ngọt L', N'Một nơi nào đó ở TPHCM', '0123456789'),
('NCC02', N'Công ty Bắp', N'Một nơi nào đó ở Đà Lạt', '0987654321')

INSERT INTO danhmuchang
VALUES
('DM01', N'Nước ngọt'),
('DM02', N'Bắp'),
('DM03', N'Snack'),
('DM04', N'Nước suối'),
('DM05', N'Combo'),
('DM06', N'Bánh Kẹo')

INSERT INTO mathang
VALUES
('MH024', N'Quà tặng theo phim', 60, 399000, 'DM05', 'NCC03', 'DVT08'),
('MH001', N'Bắp vị nguyên bản S', 150, 69000, 'DM02', 'NCC02', 'DVT08'),
('MH002', N'Bắp vị nguyên bản L', 150, 99000, 'DM02', 'NCC02', 'DVT08'),
('MH003', N'Bắp vị Caramel S', 150, 69000, 'DM02', 'NCC02', 'DVT08'),
('MH004', N'Bắp vị Caramel L', 150, 99000, 'DM02', 'NCC02', 'DVT08'),
('MH005', N'Bắp vị phô mai S', 150, 69000, 'DM02', 'NCC02', 'DVT08'),
('MH006', N'Bắp vị phô mai L', 150, 99000, 'DM02', 'NCC02', 'DVT08'),
('MH007', N'Pepsi S', 100, 39000, 'DM01', 'NCC01', 'DVT09'),
('MH008', N'Pepsi L', 100, 49000, 'DM01', 'NCC01', 'DVT09'),
('MH009', N'Coca Cola S', 100, 39000, 'DM01', 'NCC01', 'DVT09'),
('MH010', N'Coca Cola L', 100, 49000, 'DM01', 'NCC01', 'DVT09'),
('MH011', N'Nestea trà chanh S', 100, 39000, 'DM01', 'NCC01', 'DVT09'),
('MH012', N'Nestea trà chanh L', 100, 49000, 'DM01', 'NCC01', 'DVT09'),
('MH014', N'Aquafina 500ml', 48, 10000, 'DM04', 'NCC01', 'DVT01'),
('MH015', N'Lavie 600ml', 48, 10000, 'DM04', 'NCC01', 'DVT01'),
('MH016', N'Dasani 500ml', 48, 10000, 'DM04', 'NCC01', 'DVT01'),
('MH017', N'Satori', 48, 10000, 'DM04', 'NCC01', 'DVT01'),
('MH018', N'Number one 500ml', 48, 10000, 'DM04', 'NCC01', 'DVT01'),
('MH019', N'Snack 1', 20, 20000, 'DM03', 'NCC03', 'DVT05'),
('MH020', N'Snack 2', 20, 20000, 'DM03', 'NCC03', 'DVT05'),
('MH021', N'Snack 3', 20, 20000, 'DM03', 'NCC03', 'DVT05'),
('MH022', N'Snack 4', 20, 20000, 'DM03', 'NCC03', 'DVT05'),
('MH023', N'Snack 5', 20, 20000, 'DM03', 'NCC03', 'DVT05')


INSERT INTO loaidichvu
VALUES
('LDV01', N'Combo'),
('LDV02', N'Gọi lẻ')

INSERT INTO dichvu
VALUES
('DV01', N'Combo bắp 1', 129000, 'LDV01'),
('DV02', N'Combo bắp 2', 129000, 'LDV01'),
('DV03', N'Combo bắp 3', 159000, 'LDV01'),
('DV04', N'Combo bắp 4', 179000, 'LDV01'),
('DV05', N'Combo nước 1', 75000, 'LDV01'),
('DV06', N'Combo nước 2', 110000, 'LDV01'),
('DV07', N'Combo nước 3', 95000, 'LDV01'),
('DV08', N'Combo nước 4', 140000, 'LDV01'),
('DV09', N'Combo bắp nước 1', 99000, 'LDV01'),
('DV10', N'Combo bắp nước 2', 99000, 'LDV01'),
('DV11', N'Combo bắp nước 3', 189000, 'LDV01'),
('DV12', N'Combo bắp nước 4', 329000, 'LDV01'),
('DV13', N'Combo theo phim 1', 399000, 'LDV02'),
('DV14', N'Combo theo phim 2', 399000, 'LDV02'),
('DV15', N'Combo theo phim 3', 399000, 'LDV02'),
('DV16', N'Combo theo phim 4', 399000, 'LDV02')

INSERT INTO ct_dichvu
VALUES
('DV01', 'MH001', 1),
('DV01', 'MH003', 1),
('DV02', 'MH003', 1),
('DV02', 'MH005', 1),
('DV03', 'MH003', 1),
('DV03', 'MH006', 1),
('DV04', 'MH004', 1),
('DV04', 'MH002', 1),

('DV05', 'MH007', 1),
('DV05', 'MH009', 1),
('DV06', 'MH007', 1),
('DV06', 'MH009', 1),
('DV06', 'MH011', 1),
('DV07', 'MH008', 1),
('DV07', 'MH010', 1),
('DV08', 'MH008', 2),
('DV08', 'MH010', 1),

('DV09', 'MH001', 1),
('DV09', 'MH007', 1),
('DV10', 'MH003', 1),
('DV10', 'MH007', 1),
('DV11', 'MH004', 1),
('DV11', 'MH008', 2),
('DV12', 'MH004', 1),
('DV12', 'MH006', 1),
('DV12', 'MH008', 3),
('DV13', 'MH024', 1),
('DV14', 'MH024', 1),
('DV15', 'MH024', 1),
('DV16', 'MH024', 1)
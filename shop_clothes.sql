-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 10, 2022 lúc 09:12 AM
-- Phiên bản máy phục vụ: 10.4.19-MariaDB
-- Phiên bản PHP: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shop_clothes`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill`
--

CREATE TABLE `bill` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_bill` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_user` int(11) NOT NULL,
  `coupon` double DEFAULT 0,
  `ship_cost` double NOT NULL DEFAULT 0,
  `total_bill` double NOT NULL DEFAULT 0,
  `recive_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reciver` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_order` int(11) NOT NULL DEFAULT 1,
  `payment_method` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_shipper` int(11) DEFAULT NULL,
  `date_order` date NOT NULL,
  `date_finish` date DEFAULT NULL,
  `date_cancel` date DEFAULT NULL,
  `id_staff` int(10) DEFAULT NULL,
  `cancel_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `bill`
--

INSERT INTO `bill` (`id`, `id_bill`, `id_user`, `coupon`, `ship_cost`, `total_bill`, `recive_address`, `reciver`, `phone`, `status_order`, `payment_method`, `id_shipper`, `date_order`, `date_finish`, `date_cancel`, `id_staff`, `cancel_reason`, `created_at`, `updated_at`) VALUES
(1, 'DH1001', 9, 0, 29000, 569000, 'Tỉnh Khánh Hòa,Thành phố Cam Ranh,Phường Cam Nghĩa, Tỉnh Khánh Hòa,Thành phố Cam Ranh,Phường Cam Nghĩa', 'Duy Việt', '123456789', 1, 'Thanh toán khi nhận hàng', NULL, '2022-01-10', NULL, NULL, NULL, NULL, '2022-01-10 08:08:44', '2022-01-10 08:08:44'),
(2, 'DH2', 9, 0, 29000, 569000, 'Tỉnh Khánh Hòa,Thành phố Cam Ranh,Phường Cam Nghĩa, Tỉnh Khánh Hòa,Thành phố Cam Ranh,Phường Cam Nghĩa', 'Duy Việt', '123456789', 1, 'Thanh toán khi nhận hàng', NULL, '2022-01-10', NULL, NULL, NULL, NULL, '2022-01-10 08:10:46', '2022-01-10 08:10:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill_detail`
--

CREATE TABLE `bill_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_bill` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_product` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `total` double NOT NULL,
  `product_info` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_store` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `bill_detail`
--

INSERT INTO `bill_detail` (`id`, `id_bill`, `id_product`, `price`, `quantity`, `total`, `product_info`, `id_store`, `created_at`, `updated_at`) VALUES
(1, 'DH2', 'SP1025', 270000, 2, 540000, 'Màu: Xám, Size: M', 2, '2022-01-10 08:10:46', '2022-01-10 08:10:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_code` int(11) DEFAULT NULL,
  `total_cart` double(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart_detail`
--

CREATE TABLE `cart_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_cart` int(11) NOT NULL,
  `id_product` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category_product`
--

CREATE TABLE `category_product` (
  `id` int(11) NOT NULL,
  `id_type` int(11) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `url` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `category_product`
--

INSERT INTO `category_product` (`id`, `id_type`, `gender`, `url`) VALUES
(1, 1, 1, '/category-product/1/1'),
(2, 1, 2, '/category-product/1/2'),
(3, 2, 1, '/category-product/2/1'),
(4, 2, 2, '/category-product/2/2'),
(5, 3, 1, '/category-product/3/1'),
(6, 3, 2, '/category-product/3/2'),
(7, 4, 1, '/category-product/4/1'),
(8, 4, 2, '/category-product/4/1'),
(9, 5, 1, '/category-product/5/1'),
(10, 5, 2, '/category-product/5/2'),
(11, 6, 1, '/category-product/6/1'),
(12, 6, 2, '/category-product/6/2'),
(13, 7, 2, '/category-product/7/2'),
(14, 8, 1, '/category-product/8/1'),
(15, 8, 2, '/category-product/8/2'),
(16, 9, 1, '/category-product/9/1'),
(17, 9, 2, '/category-product/9/2'),
(18, 10, 1, '/category-product/10/1'),
(19, 11, 2, '/category-product/11/2');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `city`
--

CREATE TABLE `city` (
  `id` varchar(5) CHARACTER SET utf8 NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `type` varchar(30) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Đang đổ dữ liệu cho bảng `city`
--

INSERT INTO `city` (`id`, `name`, `type`) VALUES
('1', 'Thành phố Hà Nội', 'Thành phố Trung ương'),
('22', 'Tỉnh Quảng Ninh', 'Tỉnh'),
('24', 'Tỉnh Bắc Giang', 'Tỉnh'),
('27', 'Tỉnh Bắc Ninh', 'Tỉnh'),
('30', 'Tỉnh Hải Dương', 'Tỉnh'),
('31', 'Thành phố Hải Phòng', 'Thành phố Trung ương'),
('33', 'Tỉnh Hưng Yên', 'Tỉnh'),
('34', 'Tỉnh Thái Bình', 'Tỉnh'),
('35', 'Tỉnh Hà Nam', 'Tỉnh'),
('36', 'Tỉnh Nam Định', 'Tỉnh'),
('37', 'Tỉnh Ninh Bình', 'Tỉnh'),
('38', 'Tỉnh Thanh Hóa', 'Tỉnh'),
('46', 'Tỉnh Thừa Thiên Huế', 'Tỉnh'),
('48', 'Thành phố Đà Nẵng', 'Thành phố Trung ương'),
('54', 'Tỉnh Phú Yên', 'Tỉnh'),
('56', 'Tỉnh Khánh Hòa', 'Tỉnh'),
('79', 'Thành phố Hồ Chí Minh', 'Thành phố Trung ương'),
('91', 'Tỉnh Kiên Giang', 'Tỉnh'),
('92', 'Thành phố Cần Thơ', 'Thành phố Trung ương');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `color`
--

CREATE TABLE `color` (
  `id` int(10) UNSIGNED NOT NULL,
  `color_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `color`
--

INSERT INTO `color` (`id`, `color_name`, `created_at`, `updated_at`) VALUES
(1, 'Trắng', NULL, NULL),
(2, 'Đen', NULL, NULL),
(3, 'Nhiều màu', NULL, NULL),
(4, 'Xanh da trời', NULL, NULL),
(5, 'Xám', NULL, NULL),
(6, 'Hồng', NULL, NULL),
(7, 'Đỏ', NULL, NULL),
(8, 'Vàng', NULL, NULL),
(9, 'Trung tính', NULL, NULL),
(10, 'Cam', NULL, NULL),
(11, 'Màu kaki', NULL, NULL),
(12, 'Nâu', NULL, NULL),
(13, 'Màu cà phê', NULL, NULL),
(14, 'Bạc', NULL, NULL),
(15, 'Hường', NULL, NULL),
(16, 'đen sọc đỏ', '2021-11-22 06:43:47', '2021-11-22 06:43:47'),
(17, 'Tím', '2021-11-25 08:58:26', '2021-11-25 08:58:26'),
(18, 'Xám đen', '2021-11-25 09:03:49', '2021-11-25 09:03:49');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `config`
--

CREATE TABLE `config` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `working_hours` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `geo_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hotline` int(11) DEFAULT NULL,
  `mobile` int(11) DEFAULT NULL,
  `email` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_plus` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube_channel` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `config`
--

INSERT INTO `config` (`id`, `title`, `company_name`, `description`, `keywords`, `working_hours`, `address`, `geo_address`, `hotline`, `mobile`, `email`, `facebook`, `google_plus`, `twitter`, `youtube_channel`, `image`, `favicon`, `icon`, `created_at`, `updated_at`) VALUES
(1, 'DV Shop', 'Công ty Duy Việt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-10 06:24:04');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `county`
--

CREATE TABLE `county` (
  `id` varchar(5) CHARACTER SET utf8 NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `type` varchar(30) CHARACTER SET utf8 NOT NULL,
  `id_city` varchar(5) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `county`
--

INSERT INTO `county` (`id`, `name`, `type`, `id_city`) VALUES
('1', 'Quận Ba Đình', 'Quận', '01'),
('16', 'Huyện Sóc Sơn', 'Huyện', '01'),
('17', 'Huyện Đông Anh', 'Huyện', '01'),
('18', 'Huyện Gia Lâm', 'Huyện', '01'),
('19', 'Quận Nam Từ Liêm', 'Quận', '01'),
('193', 'Thành phố Hạ Long', 'Thành phố', '22'),
('194', 'Thành phố Móng Cái', 'Thành phố', '22'),
('195', 'Thành phố Cẩm Phả', 'Thành phố', '22'),
('196', 'Thành phố Uông Bí', 'Thành phố', '22'),
('198', 'Huyện Bình Liêu', 'Huyện', '22'),
('199', 'Huyện Tiên Yên', 'Huyện', '22'),
('2', 'Quận Hoàn Kiếm', 'Quận', '01'),
('20', 'Huyện Thanh Trì', 'Huyện', '01'),
('200', 'Huyện Đầm Hà', 'Huyện', '22'),
('201', 'Huyện Hải Hà', 'Huyện', '22'),
('202', 'Huyện Ba Chẽ', 'Huyện', '22'),
('203', 'Huyện Vân Đồn', 'Huyện', '22'),
('204', 'Huyện Hoành Bồ', 'Huyện', '22'),
('205', 'Thị xã Đông Triều', 'Thị xã', '22'),
('206', 'Thị xã Quảng Yên', 'Thị xã', '22'),
('207', 'Huyện Cô Tô', 'Huyện', '22'),
('21', 'Quận Bắc Từ Liêm', 'Quận', '01'),
('213', 'Thành phố Bắc Giang', 'Thành phố', '24'),
('215', 'Huyện Yên Thế', 'Huyện', '24'),
('216', 'Huyện Tân Yên', 'Huyện', '24'),
('217', 'Huyện Lạng Giang', 'Huyện', '24'),
('218', 'Huyện Lục Nam', 'Huyện', '24'),
('219', 'Huyện Lục Ngạn', 'Huyện', '24'),
('220', 'Huyện Sơn Động', 'Huyện', '24'),
('221', 'Huyện Yên Dũng', 'Huyện', '24'),
('222', 'Huyện Việt Yên', 'Huyện', '24'),
('223', 'Huyện Hiệp Hòa', 'Huyện', '24'),
('256', 'Thành phố Bắc Ninh', 'Thành phố', '27'),
('258', 'Huyện Yên Phong', 'Huyện', '27'),
('259', 'Huyện Quế Võ', 'Huyện', '27'),
('260', 'Huyện Tiên Du', 'Huyện', '27'),
('261', 'Thị xã Từ Sơn', 'Thị xã', '27'),
('262', 'Huyện Thuận Thành', 'Huyện', '27'),
('263', 'Huyện Gia Bình', 'Huyện', '27'),
('264', 'Huyện Lương Tài', 'Huyện', '27'),
('288', 'Thành phố Hải Dương', 'Thành phố', '30'),
('290', 'Thị xã Chí Linh', 'Thị xã', '30'),
('291', 'Huyện Nam Sách', 'Huyện', '30'),
('292', 'Huyện Kinh Môn', 'Huyện', '30'),
('293', 'Huyện Kim Thành', 'Huyện', '30'),
('294', 'Huyện Thanh Hà', 'Huyện', '30'),
('295', 'Huyện Cẩm Giàng', 'Huyện', '30'),
('296', 'Huyện Bình Giang', 'Huyện', '30'),
('297', 'Huyện Gia Lộc', 'Huyện', '30'),
('298', 'Huyện Tứ Kỳ', 'Huyện', '30'),
('299', 'Huyện Ninh Giang', 'Huyện', '30'),
('3', 'Quận Tây Hồ', 'Quận', '01'),
('300', 'Huyện Thanh Miện', 'Huyện', '30'),
('303', 'Quận Hồng Bàng', 'Quận', '31'),
('304', 'Quận Ngô Quyền', 'Quận', '31'),
('305', 'Quận Lê Chân', 'Quận', '31'),
('306', 'Quận Hải An', 'Quận', '31'),
('307', 'Quận Kiến An', 'Quận', '31'),
('308', 'Quận Đồ Sơn', 'Quận', '31'),
('309', 'Quận Dương Kinh', 'Quận', '31'),
('311', 'Huyện Thuỷ Nguyên', 'Huyện', '31'),
('312', 'Huyện An Dương', 'Huyện', '31'),
('313', 'Huyện An Lão', 'Huyện', '31'),
('314', 'Huyện Kiến Thuỵ', 'Huyện', '31'),
('315', 'Huyện Tiên Lãng', 'Huyện', '31'),
('316', 'Huyện Vĩnh Bảo', 'Huyện', '31'),
('317', 'Huyện Cát Hải', 'Huyện', '31'),
('318', 'Huyện Bạch Long Vĩ', 'Huyện', '31'),
('323', 'Thành phố Hưng Yên', 'Thành phố', '33'),
('325', 'Huyện Văn Lâm', 'Huyện', '33'),
('326', 'Huyện Văn Giang', 'Huyện', '33'),
('327', 'Huyện Yên Mỹ', 'Huyện', '33'),
('328', 'Huyện Mỹ Hào', 'Huyện', '33'),
('329', 'Huyện Ân Thi', 'Huyện', '33'),
('330', 'Huyện Khoái Châu', 'Huyện', '33'),
('331', 'Huyện Kim Động', 'Huyện', '33'),
('332', 'Huyện Tiên Lữ', 'Huyện', '33'),
('333', 'Huyện Phù Cừ', 'Huyện', '33'),
('336', 'Thành phố Thái Bình', 'Thành phố', '34'),
('338', 'Huyện Quỳnh Phụ', 'Huyện', '34'),
('339', 'Huyện Hưng Hà', 'Huyện', '34'),
('340', 'Huyện Đông Hưng', 'Huyện', '34'),
('341', 'Huyện Thái Thụy', 'Huyện', '34'),
('342', 'Huyện Tiền Hải', 'Huyện', '34'),
('343', 'Huyện Kiến Xương', 'Huyện', '34'),
('344', 'Huyện Vũ Thư', 'Huyện', '34'),
('347', 'Thành phố Phủ Lý', 'Thành phố', '35'),
('349', 'Huyện Duy Tiên', 'Huyện', '35'),
('350', 'Huyện Kim Bảng', 'Huyện', '35'),
('351', 'Huyện Thanh Liêm', 'Huyện', '35'),
('352', 'Huyện Bình Lục', 'Huyện', '35'),
('353', 'Huyện Lý Nhân', 'Huyện', '35'),
('356', 'Thành phố Nam Định', 'Thành phố', '36'),
('358', 'Huyện Mỹ Lộc', 'Huyện', '36'),
('359', 'Huyện Vụ Bản', 'Huyện', '36'),
('360', 'Huyện Ý Yên', 'Huyện', '36'),
('361', 'Huyện Nghĩa Hưng', 'Huyện', '36'),
('362', 'Huyện Nam Trực', 'Huyện', '36'),
('363', 'Huyện Trực Ninh', 'Huyện', '36'),
('364', 'Huyện Xuân Trường', 'Huyện', '36'),
('365', 'Huyện Giao Thủy', 'Huyện', '36'),
('366', 'Huyện Hải Hậu', 'Huyện', '36'),
('369', 'Thành phố Ninh Bình', 'Thành phố', '37'),
('370', 'Thành phố Tam Điệp', 'Thành phố', '37'),
('372', 'Huyện Nho Quan', 'Huyện', '37'),
('373', 'Huyện Gia Viễn', 'Huyện', '37'),
('374', 'Huyện Hoa Lư', 'Huyện', '37'),
('375', 'Huyện Yên Khánh', 'Huyện', '37'),
('376', 'Huyện Kim Sơn', 'Huyện', '37'),
('377', 'Huyện Yên Mô', 'Huyện', '37'),
('380', 'Thành phố Thanh Hóa', 'Thành phố', '38'),
('381', 'Thị xã Bỉm Sơn', 'Thị xã', '38'),
('382', 'Thị xã Sầm Sơn', 'Thị xã', '38'),
('384', 'Huyện Mường Lát', 'Huyện', '38'),
('385', 'Huyện Quan Hóa', 'Huyện', '38'),
('386', 'Huyện Bá Thước', 'Huyện', '38'),
('387', 'Huyện Quan Sơn', 'Huyện', '38'),
('388', 'Huyện Lang Chánh', 'Huyện', '38'),
('389', 'Huyện Ngọc Lặc', 'Huyện', '38'),
('390', 'Huyện Cẩm Thủy', 'Huyện', '38'),
('391', 'Huyện Thạch Thành', 'Huyện', '38'),
('392', 'Huyện Hà Trung', 'Huyện', '38'),
('393', 'Huyện Vĩnh Lộc', 'Huyện', '38'),
('394', 'Huyện Yên Định', 'Huyện', '38'),
('395', 'Huyện Thọ Xuân', 'Huyện', '38'),
('396', 'Huyện Thường Xuân', 'Huyện', '38'),
('397', 'Huyện Triệu Sơn', 'Huyện', '38'),
('398', 'Huyện Thiệu Hóa', 'Huyện', '38'),
('399', 'Huyện Hoằng Hóa', 'Huyện', '38'),
('4', 'Quận Long Biên', 'Quận', '01'),
('400', 'Huyện Hậu Lộc', 'Huyện', '38'),
('401', 'Huyện Nga Sơn', 'Huyện', '38'),
('402', 'Huyện Như Xuân', 'Huyện', '38'),
('403', 'Huyện Như Thanh', 'Huyện', '38'),
('404', 'Huyện Nông Cống', 'Huyện', '38'),
('405', 'Huyện Đông Sơn', 'Huyện', '38'),
('406', 'Huyện Quảng Xương', 'Huyện', '38'),
('407', 'Huyện Tĩnh Gia', 'Huyện', '38'),
('474', 'Thành phố Huế', 'Thành phố', '46'),
('476', 'Huyện Phong Điền', 'Huyện', '46'),
('477', 'Huyện Quảng Điền', 'Huyện', '46'),
('478', 'Huyện Phú Vang', 'Huyện', '46'),
('479', 'Thị xã Hương Thủy', 'Thị xã', '46'),
('480', 'Thị xã Hương Trà', 'Thị xã', '46'),
('481', 'Huyện A Lưới', 'Huyện', '46'),
('482', 'Huyện Phú Lộc', 'Huyện', '46'),
('483', 'Huyện Nam Đông', 'Huyện', '46'),
('490', 'Quận Liên Chiểu', 'Quận', '48'),
('491', 'Quận Thanh Khê', 'Quận', '48'),
('492', 'Quận Hải Châu', 'Quận', '48'),
('493', 'Quận Sơn Trà', 'Quận', '48'),
('494', 'Quận Ngũ Hành Sơn', 'Quận', '48'),
('495', 'Quận Cẩm Lệ', 'Quận', '48'),
('497', 'Huyện Hòa Vang', 'Huyện', '48'),
('498', 'Huyện Hoàng Sa', 'Huyện', '48'),
('5', 'Quận Cầu Giấy', 'Quận', '01'),
('555', 'Thành phố Tuy Hoà', 'Thành phố', '54'),
('557', 'Thị xã Sông Cầu', 'Thị xã', '54'),
('558', 'Huyện Đồng Xuân', 'Huyện', '54'),
('559', 'Huyện Tuy An', 'Huyện', '54'),
('560', 'Huyện Sơn Hòa', 'Huyện', '54'),
('561', 'Huyện Sông Hinh', 'Huyện', '54'),
('562', 'Huyện Tây Hoà', 'Huyện', '54'),
('563', 'Huyện Phú Hoà', 'Huyện', '54'),
('564', 'Huyện Đông Hòa', 'Huyện', '54'),
('568', 'Thành phố Nha Trang', 'Thành phố', '56'),
('569', 'Thành phố Cam Ranh', 'Thành phố', '56'),
('570', 'Huyện Cam Lâm', 'Huyện', '56'),
('571', 'Huyện Vạn Ninh', 'Huyện', '56'),
('572', 'Thị xã Ninh Hòa', 'Thị xã', '56'),
('573', 'Huyện Khánh Vĩnh', 'Huyện', '56'),
('574', 'Huyện Diên Khánh', 'Huyện', '56'),
('575', 'Huyện Khánh Sơn', 'Huyện', '56'),
('576', 'Huyện Trường Sa', 'Huyện', '56'),
('6', 'Quận Đống Đa', 'Quận', '01'),
('7', 'Quận Hai Bà Trưng', 'Quận', '01'),
('760', 'Quận 1', 'Quận', '79'),
('761', 'Quận 12', 'Quận', '79'),
('762', 'Quận Thủ Đức', 'Quận', '79'),
('763', 'Quận 9', 'Quận', '79'),
('764', 'Quận Gò Vấp', 'Quận', '79'),
('765', 'Quận Bình Thạnh', 'Quận', '79'),
('766', 'Quận Tân Bình', 'Quận', '79'),
('767', 'Quận Tân Phú', 'Quận', '79'),
('768', 'Quận Phú Nhuận', 'Quận', '79'),
('769', 'Quận 2', 'Quận', '79'),
('770', 'Quận 3', 'Quận', '79'),
('771', 'Quận 10', 'Quận', '79'),
('772', 'Quận 11', 'Quận', '79'),
('773', 'Quận 4', 'Quận', '79'),
('774', 'Quận 5', 'Quận', '79'),
('775', 'Quận 6', 'Quận', '79'),
('776', 'Quận 8', 'Quận', '79'),
('777', 'Quận Bình Tân', 'Quận', '79'),
('778', 'Quận 7', 'Quận', '79'),
('783', 'Huyện Củ Chi', 'Huyện', '79'),
('784', 'Huyện Hóc Môn', 'Huyện', '79'),
('785', 'Huyện Bình Chánh', 'Huyện', '79'),
('786', 'Huyện Nhà Bè', 'Huyện', '79'),
('787', 'Huyện Cần Giờ', 'Huyện', '79'),
('794', 'Thành phố Tân An', 'Thành phố', '80'),
('795', 'Thị xã Kiến Tường', 'Thị xã', '80'),
('796', 'Huyện Tân Hưng', 'Huyện', '80'),
('797', 'Huyện Vĩnh Hưng', 'Huyện', '80'),
('798', 'Huyện Mộc Hóa', 'Huyện', '80'),
('799', 'Huyện Tân Thạnh', 'Huyện', '80'),
('8', 'Quận Hoàng Mai', 'Quận', '01'),
('800', 'Huyện Thạnh Hóa', 'Huyện', '80'),
('801', 'Huyện Đức Huệ', 'Huyện', '80'),
('802', 'Huyện Đức Hòa', 'Huyện', '80'),
('803', 'Huyện Bến Lức', 'Huyện', '80'),
('804', 'Huyện Thủ Thừa', 'Huyện', '80'),
('805', 'Huyện Tân Trụ', 'Huyện', '80'),
('806', 'Huyện Cần Đước', 'Huyện', '80'),
('807', 'Huyện Cần Giuộc', 'Huyện', '80'),
('808', 'Huyện Châu Thành', 'Huyện', '80'),
('899', 'Thành phố Rạch Giá', 'Thành phố', '91'),
('9', 'Quận Thanh Xuân', 'Quận', '01'),
('900', 'Thị xã Hà Tiên', 'Thị xã', '91'),
('902', 'Huyện Kiên Lương', 'Huyện', '91'),
('903', 'Huyện Hòn Đất', 'Huyện', '91'),
('904', 'Huyện Tân Hiệp', 'Huyện', '91'),
('905', 'Huyện Châu Thành', 'Huyện', '91'),
('906', 'Huyện Giồng Riềng', 'Huyện', '91'),
('907', 'Huyện Gò Quao', 'Huyện', '91'),
('908', 'Huyện An Biên', 'Huyện', '91'),
('909', 'Huyện An Minh', 'Huyện', '91'),
('910', 'Huyện Vĩnh Thuận', 'Huyện', '91'),
('911', 'Huyện Phú Quốc', 'Huyện', '91'),
('912', 'Huyện Kiên Hải', 'Huyện', '91'),
('913', 'Huyện U Minh Thượng', 'Huyện', '91'),
('914', 'Huyện Giang Thành', 'Huyện', '91'),
('916', 'Quận Ninh Kiều', 'Quận', '92'),
('917', 'Quận Ô Môn', 'Quận', '92'),
('918', 'Quận Bình Thuỷ', 'Quận', '92'),
('919', 'Quận Cái Răng', 'Quận', '92'),
('923', 'Quận Thốt Nốt', 'Quận', '92'),
('924', 'Huyện Vĩnh Thạnh', 'Huyện', '92'),
('925', 'Huyện Cờ Đỏ', 'Huyện', '92'),
('926', 'Huyện Phong Điền', 'Huyện', '92'),
('927', 'Huyện Thới Lai', 'Huyện', '92');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_county` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_ward` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `discount_code`
--

CREATE TABLE `discount_code` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_code` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `feedback`
--

CREATE TABLE `feedback` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_customer` int(11) NOT NULL,
  `id_product` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `star` int(11) NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `gender`
--

CREATE TABLE `gender` (
  `id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `gender`
--

INSERT INTO `gender` (`id`, `name`) VALUES
(1, 'Nam'),
(2, 'Nữ'),
(3, 'Trẻ em'),
(4, 'Cả nam và nữ');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `manufacturer`
--

CREATE TABLE `manufacturer` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `manufacturer`
--

INSERT INTO `manufacturer` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Adidas', '2022-01-10 06:34:23', '2022-01-10 06:34:23'),
(2, 'Nike', '2022-01-10 06:34:31', '2022-01-10 06:34:31'),
(3, 'Hoang Phuc International', NULL, NULL),
(4, 'Elise', NULL, NULL),
(5, 'Lime Orange', NULL, NULL),
(6, 'EOM', '2021-11-22 06:51:33', '2021-11-22 06:51:33'),
(7, 'Gucci', '2021-11-26 02:14:49', '2021-11-26 02:14:49'),
(8, 'Chanel', '2021-11-26 02:16:50', '2021-11-26 02:16:50'),
(9, 'L&V', '2021-11-26 02:17:02', '2021-11-26 02:17:02'),
(10, 'heart club', '2021-11-26 02:17:44', '2021-11-26 02:17:44'),
(11, 'HERMET', '2021-11-26 02:18:25', '2021-11-26 02:18:25'),
(12, 'The Blue Exchange', NULL, NULL),
(13, 'Canifa', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2470, '2018_09_25_030856_create_shippers_table', 1),
(2484, '2018_11_17_102552_create_regiser_table', 4),
(2486, '2014_10_12_000000_create_user_table', 5),
(2487, '2014_10_12_100000_create_password_resets_table', 5),
(2488, '2018_05_30_020441_create_role_table', 5),
(2489, '2018_06_08_081557_create_config_table', 5),
(2490, '2018_09_16_144349_create_type_product_table', 5),
(2491, '2018_09_16_150255_create_manufacturer_table', 5),
(2492, '2018_09_18_070517_create_bill_table', 5),
(2493, '2018_09_18_070844_create_bill_detail_table', 5),
(2494, '2018_09_18_070930_create_cart_table', 5),
(2495, '2018_09_18_071009_create_cart_detail_table', 5),
(2496, '2018_09_18_071040_create_discount_code_table', 5),
(2497, '2018_09_18_071106_create_feedback_table', 5),
(2498, '2018_09_18_071147_create_customer_table', 5),
(2499, '2018_09_18_071210_create_returns_table', 5),
(2500, '2018_09_29_131846_create_store_table', 5),
(2501, '2018_10_02_104502_create_product_store_table', 5),
(2502, '2018_10_02_104936_create_supplier_table', 5),
(2503, '2018_10_05_084152_create_size_table', 5),
(2504, '2018_10_05_092242_create_color_table', 5),
(2505, '2018_10_07_022322_create_products_table', 5),
(2506, '2018_10_20_082612_create_product_images_table', 5),
(2507, '2018_10_20_083106_create_product_detail_table', 5),
(2508, '2018_10_24_012713_create_my_product_table', 5),
(2509, '2018_10_29_024120_create_package_order_table', 5),
(2510, '2018_10_29_030416_create_staff_table', 5),
(2511, '2018_10_29_030432_create_staff_type_table', 5),
(2512, '2018_11_15_161134_create_promocodes_table', 5),
(2513, '2018_11_17_102740_create_register_table', 5),
(2515, '2022_01_10_133928_add_id_group_to_table_promocodes', 6);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `my_product`
--

CREATE TABLE `my_product` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_product` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_user` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `package_order`
--

CREATE TABLE `package_order` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_bill` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_user` int(11) NOT NULL,
  `ship_cost` double NOT NULL DEFAULT 0,
  `total_bill` double NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `package_staff` int(11) DEFAULT NULL,
  `export_staff` int(11) DEFAULT NULL,
  `shipper` int(11) DEFAULT NULL,
  `payment_method` int(11) NOT NULL DEFAULT 1,
  `status` int(11) NOT NULL,
  `date_package` date NOT NULL,
  `date_export` date DEFAULT NULL,
  `date_finish` date DEFAULT NULL,
  `date_cancel` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_product` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_type` int(11) NOT NULL,
  `gender` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `import_price` double NOT NULL DEFAULT 0,
  `price` double NOT NULL DEFAULT 0,
  `promotion_price` double NOT NULL DEFAULT 0,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `new` int(11) NOT NULL DEFAULT 0,
  `hot` int(11) NOT NULL DEFAULT 0,
  `id_manufacturer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `id_product`, `name`, `id_type`, `gender`, `description`, `import_price`, `price`, `promotion_price`, `image`, `new`, `hot`, `id_manufacturer`, `created_at`, `updated_at`) VALUES
(1009, 'SP1007', 'Áo sơ mi Knot', 1, 2, '<p>&Aacute;o sơ mi Knot kiểu d&aacute;ng thanh lịch</p>', 200000, 280000, 0, 'uploads/ao_so_mi_knot_trang1.jpg', 0, 1, '1', '2021-11-07 14:46:31', '2021-11-27 19:51:00'),
(1010, 'SP1010', 'Áo nỉ', 2, 2, '<p>&Aacute;o nỉ chất d&agrave;y, ấm &aacute;p</p>', 140000, 209000, 0, 'uploads/ao_ni.jpg', 1, 0, '1', '2021-11-07 14:48:17', '2021-11-27 06:44:43'),
(1011, 'SP1011', 'Bộ áo khoác nam Casual', 3, 1, '<p>Loại trang phục:Quần</p>\r\n\r\n<p>M&agrave;u sắc :Nhiều m&agrave;u</p>\r\n\r\n<p>Vật liệu:100% Polyester</p>\r\n\r\n<p>Kiểu mẫu:L&aacute; thư</p>\r\n\r\n<p>Viền :Đứng cổ &aacute;o</p>\r\n\r\n<p>Chiều d&agrave;i tay:Tay &aacute;o d&agrave;i</p>\r\n\r\n<p>Trang tr&iacute;:Nghề', 350000, 558000, 0, 'uploads/ao_khac_nam_causess.jpg', 1, 1, '4', '2021-11-19 03:35:58', '2021-11-19 03:35:58'),
(1012, 'SP1012', 'Men Two-Piece Outfits Dây Kéo Lá Thư Màu Đen Casua', 3, 1, '<p>Loại trang phục:Quần</p>\r\n\r\n<p>M&agrave;u sắc :m&agrave;u đen</p>\r\n\r\n<p>Vật liệu:100% Polyester</p>\r\n\r\n<p>Kiểu mẫu:L&aacute; thư</p>\r\n\r\n<p>Viền :&aacute;o c&oacute; mũ</p>\r\n\r\n<p>Chiều d&agrave;i tay:Tay &aacute;o d&agrave;i</p>\r\n\r\n<p>Trang tr&iacute;:D', 380000, 550000, 0, 'uploads/ao_koac_nam_causal1.jpg', 1, 0, '5', '2021-11-19 03:39:20', '2021-11-19 03:39:20'),
(1013, 'SP1013', 'ÁO KIỂU TUYTSI TAY LỞ THOI LƯNG', 1, 2, '<h1>&Aacute;O KIỂU TUYTSI TAY LỞ THOI LƯNG</h1>', 150000, 350000, 170000, 'uploads/ao_tuysty1.jpg', 1, 0, '2', '2021-11-20 06:07:44', '2021-11-20 06:07:44'),
(1014, 'SP1014', 'áo holdi', 9, 1, '<p>&eacute;o đẹp , chất lượng tốt</p>', 50000, 70000, 0, 'uploads/ao_thun1.jpg', 1, 1, '6', '2021-11-22 07:05:34', '2021-11-22 07:05:34'),
(1015, 'SP1015', 'Váy Casual Đồng Bằng Knot Màu Tím', 7, 2, '<p>M&agrave;u sắc :M&agrave;u t&iacute;m</p>\r\n\r\n<p>Vật liệu:85% B&ocirc;ng, 15% Polyester</p>\r\n\r\n<p>Chiều d&agrave;i:Độ d&agrave;i của đầu gối</p>\r\n\r\n<p>H&igrave;nh b&oacute;ng:vỏ kiếm</p>\r\n\r\n<p>Phong c&aacute;ch:Casual</p>\r\n\r\n<p>Kiểu mẫu:đồng bằng</p>\r\n\r', 150000, 400000, 399000, 'uploads/vay_xanh1.jpg', 1, 0, '6', '2021-11-25 09:02:15', '2021-11-25 09:02:15'),
(1016, 'SP1016', 'Váy kẻ sọc', 7, 2, '<p>M&agrave;u sắc :M&agrave;u xanh lam</p>\r\n\r\n<p>Vật liệu:Tweed, 100% Polyester</p>\r\n\r\n<p>Chiều d&agrave;i:Tr&ecirc;n Đầu gối / Ngắn</p>\r\n\r\n<p>H&igrave;nh b&oacute;ng:Bodycon</p>\r\n\r\n<p>Phong c&aacute;ch:Tao nh&atilde;</p>\r\n\r\n<p>Kiểu mẫu:Sọc ca r&ocirc;</p', 200000, 450000, 399000, 'uploads/vay_kesoc_tim1.jpg', 1, 0, '6', '2021-11-25 09:05:56', '2021-11-25 09:12:51'),
(1017, 'SP1017', 'Cáy công sở đen', 7, 2, '<p>M&agrave;u sắc :m&agrave;u đen</p>\r\n\r\n<p>Vật liệu:95% Polyester, 5% Spandex</p>\r\n\r\n<p>Chiều d&agrave;i:Tr&ecirc;n Đầu gối / Ngắn</p>\r\n\r\n<p>H&igrave;nh b&oacute;ng:B&ugrave;ng nổ</p>\r\n\r\n<p>Phong c&aacute;ch:Phong c&aacute;ch Campus</p>\r\n\r\n<p>Kiểu mẫu:đồ', 270000, 350000, 300000, 'uploads/vay_phongcach1.jpg', 1, 1, '6', '2021-11-25 09:07:54', '2021-11-27 20:17:08'),
(1018, 'SP1018', 'Váy Casual Báo Knot Nhiều Màu', 7, 2, '<p>M&agrave;u sắc :Nhiều m&agrave;u</p>\r\n\r\n<p>Vật liệu:100% Polyester</p>\r\n\r\n<p>Chiều d&agrave;i:Long / Chiều d&agrave;i đầy đủ</p>\r\n\r\n<p>H&igrave;nh b&oacute;ng:thay đổi</p>\r\n\r\n<p>Phong c&aacute;ch:Casual</p>\r\n\r\n<p>Kiểu mẫu:B&aacute;o</p>\r\n\r\n<p>Fabric:Vả', 250000, 500000, 460000, 'uploads/vay_bao1.jpg', 1, 1, '6', '2021-11-25 09:10:08', '2021-11-25 09:10:08'),
(1019, 'SP1019', 'Men Sweatshirts Dây Kéo Lá Thư Màu Đen Casual', 12, 1, '<p>Kiểu:&Aacute;o chui</p>\r\n\r\n<p>Chiều d&agrave;i tay:Tay &aacute;o d&agrave;i</p>\r\n\r\n<p>Viền :&aacute;o c&oacute; mũ</p>\r\n\r\n<p>M&agrave;u sắc :m&agrave;u đen</p>\r\n\r\n<p>Kiểu mẫu:L&aacute; thư</p>\r\n\r\n<p>Vật liệu:100% B&ocirc;ng</p>\r\n\r\n<p>Fabric:Vải c&oacut', 70000, 160000, 0, 'uploads/hd_1.jpg', 1, 1, '1', '2021-11-25 09:12:42', '2021-11-25 09:12:42'),
(1020, 'SP1020', 'Men Sweatshirts', 3, 1, '<p>M&agrave;u sắc :Nhiều m&agrave;u</p>\r\n\r\n<p>Vật liệu:100% Polyester</p>\r\n\r\n<p>V&ograve;ng cổ:&aacute;o c&oacute; mũ</p>\r\n\r\n<p>Phong c&aacute;ch:Casual</p>\r\n\r\n<p>Chiều d&agrave;i:Thường xuy&ecirc;n</p>\r\n\r\n<p>M&ugrave;a:M&ugrave;a thu</p>\r\n\r\n<p>Kiểu mẫu:L', 500000, 700000, 0, 'uploads/khoac_den1.jpg', 0, 1, '5', '2021-11-25 09:15:14', '2021-11-25 09:15:14'),
(1022, 'SP1022', 'Men Sweatshirts hổ 3d Màu Đen', 3, 2, '<p>Kiểu:&Aacute;o chui</p>\r\n\r\n<p>Chiều d&agrave;i tay:Tay &aacute;o d&agrave;i</p>\r\n\r\n<p>Viền :&aacute;o c&oacute; mũ</p>\r\n\r\n<p>M&agrave;u sắc :m&agrave;u đen</p>\r\n\r\n<p>Kiểu mẫu:Th&uacute; vật</p>\r\n\r\n<p>Vật liệu:Polyester</p>\r\n\r\n<p>Fabric:Vải rất gi&atild', 700000, 1200000, 10150000, 'uploads/khoac_ho1.jpg', 1, 1, '6', '2021-11-25 09:21:42', '2021-11-25 09:21:42'),
(1023, 'SP1023', 'Áo phông xám đen', 2, 1, '<p>Kiểu:&Aacute;o chui</p>\r\n\r\n<p>Chiều d&agrave;i tay:Tay &aacute;o d&agrave;i</p>\r\n\r\n<p>Viền :V&ograve;ng cổ</p>\r\n\r\n<p>M&agrave;u sắc :trắng</p>\r\n\r\n<p>Kiểu mẫu:L&aacute; thư</p>\r\n\r\n<p>Vật liệu:Polyester</p>\r\n\r\n<p>Fabric:Vải c&oacute; một số căng</p>\r\n\r\n<', 120000, 300000, 270000, 'uploads/somi_trangden1.jpg', 0, 1, '2', '2021-11-25 09:24:43', '2021-11-25 09:24:43'),
(1024, 'SP1024', 'Áo sơ mi nam trắng công sở', 1, 1, '<p>M&agrave;u sắc :X&aacute;m</p>\r\n\r\n<p>Phong c&aacute;ch:Casual</p>\r\n\r\n<p>V&ograve;ng cổ:V&ograve;ng cổ</p>\r\n\r\n<p>Chiều d&agrave;i tay:Tay &aacute;o d&agrave;i</p>\r\n\r\n<p>Vật liệu:65% Polyester, 35% B&ocirc;ng</p>\r\n\r\n<p>Loại Ph&ugrave; hợp:Ph&ugrave; hợp ', 170000, 250000, 0, 'uploads/somi_trang1.jpg', 1, 0, '5', '2021-11-26 02:08:31', '2021-11-26 02:08:31'),
(1025, 'SP1025', 'Áo sơ mi nam xám công sở', 1, 1, '<p>M&agrave;u sắc :X&aacute;m</p>\r\n\r\n<p>Phong c&aacute;ch:Casual</p>\r\n\r\n<p>V&ograve;ng cổ:V&ograve;ng cổ</p>\r\n\r\n<p>Chiều d&agrave;i tay:Tay &aacute;o d&agrave;i</p>\r\n\r\n<p>Vật liệu:65% Polyester, 35% B&ocirc;ng</p>\r\n\r\n<p>Loại Ph&ugrave; hợp:Ph&ugrave; hợp ', 150000, 300000, 270000, 'uploads/somi_xam1.jpg', 1, 0, '4', '2021-11-26 02:12:34', '2021-11-26 02:12:34');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_detail`
--

CREATE TABLE `product_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_product` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_store` int(11) NOT NULL,
  `id_color` int(11) NOT NULL,
  `id_size` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_detail`
--

INSERT INTO `product_detail` (`id`, `id_product`, `id_store`, `id_color`, `id_size`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 'SP1005', 1, 1, 1, 7, '2021-11-02 12:26:38', '2021-11-27 06:42:01'),
(2, 'SP1005', 1, 1, 2, 6, '2021-11-02 12:26:39', '2021-11-27 06:42:01'),
(3, 'SP1005', 1, 1, 3, 9, '2021-11-02 12:26:39', '2021-11-27 06:42:01'),
(4, 'SP1005', 1, 1, 4, 6, '2021-11-02 12:26:39', '2021-11-27 06:42:01'),
(5, 'SP1005', 1, 1, 5, 0, '2021-11-02 12:26:39', '2021-11-27 06:42:02'),
(6, 'SP1005', 1, 2, 1, 0, '2021-11-02 12:26:39', '2021-11-27 06:42:02'),
(7, 'SP1005', 1, 2, 2, 2, '2021-11-02 12:26:39', '2021-11-27 06:42:02'),
(8, 'SP1005', 1, 2, 3, 5, '2021-11-02 12:26:39', '2021-11-27 06:42:02'),
(9, 'SP1005', 1, 2, 4, 0, '2021-11-02 12:26:39', '2021-11-27 06:42:02'),
(10, 'SP1005', 1, 2, 5, 0, '2021-11-02 12:26:39', '2021-11-27 06:42:02'),
(11, 'SP1005', 2, 1, 1, 0, '2021-11-02 12:48:55', '2021-11-02 12:48:55'),
(12, 'SP1005', 2, 1, 2, 6, '2021-11-02 12:48:55', '2021-11-02 12:48:55'),
(13, 'SP1005', 2, 1, 3, 8, '2021-11-02 12:48:55', '2021-11-02 12:48:55'),
(14, 'SP1005', 2, 1, 4, 7, '2021-11-02 12:48:55', '2021-11-02 12:48:55'),
(15, 'SP1005', 2, 1, 5, 0, '2021-11-02 12:48:55', '2021-11-02 12:48:55'),
(16, 'SP1005', 2, 2, 1, 9, '2021-11-02 12:48:56', '2021-11-02 12:48:56'),
(17, 'SP1005', 2, 2, 2, 9, '2021-11-02 12:48:56', '2021-11-02 12:48:56'),
(18, 'SP1005', 2, 2, 3, 9, '2021-11-02 12:48:56', '2021-11-02 12:48:56'),
(19, 'SP1005', 2, 2, 4, 9, '2021-11-02 12:48:56', '2021-11-02 12:48:56'),
(20, 'SP1005', 2, 2, 5, 0, '2021-11-02 12:48:56', '2021-11-02 12:48:56'),
(21, 'SP1007', 1, 1, 1, 10, '2021-11-12 17:17:33', '2021-11-22 09:29:47'),
(22, 'SP1007', 1, 1, 2, 18, '2021-11-12 17:17:33', '2021-11-22 09:29:47'),
(23, 'SP1007', 1, 1, 3, 10, '2021-11-12 17:17:33', '2021-11-22 09:29:47'),
(24, 'SP1007', 1, 1, 4, 13, '2021-11-12 17:17:33', '2021-11-22 09:29:47'),
(25, 'SP1007', 1, 1, 5, 0, '2021-11-12 17:17:33', '2021-11-22 09:29:47'),
(26, 'SP1007', 1, 7, 1, 4, '2021-11-12 17:17:33', '2021-11-22 09:29:47'),
(27, 'SP1007', 1, 7, 2, 9, '2021-11-12 17:17:34', '2021-11-22 09:29:47'),
(28, 'SP1007', 1, 7, 3, 14, '2021-11-12 17:17:34', '2021-11-22 09:29:47'),
(29, 'SP1007', 1, 7, 4, 5, '2021-11-12 17:17:34', '2021-11-22 09:29:47'),
(30, 'SP1007', 1, 7, 5, 0, '2021-11-12 17:17:34', '2021-11-22 09:29:48'),
(31, 'SP1007', 1, 2, 1, 4, '2021-11-12 17:17:34', '2021-11-22 09:29:48'),
(32, 'SP1007', 1, 2, 2, 6, '2021-11-12 17:17:34', '2021-11-22 09:29:48'),
(33, 'SP1007', 1, 2, 3, 13, '2021-11-12 17:17:34', '2021-11-22 09:29:48'),
(34, 'SP1007', 1, 2, 4, 9, '2021-11-12 17:17:34', '2021-11-22 09:29:48'),
(35, 'SP1007', 1, 2, 5, 0, '2021-11-12 17:17:34', '2021-11-22 09:29:48'),
(36, 'SP1011', 1, 1, 1, 3, '2021-11-22 17:41:00', '2021-11-27 19:29:27'),
(37, 'SP1011', 1, 1, 2, -3, '2021-11-22 17:41:00', '2021-11-26 20:15:35'),
(38, 'SP1011', 1, 1, 3, 4, '2021-11-22 17:41:00', '2021-11-25 01:04:04'),
(39, 'SP1011', 1, 1, 4, 0, '2021-11-22 17:41:00', '2021-11-22 17:41:00'),
(40, 'SP1011', 1, 1, 5, 6, '2021-11-22 17:41:00', '2021-11-22 17:41:00'),
(41, 'SP1011', 1, 8, 1, 3, '2021-11-22 17:41:00', '2021-11-27 19:29:27'),
(42, 'SP1011', 1, 8, 2, -3, '2021-11-22 17:41:00', '2021-11-26 20:15:35'),
(43, 'SP1011', 1, 8, 3, 4, '2021-11-22 17:41:00', '2021-11-25 01:04:04'),
(44, 'SP1011', 1, 8, 4, 7, '2021-11-22 17:41:00', '2021-11-22 17:41:00'),
(45, 'SP1011', 1, 8, 5, 5, '2021-11-22 17:41:00', '2021-11-22 17:41:00'),
(46, 'SP1011', 1, 7, 1, 3, '2021-11-22 17:41:00', '2021-11-27 19:29:27'),
(47, 'SP1011', 1, 7, 2, -3, '2021-11-22 17:41:00', '2021-11-26 20:15:35'),
(48, 'SP1011', 1, 7, 3, 4, '2021-11-22 17:41:00', '2021-11-25 01:04:04'),
(49, 'SP1011', 1, 7, 4, 2, '2021-11-22 17:41:00', '2021-11-22 17:41:00'),
(50, 'SP1011', 1, 7, 5, 0, '2021-11-22 17:41:01', '2021-11-22 17:41:01'),
(51, 'SP1012', 1, 2, 1, 5, '2021-11-22 17:41:29', '2021-11-22 17:41:29'),
(52, 'SP1012', 1, 2, 2, 4, '2021-11-22 17:41:30', '2021-11-25 05:07:39'),
(53, 'SP1012', 1, 2, 3, 4, '2021-11-22 17:41:30', '2021-11-22 19:13:02'),
(54, 'SP1012', 1, 2, 4, 5, '2021-11-22 17:41:30', '2021-11-22 17:41:30'),
(55, 'SP1012', 1, 2, 5, 2, '2021-11-22 17:41:30', '2021-11-22 17:41:30'),
(56, 'SP1013', 1, 2, 1, 6, '2021-11-22 17:42:10', '2021-11-22 17:42:10'),
(57, 'SP1013', 1, 2, 2, 3, '2021-11-22 17:42:10', '2021-11-22 19:13:02'),
(58, 'SP1013', 1, 2, 3, 2, '2021-11-22 17:42:10', '2021-11-25 05:07:39'),
(59, 'SP1013', 1, 2, 4, 3, '2021-11-22 17:42:10', '2021-11-22 17:42:10'),
(60, 'SP1013', 1, 2, 5, 7, '2021-11-22 17:42:10', '2021-11-22 17:42:10'),
(61, 'SP1013', 1, 1, 1, 8, '2021-11-22 17:42:11', '2021-11-22 17:42:11'),
(62, 'SP1013', 1, 1, 2, 3, '2021-11-22 17:42:11', '2021-11-22 19:13:02'),
(63, 'SP1013', 1, 1, 3, 2, '2021-11-22 17:42:11', '2021-11-25 05:07:39'),
(64, 'SP1013', 1, 1, 4, 8, '2021-11-22 17:42:11', '2021-11-22 17:42:11'),
(65, 'SP1013', 1, 1, 5, 4, '2021-11-22 17:42:11', '2021-11-22 17:42:11'),
(66, 'SP1010', 1, 1, 1, 2, '2021-11-22 23:51:42', '2021-11-22 23:51:42'),
(67, 'SP1010', 1, 1, 2, 4, '2021-11-22 23:51:42', '2021-11-22 23:51:42'),
(68, 'SP1010', 1, 1, 3, 0, '2021-11-22 23:51:42', '2021-11-22 23:51:42'),
(69, 'SP1010', 1, 1, 4, 0, '2021-11-22 23:51:42', '2021-11-22 23:51:42'),
(70, 'SP1010', 1, 1, 5, 0, '2021-11-22 23:51:42', '2021-11-22 23:51:42'),
(71, 'SP1024', 2, 1, 1, 4, '2021-11-27 06:43:14', '2021-11-27 06:43:14'),
(72, 'SP1024', 2, 1, 2, 5, '2021-11-27 06:43:14', '2021-11-27 06:43:14'),
(73, 'SP1024', 2, 1, 3, 8, '2021-11-27 06:43:14', '2021-11-27 06:43:14'),
(74, 'SP1024', 2, 1, 4, 9, '2021-11-27 06:43:14', '2021-11-27 06:43:14'),
(75, 'SP1024', 2, 1, 5, 0, '2021-11-27 06:43:14', '2021-11-27 06:43:14'),
(76, 'SP1025', 1, 5, 1, 2, '2021-11-27 06:45:55', '2021-11-27 06:45:55'),
(77, 'SP1025', 1, 5, 2, 2, '2021-11-27 06:45:55', '2021-11-27 06:45:55'),
(78, 'SP1025', 1, 5, 3, 3, '2021-11-27 06:45:55', '2021-11-27 06:45:55'),
(79, 'SP1025', 1, 5, 4, 3, '2021-11-27 06:45:55', '2021-11-27 06:45:55'),
(80, 'SP1025', 1, 5, 5, 5, '2021-11-27 06:45:55', '2021-11-27 06:45:55'),
(81, 'SP1023', 1, 18, 1, 1, '2021-11-27 06:46:38', '2021-12-04 01:18:51'),
(82, 'SP1023', 1, 18, 2, 2, '2021-11-27 06:46:38', '2021-11-27 06:46:38'),
(83, 'SP1023', 1, 18, 3, 4, '2021-11-27 06:46:38', '2021-11-27 06:46:38'),
(84, 'SP1023', 1, 18, 4, 5, '2021-11-27 06:46:38', '2021-11-27 06:46:38'),
(85, 'SP1023', 1, 18, 5, 8, '2021-11-27 06:46:39', '2021-11-27 06:46:39'),
(86, 'SP1021', 1, 3, 1, 4, '2021-11-27 06:48:11', '2021-11-27 06:48:11'),
(87, 'SP1021', 1, 3, 2, 4, '2021-11-27 06:48:11', '2021-11-27 06:48:11'),
(88, 'SP1021', 1, 3, 3, 4, '2021-11-27 06:48:11', '2021-11-27 06:48:11'),
(89, 'SP1021', 1, 3, 4, 4, '2021-11-27 06:48:11', '2021-11-27 06:48:11'),
(90, 'SP1021', 1, 3, 5, 0, '2021-11-27 06:48:11', '2021-11-27 06:48:11'),
(91, 'SP1024', 1, 1, 1, 54, '2021-11-28 18:53:41', '2021-11-28 18:53:41'),
(92, 'SP1024', 1, 1, 2, 3, '2021-11-28 18:53:41', '2021-11-28 18:53:41'),
(93, 'SP1024', 1, 1, 3, 3, '2021-11-28 18:53:41', '2021-11-28 18:53:41'),
(94, 'SP1024', 1, 1, 4, 0, '2021-11-28 18:53:41', '2021-11-28 18:53:41'),
(95, 'SP1024', 1, 1, 5, 0, '2021-11-28 18:53:42', '2021-11-28 18:53:42'),
(96, 'SP1023', 2, 18, 1, 5, '2021-11-28 19:07:19', '2021-11-28 19:07:19'),
(97, 'SP1023', 2, 18, 2, 5, '2021-11-28 19:07:19', '2021-11-28 19:07:19'),
(98, 'SP1023', 2, 18, 3, 5, '2021-11-28 19:07:19', '2021-11-28 19:07:19'),
(99, 'SP1023', 2, 18, 4, 5, '2021-11-28 19:07:19', '2021-11-28 19:07:19'),
(100, 'SP1023', 2, 18, 5, 5, '2021-11-28 19:07:19', '2021-11-28 19:07:19'),
(101, 'SP1015', 1, 17, 1, 4, '2021-12-02 06:50:26', '2021-12-02 06:50:26'),
(102, 'SP1015', 1, 17, 2, 4, '2021-12-02 06:50:26', '2021-12-02 06:50:26'),
(103, 'SP1015', 1, 17, 3, 0, '2021-12-02 06:50:26', '2021-12-02 06:50:26'),
(104, 'SP1015', 1, 17, 4, 4, '2021-12-02 06:50:26', '2021-12-02 06:50:26'),
(105, 'SP1015', 1, 17, 5, 4, '2021-12-02 06:50:26', '2021-12-02 06:50:26'),
(106, 'SP1015', 1, 4, 1, 3, '2021-12-02 06:50:26', '2021-12-02 06:50:26'),
(107, 'SP1015', 1, 4, 2, 3, '2021-12-02 06:50:26', '2021-12-02 06:50:26'),
(108, 'SP1015', 1, 4, 3, 0, '2021-12-02 06:50:26', '2021-12-02 06:50:26'),
(109, 'SP1015', 1, 4, 4, 0, '2021-12-02 06:50:26', '2021-12-02 06:50:26'),
(110, 'SP1015', 1, 4, 5, 0, '2021-12-02 06:50:26', '2021-12-02 06:50:26');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_images`
--

CREATE TABLE `product_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_product` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_color` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_images`
--

INSERT INTO `product_images` (`id`, `id_product`, `id_color`, `image`, `created_at`, `updated_at`) VALUES
(1, 'SP1005', 1, 'uploads/ao_doi1.jpg,uploads/ao_doi2.jpg', '2021-11-01 02:01:10', '2021-11-01 02:01:10'),
(2, 'SP1005', 2, 'uploads/ao_thun5.jpg,uploads/aodoi1.jpg', '2021-11-01 02:01:10', '2021-11-01 02:01:10'),
(3, 'SP1006', 1, 'uploads/ao_doi1.jpg', '2021-11-04 20:36:38', '2021-11-04 20:36:38'),
(8, 'SP1007', 1, 'uploads/ao_so_mi_knot_trang1.jpg,uploads/ao_so_mi_knot_trang2.jpg,uploads/ao_so_mi_knot_trang3.jpg', '2021-11-07 14:46:31', '2021-11-07 14:46:31'),
(9, 'SP1007', 7, 'uploads/ao_so_mi_knot_do1.jpg,uploads/ao_so_mi_knot_do2.jpg,uploads/ao_so_mi_knot_do3.jpg', '2021-11-07 14:46:31', '2021-11-07 14:46:31'),
(10, 'SP1007', 2, 'uploads/ao_so_mi_knot_den1.jpg,uploads/ao_so_mi_knot_den2.jpg,uploads/ao_so_mi_knot_den3.jpg', '2021-11-07 14:46:31', '2021-11-07 14:46:31'),
(11, 'SP1010', 1, 'uploads/ao_ni.jpg,uploads/ao_ni_detail1.jpg,uploads/ao_ni_detail2.jpg', '2021-11-07 14:48:16', '2021-11-07 14:48:16'),
(15, 'SP1011', 7, 'uploads/ao_khac_nam_causess.jpg,uploads/ao_khac_nam_causess-1.jpg,uploads/ao_khac_nam_causess-2.jpg', '2021-11-19 03:35:57', '2021-11-19 03:35:57'),
(16, 'SP1011', 1, 'uploads/ao_khoac_nam_dentrang1.jpg,uploads/ao_khoac_nam_dentrang2.jpg', '2021-11-19 03:35:58', '2021-11-19 03:35:58'),
(17, 'SP1011', 8, 'uploads/ao_khoac_nam_denvang.jpg,uploads/ao_khoac_namdenvang2.jpg', '2021-11-19 03:35:58', '2021-11-19 03:35:58'),
(18, 'SP1012', 2, 'uploads/ao_koac_nam_causal1.jpg,uploads/ao_koac_nam_causal2.jpg,uploads/ao_koac_nam_causal3.jpg', '2021-11-19 03:39:19', '2021-11-19 03:39:19'),
(19, 'SP1013', 1, 'uploads/ao_tuysty1.jpg,uploads/ao_tuysty2.jpg,uploads/ao_tuysty3.jpg', '2021-11-20 06:07:43', '2021-11-20 06:07:43'),
(20, 'SP1013', 2, 'uploads/ao_tuysty_den1.jpg,uploads/ao_tuysty_den2.jpg,uploads/ao_tuysty_den3.jpg', '2021-11-20 06:07:44', '2021-11-20 06:07:44'),
(21, 'SP1014', 1, 'uploads/ao_doi3.jpg,uploads/ao_doi4.jpg,uploads/ao_doi5.jpg', '2021-11-22 07:05:34', '2021-11-22 07:05:34'),
(22, 'SP1014', 2, 'uploads/ao_thun1.jpg,uploads/ao_thun2.jpg', '2021-11-22 07:05:34', '2021-11-22 07:05:34'),
(23, 'SP1015', 17, 'uploads/vay_tim1.jpg,uploads/vay_tim2.jpg,uploads/vay_tim3.jpg', '2021-11-25 09:02:15', '2021-11-25 09:02:15'),
(24, 'SP1015', 4, 'uploads/vay_xanh1.jpg,uploads/vay_xanh2.jpg,uploads/vay_xanh3.jpg', '2021-11-25 09:02:15', '2021-11-25 09:02:15'),
(25, 'SP1016', 18, 'uploads/vay_kesoc_trang1.jpg,uploads/vay_kesoc_trang2.jpg,uploads/vay_kesoc_trang3.jpg', '2021-11-25 09:05:56', '2021-11-25 09:05:56'),
(26, 'SP1016', 2, 'uploads/vay_kesoc_tim1.jpg,uploads/vay_kesoc_tim2.jpg,uploads/vay_kesoc_tim3.jpg', '2021-11-25 09:05:56', '2021-11-25 09:05:56'),
(27, 'SP1017', 2, 'uploads/vay_phongcach1.jpg,uploads/vay_phongcach2.jpg,uploads/vay_phongcach3.jpg', '2021-11-25 09:07:54', '2021-11-25 09:07:54'),
(28, 'SP1018', 3, 'uploads/vay_bao1.jpg,uploads/vay_bao2.jpg,uploads/vay_bao3.jpg', '2021-11-25 09:10:07', '2021-11-25 09:10:07'),
(29, 'SP1019', 18, 'uploads/hd_1.jpg,uploads/hd2.jpg,uploads/hd3.jpg', '2021-11-25 09:12:42', '2021-11-25 09:12:42'),
(30, 'SP1020', 18, 'uploads/khoac_den1.jpg,uploads/khoac_den2.jpg,uploads/khoac_den3.jpg', '2021-11-25 09:15:14', '2021-11-25 09:15:14'),
(31, 'SP1021', 3, 'uploads/hoddi_trang1.jpg,uploads/hoddi_trang2.jpg,uploads/hoddi_trang3.jpg', '2021-11-25 09:18:50', '2021-11-25 09:18:50'),
(32, 'SP1022', 2, 'uploads/khoac_ho1.jpg,uploads/khoac_ho2.jpg,uploads/khoac_ho3.jpg', '2021-11-25 09:21:42', '2021-11-25 09:21:42'),
(33, 'SP1023', 18, 'uploads/somi_trangden1.jpg,uploads/somi_trangden2.jpg,uploads/somi_trangden3.jpg', '2021-11-25 09:24:43', '2021-11-25 09:24:43'),
(34, 'SP1024', 1, 'uploads/somi_trang1.jpg,uploads/somi_trang2.jpg,uploads/somi_trang3.jpg', '2021-11-26 02:08:31', '2021-11-26 02:08:31'),
(35, 'SP1025', 5, 'uploads/somi_xam1.jpg,uploads/somi_xam2.jpg,uploads/somi_xam3.jpg', '2021-11-26 02:12:34', '2021-11-26 02:12:34');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_store`
--

CREATE TABLE `product_store` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_product` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_store` int(11) NOT NULL,
  `number` int(11) NOT NULL DEFAULT 0,
  `number_error` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `promocodes`
--

CREATE TABLE `promocodes` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_used` tinyint(1) NOT NULL DEFAULT 0,
  `cash` double DEFAULT NULL,
  `percent` double DEFAULT NULL,
  `created_at` date NOT NULL,
  `expiration_date` date NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_group` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `promocodes`
--

INSERT INTO `promocodes` (`id`, `code`, `is_used`, `cash`, `percent`, `created_at`, `expiration_date`, `email`, `id_group`) VALUES
(26, '5S95-WL6J', 1, 50000, 0, '2021-11-16', '2021-12-31', 'duyviet@gmail.com', 1),
(27, '2K7G-5BXS', 0, 50000, 0, '2021-11-16', '2021-12-31', NULL, 1),
(28, '6ECC-YPQA', 0, 50000, 0, '2021-11-16', '2021-12-31', 'duyviet1@gmail.com', 1),
(29, 'GHXJ-WRTD', 0, 50000, 0, '2021-11-16', '2021-11-30', NULL, 1),
(33, 'V6AG-U4J3', 0, 0, 20, '2021-11-17', '2021-11-30', NULL, 2),
(34, '23LE-4XHK', 0, 0, 20, '2021-11-17', '2021-11-30', NULL, 2),
(35, '8H44-XJZZ', 0, 0, 20, '2021-11-17', '2021-11-30', NULL, 2),
(36, 'AQSJ-UG5C', 0, 0, 20, '2021-11-17', '2021-11-30', NULL, 2),
(37, '34YB-MH97', 0, 0, 20, '2021-11-17', '2021-11-30', NULL, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `promocodes_group`
--

CREATE TABLE `promocodes_group` (
  `id` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `promocodes_group`
--

INSERT INTO `promocodes_group` (`id`, `name`) VALUES
(1, 'Mã giảm giá cho khách hàng đăng ký'),
(2, 'Mã giảm giá cho sự kiện tri ân khách hàng'),
(3, 'Mã cho tết Tây');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `register`
--

CREATE TABLE `register` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `returns`
--

CREATE TABLE `returns` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `returns_detail`
--

CREATE TABLE `returns_detail` (
  `id` int(11) NOT NULL,
  `id_returns` int(11) NOT NULL,
  `id_product` char(10) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `returns_detail`
--

INSERT INTO `returns_detail` (`id`, `id_returns`, `id_product`) VALUES
(1, 8, 'SP1012'),
(2, 9, 'SP1012'),
(3, 9, 'SP1013');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role`
--

CREATE TABLE `role` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `route` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `role`
--

INSERT INTO `role` (`id`, `name`, `route`, `created_at`, `updated_at`) VALUES
(1, 'Adminstrator', 'all', NULL, NULL),
(2, 'Nhân viên bán hàng', 'admin.index,admin.block.index,admin.block.create,admin.block.store,admin.block.edit,admin.block.update,admin.block.destroy,admin.testimonial.index,admin.testimonial.create,admin.testimonial.store,admin.testimonial.edit,admin.testimonial.update,admin.testimonial.destroy', NULL, NULL),
(3, 'Quản lý kho', 'admin.index,admin.customer.index,admin.affiliate.create,admin.customer.store,admin.customer.destroy,admin.affiliate.edit,admin.affiliate.update,admin.affiliate.detail,admin.affiliate.toggle,admin.affiliate.toggleGroup,admin.affiliate.report', NULL, NULL),
(4, 'Quản trị nội dung', 'admin.index,admin.customer.index,admin.affiliate.create,admin.customer.store,admin.customer.destroy,admin.affiliate.edit,admin.affiliate.update,admin.affiliate.detail,admin.affiliate.toggle,admin.affiliate.toggleGroup,admin.affiliate.report', NULL, NULL),
(5, 'Khách hàng', 'home,cartPage,productDetail,checkout,addToCart,cart,delProductInCart,updateCart,categoryProduct', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ship_cost`
--

CREATE TABLE `ship_cost` (
  `id` int(11) NOT NULL,
  `id_store` int(11) NOT NULL,
  `id_city` int(11) NOT NULL,
  `cost` int(11) NOT NULL,
  `insert_day` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `ship_cost`
--

INSERT INTO `ship_cost` (`id`, `id_store`, `id_city`, `cost`, `insert_day`) VALUES
(1, 1, 1, 2, 2),
(2, 1, 22, 3, 3),
(3, 1, 24, 2, 2),
(4, 1, 27, 2, 2),
(5, 1, 30, 2, 2),
(6, 1, 31, 1, 1),
(7, 1, 33, 2, 2),
(8, 1, 34, 3, 3),
(9, 1, 35, 2, 2),
(10, 1, 36, 2, 2),
(11, 1, 37, 3, 3),
(12, 1, 38, 3, 3),
(13, 1, 46, 5, 5),
(14, 1, 48, 5, 5),
(15, 1, 54, 6, 5),
(16, 1, 56, 6, 5),
(17, 1, 79, 6, 5),
(18, 1, 91, 9, 5),
(19, 1, 92, 7, 5),
(20, 1, 91, 9, 5),
(21, 1, 92, 7, 5),
(22, 2, 1, 6, 5),
(23, 2, 22, 6, 5),
(24, 2, 24, 7, 5),
(25, 2, 27, 6, 5),
(26, 2, 30, 7, 5),
(27, 2, 31, 7, 5),
(28, 2, 33, 7, 5),
(29, 2, 34, 7, 5),
(30, 3, 35, 7, 5),
(31, 2, 36, 7, 5),
(32, 2, 37, 7, 5),
(33, 2, 38, 6, 5),
(34, 2, 46, 5, 5),
(35, 2, 48, 5, 5),
(36, 2, 54, 4, 4),
(37, 2, 56, 4, 4),
(38, 2, 79, 1, 1),
(39, 2, 91, 4, 4),
(40, 2, 92, 3, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `size`
--

CREATE TABLE `size` (
  `id` int(10) UNSIGNED NOT NULL,
  `size_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `size`
--

INSERT INTO `size` (`id`, `size_name`, `created_at`, `updated_at`) VALUES
(1, 'S', NULL, NULL),
(2, 'M', NULL, NULL),
(3, 'L', NULL, NULL),
(4, 'XL', NULL, NULL),
(5, 'XXL', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slide`
--

CREATE TABLE `slide` (
  `id` int(5) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `slide`
--

INSERT INTO `slide` (`id`, `image`, `url`, `name`) VALUES
(1, 'uploads/slide1.jpg', '/slide-1', 'Áo len & nỉ hàng mới về'),
(2, 'uploads/slide2.jpg', 'slide-2', 'Các sản phẩm chỉ từ 199K'),
(3, 'uploads/slide4.jpg', '/slide-3', 'Sản phẩm đang được mua nhiều nhất');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `staff`
--

CREATE TABLE `staff` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `staff_type` int(11) NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `staff`
--

INSERT INTO `staff` (`id`, `name`, `staff_type`, `address`, `phone`, `created_at`, `updated_at`) VALUES
(1, 'Việt - đóng gói', 1, 'Nha Trang', '123456987', NULL, NULL),
(2, 'Ái - đóng gói', 1, 'Vĩnh Hải', '2321321', NULL, NULL),
(3, 'Hoàn - xk', 2, 'Bình Thuận', 'sadsa', NULL, NULL),
(4, 'Tú -xk', 2, 'Khánh Hòa', '1312321', NULL, NULL),
(5, 'Nam - shipper', 3, 'Nha Trang', '13213213', NULL, NULL),
(6, 'Trang - shipper', 3, 'Phan Thiết', '132131', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `staff_type`
--

CREATE TABLE `staff_type` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `staff_type`
--

INSERT INTO `staff_type` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Nhân viên đóng goi', NULL, NULL),
(2, 'Nhân viên xuất kho', NULL, NULL),
(3, 'Nhân viên vận chuyển', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `status_order`
--

CREATE TABLE `status_order` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `status_order`
--

INSERT INTO `status_order` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Mới', NULL, NULL),
(2, 'Đang đóng gói', NULL, NULL),
(3, 'Đang chuyển hàng', NULL, NULL),
(4, 'Đã giao hàng', NULL, NULL),
(5, 'Giao hàng thất bại', NULL, NULL),
(6, 'Khách hủy', NULL, NULL),
(7, 'Hệ thống hủy', NULL, NULL),
(8, 'Trả hàng', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `store`
--

CREATE TABLE `store` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `store`
--

INSERT INTO `store` (`id`, `name`, `address`, `created_at`, `updated_at`) VALUES
(1, 'Kho 1', 'Khánh Hòa', NULL, NULL),
(2, 'Kho 2', 'Bình Thuận', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `supplier`
--

CREATE TABLE `supplier` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `supplier`
--

INSERT INTO `supplier` (`id`, `name`, `address`, `phone`, `created_at`, `updated_at`) VALUES
(1, 'Adidas', 'Nha Trang', '123456789', '2022-01-10 06:32:30', '2022-01-10 06:32:30'),
(2, 'Nike', 'Nha Trang', '123789456', '2022-01-10 06:32:56', '2022-01-10 06:32:56');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `type_product`
--

CREATE TABLE `type_product` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `type_product`
--

INSERT INTO `type_product` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Áo sơ mi', NULL, NULL),
(2, 'Áo phông', NULL, NULL),
(3, 'Áo khoác', NULL, NULL),
(4, 'Quần bò', NULL, NULL),
(5, 'Quần âu', NULL, NULL),
(6, 'Quần kaki', NULL, NULL),
(7, 'Váy', NULL, NULL),
(8, 'Quần short', NULL, NULL),
(9, 'Áo len & áo nỉ', NULL, NULL),
(10, 'Vest', NULL, NULL),
(11, 'Đầm', NULL, NULL),
(12, 'áo hoddi', '2021-11-23 01:18:20', '2021-11-23 01:18:20');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `type_ship_cost`
--

CREATE TABLE `type_ship_cost` (
  `id` int(11) NOT NULL,
  `cost` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `type_ship_cost`
--

INSERT INTO `type_ship_cost` (`id`, `cost`) VALUES
(1, 15000),
(2, 20000),
(3, 27000),
(4, 29000),
(5, 31000),
(6, 34000),
(7, 36000),
(8, 40000),
(9, 45000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `name`, `address`, `phone`, `email`, `role_id`, `provider`, `provider_id`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$qFJxCuhhp9VYao6hmMkbLeMO1opEsOlqynU6Zf90dQxydD/Lzgms6', 'Administrator', NULL, NULL, NULL, 1, NULL, NULL, 0, 'YgRhI8xqQLxwN13Yb2x1vp6TF7RbOcql0YpXOb6NnWcwmDvl2oJAnIKJQN2h', NULL, NULL),
(2, 'admin2', '$2y$10$jJcqH3kswMy88MsBCWen5.HrWhsxVu.Tj4I8edDllpvxDMnr9NL2S', 'Admin 2', NULL, NULL, NULL, 2, NULL, NULL, 0, NULL, NULL, NULL),
(3, 'admin3', '$2y$10$plccgzKE4lH87uKpjU402OB0b9xNvuzJoPhtNC2.ogXZ6fqoKvfOW', 'Admin 3', NULL, NULL, NULL, 3, NULL, NULL, 0, NULL, NULL, NULL),
(4, 'admin4', '$2y$10$iQfxZsOrd6H8ZALav1Okle/di9G8oQYtog96qLk8MH0tKllZtJVlS', 'Admin 4', NULL, NULL, NULL, 4, NULL, NULL, 0, NULL, NULL, NULL),
(5, 'customer1', '$2y$10$OARYb45bC8B5Hos7Q6dSUuzycWr79kdVq.1jwVQzqXPsnEMxUZazy', 'customer1', 'Hải Phòng, Đồ Sơn , Bàng La', NULL, NULL, 5, NULL, NULL, 0, 'u7E2Rm8tA1Lk9lsB9veYeOFPTy4BBAz0FEqjafk3PMhTWZvob5GE9HECIiFu', NULL, NULL),
(6, 'customer2', '$2y$10$KqKq7/fN.7Tr4kI8HyKo.ObGeKdfJ7rDuxDe6Stwh51Rv.Vh5FWbq', 'customer2', 'Hải Phòng, Chợ hàng ,Miếu 2 Xã', NULL, NULL, 5, NULL, NULL, 0, NULL, NULL, NULL),
(7, 'customer3', '$2y$10$mxGdO1oyJH6YRNigSBFfZ.oE2r.xStnmdP9S0Zn3/ImgswOE4uQs6', 'customer3', 'Hải Phòng,An Lão, Thái Sơn', NULL, NULL, 5, NULL, NULL, 0, NULL, NULL, NULL),
(8, 'customer4', '$2y$10$ZMyPOwzWEVLsvelw8z8DO.gVz8/VCEfw0n54tBXzklkwO1F4DQE32', 'customer4', NULL, NULL, NULL, 5, NULL, NULL, 0, NULL, NULL, NULL),
(9, 'duyviet', '$2y$10$Y8IvNgJV9egpgQ9kHRKwJeCr0mkgj5RqDjb9B1ngUNh7HzEruXkq.', 'Duy Việt', 'Tỉnh Khánh Hòa,Thành phố Cam Ranh,Phường Cam Nghĩa', '123456789', 'duyviet@g.g', 6, NULL, NULL, 0, '8vwjQZC5431whQXxNxLhSgOm1PUy5YlKE6NTDR1St13nZudWfyMuWR9oDjnW', '2022-01-10 07:49:41', '2022-01-10 07:49:41');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ward`
--

CREATE TABLE `ward` (
  `id` varchar(5) CHARACTER SET utf8 NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `type` varchar(30) CHARACTER SET utf8 NOT NULL,
  `id_county` varchar(5) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `ward`
--

INSERT INTO `ward` (`id`, `name`, `type`, `id_county`) VALUES
('00001', 'Phường Phúc Xá', 'Phường', '001'),
('00004', 'Phường Trúc Bạch', 'Phường', '001'),
('00006', 'Phường Vĩnh Phúc', 'Phường', '001'),
('00007', 'Phường Cống Vị', 'Phường', '001'),
('00008', 'Phường Liễu Giai', 'Phường', '001'),
('00010', 'Phường Nguyễn Trung Trực', 'Phường', '001'),
('00013', 'Phường Quán Thánh', 'Phường', '001'),
('00016', 'Phường Ngọc Hà', 'Phường', '001'),
('00019', 'Phường Điện Biên', 'Phường', '001'),
('00022', 'Phường Đội Cấn', 'Phường', '001'),
('00025', 'Phường Ngọc Khánh', 'Phường', '001'),
('00028', 'Phường Kim Mã', 'Phường', '001'),
('00031', 'Phường Giảng Võ', 'Phường', '001'),
('00034', 'Phường Thành Công', 'Phường', '001'),
('00037', 'Phường Phúc Tân', 'Phường', '002'),
('00040', 'Phường Đồng Xuân', 'Phường', '002'),
('00043', 'Phường Hàng Mã', 'Phường', '002'),
('00046', 'Phường Hàng Buồm', 'Phường', '002'),
('00049', 'Phường Hàng Đào', 'Phường', '002'),
('00052', 'Phường Hàng Bồ', 'Phường', '002'),
('00055', 'Phường Cửa Đông', 'Phường', '002'),
('00058', 'Phường Lý Thái Tổ', 'Phường', '002'),
('00061', 'Phường Hàng Bạc', 'Phường', '002'),
('00064', 'Phường Hàng Gai', 'Phường', '002'),
('00067', 'Phường Chương Dương Độ', 'Phường', '002'),
('00070', 'Phường Hàng Trống', 'Phường', '002'),
('00073', 'Phường Cửa Nam', 'Phường', '002'),
('00076', 'Phường Hàng Bông', 'Phường', '002'),
('00079', 'Phường Tràng Tiền', 'Phường', '002'),
('00082', 'Phường Trần Hưng Đạo', 'Phường', '002'),
('00085', 'Phường Phan Chu Trinh', 'Phường', '002'),
('00088', 'Phường Hàng Bài', 'Phường', '002'),
('00091', 'Phường Phú Thượng', 'Phường', '003'),
('00094', 'Phường Nhật Tân', 'Phường', '003'),
('00097', 'Phường Tứ Liên', 'Phường', '003'),
('00100', 'Phường Quảng An', 'Phường', '003'),
('00103', 'Phường Xuân La', 'Phường', '003'),
('00106', 'Phường Yên Phụ', 'Phường', '003'),
('00109', 'Phường Bưởi', 'Phường', '003'),
('00112', 'Phường Thụy Khuê', 'Phường', '003'),
('00115', 'Phường Thượng Thanh', 'Phường', '004'),
('00118', 'Phường Ngọc Thụy', 'Phường', '004'),
('00121', 'Phường Giang Biên', 'Phường', '004'),
('00124', 'Phường Đức Giang', 'Phường', '004'),
('00127', 'Phường Việt Hưng', 'Phường', '004'),
('00130', 'Phường Gia Thụy', 'Phường', '004'),
('00133', 'Phường Ngọc Lâm', 'Phường', '004'),
('00136', 'Phường Phúc Lợi', 'Phường', '004'),
('00139', 'Phường Bồ Đề', 'Phường', '004'),
('00142', 'Phường Sài Đồng', 'Phường', '004'),
('00145', 'Phường Long Biên', 'Phường', '004'),
('00148', 'Phường Thạch Bàn', 'Phường', '004'),
('00151', 'Phường Phúc Đồng', 'Phường', '004'),
('00154', 'Phường Cự Khối', 'Phường', '004'),
('00157', 'Phường Nghĩa Đô', 'Phường', '005'),
('00160', 'Phường Nghĩa Tân', 'Phường', '005'),
('00163', 'Phường Mai Dịch', 'Phường', '005'),
('00166', 'Phường Dịch Vọng', 'Phường', '005'),
('00167', 'Phường Dịch Vọng Hậu', 'Phường', '005'),
('00169', 'Phường Quan Hoa', 'Phường', '005'),
('00172', 'Phường Yên Hoà', 'Phường', '005'),
('00175', 'Phường Trung Hoà', 'Phường', '005'),
('00178', 'Phường Cát Linh', 'Phường', '006'),
('00181', 'Phường Văn Miếu', 'Phường', '006'),
('00184', 'Phường Quốc Tử Giám', 'Phường', '006'),
('00187', 'Phường Láng Thượng', 'Phường', '006'),
('00190', 'Phường Ô Chợ Dừa', 'Phường', '006'),
('00193', 'Phường Văn Chương', 'Phường', '006'),
('00196', 'Phường Hàng Bột', 'Phường', '006'),
('00199', 'Phường Láng Hạ', 'Phường', '006'),
('00202', 'Phường Khâm Thiên', 'Phường', '006'),
('00205', 'Phường Thổ Quan', 'Phường', '006'),
('00208', 'Phường Nam Đồng', 'Phường', '006'),
('00211', 'Phường Trung Phụng', 'Phường', '006'),
('00214', 'Phường Quang Trung', 'Phường', '006'),
('00217', 'Phường Trung Liệt', 'Phường', '006'),
('00220', 'Phường Phương Liên', 'Phường', '006'),
('00223', 'Phường Thịnh Quang', 'Phường', '006'),
('00226', 'Phường Trung Tự', 'Phường', '006'),
('00229', 'Phường Kim Liên', 'Phường', '006'),
('00232', 'Phường Phương Mai', 'Phường', '006'),
('00235', 'Phường Ngã Tư Sở', 'Phường', '006'),
('00238', 'Phường Khương Thượng', 'Phường', '006'),
('00241', 'Phường Nguyễn Du', 'Phường', '007'),
('00244', 'Phường Bạch Đằng', 'Phường', '007'),
('00247', 'Phường Phạm Đình Hổ', 'Phường', '007'),
('00250', 'Phường Bùi Thị Xuân', 'Phường', '007'),
('00253', 'Phường Ngô Thì Nhậm', 'Phường', '007'),
('00256', 'Phường Lê Đại Hành', 'Phường', '007'),
('00259', 'Phường Đồng Nhân', 'Phường', '007'),
('00262', 'Phường Phố Huế', 'Phường', '007'),
('00265', 'Phường Đống Mác', 'Phường', '007'),
('00268', 'Phường Thanh Lương', 'Phường', '007'),
('00271', 'Phường Thanh Nhàn', 'Phường', '007'),
('00274', 'Phường Cầu Dền', 'Phường', '007'),
('00277', 'Phường Bách Khoa', 'Phường', '007'),
('00280', 'Phường Đồng Tâm', 'Phường', '007'),
('00283', 'Phường Vĩnh Tuy', 'Phường', '007'),
('00286', 'Phường Bạch Mai', 'Phường', '007'),
('00289', 'Phường Quỳnh Mai', 'Phường', '007'),
('00292', 'Phường Quỳnh Lôi', 'Phường', '007'),
('00295', 'Phường Minh Khai', 'Phường', '007'),
('00298', 'Phường Trương Định', 'Phường', '007'),
('00301', 'Phường Thanh Trì', 'Phường', '008'),
('00304', 'Phường Vĩnh Hưng', 'Phường', '008'),
('00307', 'Phường Định Công', 'Phường', '008'),
('00310', 'Phường Mai Động', 'Phường', '008'),
('00313', 'Phường Tương Mai', 'Phường', '008'),
('00316', 'Phường Đại Kim', 'Phường', '008'),
('00319', 'Phường Tân Mai', 'Phường', '008'),
('00322', 'Phường Hoàng Văn Thụ', 'Phường', '008'),
('00325', 'Phường Giáp Bát', 'Phường', '008'),
('00328', 'Phường Lĩnh Nam', 'Phường', '008'),
('00331', 'Phường Thịnh Liệt', 'Phường', '008'),
('00334', 'Phường Trần Phú', 'Phường', '008'),
('00337', 'Phường Hoàng Liệt', 'Phường', '008'),
('00340', 'Phường Yên Sở', 'Phường', '008'),
('00343', 'Phường Nhân Chính', 'Phường', '009'),
('00346', 'Phường Thượng Đình', 'Phường', '009'),
('00349', 'Phường Khương Trung', 'Phường', '009'),
('00352', 'Phường Khương Mai', 'Phường', '009'),
('00355', 'Phường Thanh Xuân Trung', 'Phường', '009'),
('00358', 'Phường Phương Liệt', 'Phường', '009'),
('00361', 'Phường Hạ Đình', 'Phường', '009'),
('00364', 'Phường Khương Đình', 'Phường', '009'),
('00367', 'Phường Thanh Xuân Bắc', 'Phường', '009'),
('00370', 'Phường Thanh Xuân Nam', 'Phường', '009'),
('00373', 'Phường Kim Giang', 'Phường', '009'),
('00376', 'Thị trấn Sóc Sơn', 'Thị trấn', '016'),
('00379', 'Xã Bắc Sơn', 'Xã', '016'),
('00382', 'Xã Minh Trí', 'Xã', '016'),
('00385', 'Xã Hồng Kỳ', 'Xã', '016'),
('00388', 'Xã Nam Sơn', 'Xã', '016'),
('00391', 'Xã Trung Giã', 'Xã', '016'),
('00394', 'Xã Tân Hưng', 'Xã', '016'),
('00397', 'Xã Minh Phú', 'Xã', '016'),
('00400', 'Xã Phù Linh', 'Xã', '016'),
('00403', 'Xã Bắc Phú', 'Xã', '016'),
('00406', 'Xã Tân Minh', 'Xã', '016'),
('00409', 'Xã Quang Tiến', 'Xã', '016'),
('00412', 'Xã Hiền Ninh', 'Xã', '016'),
('00415', 'Xã Tân Dân', 'Xã', '016'),
('00418', 'Xã Tiên Dược', 'Xã', '016'),
('00421', 'Xã Việt Long', 'Xã', '016'),
('00424', 'Xã Xuân Giang', 'Xã', '016'),
('00427', 'Xã Mai Đình', 'Xã', '016'),
('00430', 'Xã Đức Hoà', 'Xã', '016'),
('00433', 'Xã Thanh Xuân', 'Xã', '016'),
('00436', 'Xã Đông Xuân', 'Xã', '016'),
('00439', 'Xã Kim Lũ', 'Xã', '016'),
('00442', 'Xã Phú Cường', 'Xã', '016'),
('00445', 'Xã Phú Minh', 'Xã', '016'),
('00448', 'Xã Phù Lỗ', 'Xã', '016'),
('00451', 'Xã Xuân Thu', 'Xã', '016'),
('00454', 'Thị trấn Đông Anh', 'Thị trấn', '017'),
('00457', 'Xã Xuân Nộn', 'Xã', '017'),
('00460', 'Xã Thuỵ Lâm', 'Xã', '017'),
('00463', 'Xã Bắc Hồng', 'Xã', '017'),
('00466', 'Xã Nguyên Khê', 'Xã', '017'),
('00469', 'Xã Nam Hồng', 'Xã', '017'),
('00472', 'Xã Tiên Dương', 'Xã', '017'),
('00475', 'Xã Vân Hà', 'Xã', '017'),
('00478', 'Xã Uy Nỗ', 'Xã', '017'),
('00481', 'Xã Vân Nội', 'Xã', '017'),
('00484', 'Xã Liên Hà', 'Xã', '017'),
('00487', 'Xã Việt Hùng', 'Xã', '017'),
('00490', 'Xã Kim Nỗ', 'Xã', '017'),
('00493', 'Xã Kim Chung', 'Xã', '017'),
('00496', 'Xã Dục Tú', 'Xã', '017'),
('00499', 'Xã Đại Mạch', 'Xã', '017'),
('00502', 'Xã Vĩnh Ngọc', 'Xã', '017'),
('00505', 'Xã Cổ Loa', 'Xã', '017'),
('00508', 'Xã Hải Bối', 'Xã', '017'),
('00511', 'Xã Xuân Canh', 'Xã', '017'),
('00514', 'Xã Võng La', 'Xã', '017'),
('00517', 'Xã Tầm Xá', 'Xã', '017'),
('00520', 'Xã Mai Lâm', 'Xã', '017'),
('00523', 'Xã Đông Hội', 'Xã', '017'),
('00526', 'Thị trấn Yên Viên', 'Thị trấn', '018'),
('00529', 'Xã Yên Thường', 'Xã', '018'),
('00532', 'Xã Yên Viên', 'Xã', '018'),
('00535', 'Xã Ninh Hiệp', 'Xã', '018'),
('00538', 'Xã Đình Xuyên', 'Xã', '018'),
('00541', 'Xã Dương Hà', 'Xã', '018'),
('00544', 'Xã Phù Đổng', 'Xã', '018'),
('00547', 'Xã Trung Mầu', 'Xã', '018'),
('00550', 'Xã Lệ Chi', 'Xã', '018'),
('00553', 'Xã Cổ Bi', 'Xã', '018'),
('00556', 'Xã Đặng Xá', 'Xã', '018'),
('00559', 'Xã Phú Thị', 'Xã', '018'),
('00562', 'Xã Kim Sơn', 'Xã', '018'),
('00565', 'Thị trấn Trâu Quỳ', 'Thị trấn', '018'),
('00568', 'Xã Dương Quang', 'Xã', '018'),
('00571', 'Xã Dương Xá', 'Xã', '018'),
('00574', 'Xã Đông Dư', 'Xã', '018'),
('00577', 'Xã Đa Tốn', 'Xã', '018'),
('00580', 'Xã Kiêu Kỵ', 'Xã', '018'),
('00583', 'Xã Bát Tràng', 'Xã', '018'),
('00586', 'Xã Kim Lan', 'Xã', '018'),
('00589', 'Xã Văn Đức', 'Xã', '018'),
('00592', 'Phường Cầu Diễn', 'Phường', '019'),
('00595', 'Phường Thượng Cát', 'Phường', '021'),
('00598', 'Phường Liên Mạc', 'Phường', '021'),
('00601', 'Phường Đông Ngạc', 'Phường', '021'),
('00602', 'Phường Đức Thắng', 'Phường', '021'),
('00604', 'Phường Thụy Phương', 'Phường', '021'),
('00607', 'Phường Tây Tựu', 'Phường', '021'),
('00610', 'Phường Xuân Đỉnh', 'Phường', '021'),
('00611', 'Phường Xuân Tảo', 'Phường', '021'),
('00613', 'Phường Minh Khai', 'Phường', '021'),
('00616', 'Phường Cổ Nhuế 1', 'Phường', '021'),
('00617', 'Phường Cổ Nhuế 2', 'Phường', '021'),
('00619', 'Phường Phú Diễn', 'Phường', '021'),
('00620', 'Phường Phúc Diễn', 'Phường', '021'),
('00622', 'Phường Xuân Phương', 'Phường', '019'),
('00623', 'Phường Phương Canh', 'Phường', '019'),
('00625', 'Phường Mỹ Đình 1', 'Phường', '019'),
('00626', 'Phường Mỹ Đình 2', 'Phường', '019'),
('00628', 'Phường Tây Mỗ', 'Phường', '019'),
('00631', 'Phường Mễ Trì', 'Phường', '019'),
('00632', 'Phường Phú Đô', 'Phường', '019'),
('00634', 'Phường Đại Mỗ', 'Phường', '019'),
('00637', 'Phường Trung Văn', 'Phường', '019'),
('00640', 'Thị trấn Văn Điển', 'Thị trấn', '020'),
('00643', 'Xã Tân Triều', 'Xã', '020'),
('00646', 'Xã Thanh Liệt', 'Xã', '020'),
('00649', 'Xã Tả Thanh Oai', 'Xã', '020'),
('00652', 'Xã Hữu Hoà', 'Xã', '020'),
('00655', 'Xã Tam Hiệp', 'Xã', '020'),
('00658', 'Xã Tứ Hiệp', 'Xã', '020'),
('00661', 'Xã Yên Mỹ', 'Xã', '020'),
('00664', 'Xã Vĩnh Quỳnh', 'Xã', '020'),
('00667', 'Xã Ngũ Hiệp', 'Xã', '020'),
('00670', 'Xã Duyên Hà', 'Xã', '020'),
('00673', 'Xã Ngọc Hồi', 'Xã', '020'),
('00676', 'Xã Vạn Phúc', 'Xã', '020'),
('00679', 'Xã Đại áng', 'Xã', '020'),
('00682', 'Xã Liên Ninh', 'Xã', '020'),
('00685', 'Xã Đông Mỹ', 'Xã', '020'),
('06649', 'Phường Hà Khánh', 'Phường', '193'),
('06652', 'Phường Hà Phong', 'Phường', '193'),
('06655', 'Phường Hà Khẩu', 'Phường', '193'),
('06658', 'Phường Cao Xanh', 'Phường', '193'),
('06661', 'Phường Giếng Đáy', 'Phường', '193'),
('06664', 'Phường Hà Tu', 'Phường', '193'),
('06667', 'Phường Hà Trung', 'Phường', '193'),
('06670', 'Phường Hà Lầm', 'Phường', '193'),
('06673', 'Phường Bãi Cháy', 'Phường', '193'),
('06676', 'Phường Cao Thắng', 'Phường', '193'),
('06679', 'Phường Hùng Thắng', 'Phường', '193'),
('06682', 'Phường Yết Kiêu', 'Phường', '193'),
('06685', 'Phường Trần Hưng Đạo', 'Phường', '193'),
('06688', 'Phường Hồng Hải', 'Phường', '193'),
('06691', 'Phường Hồng Gai', 'Phường', '193'),
('06694', 'Phường Bạch Đằng', 'Phường', '193'),
('06697', 'Phường Hồng Hà', 'Phường', '193'),
('06700', 'Phường Tuần Châu', 'Phường', '193'),
('06703', 'Phường Việt Hưng', 'Phường', '193'),
('06706', 'Phường Đại Yên', 'Phường', '193'),
('06709', 'Phường Ka Long', 'Phường', '194'),
('06712', 'Phường Trần Phú', 'Phường', '194'),
('06715', 'Phường Ninh Dương', 'Phường', '194'),
('06718', 'Phường Hoà Lạc', 'Phường', '194'),
('06721', 'Phường Trà Cổ', 'Phường', '194'),
('06724', 'Xã Hải Sơn', 'Xã', '194'),
('06727', 'Xã Bắc Sơn', 'Xã', '194'),
('06730', 'Xã Hải Đông', 'Xã', '194'),
('06733', 'Xã Hải Tiến', 'Xã', '194'),
('06736', 'Phường Hải Yên', 'Phường', '194'),
('06739', 'Xã Quảng Nghĩa', 'Xã', '194'),
('06742', 'Phường Hải Hoà', 'Phường', '194'),
('06745', 'Xã Hải Xuân', 'Xã', '194'),
('06748', 'Xã Vạn Ninh', 'Xã', '194'),
('06751', 'Phường Bình Ngọc', 'Phường', '194'),
('06754', 'Xã Vĩnh Trung', 'Xã', '194'),
('06757', 'Xã Vĩnh Thực', 'Xã', '194'),
('06760', 'Phường Mông Dương', 'Phường', '195'),
('06763', 'Phường Cửa Ông', 'Phường', '195'),
('06766', 'Phường Cẩm Sơn', 'Phường', '195'),
('06769', 'Phường Cẩm Đông', 'Phường', '195'),
('06772', 'Phường Cẩm Phú', 'Phường', '195'),
('06775', 'Phường Cẩm Tây', 'Phường', '195'),
('06778', 'Phường Quang Hanh', 'Phường', '195'),
('06781', 'Phường Cẩm Thịnh', 'Phường', '195'),
('06784', 'Phường Cẩm Thủy', 'Phường', '195'),
('06787', 'Phường Cẩm Thạch', 'Phường', '195'),
('06790', 'Phường Cẩm Thành', 'Phường', '195'),
('06793', 'Phường Cẩm Trung', 'Phường', '195'),
('06796', 'Phường Cẩm Bình', 'Phường', '195'),
('06799', 'Xã Cộng Hòa', 'Xã', '195'),
('06802', 'Xã Cẩm Hải', 'Xã', '195'),
('06805', 'Xã Dương Huy', 'Xã', '195'),
('06808', 'Phường Vàng Danh', 'Phường', '196'),
('06811', 'Phường Thanh Sơn', 'Phường', '196'),
('06814', 'Phường Bắc Sơn', 'Phường', '196'),
('06817', 'Phường Quang Trung', 'Phường', '196'),
('06820', 'Phường Trưng Vương', 'Phường', '196'),
('06823', 'Phường Nam Khê', 'Phường', '196'),
('06826', 'Phường Yên Thanh', 'Phường', '196'),
('06829', 'Xã Thượng Yên Công', 'Xã', '196'),
('06832', 'Phường Phương Đông', 'Phường', '196'),
('06835', 'Phường Phương Nam', 'Phường', '196'),
('06838', 'Thị trấn Bình Liêu', 'Thị trấn', '198'),
('06841', 'Xã Hoành Mô', 'Xã', '198'),
('06844', 'Xã Đồng Tâm', 'Xã', '198'),
('06847', 'Xã Đồng Văn', 'Xã', '198'),
('06850', 'Xã Tình Húc', 'Xã', '198'),
('06853', 'Xã Vô Ngại', 'Xã', '198'),
('06856', 'Xã Lục Hồn', 'Xã', '198'),
('06859', 'Xã Húc Động', 'Xã', '198'),
('06862', 'Thị trấn Tiên Yên', 'Thị trấn', '199'),
('06865', 'Xã Hà Lâu', 'Xã', '199'),
('06868', 'Xã Đại Dực', 'Xã', '199'),
('06869', 'Xã Đại Thành', 'Xã', '199'),
('06871', 'Xã Phong Dụ', 'Xã', '199'),
('06874', 'Xã Điền Xá', 'Xã', '199'),
('06877', 'Xã Đông Ngũ', 'Xã', '199'),
('06880', 'Xã Yên Than', 'Xã', '199'),
('06883', 'Xã Đông Hải', 'Xã', '199'),
('06886', 'Xã Hải Lạng', 'Xã', '199'),
('06889', 'Xã Tiên Lãng', 'Xã', '199'),
('06892', 'Xã Đồng Rui', 'Xã', '199'),
('06895', 'Thị trấn Đầm Hà', 'Thị trấn', '200'),
('06898', 'Xã Quảng Lâm', 'Xã', '200'),
('06901', 'Xã Quảng An', 'Xã', '200'),
('06904', 'Xã Tân Bình', 'Xã', '200'),
('06907', 'Xã Quảng Lợi', 'Xã', '200'),
('06910', 'Xã Dực Yên', 'Xã', '200'),
('06913', 'Xã Quảng Tân', 'Xã', '200'),
('06916', 'Xã Đầm Hà', 'Xã', '200'),
('06917', 'Xã Tân Lập', 'Xã', '200'),
('06919', 'Xã Đại Bình', 'Xã', '200'),
('06922', 'Thị trấn Quảng Hà', 'Thị trấn', '201'),
('06925', 'Xã Quảng Đức', 'Xã', '201'),
('06928', 'Xã Quảng Sơn', 'Xã', '201'),
('06931', 'Xã Quảng Thành', 'Xã', '201'),
('06934', 'Xã Quảng Thắng', 'Xã', '201'),
('06937', 'Xã Quảng Thịnh', 'Xã', '201'),
('06940', 'Xã Quảng Minh', 'Xã', '201'),
('06943', 'Xã Quảng Chính', 'Xã', '201'),
('06946', 'Xã Quảng Long', 'Xã', '201'),
('06949', 'Xã Đường Hoa', 'Xã', '201'),
('06952', 'Xã Quảng Phong', 'Xã', '201'),
('06955', 'Xã Quảng Trung', 'Xã', '201'),
('06958', 'Xã Phú Hải', 'Xã', '201'),
('06961', 'Xã Quảng Điền', 'Xã', '201'),
('06964', 'Xã Tiến Tới', 'Xã', '201'),
('06967', 'Xã Cái Chiên', 'Xã', '201'),
('06970', 'Thị trấn Ba Chẽ', 'Thị trấn', '202'),
('06973', 'Xã Thanh Sơn', 'Xã', '202'),
('06976', 'Xã Thanh Lâm', 'Xã', '202'),
('06979', 'Xã Đạp Thanh', 'Xã', '202'),
('06982', 'Xã Nam Sơn', 'Xã', '202'),
('06985', 'Xã Lương Mông', 'Xã', '202'),
('06988', 'Xã Đồn Đạc', 'Xã', '202'),
('06991', 'Xã Minh Cầm', 'Xã', '202'),
('06994', 'Thị trấn Cái Rồng', 'Thị trấn', '203'),
('06997', 'Xã Đài Xuyên', 'Xã', '203'),
('07000', 'Xã Bình Dân', 'Xã', '203'),
('07003', 'Xã Vạn Yên', 'Xã', '203'),
('07006', 'Xã Minh Châu', 'Xã', '203'),
('07009', 'Xã Đoàn Kết', 'Xã', '203'),
('07012', 'Xã Hạ Long', 'Xã', '203'),
('07015', 'Xã Đông Xá', 'Xã', '203'),
('07018', 'Xã Bản Sen', 'Xã', '203'),
('07021', 'Xã Thắng Lợi', 'Xã', '203'),
('07024', 'Xã Quan Lạn', 'Xã', '203'),
('07027', 'Xã Ngọc Vừng', 'Xã', '203'),
('07030', 'Thị trấn Trới', 'Thị trấn', '204'),
('07033', 'Xã Kỳ Thượng', 'Xã', '204'),
('07036', 'Xã Đồng Sơn', 'Xã', '204'),
('07039', 'Xã Tân Dân', 'Xã', '204'),
('07042', 'Xã Đồng Lâm', 'Xã', '204'),
('07045', 'Xã Hòa Bình', 'Xã', '204'),
('07048', 'Xã Vũ Oai', 'Xã', '204'),
('07051', 'Xã Dân Chủ', 'Xã', '204'),
('07054', 'Xã Quảng La', 'Xã', '204'),
('07057', 'Xã Bằng Cả', 'Xã', '204'),
('07060', 'Xã Thống Nhất', 'Xã', '204'),
('07063', 'Xã Sơn Dương', 'Xã', '204'),
('07066', 'Xã Lê Lợi', 'Xã', '204'),
('07069', 'Phường Mạo Khê', 'Phường', '205'),
('07072', 'Phường Đông Triều', 'Phường', '205'),
('07075', 'Xã An Sinh', 'Xã', '205'),
('07078', 'Xã Tràng Lương', 'Xã', '205'),
('07081', 'Xã Bình Khê', 'Xã', '205'),
('07084', 'Xã Việt Dân', 'Xã', '205'),
('07087', 'Xã Tân Việt', 'Xã', '205'),
('07090', 'Xã Bình Dương', 'Xã', '205'),
('07093', 'Phường Đức Chính', 'Phường', '205'),
('07096', 'Xã Tràng An', 'Xã', '205'),
('07099', 'Xã Nguyễn Huệ', 'Xã', '205'),
('07102', 'Xã Thủy An', 'Xã', '205'),
('07105', 'Phường Xuân Sơn', 'Phường', '205'),
('07108', 'Xã Hồng Thái Tây', 'Xã', '205'),
('07111', 'Xã Hồng Thái Đông', 'Xã', '205'),
('07114', 'Xã Hoàng Quế', 'Xã', '205'),
('07117', 'Xã Yên Thọ', 'Xã', '205'),
('07120', 'Xã Hồng Phong', 'Xã', '205'),
('07123', 'Phường Kim Sơn', 'Phường', '205'),
('07126', 'Phường Hưng Đạo', 'Phường', '205'),
('07129', 'Xã Yên Đức', 'Xã', '205'),
('07132', 'Phường Quảng Yên', 'Phường', '206'),
('07135', 'Phường Đông Mai', 'Phường', '206'),
('07138', 'Phường Minh Thành', 'Phường', '206'),
('07141', 'Xã Điền Công', 'Xã', '196'),
('07144', 'Xã Sông Khoai', 'Xã', '206'),
('07147', 'Xã Hiệp Hòa', 'Xã', '206'),
('07150', 'Phường Cộng Hòa', 'Phường', '206'),
('07153', 'Xã Tiền An', 'Xã', '206'),
('07156', 'Xã Hoàng Tân', 'Xã', '206'),
('07159', 'Phường Tân An', 'Phường', '206'),
('07162', 'Phường Yên Giang', 'Phường', '206'),
('07165', 'Phường Nam Hoà', 'Phường', '206'),
('07168', 'Phường Hà An', 'Phường', '206'),
('07171', 'Xã Cẩm La', 'Xã', '206'),
('07174', 'Phường Phong Hải', 'Phường', '206'),
('07177', 'Phường Yên Hải', 'Phường', '206'),
('07180', 'Xã Liên Hòa', 'Xã', '206'),
('07183', 'Phường Phong Cốc', 'Phường', '206'),
('07186', 'Xã Liên Vị', 'Xã', '206'),
('07189', 'Xã Tiền Phong', 'Xã', '206'),
('07192', 'Thị trấn Cô Tô', 'Thị trấn', '207'),
('07195', 'Xã Đồng Tiến', 'Xã', '207'),
('07198', 'Xã Thanh Lân', 'Xã', '207'),
('07201', 'Phường Thọ Xương', 'Phường', '213'),
('07204', 'Phường Trần Nguyên Hãn', 'Phường', '213'),
('07207', 'Phường Ngô Quyền', 'Phường', '213'),
('07210', 'Phường Hoàng Văn Thụ', 'Phường', '213'),
('07213', 'Phường Trần Phú', 'Phường', '213'),
('07231', 'Phường Dĩnh Kế', 'Phường', '213'),
('07234', 'Thị trấn Cầu Gồ', 'Thị trấn', '215'),
('07237', 'Thị trấn Bố Hạ', 'Thị trấn', '215'),
('07243', 'Xã Đồng Tiến', 'Xã', '215'),
('07246', 'Xã Canh Nậu', 'Xã', '215'),
('07249', 'Xã Xuân Lương', 'Xã', '215'),
('07297', 'Thị trấn Cao Thượng', 'Thị trấn', '216'),
('07300', 'Thị trấn Nhã Nam', 'Thị trấn', '216'),
('07303', 'Xã Lan Giới', 'Xã', '216'),
('07306', 'Xã Nhã Nam', 'Xã', '216'),
('07309', 'Xã Tân Trung', 'Xã', '216'),
('07312', 'Xã Đại Hóa', 'Xã', '216'),
('07315', 'Xã Quang Tiến', 'Xã', '216'),
('07369', 'Thị trấn Kép', 'Thị trấn', '217'),
('07375', 'Thị trấn Vôi', 'Thị trấn', '217'),
('07378', 'Xã Nghĩa Hòa', 'Xã', '217'),
('07381', 'Xã Nghĩa Hưng', 'Xã', '217'),
('07384', 'Xã Quang Thịnh', 'Xã', '217'),
('07387', 'Xã Hương Sơn', 'Xã', '217'),
('07390', 'Xã Đào Mỹ', 'Xã', '217'),
('07444', 'Thị trấn Đồi Ngô', 'Thị trấn', '218'),
('07447', 'Thị trấn Lục Nam', 'Thị trấn', '218'),
('07450', 'Xã Đông Hưng', 'Xã', '218'),
('07453', 'Xã Đông Phú', 'Xã', '218'),
('07456', 'Xã Tam Dị', 'Xã', '218'),
('07459', 'Xã Bảo Sơn', 'Xã', '218'),
('07462', 'Xã Bảo Đài', 'Xã', '218'),
('07465', 'Xã Thanh Lâm', 'Xã', '218'),
('07468', 'Xã Tiên Nha', 'Xã', '218'),
('07471', 'Xã Trường Giang', 'Xã', '218'),
('07474', 'Xã Tiên Hưng', 'Xã', '218'),
('07525', 'Thị trấn Chũ', 'Thị trấn', '219'),
('07528', 'Xã Cấm Sơn', 'Xã', '219'),
('07531', 'Xã Tân Sơn', 'Xã', '219'),
('07534', 'Xã Phong Minh', 'Xã', '219'),
('07537', 'Xã Phong Vân', 'Xã', '219'),
('07540', 'Xã Xa Lý', 'Xã', '219'),
('07543', 'Xã Hộ Đáp', 'Xã', '219'),
('07546', 'Xã Sơn Hải', 'Xã', '219'),
('07549', 'Xã Thanh Hải', 'Xã', '219'),
('07615', 'Thị trấn An Châu', 'Thị trấn', '220'),
('07616', 'Thị trấn Thanh Sơn', 'Thị trấn', '220'),
('07618', 'Xã Thạch Sơn', 'Xã', '220'),
('07621', 'Xã Vân Sơn', 'Xã', '220'),
('07624', 'Xã Hữu Sản', 'Xã', '220'),
('07627', 'Xã Quế Sơn', 'Xã', '220'),
('07630', 'Xã Phúc Thắng', 'Xã', '220'),
('07633', 'Xã Chiên Sơn', 'Xã', '220'),
('07681', 'Thị trấn Neo', 'Thị trấn', '221'),
('07682', 'Thị trấn Tân Dân', 'Thị trấn', '221'),
('07684', 'Xã Lão Hộ', 'Xã', '221'),
('07687', 'Xã Tân Mỹ', 'Xã', '213'),
('07690', 'Xã Hương Gián', 'Xã', '221'),
('07693', 'Xã Tân An', 'Xã', '221'),
('07753', 'Thị trấn  Bích Động', 'Thị trấn', '222'),
('07756', 'Thị trấn Nếnh', 'Thị trấn', '222'),
('07759', 'Xã Thượng Lan', 'Xã', '222'),
('07762', 'Xã Việt Tiến', 'Xã', '222'),
('07765', 'Xã Nghĩa Trung', 'Xã', '222'),
('07768', 'Xã Minh Đức', 'Xã', '222'),
('07771', 'Xã Hương Mai', 'Xã', '222'),
('07774', 'Xã Tự Lạn', 'Xã', '222'),
('07810', 'Thị trấn Thắng', 'Thị trấn', '223'),
('07813', 'Xã Đồng Tân', 'Xã', '223'),
('07816', 'Xã Thanh Vân', 'Xã', '223'),
('07819', 'Xã Hoàng Lương', 'Xã', '223'),
('07822', 'Xã Hoàng Vân', 'Xã', '223'),
('07825', 'Xã Hoàng Thanh', 'Xã', '223'),
('07828', 'Xã Hoàng An', 'Xã', '223'),
('07831', 'Xã Ngọc Sơn', 'Xã', '223'),
('07834', 'Xã Thái Sơn', 'Xã', '223'),
('07837', 'Xã Hòa Sơn', 'Xã', '223'),
('09163', 'Phường Vũ Ninh', 'Phường', '256'),
('09166', 'Phường Đáp Cầu', 'Phường', '256'),
('09169', 'Phường Thị Cầu', 'Phường', '256'),
('09172', 'Phường Kinh Bắc', 'Phường', '256'),
('09193', 'Thị trấn Chờ', 'Thị trấn', '258'),
('09196', 'Xã Dũng Liệt', 'Xã', '258'),
('09199', 'Xã Tam Đa', 'Xã', '258'),
('09202', 'Xã Tam Giang', 'Xã', '258'),
('09205', 'Xã Yên Trung', 'Xã', '258'),
('09208', 'Xã Thụy Hòa', 'Xã', '258'),
('09211', 'Xã Hòa Tiến', 'Xã', '258'),
('09217', 'Xã Đông Tiến', 'Xã', '258'),
('09220', 'Xã Yên Phụ', 'Xã', '258'),
('09223', 'Xã Trung Nghĩa', 'Xã', '258'),
('09247', 'Thị trấn Phố Mới', 'Thị trấn', '259'),
('09250', 'Xã Việt Thống', 'Xã', '259'),
('09253', 'Xã Đại Xuân', 'Xã', '259'),
('09256', 'Xã Kim Chân', 'Xã', '256'),
('09268', 'Xã Quế Tân', 'Xã', '259'),
('09271', 'Phường Vân Dương', 'Phường', '256'),
('09274', 'Xã Phù Lương', 'Xã', '259'),
('09277', 'Xã Phù Lãng', 'Xã', '259'),
('09280', 'Xã Phượng Mao', 'Xã', '259'),
('09283', 'Xã Việt Hùng', 'Xã', '259'),
('09319', 'Thị trấn Lim', 'Thị trấn', '260'),
('09334', 'Xã Liên Bão', 'Xã', '260'),
('09337', 'Xã Hiên Vân', 'Xã', '260'),
('09340', 'Xã Hoàn Sơn', 'Xã', '260'),
('09367', 'Phường Đông Ngàn', 'Phường', '261'),
('09370', 'Xã Tam Sơn', 'Xã', '261'),
('09373', 'Xã Hương Mạc', 'Xã', '261'),
('09400', 'Thị trấn Hồ', 'Thị trấn', '262'),
('09403', 'Xã Hoài Thượng', 'Xã', '262'),
('09406', 'Xã Đại Đồng Thành', 'Xã', '262'),
('09409', 'Xã Mão Điền', 'Xã', '262'),
('09412', 'Xã Song Hồ', 'Xã', '262'),
('09415', 'Xã Đình Tổ', 'Xã', '262'),
('09454', 'Thị trấn Gia Bình', 'Thị trấn', '263'),
('09457', 'Xã Vạn Ninh', 'Xã', '263'),
('09496', 'Thị trấn Thứa', 'Thị trấn', '264'),
('09499', 'Xã An Thịnh', 'Xã', '264'),
('09502', 'Xã Trung Kênh', 'Xã', '264'),
('10507', 'Phường Cẩm Thượng', 'Phường', '288'),
('10510', 'Phường Bình Hàn', 'Phường', '288'),
('10513', 'Phường Ngọc Châu', 'Phường', '288'),
('10514', 'Phường Nhị Châu', 'Phường', '288'),
('10516', 'Phường Quang Trung', 'Phường', '288'),
('10519', 'Phường Nguyễn Trãi', 'Phường', '288'),
('10522', 'Phường Phạm Ngũ Lão', 'Phường', '288'),
('10525', 'Phường Trần Hưng Đạo', 'Phường', '288'),
('10528', 'Phường Trần Phú', 'Phường', '288'),
('10531', 'Phường Thanh Bình', 'Phường', '288'),
('10532', 'Phường Tân Bình', 'Phường', '288'),
('10534', 'Phường Lê Thanh Nghị', 'Phường', '288'),
('10537', 'Phường Hải Tân', 'Phường', '288'),
('10540', 'Phường Tứ Minh', 'Phường', '288'),
('10543', 'Phường Việt Hoà', 'Phường', '288'),
('10546', 'Phường Phả Lại', 'Phường', '290'),
('10549', 'Phường Sao Đỏ', 'Phường', '290'),
('10552', 'Phường Bến Tắm', 'Phường', '290'),
('10555', 'Xã Hoàng Hoa Thám', 'Xã', '290'),
('10558', 'Xã Bắc An', 'Xã', '290'),
('10561', 'Xã Hưng Đạo', 'Xã', '290'),
('10564', 'Xã Lê Lợi', 'Xã', '290'),
('10567', 'Xã Hoàng Tiến', 'Xã', '290'),
('10570', 'Phường Cộng Hoà', 'Phường', '290'),
('10573', 'Phường Hoàng Tân', 'Phường', '290'),
('10576', 'Xã Cổ Thành', 'Xã', '290'),
('10579', 'Phường Văn An', 'Phường', '290'),
('10582', 'Phường Chí Minh', 'Phường', '290'),
('10585', 'Xã Văn Đức', 'Xã', '290'),
('10588', 'Phường Thái Học', 'Phường', '290'),
('10591', 'Xã Nhân Huệ', 'Xã', '290'),
('10594', 'Xã An Lạc', 'Xã', '290'),
('10597', 'Xã Kênh Giang', 'Xã', '290'),
('10600', 'Xã Đồng Lạc', 'Xã', '290'),
('10603', 'Xã Tân Dân', 'Xã', '290'),
('10606', 'Thị trấn Nam Sách', 'Thị trấn', '291'),
('10609', 'Xã Nam Hưng', 'Xã', '291'),
('10612', 'Xã Nam Tân', 'Xã', '291'),
('10615', 'Xã Hợp Tiến', 'Xã', '291'),
('10618', 'Xã Hiệp Cát', 'Xã', '291'),
('10621', 'Xã Thanh Quang', 'Xã', '291'),
('10624', 'Xã Quốc Tuấn', 'Xã', '291'),
('10627', 'Xã Nam Chính', 'Xã', '291'),
('10630', 'Xã An Bình', 'Xã', '291'),
('10633', 'Xã Nam Trung', 'Xã', '291'),
('10636', 'Xã An Sơn', 'Xã', '291'),
('10639', 'Xã Cộng Hòa', 'Xã', '291'),
('10642', 'Xã Thái Tân', 'Xã', '291'),
('10645', 'Xã An Lâm', 'Xã', '291'),
('10648', 'Xã Phú Điền', 'Xã', '291'),
('10651', 'Xã Nam Hồng', 'Xã', '291'),
('10654', 'Xã Hồng Phong', 'Xã', '291'),
('10657', 'Xã Đồng Lạc', 'Xã', '291'),
('10660', 'Phường Ái Quốc', 'Phường', '288'),
('10663', 'Xã An Châu', 'Xã', '288'),
('10666', 'Xã Minh Tân', 'Xã', '291'),
('10669', 'Xã Thượng Đạt', 'Xã', '288'),
('10672', 'Xã Nam Đồng', 'Xã', '288'),
('10675', 'Thị trấn Kinh Môn', 'Thị trấn', '292'),
('10678', 'Xã Bạch Đằng', 'Xã', '292'),
('10681', 'Xã Thất Hùng', 'Xã', '292'),
('10684', 'Xã Lê Ninh', 'Xã', '292'),
('10687', 'Xã Hoành Sơn', 'Xã', '292'),
('10690', 'Xã Phúc Thành B', 'Xã', '292'),
('10693', 'Xã Thái Sơn', 'Xã', '292'),
('10696', 'Xã Duy Tân', 'Xã', '292'),
('10699', 'Xã Tân Dân', 'Xã', '292'),
('10702', 'Thị trấn Minh Tân', 'Thị trấn', '292'),
('10705', 'Xã Quang Trung', 'Xã', '292'),
('10708', 'Xã Hiệp Hòa', 'Xã', '292'),
('10711', 'Xã Phạm Mệnh', 'Xã', '292'),
('10714', 'Thị trấn Phú Thứ', 'Thị trấn', '292'),
('10717', 'Xã Thăng Long', 'Xã', '292'),
('10720', 'Xã Lạc Long', 'Xã', '292'),
('10723', 'Xã An Sinh', 'Xã', '292'),
('10726', 'Xã Hiệp Sơn', 'Xã', '292'),
('10729', 'Xã Thượng Quận', 'Xã', '292'),
('10732', 'Xã An Phụ', 'Xã', '292'),
('10735', 'Xã Hiệp An', 'Xã', '292'),
('10738', 'Xã Long Xuyên', 'Xã', '292'),
('10741', 'Xã Thái Thịnh', 'Xã', '292'),
('10744', 'Xã Hiến Thành', 'Xã', '292'),
('10747', 'Xã Minh Hòa', 'Xã', '292'),
('10750', 'Thị trấn Phú Thái', 'Thị trấn', '293'),
('10753', 'Xã Lai Vu', 'Xã', '293'),
('10756', 'Xã Cộng Hòa', 'Xã', '293'),
('10759', 'Xã Thượng Vũ', 'Xã', '293'),
('10762', 'Xã Cổ Dũng', 'Xã', '293'),
('10765', 'Xã Việt Hưng', 'Xã', '293'),
('10768', 'Xã Tuấn Hưng', 'Xã', '293'),
('10771', 'Xã Kim Xuyên', 'Xã', '293'),
('10774', 'Xã Phúc Thành A', 'Xã', '293'),
('10777', 'Xã Ngũ Phúc', 'Xã', '293'),
('10780', 'Xã Kim Anh', 'Xã', '293'),
('10783', 'Xã Kim Lương', 'Xã', '293'),
('10786', 'Xã Kim Tân', 'Xã', '293'),
('10789', 'Xã Kim Khê', 'Xã', '293'),
('10792', 'Xã Kim Đính', 'Xã', '293'),
('10795', 'Xã Cẩm La', 'Xã', '293'),
('10798', 'Xã Bình Dân', 'Xã', '293'),
('10801', 'Xã Tam Kỳ', 'Xã', '293'),
('10804', 'Xã Đồng Gia', 'Xã', '293'),
('10807', 'Xã Liên Hòa', 'Xã', '293'),
('10810', 'Xã Đại Đức', 'Xã', '293'),
('10813', 'Thị trấn Thanh Hà', 'Thị trấn', '294'),
('10816', 'Xã Hồng Lạc', 'Xã', '294'),
('10819', 'Xã Việt Hồng', 'Xã', '294'),
('10822', 'Xã Quyết Thắng', 'Xã', '294'),
('10825', 'Xã Tân Việt', 'Xã', '294'),
('10828', 'Xã Cẩm Chế', 'Xã', '294'),
('10831', 'Xã Thanh An', 'Xã', '294'),
('10834', 'Xã Thanh Lang', 'Xã', '294'),
('10837', 'Xã Tiền Tiến', 'Xã', '294'),
('10840', 'Xã Tân An', 'Xã', '294'),
('10843', 'Xã Liên Mạc', 'Xã', '294'),
('10846', 'Xã Thanh Hải', 'Xã', '294'),
('10849', 'Xã Thanh Khê', 'Xã', '294'),
('10852', 'Xã Thanh Xá', 'Xã', '294'),
('10855', 'Xã Thanh Xuân', 'Xã', '294'),
('10858', 'Xã An Lương', 'Xã', '294'),
('10861', 'Xã Thanh Thủy', 'Xã', '294'),
('10864', 'Xã Phượng Hoàng', 'Xã', '294'),
('10867', 'Xã Thanh Sơn', 'Xã', '294'),
('10870', 'Xã Hợp Đức', 'Xã', '294'),
('10873', 'Xã Trường Thành', 'Xã', '294'),
('10876', 'Xã Thanh Bính', 'Xã', '294'),
('10879', 'Xã Thanh Hồng', 'Xã', '294'),
('10882', 'Xã Thanh Cường', 'Xã', '294'),
('10885', 'Xã Vĩnh Lập', 'Xã', '294'),
('10888', 'Thị trấn Cẩm Giàng', 'Thị trấn', '295'),
('10891', 'Thị trấn Lai Cách', 'Thị trấn', '295'),
('10894', 'Xã Cẩm Hưng', 'Xã', '295'),
('10897', 'Xã Cẩm Hoàng', 'Xã', '295'),
('10900', 'Xã Cẩm Văn', 'Xã', '295'),
('10903', 'Xã Ngọc Liên', 'Xã', '295'),
('10906', 'Xã Thạch Lỗi', 'Xã', '295'),
('10909', 'Xã Cẩm Vũ', 'Xã', '295'),
('10912', 'Xã Đức Chính', 'Xã', '295'),
('10915', 'Xã Cẩm Sơn', 'Xã', '295'),
('10918', 'Xã Cẩm Định', 'Xã', '295'),
('10921', 'Xã Kim Giang', 'Xã', '295'),
('10924', 'Xã Lương Điền', 'Xã', '295'),
('10927', 'Xã Cao An', 'Xã', '295'),
('10930', 'Xã Tân Trường', 'Xã', '295'),
('10945', 'Thị trấn Kẻ Sặt', 'Thị trấn', '296'),
('10948', 'Xã Hưng Thịnh', 'Xã', '296'),
('10951', 'Xã Vĩnh Tuy', 'Xã', '296'),
('10954', 'Xã Hùng Thắng', 'Xã', '296'),
('10957', 'Xã Tráng Liệt', 'Xã', '296'),
('10960', 'Xã Vĩnh Hồng', 'Xã', '296'),
('10963', 'Xã Long Xuyên', 'Xã', '296'),
('10966', 'Xã Tân Việt', 'Xã', '296'),
('10984', 'Xã Cổ Bi', 'Xã', '296'),
('10987', 'Xã Nhân Quyền', 'Xã', '296'),
('10990', 'Xã Thái Dương', 'Xã', '296'),
('10993', 'Xã Thái Hòa', 'Xã', '296'),
('10996', 'Xã Bình Xuyên', 'Xã', '296'),
('10999', 'Thị trấn Gia Lộc', 'Thị trấn', '297'),
('11002', 'Phường Thạch Khôi', 'Phường', '288'),
('11005', 'Xã Liên Hồng', 'Xã', '297'),
('11008', 'Xã Thống Nhất', 'Xã', '297'),
('11011', 'Xã Tân Hưng', 'Xã', '288'),
('11014', 'Xã Trùng Khánh', 'Xã', '297'),
('11017', 'Xã Gia Xuyên', 'Xã', '297'),
('11020', 'Xã Yết Kiêu', 'Xã', '297'),
('11023', 'Xã Gia Hòa', 'Xã', '297'),
('11026', 'Xã Phương Hưng', 'Xã', '297'),
('11029', 'Xã Gia Tân', 'Xã', '297'),
('11032', 'Xã Tân Tiến', 'Xã', '297'),
('11035', 'Xã Gia Khánh', 'Xã', '297'),
('11038', 'Xã Gia Lương', 'Xã', '297'),
('11041', 'Xã Lê Lợi', 'Xã', '297'),
('11044', 'Xã Toàn Thắng', 'Xã', '297'),
('11047', 'Xã Hoàng Diệu', 'Xã', '297'),
('11050', 'Xã Hồng Hưng', 'Xã', '297'),
('11053', 'Xã Phạm Trấn', 'Xã', '297'),
('11056', 'Xã Đoàn Thượng', 'Xã', '297'),
('11059', 'Xã Thống Kênh', 'Xã', '297'),
('11062', 'Xã Quang Minh', 'Xã', '297'),
('11065', 'Xã Đồng Quang', 'Xã', '297'),
('11068', 'Xã Nhật Tân', 'Xã', '297'),
('11071', 'Xã Đức Xương', 'Xã', '297'),
('11074', 'Thị trấn Tứ Kỳ', 'Thị trấn', '298'),
('11077', 'Xã Ngọc Sơn', 'Xã', '298'),
('11080', 'Xã Kỳ Sơn', 'Xã', '298'),
('11083', 'Xã Đại Đồng', 'Xã', '298'),
('11086', 'Xã Hưng Đạo', 'Xã', '298'),
('11089', 'Xã Ngọc Kỳ', 'Xã', '298'),
('11092', 'Xã Bình Lăng', 'Xã', '298'),
('11095', 'Xã Tứ Xuyên', 'Xã', '298'),
('11098', 'Xã Tái Sơn', 'Xã', '298'),
('11101', 'Xã Quang Phục', 'Xã', '298'),
('11104', 'Xã Đông Kỳ', 'Xã', '298'),
('11107', 'Xã Tây Kỳ', 'Xã', '298'),
('11110', 'Xã Dân Chủ', 'Xã', '298'),
('11113', 'Xã Tân Kỳ', 'Xã', '298'),
('11116', 'Xã Quang Khải', 'Xã', '298'),
('11119', 'Xã Đại Hợp', 'Xã', '298'),
('11122', 'Xã Quảng Nghiệp', 'Xã', '298'),
('11125', 'Xã An Thanh', 'Xã', '298'),
('11128', 'Xã Minh Đức', 'Xã', '298'),
('11131', 'Xã Văn Tố', 'Xã', '298'),
('11134', 'Xã Quang Trung', 'Xã', '298'),
('11137', 'Xã Phượng Kỳ', 'Xã', '298'),
('11140', 'Xã Cộng Lạc', 'Xã', '298'),
('11143', 'Xã Tiên Động', 'Xã', '298'),
('11146', 'Xã Nguyên Giáp', 'Xã', '298'),
('11149', 'Xã Hà Kỳ', 'Xã', '298'),
('11152', 'Xã Hà Thanh', 'Xã', '298'),
('11155', 'Thị trấn Ninh Giang', 'Thị trấn', '299'),
('11158', 'Xã Quyết Thắng', 'Xã', '299'),
('11161', 'Xã Ứng Hoè', 'Xã', '299'),
('11164', 'Xã Nghĩa An', 'Xã', '299'),
('11167', 'Xã Hồng Đức', 'Xã', '299'),
('11170', 'Xã Ninh Hòa', 'Xã', '299'),
('11173', 'Xã An Đức', 'Xã', '299'),
('11176', 'Xã Vạn Phúc', 'Xã', '299'),
('11179', 'Xã Tân Hương', 'Xã', '299'),
('11239', 'Thị trấn Thanh Miện', 'Thị trấn', '300'),
('11242', 'Xã Thanh Tùng', 'Xã', '300'),
('11245', 'Xã Phạm Kha', 'Xã', '300'),
('11248', 'Xã Ngô Quyền', 'Xã', '300'),
('11251', 'Xã Đoàn Tùng', 'Xã', '300'),
('11254', 'Xã Hồng Quang', 'Xã', '300'),
('11257', 'Xã Tân Trào', 'Xã', '300'),
('11296', 'Phường Quán Toan', 'Phường', '303'),
('11299', 'Phường Hùng Vương', 'Phường', '303'),
('11302', 'Phường Sở Dầu', 'Phường', '303'),
('11305', 'Phường Thượng Lý', 'Phường', '303'),
('11308', 'Phường Hạ Lý', 'Phường', '303'),
('11311', 'Phường Minh Khai', 'Phường', '303'),
('11314', 'Phường Trại Chuối', 'Phường', '303'),
('11317', 'Phường Quang Trung', 'Phường', '303'),
('11320', 'Phường Hoàng Văn Thụ', 'Phường', '303'),
('11323', 'Phường Phan Bội Châu', 'Phường', '303'),
('11326', 'Phường Phạm Hồng Thái', 'Phường', '303'),
('11329', 'Phường Máy Chai', 'Phường', '304'),
('11332', 'Phường Máy Tơ', 'Phường', '304'),
('11335', 'Phường Vạn Mỹ', 'Phường', '304'),
('11338', 'Phường Cầu Tre', 'Phường', '304'),
('11341', 'Phường Lạc Viên', 'Phường', '304'),
('11344', 'Phường Lương Khánh Thiện', 'Phường', '304'),
('11347', 'Phường Gia Viên', 'Phường', '304'),
('11350', 'Phường Đông Khê', 'Phường', '304'),
('11353', 'Phường Cầu Đất', 'Phường', '304'),
('11356', 'Phường Lê Lợi', 'Phường', '304'),
('11359', 'Phường Đằng Giang', 'Phường', '304'),
('11362', 'Phường Lạch Tray', 'Phường', '304'),
('11365', 'Phường Đổng Quốc Bình', 'Phường', '304'),
('11368', 'Phường Cát Dài', 'Phường', '305'),
('11371', 'Phường An Biên', 'Phường', '305'),
('11374', 'Phường Lam Sơn', 'Phường', '305'),
('11377', 'Phường An Dương', 'Phường', '305'),
('11380', 'Phường Trần Nguyên Hãn', 'Phường', '305'),
('11383', 'Phường Hồ Nam', 'Phường', '305'),
('11386', 'Phường Trại Cau', 'Phường', '305'),
('11389', 'Phường Dư Hàng', 'Phường', '305'),
('11392', 'Phường Hàng Kênh', 'Phường', '305'),
('11395', 'Phường Đông Hải', 'Phường', '305'),
('11398', 'Phường Niệm Nghĩa', 'Phường', '305'),
('11401', 'Phường Nghĩa Xá', 'Phường', '305'),
('11404', 'Phường Dư Hàng Kênh', 'Phường', '305'),
('11405', 'Phường Kênh Dương', 'Phường', '305'),
('11407', 'Phường Vĩnh Niệm', 'Phường', '305'),
('11410', 'Phường Đông Hải 1', 'Phường', '306'),
('11411', 'Phường Đông Hải 2', 'Phường', '306'),
('11413', 'Phường Đằng Lâm', 'Phường', '306'),
('11414', 'Phường Thành Tô', 'Phường', '306'),
('11416', 'Phường Đằng Hải', 'Phường', '306'),
('11419', 'Phường Nam Hải', 'Phường', '306'),
('11422', 'Phường Cát Bi', 'Phường', '306'),
('11425', 'Phường Tràng Cát', 'Phường', '306'),
('11428', 'Phường Quán Trữ', 'Phường', '307'),
('11429', 'Phường Lãm Hà', 'Phường', '307'),
('11431', 'Phường Đồng Hoà', 'Phường', '307'),
('11434', 'Phường Bắc Sơn', 'Phường', '307'),
('11437', 'Phường Nam Sơn', 'Phường', '307'),
('11440', 'Phường Ngọc Sơn', 'Phường', '307'),
('11443', 'Phường Trần Thành Ngọ', 'Phường', '307'),
('11446', 'Phường Văn Đẩu', 'Phường', '307'),
('11449', 'Phường Phù Liễn', 'Phường', '307'),
('11452', 'Phường Tràng Minh', 'Phường', '307'),
('11455', 'Phường Ngọc Xuyên', 'Phường', '308'),
('11458', 'Phường Ngọc Hải', 'Phường', '308'),
('11461', 'Phường Vạn Hương', 'Phường', '308'),
('11464', 'Phường Vạn Sơn', 'Phường', '308'),
('11465', 'Phường Minh Đức', 'Phường', '308'),
('11467', 'Phường Bàng La', 'Phường', '308'),
('11470', 'Thị trấn Núi Đèo', 'Thị trấn', '311'),
('11473', 'Thị trấn Minh Đức', 'Thị trấn', '311'),
('11476', 'Xã Lại Xuân', 'Xã', '311'),
('11479', 'Xã An Sơn', 'Xã', '311'),
('11482', 'Xã Kỳ Sơn', 'Xã', '311'),
('11485', 'Xã Liên Khê', 'Xã', '311'),
('11488', 'Xã Lưu Kiếm', 'Xã', '311'),
('11491', 'Xã Lưu Kỳ', 'Xã', '311'),
('11494', 'Xã Gia Minh', 'Xã', '311'),
('11497', 'Xã Gia Đức', 'Xã', '311'),
('11500', 'Xã Minh Tân', 'Xã', '311'),
('11503', 'Xã Phù Ninh', 'Xã', '311'),
('11506', 'Xã Quảng Thanh', 'Xã', '311'),
('11509', 'Xã Chính Mỹ', 'Xã', '311'),
('11512', 'Xã Kênh Giang', 'Xã', '311'),
('11515', 'Xã Hợp Thành', 'Xã', '311'),
('11518', 'Xã Cao Nhân', 'Xã', '311'),
('11521', 'Xã Mỹ Đồng', 'Xã', '311'),
('11524', 'Xã Đông Sơn', 'Xã', '311'),
('11527', 'Xã Hoà Bình', 'Xã', '311'),
('11530', 'Xã Trung Hà', 'Xã', '311'),
('11533', 'Xã An Lư', 'Xã', '311'),
('11536', 'Xã Thuỷ Triều', 'Xã', '311'),
('11539', 'Xã Ngũ Lão', 'Xã', '311'),
('11542', 'Xã Phục Lễ', 'Xã', '311'),
('11545', 'Xã Tam Hưng', 'Xã', '311'),
('11548', 'Xã Phả Lễ', 'Xã', '311'),
('11551', 'Xã Lập Lễ', 'Xã', '311'),
('11554', 'Xã Kiền Bái', 'Xã', '311'),
('11557', 'Xã Thiên Hương', 'Xã', '311'),
('11560', 'Xã Thuỷ Sơn', 'Xã', '311'),
('11563', 'Xã Thuỷ Đường', 'Xã', '311'),
('11566', 'Xã Hoàng Động', 'Xã', '311'),
('11569', 'Xã Lâm Động', 'Xã', '311'),
('11572', 'Xã Hoa Động', 'Xã', '311'),
('11575', 'Xã Tân Dương', 'Xã', '311'),
('11578', 'Xã Dương Quan', 'Xã', '311'),
('11581', 'Thị trấn An Dương', 'Thị trấn', '312'),
('11584', 'Xã Lê Thiện', 'Xã', '312'),
('11587', 'Xã Đại Bản', 'Xã', '312'),
('11590', 'Xã An Hoà', 'Xã', '312'),
('11593', 'Xã Hồng Phong', 'Xã', '312'),
('11596', 'Xã Tân Tiến', 'Xã', '312'),
('11599', 'Xã An Hưng', 'Xã', '312'),
('11602', 'Xã An Hồng', 'Xã', '312'),
('11605', 'Xã Bắc Sơn', 'Xã', '312'),
('11608', 'Xã Nam Sơn', 'Xã', '312'),
('11611', 'Xã Lê Lợi', 'Xã', '312'),
('11614', 'Xã Đặng Cương', 'Xã', '312'),
('11617', 'Xã Đồng Thái', 'Xã', '312'),
('11620', 'Xã Quốc Tuấn', 'Xã', '312'),
('11623', 'Xã An Đồng', 'Xã', '312'),
('11626', 'Xã Hồng Thái', 'Xã', '312'),
('11629', 'Thị trấn An Lão', 'Thị trấn', '313'),
('11632', 'Xã Bát Trang', 'Xã', '313'),
('11635', 'Xã Trường Thọ', 'Xã', '313'),
('11638', 'Xã Trường Thành', 'Xã', '313'),
('11641', 'Xã An Tiến', 'Xã', '313'),
('11644', 'Xã Quang Hưng', 'Xã', '313'),
('11647', 'Xã Quang Trung', 'Xã', '313'),
('11650', 'Xã Quốc Tuấn', 'Xã', '313'),
('11653', 'Xã An Thắng', 'Xã', '313'),
('11656', 'Thị trấn Trường Sơn', 'Thị trấn', '313'),
('11659', 'Xã Tân Dân', 'Xã', '313'),
('11662', 'Xã Thái Sơn', 'Xã', '313'),
('11665', 'Xã Tân Viên', 'Xã', '313'),
('11668', 'Xã Mỹ Đức', 'Xã', '313'),
('11671', 'Xã Chiến Thắng', 'Xã', '313'),
('11674', 'Xã An Thọ', 'Xã', '313'),
('11677', 'Xã An Thái', 'Xã', '313'),
('11680', 'Thị trấn Núi Đối', 'Thị trấn', '314'),
('11683', 'Phường Đa Phúc', 'Phường', '309'),
('11686', 'Phường Hưng Đạo', 'Phường', '309'),
('11689', 'Phường Anh Dũng', 'Phường', '309'),
('11692', 'Phường Hải Thành', 'Phường', '309'),
('11695', 'Xã Đông Phương', 'Xã', '314'),
('11698', 'Xã Thuận Thiên', 'Xã', '314'),
('11701', 'Xã Hữu Bằng', 'Xã', '314'),
('11704', 'Xã Đại Đồng', 'Xã', '314'),
('11707', 'Phường Hoà Nghĩa', 'Phường', '309'),
('11710', 'Xã Ngũ Phúc', 'Xã', '314'),
('11713', 'Xã Kiến Quốc', 'Xã', '314'),
('11716', 'Xã Du Lễ', 'Xã', '314'),
('11719', 'Xã Thuỵ Hương', 'Xã', '314'),
('11722', 'Xã Thanh Sơn', 'Xã', '314'),
('11725', 'Xã Minh Tân', 'Xã', '314'),
('11728', 'Xã Đại Hà', 'Xã', '314'),
('11731', 'Xã Ngũ Đoan', 'Xã', '314'),
('11734', 'Xã Tân Phong', 'Xã', '314'),
('11737', 'Phường Hợp Đức', 'Phường', '308'),
('11740', 'Phường Tân Thành', 'Phường', '309'),
('11743', 'Xã Tân Trào', 'Xã', '314'),
('11746', 'Xã Đoàn Xá', 'Xã', '314'),
('11749', 'Xã Tú Sơn', 'Xã', '314'),
('11752', 'Xã Đại Hợp', 'Xã', '314'),
('11755', 'Thị trấn Tiên Lãng', 'Thị trấn', '315'),
('11758', 'Xã Đại Thắng', 'Xã', '315'),
('11761', 'Xã Tiên Cường', 'Xã', '315'),
('11764', 'Xã Tự Cường', 'Xã', '315'),
('11767', 'Xã Tiên Tiến', 'Xã', '315'),
('11770', 'Xã Quyết Tiến', 'Xã', '315'),
('11773', 'Xã Khởi Nghĩa', 'Xã', '315'),
('11776', 'Xã Tiên Thanh', 'Xã', '315'),
('11779', 'Xã Cấp Tiến', 'Xã', '315'),
('11782', 'Xã Kiến Thiết', 'Xã', '315'),
('11785', 'Xã Đoàn Lập', 'Xã', '315'),
('11788', 'Xã Bạch Đằng', 'Xã', '315'),
('11791', 'Xã Quang Phục', 'Xã', '315'),
('11794', 'Xã Toàn Thắng', 'Xã', '315'),
('11797', 'Xã Tiên Thắng', 'Xã', '315'),
('11800', 'Xã Tiên Minh', 'Xã', '315'),
('11803', 'Xã Bắc Hưng', 'Xã', '315'),
('11806', 'Xã Nam Hưng', 'Xã', '315'),
('11809', 'Xã Hùng Thắng', 'Xã', '315'),
('11812', 'Xã Tây Hưng', 'Xã', '315'),
('11815', 'Xã Đông Hưng', 'Xã', '315'),
('11818', 'Xã Tiên Hưng', 'Xã', '315'),
('11821', 'Xã Vinh Quang', 'Xã', '315'),
('11824', 'Thị trấn Vĩnh Bảo', 'Thị trấn', '316'),
('11827', 'Xã Dũng Tiến', 'Xã', '316'),
('11830', 'Xã Giang Biên', 'Xã', '316'),
('11833', 'Xã Thắng Thuỷ', 'Xã', '316'),
('11836', 'Xã Trung Lập', 'Xã', '316'),
('11839', 'Xã Việt Tiến', 'Xã', '316'),
('11842', 'Xã Vĩnh An', 'Xã', '316'),
('11845', 'Xã Vĩnh Long', 'Xã', '316'),
('11848', 'Xã Hiệp Hoà', 'Xã', '316'),
('11851', 'Xã Hùng Tiến', 'Xã', '316'),
('11854', 'Xã An Hoà', 'Xã', '316'),
('11857', 'Xã Tân Hưng', 'Xã', '316'),
('11860', 'Xã Tân Liên', 'Xã', '316'),
('11863', 'Xã Nhân Hoà', 'Xã', '316'),
('11866', 'Xã Tam Đa', 'Xã', '316'),
('11869', 'Xã Hưng Nhân', 'Xã', '316'),
('11872', 'Xã Vinh Quang', 'Xã', '316'),
('11875', 'Xã Đồng Minh', 'Xã', '316'),
('11878', 'Xã Thanh Lương', 'Xã', '316'),
('11881', 'Xã Liên Am', 'Xã', '316'),
('11884', 'Xã Lý Học', 'Xã', '316'),
('11887', 'Xã Tam Cường', 'Xã', '316'),
('11890', 'Xã Hoà Bình', 'Xã', '316'),
('11893', 'Xã Tiền Phong', 'Xã', '316'),
('11896', 'Xã Vĩnh Phong', 'Xã', '316'),
('11899', 'Xã Cộng Hiền', 'Xã', '316'),
('11902', 'Xã Cao Minh', 'Xã', '316'),
('11905', 'Xã Cổ Am', 'Xã', '316'),
('11908', 'Xã Vĩnh Tiến', 'Xã', '316'),
('11911', 'Xã Trấn Dương', 'Xã', '316'),
('11914', 'Thị trấn Cát Bà', 'Thị trấn', '317'),
('11917', 'Thị trấn Cát Hải', 'Thị trấn', '317'),
('11920', 'Xã Nghĩa Lộ', 'Xã', '317'),
('11923', 'Xã Đồng Bài', 'Xã', '317'),
('11926', 'Xã Hoàng Châu', 'Xã', '317'),
('11929', 'Xã Văn Phong', 'Xã', '317'),
('11932', 'Xã Phù Long', 'Xã', '317'),
('11935', 'Xã Gia Luận', 'Xã', '317'),
('11938', 'Xã Hiền Hào', 'Xã', '317'),
('11941', 'Xã Trân Châu', 'Xã', '317'),
('11944', 'Xã Việt Hải', 'Xã', '317'),
('11947', 'Xã Xuân Đám', 'Xã', '317'),
('11950', 'Phường Lam Sơn', 'Phường', '323'),
('11953', 'Phường Hiến Nam', 'Phường', '323'),
('11956', 'Phường An Tảo', 'Phường', '323'),
('11971', 'Xã Trung Nghĩa', 'Xã', '323'),
('11974', 'Xã Liên Phương', 'Xã', '323'),
('11977', 'Xã Hồng Nam', 'Xã', '323'),
('11980', 'Xã Quảng Châu', 'Xã', '323'),
('11983', 'Xã Bảo Khê', 'Xã', '323'),
('11986', 'Thị trấn Như Quỳnh', 'Thị trấn', '325'),
('11989', 'Xã Lạc Đạo', 'Xã', '325'),
('11992', 'Xã Chỉ Đạo', 'Xã', '325'),
('11995', 'Xã Đại Đồng', 'Xã', '325'),
('12019', 'Thị trấn Văn Giang', 'Thị trấn', '326'),
('12022', 'Xã Xuân Quan', 'Xã', '326'),
('12025', 'Xã Cửu Cao', 'Xã', '326'),
('12028', 'Xã Phụng Công', 'Xã', '326'),
('12031', 'Xã Nghĩa Trụ', 'Xã', '326'),
('12052', 'Thị trấn Yên Mỹ', 'Thị trấn', '327'),
('12055', 'Xã Giai Phạm', 'Xã', '327'),
('12058', 'Xã Nghĩa Hiệp', 'Xã', '327'),
('12061', 'Xã Đồng Than', 'Xã', '327'),
('12064', 'Xã Ngọc Long', 'Xã', '327'),
('12067', 'Xã Liêu Xá', 'Xã', '327'),
('12070', 'Xã Hoàn Long', 'Xã', '327'),
('12103', 'Thị trấn Bần Yên Nhân', 'Thị trấn', '328'),
('12106', 'Xã Phan Đình Phùng', 'Xã', '328'),
('12109', 'Xã Cẩm Xá', 'Xã', '328'),
('12112', 'Xã Dương Quang', 'Xã', '328'),
('12115', 'Xã Hòa Phong', 'Xã', '328'),
('12118', 'Xã Nhân Hòa', 'Xã', '328'),
('12121', 'Xã Dị Sử', 'Xã', '328'),
('12124', 'Xã Bạch Sam', 'Xã', '328'),
('12127', 'Xã Minh Đức', 'Xã', '328'),
('12130', 'Xã Phùng Chí Kiên', 'Xã', '328'),
('12133', 'Xã Xuân Dục', 'Xã', '328'),
('12136', 'Xã Ngọc Lâm', 'Xã', '328'),
('12139', 'Xã Hưng Long', 'Xã', '328'),
('12142', 'Thị trấn Ân Thi', 'Thị trấn', '329'),
('12145', 'Xã Phù Ủng', 'Xã', '329'),
('12148', 'Xã Bắc Sơn', 'Xã', '329'),
('12151', 'Xã Bãi Sậy', 'Xã', '329'),
('12154', 'Xã Đào Dương', 'Xã', '329'),
('12157', 'Xã Tân Phúc', 'Xã', '329'),
('12160', 'Xã Vân Du', 'Xã', '329'),
('12163', 'Xã Quang Vinh', 'Xã', '329'),
('12166', 'Xã Xuân Trúc', 'Xã', '329'),
('12169', 'Xã Hoàng Hoa Thám', 'Xã', '329'),
('12172', 'Xã Quảng Lãng', 'Xã', '329'),
('12175', 'Xã Văn Nhuệ', 'Xã', '329'),
('12178', 'Xã Đặng Lễ', 'Xã', '329'),
('12181', 'Xã Cẩm Ninh', 'Xã', '329'),
('12184', 'Xã Nguyễn Trãi', 'Xã', '329'),
('12187', 'Xã Đa Lộc', 'Xã', '329'),
('12190', 'Xã Hồ Tùng Mậu', 'Xã', '329'),
('12193', 'Xã Tiền Phong', 'Xã', '329'),
('12196', 'Xã Hồng Vân', 'Xã', '329'),
('12199', 'Xã Hồng Quang', 'Xã', '329'),
('12202', 'Xã Hạ Lễ', 'Xã', '329'),
('12205', 'Thị trấn Khoái Châu', 'Thị trấn', '330'),
('12208', 'Xã Đông Tảo', 'Xã', '330'),
('12211', 'Xã Bình Minh', 'Xã', '330'),
('12214', 'Xã Dạ Trạch', 'Xã', '330'),
('12217', 'Xã Hàm Tử', 'Xã', '330'),
('12220', 'Xã Ông Đình', 'Xã', '330'),
('12223', 'Xã Tân Dân', 'Xã', '330'),
('12226', 'Xã Tứ Dân', 'Xã', '330'),
('12280', 'Thị trấn Lương Bằng', 'Thị trấn', '331'),
('12283', 'Xã Nghĩa Dân', 'Xã', '331'),
('12286', 'Xã Toàn Thắng', 'Xã', '331'),
('12289', 'Xã Vĩnh Xá', 'Xã', '331'),
('12292', 'Xã Phạm Ngũ Lão', 'Xã', '331'),
('12295', 'Xã Thọ Vinh', 'Xã', '331'),
('12298', 'Xã Đồng Thanh', 'Xã', '331'),
('12301', 'Xã Song Mai', 'Xã', '331'),
('12337', 'Thị trấn Vương', 'Thị trấn', '332'),
('12340', 'Xã Hưng Đạo', 'Xã', '332'),
('12343', 'Xã Ngô Quyền', 'Xã', '332'),
('12346', 'Xã Nhật Tân', 'Xã', '332'),
('12349', 'Xã Dị Chế', 'Xã', '332'),
('12388', 'Xã Hoàng Hanh', 'Xã', '323'),
('12391', 'Thị trấn Trần Cao', 'Thị trấn', '333'),
('12394', 'Xã Minh Tân', 'Xã', '333'),
('12397', 'Xã Phan Sào Nam', 'Xã', '333'),
('12400', 'Xã Quang Hưng', 'Xã', '333'),
('12403', 'Xã Minh Hoàng', 'Xã', '333'),
('12406', 'Xã Đoàn Đào', 'Xã', '333'),
('12433', 'Phường Lê Hồng Phong', 'Phường', '336'),
('12436', 'Phường Bồ Xuyên', 'Phường', '336'),
('12439', 'Phường Đề Thám', 'Phường', '336'),
('12442', 'Phường Kỳ Bá', 'Phường', '336'),
('12472', 'Thị trấn Quỳnh Côi', 'Thị trấn', '338'),
('12475', 'Xã An Khê', 'Xã', '338'),
('12478', 'Xã An Đồng', 'Xã', '338'),
('12565', 'Xã An Vinh', 'Xã', '338'),
('12568', 'Xã Quỳnh Xá', 'Xã', '338'),
('12571', 'Xã An Dục', 'Xã', '338'),
('12574', 'Xã Đông Hải', 'Xã', '338'),
('12577', 'Xã Quỳnh Trang', 'Xã', '338'),
('12631', 'Xã Đông Đô', 'Xã', '339'),
('12634', 'Xã Phúc Khánh', 'Xã', '339'),
('12637', 'Xã Liên Hiệp', 'Xã', '339'),
('12688', 'Thị trấn Đông Hưng', 'Thị trấn', '340'),
('12691', 'Xã Đô Lương', 'Xã', '340'),
('12694', 'Xã Đông Phương', 'Xã', '340'),
('12697', 'Xã Liên Giang', 'Xã', '340'),
('12700', 'Xã An Châu', 'Xã', '340'),
('12703', 'Xã Đông Sơn', 'Xã', '340'),
('12706', 'Xã Đông Cường', 'Xã', '340'),
('12793', 'Xã Đông Phong', 'Xã', '340'),
('12796', 'Xã Đông Quang', 'Xã', '340'),
('12799', 'Xã Đông Xuân', 'Xã', '340'),
('12823', 'Xã Đồng Phú', 'Xã', '340'),
('12826', 'Thị trấn Diêm Điền', 'Thị trấn', '341'),
('12829', 'Xã Thụy Tân', 'Xã', '341'),
('12832', 'Xã Thụy Trường', 'Xã', '341'),
('12835', 'Xã Hồng Quỳnh', 'Xã', '341'),
('12838', 'Xã Thụy Dũng', 'Xã', '341'),
('12910', 'Xã Thái Nguyên', 'Xã', '341'),
('12913', 'Xã Thái Thủy', 'Xã', '341'),
('12916', 'Xã Thái Dương', 'Xã', '341'),
('12967', 'Xã Thái Thọ', 'Xã', '341'),
('12970', 'Thị trấn Tiền Hải', 'Thị trấn', '342'),
('12973', 'Xã Đông Hải', 'Xã', '342'),
('12976', 'Xã Đông Trà', 'Xã', '342'),
('12979', 'Xã Đông Long', 'Xã', '342'),
('12982', 'Xã Đông Quí', 'Xã', '342'),
('12985', 'Xã Vũ Lăng', 'Xã', '342'),
('13075', 'Thị trấn Thanh Nê', 'Thị trấn', '343'),
('13078', 'Xã Trà Giang', 'Xã', '343'),
('13081', 'Xã Quốc Tuấn', 'Xã', '343'),
('13084', 'Xã Vũ Đông', 'Xã', '336'),
('13087', 'Xã An Bình', 'Xã', '343'),
('13090', 'Xã Vũ Tây', 'Xã', '343'),
('13093', 'Xã Hồng Thái', 'Xã', '343'),
('13096', 'Xã Bình Nguyên', 'Xã', '343'),
('13099', 'Xã Vũ Sơn', 'Xã', '343'),
('13102', 'Xã Lê Lợi', 'Xã', '343'),
('13105', 'Xã Quyết Tiến', 'Xã', '343'),
('13192', 'Thị trấn Vũ Thư', 'Thị trấn', '344'),
('13195', 'Xã Hồng Lý', 'Xã', '344'),
('13198', 'Xã Đồng Thanh', 'Xã', '344'),
('13201', 'Xã Xuân Hòa', 'Xã', '344'),
('13204', 'Xã Hiệp Hòa', 'Xã', '344'),
('13207', 'Xã Phúc Thành', 'Xã', '344'),
('13285', 'Phường Quang Trung', 'Phường', '347'),
('13288', 'Phường Lương Khánh Thiện', 'Phường', '347'),
('13291', 'Phường Lê Hồng Phong', 'Phường', '347'),
('13321', 'Thị trấn Đồng Văn', 'Thị trấn', '349'),
('13324', 'Thị trấn Hòa Mạc', 'Thị trấn', '349'),
('13327', 'Xã Mộc Bắc', 'Xã', '349'),
('13330', 'Xã Châu Giang', 'Xã', '349'),
('13333', 'Xã Bạch Thượng', 'Xã', '349'),
('13336', 'Xã Duy Minh', 'Xã', '349'),
('13384', 'Thị trấn Quế', 'Thị trấn', '350'),
('13387', 'Xã Nguyễn Úy', 'Xã', '350'),
('13390', 'Xã Đại Cương', 'Xã', '350'),
('13393', 'Xã Lê Hồ', 'Xã', '350'),
('13396', 'Xã Tượng Lĩnh', 'Xã', '350'),
('13399', 'Xã Nhật Tựu', 'Xã', '350'),
('13402', 'Xã Nhật Tân', 'Xã', '350'),
('13405', 'Xã Đồng Hóa', 'Xã', '350'),
('13408', 'Xã Hoàng Tây', 'Xã', '350'),
('13441', 'Thị trấn Kiện Khê', 'Thị trấn', '351'),
('13444', 'Xã Liêm Tuyền', 'Xã', '347'),
('13447', 'Xã Liêm Tiết', 'Xã', '347'),
('13450', 'Xã Liêm Phong', 'Xã', '351'),
('13486', 'Xã Thanh Hương', 'Xã', '351'),
('13489', 'Xã Thanh Nghị', 'Xã', '351'),
('13492', 'Xã Thanh Tâm', 'Xã', '351'),
('13495', 'Xã Thanh Nguyên', 'Xã', '351'),
('13498', 'Xã Thanh Hải', 'Xã', '351'),
('13501', 'Thị trấn Bình Mỹ', 'Thị trấn', '352'),
('13504', 'Xã Bình Nghĩa', 'Xã', '352'),
('13507', 'Xã Đinh Xá', 'Xã', '347'),
('13564', 'Thị trấn Vĩnh Trụ', 'Thị trấn', '353'),
('13567', 'Xã Hợp Lý', 'Xã', '353'),
('13570', 'Xã Nguyên Lý', 'Xã', '353'),
('13573', 'Xã Chính Lý', 'Xã', '353'),
('13576', 'Xã Chân Lý', 'Xã', '353'),
('13579', 'Xã Đạo Lý', 'Xã', '353'),
('13633', 'Phường Hạ Long', 'Phường', '356'),
('13636', 'Phường Trần Tế Xương', 'Phường', '356'),
('13639', 'Phường Vị Hoàng', 'Phường', '356'),
('13642', 'Phường Vị Xuyên', 'Phường', '356'),
('13693', 'Xã Lộc Hòa', 'Xã', '356'),
('13696', 'Xã Nam Phong', 'Xã', '356'),
('13699', 'Xã Mỹ Xá', 'Xã', '356'),
('13702', 'Xã Lộc An', 'Xã', '356'),
('13705', 'Xã Nam Vân', 'Xã', '356'),
('13708', 'Thị trấn Mỹ Lộc', 'Thị trấn', '358'),
('13711', 'Xã Mỹ Hà', 'Xã', '358'),
('13714', 'Xã Mỹ Tiến', 'Xã', '358'),
('13741', 'Thị trấn Gôi', 'Thị trấn', '359'),
('13744', 'Xã Minh Thuận', 'Xã', '359'),
('13747', 'Xã Hiển Khánh', 'Xã', '359'),
('13759', 'Xã Tân Thành', 'Xã', '359'),
('13762', 'Xã Cộng Hòa', 'Xã', '359'),
('13765', 'Xã Trung Thành', 'Xã', '359'),
('13768', 'Xã Quang Trung', 'Xã', '359'),
('13771', 'Xã Minh Tân', 'Xã', '359'),
('13774', 'Xã Liên Bảo', 'Xã', '359'),
('13777', 'Xã Thành Lợi', 'Xã', '359'),
('13780', 'Xã Kim Thái', 'Xã', '359'),
('13795', 'Thị trấn Lâm', 'Thị trấn', '360'),
('13888', 'Xã Yên Trị', 'Xã', '360'),
('13891', 'Thị trấn Liễu Đề', 'Thị trấn', '361'),
('13894', 'Thị trấn Rạng Đông', 'Thị trấn', '361'),
('13897', 'Xã Nghĩa Đồng', 'Xã', '361'),
('13900', 'Xã Nghĩa Thịnh', 'Xã', '361'),
('13903', 'Xã Nghĩa Minh', 'Xã', '361'),
('13906', 'Xã Nghĩa Thái', 'Xã', '361'),
('13909', 'Xã Hoàng Nam', 'Xã', '361'),
('13966', 'Thị trấn Nam Giang', 'Thị trấn', '362'),
('13969', 'Xã Nam Mỹ', 'Xã', '362'),
('13972', 'Xã Điền Xá', 'Xã', '362'),
('13975', 'Xã Nghĩa An', 'Xã', '362'),
('14026', 'Thị trấn Cổ Lễ', 'Thị trấn', '363'),
('14029', 'Xã Phương Định', 'Xã', '363'),
('14032', 'Xã Trực Chính', 'Xã', '363'),
('14035', 'Xã Trung Đông', 'Xã', '363'),
('14038', 'Xã Liêm Hải', 'Xã', '363'),
('14041', 'Xã Trực Tuấn', 'Xã', '363'),
('14044', 'Xã Việt Hùng', 'Xã', '363'),
('14089', 'Thị trấn Xuân Trường', 'Thị trấn', '364'),
('14092', 'Xã Xuân Châu', 'Xã', '364'),
('14095', 'Xã Xuân Hồng', 'Xã', '364'),
('14149', 'Thị trấn Ngô Đồng', 'Thị trấn', '365'),
('14152', 'Thị trấn Quất Lâm', 'Thị trấn', '365'),
('14155', 'Xã Giao Hương', 'Xã', '365'),
('14158', 'Xã Hồng Thuận', 'Xã', '365'),
('14215', 'Thị trấn Yên Định', 'Thị trấn', '366'),
('14218', 'Thị trấn Cồn', 'Thị trấn', '366'),
('14221', 'Thị trấn Thịnh Long', 'Thị trấn', '366'),
('14224', 'Xã Hải Nam', 'Xã', '366'),
('14227', 'Xã Hải Trung', 'Xã', '366'),
('14230', 'Xã Hải Vân', 'Xã', '366'),
('14320', 'Phường Đông Thành', 'Phường', '369'),
('14323', 'Phường Tân Thành', 'Phường', '369'),
('14356', 'Phường Ninh Sơn', 'Phường', '369');
INSERT INTO `ward` (`id`, `name`, `type`, `id_county`) VALUES
('14359', 'Phường Ninh Phong', 'Phường', '369'),
('14362', 'Phường Bắc Sơn', 'Phường', '370'),
('14365', 'Phường Trung Sơn', 'Phường', '370'),
('14368', 'Phường Nam Sơn', 'Phường', '370'),
('14369', 'Phường Tây Sơn', 'Phường', '370'),
('14371', 'Xã Yên Sơn', 'Xã', '370'),
('14374', 'Phường Yên Bình', 'Phường', '370'),
('14375', 'Phường Tân Bình', 'Phường', '370'),
('14377', 'Xã Quang Sơn', 'Xã', '370'),
('14380', 'Xã Đông Sơn', 'Xã', '370'),
('14383', 'Thị trấn Nho Quan', 'Thị trấn', '372'),
('14386', 'Xã Xích Thổ', 'Xã', '372'),
('14389', 'Xã Gia Lâm', 'Xã', '372'),
('14464', 'Thị trấn Me', 'Thị trấn', '373'),
('14467', 'Xã Gia Hòa', 'Xã', '373'),
('14470', 'Xã Gia Hưng', 'Xã', '373'),
('14527', 'Thị trấn Thiên Tôn', 'Thị trấn', '374'),
('14530', 'Xã Ninh Giang', 'Xã', '374'),
('14533', 'Xã Trường Yên', 'Xã', '374'),
('14560', 'Thị trấn Yên Ninh', 'Thị trấn', '375'),
('14563', 'Xã Khánh Tiên', 'Xã', '375'),
('14566', 'Xã Khánh Phú', 'Xã', '375'),
('14569', 'Xã Khánh Hòa', 'Xã', '375'),
('14572', 'Xã Khánh Lợi', 'Xã', '375'),
('14620', 'Thị trấn Phát Diệm', 'Thị trấn', '376'),
('14623', 'Thị trấn Bình Minh', 'Thị trấn', '376'),
('14626', 'Xã Xuân Thiện', 'Xã', '376'),
('14629', 'Xã Hồi Ninh', 'Xã', '376'),
('14632', 'Xã Chính Tâm', 'Xã', '376'),
('14635', 'Xã Kim Định', 'Xã', '376'),
('14638', 'Xã Ân Hòa', 'Xã', '376'),
('14641', 'Xã Hùng Tiến', 'Xã', '376'),
('14701', 'Thị trấn Yên Thịnh', 'Thị trấn', '377'),
('14704', 'Xã Khánh Thượng', 'Xã', '377'),
('14707', 'Xã Khánh Dương', 'Xã', '377'),
('14710', 'Xã Mai Sơn', 'Xã', '377'),
('14713', 'Xã Khánh Thịnh', 'Xã', '377'),
('14755', 'Phường Hàm Rồng', 'Phường', '380'),
('14758', 'Phường Đông Thọ', 'Phường', '380'),
('14761', 'Phường Nam Ngạn', 'Phường', '380'),
('14764', 'Phường Trường Thi', 'Phường', '380'),
('14809', 'Phường Bắc Sơn', 'Phường', '381'),
('14812', 'Phường Ba Đình', 'Phường', '381'),
('14815', 'Phường Lam Sơn', 'Phường', '381'),
('14818', 'Phường Ngọc Trạo', 'Phường', '381'),
('14821', 'Phường Đông Sơn', 'Phường', '381'),
('14823', 'Phường Phú Sơn', 'Phường', '381'),
('14824', 'Xã Quang Trung', 'Xã', '381'),
('14827', 'Xã Hà Lan', 'Xã', '381'),
('14830', 'Phường Trung Sơn', 'Phường', '382'),
('14833', 'Phường Bắc Sơn', 'Phường', '382'),
('14836', 'Phường Trường Sơn', 'Phường', '382'),
('14839', 'Xã Quảng Cư', 'Xã', '382'),
('14842', 'Phường Quảng Tiến', 'Phường', '382'),
('14845', 'Thị trấn Mường Lát', 'Thị trấn', '384'),
('14848', 'Xã Tam Chung', 'Xã', '384'),
('14851', 'Xã Tén Tằn', 'Xã', '384'),
('14854', 'Xã Mường Lý', 'Xã', '384'),
('14869', 'Thị trấn Quan Hóa', 'Thị trấn', '385'),
('14872', 'Xã Thành Sơn', 'Xã', '385'),
('14875', 'Xã Trung Sơn', 'Xã', '385'),
('14923', 'Thị trấn Cành Nàng', 'Thị trấn', '386'),
('14926', 'Xã Điền Thượng', 'Xã', '386'),
('14929', 'Xã Điền Hạ', 'Xã', '386'),
('14932', 'Xã Điền Quang', 'Xã', '386'),
('14935', 'Xã Điền Trung', 'Xã', '386'),
('14938', 'Xã Thành Sơn', 'Xã', '386'),
('14941', 'Xã Lương Ngoại', 'Xã', '386'),
('14992', 'Thị trấn Quan Sơn', 'Thị trấn', '387'),
('14995', 'Xã Trung Xuân', 'Xã', '387'),
('14998', 'Xã Trung Thượng', 'Xã', '387'),
('14999', 'Xã Trung Tiến', 'Xã', '387'),
('15028', 'Thị trấn Lang Chánh', 'Thị trấn', '388'),
('15031', 'Xã Yên Khương', 'Xã', '388'),
('15034', 'Xã Yên Thắng', 'Xã', '388'),
('15037', 'Xã Trí Nang', 'Xã', '388'),
('15040', 'Xã Giao An', 'Xã', '388'),
('15061', 'Thị Trấn Ngọc Lặc', 'Thị trấn', '389'),
('15064', 'Xã Lam Sơn', 'Xã', '389'),
('15067', 'Xã Mỹ Tân', 'Xã', '389'),
('15070', 'Xã Thúy Sơn', 'Xã', '389'),
('15073', 'Xã Thạch Lập', 'Xã', '389'),
('15076', 'Xã Vân Âm', 'Xã', '389'),
('15079', 'Xã Cao Ngọc', 'Xã', '389'),
('15082', 'Xã Ngọc Khê', 'Xã', '389'),
('15127', 'Thị trấn Cẩm Thủy', 'Thị trấn', '390'),
('15130', 'Xã Phúc Do', 'Xã', '390'),
('15133', 'Xã Cẩm Thành', 'Xã', '390'),
('15136', 'Xã Cẩm Quý', 'Xã', '390'),
('15139', 'Xã Cẩm Lương', 'Xã', '390'),
('15187', 'Thị trấn Kim Tân', 'Thị trấn', '391'),
('15190', 'Thị trấn Vân Du', 'Thị trấn', '391'),
('15193', 'Xã Thạch Tân', 'Xã', '391'),
('15196', 'Xã Thạch Lâm', 'Xã', '391'),
('15271', 'Thị trấn Hà Trung', 'Thị trấn', '392'),
('15274', 'Xã Hà Long', 'Xã', '392'),
('15277', 'Xã Hà Vinh', 'Xã', '392'),
('15346', 'Thị trấn Vĩnh Lộc', 'Thị trấn', '393'),
('15349', 'Xã Vĩnh Thành', 'Xã', '393'),
('15352', 'Xã Vĩnh Quang', 'Xã', '393'),
('15355', 'Xã Vĩnh Yên', 'Xã', '393'),
('15394', 'Thị trấn Quán Lào', 'Thị trấn', '394'),
('15397', 'Thị trấn Thống Nhất', 'Thị trấn', '394'),
('15400', 'Xã Yên Phú', 'Xã', '394'),
('15403', 'Xã Yên Lâm', 'Xã', '394'),
('15481', 'Thị trấn Thọ Xuân', 'Thị trấn', '395'),
('15484', 'Thị trấn Lam Sơn', 'Thị trấn', '395'),
('15487', 'Thị trấn Sao Vàng', 'Thị trấn', '395'),
('15490', 'Xã Xuân Khánh', 'Xã', '395'),
('15493', 'Xã Thọ Nguyên', 'Xã', '395'),
('15496', 'Xã Xuân Thành', 'Xã', '395'),
('15499', 'Xã Hạnh Phúc', 'Xã', '395'),
('15502', 'Xã Bắc Lương', 'Xã', '395'),
('15604', 'Thị trấn Thường Xuân', 'Thị trấn', '396'),
('15607', 'Xã Bát Mọt', 'Xã', '396'),
('15610', 'Xã Yên Nhân', 'Xã', '396'),
('15619', 'Xã Xuân Lẹ', 'Xã', '396'),
('15622', 'Xã Vạn Xuân', 'Xã', '396'),
('15664', 'Thị trấn Triệu Sơn', 'Thị trấn', '397'),
('15667', 'Xã Thọ Sơn', 'Xã', '397'),
('15670', 'Xã Thọ Bình', 'Xã', '397'),
('15673', 'Xã Thọ Tiến', 'Xã', '397'),
('15676', 'Xã Hợp Lý', 'Xã', '397'),
('15679', 'Xã Hợp Tiến', 'Xã', '397'),
('15772', 'Thị trấn Vạn Hà', 'Thị trấn', '398'),
('15775', 'Xã Thiệu Ngọc', 'Xã', '398'),
('15778', 'Xã Thiệu Vũ', 'Xã', '398'),
('15781', 'Xã Thiệu Phúc', 'Xã', '398'),
('15865', 'Thị trấn Hoằng Hóa', 'Thị trấn', '399'),
('15868', 'Phường Tào Xuyên', 'Phường', '380'),
('15871', 'Xã Hoằng Giang', 'Xã', '399'),
('15874', 'Xã Hoằng Xuân', 'Xã', '399'),
('15877', 'Xã Hoằng Khánh', 'Xã', '399'),
('15880', 'Xã Hoằng Phượng', 'Xã', '399'),
('15883', 'Xã Hoằng Phú', 'Xã', '399'),
('15886', 'Xã Hoằng Quỳ', 'Xã', '399'),
('16012', 'Thị trấn Hậu Lộc', 'Thị trấn', '400'),
('16015', 'Xã Đồng Lộc', 'Xã', '400'),
('16018', 'Xã Đại Lộc', 'Xã', '400'),
('16021', 'Xã Triệu Lộc', 'Xã', '400'),
('16024', 'Xã Châu Lộc', 'Xã', '400'),
('16027', 'Xã Tiến Lộc', 'Xã', '400'),
('16030', 'Xã Lộc Sơn', 'Xã', '400'),
('16033', 'Xã Cầu Lộc', 'Xã', '400'),
('16093', 'Thị trấn Nga Sơn', 'Thị trấn', '401'),
('16096', 'Xã Ba Đình', 'Xã', '401'),
('16099', 'Xã Nga Vịnh', 'Xã', '401'),
('16174', 'Thị trấn Yên Cát', 'Thị trấn', '402'),
('16177', 'Xã Bãi Trành', 'Xã', '402'),
('16180', 'Xã Xuân Hòa', 'Xã', '402'),
('16183', 'Xã Xuân Bình', 'Xã', '402'),
('16228', 'Thị trấn Bến Sung', 'Thị trấn', '403'),
('16231', 'Xã Cán Khê', 'Xã', '403'),
('16234', 'Xã Xuân Du', 'Xã', '403'),
('16237', 'Xã Xuân Thọ', 'Xã', '403'),
('16279', 'Thị trấn Nông Cống', 'Thị trấn', '404'),
('16282', 'Xã Tân Phúc', 'Xã', '404'),
('16378', 'Thị trấn Rừng Thông', 'Thị trấn', '405'),
('16379', 'Phường An Hoạch', 'Phường', '380'),
('16381', 'Xã Đông Hoàng', 'Xã', '405'),
('16384', 'Xã Đông Ninh', 'Xã', '405'),
('16387', 'Xã Đông Khê', 'Xã', '405'),
('16390', 'Xã Đông Hòa', 'Xã', '405'),
('16438', 'Thị trấn Quảng Xương', 'Thị trấn', '406'),
('16441', 'Xã Quảng Thịnh', 'Xã', '380'),
('16444', 'Xã Quảng Tân', 'Xã', '406'),
('16447', 'Xã Quảng Trạch', 'Xã', '406'),
('16450', 'Xã Quảng Phong', 'Xã', '406'),
('16453', 'Xã Quảng Đức', 'Xã', '406'),
('16561', 'Thị trấn Tĩnh Gia', 'Thị trấn', '407'),
('16564', 'Xã Hải Châu', 'Xã', '407'),
('16567', 'Xã Thanh Thủy', 'Xã', '407'),
('16570', 'Xã Thanh Sơn', 'Xã', '407'),
('16573', 'Xã Triêu Dương', 'Xã', '407'),
('16576', 'Xã Hải Ninh', 'Xã', '407'),
('19744', 'Phường Phú Thuận', 'Phường', '474'),
('19747', 'Phường Phú Bình', 'Phường', '474'),
('19819', 'Thị trấn Phong Điền', 'Thị trấn', '476'),
('19822', 'Xã Điền Hương', 'Xã', '476'),
('19825', 'Xã Điền Môn', 'Xã', '476'),
('19828', 'Xã Điền Lộc', 'Xã', '476'),
('19831', 'Xã Phong Bình', 'Xã', '476'),
('19867', 'Thị trấn Sịa', 'Thị trấn', '477'),
('19870', 'Xã Quảng Thái', 'Xã', '477'),
('19873', 'Xã Quảng Ngạn', 'Xã', '477'),
('19876', 'Xã Quảng Lợi', 'Xã', '477'),
('19879', 'Xã Quảng Công', 'Xã', '477'),
('19900', 'Thị trấn Thuận An', 'Thị trấn', '478'),
('19903', 'Xã Phú Thuận', 'Xã', '478'),
('19906', 'Xã Phú Dương', 'Xã', '478'),
('19909', 'Xã Phú Mậu', 'Xã', '478'),
('19912', 'Xã Phú An', 'Xã', '478'),
('19960', 'Phường Phú Bài', 'Phường', '479'),
('19963', 'Xã Thủy Vân', 'Xã', '479'),
('19966', 'Xã Thủy Thanh', 'Xã', '479'),
('19969', 'Phường Thủy Dương', 'Phường', '479'),
('19996', 'Phường Tứ Hạ', 'Phường', '480'),
('19999', 'Xã Hải Dương', 'Xã', '480'),
('20002', 'Xã Hương Phong', 'Xã', '480'),
('20005', 'Xã Hương Toàn', 'Xã', '480'),
('20008', 'Phường Hương Vân', 'Phường', '480'),
('20044', 'Thị trấn A Lưới', 'Thị trấn', '481'),
('20047', 'Xã Hồng Vân', 'Xã', '481'),
('20050', 'Xã Hồng Hạ', 'Xã', '481'),
('20053', 'Xã Hồng Kim', 'Xã', '481'),
('20107', 'Thị trấn Phú Lộc', 'Thị trấn', '482'),
('20110', 'Thị trấn Lăng Cô', 'Thị trấn', '482'),
('20113', 'Xã Vinh Mỹ', 'Xã', '482'),
('20116', 'Xã Vinh Hưng', 'Xã', '482'),
('20161', 'Thị trấn Khe Tre', 'Thị trấn', '483'),
('20164', 'Xã Hương Phú', 'Xã', '483'),
('20167', 'Xã Hương Sơn', 'Xã', '483'),
('20170', 'Xã Hương Lộc', 'Xã', '483'),
('20194', 'Phường Hòa Hiệp Bắc', 'Phường', '490'),
('20195', 'Phường Hòa Hiệp Nam', 'Phường', '490'),
('20197', 'Phường Hòa Khánh Bắc', 'Phường', '490'),
('20198', 'Phường Hòa Khánh Nam', 'Phường', '490'),
('20200', 'Phường Hòa Minh', 'Phường', '490'),
('20203', 'Phường Tam Thuận', 'Phường', '491'),
('20206', 'Phường Thanh Khê Tây', 'Phường', '491'),
('20207', 'Phường Thanh Khê Đông', 'Phường', '491'),
('20209', 'Phường Xuân Hà', 'Phường', '491'),
('20212', 'Phường Tân Chính', 'Phường', '491'),
('20215', 'Phường Chính Gián', 'Phường', '491'),
('20218', 'Phường Vĩnh Trung', 'Phường', '491'),
('20221', 'Phường Thạc Gián', 'Phường', '491'),
('20224', 'Phường An Khê', 'Phường', '491'),
('20225', 'Phường Hòa Khê', 'Phường', '491'),
('20227', 'Phường Thanh Bình', 'Phường', '492'),
('20230', 'Phường Thuận Phước', 'Phường', '492'),
('20245', 'Phường Hòa Thuận Tây', 'Phường', '492'),
('20246', 'Phường Hòa Thuận Đông', 'Phường', '492'),
('20248', 'Phường Nam Dương', 'Phường', '492'),
('20251', 'Phường Bình Hiên', 'Phường', '492'),
('20254', 'Phường Bình Thuận', 'Phường', '492'),
('20257', 'Phường Hòa Cường Bắc', 'Phường', '492'),
('20258', 'Phường Hòa Cường Nam', 'Phường', '492'),
('20260', 'Phường Khuê Trung', 'Phường', '495'),
('20263', 'Phường Thọ Quang', 'Phường', '493'),
('20266', 'Phường Nại Hiên Đông', 'Phường', '493'),
('20269', 'Phường Mân Thái', 'Phường', '493'),
('20272', 'Phường An Hải Bắc', 'Phường', '493'),
('20275', 'Phường Phước Mỹ', 'Phường', '493'),
('20284', 'Phường Mỹ An', 'Phường', '494'),
('20285', 'Phường Khuê Mỹ', 'Phường', '494'),
('20293', 'Xã Hòa Bắc', 'Xã', '497'),
('20296', 'Xã Hòa Liên', 'Xã', '497'),
('20305', 'Phường Hòa Phát', 'Phường', '495'),
('20306', 'Phường Hòa An', 'Phường', '495'),
('20308', 'Xã Hòa Nhơn', 'Xã', '497'),
('20311', 'Phường Hòa Thọ Tây', 'Phường', '495'),
('20312', 'Phường Hòa Thọ Đông', 'Phường', '495'),
('20314', 'Phường Hòa Xuân', 'Phường', '495'),
('20317', 'Xã Hòa Phú', 'Xã', '497'),
('20320', 'Xã Hòa Phong', 'Xã', '497'),
('22015', 'Phường 1', 'Phường', '555'),
('22018', 'Phường 8', 'Phường', '555'),
('22021', 'Phường 2', 'Phường', '555'),
('22024', 'Phường 9', 'Phường', '555'),
('22027', 'Phường 3', 'Phường', '555'),
('22030', 'Phường 4', 'Phường', '555'),
('22033', 'Phường 5', 'Phường', '555'),
('22036', 'Phường 7', 'Phường', '555'),
('22039', 'Phường 6', 'Phường', '555'),
('22040', 'Phường Phú Thạnh', 'Phường', '555'),
('22041', 'Phường Phú Đông', 'Phường', '555'),
('22042', 'Xã Hòa Kiến', 'Xã', '555'),
('22045', 'Xã Bình Kiến', 'Xã', '555'),
('22048', 'Xã Bình Ngọc', 'Xã', '555'),
('22051', 'Phường Xuân Phú', 'Phường', '557'),
('22052', 'Xã Xuân Lâm', 'Xã', '557'),
('22053', 'Phường Xuân Thành', 'Phường', '557'),
('22054', 'Xã Xuân Hải', 'Xã', '557'),
('22057', 'Xã Xuân Lộc', 'Xã', '557'),
('22060', 'Xã Xuân Bình', 'Xã', '557'),
('22063', 'Xã Xuân Hòa', 'Xã', '557'),
('22066', 'Xã Xuân Cảnh', 'Xã', '557'),
('22069', 'Xã Xuân Thịnh', 'Xã', '557'),
('22072', 'Xã Xuân Phương', 'Xã', '557'),
('22073', 'Phường Xuân Yên', 'Phường', '557'),
('22075', 'Xã Xuân Thọ 1', 'Xã', '557'),
('22076', 'Phường Xuân Đài', 'Phường', '557'),
('22078', 'Xã Xuân Thọ 2', 'Xã', '557'),
('22081', 'Thị trấn La Hai', 'Thị trấn', '558'),
('22084', 'Xã Đa Lộc', 'Xã', '558'),
('22087', 'Xã Phú Mỡ', 'Xã', '558'),
('22090', 'Xã Xuân Lãnh', 'Xã', '558'),
('22093', 'Xã Xuân Long', 'Xã', '558'),
('22096', 'Xã Xuân Quang 1', 'Xã', '558'),
('22099', 'Xã Xuân Sơn Bắc', 'Xã', '558'),
('22102', 'Xã Xuân Quang 2', 'Xã', '558'),
('22105', 'Xã Xuân Sơn Nam', 'Xã', '558'),
('22108', 'Xã Xuân Quang 3', 'Xã', '558'),
('22111', 'Xã Xuân Phước', 'Xã', '558'),
('22114', 'Thị trấn Chí Thạnh', 'Thị trấn', '559'),
('22117', 'Xã An Dân', 'Xã', '559'),
('22120', 'Xã An Ninh Tây', 'Xã', '559'),
('22123', 'Xã An Ninh Đông', 'Xã', '559'),
('22126', 'Xã An Thạch', 'Xã', '559'),
('22129', 'Xã An Định', 'Xã', '559'),
('22132', 'Xã An Nghiệp', 'Xã', '559'),
('22135', 'Xã An Hải', 'Xã', '559'),
('22138', 'Xã An Cư', 'Xã', '559'),
('22141', 'Xã An Xuân', 'Xã', '559'),
('22144', 'Xã An Lĩnh', 'Xã', '559'),
('22147', 'Xã An Hòa', 'Xã', '559'),
('22150', 'Xã An Hiệp', 'Xã', '559'),
('22153', 'Xã An Mỹ', 'Xã', '559'),
('22156', 'Xã An Chấn', 'Xã', '559'),
('22159', 'Xã An Thọ', 'Xã', '559'),
('22162', 'Xã An Phú', 'Xã', '555'),
('22165', 'Thị trấn Củng Sơn', 'Thị trấn', '560'),
('22168', 'Xã Phước Tân', 'Xã', '560'),
('22171', 'Xã Sơn Hội', 'Xã', '560'),
('22174', 'Xã Sơn Định', 'Xã', '560'),
('22177', 'Xã Sơn Long', 'Xã', '560'),
('22180', 'Xã Cà Lúi', 'Xã', '560'),
('22183', 'Xã Sơn Phước', 'Xã', '560'),
('22186', 'Xã Sơn Xuân', 'Xã', '560'),
('22189', 'Xã Sơn Nguyên', 'Xã', '560'),
('22192', 'Xã Eachà Rang', 'Xã', '560'),
('22195', 'Xã Krông Pa', 'Xã', '560'),
('22198', 'Xã Suối Bạc', 'Xã', '560'),
('22201', 'Xã Sơn Hà', 'Xã', '560'),
('22204', 'Xã Suối Trai', 'Xã', '560'),
('22207', 'Thị trấn Hai Riêng', 'Thị trấn', '561'),
('22210', 'Xã Ea Lâm', 'Xã', '561'),
('22213', 'Xã Đức Bình Tây', 'Xã', '561'),
('22216', 'Xã Ea Bá', 'Xã', '561'),
('22219', 'Xã Sơn Giang', 'Xã', '561'),
('22222', 'Xã Đức Bình Đông', 'Xã', '561'),
('22225', 'Xã EaBar', 'Xã', '561'),
('22228', 'Xã EaBia', 'Xã', '561'),
('22231', 'Xã EaTrol', 'Xã', '561'),
('22234', 'Xã Sông Hinh', 'Xã', '561'),
('22237', 'Xã Ealy', 'Xã', '561'),
('22240', 'Phường Phú Lâm', 'Phường', '555'),
('22243', 'Xã Hòa Thành', 'Xã', '564'),
('22246', 'Xã Hòa Hiệp Bắc', 'Xã', '564'),
('22249', 'Xã Sơn Thành Tây', 'Xã', '562'),
('22250', 'Xã Sơn Thành Đông', 'Xã', '562'),
('22252', 'Xã Hòa Bình 1', 'Xã', '562'),
('22255', 'Thị trấn Phú Thứ', 'Thị trấn', '562'),
('22258', 'Thị trấn Hoà Vinh', 'Thị trấn', '564'),
('22261', 'Thị trấn Hoà Hiệp Trung', 'Thị trấn', '564'),
('22264', 'Xã Hòa Phong', 'Xã', '562'),
('22267', 'Xã Hòa Tân Đông', 'Xã', '564'),
('22270', 'Xã Hòa Phú', 'Xã', '562'),
('22273', 'Xã Hòa Tân Tây', 'Xã', '562'),
('22276', 'Xã Hòa Đồng', 'Xã', '562'),
('22279', 'Xã Hòa Xuân Tây', 'Xã', '564'),
('22282', 'Xã Hòa Hiệp Nam', 'Xã', '564'),
('22285', 'Xã Hòa Mỹ Đông', 'Xã', '562'),
('22288', 'Xã Hòa Mỹ Tây', 'Xã', '562'),
('22291', 'Xã Hòa Xuân Đông', 'Xã', '564'),
('22294', 'Xã Hòa Thịnh', 'Xã', '562'),
('22297', 'Xã Hòa Tâm', 'Xã', '564'),
('22300', 'Xã Hòa Xuân Nam', 'Xã', '564'),
('22303', 'Xã Hòa Quang Bắc', 'Xã', '563'),
('22306', 'Xã Hòa Quang Nam', 'Xã', '563'),
('22309', 'Xã Hòa Hội', 'Xã', '563'),
('22312', 'Xã Hòa Trị', 'Xã', '563'),
('22315', 'Xã Hòa An', 'Xã', '563'),
('22318', 'Xã Hòa Định Đông', 'Xã', '563'),
('22319', 'Thị Trấn Phú Hoà', 'Thị trấn', '563'),
('22321', 'Xã Hòa Định Tây', 'Xã', '563'),
('22324', 'Xã Hòa Thắng', 'Xã', '563'),
('22327', 'Phường Vĩnh Hòa', 'Phường', '568'),
('22330', 'Phường Vĩnh Hải', 'Phường', '568'),
('22333', 'Phường Vĩnh Phước', 'Phường', '568'),
('22336', 'Phường Ngọc Hiệp', 'Phường', '568'),
('22363', 'Phường Lộc Thọ', 'Phường', '568'),
('22366', 'Phường Phước Tiến', 'Phường', '568'),
('22369', 'Phường Tân Lập', 'Phường', '568'),
('22384', 'Xã Vĩnh Lương', 'Xã', '568'),
('22387', 'Xã Vĩnh Phương', 'Xã', '568'),
('22408', 'Phường Cam Nghĩa', 'Phường', '569'),
('22411', 'Phường Cam Phúc Bắc', 'Phường', '569'),
('22414', 'Phường Cam Phúc Nam', 'Phường', '569'),
('22435', 'Xã Cam Tân', 'Xã', '570'),
('22438', 'Xã Cam Hòa', 'Xã', '570'),
('22441', 'Xã Cam Hải Đông', 'Xã', '570'),
('22444', 'Xã Cam Hải Tây', 'Xã', '570'),
('22447', 'Xã Sơn Tân', 'Xã', '570'),
('22450', 'Xã Cam Hiệp Bắc', 'Xã', '570'),
('22453', 'Thị trấn Cam Đức', 'Thị trấn', '570'),
('22456', 'Xã Cam Hiệp Nam', 'Xã', '570'),
('22459', 'Xã Cam Phước Tây', 'Xã', '570'),
('22462', 'Xã Cam Thành Bắc', 'Xã', '570'),
('22465', 'Xã Cam An Bắc', 'Xã', '570'),
('22468', 'Xã Cam Thành Nam', 'Xã', '569'),
('22471', 'Xã Cam An Nam', 'Xã', '570'),
('22474', 'Xã Cam Phước Đông', 'Xã', '569'),
('22477', 'Xã Cam Thịnh Tây', 'Xã', '569'),
('22480', 'Xã Cam Thịnh Đông', 'Xã', '569'),
('22483', 'Xã Cam Lập', 'Xã', '569'),
('22486', 'Xã Cam Bình', 'Xã', '569'),
('22489', 'Thị trấn Vạn Giã', 'Thị trấn', '571'),
('22492', 'Xã Đại Lãnh', 'Xã', '571'),
('22495', 'Xã Vạn Phước', 'Xã', '571'),
('22528', 'Phường Ninh Hiệp', 'Phường', '572'),
('22531', 'Xã Ninh Sơn', 'Xã', '572'),
('22534', 'Xã Ninh Tây', 'Xã', '572'),
('22537', 'Xã Ninh Thượng', 'Xã', '572'),
('22540', 'Xã Ninh An', 'Xã', '572'),
('22543', 'Phường Ninh Hải', 'Phường', '572'),
('22546', 'Xã Ninh Thọ', 'Xã', '572'),
('22561', 'Phường Ninh Diêm', 'Phường', '572'),
('22564', 'Xã Ninh Đông', 'Xã', '572'),
('22567', 'Phường Ninh Thủy', 'Phường', '572'),
('22570', 'Phường Ninh Đa', 'Phường', '572'),
('22573', 'Xã Ninh Phụng', 'Xã', '572'),
('22606', 'Xã Ninh Vân', 'Xã', '572'),
('22609', 'Thị trấn Khánh Vĩnh', 'Thị trấn', '573'),
('22612', 'Xã Khánh Hiệp', 'Xã', '573'),
('22615', 'Xã Khánh Bình', 'Xã', '573'),
('22618', 'Xã Khánh Trung', 'Xã', '573'),
('22621', 'Xã Khánh Đông', 'Xã', '573'),
('22651', 'Thị trấn Diên Khánh', 'Thị trấn', '574'),
('22654', 'Xã Diên Lâm', 'Xã', '574'),
('22657', 'Xã Diên Điền', 'Xã', '574'),
('22660', 'Xã Diên Xuân', 'Xã', '574'),
('22714', 'Thị trấn Tô Hạp', 'Thị trấn', '575'),
('22717', 'Xã Thành Sơn', 'Xã', '575'),
('22736', 'Thị trấn Trường Sa', 'Thị trấn', '576'),
('22737', 'Xã Song Tử Tây', 'Xã', '576'),
('26764', 'Phường Thạnh Xuân', 'Phường', '761'),
('26767', 'Phường Thạnh Lộc', 'Phường', '761'),
('26794', 'Phường Linh Xuân', 'Phường', '762'),
('26797', 'Phường Bình Chiểu', 'Phường', '762'),
('26800', 'Phường Linh Trung', 'Phường', '762'),
('26803', 'Phường Tam Bình', 'Phường', '762'),
('26830', 'Phường Long Bình', 'Phường', '763'),
('26833', 'Phường Long Thạnh Mỹ', 'Phường', '763'),
('26836', 'Phường Tân Phú', 'Phường', '763'),
('26839', 'Phường Hiệp Phú', 'Phường', '763'),
('26842', 'Phường Tăng Nhơn Phú A', 'Phường', '763'),
('26845', 'Phường Tăng Nhơn Phú B', 'Phường', '763'),
('26869', 'Phường 15', 'Phường', '764'),
('26872', 'Phường 13', 'Phường', '764'),
('26875', 'Phường 17', 'Phường', '764'),
('26905', 'Phường 13', 'Phường', '765'),
('26908', 'Phường 11', 'Phường', '765'),
('26911', 'Phường 27', 'Phường', '765'),
('26965', 'Phường 02', 'Phường', '766'),
('26968', 'Phường 04', 'Phường', '766'),
('26971', 'Phường 12', 'Phường', '766'),
('27010', 'Phường Tân Sơn Nhì', 'Phường', '767'),
('27013', 'Phường Tây Thạnh', 'Phường', '767'),
('27016', 'Phường Sơn Kỳ', 'Phường', '767'),
('27043', 'Phường 04', 'Phường', '768'),
('27046', 'Phường 05', 'Phường', '768'),
('27088', 'Phường Thảo Điền', 'Phường', '769'),
('27091', 'Phường An Phú', 'Phường', '769'),
('27094', 'Phường Bình An', 'Phường', '769'),
('27436', 'Phường Bình Hưng Hòa', 'Phường', '777'),
('27439', 'Phường Bình Hưng Hoà A', 'Phường', '777');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cart_detail`
--
ALTER TABLE `cart_detail`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `category_product`
--
ALTER TABLE `category_product`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `county`
--
ALTER TABLE `county`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `discount_code`
--
ALTER TABLE `discount_code`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `manufacturer`
--
ALTER TABLE `manufacturer`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `my_product`
--
ALTER TABLE `my_product`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `package_order`
--
ALTER TABLE `package_order`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_detail`
--
ALTER TABLE `product_detail`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_store`
--
ALTER TABLE `product_store`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `promocodes_group`
--
ALTER TABLE `promocodes_group`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `returns`
--
ALTER TABLE `returns`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `returns_detail`
--
ALTER TABLE `returns_detail`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `ship_cost`
--
ALTER TABLE `ship_cost`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `size`
--
ALTER TABLE `size`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `staff_type`
--
ALTER TABLE `staff_type`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `status_order`
--
ALTER TABLE `status_order`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `type_product`
--
ALTER TABLE `type_product`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `type_ship_cost`
--
ALTER TABLE `type_ship_cost`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `ward`
--
ALTER TABLE `ward`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bill`
--
ALTER TABLE `bill`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `bill_detail`
--
ALTER TABLE `bill_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `cart_detail`
--
ALTER TABLE `cart_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `category_product`
--
ALTER TABLE `category_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `color`
--
ALTER TABLE `color`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `config`
--
ALTER TABLE `config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `discount_code`
--
ALTER TABLE `discount_code`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `gender`
--
ALTER TABLE `gender`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `manufacturer`
--
ALTER TABLE `manufacturer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2516;

--
-- AUTO_INCREMENT cho bảng `my_product`
--
ALTER TABLE `my_product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `package_order`
--
ALTER TABLE `package_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1026;

--
-- AUTO_INCREMENT cho bảng `product_detail`
--
ALTER TABLE `product_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT cho bảng `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT cho bảng `product_store`
--
ALTER TABLE `product_store`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `promocodes_group`
--
ALTER TABLE `promocodes_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `register`
--
ALTER TABLE `register`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `returns`
--
ALTER TABLE `returns`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `returns_detail`
--
ALTER TABLE `returns_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `role`
--
ALTER TABLE `role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `ship_cost`
--
ALTER TABLE `ship_cost`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT cho bảng `size`
--
ALTER TABLE `size`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `slide`
--
ALTER TABLE `slide`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `staff_type`
--
ALTER TABLE `staff_type`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `status_order`
--
ALTER TABLE `status_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `store`
--
ALTER TABLE `store`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `type_product`
--
ALTER TABLE `type_product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `type_ship_cost`
--
ALTER TABLE `type_ship_cost`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

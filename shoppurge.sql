-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 11, 2022 lúc 07:24 AM
-- Phiên bản máy phục vụ: 10.4.18-MariaDB
-- Phiên bản PHP: 8.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shoppurge`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `user_id` int(11) NOT NULL,
  `quantity_cart` int(11) NOT NULL,
  `detail_prd_size_id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `cart`
--

INSERT INTO `cart` (`user_id`, `quantity_cart`, `detail_prd_size_id`, `cart_id`) VALUES
(56, 1, 117, 67);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(2, 'Pants'),
(3, 'Jacket'),
(4, 'Tee'),
(5, 'Accessories'),
(6, 'Sweater'),
(7, 'Hoodie');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `color`
--

CREATE TABLE `color` (
  `color_id` int(11) NOT NULL,
  `color_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `color`
--

INSERT INTO `color` (`color_id`, `color_name`) VALUES
(1, 'White'),
(2, 'Black'),
(3, 'Red'),
(4, 'Blue'),
(5, 'Beige'),
(6, 'Green'),
(7, 'Grey'),
(8, 'Brown'),
(9, 'Cement');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `detail_import`
--

CREATE TABLE `detail_import` (
  `import_id` int(11) NOT NULL,
  `detail_import_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `detail_prd_size_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `detail_import`
--

INSERT INTO `detail_import` (`import_id`, `detail_import_id`, `amount`, `detail_prd_size_id`) VALUES
(1, 22, 20, 51),
(1, 23, 10, 49),
(1, 24, 10, 53),
(2, 25, 10, 61),
(2, 26, 10, 67),
(2, 27, 10, 86),
(2, 28, 10, 121),
(3, 29, 10, 92),
(3, 30, 10, 83),
(3, 31, 10, 135),
(3, 32, 10, 117),
(3, 33, 10, 132),
(3, 34, 10, 83),
(4, 35, 10, 141),
(4, 36, 10, 101);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `detail_order`
--

CREATE TABLE `detail_order` (
  `detail_order_id` int(11) NOT NULL,
  `prd_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `percent` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `color` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `size` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `image_front` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `category` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `detail_prd_size_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `detail_order`
--

INSERT INTO `detail_order` (`detail_order_id`, `prd_name`, `price`, `percent`, `order_id`, `color`, `size`, `image_front`, `quantity`, `category`, `detail_prd_size_id`) VALUES
(43, 'Contour Pants with Core System Logo', 530000, 0, 89, 'Cement', 'L', 'pants2-front.png', 1, 'Pants', 135),
(44, 'RIOTxTHANHPHONG TRE TRAU TShirt', 450000, 0, 89, 'Black', 'XL', 'tee2-front.png', 1, 'Tee', 53),
(45, 'RIOTxTHANHPHONG TRE TRAU TShirt', 450000, 0, 89, 'Beige', 'XXL', 'tee3-front.png', 1, 'Tee', 49),
(46, 'Asymmetrical Layered sleeve Suede Hoodie', 440000, 0, 90, 'White', 'S', 'hoodie2-front.png', 1, 'Hoodie', 117),
(47, 'Riot x Pepsi  Asymmetrical Layered Sleeve  Hoodie', 690000, 0, 91, 'Black', 'M', 'hoodie8-front.png', 1, 'Hoodie', 121),
(48, 'Mirrored Print Relax Tshirt', 310000, 0, 91, 'Red', 'M', '1-6.png', 3, 'Tee', 61),
(49, 'Contour Pants with Core System Logo', 530000, 0, 92, 'Cement', 'L', 'pants2-front.png', 4, 'Pants', 135),
(50, 'Asymmetrical Layered sleeve Suede Sweater', 390000, 0, 92, 'Beige', 'M', 'sweater3-front.png', 3, 'Sweater', 101),
(51, 'RIOTxTHANHPHONG TRE TRAU TShirt', 450000, 0, 93, 'Black', 'M', 'tee2-front.png', 1, 'Tee', 51),
(52, 'Mirrored Print Relax Tshirt', 310000, 0, 94, 'Red', 'M', '1-6.png', 1, 'Tee', 61);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `detail_product`
--

CREATE TABLE `detail_product` (
  `detail_prd_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `image_front` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_back` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prd_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `detail_product`
--

INSERT INTO `detail_product` (`detail_prd_id`, `color_id`, `image_front`, `image_back`, `prd_id`) VALUES
(1, 5, 'tee3-front.png', 'tee3-extra.png', 66),
(2, 2, 'tee2-front.png', 'tee2-extra.png', 66),
(4, 3, '1-6.png', '2-6.png', 67),
(5, 7, '1-5.png', '2-5.png', 67),
(6, 8, 'jacket2-front.png', 'jacket2-extra.png', 68),
(7, 2, 'jacket3-front.png', 'jacket3-extra.png', 68),
(8, 2, 'jacket1-front.png', 'jacket1-extra.png', 69),
(9, 9, 'jacket5-front.png', 'jacket5-extra.png', 70),
(10, 6, 'jacket7-front.png', 'jacket7-extra.png', 70),
(11, 6, 'sweater2-front.png', 'sweater2-extra.png', 71),
(12, 5, 'sweater3-front.png', 'sweater3-extra.png', 71),
(13, 2, 'sweater4-front.png', 'sweater4-extra.png', 71),
(14, 2, 'sweater5-front.png', 'sweater5-extra.png', 72),
(15, 1, 'hoodie2-front.png', 'hoodie2-extra.png', 73),
(16, 2, 'hoodie8-front.png', 'hoodie8-extra.png', 74),
(17, 8, 'hoodie10-front.png', 'hoodie10-extra.png', 75),
(18, 2, 'pants3-front.png', 'pants3-extra.png', 76),
(19, 9, 'pants2-front.png', 'pants2-extra.png', 77),
(20, 2, 'bag3-front.png', 'bag3-extra.png', 78),
(21, 2, 'bag1-front.png', 'bag1-extra.png', 79);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `detail_product_size`
--

CREATE TABLE `detail_product_size` (
  `detail_prd_size_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `detail_prd_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `detail_product_size`
--

INSERT INTO `detail_product_size` (`detail_prd_size_id`, `size_id`, `detail_prd_id`, `quantity`) VALUES
(45, 2, 1, 0),
(46, 3, 1, 0),
(47, 4, 1, 0),
(48, 5, 1, 0),
(49, 6, 1, 8),
(50, 2, 2, 0),
(51, 3, 2, 20),
(52, 4, 2, 0),
(53, 5, 2, 9),
(54, 6, 2, 0),
(60, 2, 4, 0),
(61, 3, 4, 7),
(62, 4, 4, 0),
(63, 5, 4, 0),
(64, 6, 4, 0),
(65, 2, 5, 0),
(66, 3, 5, 0),
(67, 4, 5, 12),
(68, 5, 5, 0),
(69, 6, 5, 0),
(70, 2, 6, 0),
(71, 3, 6, 0),
(72, 4, 6, 0),
(73, 5, 6, 0),
(74, 6, 6, 0),
(75, 2, 7, 0),
(76, 3, 7, 0),
(77, 4, 7, 0),
(78, 5, 7, 0),
(79, 6, 7, 0),
(80, 2, 8, 0),
(81, 3, 8, 0),
(82, 4, 8, 0),
(83, 5, 8, 16),
(84, 6, 8, 0),
(85, 2, 9, 0),
(86, 3, 9, 7),
(87, 4, 9, 0),
(88, 5, 9, 0),
(89, 6, 9, 0),
(90, 2, 10, 0),
(91, 3, 10, 0),
(92, 4, 10, 10),
(93, 5, 10, 0),
(94, 6, 10, 0),
(95, 2, 11, 0),
(96, 3, 11, 0),
(97, 4, 11, 0),
(98, 5, 11, 0),
(99, 6, 11, 0),
(100, 2, 12, 0),
(101, 3, 12, 10),
(102, 4, 12, 0),
(103, 5, 12, 0),
(104, 6, 12, 0),
(105, 2, 13, 0),
(106, 3, 13, 0),
(107, 4, 13, 0),
(108, 5, 13, 0),
(109, 6, 13, 0),
(110, 2, 14, 0),
(111, 3, 14, 0),
(112, 4, 14, 0),
(113, 5, 14, 0),
(114, 6, 14, 0),
(115, 2, 15, 0),
(116, 3, 15, 0),
(117, 4, 15, 11),
(118, 5, 15, 0),
(119, 6, 15, 0),
(120, 2, 16, 0),
(121, 3, 16, 5),
(122, 4, 16, 0),
(123, 5, 16, 0),
(124, 6, 16, 0),
(125, 2, 17, 0),
(126, 3, 17, 0),
(127, 4, 17, 0),
(128, 5, 17, 0),
(129, 6, 17, 0),
(130, 2, 18, 0),
(131, 3, 18, 0),
(132, 4, 18, 6),
(133, 5, 18, 0),
(134, 6, 18, 0),
(135, 2, 19, 9),
(136, 3, 19, 0),
(137, 4, 19, 0),
(138, 5, 19, 0),
(139, 6, 19, 0),
(140, 2, 20, 0),
(141, 3, 20, 6),
(142, 4, 20, 0),
(143, 5, 20, 0),
(144, 6, 20, 0),
(145, 2, 21, 0),
(146, 3, 21, 0),
(147, 4, 21, 0),
(148, 5, 21, 0),
(149, 6, 21, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `import`
--

CREATE TABLE `import` (
  `import_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `staff_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `import`
--

INSERT INTO `import` (`import_id`, `date`, `staff_id`) VALUES
(1, '2021-05-12 22:48:47', 4),
(2, '2021-05-13 08:25:58', 4),
(3, '2021-05-13 08:28:13', 4),
(4, '2021-05-13 08:39:49', 12);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `log`
--

CREATE TABLE `log` (
  `time` datetime NOT NULL,
  `activity` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `log_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `log`
--

INSERT INTO `log` (`time`, `activity`, `log_id`) VALUES
('2021-04-30 17:28:45', 'Tài khoản haokhuy@gmail.com (Admin) đã tạo sản phẩm mới ansfkajfl', 6),
('2021-04-30 17:28:51', 'Tài khoản haokhuy@gmail.com (Admin) đã chỉnh sửa sản phẩm ansfkajfl', 7),
('2021-04-30 17:29:17', 'Tài khoản haokhuy@gmail.com (Admin) đã xóa sản phẩm ansfkajfl', 8),
('2021-04-30 18:48:10', 'Tài khoản haokhuy@gmail.com (Admin) đã tạo sản phẩm mới ansfkajfl', 9),
('2021-04-30 18:48:19', 'Tài khoản haokhuy@gmail.com (Admin) đã thay đổi số lượng sản phẩm ansfkajfl', 10),
('2021-04-30 19:24:08', 'Tài khoản haokhuy@gmail.com (Admin) đã tạo chương trình giảm giá mới free (2021-06-16 19:23:00   -   2021-07-02 19:24:00)', 11),
('2021-04-30 19:40:08', 'Tài khoản haokhuy@gmail.com (Admin) đã xác nhận đơn hàng 45', 12),
('2021-04-30 19:40:38', 'Tài khoản haokhuy@gmail.com (Admin) đã xác nhận xử lý xong đơn hàng ID:45', 13),
('2021-04-30 19:58:37', 'Tài khoản haokhuy@gmail.com (Admin) đã tạo một tài khoản mới minhkhuy76@gmail.com', 14),
('2021-04-30 20:01:09', 'Tài khoản  (Admin) đã chỉnh sửa tài khoản ID:4', 15),
('2021-04-30 20:18:32', 'Tài khoản  (Admin) đã xóa quyền ID:12', 16),
('2021-04-30 20:18:35', 'Tài khoản  (Admin) đã xóa quyền ID:12', 17),
('2021-04-30 20:18:37', 'Tài khoản  (Admin) đã xóa quyền ID:12', 18),
('2021-04-30 20:38:14', 'Tài khoản  (Admin) đã xóa quyền ID:12', 19),
('2021-04-30 20:38:47', 'Tài khoản  (Admin) đã tạo một quyền mới sadsadasdsadsad', 20),
('2021-04-30 20:38:57', 'Tài khoản  (Admin) đã chỉnh sửa quyền ID:12', 21),
('2021-04-30 20:39:03', 'Tài khoản  (Admin) đã xóa quyền ID:12', 22),
('2021-05-01 07:35:12', 'Tài khoản  (Admin) đã chỉnh sửa tài khoản ID:4', 23),
('2021-05-01 07:35:58', 'Tài khoản haokhuy@gmail.com (Admin) đã chỉnh sửa tài khoản ID:4', 24),
('2021-05-01 07:36:05', 'Tài khoản minhkhuy76@gmail.com (nhân viên) đã chỉnh sửa tài khoản ID:8', 25),
('2021-05-01 07:38:53', 'Tài khoản haokhuy@gmail.com (Admin) đã xóa sản phẩm ansfkajfl', 26),
('2021-05-01 08:30:34', 'Tài khoản haokhuy@gmail.com (Admin) đã tạo chương trình giảm giá mới ád (2021-05-01 08:30:00   -   2021-05-09 08:30:00)', 27),
('2021-05-01 10:18:06', 'Tài khoản haokhuy@gmail.com (Admin) đã tạo sản phẩm mới ansfkajfl', 28),
('2021-05-01 10:18:33', 'Tài khoản haokhuy@gmail.com (Admin) đã tạo chương trình giảm giá mới asdasdsadsadsadasd (2021-05-01 10:18:00   -   2021-05-22 10:18:00)', 29),
('2021-05-01 10:40:53', 'Tài khoản haokhuy@gmail.com (Admin) đã xóa chương trình giảm giá ID: 23', 30),
('2021-05-02 20:22:12', 'Tài khoản haokhuy@gmail.com (Admin) đã chỉnh sửa sản phẩm J0023  Hooded Puffer Jacket', 31),
('2021-05-03 08:40:37', 'Tài khoản haokhuy@gmail.com (Admin) đã tạo sản phẩm mới ádsadsadsadsad', 32),
('2021-05-03 08:40:54', 'Tài khoản haokhuy@gmail.com (Admin) đã chỉnh sửa sản phẩm ádsadsadsadsad', 33),
('2021-05-03 11:52:50', 'Tài khoản haokhuy@gmail.com (Admin) đã thay đổi số lượng sản phẩm ansfkajfl', 34),
('2021-05-03 20:33:07', 'Tài khoản haokhuy@gmail.com (Admin) đã hủy đơn hàng ID:45', 35),
('2021-05-04 04:49:25', 'Tài khoản haokhuy@gmail.com (Admin) đã tạo một quyền mới alksldmsalmlad', 36),
('2021-05-04 04:49:32', 'Tài khoản haokhuy@gmail.com (Admin) đã chỉnh sửa quyền ID:12', 37),
('2021-05-04 15:12:52', 'Tài khoản haokhuy@gmail.com (Admin) đã xóa quyền ID:12>', 38),
('2021-05-04 15:12:54', 'Tài khoản haokhuy@gmail.com (Admin) đã xóa quyền ID:12>', 39),
('2021-05-04 15:13:14', 'Tài khoản haokhuy@gmail.com (Admin) đã xóa quyền ID:12>', 40),
('2021-05-04 15:13:32', 'Tài khoản haokhuy@gmail.com (Admin) đã xóa quyền ID:12>', 41),
('2021-05-04 15:13:53', 'Tài khoản haokhuy@gmail.com (Admin) đã xóa quyền ID:12', 42),
('2021-05-04 15:14:11', 'Tài khoản haokhuy@gmail.com (Admin) đã tạo một quyền mới bSADSADSAD', 43),
('2021-05-04 16:17:26', 'Tài khoản haokhuy@gmail.com (Admin) đã tạo một tài khoản mới abc@gmail.com', 44),
('2021-05-05 09:11:42', 'Tài khoản haokhuy@gmail.com (Admin) đã xóa sản phẩm ádsadsadsadsad', 45),
('2021-05-05 09:18:08', 'Tài khoản haokhuy@gmail.com (Admin) đã tạo một tài khoản mới xyz@gmail.co', 46),
('2021-05-05 09:36:07', 'Tài khoản haokhuy@gmail.com (Admin) đã hủy đơn hàng ID:45', 47),
('2021-05-05 09:36:14', 'Tài khoản haokhuy@gmail.com (Admin) đã hủy đơn hàng ID:45', 48),
('2021-05-05 09:36:19', 'Tài khoản haokhuy@gmail.com (Admin) đã xác nhận đơn hàng ID:57', 49),
('2021-05-05 09:36:26', 'Tài khoản haokhuy@gmail.com (Admin) đã xác nhận đơn hàng ID:58', 50),
('2021-05-05 09:36:46', 'Tài khoản haokhuy@gmail.com (Admin) đã xác nhận xử lý xong đơn hàng ID:58', 51),
('2021-05-05 09:37:24', 'Tài khoản haokhuy@gmail.com (Admin) đã xác nhận xử lý xong đơn hàng ID:58', 52),
('2021-05-05 09:37:57', 'Tài khoản haokhuy@gmail.com (Admin) đã xác nhận xử lý xong đơn hàng ID:57', 53),
('2021-05-05 09:38:09', 'Tài khoản haokhuy@gmail.com (Admin) đã hủy đơn hàng ID:57', 54),
('2021-05-05 09:38:23', 'Tài khoản haokhuy@gmail.com (Admin) đã hủy đơn hàng ID:57', 55),
('2021-05-05 09:45:25', 'Tài khoản haokhuy@gmail.com (Admin) đã tạo chương trình giảm giá mới sadad (2021-05-06 09:45:00   -   2021-05-14 09:45:00)', 56),
('2021-05-05 15:29:32', 'Tài khoản haokhuy@gmail.com (Admin) đã tạo chương trình giảm giá mới ll (2021-05-05 15:29:00   -   2021-05-05 21:29:00)', 57),
('2021-05-05 15:54:54', 'Tài khoản haokhuy@gmail.com (Admin) đã xác nhận đơn hàng ID:59', 58),
('2021-05-05 15:55:00', 'Tài khoản haokhuy@gmail.com (Admin) đã xác nhận xử lý xong đơn hàng ID:59', 59),
('2021-05-09 10:20:05', 'Tài khoản haokhuy@gmail.com (Admin) đã chỉnh sửa quyền ID:8', 60),
('2021-05-09 10:37:27', 'Tài khoản haokhuy@gmail.com (Admin) đã tạo một quyền mới ', 61),
('2021-05-09 13:22:34', 'Tài khoản haokhuy@gmail.com (Admin) đã tạo sản phẩm mới ', 62),
('2021-05-09 16:23:16', 'Tài khoản haokhuy@gmail.com (Admin) đã chỉnh sửa sản phẩm abc', 63),
('2021-05-09 17:49:56', 'Tài khoản haokhuy@gmail.com (Admin) đã chỉnh sửa quyền ID:8', 64),
('2021-05-11 18:15:43', 'Tài khoản haokhuy@gmail.com (Admin) đã xác nhận đơn hàng ID:63', 65),
('2021-05-11 18:15:47', 'Tài khoản haokhuy@gmail.com (Admin) đã xác nhận xử lý xong đơn hàng ID:63', 66),
('2021-05-11 18:17:52', 'Tài khoản haokhuy@gmail.com (Admin) đã hủy đơn hàng ID:63', 67),
('2021-05-11 18:46:37', 'Tài khoản haokhuy@gmail.com (Admin) đã xác nhận đơn hàng ID:64', 68),
('2021-05-11 18:46:48', 'Tài khoản haokhuy@gmail.com (Admin) đã xác nhận xử lý xong đơn hàng ID:64', 69),
('2021-05-11 20:11:09', 'Tài khoản haokhuy@gmail.com (Admin) đã xác nhận đơn hàng ID:66', 70),
('2021-05-11 20:11:16', 'Tài khoản haokhuy@gmail.com (Admin) đã xác nhận xử lý xong đơn hàng ID:66', 71),
('2021-05-12 08:17:27', 'Tài khoản haokhuy@gmail.com (Admin) đã xác nhận đơn hàng ID:67', 72),
('2021-05-12 08:17:45', 'Tài khoản haokhuy@gmail.com (Admin) đã xác nhận xử lý xong đơn hàng ID:67', 73),
('2021-05-12 08:44:03', 'Tài khoản haokhuy@gmail.com (Admin) đã xác nhận đơn hàng ID:68', 74),
('2021-05-12 08:44:07', 'Tài khoản haokhuy@gmail.com (Admin) đã xác nhận xử lý xong đơn hàng ID:68', 75),
('2021-05-12 08:44:09', 'Tài khoản haokhuy@gmail.com (Admin) đã xác nhận đơn hàng ID:69', 76),
('2021-05-12 08:44:13', 'Tài khoản haokhuy@gmail.com (Admin) đã hủy đơn hàng ID:67', 77),
('2021-05-12 08:55:52', 'Tài khoản haokhuy@gmail.com (Admin) đã xác nhận xử lý xong đơn hàng ID:69', 78),
('2021-05-12 08:56:05', 'Tài khoản haokhuy@gmail.com (Admin) đã xác nhận đơn hàng ID:70', 79),
('2021-05-12 08:56:12', 'Tài khoản haokhuy@gmail.com (Admin) đã xác nhận xử lý xong đơn hàng ID:70', 80),
('2021-05-12 08:56:37', 'Tài khoản haokhuy@gmail.com (Admin) đã hủy đơn hàng ID:68', 81),
('2021-05-12 08:57:04', 'Tài khoản haokhuy@gmail.com (Admin) đã chỉnh sửa quyền ID:9', 82),
('2021-05-12 08:58:26', 'Tài khoản haokhuy@gmail.com (Admin) đã tạo một tài khoản mới andelnguyen@gmail.com', 83),
('2021-05-12 09:35:32', 'Tài khoản haokhuy@gmail.com (Admin) đã tạo chương trình giảm giá mới adsd (2021-05-29 09:34:00   -   2021-05-29 09:41:00)', 84),
('2021-05-12 09:40:11', 'Tài khoản haokhuy@gmail.com (Admin) đã xóa chương trình giảm giá ID: 28', 85),
('2021-05-12 09:40:36', 'Tài khoản haokhuy@gmail.com (Admin) đã tạo chương trình giảm giá mới xxx (2021-05-31 09:40:00   -   2021-06-01 09:40:00)', 86),
('2021-05-31 11:18:33', 'Tài khoản haokhuy@gmail.com (Admin) đã chỉnh sửa quyền ID:8', 87),
('2021-05-31 11:18:41', 'Tài khoản haokhuy@gmail.com (Admin) đã xóa quyền ID:9', 88),
('2021-05-31 11:18:42', 'Tài khoản haokhuy@gmail.com (Admin) đã xóa quyền ID:9', 89),
('2021-05-31 11:18:44', 'Tài khoản haokhuy@gmail.com (Admin) đã xóa quyền ID:9', 90),
('2021-05-31 11:18:45', 'Tài khoản haokhuy@gmail.com (Admin) đã xóa quyền ID:9', 91),
('2021-05-31 11:18:47', 'Tài khoản haokhuy@gmail.com (Admin) đã xóa quyền ID:12', 92),
('2021-05-31 11:18:49', 'Tài khoản haokhuy@gmail.com (Admin) đã xóa quyền ID:11', 93),
('2021-05-31 11:18:51', 'Tài khoản haokhuy@gmail.com (Admin) đã xóa quyền ID:10', 94),
('2021-05-31 11:18:53', 'Tài khoản haokhuy@gmail.com (Admin) đã xóa quyền ID:9', 95),
('2021-05-13 08:29:55', 'Tài khoản haokhuy@gmail.com (Admin) đã xác nhận đơn hàng ID:73', 96),
('2021-05-13 08:30:08', 'Tài khoản haokhuy@gmail.com (Admin) đã xác nhận xử lý xong đơn hàng ID:73', 97),
('2021-05-13 08:32:41', 'Tài khoản haokhuy@gmail.com (Admin) đã tạo một tài khoản mới admin@gmail.com', 98),
('2021-05-13 10:27:18', 'Tài khoản admin@gmail.com (Admin) đã xác nhận đơn hàng ID:74', 99),
('2021-05-13 10:40:24', 'Tài khoản admin@gmail.com (Admin) đã xác nhận xử lý xong đơn hàng ID:74', 100),
('2021-05-13 10:41:59', 'Tài khoản admin@gmail.com (Admin) đã xác nhận đơn hàng ID:76', 101),
('2021-05-13 10:42:00', 'Tài khoản admin@gmail.com (Admin) đã xác nhận xử lý xong đơn hàng ID:76', 102),
('2021-05-11 10:47:12', 'Tài khoản admin@gmail.com (Admin) đã xác nhận đơn hàng ID:77', 103),
('2021-05-11 10:47:17', 'Tài khoản admin@gmail.com (Admin) đã xác nhận xử lý xong đơn hàng ID:77', 104),
('2021-05-11 11:08:20', 'Tài khoản admin@gmail.com (Admin) đã xác nhận đơn hàng ID:78', 105),
('2021-05-11 11:08:21', 'Tài khoản admin@gmail.com (Admin) đã xác nhận xử lý xong đơn hàng ID:78', 106),
('2021-05-11 11:15:34', 'Tài khoản admin@gmail.com (Admin) đã xác nhận đơn hàng ID:79', 107),
('2021-05-11 11:17:49', 'Tài khoản admin@gmail.com (Admin) đã xác nhận đơn hàng ID:79', 108),
('2021-05-11 11:21:24', 'Tài khoản admin@gmail.com (Admin) đã xác nhận đơn hàng ID:80', 109),
('2021-05-11 11:22:13', 'Tài khoản admin@gmail.com (Admin) đã xác nhận xử lý xong đơn hàng ID:80', 110),
('2021-05-11 11:22:17', 'Tài khoản admin@gmail.com (Admin) đã hủy đơn hàng ID:80', 111),
('2021-05-13 12:37:02', 'Tài khoản haokhuy@gmail.com (Admin) đã xác nhận đơn hàng ID:82', 112),
('2021-05-13 12:37:18', 'Tài khoản haokhuy@gmail.com (Admin) đã hủy đơn hàng ID:81', 113),
('2021-05-13 12:39:25', 'Tài khoản haokhuy@gmail.com (Admin) đã xác nhận đơn hàng ID:83', 114),
('2021-05-13 12:39:51', 'Tài khoản haokhuy@gmail.com (Admin) đã hủy đơn hàng ID:83', 115),
('2021-05-13 12:54:16', 'Tài khoản haokhuy@gmail.com (Admin) đã xác nhận xử lý xong đơn hàng ID:82', 116),
('2021-05-10 12:58:42', 'Tài khoản admin@gmail.com (Admin) đã xác nhận đơn hàng ID:85', 117),
('2021-05-10 12:58:46', 'Tài khoản admin@gmail.com (Admin) đã xác nhận đơn hàng ID:84', 118),
('2021-05-10 12:58:49', 'Tài khoản admin@gmail.com (Admin) đã xác nhận xử lý xong đơn hàng ID:85', 119),
('2021-05-10 12:58:50', 'Tài khoản admin@gmail.com (Admin) đã xác nhận xử lý xong đơn hàng ID:84', 120),
('2021-05-07 12:59:40', 'Tài khoản admin@gmail.com (Admin) đã xác nhận đơn hàng ID:86', 121),
('2021-05-07 12:59:41', 'Tài khoản admin@gmail.com (Admin) đã xác nhận xử lý xong đơn hàng ID:86', 122),
('2021-05-13 14:19:26', 'Tài khoản admin@gmail.com (Admin) đã tạo chương trình giảm giá mới ll (2021-05-12 14:19:00   -   2021-05-15 14:19:00)', 123),
('2021-05-13 14:26:28', 'Tài khoản admin@gmail.com (Admin) đã xóa chương trình giảm giá ID: 30', 124),
('2021-05-13 14:27:30', 'Tài khoản admin@gmail.com (Admin) đã tạo chương trình giảm giá mới bbbb (2021-05-12 14:27:00   -   2021-05-15 14:27:00)', 125),
('2021-05-19 10:37:57', 'Tài khoản haokhuy@gmail.com (Admin) đã tạo một tài khoản mới xyz@gmail.co', 126),
('2021-05-19 10:40:32', 'Tài khoản haokhuy@gmail.com (Admin) đã tạo một tài khoản mới minhkhuy76@gmail.com', 127),
('2021-05-16 13:42:31', 'Tài khoản haokhuy@gmail.com (Admin) đã xác nhận đơn hàng ID:89', 128),
('2021-05-16 13:42:34', 'Tài khoản haokhuy@gmail.com (Admin) đã xác nhận xử lý xong đơn hàng ID:89', 129),
('2021-05-16 13:43:08', 'Tài khoản haokhuy@gmail.com (Admin) đã hủy đơn hàng ID:90', 130),
('2021-05-17 13:45:43', 'Tài khoản haokhuy@gmail.com (Admin) đã xác nhận đơn hàng ID:91', 131),
('2021-05-17 13:45:47', 'Tài khoản haokhuy@gmail.com (Admin) đã xác nhận xử lý xong đơn hàng ID:91', 132);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `name_customer` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phoneNumber` varchar(100) NOT NULL,
  `address_detail` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `province` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `district` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `village` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `state` int(10) NOT NULL,
  `discount` int(11) NOT NULL,
  `date_confirm` datetime NOT NULL,
  `date_complete` datetime NOT NULL,
  `date_receipt` datetime NOT NULL,
  `date_cancel` datetime NOT NULL,
  `staff_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `date`, `name_customer`, `phoneNumber`, `address_detail`, `province`, `district`, `village`, `state`, `discount`, `date_confirm`, `date_complete`, `date_receipt`, `date_cancel`, `staff_id`) VALUES
(89, 51, '2021-05-16 13:40:37', 'Tran Khuy', '0377738029', '458 Huỳnh Tấn Phát', 'Vĩnh Phúc', 'Lập Thạch', 'Xuân Lôi', 4, 0, '2021-05-16 13:42:31', '2021-05-16 13:42:34', '2021-05-16 13:42:40', '0000-00-00 00:00:00', 4),
(90, 51, '2021-05-16 13:43:04', 'Tran Khuy', '0377738029', 'abc', 'Hải Dương', 'Kinh Môn', 'Thăng Long', 5, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2021-05-16 13:43:08', 4),
(91, 56, '2021-05-17 13:44:22', 'Admin', '0377738029', 'abc', 'Lâm Đồng', 'Đam Rông', 'Liêng Srônh', 4, 0, '2021-05-17 13:45:43', '2021-05-17 13:45:47', '2021-05-17 13:45:52', '0000-00-00 00:00:00', 4),
(92, 56, '2021-05-19 13:47:08', 'Admin', '0377738029', 'aaa', 'Lâm Đồng', 'Đơn Dương', 'Lạc Lâm', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4),
(93, 56, '2021-05-22 20:19:12', 'Lan Chi', '0979753141', 'Kenh buu liem', 'An Giang', 'Châu Thành', 'Tân Phú', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4),
(94, 59, '2022-11-23 20:11:15', 'Minh Khuy', '0377738029', 'dfdfdf', 'Hà Nam', 'Thanh Liêm', 'Thanh Phong', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `power`
--

CREATE TABLE `power` (
  `power_id` int(11) NOT NULL,
  `power_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `power`
--

INSERT INTO `power` (`power_id`, `power_name`) VALUES
(8, 'Admin');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `power_detail`
--

CREATE TABLE `power_detail` (
  `power_id` int(11) NOT NULL,
  `title_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `power_detail`
--

INSERT INTO `power_detail` (`power_id`, `title_id`) VALUES
(8, 1),
(8, 2),
(8, 4),
(8, 5),
(8, 6),
(8, 7),
(8, 8),
(8, 9),
(8, 10),
(8, 11),
(8, 12),
(8, 13);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `prd_id` int(5) NOT NULL,
  `prd_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `newArrival` tinyint(1) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`prd_id`, `prd_name`, `price`, `description`, `newArrival`, `sale_id`, `category_id`) VALUES
(66, 'RIOTxTHANHPHONG TRE TRAU TShirt', 450000, 'Artwork tràn khổ lớn ở mặt trước', 1, 0, 4),
(67, 'Mirrored Print Relax Tshirt', 310000, 'Với 06 phiên bản màu cùng hiệu ứng ép 3D mới được RIOT lần đầu áp dụng cho hình in logo mirror quen thuộc T0120 chính là mẫu Tshirt không thể thiếu cho những ngày nóng sắp tới', 1, 0, 4),
(68, 'RIOTxTHANHPHONG TRE TRAU Jacket', 850000, 'Form Regular', 1, 0, 3),
(69, 'Hooded Puffer Jacket', 680000, 'Form áo oversized', 1, 0, 3),
(70, 'Active Windbreaker Jacket with Reflective Logo ver 20', 530000, 'In logo phản quang', 1, 0, 3),
(71, 'Asymmetrical Layered sleeve Suede Sweater', 390000, ' Hình in logo bản mới lần đầu tiên áp dụng công nghệ thêu vi tính Machine Embroidery', 1, 0, 6),
(72, 'Mixed Material Sweater', 530000, 'Sweater mix 2 chất liệu nỉ  gió nhiều đường cắt may', 1, 0, 6),
(73, 'Asymmetrical Layered sleeve Suede Hoodie', 440000, ' Hình in logo bản mới lần đầu tiên áp dụng công nghệ thêu vi tính Machine Embroidery', 1, 0, 7),
(74, 'Riot x Pepsi  Asymmetrical Layered Sleeve  Hoodie', 690000, 'Chiếc Hoodie với đường cắt tay 1 bên đặc trưng của RIOT', 1, 0, 7),
(75, 'Suede Hoodie Ver 30', 590000, 'Phiên bản hoodie chất liệu da lộn đã được thử nghiệm qua 03 mùa', 1, 0, 7),
(76, 'RIOTxTHANHPHONG TRE TRAU Cargo Pants', 650000, 'Form Regular', 0, 0, 2),
(77, 'Contour Pants with Core System Logo', 530000, 'Mẫu quần Form relax', 0, 0, 2),
(78, 'Crossbody Grinding Bag', 590000, '4 ngăn túi ngoài', 0, 0, 5),
(79, 'Tactical Belt Bag', 390000, 'Chất liệu Polyester 100  PE Có 3 túi bé riêng biệt  Dây đai có 1 ngăn riêng', 0, 0, 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sale`
--

CREATE TABLE `sale` (
  `sale_id` int(11) NOT NULL,
  `sale_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `date_start` datetime NOT NULL DEFAULT current_timestamp(),
  `date_end` datetime NOT NULL,
  `percent` int(11) NOT NULL,
  `check_sale` tinyint(4) NOT NULL,
  `category` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `sale`
--

INSERT INTO `sale` (`sale_id`, `sale_name`, `date_start`, `date_end`, `percent`, `check_sale`, `category`) VALUES
(0, 'Default', '2021-04-01 10:15:35', '2021-04-02 10:15:35', 0, 0, 'all'),
(31, 'bbbb', '2021-05-12 14:27:00', '2021-05-15 14:27:00', 10, 0, 'Tee');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `size`
--

CREATE TABLE `size` (
  `size_id` int(11) NOT NULL,
  `size_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `size`
--

INSERT INTO `size` (`size_id`, `size_name`) VALUES
(2, 'L'),
(3, 'M'),
(4, 'S'),
(5, 'XL'),
(6, 'XXL');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `staff`
--

CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `staff_name` varchar(100) NOT NULL,
  `power_id` int(11) NOT NULL,
  `phoneNumber` varchar(100) NOT NULL,
  `date_create` datetime NOT NULL,
  `activity` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `staff`
--

INSERT INTO `staff` (`staff_id`, `email`, `password`, `staff_name`, `power_id`, `phoneNumber`, `date_create`, `activity`) VALUES
(4, 'haokhuy@gmail.com', '123', 'sfsa', 8, '0377738029', '2021-04-23 23:27:21', 1),
(12, 'admin@gmail.com', 'admin', 'Admin', 8, '0377738029', '2021-05-13 08:32:41', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `title`
--

CREATE TABLE `title` (
  `title_id` int(11) NOT NULL,
  `title_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `title`
--

INSERT INTO `title` (`title_id`, `title_name`, `link`) VALUES
(1, 'Sản phẩm', './products/main.php'),
(2, 'Khách hàng', './users/main.php'),
(4, 'Chương trình giảm giá', './sales/main.php'),
(5, 'Đơn hàng', './orders/main.php'),
(6, 'Nhân viên', './staff/main.php'),
(7, 'Thống kê', './statistic/main.php'),
(8, 'Nhóm quyền', './powers/main.php'),
(9, 'Log', './log/main.php'),
(10, 'Size', './size/main.php'),
(11, 'Màu sắc', './color/main.php'),
(12, 'Thể loại', './category/main.php'),
(13, 'Nhập kho', './import/main.php');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `nameUser` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) NOT NULL,
  `token` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phoneNumber` varchar(100) NOT NULL,
  `verify` tinyint(4) NOT NULL,
  `date_create` datetime NOT NULL,
  `activity` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`user_id`, `nameUser`, `password`, `token`, `email`, `phoneNumber`, `verify`, `date_create`, `activity`) VALUES
(51, 'Tran Khuy', '$2y$10$1iWjfTPDjUac.YwR00LsgeyTnaWTc92dhCnsq/xq7E8B5rfbYwy.2', '507f8f43c7b765ebdf0eba8646a6f0f4ad7e237514e4af849e9871760d5e47f5a36356e30b296ccf179d0347bcf609d6fb6b', 'haokhuy@gmail.com', '0377738029', 0, '2021-05-10 16:27:21', 1),
(56, 'Admin', '$2y$10$EKl8T0k0OGNPRNv.EOIypunmmp4k6wqCJhut0CGOCqNLr0Ogxn.Re', 'b70c89a47f5d941a56efe344eaae72306dddb6152ecb8fa7f82350e828b53e92883f5b894ee8b3a6118f62c504552b6a88a2', 'admin@gmail.com', '0377738029', 0, '2021-05-19 13:34:39', 1),
(59, 'Minh Khuy', '$2y$10$sGqO2xlNd5OnWdj4v5G6D.iSY31IWLvyCyxZ9Z/a5aAM6GWQfBV9.', 'ed46675a25bb112f968bc0aa7fc6f38e53c1474bd075915b3d8d44fec4f74df290dd27e11043c361572dcaeae702cf992f49', 'minhkhuy76@gmail.com', '0377738029', 0, '2022-11-23 20:10:27', 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `detail_prd_size_id` (`detail_prd_size_id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`color_id`);

--
-- Chỉ mục cho bảng `detail_import`
--
ALTER TABLE `detail_import`
  ADD PRIMARY KEY (`detail_import_id`),
  ADD KEY `import_id` (`import_id`),
  ADD KEY `detail_prd_size_id` (`detail_prd_size_id`);

--
-- Chỉ mục cho bảng `detail_order`
--
ALTER TABLE `detail_order`
  ADD PRIMARY KEY (`detail_order_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `detail_prd_size_id` (`detail_prd_size_id`);

--
-- Chỉ mục cho bảng `detail_product`
--
ALTER TABLE `detail_product`
  ADD PRIMARY KEY (`detail_prd_id`),
  ADD KEY `color_id` (`color_id`),
  ADD KEY `prd_id` (`prd_id`);

--
-- Chỉ mục cho bảng `detail_product_size`
--
ALTER TABLE `detail_product_size`
  ADD PRIMARY KEY (`detail_prd_size_id`),
  ADD KEY `detail_prd_id` (`detail_prd_id`),
  ADD KEY `size_id` (`size_id`);

--
-- Chỉ mục cho bảng `import`
--
ALTER TABLE `import`
  ADD PRIMARY KEY (`import_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Chỉ mục cho bảng `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`log_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Chỉ mục cho bảng `power`
--
ALTER TABLE `power`
  ADD PRIMARY KEY (`power_id`);

--
-- Chỉ mục cho bảng `power_detail`
--
ALTER TABLE `power_detail`
  ADD PRIMARY KEY (`power_id`,`title_id`),
  ADD KEY `title_id` (`title_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`prd_id`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Chỉ mục cho bảng `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`sale_id`);

--
-- Chỉ mục cho bảng `size`
--
ALTER TABLE `size`
  ADD PRIMARY KEY (`size_id`);

--
-- Chỉ mục cho bảng `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD KEY `power_id` (`power_id`);

--
-- Chỉ mục cho bảng `title`
--
ALTER TABLE `title`
  ADD PRIMARY KEY (`title_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `color`
--
ALTER TABLE `color`
  MODIFY `color_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `detail_import`
--
ALTER TABLE `detail_import`
  MODIFY `detail_import_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT cho bảng `detail_order`
--
ALTER TABLE `detail_order`
  MODIFY `detail_order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT cho bảng `detail_product`
--
ALTER TABLE `detail_product`
  MODIFY `detail_prd_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `detail_product_size`
--
ALTER TABLE `detail_product_size`
  MODIFY `detail_prd_size_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

--
-- AUTO_INCREMENT cho bảng `import`
--
ALTER TABLE `import`
  MODIFY `import_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `log`
--
ALTER TABLE `log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT cho bảng `power`
--
ALTER TABLE `power`
  MODIFY `power_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `prd_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT cho bảng `sale`
--
ALTER TABLE `sale`
  MODIFY `sale_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT cho bảng `size`
--
ALTER TABLE `size`
  MODIFY `size_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `staff`
--
ALTER TABLE `staff`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `title`
--
ALTER TABLE `title`
  MODIFY `title_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `cart_ibfk_4` FOREIGN KEY (`detail_prd_size_id`) REFERENCES `detail_product_size` (`detail_prd_size_id`);

--
-- Các ràng buộc cho bảng `detail_import`
--
ALTER TABLE `detail_import`
  ADD CONSTRAINT `detail_import_ibfk_1` FOREIGN KEY (`import_id`) REFERENCES `import` (`import_id`),
  ADD CONSTRAINT `detail_import_ibfk_2` FOREIGN KEY (`detail_prd_size_id`) REFERENCES `detail_product_size` (`detail_prd_size_id`);

--
-- Các ràng buộc cho bảng `detail_order`
--
ALTER TABLE `detail_order`
  ADD CONSTRAINT `detail_order_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `detail_order_ibfk_2` FOREIGN KEY (`detail_prd_size_id`) REFERENCES `detail_product_size` (`detail_prd_size_id`);

--
-- Các ràng buộc cho bảng `detail_product`
--
ALTER TABLE `detail_product`
  ADD CONSTRAINT `detail_product_ibfk_1` FOREIGN KEY (`color_id`) REFERENCES `color` (`color_id`),
  ADD CONSTRAINT `detail_product_ibfk_2` FOREIGN KEY (`prd_id`) REFERENCES `products` (`prd_id`);

--
-- Các ràng buộc cho bảng `detail_product_size`
--
ALTER TABLE `detail_product_size`
  ADD CONSTRAINT `detail_product_size_ibfk_1` FOREIGN KEY (`detail_prd_id`) REFERENCES `detail_product` (`detail_prd_id`),
  ADD CONSTRAINT `detail_product_size_ibfk_2` FOREIGN KEY (`size_id`) REFERENCES `size` (`size_id`);

--
-- Các ràng buộc cho bảng `import`
--
ALTER TABLE `import`
  ADD CONSTRAINT `import_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`);

--
-- Các ràng buộc cho bảng `power_detail`
--
ALTER TABLE `power_detail`
  ADD CONSTRAINT `power_detail_ibfk_1` FOREIGN KEY (`power_id`) REFERENCES `power` (`power_id`),
  ADD CONSTRAINT `power_detail_ibfk_2` FOREIGN KEY (`title_id`) REFERENCES `title` (`title_id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `sale` (`sale_id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`);

--
-- Các ràng buộc cho bảng `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`power_id`) REFERENCES `power` (`power_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

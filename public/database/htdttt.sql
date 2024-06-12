-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 30, 2023 lúc 10:33 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `htdttt`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chieu_cao_can_nang`
--

CREATE TABLE `chieu_cao_can_nang` (
  `id` bigint(20) NOT NULL,
  `gioi_tinh` varchar(255) DEFAULT NULL,
  `tuoi` double NOT NULL,
  `can_nang_toi_thieu` double NOT NULL,
  `can_nang_toi_da` double NOT NULL,
  `chieu_cao_toi_thieu` double NOT NULL,
  `chieu_cao_toi_da` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chieu_cao_can_nang`
--

INSERT INTO `chieu_cao_can_nang` (`id`, `gioi_tinh`, `tuoi`, `can_nang_toi_thieu`, `can_nang_toi_da`, `chieu_cao_toi_thieu`, `chieu_cao_toi_da`) VALUES
(1, 'nam', 2, 9.7, 15.3, 81, 93.2),
(2, 'nữ', 2, 9, 14.8, 80, 92.9),
(3, 'nam', 3, 11.3, 18.3, 88.7, 103.5),
(4, 'nữ', 3, 10.8, 18.1, 87.4, 102.7),
(5, 'nam', 4, 12.7, 21.2, 94.9, 111.7),
(6, 'nữ', 4, 11.6, 19.8, 90.9, 107.2),
(7, 'nam', 5, 14.1, 24.2, 100.7, 119.2),
(8, 'nữ', 5, 12.3, 21.5, 94.1, 111.3),
(9, 'nam', 6, 15.9, 27.1, 106.1, 125.8),
(10, 'nữ', 6, 15.3, 27.8, 104.9, 125.4),
(11, 'nam', 7, 17.7, 30.7, 111.2, 132.3),
(12, 'nữ', 7, 16.8, 31.4, 109.9, 131.7),
(13, 'nam', 8, 19.5, 34.7, 116, 138.6),
(14, 'nữ', 8, 18.6, 35.8, 115, 138.2),
(15, 'nam', 9, 21.3, 39.4, 120.5, 144.6),
(16, 'nữ', 9, 20.8, 41, 120.3, 144.7),
(17, 'nam', 10, 23.2, 31.2, 125, 150.5),
(18, 'nữ', 10, 23.3, 46.9, 125.8, 151.4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dinh_duong`
--

CREATE TABLE `dinh_duong` (
  `id` bigint(20) NOT NULL,
  `nhom` varchar(255) DEFAULT NULL,
  `ten` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `dinh_duong`
--

INSERT INTO `dinh_duong` (`id`, `nhom`, `ten`) VALUES
(1, 'Chất sinh năng lượng', 'protein'),
(2, 'Chất sinh năng lượng', 'lipid'),
(3, 'Chất sinh năng lượng', 'glucid'),
(4, 'Dinh dưỡng thiết yếu', 'Nước'),
(5, 'Dinh dưỡng thiết yếu', 'vitamin'),
(6, 'Dinh dưỡng thiết yếu', 'khoáng chất');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giai_phap`
--

CREATE TABLE `giai_phap` (
  `id` bigint(20) NOT NULL,
  `giai_phap` varchar(2048) DEFAULT NULL,
  `van_de` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `giai_phap`
--

INSERT INTO `giai_phap` (`id`, `giai_phap`, `van_de`) VALUES
(1, ' Phục hồi mất nước:\nCháo muối: 1 nắm gạo (50g) + 1 nhúm muối (3.5g) + 6 bát ăn nước cơm, đun nhừ,\nlọc lấy nước uống\nNước gạo rang: 50g gạo rang vàng và nấu như cháo muối\n', 'Suy dinh dưỡng thể còm'),
(2, 'Tăng chất béo trong khẩu phần ăn: bổ sung vào thực đơn ăn uống hàng ngày lượng dầu, mỡ nhất định. Lượng năng lượng từ dầu mỡ cung cấp cho cơ thể gấp đôi so với tinh bột và protein.', 'Suy dinh dưỡng thể còm'),
(3, 'Cho trẻ ăn bổ sung hợp lý:\r\nCho trẻ ăn từ ít đến nhiều, tập làm quen với thức ăn mới\r\nSố lượng thức ăn tăng theo độ tuổi\r\nĐảm bảo thức ăn mềm, dễ nhai, dễ nuốt\r\nThức ăn bổ cùng cần cân đối dinh dưỡng, có đủ các nhóm thức ăn\r\nTăng đậm độ năng lượng của thức ăn: thêm dầu, mỡ, vừng, lạc\r\nĐảm bảo vệ sinh thực phẩm\r\nCho trẻ ăn nhiều hơn trong và sau khi bị ốm, cho trẻ ăn uống nhiều chất lỏng hơn,\r\nđặc biệt là khi bị ỉa chảy và sốt cao\r\n', 'Suy dinh dưỡng thể còm'),
(4, ' Phục hồi mất nước:\nCháo muối: 1 nắm gạo (50g) + 1 nhúm muối (3.5g) + 6 bát ăn nước cơm, đun nhừ,\nlọc lấy nước uống\nNước gạo rang: 50g gạo rang vàng và nấu như cháo muối\n', 'Suy dinh dưỡng thể phù'),
(6, 'Cho trẻ ăn bổ sung hợp lý:\r\nCho trẻ ăn từ ít đến nhiều, tập làm quen với thức ăn mới\r\nSố lượng thức ăn tăng theo độ tuổi\r\nĐảm bảo thức ăn mềm, dễ nhai, dễ nuốt\r\nThức ăn bổ cùng cần cân đối dinh dưỡng, có đủ các nhóm thức ăn\r\nTăng đậm độ năng lượng của thức ăn: thêm dầu, mỡ, vừng, lạc\r\nĐảm bảo vệ sinh thực phẩm\r\nCho trẻ ăn nhiều hơn trong và sau khi bị ốm, cho trẻ ăn uống nhiều chất lỏng hơn,\r\nđặc biệt là khi bị ỉa chảy và sốt cao\r\n', 'Suy dinh dưỡng thể phù'),
(7, ' Phục hồi mất nước:\nCháo muối: 1 nắm gạo (50g) + 1 nhúm muối (3.5g) + 6 bát ăn nước cơm, đun nhừ,\nlọc lấy nước uống\nNước gạo rang: 50g gạo rang vàng và nấu như cháo muối\n', 'Suy dinh dưỡng thể phối hợp'),
(9, 'Cho trẻ ăn bổ sung hợp lý:\r\nCho trẻ ăn từ ít đến nhiều, tập làm quen với thức ăn mới\r\nSố lượng thức ăn tăng theo độ tuổi\r\nĐảm bảo thức ăn mềm, dễ nhai, dễ nuốt\r\nThức ăn bổ cùng cần cân đối dinh dưỡng, có đủ các nhóm thức ăn\r\nTăng đậm độ năng lượng của thức ăn: thêm dầu, mỡ, vừng, lạc\r\nĐảm bảo vệ sinh thực phẩm\r\nCho trẻ ăn nhiều hơn trong và sau khi bị ốm, cho trẻ ăn uống nhiều chất lỏng hơn,\r\nđặc biệt là khi bị ỉa chảy và sốt cao\r\n', 'Suy dinh dưỡng thể phối hợp'),
(10, 'Cho trẻ ăn đủ thức ăn giàu vitamin A: hạt nêm, bơ thực vật, dầu thực vật, đường...', 'Thiếu vitamin A'),
(11, 'Ăn thực phẩm giàu sắt, giàu vitamin C để tăng cường hấp thu sắt', 'Thiếu máu dinh dưỡng'),
(12, 'Ăn các thực phẩm giàu vitamin: cà chua, rau ...', 'Thiếu máu dinh dưỡng'),
(13, 'Sử dụng muối i-ốt', 'Thiếu i-ốt và bướu cổ'),
(14, 'Sử dụng gia vị chứa i-ốt: bột canh, hạt nêm..', 'Thiếu i-ốt và bướu cổ'),
(15, 'Đảm bảo chế độ ăn cung cấp đủ nhu cầu kẽm', 'Thiếu kẽm'),
(16, 'Cung cấp đủ rau quả chứa nhiều vitamin C, giúp tăng hấp thụ kẽm', 'Thiếu kẽm'),
(17, 'Thay thế các loại thực phẩm có thành phần dinh dưỡng nhưng ít đường\nvà chất béo hơn như khoai lang, ngô. Có thể cho trẻ ăn nhiều rau xanh,\ncác loại trái cây thực phẩm chứa nhiều chất xơ.\n', 'Thừa cân, béo phì'),
(18, 'Không cho trẻ ăn các thức ăn nhiều dầu mỡ, đồ ăn chiên xào\nthay vào đó có thể hấp, luộc\n', 'Thừa cân, béo phì'),
(19, 'Cho trẻ ăn ít loại đồ ăn vừa chứa chất béo vừa nhiều\nđường như bánh nướng, khoai tây chiên, \n xúc xích...', 'Thừa cân, béo phì');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hien_tuong`
--

CREATE TABLE `hien_tuong` (
  `id` bigint(20) NOT NULL,
  `bieu_hien` varchar(255) DEFAULT NULL,
  `muc_do_phu_hop` int(11) NOT NULL,
  `van_de` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `hien_tuong`
--

INSERT INTO `hien_tuong` (`id`, `bieu_hien`, `muc_do_phu_hop`, `van_de`) VALUES
(1, 'Da bọc xương, teo cơ', 3, 'Suy dinh dưỡng thể còm'),
(2, 'Mắt mỡ dưới da', 3, 'Suy dinh dưỡng thể còm'),
(3, 'Bộ mặt của ông già', 3, 'Suy dinh dưỡng thể còm'),
(4, 'Bụng ỏng, phình ra', 2, 'Suy dinh dưỡng thể còm'),
(5, 'Khó chịu, bứt rứt, quấy khóc', 1, 'Suy dinh dưỡng thể còm'),
(6, 'Phù chân tay mặt', 2, 'Suy dinh dưỡng thể phù'),
(7, 'Sút cân vừa phải', 3, 'Suy dinh dưỡng thể phù'),
(8, 'Mặt tròn, vòng cánh tay nhỏ, cơ yếu', 2, 'Suy dinh dưỡng thể phù'),
(9, 'Kém ngon miệng', 1, 'Suy dinh dưỡng thể phù'),
(10, 'Bứt rứt, lãnh đạm, thờ ơ, quấy khóc', 1, 'Suy dinh dưỡng thể phù'),
(11, 'Tóc mỏng, thưa, dễ nhổ', 2, 'Suy dinh dưỡng thể phù'),
(12, 'Sút cân nhiều', 3, 'Suy dinh dưỡng thể phối hợp'),
(13, 'Phù chân tay mặt', 3, 'Suy dinh dưỡng thể phối hợp'),
(14, 'Tóc mỏng, thay đổi da', 3, 'Suy dinh dưỡng thể phối hợp'),
(15, 'Gầy', 1, 'Suy dinh dưỡng thể phối hợp'),
(16, 'Thay đổi tinh thần', 2, 'Suy dinh dưỡng thể phối hợp'),
(17, 'Giảm thị lực trong điều kiện thiếu ánh sáng', 2, 'Thiếu vitamin A'),
(18, 'Không nhìn rõ lúc chập tối', 1, 'Thiếu vitamin A'),
(19, 'Sợ đi, ngồi 1 chỗ', 1, 'Thiếu vitamin A'),
(20, 'Đi vấp ngã, đi không đúng chỗ', 1, 'Thiếu vitamin A'),
(21, 'Mảng nổi lên có màu trắng sáng hoặc vàng nhạt,\nhình oval hoặc tam giác ở vị trí góc mũi hoặc thái dương\n', 3, 'Thiếu vitamin A'),
(22, 'Bề mặt mắt có vẩy hoặc chấm trắng như đám mây', 3, 'Thiếu vitamin A'),
(23, 'Sợ ánh sáng, chói, hay dụi mắt', 2, 'Thiếu vitamin A'),
(24, 'Bề mặt mắt bị phủ 1 lớp mây trắng đục,\ntoàn bộ giác mạc bị mềm nhũn\n', 3, 'Thiếu vitamin A'),
(25, 'Giác mạc bị đục', 3, 'Thiếu vitamin A'),
(26, 'Mệt mỏi, thờ ơ, ù tai, hoa mắt chóng mặt', 3, 'Thiếu máu dinh dưỡng'),
(27, 'Đau đầu, giảm trí nhớ, mất ngủ, tê tay chân', 3, 'Thiếu máu dinh dưỡng'),
(28, 'Đánh trống ngực, khó thở', 3, 'Thiếu máu dinh dưỡng'),
(29, 'Da xanh, niêm mạc nhợt nhạt', 3, 'Thiếu máu dinh dưỡng'),
(30, 'Lưỡi màu nhợt', 2, 'Thiếu máu dinh dưỡng'),
(31, 'Tóc rụng, móng tay giòn, dễ gãy', 1, 'Thiếu máu dinh dưỡng'),
(32, 'Mạch nhanh', 1, 'Thiếu máu dinh dưỡng'),
(33, 'Sờ thấy tuyến giáp, mỗi thùy bên của tuyến giáp\ncó kích thước lớn hơn đốt ngón tay cái\n', 3, 'Thiếu i-ốt và bướu cổ'),
(34, 'Ngửa cổ nhìn thấy tuyến giáp di động khi nuốt', 3, 'Thiếu i-ốt và bướu cổ'),
(35, 'Tuyến giáp to, nhìn thấy bướu khi cổ ở tư thế bình thường', 3, 'Thiếu i-ốt và bướu cổ'),
(36, 'Thấp còi, nhẹ cân', 1, 'Thiếu kẽm'),
(37, 'Chán ăn, rối loạn nhận thức', 3, 'Thiếu kẽm'),
(38, 'Thừa cân, nhiều mỡ', 3, 'Thừa cân, béo phì'),
(39, 'Thường xuyên đói bụng', 1, 'Thừa cân, béo phì'),
(40, 'Tê chân tay', 2, 'Thừa cân, béo phì');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `message`
--

CREATE TABLE `message` (
  `id_message` int(5) NOT NULL,
  `content` varchar(5000) NOT NULL,
  `sender` int(11) NOT NULL,
  `timenow` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `message`
--

INSERT INTO `message` (`id_message`, `content`, `sender`, `timenow`) VALUES
(1, 'Chào bác sỹ, tôi cần biết thêm thông tin về vitamin cho trẻ 6 tuổi', 0, '12:05'),
(2, 'Vai trò của vitamin là: Dinh dưỡng thiết yếu<br>- Tham gia vào quá trình chuyển hóa: vitamin b1 chuyển hóa glucid, vitamin d sử dụng và chuyển hóa canxi, phospho<br>- Giúp phát triển cơ thể: vitamin a, vitamin b1, vitamin b2<br>- Tạo hồng cầu: vitamin b2, vitamin b12, acid folic<br>- Tăng sức đề kháng của cơ thể: vitamin a, vitamin c<br>- Giữ cho hệ thần kinh, hệ tiêu hóa hoạt động tốt: vitamin b1, vitamin b2, vitamin b12, vitamin c<br>- Chống lão hóa: vitamin e, vitamin c<br><br>Nhu cầu đối với trẻ là:<br>- Vitamin A: 375(mcg/ngày)<br>- Vitamin B1: 0.4(mcg/ngày)<br>- Vitamin B2: 0.5(mcg/ngày)<br>- Vitamin B3: 6(mcg/ngày)<br>- Vitamin B6: 0.6(mcg/ngày)<br>- Vitamin B9: 35(mcg/ngày)<br>- Vitamin B12: 0.5(mcg/ngày)<br>- Vitamin C: 35(mcg/ngày)<br>- Vitamin D: 5(mcg/ngày)<br>- Vitamin E: 4(mcg/ngày)<br>- Vitamin K: 10(mcg/ngày)<br>', 1, ''),
(3, 'Chào bác sỹ, tôi muốn hỏi chế độ ăn cho cháu có chiều cao 90 cm, cân nặng 10 kg, giới tính nữ, 2 tuổi', 0, '12:15'),
(4, 'Thể trạng hiện tại của cháu là:Suy dinh dưỡng cấp 1<br>Khẩu phần ăn phù hợp cho cháu là khoảng: 1100 kcal<br>Thực đơn ví dụ như:<br>- 528 kcal từ Bánh mì,Chuối,Ngô ngọt,<br>- 440 kcal từ Phô mai,Bắp bò,Thịt ba chỉ,<br>- 132 kcal từ Bưởi,Rau muống,Bầu,', 1, ''),
(5, 'Chào bác sỹ, tôi muốn hỏi chế độ ăn cho cháu có chiều cao 90 cm, cân nặng 10 kg, giới tính nữ, 2 tuổi', 0, '13:10'),
(6, 'Thể trạng hiện tại của cháu là:Suy dinh dưỡng cấp 1<br>Khẩu phần ăn phù hợp cho cháu là khoảng: 1100 kcal<br>Thực đơn ví dụ như:<br>- 528 kcal từ Bánh mì đen,Cơm,Chuối,<br>- 440 kcal từ Bắp bò,Phô mai,Thịt ba chỉ,<br>- 132 kcal từ Cá thu,Bưởi,Bầu,', 1, ''),
(7, 'Chào bác sỹ, tôi muốn hỏi chếưesfewerw độ ăn cho cháu có chiều cao ... cm, cân nặng ... kg, giới tính ..., ... tuổi', 0, '13:37'),
(8, 'Không thể nhận dạng thông tin tư vấn', 1, ''),
(9, 'Chào bác sỹ, cháu nhà tôi có hiện tượng Khó chịu, bứt rứt, quấy khóc; Phù chân tay mặt thì chế độ dinh dưỡng như thế nào để khắc phục ạ ?', 0, '13:47'),
(10, 'Từ hiện tượng, có thể cháu đang gặp vấn đề suy dinh dưỡng thể phối hợp, giải pháp cho vấn đề này là<br>-  Phục hồi mất nước:\nCháo muối: 1 nắm gạo (50g) + 1 nhúm muối (3.5g) + 6 bát ăn nước cơm, đun nhừ,\nlọc lấy nước uống\nNước gạo rang: 50g gạo rang vàng và nấu như cháo muối\n<br>- Cho trẻ ăn bổ sung hợp lý:\r\nCho trẻ ăn từ ít đến nhiều, tập làm quen với thức ăn mới\r\nSố lượng thức ăn tăng theo độ tuổi\r\nĐảm bảo thức ăn mềm, dễ nhai, dễ nuốt\r\nThức ăn bổ cùng cần cân đối dinh dưỡng, có đủ các nhóm thức ăn\r\nTăng đậm độ năng lượng của thức ăn: thêm dầu, mỡ, vừng, lạc\r\nĐảm bảo vệ sinh thực phẩm\r\nCho trẻ ăn nhiều hơn trong và sau khi bị ốm, cho trẻ ăn uống nhiều chất lỏng hơn,\r\nđặc biệt là khi bị ỉa chảy và sốt cao\r\n', 1, ''),
(11, 'Chào bác sỹ, cháu nhà tôi có hiện tượng Mắt mỡ dưới da thì chế độ dinh dưỡng như thế nào để khắc phục ạ ?', 0, '13:48'),
(12, 'Từ hiện tượng, có thể cháu đang gặp vấn đề suy dinh dưỡng thể còm, giải pháp cho vấn đề này là<br>-  Phục hồi mất nước:\nCháo muối: 1 nắm gạo (50g) + 1 nhúm muối (3.5g) + 6 bát ăn nước cơm, đun nhừ,\nlọc lấy nước uống\nNước gạo rang: 50g gạo rang vàng và nấu như cháo muối\n<br>- Tăng chất béo trong khẩu phần ăn: bổ sung vào thực đơn ăn uống hàng ngày lượng dầu, mỡ nhất định. Lượng năng lượng từ dầu mỡ cung cấp cho cơ thể gấp đôi so với tinh bột và protein.<br>- Cho trẻ ăn bổ sung hợp lý:\r\nCho trẻ ăn từ ít đến nhiều, tập làm quen với thức ăn mới\r\nSố lượng thức ăn tăng theo độ tuổi\r\nĐảm bảo thức ăn mềm, dễ nhai, dễ nuốt\r\nThức ăn bổ cùng cần cân đối dinh dưỡng, có đủ các nhóm thức ăn\r\nTăng đậm độ năng lượng của thức ăn: thêm dầu, mỡ, vừng, lạc\r\nĐảm bảo vệ sinh thực phẩm\r\nCho trẻ ăn nhiều hơn trong và sau khi bị ốm, cho trẻ ăn uống nhiều chất lỏng hơn,\r\nđặc biệt là khi bị ỉa chảy và sốt cao\r\n', 1, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhu_cau_chat_khoang`
--

CREATE TABLE `nhu_cau_chat_khoang` (
  `id` bigint(20) NOT NULL,
  `canxi` double NOT NULL,
  `dong` double NOT NULL,
  `iot` double NOT NULL,
  `kem` double NOT NULL,
  `maggie` double NOT NULL,
  `phospho` double NOT NULL,
  `sat` double NOT NULL,
  `seleni` double NOT NULL,
  `tuoi_toi_da` double NOT NULL,
  `tuoi_toi_thieu` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nhu_cau_chat_khoang`
--

INSERT INTO `nhu_cau_chat_khoang` (`id`, `canxi`, `dong`, `iot`, `kem`, `maggie`, `phospho`, `sat`, `seleni`, `tuoi_toi_da`, `tuoi_toi_thieu`) VALUES
(1, 500, 340, 90, 3, 80, 460, 7, 20, 3, 2),
(2, 800, 370, 100, 4, 90, 500, 8, 30, 4, 3),
(3, 1000, 400, 110, 5, 130, 520, 10, 30, 5, 4),
(4, 1100, 420, 120, 7, 150, 550, 10, 30, 6, 5),
(5, 1200, 420, 120, 8, 170, 550, 11, 40, 7, 6),
(6, 1300, 450, 130, 9, 190, 570, 11, 40, 8, 7),
(7, 1300, 450, 130, 10, 210, 570, 12, 50, 9, 8),
(8, 1400, 470, 140, 11, 240, 600, 12, 50, 10, 9);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhu_cau_glucid`
--

CREATE TABLE `nhu_cau_glucid` (
  `id` bigint(20) NOT NULL,
  `khoi_luong` double NOT NULL,
  `tuoi_toi_thieu` double NOT NULL,
  `tuoi_toi_da` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nhu_cau_glucid`
--

INSERT INTO `nhu_cau_glucid` (`id`, `khoi_luong`, `tuoi_toi_thieu`, `tuoi_toi_da`) VALUES
(1, 25, 2, 4),
(2, 30, 4, 6),
(3, 35, 6, 8),
(4, 40, 8, 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhu_cau_lipid`
--

CREATE TABLE `nhu_cau_lipid` (
  `id` bigint(20) NOT NULL,
  `khoi_luong` double NOT NULL,
  `tuoi_toi_da` double NOT NULL,
  `tuoi_toi_thieu` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nhu_cau_lipid`
--

INSERT INTO `nhu_cau_lipid` (`id`, `khoi_luong`, `tuoi_toi_da`, `tuoi_toi_thieu`) VALUES
(1, 35, 4, 2),
(2, 40, 6, 4),
(3, 27.5, 8, 6),
(4, 30, 10, 8);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhu_cau_nang_luong`
--

CREATE TABLE `nhu_cau_nang_luong` (
  `id` bigint(20) NOT NULL,
  `tuoi_toi_da` double NOT NULL,
  `tuoi_toi_thieu` double NOT NULL,
  `nang_luong` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nhu_cau_nang_luong`
--

INSERT INTO `nhu_cau_nang_luong` (`id`, `tuoi_toi_da`, `tuoi_toi_thieu`, `nang_luong`) VALUES
(1, 4, 2, 1000),
(2, 6, 4, 1200),
(3, 8, 6, 1800),
(4, 10, 8, 2200);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhu_cau_nuoc`
--

CREATE TABLE `nhu_cau_nuoc` (
  `id` bigint(20) NOT NULL,
  `tuoi` double NOT NULL,
  `can_nang` double NOT NULL,
  `dung_luong_toi_thieu` double NOT NULL,
  `dung_luong_toi_da` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nhu_cau_nuoc`
--

INSERT INTO `nhu_cau_nuoc` (`id`, `tuoi`, `can_nang`, `dung_luong_toi_thieu`, `dung_luong_toi_da`) VALUES
(1, 2, 12, 100, 100),
(2, 3, 14, 125, 150),
(3, 4, 16, 140, 160),
(4, 5, 18, 130, 155),
(5, 6, 20, 125, 145),
(6, 7, 23, 120, 135),
(7, 8, 26, 115, 125),
(8, 9, 28, 100, 110),
(9, 10, 32, 90, 100);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhu_cau_protein`
--

CREATE TABLE `nhu_cau_protein` (
  `id` bigint(20) NOT NULL,
  `khoi_luong` double NOT NULL,
  `tuoi_toi_da` double NOT NULL,
  `tuoi_toi_thieu` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nhu_cau_protein`
--

INSERT INTO `nhu_cau_protein` (`id`, `khoi_luong`, `tuoi_toi_da`, `tuoi_toi_thieu`) VALUES
(1, 2, 4, 2),
(2, 1.68, 6, 4),
(3, 1.65, 8, 6),
(4, 1.23, 10, 8);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhu_cau_vitamin`
--

CREATE TABLE `nhu_cau_vitamin` (
  `id` bigint(20) NOT NULL,
  `tuoi_toi_da` double NOT NULL,
  `tuoi_toi_thieu` double NOT NULL,
  `vitamin_a` double DEFAULT NULL,
  `vitamin_b1` double DEFAULT NULL,
  `vitamin_b12` double DEFAULT NULL,
  `vitamin_b2` double DEFAULT NULL,
  `vitamin_b3` double DEFAULT NULL,
  `vitamin_b6` double DEFAULT NULL,
  `vitamin_b9` double DEFAULT NULL,
  `vitamin_c` double DEFAULT NULL,
  `vitamin_d` double DEFAULT NULL,
  `vitamin_e` double DEFAULT NULL,
  `vitamin_k` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nhu_cau_vitamin`
--

INSERT INTO `nhu_cau_vitamin` (`id`, `tuoi_toi_da`, `tuoi_toi_thieu`, `vitamin_a`, `vitamin_b1`, `vitamin_b12`, `vitamin_b2`, `vitamin_b3`, `vitamin_b6`, `vitamin_b9`, `vitamin_c`, `vitamin_d`, `vitamin_e`, `vitamin_k`) VALUES
(1, 4, 2, 375, 0.3, 0.3, 0.4, 5, 0.3, 25, 30, 5, 3, 5),
(2, 6, 4, 375, 0.4, 0.5, 0.5, 6, 0.6, 35, 35, 5, 4, 10),
(3, 8, 6, 400, 0.7, 0.7, 0.8, 9, 1, 50, 40, 5, 6, 15),
(4, 10, 8, 500, 0.9, 1, 1.1, 12, 1.1, 75, 45, 5, 7, 20);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thuc_pham_chuyen_doi`
--

CREATE TABLE `thuc_pham_chuyen_doi` (
  `id` bigint(20) NOT NULL,
  `chat_beo_bao_hoa` varchar(255) DEFAULT NULL,
  `kcal` double NOT NULL,
  `nhom` varchar(255) DEFAULT NULL,
  `protein` varchar(255) DEFAULT NULL,
  `ten` varchar(255) DEFAULT NULL,
  `tinh_bot` varchar(255) DEFAULT NULL,
  `xo` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `thuc_pham_chuyen_doi`
--

INSERT INTO `thuc_pham_chuyen_doi` (`id`, `chat_beo_bao_hoa`, `kcal`, `nhom`, `protein`, `ten`, `tinh_bot`, `xo`) VALUES
(1, '0.15-1.35', 150, 'Nhiều tinh bột', '1.35-5.4', 'Cơm', '28.2-105.75', 0),
(2, '3-27', 250, 'Nhiều tinh bột', '9-36', 'Bánh mì đen', '48-180', 7),
(3, '4-36', 266, 'Nhiều tinh bột', '1-4', 'Bánh mì', '48-180', 4),
(4, '1-9', 96, 'Nhiều tinh bột', '1-4', 'Ngô ngọt', '19-71.25', 3),
(5, '0', 89, 'Nhiều tinh bột', '1-4', 'Chuối', '23-86.25', 3),
(6, '21.5-193.5', 260, 'Nhiều chất béo', '16.5-66', 'Thịt ba chỉ', '0', 0),
(7, '3-27', 187, 'Nhiều chất béo', '18-72', 'Thịt gà', '0', 0),
(8, '6-54', 201, 'Nhiều chất béo', '34-136', 'Bắp bò', '0', 0),
(9, '11-99', 259, 'Nhiều chất béo', '5.6-22.4', 'Phô mai', '0', 0),
(10, '116-104.4', 166, 'Nhiều protein', '14.8-59.2', 'Trứng', '0', 0),
(11, '0', 23, 'Nhiều protein', '1-4', 'Cà chua xanh', '5-18.75', 1),
(12, '0', 41, 'Nhiều protein', '1-4', 'Cà rốt', '10-37.5', 3),
(13, '0', 114, 'Nhiều protein', '24-96', 'Cá thu', '0.5-1.875', 0),
(14, '0', 30, 'Nhiều protein', '3-12', 'Rau muống', '3.5-13.125', 1),
(15, '0', 25, 'Nhiều protein', '2.8-11.2', 'Rau đay', '5-18.75', 1.5),
(16, '0', 26, 'Nhiều protein', '3.5-14', 'Rau ngót', '6-22.5', 2.5),
(17, '0', 16, 'Nhiều protein', '1-4', 'Rau cần tây', '4-15', 2),
(18, '0', 30, 'Nhiều protein', '2-8', 'Súp lơ', '5-18.75', 3),
(19, '0', 20, 'Nhiều protein', '1-4', 'Bầu', '4-15', 0),
(20, '0', 38, 'Nhiều protein', '1-4', 'Bưởi', '10-37.5', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ti_le_dinh_duong`
--

CREATE TABLE `ti_le_dinh_duong` (
  `id` bigint(20) NOT NULL,
  `canxi` double DEFAULT NULL,
  `chat_beo` double NOT NULL,
  `protein` double NOT NULL,
  `tinh_bot` double NOT NULL,
  `tong_kcal` double DEFAULT NULL,
  `tuoi_toi_da` double NOT NULL,
  `tuoi_toi_thieu` double NOT NULL,
  `vitamin_a` double DEFAULT NULL,
  `vitamin_b1` double DEFAULT NULL,
  `vitamin_b12` double DEFAULT NULL,
  `vitamin_b2` double DEFAULT NULL,
  `vitamin_c` double DEFAULT NULL,
  `vitamin_d` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `ti_le_dinh_duong`
--

INSERT INTO `ti_le_dinh_duong` (`id`, `canxi`, `chat_beo`, `protein`, `tinh_bot`, `tong_kcal`, `tuoi_toi_da`, `tuoi_toi_thieu`, `vitamin_a`, `vitamin_b1`, `vitamin_b12`, `vitamin_b2`, `vitamin_c`, `vitamin_d`) VALUES
(1, 300, 40, 12, 48, 1000, 4, 2, 300, 1.5, 2, 1.5, 30, 300),
(2, 500, 38, 12, 50, 1200, 6, 4, 550, 1.5, 2, 1.5, 30, 500),
(3, 500, 35, 12, 53, 1800, 8, 6, 550, 1.5, 2, 1.5, 65, 500),
(4, 500, 25, 12, 63, 2200, 10, 8, 550, 1.5, 2, 1.5, 65, 500);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vai_tro`
--

CREATE TABLE `vai_tro` (
  `id` bigint(20) NOT NULL,
  `vai_tro` varchar(255) DEFAULT NULL,
  `dinh_duong_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `vai_tro`
--

INSERT INTO `vai_tro` (`id`, `vai_tro`, `dinh_duong_id`) VALUES
(1, 'Vật liệu xây dựng cơ thể', 1),
(2, 'Thành phần chủ yếu của các enzym, nội tiết, kháng thể', 1),
(3, 'Tham gia vận chuyển 1 số chất: canxi, sắt, mỡ', 1),
(4, 'Nguồn cung năng lượng duy trì sự sống', 1),
(5, 'Nguồn cung năng lượng chủ yếu duy trì sự sống', 2),
(6, 'Nguồn cung cấp các acid béo', 2),
(7, 'Tham gia vào quá trình xây dựng cơ thể: màng tế bào, mô mỡ dưới da...', 2),
(8, 'Tăng khả năng hấp thụ vitamin tan trong dầu: A, D, E, K… và tích trữ chúng', 2),
(9, 'Cung cấp năng lượng duy trì sự sống', 3),
(10, 'Tham gia vào quá trình tạo cơ thể: dịch ngoại bào, mô, sụn, da...', 3),
(11, 'Khử độc gan', 3),
(12, 'Cung cấp khoáng chất', 4),
(13, 'Vận chuyển chất dinh dưỡng, oxy cho các tế bào', 4),
(14, 'Duy trì sự sống', 4),
(15, 'Tham gia vào quá trình chuyển hóa: vitamin b1 chuyển hóa glucid, vitamin d sử dụng và chuyển hóa canxi, phospho', 5),
(16, 'Giúp phát triển cơ thể: vitamin a, vitamin b1, vitamin b2', 5),
(17, 'Tạo hồng cầu: vitamin b2, vitamin b12, acid folic', 5),
(18, 'Tăng sức đề kháng của cơ thể: vitamin a, vitamin c', 5),
(19, 'Giữ cho hệ thần kinh, hệ tiêu hóa hoạt động tốt: vitamin b1, vitamin b2, vitamin b12, vitamin c', 5),
(20, 'Chống lão hóa: vitamin e, vitamin c', 5),
(21, 'Thành phần quan trọng của tổ chức xương', 6),
(22, 'Duy trì áp lực thẩm thấu, tham gia trong các quá trình chuyển hóa của cơ thể', 6),
(23, 'Hình thành xương, răng vững chức: canxi', 6),
(24, 'Tham gia tạo hồng cầu: sắt', 6),
(25, 'Giúp hình thành hệ xương, răng, chuyển hóa năng lượng giúp phát triển tốt: phospho', 6),
(26, 'Phòng chống bướu cổ, thiểu năng trí tuệ: i-ốt', 6);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chieu_cao_can_nang`
--
ALTER TABLE `chieu_cao_can_nang`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `dinh_duong`
--
ALTER TABLE `dinh_duong`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `giai_phap`
--
ALTER TABLE `giai_phap`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `hien_tuong`
--
ALTER TABLE `hien_tuong`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id_message`);

--
-- Chỉ mục cho bảng `nhu_cau_chat_khoang`
--
ALTER TABLE `nhu_cau_chat_khoang`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `nhu_cau_glucid`
--
ALTER TABLE `nhu_cau_glucid`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `nhu_cau_lipid`
--
ALTER TABLE `nhu_cau_lipid`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `nhu_cau_nang_luong`
--
ALTER TABLE `nhu_cau_nang_luong`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `nhu_cau_nuoc`
--
ALTER TABLE `nhu_cau_nuoc`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `nhu_cau_protein`
--
ALTER TABLE `nhu_cau_protein`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `ti_le_dinh_duong`
--
ALTER TABLE `ti_le_dinh_duong`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `message`
--
ALTER TABLE `message`
  MODIFY `id_message` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `ti_le_dinh_duong`
--
ALTER TABLE `ti_le_dinh_duong`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

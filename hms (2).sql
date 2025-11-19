-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 18, 2025 lúc 03:04 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `hms`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `attendence`
--

CREATE TABLE `attendence` (
  `serial` int(11) NOT NULL,
  `userId` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `isAbsence` varchar(3) NOT NULL,
  `isLeave` varchar(3) NOT NULL,
  `remark` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `attendence`
--

INSERT INTO `attendence` (`serial`, `userId`, `date`, `isAbsence`, `isLeave`, `remark`) VALUES
(13, 'U008', '2015-02-27', 'No', 'No', 'Self'),
(14, 'U009', '2015-02-27', 'Yes', 'No', 'tte'),
(15, 'U009', '2015-04-17', 'No', 'No', 'Self'),
(16, 'U009', '2015-04-18', 'No', 'No', 'Self'),
(17, 'U008', '2025-10-17', 'No', 'No', 'Self'),
(18, 'U0012', '2025-10-17', 'No', 'No', 'Self'),
(20, 'U0016', '2025-10-20', 'No', 'No', 'Self'),
(21, 'U008', '2025-11-15', 'No', 'No', 'Điểm danh tự động'),
(22, 'U008', '2025-11-16', 'Yes', 'Yes', 'ngủ'),
(40, 'U0012', '2025-11-15', 'No', 'No', 'Điểm danh tự động'),
(42, 'U0012', '2025-11-17', 'Yes', 'Yes', 'đi chơi');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auto_id`
--

CREATE TABLE `auto_id` (
  `serial` int(11) NOT NULL,
  `prefix` varchar(10) NOT NULL,
  `number` int(11) NOT NULL,
  `description` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `auto_id`
--

INSERT INTO `auto_id` (`serial`, `prefix`, `number`, `description`) VALUES
(1, 'UG', 1, 'User Group Id'),
(2, 'U', 19, 'User Id'),
(3, 'EMP', 6, 'Employee Id'),
(4, 'BL', 7, 'Block Id'),
(5, 'RM', 7, 'Room Number'),
(6, 'BIL', 10, 'Billing Id');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `billing`
--

CREATE TABLE `billing` (
  `billId` varchar(10) NOT NULL,
  `type` varchar(50) NOT NULL,
  `amount` decimal(18,2) NOT NULL,
  `billTo` varchar(80) NOT NULL,
  `billingDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `billing`
--

INSERT INTO `billing` (`billId`, `type`, `amount`, `billTo`, `billingDate`) VALUES
('BIL007', 'Wifi', 300.00, 'U008', '2015-02-27'),
('BIL007', 'Tv', 60.00, 'U008', '2015-02-27'),
('BIL008', 'Wifi', 300.00, 'U009', '2015-02-27'),
('BIL009', 'Meal Cost Aprill', 2000.00, 'U009', '2015-04-17'),
('BIL009', 'Rent', 3000.00, 'U009', '2015-04-17'),
('BIL009', 'Wifi Net ', 500.00, 'U009', '2015-04-17'),
('BIL009', 'tv disc bill', 200.00, 'U009', '2015-04-17'),
('BIL009', 'Paper', 50.00, 'U009', '2015-04-17'),
('BIL009', 'Boishak Clelabration', 250.00, 'U009', '2015-04-17');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `blocks`
--

CREATE TABLE `blocks` (
  `blockId` varchar(10) NOT NULL,
  `blockNo` varchar(10) NOT NULL,
  `blockName` varchar(30) NOT NULL,
  `description` varchar(80) NOT NULL,
  `isActive` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `blocks`
--

INSERT INTO `blocks` (`blockId`, `blockNo`, `blockName`, `description`, `isActive`) VALUES
('BL004', 'BL-01', 'First Block', 'North Part Of the colony', 'Y'),
('BL006', '9', 'hihihaha', 'go', 'Y');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cost`
--

CREATE TABLE `cost` (
  `serial` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `amount` decimal(18,2) NOT NULL,
  `date` date NOT NULL,
  `description` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `cost`
--

INSERT INTO `cost` (`serial`, `type`, `amount`, `date`, `description`) VALUES
(4, 'Bazar', 2000.00, '2015-02-27', '2days Meal bazar'),
(5, 'Net bill', 5000.00, '2015-04-18', 'BTCL Internet Connection Bill');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `deposit`
--

CREATE TABLE `deposit` (
  `serial` int(11) NOT NULL,
  `userId` varchar(10) NOT NULL,
  `amount` decimal(18,2) NOT NULL,
  `depositDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `deposit`
--

INSERT INTO `deposit` (`serial`, `userId`, `amount`, `depositDate`) VALUES
(6, 'U008', 6000.00, '2015-02-27'),
(7, 'U009', 5500.00, '2015-02-27'),
(8, 'U009', 2000.00, '2015-04-17');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `employee`
--

CREATE TABLE `employee` (
  `serial` int(11) NOT NULL,
  `empId` varchar(10) NOT NULL,
  `userGroupId` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `empType` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `dob` date NOT NULL,
  `cellNo` varchar(15) NOT NULL,
  `address` varchar(150) NOT NULL,
  `doj` date NOT NULL,
  `designation` varchar(50) NOT NULL,
  `salary` decimal(18,2) NOT NULL,
  `blockNo` varchar(10) NOT NULL,
  `isActive` varchar(1) NOT NULL,
  `perPhoto` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `employee`
--

INSERT INTO `employee` (`serial`, `empId`, `userGroupId`, `name`, `empType`, `gender`, `dob`, `cellNo`, `address`, `doj`, `designation`, `salary`, `blockNo`, `isActive`, `perPhoto`) VALUES
(1, 'EMP003', 'UG003', 'Mr. Sabbir Alam', 'Care Taker', 'Male', '1995-06-20', '01710123456', ' Dhanmoni,Dahaka-1207', '2015-02-11', 'Asistant Care', 5000.00, 'BL-01', 'Y', 'EMP003.jpg'),
(2, 'EMP004', 'UG003', 'Mst jabeda ', 'Cook', 'Female', '1994-06-14', '01720123456', ' Shukrabad-1207', '2015-01-27', 'Cook', 5000.00, 'BL-01', 'Y', 'EMP004.jpeg'),
(3, 'EMP005', 'UG003', 'DTV', '1', 'Female', '2025-10-08', '112', ' 123', '2025-10-20', '1', 1.00, '123', 'Y', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `feesinfo`
--

CREATE TABLE `feesinfo` (
  `serial` int(11) NOT NULL,
  `type` varchar(80) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `amount` decimal(18,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `feesinfo`
--

INSERT INTO `feesinfo` (`serial`, `type`, `description`, `amount`) VALUES
(9, 'Wifi', 'internet charge', 300.00),
(10, 'TV', 'Television', 60.00),
(11, 'paper', 'Paper Monthly', 30.00);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `meal`
--

CREATE TABLE `meal` (
  `serial` int(11) NOT NULL,
  `userId` varchar(10) NOT NULL,
  `noOfMeal` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `meal`
--

INSERT INTO `meal` (`serial`, `userId`, `noOfMeal`, `date`) VALUES
(9, 'U009', 3, '2015-02-27'),
(10, 'U008', 2, '2015-02-27'),
(11, 'U009', 2, '2015-04-17');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mealrate`
--

CREATE TABLE `mealrate` (
  `rate` decimal(18,2) NOT NULL,
  `note` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `mealrate`
--

INSERT INTO `mealrate` (`rate`, `note`) VALUES
(80.00, 'Feb,2015');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notice`
--

CREATE TABLE `notice` (
  `serial` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL,
  `createdDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `notice`
--

INSERT INTO `notice` (`serial`, `title`, `description`, `createdDate`) VALUES
(6, '21st February Celebration', '21st February Celebration,rali,etc', '2015-02-27 15:34:40'),
(7, 'Happy New Year 2015', 'Happy New Year', '2015-02-27 15:35:25'),
(8, '11/11/2006', 'happy birthday to me', '2025-10-17 05:10:05');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payment`
--

CREATE TABLE `payment` (
  `serial` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `paymentTo` varchar(100) NOT NULL,
  `amount` decimal(18,2) NOT NULL,
  `paymentBy` varchar(50) NOT NULL,
  `paymentDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `payment`
--

INSERT INTO `payment` (`serial`, `description`, `paymentTo`, `amount`, `paymentBy`, `paymentDate`) VALUES
(2, 'Hostel Equipment(TV)', 'Md Jolil', 4000.00, 'Cash', '2015-02-27'),
(3, 'Paper Bill', 'Mr Silblu', 500.00, 'Cash', '2015-02-27');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rooms`
--

CREATE TABLE `rooms` (
  `roomId` varchar(10) NOT NULL,
  `roomNo` varchar(20) NOT NULL,
  `blockId` varchar(10) NOT NULL,
  `noOfSeat` int(11) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `isActive` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `rooms`
--

INSERT INTO `rooms` (`roomId`, `roomNo`, `blockId`, `noOfSeat`, `description`, `isActive`) VALUES
('RM004', 'R-01', 'BL-01', 4, 'Block-01(North)', 'Y'),
('RM006', 'R-02', 'BL-01', 2, 'Block-01(North)', 'Y');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `salary`
--

CREATE TABLE `salary` (
  `serial` int(11) NOT NULL,
  `empId` varchar(10) NOT NULL,
  `monthYear` varchar(30) NOT NULL,
  `amount` decimal(18,2) NOT NULL,
  `addedDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `salary`
--

INSERT INTO `salary` (`serial`, `empId`, `monthYear`, `amount`, `addedDate`) VALUES
(4, 'EMP003', 'January-2015', 5000.00, '2015-02-27'),
(5, 'EMP004', 'February-2015', 5000.00, '2015-02-27');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `seataloc`
--

CREATE TABLE `seataloc` (
  `userId` varchar(10) NOT NULL,
  `roomNo` varchar(10) NOT NULL,
  `blockNo` varchar(30) NOT NULL,
  `monthlyRent` decimal(18,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `seataloc`
--

INSERT INTO `seataloc` (`userId`, `roomNo`, `blockNo`, `monthlyRent`) VALUES
('U009', 'R-02', 'BL-01', 7500.00);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `stdpayment`
--

CREATE TABLE `stdpayment` (
  `serial` int(11) NOT NULL,
  `userId` varchar(10) NOT NULL,
  `paymentBy` varchar(50) NOT NULL,
  `transNo` varchar(50) NOT NULL,
  `amount` decimal(18,2) NOT NULL,
  `transDate` date NOT NULL,
  `remark` varchar(50) NOT NULL,
  `isApprove` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `stdpayment`
--

INSERT INTO `stdpayment` (`serial`, `userId`, `paymentBy`, `transNo`, `amount`, `transDate`, `remark`, `isApprove`) VALUES
(3, 'U008', 'DBBL', '+8801755305154', 6000.00, '2015-02-26', 'Feb,2015 Bill', 'Yes'),
(4, 'U009', 'Bank', 'DD-4556', 5500.00, '2015-02-27', 'test', 'Yes'),
(5, 'U009', 'Bkash', '0185236974', 6000.00, '2015-04-17', 'all cost rent meal,net,tv', 'Yes'),
(6, 'U0012', 'Bank', '0856761038', 9999999999999999.99, '2025-10-03', 'hi', 'No'),
(7, 'U0012', 'Bank', '0856761038', 100000000000.00, '2025-10-11', 'hi', 'No');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `studentinfo`
--

CREATE TABLE `studentinfo` (
  `serial` int(11) NOT NULL,
  `userId` varchar(10) NOT NULL,
  `userGroupId` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `studentId` varchar(15) NOT NULL,
  `cellNo` varchar(15) NOT NULL,
  `email` varchar(80) NOT NULL,
  `nameOfInst` varchar(100) NOT NULL,
  `program` varchar(80) NOT NULL,
  `batchNo` varchar(10) NOT NULL,
  `gender` varchar(8) NOT NULL,
  `dob` date NOT NULL,
  `bloodGroup` varchar(5) NOT NULL,
  `nationality` varchar(30) NOT NULL,
  `nationalId` varchar(20) DEFAULT NULL,
  `passportNo` varchar(20) DEFAULT NULL,
  `fatherName` varchar(50) NOT NULL,
  `motherName` varchar(50) NOT NULL,
  `fatherCellNo` varchar(15) NOT NULL,
  `motherCellNo` varchar(15) NOT NULL,
  `localGuardian` varchar(50) NOT NULL,
  `localGuardianCell` varchar(15) NOT NULL,
  `presentAddress` varchar(150) NOT NULL,
  `parmanentAddress` varchar(150) NOT NULL,
  `perPhoto` varchar(20) NOT NULL,
  `admitDate` date NOT NULL,
  `isActive` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `studentinfo`
--

INSERT INTO `studentinfo` (`serial`, `userId`, `userGroupId`, `name`, `studentId`, `cellNo`, `email`, `nameOfInst`, `program`, `batchNo`, `gender`, `dob`, `bloodGroup`, `nationality`, `nationalId`, `passportNo`, `fatherName`, `motherName`, `fatherCellNo`, `motherCellNo`, `localGuardian`, `localGuardianCell`, `presentAddress`, `parmanentAddress`, `perPhoto`, `admitDate`, `isActive`) VALUES
(11, 'U0016', 'UG004', 'bot trade', '22222222', '11111111', '2431540219@vaa.edu.vn', 'webtintuc', 'CSE', '34', 'Female', '2025-10-02', 'A(un)', 'Bangladeshi', 'N/A', 'N/A', 'dsds', '+8801710565958', 'Mst Mother', '1111111', 'Mr Local boy', '12313', ' 12313', '123', 'U0016.jpg', '2025-10-20', 'Y'),
(12, 'U0018', 'UG004', 'f', '1', '11', 'f@gmail.com', 'da', '1', 'd', 'Male', '2025-11-17', 'A(+)', 'da', '113', 'as', 'dad', 'as', '122', 'dad', '121', 'as', ' dasd', 'ds', 'U0018.png', '2025-11-17', 'Y'),
(8, 'U008', 'UG004', 'Md. Rasel', '151-15-1155', '+8801755000002', 'rasel@gmail.com', 'DIU', 'CSE', '34', 'Male', '1994-06-14', 'AB(+)', 'Bangladeshi', 'N/A', 'N/A', 'Mr. Father', '+8801722000000', 'Mst. Mother', '+8801722000005', 'Mr. Local Boy', '+8801722000001', ' Dhanmondi,Dhaka-1207 ', 'Dhanmondi,Dhaka-1207', 'U008.jpg', '2015-02-27', 'N'),
(9, 'U009', 'UG004', 'Md Zahidul', '151-15-1122', '+881722545660', 'zahidul@gmail.com', 'DIU', 'CSE', '34', 'Male', '2005-07-13', 'O(+)', 'Bangladeshi', 'N/A', 'N/A', 'Mr. Father', '+8801710565958', 'Mst Mother', '+8801710565958', 'Mr Local boy', '+8801710565960', ' Dhanmondi,Dhaka-1207 ', ' Dhanmondi,Dhaka-1207', 'U009.jpg', '2015-02-27', 'N');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `timeset`
--

CREATE TABLE `timeset` (
  `inTime` varchar(15) NOT NULL,
  `outTime` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `timeset`
--

INSERT INTO `timeset` (`inTime`, `outTime`) VALUES
('07:00 PM', '06:00 AM');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `usergroup`
--

CREATE TABLE `usergroup` (
  `serial` int(11) NOT NULL,
  `id` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `usergroup`
--

INSERT INTO `usergroup` (`serial`, `id`, `name`, `description`) VALUES
(1, 'UG001', 'Admin', 'Admin group - Toàn quyền hệ thống'),
(2, 'UG004', 'Student', 'Student group - Sinh viên'),
(4, 'UG002', 'Supervisor', 'Supervisor group - Giám sát và quản lý'),
(5, 'UG003', 'Employee', 'Employee group - Nhân viên');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `serial` int(11) NOT NULL,
  `userId` varchar(10) NOT NULL,
  `userGroupId` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `loginId` varchar(150) NOT NULL,
  `password` varchar(50) NOT NULL,
  `verifyCode` varchar(10) NOT NULL,
  `expireDate` date NOT NULL,
  `isVerifed` varchar(1) NOT NULL,
  `isActive` varchar(1) DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`serial`, `userId`, `userGroupId`, `name`, `loginId`, `password`, `verifyCode`, `expireDate`, `isVerifed`, `isActive`) VALUES
(1, 'U001', 'UG001', 'System Admin', 'admin', '123', 'av799', '2015-08-01', 'Y', 'Y'),
(10, 'U008', 'UG004', 'Md. Rasel', 'student', '123', 'vhms2115', '2115-01-04', 'N', 'Y'),
(14, 'EMP003', 'UG003', 'Mr. Sabbir Alam', 'employee', '513b098ff55b4f375d6210a5f45996dd', 'vhms2115', '2115-01-04', 'Y', 'Y'),
(20, 'U0016', 'UG004', 'bot trade', '22222222', '513b098ff55b4f375d6210a5f45996dd', 'vhms2115', '2115-01-04', 'Y', 'Y'),
(21, 'EMP005', 'UG003', 'DTV', '112', '513b098ff55b4f375d6210a5f45996dd', 'vhms2115', '2115-01-04', 'Y', 'Y'),
(22, 'ADMIN001', 'UG001', 'Administrator', 'admin', '513b098ff55b4f375d6210a5f45996dd', 'vhms2115', '2115-01-04', 'Y', 'Y'),
(23, 'SUPER001', 'UG002', 'Supervisor User', 'supervisor', '123', 'vhms2115', '2115-01-04', 'Y', 'Y'),
(24, 'EMP001', 'UG003', 'Employee User', 'employee', '513b098ff55b4f375d6210a5f45996dd', 'vhms2115', '2115-01-04', 'Y', 'Y'),
(25, 'STD001', 'UG004', 'Student User', 'student', '513b098ff55b4f375d6210a5f45996dd', 'vhms2115', '2115-01-04', 'Y', 'Y'),
(26, 'U0017', 'UG001', 'vongu', 'vanvo', '808e00d23a8c48e3ea60b426a9f4e6d2', 'vhms2115', '2115-01-04', 'Y', 'Y'),
(27, 'U0018', 'UG004', 'f', '1', '1efcf825d090a4cffb33c3c5238610bb', 'vhms2115', '2115-01-04', 'Y', 'Y');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `attendence`
--
ALTER TABLE `attendence`
  ADD PRIMARY KEY (`serial`),
  ADD UNIQUE KEY `serial` (`serial`),
  ADD UNIQUE KEY `unique_user_date` (`userId`,`date`);

--
-- Chỉ mục cho bảng `auto_id`
--
ALTER TABLE `auto_id`
  ADD UNIQUE KEY `serial` (`serial`);

--
-- Chỉ mục cho bảng `blocks`
--
ALTER TABLE `blocks`
  ADD PRIMARY KEY (`blockId`),
  ADD UNIQUE KEY `blockId` (`blockId`);

--
-- Chỉ mục cho bảng `cost`
--
ALTER TABLE `cost`
  ADD PRIMARY KEY (`serial`);

--
-- Chỉ mục cho bảng `deposit`
--
ALTER TABLE `deposit`
  ADD PRIMARY KEY (`serial`);

--
-- Chỉ mục cho bảng `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`empId`),
  ADD UNIQUE KEY `serial` (`serial`),
  ADD UNIQUE KEY `cellNo` (`cellNo`);

--
-- Chỉ mục cho bảng `feesinfo`
--
ALTER TABLE `feesinfo`
  ADD PRIMARY KEY (`serial`);

--
-- Chỉ mục cho bảng `meal`
--
ALTER TABLE `meal`
  ADD PRIMARY KEY (`serial`);

--
-- Chỉ mục cho bảng `notice`
--
ALTER TABLE `notice`
  ADD PRIMARY KEY (`serial`),
  ADD UNIQUE KEY `serial` (`serial`);

--
-- Chỉ mục cho bảng `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`serial`);

--
-- Chỉ mục cho bảng `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`roomId`);

--
-- Chỉ mục cho bảng `salary`
--
ALTER TABLE `salary`
  ADD PRIMARY KEY (`serial`);

--
-- Chỉ mục cho bảng `seataloc`
--
ALTER TABLE `seataloc`
  ADD PRIMARY KEY (`userId`);

--
-- Chỉ mục cho bảng `stdpayment`
--
ALTER TABLE `stdpayment`
  ADD PRIMARY KEY (`serial`);

--
-- Chỉ mục cho bảng `studentinfo`
--
ALTER TABLE `studentinfo`
  ADD PRIMARY KEY (`userId`,`serial`),
  ADD UNIQUE KEY `serial` (`serial`),
  ADD UNIQUE KEY `userId` (`userId`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `cellNo` (`cellNo`);

--
-- Chỉ mục cho bảng `usergroup`
--
ALTER TABLE `usergroup`
  ADD UNIQUE KEY `serial` (`serial`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`serial`),
  ADD UNIQUE KEY `serial` (`serial`),
  ADD UNIQUE KEY `serial_2` (`serial`),
  ADD UNIQUE KEY `serial_3` (`serial`),
  ADD KEY `idx_loginId` (`loginId`),
  ADD KEY `idx_userGroupId` (`userGroupId`),
  ADD KEY `idx_isActive` (`isActive`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `attendence`
--
ALTER TABLE `attendence`
  MODIFY `serial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT cho bảng `auto_id`
--
ALTER TABLE `auto_id`
  MODIFY `serial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `cost`
--
ALTER TABLE `cost`
  MODIFY `serial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `deposit`
--
ALTER TABLE `deposit`
  MODIFY `serial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `employee`
--
ALTER TABLE `employee`
  MODIFY `serial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `feesinfo`
--
ALTER TABLE `feesinfo`
  MODIFY `serial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `meal`
--
ALTER TABLE `meal`
  MODIFY `serial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `notice`
--
ALTER TABLE `notice`
  MODIFY `serial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `payment`
--
ALTER TABLE `payment`
  MODIFY `serial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `salary`
--
ALTER TABLE `salary`
  MODIFY `serial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `stdpayment`
--
ALTER TABLE `stdpayment`
  MODIFY `serial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `studentinfo`
--
ALTER TABLE `studentinfo`
  MODIFY `serial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `usergroup`
--
ALTER TABLE `usergroup`
  MODIFY `serial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `serial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

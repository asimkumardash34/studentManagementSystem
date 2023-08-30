-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 28, 2021 at 01:38 PM
-- Server version: 5.7.28-0ubuntu0.19.04.2
-- PHP Version: 7.2.24-0ubuntu0.19.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `student_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `attendance_id` int(11) NOT NULL,
  `attendance_student_id` varchar(255) NOT NULL,
  `attendance_date` varchar(255) NOT NULL,
  `attendance_in_time` varchar(255) NOT NULL,
  `attendance_out_time` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`attendance_id`, `attendance_student_id`, `attendance_date`, `attendance_in_time`, `attendance_out_time`) VALUES
(2, '1001', '12 June,2015', '10:00 AM', '05:00 PM'),
(3, '1001', '13 June,2015', '10:00 AM', '05:00 PM'),
(4, '1001', '10 June,2015', '10:00 AM', '05:00 PM'),
(5, '1018', '12 June,2015', '10:00 AM', '05:00 PM'),
(6, '1003', '27 June,2015', '10:00 AM', '05:00 PM');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `city_id` int(10) UNSIGNED NOT NULL,
  `city_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`city_id`, `city_name`) VALUES
(1, 'Mumbai'),
(2, 'Delhi'),
(3, 'Chenai'),
(4, 'Banglore'),
(5, 'Varanasi'),
(6, 'Kolkatta');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `company_id` int(11) NOT NULL,
  `company_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`company_id`, `company_name`) VALUES
(1, 'Dell'),
(2, 'Microsoft'),
(3, 'HP'),
(4, 'Intex'),
(5, 'Lenovo'),
(6, 'iBall');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `country_id` int(11) NOT NULL,
  `country_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`country_id`, `country_name`) VALUES
(1, 'India'),
(2, 'USA');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `dept_id` int(11) NOT NULL,
  `dept_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dept_id`, `dept_name`) VALUES
(1, 'Government Job'),
(2, 'Private Job'),
(3, 'Self Employed'),
(4, 'Unemployed ');

-- --------------------------------------------------------

--
-- Table structure for table `fees`
--

CREATE TABLE `fees` (
  `fees_id` int(11) NOT NULL,
  `fees_student_id` varchar(255) NOT NULL,
  `fees_month` varchar(255) NOT NULL,
  `fees_amount` varchar(255) NOT NULL,
  `fees_date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fees`
--

INSERT INTO `fees` (`fees_id`, `fees_student_id`, `fees_month`, `fees_amount`, `fees_date`) VALUES
(1, '1001', '1', '1000', '1 June,2015'),
(2, '1004', '2', '1000', '12 June,2015'),
(3, '1002', '2', '1200', '13 June,2015'),
(4, '1002', '2', '1000', '12 June,2015');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL,
  `login_emp_id` int(11) NOT NULL,
  `login_user` varchar(255) NOT NULL,
  `login_password` varchar(255) NOT NULL,
  `login_level` int(11) NOT NULL DEFAULT '3',
  `login_email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`login_id`, `login_emp_id`, `login_user`, `login_password`, `login_level`, `login_email`) VALUES
(1, 0, 'admin', 'test', 1, 'kaushal.rahuljaiswal@gmail.com'),
(6, 1002, 'customer', 'test', 3, 'kaushal.rahuljaiswal@gmail.com'),
(7, 1003, 'kaushal123', 'test', 3, 'aggarwal.neha@gmail.com'),
(8, 1004, 'neha', 'test', 3, 'aggarwal.neha@gmail.com'),
(9, 1005, 'test', 'test', 3, 'aggarwal.neha@gmail.com'),
(10, 1006, '', '', 3, ''),
(11, 1007, 'kishore', 'test', 3, 'amit@gmail.com'),
(12, 1008, 'amit', 'test', 3, 'amit1@gmail.com'),
(13, 1009, 'sumit', 'test', 3, 'sumit@gmail.com'),
(14, 1010, 'amit1', 'test', 3, 'amit1@gmail.com'),
(15, 1011, 'amit1', 'test', 3, 'amit1@gmail.com'),
(16, 1012, 'amit1', 'test', 3, 'amit1@gmail.com'),
(17, 1013, 'amit1', 'test', 3, 'amit1@gmail.com'),
(18, 1014, 'amit123', 'test', 3, 'amit1@gmail.com'),
(19, 1015, 'sunita', 'test', 3, 'aggarwal.neha@gmail.com'),
(20, 1016, 'neha', 'test', 3, 'aggarwal.neha@gmail.com'),
(21, 1001, 'student', 'test', 3, 'kaushal.rahuljaiswal@gmail.com'),
(22, 0, 'abcdef', '123456', 3, 'kaushal.rahuljaiswal@gmail.com'),
(23, 0, 'kaushal1', '12345', 3, 'kaushal@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `month`
--

CREATE TABLE `month` (
  `month_id` int(11) NOT NULL,
  `month_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `month`
--

INSERT INTO `month` (`month_id`, `month_name`) VALUES
(1, 'January'),
(2, 'February'),
(3, 'March'),
(4, 'April'),
(5, 'May'),
(6, 'June'),
(7, 'July'),
(8, 'August'),
(9, 'September'),
(10, 'October'),
(11, 'November'),
(12, 'December');

-- --------------------------------------------------------

--
-- Table structure for table `salutions`
--

CREATE TABLE `salutions` (
  `sl_id` int(11) NOT NULL,
  `sl_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `salutions`
--

INSERT INTO `salutions` (`sl_id`, `sl_name`) VALUES
(1, 'Mr.'),
(2, 'Mrs.');

-- --------------------------------------------------------

--
-- Table structure for table `skill`
--

CREATE TABLE `skill` (
  `skill_id` int(11) NOT NULL,
  `skill_emp_id` int(11) NOT NULL,
  `skill_name` varchar(255) NOT NULL,
  `skill_grade` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `state_id` int(11) NOT NULL,
  `state_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`state_id`, `state_name`) VALUES
(1, 'Maharastra'),
(2, 'Gujrat'),
(3, 'Bihar'),
(4, 'Uttar Pradesh'),
(5, 'Delhi'),
(6, 'Haryana');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `status_id` int(11) NOT NULL,
  `status_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`status_id`, `status_name`) VALUES
(1, 'General'),
(2, 'OBC'),
(3, 'SC'),
(4, 'ST'),
(5, 'Handicapped');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_id` int(11) NOT NULL,
  `student_user` varchar(255) NOT NULL,
  `student_password` varchar(255) NOT NULL,
  `student_level` int(11) NOT NULL DEFAULT '3',
  `student_sal` varchar(100) NOT NULL,
  `student_first_name` varchar(100) NOT NULL,
  `student_middle_name` varchar(100) NOT NULL,
  `student_last_name` varchar(100) NOT NULL,
  `student_gender` varchar(100) NOT NULL,
  `student_address` varchar(100) NOT NULL,
  `student_village` varchar(100) NOT NULL,
  `student_state` varchar(100) NOT NULL,
  `student_country` varchar(100) NOT NULL,
  `student_landline` varchar(100) NOT NULL,
  `student_mobile` varchar(100) NOT NULL,
  `student_email` varchar(100) NOT NULL,
  `student_status` varchar(255) NOT NULL,
  `student_deparment` varchar(255) NOT NULL,
  `student_dob` varchar(255) NOT NULL,
  `student_nationalty` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `student_user`, `student_password`, `student_level`, `student_sal`, `student_first_name`, `student_middle_name`, `student_last_name`, `student_gender`, `student_address`, `student_village`, `student_state`, `student_country`, `student_landline`, `student_mobile`, `student_email`, `student_status`, `student_deparment`, `student_dob`, `student_nationalty`) VALUES
(1001, 'admin1234', 'test', 1, '1', 'Amit', 'Kishore', 'Aggarwal', 'Female', 'A : 42/6', 'Ghaziabad', '4', '1', 'Uttar Pradesh', '9876543212', 'kaushal@gmail.com', '2', '1', '12 January, 2014', 'Indian'),
(1002, 'kaushal', 'test', 1, '2', 'Kaushal', 'Kishore', 'Jaiswal', 'Male', 'A : 42/6', 'Ghaziabad', '1', '1', 'Uttar Pradesh', '09876543212', 'kaushal.rahuljaiswal@gmail.com', '2', '3', '12 January, 1988', 'Indian'),
(1003, 'kaushal123', 'test', 1, '1', 'Sumit', 'Kishore', 'Aggarwal', 'Female', 'A : 42/6', 'Ghaziabad', '1', '1', 'Uttar Pradesh', '09876543212', 'kishore@gmail.com', '2', '1', '12 January, 1988', 'Indian'),
(1004, 'neha', 'test', 1, '2', 'Deepak', 'Kishore', 'Aggarwal', 'Female', 'A : 42/6', 'Ghaziabad', '4', '1', 'Uttar Pradesh', '09876543212', 'amitkumar@gmail.com', '2', '2', '12 January, 1988', 'Indian'),
(1005, 'test', 'test', 1, '2', 'Neha', 'Kishore', 'Aggarwal', 'Male', 'A : 42/6', 'Ghaziabad', '4', '1', 'Uttar Pradesh', '09876543212', 'sumit@gmail.com', '1', '1', '12 January, 1988', 'Indian'),
(1007, 'kishore', 'test', 1, '1', 'Kaushal', 'Kishore', 'Jaiswal', 'Male', 'Allahabad', 'Allahabad', '1', '1', '9876543212', '9876543212', 'amitsingh@gmail.com', '1', '1', '5 May,2015', 'Indian'),
(1015, 'sunita', 'test', 1, '2', 'Sunita', 'Kumari', 'Aggarwal', 'Female', 'A : 42/6', 'Ghaziabad', '4', '1', 'Uttar Pradesh', '09876543212', 'aggarwal.neha@gmail.com', '1', '1', '4 May,1983', 'Indian'),
(1016, 'neha', 'test', 1, '2', 'Neha', 'Kishore', 'Aggarwal', 'Female', 'A : 42/6', 'Ghaziabad', '4', '1', 'Uttar Pradesh', '09876543212', 'aggarwal.neha@gmail.com', '1', '1', '6 May,2015', 'Indian'),
(1017, 'kaushal', 'test', 1, '1', 'Kaushal', 'Kishore', 'Kishore', 'Male', 'A : 42/6 Sector 62', 'Noida', '4', '1', '9876543212', '9183769868', 'kaushal.rahuljaiswal@gmail.com', '1', '1', '12 June,2015', 'Indian'),
(1018, 'abcdef', '123456', 1, '1', 'Kaushal', 'Kishore', 'Jaiswal', 'Male', 'A : 42/6 Sector 62', 'Noida', '2', '1', 'WV', '9183769868', 'kaushal.rahuljaiswal@gmail.com', '1', '1', '13 June,1980', 'Indian'),
(1019, 'kaushal1', '12345', 1, '1', 'Kaushal', 'Kishore', 'Kishore', 'Male', 'A : 42/6 Sector 62', 'Noida', '1', '1', 'WV', '9183769868', 'kaushal@gmail.com', '1', '1', '5 June,2015', 'Indian');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`attendance_id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`city_id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`dept_id`);

--
-- Indexes for table `fees`
--
ALTER TABLE `fees`
  ADD PRIMARY KEY (`fees_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`login_id`);

--
-- Indexes for table `month`
--
ALTER TABLE `month`
  ADD PRIMARY KEY (`month_id`);

--
-- Indexes for table `salutions`
--
ALTER TABLE `salutions`
  ADD PRIMARY KEY (`sl_id`);

--
-- Indexes for table `skill`
--
ALTER TABLE `skill`
  ADD PRIMARY KEY (`skill_id`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`state_id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `city_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `dept_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `fees`
--
ALTER TABLE `fees`
  MODIFY `fees_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `month`
--
ALTER TABLE `month`
  MODIFY `month_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `salutions`
--
ALTER TABLE `salutions`
  MODIFY `sl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `skill`
--
ALTER TABLE `skill`
  MODIFY `skill_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `state_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1020;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

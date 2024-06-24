-- Connect to the database
USE `obrsphp`;

-- Database: `obrsphp`

-- --------------------------------------------------------

-- Table structure for table `booked`

CREATE TABLE `booked` (
  `id` int(30) NOT NULL,
  `schedule_id` int(30) NOT NULL,
  `ref_no` text NOT NULL,
  `name` varchar(250) NOT NULL,
  `qty` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT '1=Paid, 0=Unpaid',
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booked`
--

INSERT INTO `booked` (`id`, `schedule_id`, `ref_no`, `name`, `qty`, `status`, `date_updated`) VALUES
(1, 1, '1', 'Roshan', 2, 1, '2024-04-2 21:43:13'),
(2, 4, '2', 'Ramesh', 2, 0, '2024-04-2 17:10:27'),
(3, 2, '3', 'Sarkar', 3, 1, '2024-04-1 23:21:55'),
(4, 4, '4', 'Zeus', 1, 1, '2024-04-1 20:02:23'),
(5, 7, '5', 'Ram', 3, 0, '2024-04-2 20:04:20'),
(6, 5, '6', 'Rohit', 3, 1, '2024-04-1 23:19:45'),
(7, 9, '7', 'Ramses', 1, 0, '2024-04-1 23:23:51');

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

CREATE TABLE `bus` (
  `id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `bus_number` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 = inactive, 1 = active',
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bus`
--

INSERT INTO `bus` (`id`, `name`, `bus_number`, `status`, `date_updated`) VALUES
(1, 'N1', 'ADG1122', 1, '2024-04-10 18:59:55'),
(2, 'N2', 'ADG2233', 1, '2024-04-10 19:00:21'),
(3, 'N3', 'ADG3344', 1, '2024-04-10 18:59:55'),
(4, 'N4', 'ADG4455', 1, '2024-04-10 19:00:21'),
(5, 'N5', 'ADG5566', 1, '2024-04-10 18:59:55'),
(6, 'N6', 'ADG6677', 1, '2024-04-10 19:00:21'),
(7, 'N7', 'ADG7788', 1, '2024-04-10 18:59:55'),
(8, 'N8', 'ADG8899', 1, '2024-04-10 19:00:21'),
(9, 'N9', 'ADG9910', 1, '2024-04-10 18:59:55'),
(10, 'M1', 'ADG9911', 1, '2024-04-10 19:00:21');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id` int(30) NOT NULL,
  `terminal_name` text NOT NULL,
  `city` varchar(250) NOT NULL,
  `state` varchar(250) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0= inactive , 1= active',
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `terminal_name`, `city`, `state`, `status`, `date_updated`) VALUES
(1,'D1','Delhi','Delhi', 1, '2024-04-10 19:10:58'),
(2,'M2','Mumbai', 'Maharastra', 1, '2024-04-10 19:12:12'),
(3,'K1','Kolkata','West Bengal', 1, '2024-04-10 19:13:08'),
(4,'B5','Bangalore','Karnataka', 1, '2024-04-10 19:13:35'),
(5,'C9','Chennai','TamilNadu', 1, '2024-04-10 19:12:49'),
(6,'H7','Hyderabad', 'Telengana', 1, '2024-04-10 19:14:05'),
(7,'A6','Ahmedabad', 'Gujarat', 1, '2024-04-10 19:13:51'),
(8,'P4','Pune', 'Maharastra', 1, '2024-04-10 19:13:18'),
(9,'S8','Surat', 'Gujarat', 1, '2024-04-10 19:09:37'),
(10,'V4','Vishakapatnam','Andhra Pradesh', 1, '2024-04-10 19:14:25');

-- -------------------------------------------------------- 

CREATE TABLE `schedule_list` (
  `id` int(30) NOT NULL,
  `bus_id` int(30) NOT NULL,
  `from_location` int(30) NOT NULL,
  `to_location` int(30) NOT NULL,
  `departure_time` datetime NOT NULL,
  `eta` datetime NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `availability` int(11) NOT NULL,
  `price` text NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `schedule_list`
--

INSERT INTO `schedule_list` (`id`, `bus_id`, `from_location`, `to_location`, `departure_time`, `eta`, `status`, `availability`, `price`, `date_updated`) VALUES
(1, 2, 1, 5, '2024-04-9 15:00', '2024-04-10 20:00', 1, 25, '1400', '2024-04-10 17:27:08'),
(2, 6, 2, 3, '2024-04-9 20:00', '2024-04-10 01:00:00', 1, 30, '1100', '2024-04-10 09:09:20'),
(3, 1, 3, 9, '2024-04-9 10:00:00', '2024-04-10 16:00:00', 1, 32, '1350', '2024-04-10 09:10:46'),
(4, 9, 4, 6, '2024-04-10 08:00:00', '2024-04-11 19:00:00', 1, 30, '930', '2024-04-10 09:11:55'),
(5, 7, 6, 5, '2024-04-9 10:00:00', '2024-04-10 19:00:00', 1, 33, '1150', '2024-04-10 09:13:02'),
(6, 4, 7, 8, '2024-04-10 11:00:00', '2024-04-11 13:00:00', 1, 35, '1200', '2024-04-10 09:17:10'),
(7, 8, 9, 4, '2024-04-11 15:00:00', '2024-04-12 23:00:00', 1, 34, '900', '2024-04-10 09:18:08'),
(8, 3, 8, 1 , '2024-04-9 12:00:00', '2024-04-10 17:00:00', 1, 31, '1500', '2024-04-10 09:20:35'),
(9, 5, 10, 7, '2024-04-10 10:00:00', '2024-04-11 13:00:00', 1, 38, '1235', '2024-04-10 17:36:18'),
(10, 10, 5, 10, '2024-04-11 10:00:00', '2024-04-12 13:00:00', 1, 38, '1325', '2024-04-10 17:36:18');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` varchar(150) NOT NULL,
  `user_type` tinyint(1) NOT NULL DEFAULT '1',
  `username` varchar(25) NOT NULL,
  `password` varchar(250) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT ' 0 = incative , 1 = active',
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `user_type`, `username`, `password`, `status`, `date_updated`) VALUES
(1, 'Administrator', 1, 'admin', 'f2d0ff370380124029c2b807a924156c', 1, '2024-04-10 20:13:42'),
(2, 'AdminLea', 1, 'leadmin', 'f2d0ff370380124029c2b807a924156c', 1, '2024-04-10 20:14:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booked`
--
ALTER TABLE `booked`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedule_list`
--
ALTER TABLE `schedule_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booked`
--
ALTER TABLE `booked`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `bus`
--
ALTER TABLE `bus`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `schedule_list`
--
ALTER TABLE `schedule_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

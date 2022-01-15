--
-- Database: `learningdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `cid` int(11) primary key auto_increment,
  `cname` varchar(30) NOT NULL
);

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`cid`, `cname`) VALUES
(1, 'BCA-1'),
(2, 'BCA-2'),
(3, 'BCOM-1'),
(5, 'BCA-3');

-- --------------------------------------------------------

--
-- Table structure for table `evaluation`
--

CREATE TABLE `evaluation` (
  `rollno` int(11) NOT NULL,
  `lid` int(11) NOT NULL,
  `eval` int(11) NOT NULL
);

--
-- Dumping data for table `evaluation`
--

INSERT INTO `evaluation` (`rollno`, `lid`, `eval`) VALUES
(101, 1001, 5),
(102, 1001, 5),
(102, 1002, 4),
(102, 1003, 4),
(106, 1003, 5),
(106, 1006, 5),
(108, 1001, 5),
(108, 1002, 5),
(108, 1003, 4),
(108, 1004, 4);

-- --------------------------------------------------------

--
-- Table structure for table `lecsub`
--

CREATE TABLE `lecsub` (
  `lid` int(11) NOT NULL,
  `subid` int(11) NOT NULL
);

--
-- Dumping data for table `lecsub`
--

INSERT INTO `lecsub` (`lid`, `subid`) VALUES
(1001, 3),
(1001, 11),
(1002, 1),
(1002, 2),
(1003, 4),
(1003, 10),
(1004, 8),
(1004, 9),
(1006, 12),
(1006, 13),
(1007, 14);

-- --------------------------------------------------------

--
-- Table structure for table `lecturer`
--

CREATE TABLE `lecturer` (
  `lid` int(11) primary key auto_increment,
  `lname` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `qual` varchar(30) NOT NULL
);

--
-- Dumping data for table `lecturer`
--

INSERT INTO `lecturer` (`lid`, `lname`, `city`, `gender`, `email`, `qual`) VALUES
(1001, 'Anand Singh', 'Noida', 'Male', 'smart.anandsingh@gmail.com', 'MCA'),
(1002, 'Anita Goel', 'Gurgaon', 'Female', 'anita.goel001@gmail.com', 'MBA Finance'),
(1003, 'Rajesh Kumar', 'New Delhi', 'Male', 'rajeshsir@gmail.com', 'MTech'),
(1004, 'Rajeev Shisodia', 'Gaziabad', 'Male', 'rajiv_shisodia@gmail.com', 'MCA');

-- --------------------------------------------------------

--
-- Table structure for table `matcat`
--

CREATE TABLE `matcat` (
  `catid` int(11) NOT NULL,
  `catname` varchar(30) NOT NULL,
  `lid` int(11) NOT NULL
);

--
-- Dumping data for table `matcat`
--

INSERT INTO `matcat` (`catid`, `catname`, `lid`) VALUES
(1, 'Tutorial', 1001),
(2, 'Assignments', 1001),
(4, 'Assignments', 1002);

-- --------------------------------------------------------

--
-- Table structure for table `material`
--

CREATE TABLE `material` (
  `matid` int(11) primary key auto_increment,
  `lid` int(11) NOT NULL,
  `subid` int(11) NOT NULL,
  `catid` int(11) NOT NULL,
  `filename` varchar(50) DEFAULT NULL
);

--
-- Dumping data for table `material`
--

INSERT INTO `material` (`matid`, `lid`, `subid`, `catid`, `filename`) VALUES
(1, 1001, 3, 1, '1.pdf'),
(2, 1001, 11, 1, '2.pdf'),
(3, 1003, 4, 1, '3.pdf'),
(4, 1003, 10, 2, '4.jpg'),
(5, 1006, 12, 1, '5.pdf'),
(6, 1006, 12, 2, '6.docx'),
(7, 1002, 1, 1, '7.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `msgs`
--

CREATE TABLE `msgs` (
  `msgid` int(11)  primary key auto_increment,
  `lid` int(11) NOT NULL,
  `msg` text NOT NULL,
  `mdate` datetime NOT NULL DEFAULT current_timestamp()
);

--
-- Dumping data for table `msgs`
--

INSERT INTO `msgs` (`msgid`, `lid`, `msg`, `mdate`) VALUES
(1, 1002, 'You have to download and learn the tutorial no 1.', '2020-03-04 16:49:32'),
(2, 1003, 'Dear Students, You have to complete the assignment till 1 April 2020.', '2020-03-04 21:09:50');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `rollno` int(11)  primary key auto_increment,
  `name` varchar(30) NOT NULL,
  `city` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `class` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL
);

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`rollno`, `name`, `city`, `gender`, `class`, `email`) VALUES
(101, 'Anil Kumar', 'New Delhi', 'Male', '1', 'anilkumar@gmail.com'),
(102, 'Sunil Kumar', 'Faridabad', 'Male', '1', 'sunilkumar@gmail.com'),
(104, 'Rajesh Kumar', 'Noida', 'Male', '1', 'rajesh@gmail.com'),
(105, 'Rajeev Kapoor', 'Faridabad', 'Male', '2', 'rajeev@gmail.com'),
(106, 'Anil Kapoor', 'Faridabad', 'Male', '2', 'anil@gmail.com'),
(107, 'Vidhi Rajput', 'New Delhi', 'Female', '1', 'vidhir@yahoo.com'),
(108, 'Annapurna Singh', 'New Delhi', 'Female', '1', 'annu@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `subid` int(11) primary key auto_increment,
  `subname` varchar(30) NOT NULL,
  `cid` int(11) NOT NULL
);

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`subid`, `subname`, `cid`) VALUES
(1, 'English', 1),
(2, 'Maths', 1),
(3, 'Database Systems', 1),
(4, 'Operating System', 2),
(8, 'Accountancy', 3),
(9, 'Programming Fundamentals', 1),
(10, 'Computer Fundamentals', 1),
(11, 'Object Oriented Programming', 1),
(12, 'Computer Networks', 2),
(13, 'Computer Security', 2),
(14, 'Business Management', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userid` varchar(40) primary key,
  `uname` varchar(40) NOT NULL,
  `pwd` varchar(20) NOT NULL,
  `role` varchar(15) NOT NULL,
  `id` int(11) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'active'
);

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `uname`, `pwd`, `role`, `id`, `status`) VALUES
('admin', 'Anand Singh', 'anand', 'admin', 0, 'active');

--
-- Indexes for dumped tables
--

ALTER TABLE `evaluation`
  ADD PRIMARY KEY (`rollno`,`lid`);

--
-- Indexes for table `lecsub`
--
ALTER TABLE `lecsub`
  ADD PRIMARY KEY (`lid`,`subid`);


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

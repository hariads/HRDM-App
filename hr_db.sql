-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 26, 2018 at 08:55 AM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hr_db`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_department_delete` (`deptid` INT)  BEGIN
	delete from department where deptid = deptid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_department_insert` (`deptid` INT, `dept` VARCHAR(50))  BEGIN
	insert into department(deptid,dept)values(deptid,dept);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_department_update` (`deptid` INT, `dept` VARCHAR(50))  BEGIN
	update employee
    set dept = dept
        where deptid = deptid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_employee_delete` (`empid` INT)  BEGIN
	delete from employee where empid = empid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_employee_insert` (`empname` VARCHAR(50), `mgrid` INT, `dept` INT, `salary` INT(12), `jobcode` INT, `phone` INT(10), `email` VARCHAR(40))  BEGIN
	insert into employee(empname,mgrid,dept,salary,hiredate,jobcode,phone,email)values(empname,mgrid,dept,salary,CURDATE(),jobcode,phone,email);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_employee_update` (`empid` INT, `empname` VARCHAR(50), `mgrid` INT, `dept` INT, `salary` INT(12), `jobcode` INT, `phone` INT(10), `email` VARCHAR(40))  BEGIN
	update employee
    set empname = empname,
    mgrid = mgrid,
    dept = dept,
    salary = salary,
    jobcode = jobcode,
    phone = phone,
    email= email
    where empid = empid;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `dept` varchar(30) NOT NULL,
  `deptid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dept`, `deptid`) VALUES
('HR', 11),
('IT', 12),
('WEB', 13),
('BACK-END', 14),
('FRONT-END', 15),
('RPA', 16),
('salesforce', 18);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `empid` int(11) NOT NULL,
  `empname` varchar(50) NOT NULL,
  `dept` int(11) NOT NULL,
  `mgrid` int(11) DEFAULT NULL,
  `salary` int(11) NOT NULL DEFAULT '0',
  `hiredate` date NOT NULL,
  `jobcode` int(11) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `email` varchar(40) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`empid`, `empname`, `dept`, `mgrid`, `salary`, `hiredate`, `jobcode`, `phone`, `email`, `status`) VALUES
(3, 'Steve jobs', 11, 0, 200000, '2018-07-20', 120, '6673478987', 'Steve.jobs@pramati.com', 'Active'),
(4, 'Bill gates', 12, 5, 500000, '2018-07-20', 120, '1234567890', 'Bill.gates@pramati.com', 'Terminated'),
(5, 'Mark zuckerberg', 13, 0, 200000, '2018-07-20', 120, '1245678999', 'Mark.zuckerberg@pramati.com', 'Active'),
(6, 'Sergey Brin', 15, 0, 200000, '2018-07-20', 120, '3287423769', 'Sergey.Brin@pramati.com', 'Active'),
(7, 'Larry Page', 15, 0, 200000, '2018-07-20', 120, '3456789085', 'Larry.Page@pramati.com', 'Active'),
(9, 'Jeff Bezos', 18, 0, 200000, '2018-07-20', 120, '2346283548', 'Jeff.Bezos@pramati.com', 'Active'),
(10, 'Elon Musk', 12, 4, 3000000, '2018-07-20', 110, '2893750827', 'Elon.Musk@pramati.com', 'Active'),
(11, 'Jack Ma', 13, 9, 3000000, '2018-07-20', 110, '3926502635', 'Jack.Ma@pramati.com', 'Active');

--
-- Triggers `employee`
--
DELIMITER $$
CREATE TRIGGER `trg_aftr_insert` AFTER INSERT ON `employee` FOR EACH ROW INSERT INTO transactions 
        (empid,operation,empname,mgrid,dept,salary,hiredate,jobcode,phone,email,modified_time) VALUES(NEW.empid,'Created',NEW.empname,NEW.mgrid,NEW.dept,NEW.salary,NEW.hiredate,NEW.jobcode,NEW.phone,NEW.email,CURRENT_TIMESTAMP)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_employee_terminate` AFTER UPDATE ON `employee` FOR EACH ROW BEGIN
      IF (NEW.status = 'Terminated') THEN
            INSERT into transactions(empid,operation,oldempname,oldempsalary,oldjobcode,oldphone,oldemail,olddept,modified_time)VALUES
            (old.empid,'Terminated',OLD.empname,OLD.salary,OLD.jobcode,OLD.phone,OLD.email,OLD.dept,CURDATE());
        
       ELSEIF NEW.salary <> OLD.salary or NEW.empname <> OLD.empname OR NEW.email <> OLD.email OR NEW.phone <> OLD.phone OR NEW.jobcode <> OLD.jobcode THEN
            insert into transactions(empid,operation,empname,mgrid,dept,salary,hiredate,jobcode,phone,email,oldempname,oldempsalary,oldjobcode,oldphone,oldemail,olddept,modified_time)VALUES
            (old.empid,'Updated',NEW.empname,NEW.mgrid,NEW.dept,NEW.salary,OLD.hiredate,NEW.jobcode,NEW.phone,NEW.email,OLD.empname,OLD.salary,OLD.jobcode,OLD.phone,OLD.email,OLD.dept,CURDATE());
      END IF;
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE `job` (
  `jobcode` int(11) NOT NULL,
  `jobname` varchar(20) NOT NULL,
  `maxsalary` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`jobcode`, `jobname`, `maxsalary`) VALUES
(110, 'PRINCIPAL ENGINEER', 3000000),
(120, 'MANAGER', 200000),
(130, 'ASE', 200000),
(140, 'ARCHITECT', 3500000);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `empid` varchar(4) DEFAULT NULL,
  `operation` varchar(10) NOT NULL,
  `empname` varchar(50) DEFAULT NULL,
  `mgrid` int(11) DEFAULT NULL,
  `dept` int(11) DEFAULT NULL,
  `salary` int(12) DEFAULT NULL,
  `hiredate` date DEFAULT NULL,
  `jobcode` int(11) DEFAULT NULL,
  `phone` int(10) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `oldempname` varchar(50) NOT NULL DEFAULT 'NILL',
  `oldempsalary` int(11) NOT NULL DEFAULT '0',
  `oldjobcode` int(11) NOT NULL DEFAULT '0',
  `oldphone` int(10) NOT NULL DEFAULT '0',
  `olddept` int(11) NOT NULL DEFAULT '0',
  `oldemail` varchar(40) NOT NULL DEFAULT 'NILL',
  `user_modified` varchar(50) NOT NULL DEFAULT 'HR',
  `modified_time` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`deptid`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`empid`),
  ADD KEY `employee_fk_1` (`dept`),
  ADD KEY `employee_fk_2` (`jobcode`);

--
-- Indexes for table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`jobcode`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `empid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_fk_1` FOREIGN KEY (`dept`) REFERENCES `department` (`deptid`),
  ADD CONSTRAINT `employee_fk_2` FOREIGN KEY (`jobcode`) REFERENCES `job` (`jobcode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

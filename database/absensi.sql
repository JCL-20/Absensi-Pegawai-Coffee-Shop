-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 08, 2022 at 02:41 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `absensi`
--

-- --------------------------------------------------------

--
-- Table structure for table `absensi`
--

CREATE TABLE `absensi` (
  `id_absen` int(11) NOT NULL,
  `tgl` date NOT NULL,
  `waktu` time NOT NULL,
  `keterangan` enum('Masuk','Pulang') NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `absensi`
--

INSERT INTO `absensi` (`id_absen`, `tgl`, `waktu`, `keterangan`, `id_user`) VALUES
(4, '2019-07-25', '07:21:53', 'Masuk', 6),
(5, '2019-07-26', '09:00:47', 'Masuk', 6),
(6, '2019-07-26', '16:01:03', 'Pulang', 6),
(7, '2019-07-25', '17:01:28', 'Pulang', 6),
(8, '2022-04-18', '21:49:02', 'Masuk', 14),
(9, '2022-04-18', '22:05:25', 'Masuk', 13),
(10, '2022-04-18', '22:09:46', 'Masuk', 13),
(11, '2022-04-25', '04:45:02', 'Masuk', 14),
(12, '2022-04-25', '05:18:50', 'Masuk', 14),
(13, '2022-04-25', '05:20:07', 'Masuk', 14),
(14, '2022-04-25', '06:05:47', 'Masuk', 14),
(15, '2022-04-25', '07:41:20', 'Masuk', 14),
(16, '2022-04-25', '07:44:11', 'Masuk', 13),
(17, '2022-04-25', '07:46:24', 'Pulang', 13),
(18, '2022-04-25', '21:07:10', 'Masuk', 14),
(19, '2022-04-25', '21:07:13', 'Pulang', 14),
(20, '2022-04-26', '01:06:03', 'Masuk', 14),
(21, '2022-04-26', '01:21:12', 'Masuk', 14),
(22, '2022-04-26', '01:45:00', 'Masuk', 14),
(23, '2022-04-26', '02:07:47', 'Masuk', 14),
(24, '2022-04-26', '02:08:28', 'Masuk', 13),
(25, '2022-04-26', '02:08:44', 'Pulang', 13),
(26, '2022-04-26', '02:09:45', 'Masuk', 14),
(27, '2022-05-03', '23:14:11', 'Masuk', 13),
(28, '2022-05-03', '23:14:22', 'Pulang', 13),
(29, '2022-05-04', '08:00:20', 'Masuk', 13),
(30, '2022-05-04', '08:00:22', 'Pulang', 13);

-- --------------------------------------------------------

--
-- Table structure for table `divisi`
--

CREATE TABLE `divisi` (
  `id_divisi` smallint(3) NOT NULL,
  `nama_divisi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `divisi`
--

INSERT INTO `divisi` (`id_divisi`, `nama_divisi`) VALUES
(1, 'Marketing'),
(2, 'IT '),
(3, 'Akuntan'),
(4, 'Kebersihan');

-- --------------------------------------------------------

--
-- Table structure for table `jam`
--

CREATE TABLE `jam` (
  `id_jam` tinyint(1) NOT NULL,
  `start` time NOT NULL,
  `finish` time NOT NULL,
  `keterangan` enum('Masuk','Pulang') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jam`
--

INSERT INTO `jam` (`id_jam`, `start`, `finish`, `keterangan`) VALUES
(1, '06:00:00', '17:00:00', 'Masuk'),
(2, '06:00:00', '17:00:00', 'Pulang');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` smallint(5) NOT NULL,
  `nik` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `telp` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `foto` varchar(20) DEFAULT 'no-foto.png',
  `divisi` smallint(5) DEFAULT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(60) NOT NULL,
  `level` enum('Manager','Karyawan') NOT NULL DEFAULT 'Karyawan'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `nik`, `nama`, `telp`, `email`, `foto`, `divisi`, `username`, `password`, `level`) VALUES
(8, '', 'Manager 1', '911', 'mananger1@ft.business.com', '1650913739.jpg', NULL, 'manager_1', 'manager_1', 'Manager'),
(9, '1231231238900', 'Manager 2', '', '', 'no-foto.png', NULL, 'manager_2', 'manager_2', 'Manager'),
(10, '908121310291', 'Manager 3', '', '', 'no-foto.png', NULL, 'manager_3', 'manager_3', 'Manager'),
(11, '123801204012', 'Manager 4', '', '', 'no-foto.png', NULL, 'master_1', 'master_1', 'Manager'),
(13, '', 'Hayley Williams', '14045', 'hayley.paramore@idn.com', '1650913719.jpg', NULL, 'hayley', 'hayley', 'Karyawan'),
(14, '21122002', 'Avril Lavigne', '14022', 'avril.lavigne@ca.com', '1650912295.jpg', NULL, 'avril', 'avril', 'Karyawan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absensi`
--
ALTER TABLE `absensi`
  ADD PRIMARY KEY (`id_absen`);

--
-- Indexes for table `divisi`
--
ALTER TABLE `divisi`
  ADD PRIMARY KEY (`id_divisi`);

--
-- Indexes for table `jam`
--
ALTER TABLE `jam`
  ADD PRIMARY KEY (`id_jam`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absensi`
--
ALTER TABLE `absensi`
  MODIFY `id_absen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `divisi`
--
ALTER TABLE `divisi`
  MODIFY `id_divisi` smallint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `jam`
--
ALTER TABLE `jam`
  MODIFY `id_jam` tinyint(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

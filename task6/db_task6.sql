-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 02, 2023 at 03:14 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_task6`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_musik`
--

CREATE TABLE `tb_musik` (
  `id` int(11) NOT NULL,
  `link_musik` text NOT NULL,
  `judul` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_musik`
--

INSERT INTO `tb_musik` (`id`, `link_musik`, `judul`) VALUES
(1, 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3', 'SoundHelix Song 1'),
(2, 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3', 'SoundHelix Song 2');

-- --------------------------------------------------------

--
-- Table structure for table `tb_video`
--

CREATE TABLE `tb_video` (
  `id` int(11) NOT NULL,
  `link_video` text NOT NULL,
  `title` text NOT NULL,
  `pemilik` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_video`
--

INSERT INTO `tb_video` (`id`, `link_video`, `title`, `pemilik`) VALUES
(1, 'https://www.youtube.com/watch?v=KRaWnd3LJfs', 'Maroon 5 - Payphone ft. Wiz Khalifa (Explicit) (Official Music Video)', 'Maroon 5\r\n'),
(3, 'https://www.youtube.com/watch?v=_ZYvZ7XfQU4', 'Keisya Levronka - Tak Ingin Usai (Official Music Video)', 'Keisya Levronka Channel '),
(4, 'https://www.youtube.com/watch?v=b5Nm0l-Nqug&list=RDb5Nm0l-Nqug&start_radio=1', 'LIRIK SEMATA KARENAMU// MARIO G KLAU', 'MARIO G KLAU'),
(5, 'https://www.youtube.com/watch?v=8zwz2fVgfVM', 'Last Child - DUKA (Official Lyric Video)', 'LAST CHILD\r\n'),
(6, 'https://www.youtube.com/watch?v=JyXfKoVtBno', 'FLUTTER 122 Firebase - Query Data (Tutorial Flutter Bahasa Indonesia)', 'Kuldii Project');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_musik`
--
ALTER TABLE `tb_musik`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_video`
--
ALTER TABLE `tb_video`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_musik`
--
ALTER TABLE `tb_musik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_video`
--
ALTER TABLE `tb_video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2023 at 03:00 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `si_promosi_kenaikan_jabatan`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `ID_Admin` varchar(7) NOT NULL,
  `Nama` varchar(20) NOT NULL,
  `Kontak` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bobot_kriteria`
--

CREATE TABLE `bobot_kriteria` (
  `ID_Bobot_Kriteria` varchar(20) NOT NULL,
  `Nama` varchar(20) NOT NULL,
  `Bobot` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `ID_Karyawan` varchar(7) NOT NULL,
  `Nama` varchar(20) NOT NULL,
  `Tempat_Lahir` varchar(20) NOT NULL,
  `Tanggal_Lahir` date NOT NULL,
  `Jenis_Kelamin` varchar(10) NOT NULL,
  `Alamat` text NOT NULL,
  `Kontak` varchar(13) NOT NULL,
  `Jabatan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kriteria_disiplin`
--

CREATE TABLE `kriteria_disiplin` (
  `ID_Kriteria_Disiplin` varchar(7) NOT NULL,
  `ID_Karyawan` varchar(7) NOT NULL,
  `ID_Bobot_Kriteria` varchar(7) NOT NULL,
  `Poin_Penilaian` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kriteria_keahlian`
--

CREATE TABLE `kriteria_keahlian` (
  `ID_Kriteria_Keahlian` varchar(7) NOT NULL,
  `ID_Karyawan` varchar(7) NOT NULL,
  `ID_Bobot_Kriteria` varchar(7) NOT NULL,
  `Poin_Penilaian` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kriteria_kerja_sama`
--

CREATE TABLE `kriteria_kerja_sama` (
  `ID_Kriteria_Kerja_sama` varchar(7) NOT NULL,
  `ID_Karyawan` varchar(7) NOT NULL,
  `ID_Bobot_Kriteria` varchar(7) NOT NULL,
  `Poin_Penilaian` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kriteria_loyalitas`
--

CREATE TABLE `kriteria_loyalitas` (
  `ID_Kriteria_Loyalitas` varchar(7) NOT NULL,
  `ID_Karyawan` varchar(7) NOT NULL,
  `ID_Bobot_Kriteria` varchar(7) NOT NULL,
  `Poin_Penilaian` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kriteria_pengetahuan`
--

CREATE TABLE `kriteria_pengetahuan` (
  `ID_Kriteria_Pengetahuan` varchar(7) NOT NULL,
  `ID_Karyawan` varchar(7) NOT NULL,
  `ID_Bobot_Kriteria` varchar(7) NOT NULL,
  `Poin_Penilaian` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kriteria_tanggung_jawab`
--

CREATE TABLE `kriteria_tanggung_jawab` (
  `ID_Kriterian_Tanggung_Jawab` varchar(7) NOT NULL,
  `ID_Karyawan` varchar(7) NOT NULL,
  `ID_Bobot_Kriteria` varchar(7) NOT NULL,
  `Poin_Penilaian` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `ID_Pengguna` varchar(7) NOT NULL,
  `ID_Karyawan` varchar(7) NOT NULL,
  `ID_Admin` varchar(7) NOT NULL,
  `Username` varchar(20) NOT NULL,
  `Password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penilaian`
--

CREATE TABLE `penilaian` (
  `ID_Penilaian` varchar(7) NOT NULL,
  `ID_Karyawan` varchar(7) NOT NULL,
  `ID_Kriteria_Tanggung_Jawab` varchar(7) NOT NULL,
  `ID_Kriteria_Disiplin` varchar(7) NOT NULL,
  `ID_Kriteria_Loyalitas` varchar(7) NOT NULL,
  `ID_Kriteria_Keahlian` varchar(7) NOT NULL,
  `ID_Kriteria_Kerja_Sama` varchar(7) NOT NULL,
  `ID_Kriteria_Pengetahuan` varchar(7) NOT NULL,
  `Normalisas_Tanggung_Jawab` float NOT NULL,
  `Normalisasi_Disiplin` float NOT NULL,
  `Normalisasi_Loyalitas` float NOT NULL,
  `Normalisasi_Keahlian` float NOT NULL,
  `Normalisasi_Kerja_Sama` float NOT NULL,
  `Normalisasi_Pengetahuan` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `peringkat`
--

CREATE TABLE `peringkat` (
  `ID_Peringkat` varchar(7) NOT NULL,
  `ID_Karyawan` varchar(7) NOT NULL,
  `ID_Penilaian` varchar(7) NOT NULL,
  `Nilai` float NOT NULL,
  `Peringkat` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID_Admin`);

--
-- Indexes for table `bobot_kriteria`
--
ALTER TABLE `bobot_kriteria`
  ADD PRIMARY KEY (`ID_Bobot_Kriteria`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`ID_Karyawan`);

--
-- Indexes for table `kriteria_disiplin`
--
ALTER TABLE `kriteria_disiplin`
  ADD PRIMARY KEY (`ID_Kriteria_Disiplin`),
  ADD KEY `ID_Karyawan` (`ID_Karyawan`),
  ADD KEY `ID_Bobot_Kriteria` (`ID_Bobot_Kriteria`);

--
-- Indexes for table `kriteria_keahlian`
--
ALTER TABLE `kriteria_keahlian`
  ADD PRIMARY KEY (`ID_Kriteria_Keahlian`),
  ADD KEY `ID_Karyawan` (`ID_Karyawan`),
  ADD KEY `ID_Bobot_Kriteria` (`ID_Bobot_Kriteria`);

--
-- Indexes for table `kriteria_kerja_sama`
--
ALTER TABLE `kriteria_kerja_sama`
  ADD PRIMARY KEY (`ID_Kriteria_Kerja_sama`),
  ADD KEY `ID_Karyawan` (`ID_Karyawan`),
  ADD KEY `ID_Bobot_Kriteria` (`ID_Bobot_Kriteria`);

--
-- Indexes for table `kriteria_loyalitas`
--
ALTER TABLE `kriteria_loyalitas`
  ADD PRIMARY KEY (`ID_Kriteria_Loyalitas`),
  ADD KEY `ID_Karyawan` (`ID_Karyawan`),
  ADD KEY `ID_Bobot_Kriteria` (`ID_Bobot_Kriteria`),
  ADD KEY `Poin_Penilaian` (`Poin_Penilaian`);

--
-- Indexes for table `kriteria_pengetahuan`
--
ALTER TABLE `kriteria_pengetahuan`
  ADD PRIMARY KEY (`ID_Kriteria_Pengetahuan`),
  ADD KEY `ID_Karyawan` (`ID_Karyawan`),
  ADD KEY `ID_Bobot_Kriteria` (`ID_Bobot_Kriteria`);

--
-- Indexes for table `kriteria_tanggung_jawab`
--
ALTER TABLE `kriteria_tanggung_jawab`
  ADD PRIMARY KEY (`ID_Kriterian_Tanggung_Jawab`),
  ADD KEY `ID_Karyawan` (`ID_Karyawan`),
  ADD KEY `ID_Bobot_Kriteria` (`ID_Bobot_Kriteria`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`ID_Pengguna`),
  ADD KEY `ID_Karyawan` (`ID_Karyawan`),
  ADD KEY `ID_Admin` (`ID_Admin`);

--
-- Indexes for table `penilaian`
--
ALTER TABLE `penilaian`
  ADD PRIMARY KEY (`ID_Penilaian`),
  ADD KEY `ID_Karyawan` (`ID_Karyawan`),
  ADD KEY `ID_Kriteria_Tanggung_Jawab` (`ID_Kriteria_Tanggung_Jawab`),
  ADD KEY `ID_Kriteria_Disiplin` (`ID_Kriteria_Disiplin`),
  ADD KEY `ID_Kriteria_Loyalitas` (`ID_Kriteria_Loyalitas`),
  ADD KEY `ID_Kriteria_Keahlian` (`ID_Kriteria_Keahlian`),
  ADD KEY `ID_Kriteria_Kerja_Sama` (`ID_Kriteria_Kerja_Sama`),
  ADD KEY `ID_Kriteria_Pengetahuan` (`ID_Kriteria_Pengetahuan`),
  ADD KEY `Normalisas_Tanggung_Jawab` (`Normalisas_Tanggung_Jawab`),
  ADD KEY `Normalisasi_Disiplin` (`Normalisasi_Disiplin`);

--
-- Indexes for table `peringkat`
--
ALTER TABLE `peringkat`
  ADD PRIMARY KEY (`ID_Peringkat`),
  ADD KEY `ID_Karyawan` (`ID_Karyawan`),
  ADD KEY `ID_Penilaian` (`ID_Penilaian`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kriteria_disiplin`
--
ALTER TABLE `kriteria_disiplin`
  ADD CONSTRAINT `kriteria_disiplin_ibfk_1` FOREIGN KEY (`ID_Bobot_Kriteria`) REFERENCES `bobot_kriteria` (`ID_Bobot_Kriteria`),
  ADD CONSTRAINT `kriteria_disiplin_ibfk_2` FOREIGN KEY (`ID_Karyawan`) REFERENCES `karyawan` (`ID_Karyawan`);

--
-- Constraints for table `kriteria_keahlian`
--
ALTER TABLE `kriteria_keahlian`
  ADD CONSTRAINT `kriteria_keahlian_ibfk_1` FOREIGN KEY (`ID_Karyawan`) REFERENCES `karyawan` (`ID_Karyawan`);

--
-- Constraints for table `kriteria_kerja_sama`
--
ALTER TABLE `kriteria_kerja_sama`
  ADD CONSTRAINT `kriteria_kerja_sama_ibfk_1` FOREIGN KEY (`ID_Karyawan`) REFERENCES `karyawan` (`ID_Karyawan`);

--
-- Constraints for table `kriteria_loyalitas`
--
ALTER TABLE `kriteria_loyalitas`
  ADD CONSTRAINT `kriteria_loyalitas_ibfk_1` FOREIGN KEY (`ID_Karyawan`) REFERENCES `karyawan` (`ID_Karyawan`),
  ADD CONSTRAINT `kriteria_loyalitas_ibfk_2` FOREIGN KEY (`ID_Bobot_Kriteria`) REFERENCES `bobot_kriteria` (`ID_Bobot_Kriteria`);

--
-- Constraints for table `kriteria_pengetahuan`
--
ALTER TABLE `kriteria_pengetahuan`
  ADD CONSTRAINT `kriteria_pengetahuan_ibfk_1` FOREIGN KEY (`ID_Karyawan`) REFERENCES `karyawan` (`ID_Karyawan`),
  ADD CONSTRAINT `kriteria_pengetahuan_ibfk_2` FOREIGN KEY (`ID_Bobot_Kriteria`) REFERENCES `bobot_kriteria` (`ID_Bobot_Kriteria`);

--
-- Constraints for table `kriteria_tanggung_jawab`
--
ALTER TABLE `kriteria_tanggung_jawab`
  ADD CONSTRAINT `kriteria_tanggung_jawab_ibfk_1` FOREIGN KEY (`ID_Karyawan`) REFERENCES `karyawan` (`ID_Karyawan`),
  ADD CONSTRAINT `kriteria_tanggung_jawab_ibfk_2` FOREIGN KEY (`ID_Kriterian_Tanggung_Jawab`) REFERENCES `karyawan` (`ID_Karyawan`),
  ADD CONSTRAINT `kriteria_tanggung_jawab_ibfk_3` FOREIGN KEY (`ID_Bobot_Kriteria`) REFERENCES `bobot_kriteria` (`ID_Bobot_Kriteria`);

--
-- Constraints for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD CONSTRAINT `pengguna_ibfk_1` FOREIGN KEY (`ID_Admin`) REFERENCES `admin` (`ID_Admin`),
  ADD CONSTRAINT `pengguna_ibfk_2` FOREIGN KEY (`ID_Karyawan`) REFERENCES `karyawan` (`ID_Karyawan`);

--
-- Constraints for table `penilaian`
--
ALTER TABLE `penilaian`
  ADD CONSTRAINT `penilaian_ibfk_1` FOREIGN KEY (`ID_Kriteria_Tanggung_Jawab`) REFERENCES `kriteria_tanggung_jawab` (`ID_Kriterian_Tanggung_Jawab`),
  ADD CONSTRAINT `penilaian_ibfk_2` FOREIGN KEY (`ID_Karyawan`) REFERENCES `karyawan` (`ID_Karyawan`),
  ADD CONSTRAINT `penilaian_ibfk_3` FOREIGN KEY (`ID_Kriteria_Pengetahuan`) REFERENCES `kriteria_pengetahuan` (`ID_Kriteria_Pengetahuan`),
  ADD CONSTRAINT `penilaian_ibfk_4` FOREIGN KEY (`ID_Kriteria_Kerja_Sama`) REFERENCES `kriteria_kerja_sama` (`ID_Kriteria_Kerja_sama`),
  ADD CONSTRAINT `penilaian_ibfk_5` FOREIGN KEY (`ID_Kriteria_Keahlian`) REFERENCES `kriteria_keahlian` (`ID_Kriteria_Keahlian`),
  ADD CONSTRAINT `penilaian_ibfk_6` FOREIGN KEY (`ID_Kriteria_Loyalitas`) REFERENCES `kriteria_loyalitas` (`ID_Kriteria_Loyalitas`),
  ADD CONSTRAINT `penilaian_ibfk_7` FOREIGN KEY (`ID_Kriteria_Disiplin`) REFERENCES `kriteria_disiplin` (`ID_Kriteria_Disiplin`);

--
-- Constraints for table `peringkat`
--
ALTER TABLE `peringkat`
  ADD CONSTRAINT `peringkat_ibfk_1` FOREIGN KEY (`ID_Karyawan`) REFERENCES `karyawan` (`ID_Karyawan`),
  ADD CONSTRAINT `peringkat_ibfk_2` FOREIGN KEY (`ID_Penilaian`) REFERENCES `penilaian` (`ID_Penilaian`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

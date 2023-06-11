-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Jun 2023 pada 14.23
-- Versi server: 10.4.18-MariaDB
-- Versi PHP: 8.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `praktikum5`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen`
--

CREATE TABLE `dosen` (
  `kd_ds` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `dosen`
--

INSERT INTO `dosen` (`kd_ds`, `nama`) VALUES
('DS001', 'Nofal Arianto'),
('DS002', 'Ario Talib'),
('DS003', 'Ayu Rahmadina'),
('DS004', 'Ratna Kumala'),
('DS005', 'Vika Prasetyo');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwalmengajar`
--

CREATE TABLE `jadwalmengajar` (
  `kd_mk` varchar(10) NOT NULL,
  `kd_ds` varchar(10) NOT NULL,
  `hari` enum('Senin','Selasa','Rabu','Kamis','Jumat','Sabtu','Minggu') DEFAULT NULL,
  `jam` time NOT NULL,
  `ruang` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jadwalmengajar`
--

INSERT INTO `jadwalmengajar` (`kd_mk`, `kd_ds`, `hari`, `jam`, `ruang`) VALUES
('MK001', 'DS002', 'Senin', '10:00:00', '102'),
('MK002', 'DS002', 'Senin', '13:00:00', 'Lab. 01'),
('MK003', 'DS001', 'Selasa', '08:00:00', '201'),
('MK004', 'DS001', 'Rabu', '10:00:00', 'Lab. 02'),
('MK005', 'DS003', 'Selasa', '10:00:00', 'Lab. 01'),
('MK006', 'DS004', 'Kamis', '09:00:00', 'Lab. 03'),
('MK007', 'DS005', 'Rabu', '08:00:00', '102'),
('MK008', 'DS005', 'Kamis', '13:00:00', '201');

-- --------------------------------------------------------

--
-- Struktur dari tabel `krsmahasiswa`
--

CREATE TABLE `krsmahasiswa` (
  `nim` varchar(10) NOT NULL,
  `kd_mk` varchar(10) NOT NULL,
  `kd_ds` varchar(10) NOT NULL,
  `semester` varchar(30) NOT NULL,
  `nilai` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `krsmahasiswa`
--

INSERT INTO `krsmahasiswa` (`nim`, `kd_mk`, `kd_ds`, `semester`, `nilai`) VALUES
('1823456', 'MK001', 'DS002', '3', NULL),
('1823456', 'MK002', 'DS002', '1', NULL),
('1823456', 'MK003', 'DS001', '3', NULL),
('1823456', 'MK004', 'DS001', '3', NULL),
('1823456', 'MK007', 'DS005', '3', NULL),
('1823456', 'MK008', 'DS005', '3', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jk` enum('L','P') NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jalan` varchar(100) DEFAULT NULL,
  `Kota` varchar(50) NOT NULL,
  `kodepos` varchar(20) DEFAULT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `kd_ds` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `nama`, `jk`, `tgl_lahir`, `jalan`, `Kota`, `kodepos`, `no_hp`, `kd_ds`) VALUES
('1812345', 'Ari Santoso', 'L', '1979-10-11', NULL, 'Bekasi', NULL, NULL, 'DS002'),
('1823456', 'Dina Marlina', 'P', '1999-11-20', NULL, 'Cikarang', NULL, NULL, NULL),
('1834567', 'Rahmat Hidayat', 'L', '1999-05-10', NULL, 'Bekasi', NULL, NULL, NULL),
('1845678', 'Jaka Sampurna ', 'L', '1996-10-19', NULL, 'Cikarang', NULL, NULL, NULL),
('1856789', 'Tia Lestari', 'P', '1908-02-15', NULL, 'Karawang', NULL, NULL, NULL),
('1867890', 'Anton Sinaga', 'L', '1988-06-22', NULL, 'Bekasi', NULL, NULL, NULL),
('1912345', 'Listia Nastiti', 'P', '1999-10-23', NULL, 'Jakarta', NULL, NULL, NULL),
('1923456', 'Amira Jarisa', 'P', '1999-01-24', NULL, 'Karawang', NULL, NULL, 'DS004'),
('1934567', 'Laksana Mardito', 'L', '1999-04-14', NULL, 'Cikarang', NULL, NULL, NULL),
('1945678', 'Jura Marsina', 'P', '1999-05-10', NULL, 'Cikarang', NULL, NULL, NULL),
('1956789', 'Dadi Martani', 'L', '1999-08-29', NULL, 'Bekasi', NULL, NULL, 'DS005'),
('1967890', 'Bayu Laksono', 'L', '1999-07-22', NULL, 'Cikarang', NULL, NULL, 'DS004');

-- --------------------------------------------------------

--
-- Struktur dari tabel `matakuliah`
--

CREATE TABLE `matakuliah` (
  `kd_mk` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `sks` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `matakuliah`
--

INSERT INTO `matakuliah` (`kd_mk`, `nama`, `sks`) VALUES
('MK001', 'Algoritma Dan Pemrogaman', 3),
('MK002', 'Praktikum Algoritma Dan Pemrograman', 1),
('MK003', 'Teknologi Basis Data', 3),
('MK004', 'Praktikum Teknologi Basis Data', 1),
('MK005', 'Pemrograman Dasar', 3),
('MK006', 'Pemrograman Berorientasi Objek', 3),
('MK007', 'Struktur Data', 3),
('MK008', 'Arsitektur Komputer', 2);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`kd_ds`);

--
-- Indeks untuk tabel `jadwalmengajar`
--
ALTER TABLE `jadwalmengajar`
  ADD PRIMARY KEY (`kd_mk`,`kd_ds`);

--
-- Indeks untuk tabel `krsmahasiswa`
--
ALTER TABLE `krsmahasiswa`
  ADD PRIMARY KEY (`nim`,`kd_mk`,`kd_ds`);

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`);

--
-- Indeks untuk tabel `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD PRIMARY KEY (`kd_mk`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

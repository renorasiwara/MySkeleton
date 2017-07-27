-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 06 Jul 2017 pada 01.21
-- Versi Server: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `_nero`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_category`
--

CREATE TABLE IF NOT EXISTS `tbl_category` (
  `category_ID` bigint(20) unsigned NOT NULL,
  `category_name` varchar(200) NOT NULL DEFAULT '',
  `category_slug` varchar(200) NOT NULL DEFAULT '',
  `category_description` text NOT NULL,
  `category_parent` bigint(20) NOT NULL,
  `category_type` varchar(15) NOT NULL,
  `category_sort` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_comment`
--

CREATE TABLE IF NOT EXISTS `tbl_comment` (
  `comment_ID` bigint(20) unsigned NOT NULL,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` bigint(20) NOT NULL,
  `comment_author_name` varchar(100) NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_confirmation`
--

CREATE TABLE IF NOT EXISTS `tbl_confirmation` (
  `confirm_id` bigint(255) NOT NULL,
  `confirm_status` varchar(255) NOT NULL,
  `confirm_session` varchar(255) NOT NULL,
  `nama_lengkap` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `no_hp` varchar(255) NOT NULL,
  `confirm_time` datetime NOT NULL,
  `total` float(21,0) NOT NULL,
  `transaction_id` bigint(20) NOT NULL,
  `tujuan` varchar(255) DEFAULT NULL,
  `dari_rek_bank` varchar(255) NOT NULL,
  `dari_rek_no` varchar(255) NOT NULL,
  `dari_rek_atas_nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_options`
--

CREATE TABLE IF NOT EXISTS `tbl_options` (
  `option_id` bigint(20) unsigned NOT NULL,
  `option_name` varchar(64) NOT NULL,
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_post`
--

CREATE TABLE IF NOT EXISTS `tbl_post` (
  `post_ID` bigint(20) unsigned NOT NULL,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` mediumtext NOT NULL,
  `menu_sort` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL,
  `post_image` text,
  `post_code` varchar(255) NOT NULL,
  `post_price` float(22,0) NOT NULL,
  `post_discount` float(22,0) NOT NULL,
  `post_stock` int(5) NOT NULL,
  `post_attribute` text NOT NULL,
  `post_category` text NOT NULL,
  `post_counter` mediumint(9) NOT NULL,
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_sessions`
--

CREATE TABLE IF NOT EXISTS `tbl_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_shipping`
--

CREATE TABLE IF NOT EXISTS `tbl_shipping` (
  `shipping_id` int(255) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `transaction_id` bigint(255) NOT NULL,
  `nama_lengkap` varchar(500) NOT NULL,
  `alamat` text NOT NULL,
  `provinsi` varchar(500) NOT NULL,
  `kota` varchar(500) NOT NULL,
  `kecamatan` varchar(255) NOT NULL,
  `no_telepon` varchar(500) NOT NULL,
  `no_handphone` varchar(255) NOT NULL,
  `email` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_tarif_jne`
--

CREATE TABLE IF NOT EXISTS `tbl_tarif_jne` (
  `tarif_id` int(255) NOT NULL,
  `kode_lengkap` varchar(100) NOT NULL,
  `kota_kabupaten` varchar(255) NOT NULL,
  `kecamatan` varchar(255) NOT NULL,
  `kode` varchar(100) NOT NULL,
  `reg` float NOT NULL,
  `estimasi_reg` varchar(25) NOT NULL,
  `oke` float NOT NULL,
  `estimasi_oke` varchar(25) NOT NULL,
  `yes` float NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=5576 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_template`
--

CREATE TABLE IF NOT EXISTS `tbl_template` (
  `template_id` int(255) NOT NULL,
  `template_name` varchar(500) NOT NULL,
  `template_directory` varchar(500) NOT NULL,
  `template_author` varchar(255) NOT NULL,
  `template_version` varchar(255) NOT NULL,
  `template_description` text NOT NULL,
  `template_attribute` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_transaction`
--

CREATE TABLE IF NOT EXISTS `tbl_transaction` (
  `transaction_id` bigint(255) NOT NULL,
  `transaction_status` varchar(25) NOT NULL,
  `user_id` varchar(60) NOT NULL,
  `transaction_time` datetime NOT NULL,
  `total` float(21,0) NOT NULL,
  `random` float(22,0) NOT NULL,
  `tax` float(21,0) NOT NULL,
  `total_tax` float(21,0) NOT NULL,
  `all_total` float(22,0) NOT NULL,
  `tax_type` varchar(255) NOT NULL,
  `transfer_destination` varchar(255) DEFAULT NULL,
  `tracking_number` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_transaction_detail`
--

CREATE TABLE IF NOT EXISTS `tbl_transaction_detail` (
  `detail_id` int(255) NOT NULL,
  `transaction_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `option` text NOT NULL,
  `quantity` int(255) NOT NULL,
  `price` float(20,0) NOT NULL,
  `sub_total` float(20,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user`
--

CREATE TABLE IF NOT EXISTS `tbl_user` (
  `ID` mediumint(8) unsigned NOT NULL,
  `username` varchar(75) NOT NULL,
  `group` varchar(50) NOT NULL,
  `password` varchar(75) NOT NULL,
  `email` varchar(254) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `last_login` datetime NOT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tbl_user`
--

INSERT INTO `tbl_user` (`ID`, `username`, `group`, `password`, `email`, `activation_code`, `created_on`, `last_login`, `active`) VALUES
(25, 'nero', 'admin', 'admin', 'admin@ilmuwebsite.com', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user_detail`
--

CREATE TABLE IF NOT EXISTS `tbl_user_detail` (
  `user_detail_ID` mediumint(8) unsigned NOT NULL,
  `user_id` mediumint(8) unsigned DEFAULT NULL,
  `nama_depan` varchar(50) DEFAULT NULL,
  `nama_belakang` varchar(50) DEFAULT NULL,
  `jenis_kelamin` varchar(50) NOT NULL,
  `tempat_lahir` varchar(75) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `handphone` varchar(75) NOT NULL,
  `telephone` varchar(75) NOT NULL,
  `alamat` text NOT NULL,
  `kota` varchar(255) NOT NULL,
  `kecamatan` varchar(255) NOT NULL,
  `provinsi` varchar(255) NOT NULL,
  `kodepos` varchar(255) NOT NULL,
  `profil_picture` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_visitor_logs`
--

CREATE TABLE IF NOT EXISTS `tbl_visitor_logs` (
  `visitor_ID` bigint(100) unsigned NOT NULL,
  `visitor_IP` varchar(15) NOT NULL DEFAULT '',
  `visitor_referer` varchar(255) NOT NULL DEFAULT '',
  `visitor_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `visitor_agent` varchar(255) DEFAULT NULL,
  `visitor_session` varchar(255) NOT NULL,
  `visitor_city` varchar(90) NOT NULL,
  `visitor_region` varchar(90) NOT NULL,
  `visitor_country` varchar(90) NOT NULL,
  `visitor_os` varchar(255) NOT NULL,
  `visitor_browser` varchar(255) NOT NULL,
  `visitor_isp` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`category_ID`);

--
-- Indexes for table `tbl_comment`
--
ALTER TABLE `tbl_comment`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`,`comment_author`);

--
-- Indexes for table `tbl_confirmation`
--
ALTER TABLE `tbl_confirmation`
  ADD PRIMARY KEY (`confirm_id`),
  ADD KEY `transaction_id` (`transaction_id`);

--
-- Indexes for table `tbl_options`
--
ALTER TABLE `tbl_options`
  ADD PRIMARY KEY (`option_id`);

--
-- Indexes for table `tbl_post`
--
ALTER TABLE `tbl_post`
  ADD PRIMARY KEY (`post_ID`),
  ADD KEY `post_author` (`post_author`);

--
-- Indexes for table `tbl_sessions`
--
ALTER TABLE `tbl_sessions`
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `tbl_shipping`
--
ALTER TABLE `tbl_shipping`
  ADD PRIMARY KEY (`shipping_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `transaction_id` (`transaction_id`);

--
-- Indexes for table `tbl_tarif_jne`
--
ALTER TABLE `tbl_tarif_jne`
  ADD PRIMARY KEY (`tarif_id`);

--
-- Indexes for table `tbl_template`
--
ALTER TABLE `tbl_template`
  ADD PRIMARY KEY (`template_id`);

--
-- Indexes for table `tbl_transaction`
--
ALTER TABLE `tbl_transaction`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Indexes for table `tbl_transaction_detail`
--
ALTER TABLE `tbl_transaction_detail`
  ADD PRIMARY KEY (`detail_id`),
  ADD KEY `transaction_id` (`transaction_id`,`product_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbl_user_detail`
--
ALTER TABLE `tbl_user_detail`
  ADD PRIMARY KEY (`user_detail_ID`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_visitor_logs`
--
ALTER TABLE `tbl_visitor_logs`
  ADD PRIMARY KEY (`visitor_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `category_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_comment`
--
ALTER TABLE `tbl_comment`
  MODIFY `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_confirmation`
--
ALTER TABLE `tbl_confirmation`
  MODIFY `confirm_id` bigint(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_options`
--
ALTER TABLE `tbl_options`
  MODIFY `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_post`
--
ALTER TABLE `tbl_post`
  MODIFY `post_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_shipping`
--
ALTER TABLE `tbl_shipping`
  MODIFY `shipping_id` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_tarif_jne`
--
ALTER TABLE `tbl_tarif_jne`
  MODIFY `tarif_id` int(255) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5576;
--
-- AUTO_INCREMENT for table `tbl_template`
--
ALTER TABLE `tbl_template`
  MODIFY `template_id` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_transaction`
--
ALTER TABLE `tbl_transaction`
  MODIFY `transaction_id` bigint(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_transaction_detail`
--
ALTER TABLE `tbl_transaction_detail`
  MODIFY `detail_id` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `ID` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `tbl_user_detail`
--
ALTER TABLE `tbl_user_detail`
  MODIFY `user_detail_ID` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_visitor_logs`
--
ALTER TABLE `tbl_visitor_logs`
  MODIFY `visitor_ID` bigint(100) unsigned NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

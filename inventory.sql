-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Feb 2021 pada 06.28
-- Versi server: 10.4.13-MariaDB
-- Versi PHP: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `form_po`
--

CREATE TABLE `form_po` (
  `id_po` int(50) NOT NULL,
  `id_pr` int(30) NOT NULL,
  `supplier_name` varchar(80) NOT NULL,
  `supplier_code` varchar(30) NOT NULL,
  `on_hand` varchar(30) NOT NULL,
  `in_transit` varchar(30) NOT NULL,
  `on_prep` varchar(30) NOT NULL,
  `moq` varchar(30) NOT NULL,
  `cost` varchar(100) NOT NULL,
  `po_code` varchar(30) NOT NULL,
  `po_date` date NOT NULL,
  `batch_code` varchar(30) NOT NULL,
  `dwg_code` varchar(30) NOT NULL,
  `iqa_code` varchar(30) NOT NULL,
  `status_po` enum('waiting','approve','rejected','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `form_po`
--

INSERT INTO `form_po` (`id_po`, `id_pr`, `supplier_name`, `supplier_code`, `on_hand`, `in_transit`, `on_prep`, `moq`, `cost`, `po_code`, `po_date`, `batch_code`, `dwg_code`, `iqa_code`, `status_po`) VALUES
(1, 2, 'PT.HONG CEK', '0129876', '99', '98', '99', '1', '8000000', 'PO20109093', '2021-02-06', '09877', '097988', '98877', 'approve'),
(2, 1, 'PT.SOLDER INDONESIA', '09876098', '99', '98', '100', '098', '90000000', '21312321', '2021-02-16', '09877', '097988', '131', 'waiting');

-- --------------------------------------------------------

--
-- Struktur dari tabel `form_pr`
--

CREATE TABLE `form_pr` (
  `id_pr` int(50) NOT NULL,
  `kode_pr` varchar(20) NOT NULL,
  `item_name` varchar(80) NOT NULL,
  `type` varchar(20) NOT NULL,
  `quantity` varchar(30) NOT NULL,
  `item_description` varchar(100) NOT NULL,
  `part_number` varchar(50) NOT NULL,
  `cost_center` enum('10','20','30','40') NOT NULL,
  `pr_date` date NOT NULL,
  `account_code` varchar(30) NOT NULL,
  `status` enum('waiting','approve','rejected','') NOT NULL,
  `requestor` varchar(30) NOT NULL,
  `update_po` enum('0','1','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `form_pr`
--

INSERT INTO `form_pr` (`id_pr`, `kode_pr`, `item_name`, `type`, `quantity`, `item_description`, `part_number`, `cost_center`, `pr_date`, `account_code`, `status`, `requestor`, `update_po`) VALUES
(1, 'PR00001', 'AIR FILTER', 'PN.88290014-486', '100', 'AIR FILTER\r\n', 'GN02288022', '40', '2021-02-01', '4010001', 'approve', 'anderson', '1'),
(2, 'PR00002', '\"LED street light shark series SL-0503M-O 80W, ±9000lm, 4000K, 24VDC/220VAC\"', ' SL-0503M-O 80W, ±90', '5', '\"LED street light shark series SL-0503M-O\r\n80W, ±9000lm, 4000K, 24VDC/220VAC\"\r\n', 'GN02805027', '40', '2021-02-05', '4010001', 'approve', 'anderson', '1'),
(3, 'PR00003', '60 I/HR RO cartridge (ELGA-Consumables)', 'LC136M2', '4', '\"LC136 Mark 2-composite vent folter (ELGA-\r\nConsumables)\"\r\n', 'GN01313013', '40', '2021-02-05', '4010001', 'rejected', 'axel agatha ibrahim', '0'),
(4, 'PR00004', 'Sandal ', '', '44', 'Sandal No. 44/45\r\n', 'GN04344042', '40', '2021-02-06', '4020001', 'rejected', 'axel agatha ibrahim', '0'),
(5, 'PR00004', 'Baju ESD (smock) uk.L', '', '33', 'Baju ESD (smock) uk.L\r\n', 'GN04700046', '40', '2021-02-06', '4020001', 'waiting', 'axel agatha ibrahim', '0'),
(6, 'PR00006', 'CS liquid conducting solution', 'code : X6762000', '22', 'CS liquid conducting solution\r\n', 'GN00467072', '30', '2021-02-08', '3010001', 'approve', 'axel agatha ibrahim', '0');

-- --------------------------------------------------------

--
-- Struktur dari tabel `inventory-admin`
--

CREATE TABLE `inventory-admin` (
  `part_number` varchar(50) NOT NULL,
  `item` varchar(50) NOT NULL,
  `supplier#` varchar(50) NOT NULL,
  `cc` varchar(50) NOT NULL,
  `account_code` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `supplier` varchar(50) NOT NULL,
  `dwg#` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `moq` varchar(50) NOT NULL,
  `cost` varchar(50) NOT NULL,
  `on_hand` varchar(50) NOT NULL,
  `in_transit` varchar(50) NOT NULL,
  `on_prep` varchar(50) NOT NULL,
  `on_pr#` varchar(50) NOT NULL,
  `on_po#` varchar(50) NOT NULL,
  `batch#` varchar(50) NOT NULL,
  `iqa` varchar(50) NOT NULL,
  `received_date` date NOT NULL,
  `manufacturing_date` date NOT NULL,
  `expiration_date` date NOT NULL,
  `po_date` date NOT NULL,
  `pr_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `inventory-admin`
--

INSERT INTO `inventory-admin` (`part_number`, `item`, `supplier#`, `cc`, `account_code`, `type`, `supplier`, `dwg#`, `description`, `moq`, `cost`, `on_hand`, `in_transit`, `on_prep`, `on_pr#`, `on_po#`, `batch#`, `iqa`, `received_date`, `manufacturing_date`, `expiration_date`, `po_date`, `pr_date`) VALUES
('DM00000025', 'Magazine lead frame', 'N/A', '30', '3010001', 'N/A', 'PT. Farsawa', 'N/A', 'N/A', '6', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('DM00000026', 'Silver epoxy', 'N/A', '30', '3010001', 'Conductive', 'PT. Pilar Mas', 'N/A', 'N/A', '15', 'N/A', '15', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('DM00000028', 'Silver epoxy', 'N/A', '30', '3010001', 'epoxy uv', 'PT. Pilar Mas', 'N/A', 'N/A', '75', 'N/A', '74', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('DM00000031', 'Mold Comp', 'N/A', '30', '3010001', 'Green', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('DM00000032', 'Solder Anode', 'N/A', '30', '3010001', 'Bar/Ball', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('DM00000033', 'Ball', 'N/A', '30', '3010001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('DM00000034', 'Daisy chain', 'N/A', '30', '3010001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('DM00000035', 'Bondable mirror', 'N/A', '30', '3010001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('DM00000036', 'Chip', 'N/A', '30', '3010001', 'N/A', 'CV. ATB', 'N/A', 'N/A', '492000', 'N/A', '492000', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('DM00000037', 'PCB A4', 'N/A', '30', '3010001', 'N/A', 'CV. ATB', 'N/A', 'N/A', '50', 'N/A', '50', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('DM00000038', 'Dummy wafer', 'N/A', '30', '3010001', 'N/A', 'CV. ATB', 'N/A', 'N/A', '10', 'N/A', '10', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('DM00000042', 'PVC', 'N/A', '40', '4010001', 'N/A', 'PT. NIKKO', 'N/A', 'N/A', '400', 'N/A', '400', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('DM00000043', 'Substrate COB', 'N/A', '40', '4010001', 'N/A', 'PT ATB', 'N/A', 'N/A', '6000', 'N/A', '6000', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('DM00002023', 'bondable wafer', 'N/A', '30', '3010001', 'WAFER RFID LOT#DH0257', 'N/A', 'N/A', 'BINDABLE WAFER RFID D/C QTY 82000', '6', 'N/A', '5', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('DM00004022', 'blue tape', 'N/A', '30', '3010001', 'CCFMIC 4N7F +10 -1', 'N/A', 'N/A', 'CCFMIC 4N7F +10 -1', '2', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('DM00008027', 'Silver epoxy', 'N/A', '30', '3010001', 'epoxy glob top 088LAE9739', 'PT. Pilar Mas', 'N/A', 'ABLESTIK 84-1LMISR4', '75', 'N/A', '74', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('DM00010029', 'Gold Wire', 'N/A', '30', '3010001', 'Gold Wire 1.0 mm HER-AU WIRE-02', 'PT. Nikko', 'N/A', 'MATL : AW14 EL:2-6% BL:8-13G LF/SPL:500M', '15', 'N/A', '14', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('DM00010039', 'Macuspec', 'N/A', '40', '4010001', 'Macuspec MP 100 Make-up', 'PT. Nikko', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('DM00010040', 'Macuspec', 'N/A', '40', '4010001', 'Macuspec MP 100 wetter', 'PT. Nikko', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('DM00010041', 'Macuspec', 'N/A', '40', '4010001', 'Macuspec MP 100 Brightner', 'PT. Nikko', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('DM00013030', 'Gold wire', 'N/A', '30', '3010001', 'Gold Wire 1.3 mm', 'PT. Nikko', 'N/A', 'N/A', '5', 'N/A', '4', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('DM00088024', 'Komponen elektronik arduino (88 modul)', 'N/A', '30', '3010001', '88 MODUL', 'PT. Nikko', 'N/A', 'N/A', '4', 'N/A', '4', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('DM00108012', 'CHIP RESISTOR 0805 0R Ohm', 'N/A', '20', '2010001', '0805 0R Ohm', 'PT.PROFIX INSPIRA', 'N/A', 'CHIP RESISTOR 0805 0R Ohm', '2500', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('DM00205013', 'CHIP RESISTOR 0603 15K Ohm', 'N/A', '20', '2010001', '0603 15K Ohm', 'PT.PROFIX INSPIRA', 'N/A', 'CHIP RESISTOR 0603 15K Ohm', '3000', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('DM00306014', 'CHIP RESISTOR 0603 0R Ohm', 'N/A', '20', '2010001', '0603 0R Ohm', 'PT.PROFIX INSPIRA', 'N/A', 'CHIP RESISTOR 0603 0R Ohm', '3900', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('DM00700015', 'MODUL CASING (THERMOPLASTIC MOLDED)', 'N/A', '20', '2010001', 'N/A', 'PT. Tata Sarana Mandiri', 'N/A', 'N/A', '250', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('DM00800016', 'MODUL PCB (PRINTED CIRCUITS BOARD)', 'N/A', '20', '2010001', 'N/A', 'PT. Tata Sarana Mandiri', 'N/A', 'N/A', '250', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('DM00900017', 'MODUL COMPONENT', 'N/A', '20', '2010001', 'N/A', 'PT.Tata Sarana Mandiri', 'N/A', 'N/A', '250', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('DM01063018', 'SOLDER PASTE Sn 63%/Pb 37%', 'N/A', '20', '2010001', 'Sn 63%/Pb 37%', 'PT.SOLDER INDONESIA', 'N/A', 'SOLDER PASTE Sn 63%/Pb 37%', '1', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('DM01163019', 'SOLDER BAR Sn 63%/Pb37%', 'N/A', '20', '2010001', 'Sn 63%/Pb37%', 'PT. FANINDO CHIPTRONIC', 'N/A', 'SOLDER BAR Sn 63%/Pb37%', '150', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('DM01200020', 'SOLDER FLUX', 'N/A', '20', '2010001', 'N/A', 'PT.FANINDO CHIPTRONIC', 'N/A', 'N/A', '18', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('DM01300021', 'METAL MASK/SOLDER PASTE STENCIL', 'N/A', '20', '2010001', 'N/A', 'PT.ADVANCE CIRCUITS DCI', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('DM03506001', 'WAFER', 'N/A', '30', '3010001', '6\" DUMMY WAFER 82000', 'N/A', 'N/A', '6\" DUMMY WAFER 82000', '0', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('DM03600002', 'EPOXY MOLDING COMPOUND', 'N/A', '30', '3010001', 'N/A', 'N/A', 'N/A', 'N/A', '0', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('DM04801044', 'PC COPPER PLATING SOLUTION (PT0176)', 'N/A', '10', '1010001', 'PT0176', 'PCB GRAPHTECH PTE LTD', 'N/A', 'PC COPPER PLATING SOLUTION (PT0176)', '', 'N/A', '11', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('DM04900011', 'PCB LEMBARAN (KOSONG)', 'N/A', '10', '1010001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('DM05112003', 'Wafer MTF128G08CBECBL95B3WC1', 'N/A', '30', '3010001', 'Wafer MTF128G08CBECBL95B3WC1', 'PT. NESYER ELECTRONICS', 'N/A', 'Wafer MTF128G08CBECBL95B3WC1', '291', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('DM05260004', 'Syringe Silver Epoxy 5cc', 'N/A', '30', '3010001', 'FP-6001S', 'MILLICE', 'N/A', 'Syringe Silver Epoxy 5cc', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('DM05407006', 'Solder Paste SCS7 (Sn/Cu 0,7%/SiO 02%)', 'N/A', '30', '3010001', 'SCS7 (Sn/Cu 0,7%/SiO 02%)', 'PT. FANINDO CHIPTRONIC', 'N/A', 'Solder Paste SCS7 (Sn/Cu 0,7%/SiO 02%)', '5', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('DM05450045', 'SOLDER MASK DRY FILM TYPE KM 5030\n(03000051)', 'N/A', '10', '1010001', 'KM5030 03000051', 'PCB GRAPHTECH PTE LTD', 'N/A', 'SOLDER MASK DRY FILM TYPE KM 5030\n(03000051)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('DM05599007', 'Solder Paste Sn 99%/Ag 3%/Cu 0,7%)', 'N/A', '30', '3010001', '99%/Ag 3%/Cu 0,7%)', 'PT.SOLDER INDONESIA', 'N/A', 'Solder Paste Sn 99%/Ag 3%/Cu 0,7%)', '1', 'N/A', '2', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('DM05607008', 'Solder Bar Sn-R/Cu 0,7%/Ni/P', 'N/A', '30', '3010001', 'Sn-R/Cu 0,7%/Ni/P', 'PT.SOLDER INDONESIA', 'N/A', 'Solder Bar Sn-R/Cu 0,7%/Ni/P', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('DM05896009', 'Solder Paste Sn 96,5%/Ag 3%/Cu 0,5%', 'N/A', '30', '3010001', 'Sn 96,5%/Ag 3%/Cu 0,5%', 'PT.SOLDER INDONESIA', 'N/A', 'Solder Paste Sn 96,5%/Ag 3%/Cu 0,5%', '20', 'N/A', '20', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('DM05999010', 'Solder Paste Sn 99%/Ag 0,3%/Cu 0,7%', 'N/A', '30', '3010001', 'Sn 99%/Ag 0,3%/Cu 0,7%', 'PT.SOLDER INDONESIA', 'N/A', 'Solder Paste Sn 99%/Ag 0,3%/Cu 0,7%', '1', 'N/A', '38', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('DM06012005', 'Gold Wire 1.25mils', 'N/A', '30', '3010001', '1.25MILS', 'HERAEUS', 'N/A', 'Gold Wire 1.25mils', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('DM07600046', 'Solder mask film (general)', 'N/A', '10', '1010001', 'N/A', 'N/A', 'N/A', 'Solder mask film (general)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('DM09710047', 'SOLDER RESIST INK UM-1000 (WHITE)', 'N/A', '10', '1010001', 'UM-1000', 'PCB GRAPHTECH PTE LTD', 'N/A', 'SOLDER RESIST INK UM-1000 (WHITE)', '', 'N/A', '5', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000233', 'Sand paper', 'N/A', '20', '2010001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000234', 'Melamine rubber', 'N/A', '20', '2010001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000235', 'Wax rubber', 'N/A', '20', '2010001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000236', 'Electroclean', 'N/A', '20', '2010001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000237', 'Descaler', 'N/A', '20', '2010001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000238', 'Plating', 'N/A', '20', '2010001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000239', 'Flux', 'N/A', '20', '2010001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000242', 'Sticky mat', 'N/A', '40', '4020001', 'N/A', 'PT. Nikko', 'N/A', 'sticky mat size 26\"x45\" clour blue', '200', 'N/A', '200', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000243', 'Finget coat', 'N/A', '40', '4010001', 'N/A', 'PT. Nikko', 'N/A', 'N/A', '150', 'N/A', '144', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000244', 'Gloves', 'N/A', '40', '4010001', 'N/A', 'PT. Nikko', 'N/A', 'N/A', '80', 'N/A', '64', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000245', 'Capillary', 'N/A', '30', '3010001', 'N/A', 'CV. ATB', 'N/A', 'N/A', '300', 'N/A', '299', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000246', 'Dicing blade', 'N/A', '30', '3010001', 'N/A', 'CV. ATB', 'N/A', 'N/A', '60', 'N/A', '50', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000247', 'Unplugger', 'N/A', '40', '4010001', 'N/A', 'CV. ATB', 'N/A', 'N/A', '50', 'N/A', '60', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000248', 'Sodium Hidroxide', 'N/A', '40', '4010001', 'N/A', 'PT. Nikko', 'N/A', 'N/A', '3', 'N/A', '3', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000249', 'UV Lamp DI Water', 'N/A', '40', '4010001', 'N/A', 'PT. Pilar Mas', 'N/A', 'N/A', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000250', 'Hepa Filter CW Aluminium', 'N/A', '40', '4010001', 'N/A', 'PT. Pilar Mas', 'N/A', 'N/A', '20', 'N/A', '20', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000251', 'Nitrogen cair', 'N/A', '40', '4010001', 'N/A', 'PT. Soxal', 'N/A', 'N/A', '28', 'N/A', '20', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000252', 'PVC', 'N/A', '40', '4010001', 'N/A', 'PT. Nikko', 'N/A', 'N/A', '400', 'N/A', '400', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000253', 'Substrate ', 'N/A', '40', '4010001', 'COB', 'CV. ATB', 'N/A', 'N/A', '6000', 'N/A', '5990', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000254', 'Blackhole ', 'N/A', '40', '4010001', 'Blackhole Microclean', 'PT. Nikko', 'N/A', 'N/A', '1', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000255', 'PC Acid copper plating solution', 'N/A', '40', '4010001', 'N/A', 'PT. Nikko', 'N/A', 'N/A', '1', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000256', 'Sodium Hidroxide', 'N/A', '40', '4010001', 'N/A', 'PT. NIKKO', 'N/A', 'N/A', '3', 'N/A', '3', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000257', 'UV Lamp DI Water', 'N/A', '40', '4010001', 'N/A', 'PT. Pilar Mas', 'N/A', 'N/A', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000258', 'Hepa Filter CW Aluminium', 'N/A', '40', '4010001', 'N/A', 'PT. Pilar Mas', 'N/A', 'N/A', '20', 'N/A', '20', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000259', 'Nitrogen cair', 'N/A', '40', '4010001', 'N/A', 'PT. Soxal', 'N/A', 'N/A', '28', 'N/A', '20', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000260', 'CCD MW', 'N/A', '10', '1020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000262', 'IN LINE AIR DRYER', 'N/A', '10', '1020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000263', 'Through-Hole Elating Line', 'N/A', '10', '1020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000265', 'Black Oxide OSP Machine I', 'N/A', '10', '1020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000266', 'DRY LAMINATING', 'N/A', '10', '1020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000267', 'PHOTOPLOTTER', 'N/A', '10', '1020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000268', 'AKTINA S', 'N/A', '10', '1020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000269', 'WALTER LEMMEN I ETTCHING CENTER', 'N/A', '10', '1020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000270', 'FILM SCREEN PRINTER', 'N/A', '10', '1020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000271', 'Print screen', 'N/A', '10', '1020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000272', 'Auto Megazine Loader ', 'N/A', '20', '2020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000273', 'Multi Connection Conveyor', 'N/A', '20', '2020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000274', 'Lead Free Soldering Machine', 'N/A', '20', '2020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000275', 'Offline Automatic Optic Inspection (AOI)', 'N/A', '20', '2020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000276', 'PCB Moving Probe Tester', 'N/A', '20', '2020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000277', 'Nonstop Tray Feeder', 'N/A', '20', '2020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000278', 'Megazine Unloader', 'N/A', '20', '2020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000279', 'Uploader', 'N/A', '20', '2020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000280', 'Solder Paste Printer', 'N/A', '20', '2020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000281', 'Pick and Place', 'N/A', '20', '2020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000282', 'reflow oven', 'N/A', '20', '2020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000283', 'Downloader', 'N/A', '20', '2020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000284', 'Automatic optical Inspection', 'N/A', '20', '2020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000285', 'wave solder', 'N/A', '20', '2020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000286', 'High Performance Air Flow Oven', 'N/A', '20', '2020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000290', 'Deflashing & Tin Plating System', 'N/A', '30', '3020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000292', 'De-Junk, Trim, Form & Singulation', 'N/A', '30', '3020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000293', 'IC Molding Fico MMS-i', 'N/A', '30', '3020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000295', 'PC Phenom Pro X', 'N/A', '30', '3020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000296', 'Picking System', 'N/A', '30', '3020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00000298', 'Zonke Equipment (Automatic Die Bonder)', 'N/A', '30', '3020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00010241', 'Tray', 'N/A', '20', '2010001', 'TRAY 100LQFP ISI 90', 'N/A', 'N/A', 'TRAY 100LQFP ISI 90', 'N/A', 'N/A', '16', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00023240', 'Resin Blade ', 'N/A', '20', '2010001', 'HUBLESS TYPE BLADE SDC230-R100NMR', 'ACCRETECH TOKYO SEIMITSU CO.LTD', 'N/A', 'RESIN BLADE HUBLESS TYPE BLADE OD 55.220D ID40.000H TICKNESS 0.52T', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00030261', 'BRUSHING RMB 300', 'N/A', '10', '1020001', 'RMB300', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00035232', 'Metal blade', 'N/A', '20', '2010001', 'HUB TYPE BLADE SPEC CCBR352576', 'ACCRETECH TOKYO SEIMITSU CO.LTD', 'N/A', 'METAL BLADE HIGH TEMP  KERF WIDTH 0.025 T EXPOSURE 0.760 L', 'N/A', 'N/A', '6', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00035297', 'Royce DE35-st Semi Automatic Die Handler', 'N/A', '30', '3020001', 'DE-35-st', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00040264', 'OVEN UFB 400', 'N/A', '10', '1020001', 'UFB 400', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00047291', 'Drying Oven VWR 47746-712', 'N/A', '30', '3020001', 'VWR 47746-712', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00071288', 'ADT (Advance Dicing Technologies) 7100', 'N/A', '30', '3020001', '7100', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00090294', ' Measure Scope KY-90', 'N/A', '30', '3020001', 'KY-90', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00096289', 'ADT (Advance Dicing Technologies) WM - 966', 'N/A', '30', '3020001', 'WM-966', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00097287', 'ADT (Advance Dicing Technologies) 977', 'N/A', '30', '3020001', '977', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00100001', 'Kain screen', 'N/A', '40', '4010001', 'N/A', 'N/A', 'N/A', 'Kain screen', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00100069', 'ACETON', 'N/A', '30', '3010001', 'Teknis', 'PT. Prochem Tritama', 'N/A', 'ACETON', '1', 'N/A', '18', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00100112', 'ACETIC ACID', 'N/A', '10', '1010001', 'N/A', 'N/A', 'N/A', 'ACETIC ACID', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00200002', 'Tong plastik limbah', 'N/A', '40', '4010001', 'N/A', 'N/A', 'N/A', 'Tong plastik limbah', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00200113', 'AMONIA', 'N/A', '10', '1010001', 'N/A', 'N/A', 'N/A', 'AMONIA', '', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00231070', 'ADDITIVE S-1', 'N/A', '30', '3010001', 'code 318000', 'TECHNIC ASIA PACIFIC PTE LTD', 'N/A', 'ADDITIVE S-1', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00304003', 'FC840 VBLUE 1KG (3D PRINTER STRATASYS-\nPOLYJET OBJ', 'N/A', '40', '4020001', 'OBJ-04034', 'PT.HONG CEK', 'N/A', 'FC840 VBLUE 1KG (3D PRINTER STRATASYS-\nPOLYJET OBJECT30)', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00312071', 'CAPILLARY', 'N/A', '30', '3020001', '1.2-1.3STD3.9-6.0', 'DOU YEE', 'N/A', 'CAPILLARY', '60', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00317114', 'BLACKHOLE ACID CLEANER 717 (P175032)', 'N/A', '10', '1010001', 'P175032', 'PCB GRAPHTECH PTE LTD', 'N/A', 'BLACKHOLE ACID CLEANER 717 (P175032)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00400229', 'CCCFMIC 1N0F +5% -5%', 'N/A', '20', '2010001', 'PHOTOGRAPHIC FILM', 'PT.PROFIX INSPIRA', 'N/A', 'PHOTOGRAPHIC FILM', '2800', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00404004', 'FC705 SUPPORT RESIN 1KG (3D PRINTER STRATAYS-POLYJ', 'N/A', '40', '4020001', 'OBJ-04020', 'PT.HONG CEK', 'N/A', 'FC705 SUPPORT RESIN 1KG (3D PRINTER\nSTRATAYS-POLYJET OBJECT30)', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00411115', 'BLACKHOLE ANTI TARNISH (P115711)', 'N/A', '10', '1010001', 'P115711', 'PCB GRAPHTECH PTE LTD', 'N/A', 'BLACKHOLE ANTI TARNISH (P115711)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00467072', 'CS liquid conducting solution', 'N/A', '30', '3010001', 'code : X6762000', 'TECHNIC ASIA PACIFIC PTE LT', 'N/A', 'CS liquid conducting solution', '5', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00500073', 'DAISY TEST WAFER', 'N/A', '30', '3010001', 'N/A', 'N/A', 'N/A', 'DAISY TEST WAFER', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00501230', 'CL21C150JBNC', 'N/A', '20', '2010001', 'CCCFMIC 1N0F +5% -5%', 'PT.PROFIX INSPIRA', 'N/A', 'CCCFMIC 1N0F +5% -5%', '2000', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00511116', 'BLACKHOLE CLEANER ESP A(P115743)', 'N/A', '10', '1010001', 'P115743', 'PT NIKKO', 'N/A', 'BLACKHOLE CLEANER ESP A(P115743)', '1', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00517005', 'PROTEK L1 PRE-TREAT/DI WATER GENERATOR \"ELGA\" CONS', 'N/A', '40', '4010001', 'LC175', 'CHEMOSIENCE INDONESIA', 'N/A', 'PROTEK L1 PRE-TREAT/DI WATER\nGENERATOR \"ELGA\" CONSUMABLES', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00611117', 'BLACKHOLE CLEANER ESP B (P115744)', 'N/A', '10', '1010001', 'P115744', 'PT NIKKO', 'N/A', 'BLACKHOLE CLEANER ESP B (P115744)', '1', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00620006', 'Filter 0,2 MIC 10\" pleat LC204', 'N/A', '40', '4020001', 'LC204', 'CHEMOSIENCE INDONESIA', 'N/A', 'Filter 0,2 MIC 10\" pleat LC204', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00621231', 'CCFMIC 4N7F +10 -1', 'N/A', '20', '2010001', 'CL21C150JBNC', 'PT.PROFIX INSPIRA', 'N/A', 'CL21C150JBNC', '2800', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00700074', 'DIE TIP LARGE AREA', 'N/A', '30', '3010001', 'N/A', 'N/A', 'N/A', 'DIE TIP LARGE AREA', '', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00711118', 'BH MICROCLEAN 1 @@ (P115702)', 'N/A', '10', '1010001', 'P115702', 'PCB GRAPHTECH PTE LTD', 'N/A', 'BH MICROCLEAN 1 @@ (P115702)', '', 'N/A', '25', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00717007', 'Protek L2 Pre-treat cartrigde (ELGA- Consumables)', 'N/A', '40', '4010001', 'LC177', 'CHEMOSIENCE INDONESIA', 'N/A', 'Protek L2 Pre-treat cartrigde (ELGA-\nConsumables)', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00800008', 'Alkohol (Ethanol) Teknis', 'N/A', '40', '4010001', 'N/A', 'N/A', 'N/A', 'Alkohol (Ethanol) Teknis', '', 'N/A', '17', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00800075', 'EP1 SCREEN GLOSS VYNIL', 'N/A', '30', '3010001', 'N/A', 'N/A', 'N/A', 'EP1 SCREEN GLOSS VYNIL', '', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00811119', 'BLACKHOLE (TM) SP REPLENISHER (P115746)', 'N/A', '10', '1010001', 'P115746', 'PT. Nikko', 'N/A', 'BLACKHOLE (TM) SP REPLENISHER (P115746)', '1', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00911120', 'BLACKHOLE SP STARTER (P115735)', 'N/A', '10', '1010001', 'P115735', 'PT NIKKO', 'N/A', 'BLACKHOLE SP STARTER (P115735)', '1', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN00918009', 'Module degasser E-cartridge (ELGA- Consumables)', 'N/A', '40', '4010001', 'LC181', 'CHEMOSIENCE INDONESIA', 'N/A', 'Module degasser E-cartridge (ELGA-\nConsumables)', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN01000121', 'COPPER SULFAT PENTAHYDRATE', 'N/A', '10', '1010001', 'N/A', 'PROCHEM TRITAMA', 'N/A', 'COPPER SULFAT PENTAHYDRATE', '20', 'N/A', '20', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN01018010', 'Purification pack-purelab (ELGA- Consumables)', 'N/A', '40', '4010001', 'LC187', 'CHEMOSIENCE INDONESIA', 'N/A', 'Purification pack-purelab (ELGA-\nConsumables)', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN01100122', 'DEVELOPER REPLENISHER (FUJIFILM)', 'N/A', '10', '1010001', 'N/A', 'SARKARA INTI UTAMA', 'N/A', 'DEVELOPER REPLENISHER (FUJIFILM)', '', 'N/A', '13', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN01101011', 'Chemical elgalite CT1 tablets (ELGA- Consumables)', 'N/A', '40', '4010001', 'CT1', 'CHEMOSIENCE INDONESIA', 'N/A', 'Chemical elgalite CT1 tablets (ELGA-\nConsumables)', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN01102076', 'JM 6000 MAKE UP', 'N/A', '30', '3010001', 'MC0282L', 'TECHNIC ASIA PACIFIC PTE LTD', 'N/A', 'JM 6000 MAKE UP', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN01211012', 'UV lamp for maxima HPLC (ELGA- Consumables)UV lamp', 'N/A', '40', '4010001', 'LC118', 'CHEMOSIENCE INDONESIA', 'N/A', 'UV lamp for maxima HPLC (ELGA- Consumables)UV lamp for maxima HPLC\n(ELGA-Consumables)', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN01217123', 'ELIMINATOR II MAKE UP (SP179212)', 'N/A', '10', '1010001', 'SP179212', 'PCB GRAPHTECH PTE LTD', 'N/A', 'ELIMINATOR II MAKE UP (SP179212)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN01260077', 'JM 6000 SOLUTION', 'N/A', '30', '3010001', 'JM 6000 SOLUTION', 'TECHNIC ASIA PACIFIC PTE LTD', 'N/A', 'JM 6000 SOLUTION', '', 'N/A', '5', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN01300124', 'FERRIC CHLORIDE (FeCl3) PA', 'N/A', '10', '1010001', 'N/A', 'NIKKO INDONESIA', 'N/A', 'FERRIC CHLORIDE (FeCl3) PA', '', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN01313013', 'LC136 Mark 2-composite vent folter (ELGA-Consumabl', 'N/A', '40', '4010001', 'LC136M2', 'CHEMOSIENCE INDONESIA', 'N/A', 'LC136 Mark 2-composite vent folter (ELGA-\nConsumables)', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN01400078', 'NF ACID 10%', 'N/A', '30', '3010001', 'MC00751', 'TECHNIC ASIA PACIFIC PTE LTD', 'N/A', 'NF ACID 10%', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN01417125', 'FINAL FINISH ACID CLEANER (P175039)', 'N/A', '10', '1010001', 'P175039', 'PCB GRAPHTECH PTE LTD', 'N/A', 'FINAL FINISH ACID CLEANER (P175039)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN01418014', '60 I/HR RO cartridge (ELGA-Consumables)', 'N/A', '40', '4010001', 'LC180', 'CHEMOSIENCE INDONESIA', 'N/A', '60 I/HR RO cartridge (ELGA-Consumables)', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN01500079', 'HS ADDITIVE', 'N/A', '30', '3010001', 'OTUS$GLS', 'TECHNIC ASIA PACIFIC PTE LTD', 'N/A', 'HS ADDITIVE', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN01510126', 'FIXER FILMSTAR ( 01003101)', 'N/A', '10', '1010001', '1003101', 'PCB GRAPHTECH PTE LTD', 'N/A', 'FIXER FILMSTAR ( 01003101)', '', 'N/A', '55', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN01514015', 'PRE-TREATMENT CARTRIDGE', 'N/A', '40', '4010001', 'LC 140', 'CHEMOSIENCE INDONESIA', 'N/A', 'PRE-TREATMENT CARTRIDGE', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN01600080', 'HS ELECTROLYTE ADDITIVE-50 LB', 'N/A', '30', '3010001', 'OTUS$LBS', 'TECHNIC ASIA PACIFIC PTE LTD', 'N/A', 'HS ELECTROLYTE ADDITIVE-50 LB', '5', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN01614016', 'REVERSE OSMOSIS CARTRIDGE MODULE', 'N/A', '40', '4010001', 'LC 143', 'CHEMOSIENCE INDONESIA', 'N/A', 'REVERSE OSMOSIS CARTRIDGE MODULE', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN01698127', 'ASAM SULFAT (H2SO4) 98% TEKNIS', 'N/A', '10', '1010001', '98%', 'PT.AIK MOH CHEMICALS INDONESIA', 'N/A', 'ASAM SULFAT (H2SO4) 98% TEKNIS', '5', 'N/A', '30', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN01700081', 'OT Gold Replenisher', 'N/A', '30', '3010001', 'N/A', 'N/A', 'N/A', 'OT Gold Replenisher', '50', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN01703017', 'SANIZATIZION TABLETS', 'N/A', '40', '4010001', 'CT3', 'CHEMOSIENCE INDONESIA', 'N/A', 'SANIZATIZION TABLETS', '1', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN01733128', 'ASAM KLORIDA (HCl) 33% TEKNIS', 'N/A', '10', '1010001', '33%', 'PT.AIK MOH CHEMICALS INDONESIA', 'N/A', 'ASAM KLORIDA (HCl) 33% TEKNIS', '5', 'N/A', '20', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN01800082', 'PH + Control ACR', 'N/A', '30', '3010001', 'N/A', 'N/A', 'N/A', 'PH + Control ACR', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN01811129', 'HS ACCU GUARD REPLENISHER (P117019)', 'N/A', '10', '1010001', 'P117019', 'PCB GRAPHTECH PTE LTD', 'N/A', 'HS ACCU GUARD REPLENISHER (P117019)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN01813018', 'COMPOSITE VENT FILTER', 'N/A', '40', '4010001', 'LC 136', 'CHEMOSIENCE INDONESIA', 'N/A', 'COMPOSITE VENT FILTER', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN01900083', 'PH CONTROL', 'N/A', '30', '3010001', 'N/A', 'N/A', 'N/A', 'PH CONTROL', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN01911130', 'HS ACCU GUARD STARTER (P117009)', 'N/A', '10', '1010001', 'P117009', 'PCB GRAPHTECH PTE LTD', 'N/A', 'HS ACCU GUARD STARTER (P117009)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN01912019', 'PRE-TREATMENT FILTER', 'N/A', '40', '4010001', 'LC 123', 'CHEMOSIENCE INDONESIA', 'N/A', 'PRE-TREATMENT FILTER', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN02000020', 'AIR COMPRESSOR \"SULLAIR\" CONSUMABLES', 'N/A', '40', '4010001', 'N/A', 'N/A', 'N/A', 'AIR COMPRESSOR \"SULLAIR\" CONSUMABLES', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN02000084', 'PLATINUM MESH', 'N/A', '30', '3010001', 'N/A', 'N/A', 'N/A', 'PLATINUM MESH', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN02000131', 'ISOPROPIL ALKOHOL (IPA)', 'N/A', '10', '1010001', 'ISOPROPYL ALCOHOL 18LTR/TIN', 'PT AIK MOH CHEMICALS INDONESIA', 'N/A', 'ISOPROPYL ALCOHOL BATCH NO. 1410T015 PACKING 18LTR/TIN', '5', 'N/A', '18', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN02100085', 'Potasium gold cyanide', 'N/A', '30', '3010001', 'N/A', 'N/A', 'N/A', 'Potasium gold cyanide', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN02150132', 'LAMINAR DRY FILM PHOTOPOLYMER 5038 (03000780)\n', 'N/A', '10', '1010001', '5038 3000780', 'PCB GRAPHTECH PTE LTD', 'N/A', 'LAMINAR DRY FILM PHOTOPOLYMER 5038\n(03000780)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN02188021', 'OIL FILTER', 'N/A', '40', '4010001', 'PN.88290014-484', 'PETROTEC AIR POWER', 'N/A', 'OIL FILTER', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN02217133', '#M 79224 ALKALI K (P179224)', 'N/A', '10', '1010001', 'P179224', 'PCB GRAPHTECH PTE LTD', 'N/A', '#M 79224 ALKALI K (P179224)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN02254086', 'Potasium Silver Sianide 54,2%', 'N/A', '30', '3010001', 'Potasium Silver Sianide 54,2%', 'N/A', 'N/A', 'Potasium Silver Sianide 54,2%', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN02288022', 'AIR FILTER', 'N/A', '40', '4010001', 'PN.88290014-486', 'PETROTEC AIR POWER', 'N/A', 'AIR FILTER', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN02303087', 'REDUCER M3', 'N/A', '30', '3010001', 'REDUCER M3', 'N/A', 'N/A', 'REDUCER M3', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN02311134', '#MACUDIZER 9276 (P119276)', 'N/A', '10', '1010001', 'P119276', 'PCB GRAPHTECH PTE LTD', 'N/A', '#MACUDIZER 9276 (P119276)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN02388023', 'SEPARATOR ELEMENT', 'N/A', '40', '4010001', 'PN.88290015-049', 'PETROTEC AIR POWER', 'N/A', 'SEPARATOR ELEMENT', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN02400088', 'RESIN MOLDING COMPOUND', 'N/A', '30', '3010001', 'N/A', 'N/A', 'N/A', 'RESIN MOLDING COMPOUND', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN02411135', 'MACUDIZER 9279 (P119279)', 'N/A', '10', '1010001', 'P119279', 'PCB GRAPHTECH PTE LTD', 'N/A', 'MACUDIZER 9279 (P119279)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN02425024', 'LUBRICANT SULLUBE', 'N/A', '', '4010001', 'PN.250022-669', 'PETROTEC AIR POWER', 'N/A', 'LUBRICANT SULLUBE', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN02517136', 'MACUSPEC MP 100 BRIGHTENER (P172493)', 'N/A', '10', '1010001', 'P172493', 'PCB GRAPHTECH PTE LTD', 'N/A', 'MACUSPEC MP 100 BRIGHTENER (P172493)', '', 'N/A', '20', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN02560089', 'SYNTHETIC RUBBER CLEAN', 'N/A', '30', '3010001', 'C60', 'Amemas SDN', 'N/A', 'SYNTHETIC RUBBER CLEAN', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN02600025', 'Clean room paper', 'N/A', '40', '4010001', 'N/A', 'NIKKO INDONESIA', 'N/A', 'Clean room paper', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN02617137', 'MACUSPEC MP 100 MAKE UP (P172491)', 'N/A', '10', '1010001', 'P172491', 'PCB GRAPHTECH PTE LTD', 'N/A', 'MACUSPEC MP 100 MAKE UP (P172491)', '', 'N/A', '19', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN02680090', 'SYNTHETIC RUBBER WAX', 'N/A', '30', '3010001', 'W80', 'Amemas SDn', 'N/A', 'SYNTHETIC RUBBER WAX', '200', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN02702026', '\"LED street light turtle series SL-0202M-TX-\nDC Mo', 'N/A', '40', '4010001', 'SL-0202M-TX-DC Modular 40W ?5500lm, CCT:4000K, 12/', 'SOLARENS', 'N/A', '\"LED street light turtle series SL-0202M-TX-\nDC Modular 40W ?5500lm, CCT:4000K, 12/24VDC/220VAC\"', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN02705091', 'TECHNI ACT- 909 RTU', 'N/A', '30', '3010001', 'MC0595SL', 'TECHNIC ASIA PACIFIC PTE LTD', 'N/A', 'TECHNI ACT- 909 RTU', '200', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN02717138', 'MACUSPEC MP 100 WETTER (P172492)', 'N/A', '10', '1010001', 'P172492', 'PCB GRAPHTECH PTE LTD', 'N/A', 'MACUSPEC MP 100 WETTER (P172492)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN02805027', 'LED street light shark series SL-0503M-O\n80W, ?900', 'N/A', '', '4010001', ' SL-0503M-O 80W, ?9000lm, 4000K, 24VDC/220VAC', 'SOLARENS', 'N/A', 'LED street light shark series SL-0503M-O\n80W, ?9000lm, 4000K, 24VDC/220VAC', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN02813139', 'MATA BOR 1,3 mm (drill bit)', 'N/A', '10', '1010001', '1.3MM', 'CV G-TECH', 'N/A', 'MATA BOR 1,3 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN02831092', 'Technic Silver EHS Make up-50 LB/DM', 'N/A', '30', '3010001', 'code : 310506', 'TECHNIC ASIA PACIFIC PTE LTD', 'N/A', 'Technic Silver EHS Make up-50 LB/DM', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN02903028', 'LED street light square series SL-0305M-TX 125W, ?', 'N/A', '40', '4010001', ' SL-0305M-TX 125W, ?16250lm, 4000K, 24VDC/220VAC', 'SOLARENS', 'N/A', 'LED street light square series SL-0305M-TX 125W, ?16250lm, 4000K, 24VDC/220VAC', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN02905093', 'TECHNI TSC-1509 RTU', 'N/A', '30', '3010001', 'MC0507L', 'TECHNIC ASIA PACIFIC PTE LTD', 'N/A', 'TECHNI TSC-1509 RTU', '50', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN02915140', 'MATA BOR 1,5 mm (drill bit)', 'N/A', '10', '1010001', '1,5MM', 'CV G-TECH', 'N/A', 'MATA BOR 1,5 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN03018141', 'MATA BOR 1,8 mm (drill bit)', 'N/A', '10', '1010001', '1,8MM', 'CV G-TECH', 'N/A', 'MATA BOR 1,8 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN03020029', 'Philips LED Tube light essential 20 W 1200mm TB', 'N/A', '40', '4010001', '20 W 1200mm TB', 'SOLARENS', 'N/A', 'Philips LED Tube light essential 20 W\n1200mm TB', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN03031094', 'Technic Silver EHS 3R Brightner', 'N/A', '30', '3010001', 'code : 310609', 'TECHNIC ASIA PACIFIC PTE LTD', 'N/A', 'Technic Silver EHS 3R Brightner', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00');
INSERT INTO `inventory-admin` (`part_number`, `item`, `supplier#`, `cc`, `account_code`, `type`, `supplier`, `dwg#`, `description`, `moq`, `cost`, `on_hand`, `in_transit`, `on_prep`, `on_pr#`, `on_po#`, `batch#`, `iqa`, `received_date`, `manufacturing_date`, `expiration_date`, `po_date`, `pr_date`) VALUES
('GN03100030', 'Etanol teknis', 'N/A', '40', '4010001', 'N/A', 'N/A', 'N/A', 'Etanol teknis', '', 'N/A', '18000', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN03120142', 'MATA BOR 2,0 mm (drill bit)', 'N/A', '10', '1010001', '2,0MM', 'CV G-TECH', 'N/A', 'MATA BOR 2,0 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN03131095', 'Technic Silver EHS Additive', 'N/A', '30', '3010001', 'code : 311508', 'TECHNIC ASIA PACIFIC PTE LTD', 'N/A', 'Technic Silver EHS Additive', '5', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN03200096', 'TQFP IC tray', 'N/A', '30', '3010001', 'N/A', 'N/A', 'N/A', 'TQFP IC tray', '5', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN03223031', 'Sepatu ESD ', 'N/A', '40', '4020001', 'Sepatu ESD No. 235', 'N/A', 'N/A', 'Sepatu ESD No. 235', '-', 'N/A', '10', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN03225143', 'MATA BOR 2,5 mm (drill bit)', 'N/A', '10', '1010001', '2,5MM', 'CV G-TECH', 'N/A', 'MATA BOR 2,5 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN03325032', 'Sepatu ESD ', 'N/A', '40', '4020001', 'Sepatu ESD No. 250', 'N/A', 'N/A', 'Sepatu ESD No. 250', '-', 'N/A', '19', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN03330144', 'MATA BOR 3,0 mm (drill bit)', 'N/A', '10', '1010001', '3,0MM', 'CV G-TECH', 'N/A', 'MATA BOR 3,0 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN03400097', 'PURE TIN HULL CELL ANODE (99,92%) Assy', 'N/A', '30', '3010001', 'SP00010A', 'TECHNIC ASIA PACIFIC PTE LTD', 'N/A', 'PURE TIN HULL CELL ANODE (99,92%) Assy', '4', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN03425033', 'Sepatu ESD', 'N/A', '40', '4020001', 'Sepatu ESD No. 255', 'N/A', 'N/A', 'Sepatu ESD No. 255', '-', 'N/A', '5', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN03432145', 'MATA BOR 3,2 mm (drill bit)', 'N/A', '10', '1010001', '3,2MM', 'CV G-TECH', 'N/A', 'MATA BOR 3,2 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN03526034', 'Sepatu ESD ', 'N/A', '40', '4020001', 'Sepatu ESD No. 260', 'N/A', 'N/A', 'Sepatu ESD No. 260', '-', 'N/A', '10', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN03535146', 'MATA BOR 3,5 mm (drill bit)', 'N/A', '10', '1010001', '3,5MM', 'CV G-TECH', 'N/A', 'MATA BOR 3,5 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN03626035', 'Sepatu ESD ', 'N/A', '40', '4020001', 'Sepatu ESD No. 265', 'N/A', 'N/A', 'Sepatu ESD No. 265', '-', 'N/A', '30', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN03640147', 'MATA BOR 4,0 mm (drill bit)', 'N/A', '10', '1010001', '4,0MM', 'CV G-TECH', 'N/A', 'MATA BOR 4,0 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN03710098', 'STRIPPERPLATE', 'N/A', '30', '3010001', 'FCL DAMBAR TOOL #109802', 'ESEC SINGAPORE', 'N/A', 'STRIPPERPLATE', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN03717148', 'M-COAT HT NEUTRALIZER (P179829)', 'N/A', '10', '1010001', 'P179829', 'PCB GRAPHTECH PTE LTD', 'N/A', 'M-COAT HT NEUTRALIZER (P179829)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN03727036', 'Sepatu ESD ', 'N/A', '40', '4020001', 'Sepatu ESD No. 270', 'N/A', 'N/A', 'Sepatu ESD No. 270', '-', 'N/A', '25', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN03800099', 'MOLD MELAMINE CLEANING COMPOUND', 'N/A', '30', '3010001', 'N/A', 'N/A', 'N/A', 'MOLD MELAMINE CLEANING COMPOUND', '', 'N/A', '2', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN03817149', 'M-COAT HT PART A (P179827)', 'N/A', '10', '1020001', 'P179827', 'PCB GRAPHTECH PTE LTD', 'N/A', 'M-COAT HT PART A (P179827)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN03828037', 'Sepatu ESD ', 'N/A', '40', '4020001', 'Sepatu ESD No. 280', 'N/A', 'N/A', 'Sepatu ESD No. 280', '-', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN03900100', 'MOLD MELAMINE CONDITIONER\nCOMPOUND', 'N/A', '30', '3010001', 'N/A', 'N/A', 'N/A', 'MOLD MELAMINE CONDITIONER\nCOMPOUND', '', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN03917150', 'M-COAT HT PART B (P179828)', 'N/A', '10', '1020001', 'P179828', 'PCB GRAPHTECH PTE LTD', 'N/A', 'M-COAT HT PART B (P179828)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN03936038', 'Sandal ', 'N/A', '40', '4020001', 'Sandal 36/37', 'N/A', 'N/A', 'Sandal 36/37', '-', 'N/A', '20', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN04000101', 'FICO TRIM FORM TOOL SET CONSUMABLES', 'N/A', '30', '3010001', 'N/A', 'ESEC SINGAPORE', 'N/A', 'FICO TRIM FORM TOOL SET CONSUMABLES', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN04017151', 'M-COAT HT PART R (P179825)', 'N/A', '10', '1020001', 'P179825', 'PCB GRAPHTECH PTE LTD', 'N/A', 'M-COAT HT PART R (P179825)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN04038039', 'Sandal ', 'N/A', '40', '4020001', 'Sandal 38/39', 'N/A', 'N/A', 'Sandal 38/39', '-', 'N/A', '20', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN04110102', 'DISTANCE BUSH', 'N/A', '30', '3010001', 'FCL FORMING TOOL #109803', 'ESEC SINGAPORE', 'N/A', 'DISTANCE BUSH', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN04117152', 'M TREAT AQ (P179220)', 'N/A', '10', '1020001', 'P179220', 'PCB GRAPHTECH PTE LTD', 'N/A', 'M TREAT AQ (P179220)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN04140040', 'Sandal ', 'N/A', '40', '4020001', 'Sandal 40/41', 'N/A', 'N/A', 'Sandal 40/41', '-', 'N/A', '78', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN04200153', 'SODIUM CARBONATE (Na2CO3) Teknis', 'N/A', '10', '1010001', 'N/A', 'PT NIKKO', 'N/A', 'SODIUM CARBONATE (Na2CO3) Teknis', '10', 'N/A', '10', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN04242041', 'Sandal ', 'N/A', '40', '4020001', 'Sandal 42/43', 'N/A', 'N/A', 'Sandal 42/43', '-', 'N/A', '33', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN04311154', '#OMNIBOND 9249 MAKE UP (P119249)', 'N/A', '10', '1010001', 'P119249', 'PCB GRAPHTECH PTE LTD', 'N/A', '#OMNIBOND 9249 MAKE UP (P119249)', '', 'N/A', '20', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN04344042', 'Sandal ', 'N/A', '40', '4020001', 'Sandal No. 44/45', 'N/A', 'N/A', 'Sandal No. 44/45', '-', 'N/A', '15', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN04411155', 'OMNIBOND 9251 OXIDIZER (P119251)', 'N/A', '10', '1010001', 'P119251', 'PCB GRAPHTECH PTE LTD', 'N/A', 'OMNIBOND 9251 OXIDIZER (P119251)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN04430103', 'Window clamp & heater plate for wire\nbonder', 'N/A', '30', '3010001', '3006', 'PT.OCTAGON PRECISION INDONESIA', 'N/A', 'Window clamp & heater plate for wire\nbonder', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN04447043', 'Sandal ', 'N/A', '40', '4020001', 'Sandal No 47/48', 'N/A', 'N/A', 'Sandal No 47/48', '-', 'N/A', '20', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN04500044', 'Face Mask', 'N/A', '40', '4010001', 'N/A', 'PT NIKKO', 'N/A', 'Face Mask', '300', 'N/A', '255', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN04518156', 'OMNIBOND+ OXIDE POST DIP J (P189200)', 'N/A', '10', '1010001', 'P189200', 'PCB GRAPHTECH PTE LTD', 'N/A', 'OMNIBOND+ OXIDE POST DIP J (P189200)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN04560104', 'TO FAB ESEC 3006 DHS', 'N/A', '30', '3010001', 'Part No.609.14.BP.ES36.001.00', 'FUTANI ENGINEERING PTE LTD', 'N/A', 'TO FAB ESEC 3006 DHS', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN04600045', 'Wrist Strap', 'N/A', '40', '4020001', 'N/A', 'N/A', 'N/A', 'Wrist Strap', '-', 'N/A', '175', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN04616105', 'Liquid Nitrogen (LGC)', 'N/A', '30', '3010001', '165 L', 'PT. INTI DUTA SURYA', 'N/A', 'Liquid Nitrogen (LGC)', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN04618157', 'OMNIBOND+ OXIDE POST B (P189201)', 'N/A', '10', '1010001', 'P189201', 'PCB GRAPHTECH PTE LTD', 'N/A', 'OMNIBOND+ OXIDE POST B (P189201)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN04700046', 'Baju ESD (smock) uk.L', 'N/A', '40', '4020001', 'N/A', 'N/A', 'N/A', 'Baju ESD (smock) uk.L', '-', 'N/A', '2', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN04700106', 'HS GOLD REPLENISHER UNIT B', 'N/A', '30', '3010001', 'OTUS$PCS', 'TECHNIC ASIA PACIFIC PTE LTD', 'N/A', 'HS GOLD REPLENISHER UNIT B', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN04718158', '#OMNI CLEAN 707 (P188004)', 'N/A', '10', '1010001', 'P188004', 'PCB GRAPHTECH PTE LTD', 'N/A', '#OMNI CLEAN 707 (P188004)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN04800047', 'Baju ESD (smock) uk.M', 'N/A', '40', '4020001', 'N/A', 'N/A', 'N/A', 'Baju ESD (smock) uk.M', '-', 'N/A', '20', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN04800107', 'HS additive C-5 gal', 'N/A', '30', '3010001', 'N/A', 'TECHNIC ASIA PACIFIC PTE LTD', 'N/A', 'HS additive C-5 gal', '5', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN04900048', 'Baju ESD (smock) uk.S', 'N/A', '40', '4020001', 'N/A', 'N/A', 'N/A', 'Baju ESD (smock) uk.S', '-', 'N/A', '9', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN04963108', 'Ph-Control-5GL/DM', 'N/A', '30', '3010001', 'code : X6362000', 'TECHNIC ASIA PACIFIC PTE LT', 'N/A', 'Ph-Control-5GL/DM', '5', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN05000049', 'Glove Karet (biru)', 'N/A', '40', '4010001', 'N/A', 'Doo Yee', 'N/A', 'Glove Karet (biru)', '-', 'N/A', '24', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN05000159', '\"Potasium pemanganat Restin PC additive Sodium Kar', 'N/A', '10', '1010001', 'N/A', 'PT NIKKO', 'N/A', '\"Potasium pemanganat Restin PC additive Sodium Karbonat Sodium persulfat\"', '1', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN05064109', 'pH + control ACR-5GL/DM', 'N/A', '30', '3010001', 'code : X6462000', 'TECHNIC ASIA PACIFIC PTE LT', 'N/A', 'pH + control ACR-5GL/DM', '5', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN05100050', 'Glove ESD uk.L', 'N/A', '40', '4020001', 'N/A', 'Doo Yee', 'N/A', 'Glove ESD uk.L', '-', 'N/A', '87', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN05100160', 'Restin PC additive', 'N/A', '10', '1010001', 'N/A', 'N/A', 'N/A', 'Restin PC additive', '', 'N/A', '2', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN05200051', 'Glove ESD uk.M', 'N/A', '40', '4020001', 'N/A', 'Doo Yee', 'N/A', 'Glove ESD uk.M', '-', 'N/A', '15', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN05300052', 'Glove ESD uk.S', 'N/A', '40', '4020001', 'N/A', 'Doo Yee', 'N/A', 'Glove ESD uk.S', '-', 'N/A', '19', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN05400053', 'Glove Nitrile Clean Room', 'N/A', '40', '4020001', 'N/A', 'Doo Yee', 'N/A', 'Glove Nitrile Clean Room', '-', 'N/A', '6', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN05500054', 'Wiper Clean Room', 'N/A', '40', '4010001', 'N/A', 'N/A', 'N/A', 'Wiper Clean Room', '-', 'N/A', '139', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN05546161', 'STANNOUS SULPHATE (R46562)', 'N/A', '10', '1010001', 'R46562', 'PCB GRAPHTECH PTE LTD', 'N/A', 'STANNOUS SULPHATE (R46562)', '', 'N/A', '4999', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN05600055', 'Glove F-Telon', 'N/A', '40', '4010001', 'N/A', 'Doo Yee', 'N/A', 'Glove F-Telon', '-', 'N/A', '28', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN05611162', 'STANTEK ADDITIVE SRO (P117826)', 'N/A', '10', '1010001', 'P117826', 'PCB GRAPHTECH PTE LTD', 'N/A', 'STANTEK ADDITIVE SRO (P117826)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN05700056', 'Baju Pratikum Lab.Kimia uk.XL', 'N/A', '40', '4020001', 'N/A', 'N/A', 'N/A', 'Baju Pratikum Lab.Kimia uk.XL', '-', 'N/A', '2', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN05700110', 'Indoflux', 'N/A', '30', '3010001', 'N/A', 'PT.SOLDER INDONESIA', 'N/A', 'Indoflux', '1', 'N/A', '2', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN05710163', 'Ultrastrip 107 RESIST STRIPPER 107\n(P188051)', 'N/A', '10', '1010001', '107 P188051', 'PCB GRAPHTECH PTE LTD', 'N/A', 'Ultrastrip 107 RESIST STRIPPER 107\n(P188051)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN05800057', 'Baju Pratikum Lab.Kimia uk.L', 'N/A', '40', '4020001', 'N/A', 'N/A', 'N/A', 'Baju Pratikum Lab.Kimia uk.L', '-', 'N/A', '17', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN05800164', 'Methyl orange', 'N/A', '10', '1010001', 'N/A', 'INOVASI TEKNOLOGI', 'N/A', 'Methyl orange', '1', 'N/A', '99', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN05900058', 'Baju Pratikum lab.Kimia uk.M', 'N/A', '40', '4020001', 'N/A', 'N/A', 'N/A', 'Baju Pratikum lab.Kimia uk.M', '-', 'N/A', '12', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN05900165', 'Titriplex (EDTA)', 'N/A', '10', '1010001', 'N/A', 'INOVASI TEKNOLOGI', 'N/A', 'Titriplex (EDTA)', '1', 'N/A', '960', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN06000059', 'Baju Pratikum Lab.Kimia uk.S', 'N/A', '40', '4020001', 'N/A', 'N/A', 'N/A', 'Baju Pratikum Lab.Kimia uk.S', '-', 'N/A', '4', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN06000166', 'Starch soluble', 'N/A', '10', '1010001', 'N/A', 'INOVASI TEKNOLOGI', 'N/A', 'Starch soluble', '1', 'N/A', '250', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN06100060', 'Pembersih Kerak (Spon Kasar)', 'N/A', '40', '4010001', 'N/A', 'N/A', 'N/A', 'Pembersih Kerak (Spon Kasar)', '-', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN06100111', 'Syringe Hysol FP4460 10cc', 'N/A', '30', '3010001', 'N/A', 'Pilar Mas Belian', 'N/A', 'Syringe Hysol FP4460 10cc', '5', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN06100167', 'Potasium hydrogen phtalate', 'N/A', '10', '1010001', 'N/A', 'INOVASI TEKNOLOGI', 'N/A', 'Potasium hydrogen phtalate', '1', 'N/A', '80', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN06200061', 'Pinset / Tweezer', 'N/A', '40', '4020001', 'N/A', 'N/A', 'N/A', 'Pinset / Tweezer', '-', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN06200168', 'Sodium thiosulfate pentahydrate', 'N/A', '10', '1010001', 'N/A', 'INOVASI TEKNOLOGI', 'N/A', 'Sodium thiosulfate pentahydrate', '1', 'N/A', '985', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN06300062', 'Labu Takar 250 ml', 'N/A', '40', '4020001', 'N/A', 'N/A', 'N/A', 'Labu Takar 250 ml', '-', 'N/A', '6', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN06300169', 'Potasium thiocyanate', 'N/A', '10', '1010001', 'N/A', 'INOVASI TEKNOLOGI', 'N/A', 'Potasium thiocyanate', '1', 'N/A', '1000', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN06400063', 'labu Takar 300 ml', 'N/A', '40', '4020001', 'N/A', 'N/A', 'N/A', 'labu Takar 300 ml', '-', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN06400170', 'Methyl red indicator', 'N/A', '10', '1010001', 'N/A', 'INOVASI TEKNOLOGI', 'N/A', 'Methyl red indicator', '1', 'N/A', '99', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN06500064', 'Labu Takar 1000 ml', 'N/A', '40', '4020001', 'N/A', 'N/A', 'N/A', 'Labu Takar 1000 ml', '-', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN06500171', 'Sodium hydroxide PA', 'N/A', '10', '1010001', 'N/A', 'INOVASI TEKNOLOGI', 'N/A', 'Sodium hydroxide PA', '5', 'N/A', '1000', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN06600065', 'Hand Jack', 'N/A', '40', '4020001', 'N/A', 'N/A', 'N/A', 'Hand Jack', '-', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN06600172', 'Phenolphthalein indicator PA', 'N/A', '10', '1010001', 'N/A', 'INOVASI TEKNOLOGI', 'N/A', 'Phenolphthalein indicator PA', '1', 'N/A', '99', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN06700066', 'Jangka Sorong', 'N/A', '40', '4020001', 'N/A', 'N/A', 'N/A', 'Jangka Sorong', '-', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN06700173', 'Potasium dichromate PA', 'N/A', '10', '1010001', 'N/A', 'INOVASI TEKNOLOGI', 'N/A', 'Potasium dichromate PA', '1', 'N/A', '495', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN06800174', 'Potasium Iodide PA', 'N/A', '10', '1010001', 'N/A', 'INOVASI TEKNOLOGI', 'N/A', 'Potasium Iodide PA', '1', 'N/A', '985', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN06900067', 'Masker (Organik Vapor)', 'N/A', '40', '4020001', 'N/A', 'N/A', 'N/A', 'Masker (Organik Vapor)', '-', 'N/A', '8', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN06900175', 'PAN indicator (1-(2-pyridylazo)-2-naphthol)\nPA', 'N/A', '10', '1010001', 'N/A', 'INOVASI TEKNOLOGI', 'N/A', 'PAN indicator (1-(2-pyridylazo)-2-naphthol)\nPA', '5', 'N/A', '4', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN07000068', 'Kacamata Worksafe', 'N/A', '40', '4020001', 'N/A', 'N/A', 'N/A', 'Kacamata Worksafe', '-', 'N/A', '10', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN07000176', 'Sodium carbonat PA', 'N/A', '10', '1010001', 'N/A', 'MERCK', 'N/A', 'Sodium carbonat PA', '1', 'N/A', '2995', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN07100177', 'Methanol PA', 'N/A', '10', '1010001', 'N/A', 'INOVASI TEKNOLOGI', 'N/A', 'Methanol PA', '1', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN07289178', 'COMPACTA ACCESSORIES - COPPER ANODE,\n1 SET (890020', 'N/A', '10', '1010001', '89002015', 'PCB GRAPHTECH PTE LTD', 'N/A', 'COMPACTA ACCESSORIES - COPPER ANODE,\n1 SET (89002015)', '', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN07300179', 'Sodium Hydrogen Carbonat PA', 'N/A', '10', '1010001', 'N/A', 'INOVASI TEKNOLOGI', 'N/A', 'Sodium Hydrogen Carbonat PA', '1', 'N/A', '1000', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN07436180', 'Hydrochloric Acid 36% PA', 'N/A', '10', '1010001', '36% PA', 'INOVASI TEKNOLOGI', 'N/A', 'Hydrochloric Acid 36% PA', '1', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN07598181', 'Sulfuric Acid 98% PA', 'N/A', '10', '1010001', '98% PA', 'INOVASI TEKNOLOGI', 'N/A', 'Sulfuric Acid 98% PA', '1', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN07700182', 'Sodium Chloride PA', 'N/A', '10', '1010001', 'N/A', 'N/A', 'N/A', 'Sodium Chloride PA', '', 'N/A', '500', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN07800183', 'Eosin Y PA', 'N/A', '10', '1010001', 'N/A', 'N/A', 'N/A', 'Eosin Y PA', '', 'N/A', '20', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN07970184', 'Buffer Solution pH 4.0', 'N/A', '10', '1010001', 'p.H 4.0', 'N/A', 'N/A', 'Buffer Solution pH 4.0', '', 'N/A', '1000', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN08070185', 'Buffer Solution pH 7.0', 'N/A', '10', '1010001', 'p.H 7.0', 'N/A', 'N/A', 'Buffer Solution pH 7.0', '', 'N/A', '1000', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN08100186', 'Silver Nitrat PA', 'N/A', '10', '1010001', 'N/A', 'N/A', 'N/A', 'Silver Nitrat PA', '', 'N/A', '9', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN08200187', 'Calcium carbonate', 'N/A', '10', '1010001', 'N/A', 'N/A', 'N/A', 'Calcium carbonate', '', 'N/A', '50', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN08310188', 'BASIC MATERIAL (01000140)', 'N/A', '10', '1010001', '1000140', 'PCB GRAPHTECH PTE LTD', 'N/A', 'BASIC MATERIAL (01000140)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN08499189', 'COMPACTA ACCESSORIES - PCB RACK LEM 5\n(99002005)', 'N/A', '10', '1010001', '99002005', 'PCB GRAPHTECH PTE LTD', 'N/A', 'COMPACTA ACCESSORIES - PCB RACK LEM 5\n(99002005)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN08589190', 'COMPACTA ACCESSORIES - TIN ANODE, 1\nSET (89002017)', 'N/A', '10', '1010001', '89002017', 'PCB GRAPHTECH PTE LTD', 'N/A', 'COMPACTA ACCESSORIES - TIN ANODE, 1\nSET (89002017)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN08610191', 'CONTURE ROUTERS FOR PCB ROUTING\n(01000218)', 'N/A', '10', '1010001', '1000218', 'PCB GRAPHTECH PTE LTD', 'N/A', 'CONTURE ROUTERS FOR PCB ROUTING\n(01000218)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN08710192', 'DEVELOPER FILMSTAR ( 01003100 )', 'N/A', '10', '1010001', '1003100', 'PCB GRAPHTECH PTE LTD', 'N/A', 'DEVELOPER FILMSTAR ( 01003100 )', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN08810193', 'DRILLER WITH RING (01000839)', 'N/A', '10', '1010001', '1000839', 'PCB GRAPHTECH PTE LTD', 'N/A', 'DRILLER WITH RING (01000839)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN08999194', 'FILM PLOTTING ( 99006012 )', 'N/A', '10', '1010001', '99006012', 'PCB GRAPHTECH PTE LTD', 'N/A', 'FILM PLOTTING ( 99006012 )', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN09110195', 'ION EXCHANGER L2 ( 01000588 )', 'N/A', '10', '1010001', '1000588', 'PCB GRAPHTECH PTE LTD', 'N/A', 'ION EXCHANGER L2 ( 01000588 )', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN09299196', 'MULTILAYER PRESS CONSUMABLE\nMATERIAL (99001051)', 'N/A', '10', '1010001', '99001051', 'PCB GRAPHTECH PTE LTD', 'N/A', 'MULTILAYER PRESS CONSUMABLE\nMATERIAL (99001051)', '', 'N/A', '355', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN09350197', 'PHOTO IMAGEABLE SOLDERMASK R500 GAH\n(GREEN)', 'N/A', '10', '1010001', 'R500', 'PT. Batam Universal Stars', 'N/A', 'PHOTO IMAGEABLE SOLDERMASK R500 GAH\n(GREEN)', '', 'N/A', '5', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN09410198', 'REPLACEMENT CARTRIDGE L2 ( 01000052 )', 'N/A', '10', '1010001', '1000052', 'PCB GRAPHTECH PTE LTD', 'N/A', 'REPLACEMENT CARTRIDGE L2 ( 01000052 )', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN09571199', 'RESTIN (XD7151) - (P113351)', 'N/A', '10', '1010001', 'XD7151-P113351', 'PCB GRAPHTECH PTE LTD', 'N/A', 'RESTIN (XD7151) - (P113351)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN09694200', 'RISTON DRY FILM FX940', 'N/A', '10', '1010001', 'FX940', 'PCB GRAPHTECH PTE LTD', 'N/A', 'RISTON DRY FILM FX940', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN09899201', 'SPECIAL LAMP FOR DARK ROOM ( 99006011\n)', 'N/A', '10', '1010001', '99006011', 'PCB GRAPHTECH PTE LTD', 'N/A', 'SPECIAL LAMP FOR DARK ROOM ( 99006011\n)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN09913202', 'ULANO 133', 'N/A', '10', '1010001', '133', 'N/A', 'N/A', 'ULANO 133', '', 'N/A', '5', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN10005203', 'ULANO 5', 'N/A', '10', '1010001', '5', 'N/A', 'N/A', 'ULANO 5', '', 'N/A', '4', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN10100204', 'High speed Ac-Cu-Guard replenisher', 'N/A', '10', '1010001', 'N/A', 'PCB GRAPHTECH PTE LTD', 'N/A', 'High speed Ac-Cu-Guard replenisher', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN10200205', 'High speed Ac-Cu-Guard starter', 'N/A', '10', '1010001', 'N/A', 'PCB GRAPHTECH PTE LTD', 'N/A', 'High speed Ac-Cu-Guard starter', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN10305206', 'Matabor 0.5 mm (drill bit)', 'N/A', '10', '1010001', 'Matabor 0.5 mm (drill bit)', 'CV G-TECH', 'N/A', 'Matabor 0.5 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN10409207', 'Matabor 0.9 mm (drill bit)', 'N/A', '10', '1010001', 'Matabor 0.9 mm (drill bit)', 'CV G-TECH', 'N/A', 'Matabor 0.9 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN10510208', 'Matabor 1.0 mm (drill bit)', 'N/A', '10', '1010001', 'Matabor 1.0 mm (drill bit)', 'CV G-TECH', 'N/A', 'Matabor 1.0 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN10611209', 'Matabor 1.1 mm (drill bit)', 'N/A', '10', '1010001', 'Matabor 1.1 mm (drill bit)', 'CV G-TECH', 'N/A', 'Matabor 1.1 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN10712210', 'Matabor 1.2 mm (drill bit)', 'N/A', '10', '1010001', 'Matabor 1.2 mm (drill bit)', 'CV G-TECH', 'N/A', 'Matabor 1.2 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN10814211', 'Matabor 1.4 mm (drill bit)', 'N/A', '10', '1010001', 'Matabor 1.4 mm (drill bit)', 'CV G-TECH', 'N/A', 'Matabor 1.4 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN10916212', 'Matabor 1.6 mm (drill bit)', 'N/A', '10', '1010001', 'Matabor 1.6 mm (drill bit)', 'CV G-TECH', 'N/A', 'Matabor 1.6 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN11017213', 'Matabor 1.7 mm (drill bit)', 'N/A', '10', '1010001', 'Matabor 1.7 mm (drill bit)', 'CV G-TECH', 'N/A', 'Matabor 1.7 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN11119214', 'Matabor 1.9 mm (drill bit)', 'N/A', '10', '1010001', 'Matabor 1.9 mm (drill bit)', 'CV G-TECH', 'N/A', 'Matabor 1.9 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN11221215', 'Matabor 2.1 mm (drill bit)', 'N/A', '10', '1010001', 'Matabor 2.1 mm (drill bit)', 'CV G-TECH', 'N/A', 'Matabor 2.1 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN11322216', 'Matabor 2.2 mm (drill bit)', 'N/A', '10', '1010001', 'Matabor 2.2 mm (drill bit)', 'CV G-TECH', 'N/A', 'Matabor 2.2 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN11423217', 'Matabor 2.3 mm (drill bit)', 'N/A', '10', '1010001', 'Matabor 2.3 mm (drill bit)', 'CV G-TECH', 'N/A', 'Matabor 2.3 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN11524218', 'Matabor 2.4 mm (drill bit)', 'N/A', '10', '1010001', 'Matabor 2.4 mm (drill bit)', 'CV G-TECH', 'N/A', 'Matabor 2.4 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN11626219', 'Matabor 2.6 mm (drill bit)', 'N/A', '10', '1010001', 'Matabor 2.6 mm (drill bit)', 'CV G-TECH', 'N/A', 'Matabor 2.6 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN11727220', 'Matabor 2.7 mm (drill bit)', 'N/A', '10', '1010001', 'Matabor 2.7 mm (drill bit)', 'CV G-TECH', 'N/A', 'Matabor 2.7 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN11828221', 'Matabor 2.8 mm (drill bit)', 'N/A', '10', '1010001', 'Matabor 2.8 mm (drill bit)', 'CV G-TECH', 'N/A', 'Matabor 2.8 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN11929222', 'Matabor 2.9 mm (drill bit)', 'N/A', '10', '1010001', 'Matabor 2.9 mm (drill bit)', 'CV G-TECH', 'N/A', 'Matabor 2.9 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN12037223', 'Matabor 3.7 mm (drill bit)', 'N/A', '10', '1010001', 'Matabor 3.7 mm (drill bit)', 'CV G-TECH', 'N/A', 'Matabor 3.7 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN12139224', 'Matabor 3.9 mm (drill bit)', 'N/A', '10', '1010001', 'Matabor 3.9 mm (drill bit)', 'CV G-TECH', 'N/A', 'Matabor 3.9 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN12242225', 'Matabor 4.2 mm (drill bit)', 'N/A', '10', '1010001', 'Matabor 4.2 mm (drill bit)', 'CV G-TECH', 'N/A', 'Matabor 4.2 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN12350226', 'Matabor 5.0 mm (drill bit)', 'N/A', '10', '1010001', 'Matabor 5.0 mm (drill bit)', 'CV G-TECH', 'N/A', 'Matabor 5.0 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN12460227', 'Matabor 6.0 mm (drill bit)', 'N/A', '10', '1010001', 'Matabor 6.0 mm (drill bit)', 'CV G-TECH', 'N/A', 'Matabor 6.0 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GN12500228', 'PHOTOGRAPHIC FILM', 'N/A', '10', '1010001', 'N/A', 'CV G-TECH', 'N/A', 'PHOTOGRAPHIC FILM', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00000059', 'CAPILLARY SAMPLE', 'N/A', '30', '3010002', '', 'N/A', 'N/A', '', 'N/A', 'N/A', '450', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00000061', 'CALIBRATOR', 'N/A', '40', '4020002', 'INDEXER', 'N/A', 'N/A', 'INDEXER', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00000075', 'POST HEATER', 'N/A', '40', '4020002', '', 'N/A', 'N/A', '', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00000077', 'BACK GRINDING', 'N/A', '40', '4020002', 'EHWA', 'N/A', 'N/A', 'EHWA', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00000080', 'BOARD', 'N/A', '40', '4020002', 'TEMPERATURE CONTROL-EURITERM', 'N/A', 'N/A', 'TEMPERATURE CONTROL-EURITERM', 'N/A', 'N/A', '3', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00000094', 'INDEXER CLAMP COIL', 'N/A', '40', '4020002', '', 'N/A', 'N/A', '', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00000101', 'FIBER OPTIC CABLE', 'N/A', '40', '4020002', '', 'N/A', 'N/A', '', 'N/A', 'N/A', '5', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00000103', 'ELEXTRODE HOLDER', 'N/A', '40', '4020002', 'ESSEC ', 'N/A', 'N/A', 'ESSEC ', 'N/A', 'N/A', '2', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00002060', 'CALIBRATOR', 'N/A', '40', '4020002', 'OTC2', 'N/A', 'N/A', 'OTC2', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00002062', 'CALIBRATOR', 'N/A', '40', '4020002', 'DFC2', 'N/A', 'N/A', 'DFC2', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00004035', 'CAPILLARY', 'N/A', '30', '3010002', '4B878-2358-I39', 'N/A', 'N/A', '4B878-2358-I39', 'N/A', 'N/A', '6', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00004055', 'CAPILLARY', 'N/A', '30', '3010002', '4BF88-5057-I36', 'N/A', 'N/A', '4BF88-5057-I36', 'N/A', 'N/A', '10', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00004070', 'STENCIL', 'N/A', '40', '4010002', '4-UP 200L 10x10 ELP 8.7x8.7 EPAD (FLUX STENCIL-A)', 'N/A', 'N/A', '4-UP 200L 10x10 ELP 8.7x8.7 EPAD (FLUX STENCIL-A)', 'N/A', 'N/A', '2', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00005005', 'DICING BLADE', 'N/A', '30', '3010002', 'ZH05-SD4000-N1-50', 'N/A', 'N/A', 'ZH05-SD4000-N1-50', 'N/A', 'N/A', '8', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00005006', 'DICING BLADE', 'N/A', '30', '3010002', 'ZH05-SD3000-N1-50', 'N/A', 'N/A', 'ZH05-SD3000-N1-50', 'N/A', 'N/A', '5', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00005008', 'DICING BLADE', 'N/A', '30', '3010002', 'ZH05-SD3500-N1-50', 'N/A', 'N/A', 'ZH05-SD3500-N1-50', 'N/A', 'N/A', '17', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00005009', 'DICING BLADE', 'N/A', '30', '3010002', 'ZH05-SD2000-N1-30-A3867', 'N/A', 'N/A', 'ZH05-SD2000-N1-30-A3867', 'N/A', 'N/A', '5', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00005010', 'DICING BLADE', 'N/A', '30', '3010002', 'ZH05-SD3000-N1-90', 'N/A', 'N/A', 'ZH05-SD3000-N1-90', 'N/A', 'N/A', '8', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00005011', 'DICING BLADE', 'N/A', '30', '3010002', 'ZHO5-SD3500-N1-90', 'N/A', 'N/A', 'ZHO5-SD3500-N1-90', 'N/A', 'N/A', '6', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00005013', 'DICING BLADE', 'N/A', '30', '3010002', 'ZH05-SD3000-N1-70', 'N/A', 'N/A', 'ZH05-SD3000-N1-70', 'N/A', 'N/A', '6', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00007014', 'DICING BLADE', 'N/A', '30', '3010002', 'RO7-SDC600-BB500-75-N5421', 'N/A', 'N/A', 'RO7-SDC600-BB500-75-N5421', 'N/A', 'N/A', '8', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00008044', 'CAPILLARY', 'N/A', '30', '3010002', 'B0811-28-14-04', 'N/A', 'N/A', 'B0811-28-14-04', 'N/A', 'N/A', '10', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00009031', 'CAPILLARY', 'N/A', '30', '3010002', 'B0911-31-15-05', 'N/A', 'N/A', 'B0911-31-15-05', 'N/A', 'N/A', '10', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00010036', 'CAPILLARY', 'N/A', '30', '3010002', 'B1013-35-16-05', 'N/A', 'N/A', 'B1013-35-16-05', 'N/A', 'N/A', '14', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00010043', 'CAPILLARY', 'N/A', '30', '3010002', 'B1013-47-21-08', 'N/A', 'N/A', 'B1013-47-21-08', 'N/A', 'N/A', '89', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00010056', 'CAPILLARY', 'N/A', '30', '3010002', 'B1013-52-21-08', 'N/A', 'N/A', 'B1013-52-21-08', 'N/A', 'N/A', '18', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00010089', 'BOARD', 'N/A', '40', '4020002', 'CPU 10-0255-00 DE 29064 2', 'N/A', 'N/A', 'CPU 10-0255-00 DE 29064 2', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00011051', 'CAPILLARY', 'N/A', '30', '3010002', 'RFE-1118-SHMX2-2XL(90DIC-OR12-T65)', 'N/A', 'N/A', 'RFE-1118-SHMX2-2XL(90DIC-OR12-T65)', 'N/A', 'N/A', '14', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00013032', 'CAPILLARY', 'N/A', '30', '3010002', 'N1316-80-29-15', 'N/A', 'N/A', 'N1316-80-29-15', 'N/A', 'N/A', '14', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00013076', 'EFO SELENOID', 'N/A', '40', '4020002', '130.0164.1', 'N/A', 'N/A', '130.0164.1', 'N/A', 'N/A', '4', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00014004', 'DICING BLADE', 'N/A', '30', '3010002', 'ZH14-SD3500-V1-90-A2888', 'N/A', 'N/A', 'ZH14-SD3500-V1-90-A2888', 'N/A', 'N/A', '2', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00014007', 'DICING BLADE', 'N/A', '30', '3010002', 'ZH14-SD4000-N1-50-A1184', 'N/A', 'N/A', 'ZH14-SD4000-N1-50-A1184', 'N/A', 'N/A', '6', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00014012', 'DICING BLADE', 'N/A', '30', '3010002', 'ZH14-SD3500-V1-70-A2888', 'N/A', 'N/A', 'ZH14-SD3500-V1-70-A2888', 'N/A', 'N/A', '5', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00014053', 'CAPILLARY', 'N/A', '30', '3010002', 'RFB-1420SHMX2-3XL(90SIC-OR12-T66-BH10', 'N/A', 'N/A', 'RFB-1420SHMX2-3XL(90SIC-OR12-T66-BH10', 'N/A', 'N/A', '9', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00014069', 'LEADFRAME', 'N/A', '40', '4010002', '14008053', 'N/A', 'N/A', '14008053', 'N/A', 'N/A', '74', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00014100', 'LAP POLISHING KIT', 'N/A', '40', '4010002', '14-066-010', 'N/A', 'N/A', '14-066-010', 'N/A', 'N/A', '2', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00015019', 'CAPILLARY', 'N/A', '30', '3010002', '1553-17-437GG-80(411D-5)20D-CZ9', 'N/A', 'N/A', '1553-17-437GG-80(411D-5)20D-CZ9', 'N/A', 'N/A', '17', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00015020', 'CAPILLARY', 'N/A', '30', '3010002', '1500-DWG100162-CZ9', 'N/A', 'N/A', '1500-DWG100162-CZ9', 'N/A', 'N/A', '7', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00015021', 'CAPILLARY', 'N/A', '30', '3010002', '1551-13437GGD 55(1.5-8D-8)20D-CZ9', 'N/A', 'N/A', '1551-13437GGD 55(1.5-8D-8)20D-CZ9', 'N/A', 'N/A', '8', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00015022', 'CAPILLARY', 'N/A', '30', '3010002', '1551-17-437GG-59(4-8D-10)20D-CZ9', 'N/A', 'N/A', '1551-17-437GG-59(4-8D-10)20D-CZ9', 'N/A', 'N/A', '16', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00015023', 'CAPILLARY', 'N/A', '30', '3010002', '1553-13437GGB-65(2 8D-8)20D-CZ9', 'N/A', 'N/A', '1553-13437GGB-65(2 8D-8)20D-CZ9', 'N/A', 'N/A', '5', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00015025', 'CAPILLARY', 'N/A', '30', '3010002', '1500-DWG110525-GGMTL0171A', 'N/A', 'N/A', '1500-DWG110525-GGMTL0171A', 'N/A', 'N/A', '10', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00015026', 'CAPILLARY', 'N/A', '30', '3010002', '1500-DWG110417-GGMTL0171A', 'N/A', 'N/A', '1500-DWG110417-GGMTL0171A', 'N/A', 'N/A', '6', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00015029', 'CAPILLARY', 'N/A', '30', '3010002', '1500-DWG110245-GGMTL0170', 'N/A', 'N/A', '1500-DWG110245-GGMTL0170', 'N/A', 'N/A', '4', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00015041', 'CAPILLARY', 'N/A', '30', '3010002', '1553-18-437GGD80(4.5-11D-5)20D-CZ9', 'N/A', 'N/A', '1553-18-437GGD80(4.5-11D-5)20D-CZ9', 'N/A', 'N/A', '10', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00015046', 'CAPILLARY', 'N/A', '30', '3010002', '1500-DWG110415-GGMTL0171A', 'N/A', 'N/A', '1500-DWG110415-GGMTL0171A', 'N/A', 'N/A', '10', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00015048', 'CAPILLARY', 'N/A', '30', '3010002', '1551-13-437GM-55(48D)20D-CZR', 'N/A', 'N/A', '1551-13-437GM-55(48D)20D-CZR', 'N/A', 'N/A', '10', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00017052', 'CAPILLARY', 'N/A', '30', '3010002', 'CSB-1726HMX-2XL(90DICOR15-T80)', 'N/A', 'N/A', 'CSB-1726HMX-2XL(90DICOR15-T80)', 'N/A', 'N/A', '10', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00018015', 'CAPILLARY', 'N/A', '30', '3010002', '1853-13-437GG T431.0FP2.3-3.2', 'N/A', 'N/A', '1853-13-437GG T431.0FP2.3-3.2', 'N/A', 'N/A', '130', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00018016', 'CAPILLARY', 'N/A', '30', '3010002', '1853-13-437-43(1.5 11D-5)20D-AB10x10 MTL0170', 'N/A', 'N/A', '1853-13-437-43(1.5 11D-5)20D-AB10x10 MTL0170', 'N/A', 'N/A', '360', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00018017', 'CAPILLARY', 'N/A', '30', '3010002', '1851-13-T38-QFN-FP-BLUE', 'N/A', 'N/A', '1851-13-T38-QFN-FP-BLUE', 'N/A', 'N/A', '684', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00018018', 'CAPILLARY', 'N/A', '30', '3010002', '1853-1-437-43(3.5 11D-8)20D-AB10x10MTL0171A-RF2-P', 'N/A', 'N/A', '1853-1-437-43(3.5 11D-8)20D-AB10x10MTL0171A-RF2-P', 'N/A', 'N/A', '17', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00018024', 'CAPILLARY', 'N/A', '30', '3010002', '1853-13-437GG-43(1.5 8D-5)20D-AB10x10-CZ9', 'N/A', 'N/A', '1853-13-437GG-43(1.5 8D-5)20D-AB10x10-CZ9', 'N/A', 'N/A', '3', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00018027', 'CAPILLARY', 'N/A', '30', '3010002', '1853-12.5-43734(1.75-11D-5)20DAB10x10-MTL0170', 'N/A', 'N/A', '1853-12.5-43734(1.75-11D-5)20DAB10x10-MTL0170', 'N/A', 'N/A', '9', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00018028', 'CAPILLARY', 'N/A', '30', '3010002', '1853-10-437GG 33(1.25-11D-3)20DAB10x10-CZ9', 'N/A', 'N/A', '1853-10-437GG 33(1.25-11D-3)20DAB10x10-CZ9', 'N/A', 'N/A', '30', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00');
INSERT INTO `inventory-admin` (`part_number`, `item`, `supplier#`, `cc`, `account_code`, `type`, `supplier`, `dwg#`, `description`, `moq`, `cost`, `on_hand`, `in_transit`, `on_prep`, `on_pr#`, `on_po#`, `batch#`, `iqa`, `received_date`, `manufacturing_date`, `expiration_date`, `po_date`, `pr_date`) VALUES
('GR00018037', 'CAPILLARY', 'N/A', '30', '3010002', '1853-10.5-437P 30(0.75-11D-5)20DABx10-CDR2B-CZ1', 'N/A', 'N/A', '1853-10.5-437P 30(0.75-11D-5)20DABx10-CDR2B-CZ1', 'N/A', 'N/A', '5', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00018038', 'CAPILLARY', 'N/A', '30', '3010002', '1854-11-437GM 30(1.5-11D-5)20DAB10xCDR-130-CZ1', 'N/A', 'N/A', '1854-11-437GM 30(1.5-11D-5)20DAB10xCDR-130-CZ1', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00018039', 'CAPILLARY', 'N/A', '30', '3010002', '1851-13-4-437GM40(2-8D-8)20DAB5x10-CDR2B-CZ1', 'N/A', 'N/A', '1851-13-4-437GM40(2-8D-8)20DAB5x10-CDR2B-CZ1', 'N/A', 'N/A', '6', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00018040', 'CAPILLARY', 'N/A', '30', '3010002', '1853-13-437GM-40(111D-5)20D-1B10X10 CDR2B-CZ1', 'N/A', 'N/A', '1853-13-437GM-40(111D-5)20D-1B10X10 CDR2B-CZ1', 'N/A', 'N/A', '5', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00018042', 'CAPILLARY', 'N/A', '30', '3010002', '1851-13-437GM40(2-8D-8)20DAB5x10-CDR2B-CZ1', 'N/A', 'N/A', '1851-13-437GM40(2-8D-8)20DAB5x10-CDR2B-CZ1', 'N/A', 'N/A', '50', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00018045', 'CAPILLARY', 'N/A', '30', '3010002', '1851-11-T43 GREENCZ3', 'N/A', 'N/A', '1851-11-T43 GREENCZ3', 'N/A', 'N/A', '6', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00018047', 'CAPILLARY', 'N/A', '30', '3010002', '1853-13-437-43(1.54D-10)20D-1B10X10MTL0170', 'N/A', 'N/A', '1853-13-437-43(1.54D-10)20D-1B10X10MTL0170', 'N/A', 'N/A', '10', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00018049', 'CAPILLARY', 'N/A', '30', '3010002', '1853-13-437GM-52(415D-5)20D-1B5X10-CZ1', 'N/A', 'N/A', '1853-13-437GM-52(415D-5)20D-1B5X10-CZ1', 'N/A', 'N/A', '10', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00018050', 'CAPILLARY', 'N/A', '30', '3010002', '1853-13-437GM-35(215D-5)20D-AB10X10CZ1', 'N/A', 'N/A', '1853-13-437GM-35(215D-5)20D-AB10X10CZ1', 'N/A', 'N/A', '10', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00020003', 'MAGAZINE  ', 'N/A', '30', '3010002', 'XD 2.0 x 9.0', 'N/A', 'N/A', 'XD 2.0 x 9.0', 'N/A', 'N/A', '6', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00020064', 'DIE BONDER', 'N/A', '30', '4020002', 'DIE BONDER 2007 HS PLUS', 'N/A', 'N/A', 'DIE BONDER 2007 HS PLUS', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00020065', 'DIE BONDER', 'N/A', '30', '4020002', 'DIE BONDER 2007 HS', 'N/A', 'N/A', 'DIE BONDER 2007 HS', 'N/A', 'N/A', '2', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00020066', 'GRAM GAUGE', 'N/A', '40', '4020002', 'BATAS 2000', 'N/A', 'N/A', 'BATAS 2000', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00023002', 'MAGAZINE  ', 'N/A', '30', '3010002', 'PDIP 2.3 x 8.4', 'N/A', 'N/A', 'PDIP 2.3 x 8.4', 'N/A', 'N/A', '18', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00025067', 'GRAM GAUGE', 'N/A', '40', '4020002', 'BATAS 250', 'N/A', 'N/A', 'BATAS 250', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00026068', 'CAP SCREW', 'N/A', '40', '4010002', '26-D27141', 'N/A', 'N/A', '26-D27141', 'N/A', 'N/A', '50', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00028034', 'CAPILLARY', 'N/A', '30', '3010002', 'SI-28090-355F-ZS38TS-Y', 'N/A', 'N/A', 'SI-28090-355F-ZS38TS-Y', 'N/A', 'N/A', '5', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00030063', 'DIE BONDER', 'N/A', '30', '4020002', 'ESSEC 3088', 'N/A', 'N/A', 'ESSEC 3088', 'N/A', 'N/A', '3', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00030072', 'ENCODER', 'N/A', '40', '4020002', 'ESSEC 3088', 'N/A', 'N/A', 'ESSEC 3088', 'N/A', 'N/A', '2', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00030073', 'ROCKER ARM,TRAND, W/CLAMP', 'N/A', '40', '4010002', 'ESSEC 3088', 'N/A', 'N/A', 'ESSEC 3088', 'N/A', 'N/A', '2', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00030081', 'BOARD', 'N/A', '40', '4020002', 'PSU WB ESSEC 3088', 'N/A', 'N/A', 'PSU WB ESSEC 3088', 'N/A', 'N/A', '2', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00030086', 'BOARD', 'N/A', '40', '4020002', 'HARDISK 3006', 'N/A', 'N/A', 'HARDISK 3006', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00030090', 'BOARD', 'N/A', '40', '4020002', 'INDEXER 3006', 'N/A', 'N/A', 'INDEXER 3006', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00030091', 'BOARD', 'N/A', '40', '4020002', 'HARDISK 3008', 'N/A', 'N/A', 'HARDISK 3008', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00030093', 'PNEUMATIC REGULATOR', 'N/A', '40', '4020002', 'ESSEC 3006 5351300210', 'N/A', 'N/A', 'ESSEC 3006 5351300210', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00030096', 'RAM', 'N/A', '40', '4020002', 'ESSEC 3088', 'N/A', 'N/A', 'ESSEC 3088', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00030097', 'WIRE CLAMP ASSEMBLY', 'N/A', '30', '3020002', 'ESSEC 3008', 'N/A', 'N/A', 'ESSEC 3008', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00030098', 'WIRE CLAMP ASSEMBLY', 'N/A', '30', '3020002', 'ESSEC 3006', 'N/A', 'N/A', 'ESSEC 3006', 'N/A', 'N/A', '26', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00030099', 'FIBER OPTIC SENSOR INDEXER', 'N/A', '40', '4020002', 'ESSEC 3006', 'N/A', 'N/A', 'ESSEC 3006', 'N/A', 'N/A', '2', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00038083', 'BOARD', 'N/A', '40', '4020002', 'HANDLER 388', 'N/A', 'N/A', 'HANDLER 388', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00041030', 'CAPILLARY', 'N/A', '30', '3010002', 'BNC412-437RP-20D', 'N/A', 'N/A', 'BNC412-437RP-20D', 'N/A', 'N/A', '10', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00041057', 'CAPILLARY', 'N/A', '30', '3010002', '413FC-3310-R33', 'N/A', 'N/A', '413FC-3310-R33', 'N/A', 'N/A', '10', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00042079', 'BOARD', 'N/A', '40', '4020002', 'VCPU 4289 ELCO 10 8457 D96 002 025', 'N/A', 'N/A', 'VCPU 4289 ELCO 10 8457 D96 002 025', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00052058', 'CAPILLARY', 'N/A', '30', '3010002', '524B 5393825783', 'N/A', 'N/A', '524B 5393825783', 'N/A', 'N/A', '10', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00064033', 'CAPILLARY', 'N/A', '30', '3010002', 'P64641001', 'N/A', 'N/A', 'P64641001', 'N/A', 'N/A', '5', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00064054', 'CAPILLARY', 'N/A', '30', '3010002', 'P-64614002', 'N/A', 'N/A', 'P-64614002', 'N/A', 'N/A', '10', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00066092', 'BOND HEAD ASSEMBLY', 'N/A', '40', '4020002', 'MCM0066-076-1TA-25XB/0265', 'N/A', 'N/A', 'MCM0066-076-1TA-25XB/0265', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00075095', 'PELLET', 'N/A', '40', '4020002', '75 ES1 010', 'N/A', 'N/A', '75 ES1 010', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00075102', 'PAD ABSORBER', 'N/A', '40', '4010002', '75 ES3 025', 'N/A', 'N/A', '75 ES3 025', 'N/A', 'N/A', '8', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00077001', 'MAGAZINE  ', 'N/A', '30', '3010002', 'TGFP 7X7', 'N/A', 'N/A', 'TGFP 7X7', 'N/A', 'N/A', '23', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00090071', 'ENCODER', 'N/A', '40', '4020002', '901118', 'N/A', 'N/A', '901118', 'N/A', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00090074', 'MOTOR INDEXER', 'N/A', '40', '4020002', '905.0979X797', 'N/A', 'N/A', '905.0979X797', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00090084', 'BOARD', 'N/A', '40', '4020002', 'INDEXER 905.0030/02', 'N/A', 'N/A', 'INDEXER 905.0030/02', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00094078', 'BOARD', 'N/A', '40', '4020002', 'NEFO 940.0002/02', 'N/A', 'N/A', 'NEFO 940.0002/02', 'N/A', 'N/A', '3', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00094082', 'BOARD', 'N/A', '40', '4020002', 'BPA 947.060/3', 'N/A', 'N/A', 'BPA 947.060/3', 'N/A', 'N/A', '4', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00094087', '?', 'N/A', '40', '4020002', '946.051/3', 'N/A', 'N/A', '946.051/3', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00094088', 'BOARD', 'N/A', '40', '4020002', '946.052/3', 'N/A', 'N/A', '946.052/3', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('GR00095085', '?', 'N/A', '40', '4020002', '954.0902/06', 'N/A', 'N/A', '954.0902/06', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('SP00000001', 'Wrist Strap', 'N/A', '30', '3030001', 'N/A', 'PT. Nikko', 'N/A', 'N/A', '10', 'N/A', '10', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('SP00000002', 'esd monitor', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('SP00000003', 'cutter', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('SP00000004', 'wafer ring', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('SP00000005', 'rubber tip', 'N/A', '30', '3030001', 'N/A', 'micro-mechanics', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('SP00000006', 'needle', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('SP00000007', 'nozzle', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('SP00000008', 'Magazine ', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('SP00000009', 'Capillary', 'N/A', '30', '3030001', 'N/A', 'CV. ATB', 'N/A', 'N/A', '300', 'N/A', '299', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('SP00000010', 'down holder', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('SP00000011', 'cavity bar', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('SP00000012', 'cavity bar', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('SP00000013', 'vacuum', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('SP00000014', 'pellet handler', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('SP00000015', 'tweezers', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('SP00000016', 'bronze', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('SP00000017', 'brush', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('SP00000018', 'rubber tip', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('SP00000019', 'fluxing jig', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('SP00000020', 'rubber tip', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('SP00000021', 'fluxing jig', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('SP00000022', 'ball attach jig', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('SP00000023', 'squeeze', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('SP00000024', 'cutter', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('SP00000025', 'wafer ring', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('SP00000026', 'hub', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('SP00000027', 'dejunk punch', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('SP00000028', 'dejunk dies', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('SP00000029', 'trim punch', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('SP00000030', 'sing dies', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('SP00000031', 'anvil', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('SP00000032', 'form tools', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('SP00000033', 'sing punch', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('SP00000034', 'sing dies', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('SP00000035', 'stencil mask', 'N/A', '20', '2030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('SP00000036', 'lifting block', 'N/A', '20', '2030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('SP00000037', 'nozzle', 'N/A', '20', '2030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('SP00000038', 'T/R Conversion kit', 'N/A', '20', '2030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('SP00000039', 'Dicing Blade', 'N/A', '30', '3030001', 'N/A', 'CV. ATB', 'N/A', 'N/A', '60', 'N/A', '60', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00'),
('SP00000040', 'Unplugger', 'N/A', '20', '2030001', 'N/A', 'CV. ATB', 'N/A', 'N/A', '50', 'N/A', '50', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` varchar(15) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `handphone` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `position` enum('technician','admin','head','iqa') NOT NULL,
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `name`, `password`, `handphone`, `email`, `position`, `address`) VALUES
('3311801035', 'pandu putra perdana', 'admin', '07787028638', 'rafiinaufal@tfme.ac.id', 'iqa', 'Mega Mall Batam Centre, Jl. Engku Putri Utara, Teluk Tering, Batam Kota, Batam City, Riau Islands 29'),
('3311801036', 'axel agatha ibrahim', 'admin', '08118430827', 'admin@tfme.polibatam.ac.id', 'technician', 'Jl. S. Parman Bida Ayu Pintu 1, Mangsang, Kec. Sei Beduk, Kota Batam, Kepulauan Riau 29433'),
('3311801037', 'putra bunda', 'admin', '082284028241', 'admin@tfme.polibatam.ac.id', 'admin', 'Jl. Ahmad Yani Batam Kota. Kota Batam. kepulauan Riau. Indonesia'),
('3311801039', 'anderson', 'admin', '082170132187', 'rachmatfauzan87@yahoo.co.id', 'technician', 'Jl laksamana jaidah bida ayu blok t jo 32, kepulauan riau Batam');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `form_po`
--
ALTER TABLE `form_po`
  ADD PRIMARY KEY (`id_po`),
  ADD KEY `id_pr` (`id_pr`);

--
-- Indeks untuk tabel `form_pr`
--
ALTER TABLE `form_pr`
  ADD PRIMARY KEY (`id_pr`);

--
-- Indeks untuk tabel `inventory-admin`
--
ALTER TABLE `inventory-admin`
  ADD PRIMARY KEY (`part_number`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `form_po`
--
ALTER TABLE `form_po`
  MODIFY `id_po` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `form_pr`
--
ALTER TABLE `form_pr`
  MODIFY `id_pr` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `form_po`
--
ALTER TABLE `form_po`
  ADD CONSTRAINT `form_po_ibfk_1` FOREIGN KEY (`id_pr`) REFERENCES `form_pr` (`id_pr`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

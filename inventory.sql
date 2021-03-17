-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Mar 2021 pada 04.20
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
-- Struktur dari tabel `dt_inventory`
--

CREATE TABLE `dt_inventory` (
  `item` varchar(50) NOT NULL,
  `part_number` varchar(100) NOT NULL,
  `supplier_no` varchar(50) NOT NULL,
  `cc` varchar(50) NOT NULL,
  `account_code` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `supplier` varchar(50) NOT NULL,
  `dwg_no` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `moq` varchar(50) NOT NULL,
  `cost` varchar(50) NOT NULL,
  `on_hand` varchar(50) NOT NULL,
  `in_transit` varchar(50) NOT NULL,
  `on_prep` varchar(50) NOT NULL,
  `on_pr_no` varchar(50) NOT NULL,
  `on_po_no` varchar(50) NOT NULL,
  `batch_no` varchar(50) NOT NULL,
  `iqa` varchar(50) NOT NULL,
  `received_date` varchar(100) NOT NULL,
  `manufacturing_date` varchar(100) NOT NULL,
  `expiration_date` varchar(100) NOT NULL,
  `po_date` varchar(100) NOT NULL,
  `pr_date` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `dt_inventory`
--

INSERT INTO `dt_inventory` (`item`, `part_number`, `supplier_no`, `cc`, `account_code`, `type`, `supplier`, `dwg_no`, `description`, `moq`, `cost`, `on_hand`, `in_transit`, `on_prep`, `on_pr_no`, `on_po_no`, `batch_no`, `iqa`, `received_date`, `manufacturing_date`, `expiration_date`, `po_date`, `pr_date`) VALUES
('Magazine lead frame', 'DM00000025', 'N/A', '30', '3010001', 'N/A', 'PT. Farsawa', 'N/A', 'N/A', '6', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2018-12-31', 'N/A', '2018-12-31', '', ''),
('Silver epoxy', 'DM00000026', 'N/A', '30', '3010001', 'Conductive', 'PT. Pilar Mas', 'N/A', 'N/A', '15', 'N/A', '15', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2018-12-20', 'N/A', 'N/A', '', ''),
('Silver epoxy', 'DM00000028', 'N/A', '30', '3010001', 'epoxy uv', 'PT. Pilar Mas', 'N/A', 'N/A', '75', 'N/A', '74', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2018-12-20', 'N/A', 'N/A', '', ''),
('Mold Comp', 'DM00000031', 'N/A', '30', '3010001', 'Green', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Solder Anode', 'DM00000032', 'N/A', '30', '3010001', 'Bar/Ball', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Ball', 'DM00000033', 'N/A', '30', '3010001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Daisy chain', 'DM00000034', 'N/A', '30', '3010001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Bondable mirror', 'DM00000035', 'N/A', '30', '3010001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Chip', 'DM00000036', 'N/A', '30', '3010001', 'N/A', 'CV. ATB', 'N/A', 'N/A', '492000', 'N/A', '492000', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2018-12-31', 'N/A', 'N/A', '', ''),
('PCB A4', 'DM00000037', 'N/A', '30', '3010001', 'N/A', 'CV. ATB', 'N/A', 'N/A', '50', 'N/A', '50', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2018-12-31', 'N/A', 'N/A', '', ''),
('Dummy wafer', 'DM00000038', 'N/A', '30', '3010001', 'N/A', 'CV. ATB', 'N/A', 'N/A', '10', 'N/A', '10', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2018-12-31', 'N/A', 'N/A', '', ''),
('PVC', 'DM00000042', 'N/A', '40', '4010001', 'N/A', 'PT. NIKKO', 'N/A', 'N/A', '400', 'N/A', '400', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2018-12-31', 'N/A', 'N/A', '', ''),
('Substrate COB', 'DM00000043', 'N/A', '40', '4010001', 'N/A', 'PT ATB', 'N/A', 'N/A', '6000', 'N/A', '6000', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2018-12-31', 'N/A', 'N/A', '', ''),
('bondable wafer', 'DM00002023', 'N/A', '30', '3010001', 'WAFER RFID LOT#DH0257', 'N/A', 'N/A', 'BINDABLE WAFER RFID D/C QTY 82000', '6', 'N/A', '5', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('blue tape', 'DM00004022', 'N/A', '30', '3010001', 'CCFMIC 4N7F +10 -1', 'N/A', 'N/A', 'CCFMIC 4N7F +10 -1', '2', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Silver epoxy', 'DM00008027', 'N/A', '30', '3010001', 'epoxy glob top 088LAE9739', 'PT. Pilar Mas', 'N/A', 'ABLESTIK 84-1LMISR4', '75', 'N/A', '74', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2018-12-20', 'N/A', '2019-11-23', '', ''),
('Gold Wire', 'DM00010029', 'N/A', '30', '3010001', 'Gold Wire 1.0 mm HER-AU WIRE-02', 'PT. Nikko', 'N/A', 'MATL : AW14 EL:2-6% BL:8-13G LF/SPL:500M', '15', 'N/A', '14', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2018-12-31', 'N/A', 'N/A', '', ''),
('Macuspec', 'DM00010039', 'N/A', '40', '4010001', 'Macuspec MP 100 Make-up', 'PT. Nikko', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2018-12-31', 'N/A', 'N/A', '', ''),
('Macuspec', 'DM00010040', 'N/A', '40', '4010001', 'Macuspec MP 100 wetter', 'PT. Nikko', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2018-12-31', 'N/A', 'N/A', '', ''),
('Macuspec', 'DM00010041', 'N/A', '40', '4010001', 'Macuspec MP 100 Brightner', 'PT. Nikko', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2018-12-31', 'N/A', 'N/A', '', ''),
('Gold wire', 'DM00013030', 'N/A', '30', '3010001', 'Gold Wire 1.3 mm', 'PT. Nikko', 'N/A', 'N/A', '5', 'N/A', '4', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2018-12-31', 'N/A', 'N/A', '', ''),
('Komponen elektronik arduino (88 modul)', 'DM00088024', 'N/A', '30', '3010001', '88 MODUL', 'PT. Nikko', 'N/A', 'N/A', '4', 'N/A', '4', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2018-12-30', '', ''),
('CHIP RESISTOR 0805 0R Ohm', 'DM00108012', 'N/A', '20', '2010001', '0805 0R Ohm', 'PT.PROFIX INSPIRA', 'N/A', 'CHIP RESISTOR 0805 0R Ohm', '2500', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('CHIP RESISTOR 0603 15K Ohm', 'DM00205013', 'N/A', '20', '2010001', '0603 15K Ohm', 'PT.PROFIX INSPIRA', 'N/A', 'CHIP RESISTOR 0603 15K Ohm', '3000', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('CHIP RESISTOR 0603 0R Ohm', 'DM00306014', 'N/A', '20', '2010001', '0603 0R Ohm', 'PT.PROFIX INSPIRA', 'N/A', 'CHIP RESISTOR 0603 0R Ohm', '3900', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('MODUL CASING (THERMOPLASTIC MOLDED)', 'DM00700015', 'N/A', '20', '2010001', 'N/A', 'PT. Tata Sarana Mandiri', 'N/A', 'N/A', '250', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('MODUL PCB (PRINTED CIRCUITS BOARD)', 'DM00800016', 'N/A', '20', '2010001', 'N/A', 'PT. Tata Sarana Mandiri', 'N/A', 'N/A', '250', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('MODUL COMPONENT', 'DM00900017', 'N/A', '20', '2010001', 'N/A', 'PT.Tata Sarana Mandiri', 'N/A', 'N/A', '250', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('SOLDER PASTE Sn 63%/Pb 37%', 'DM01063018', 'N/A', '20', '2010001', 'Sn 63%/Pb 37%', 'PT.SOLDER INDONESIA', 'N/A', 'SOLDER PASTE Sn 63%/Pb 37%', '1', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('SOLDER BAR Sn 63%/Pb37%', 'DM01163019', 'N/A', '20', '2010001', 'Sn 63%/Pb37%', 'PT. FANINDO CHIPTRONIC', 'N/A', 'SOLDER BAR Sn 63%/Pb37%', '150', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('SOLDER FLUX', 'DM01200020', 'N/A', '20', '2010001', 'N/A', 'PT.FANINDO CHIPTRONIC', 'N/A', 'N/A', '18', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2018-08-30', '', ''),
('METAL MASK/SOLDER PASTE STENCIL', 'DM01300021', 'N/A', '20', '2010001', 'N/A', 'PT.ADVANCE CIRCUITS DCI', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('WAFER', 'DM03506001', 'N/A', '30', '3010001', '6\" DUMMY WAFER 82000', 'N/A', 'N/A', '6\" DUMMY WAFER 82000', '0', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('EPOXY MOLDING COMPOUND', 'DM03600002', 'N/A', '30', '3010001', 'N/A', 'N/A', 'N/A', 'N/A', '0', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2012-12-03', '', ''),
('PC COPPER PLATING SOLUTION (PT0176)', 'DM04801044', 'N/A', '10', '1010001', 'PT0176', 'PCB GRAPHTECH PTE LTD', 'N/A', 'PC COPPER PLATING SOLUTION (PT0176)', '', 'N/A', '11', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2019-08-18', '', ''),
('PCB LEMBARAN (KOSONG)', 'DM04900011', 'N/A', '10', '1010001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Wafer MTF128G08CBECBL95B3WC1', 'DM05112003', 'N/A', '30', '3010001', 'Wafer MTF128G08CBECBL95B3WC1', 'PT. NESYER ELECTRONICS', 'N/A', 'Wafer MTF128G08CBECBL95B3WC1', '291', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Syringe Silver Epoxy 5cc', 'DM05260004', 'N/A', '30', '3010001', 'FP-6001S', 'MILLICE', 'N/A', 'Syringe Silver Epoxy 5cc', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Solder Paste SCS7 (Sn/Cu 0.7%/SiO 02%)', 'DM05407006', 'N/A', '30', '3010001', 'SCS7 (Sn/Cu 0.7%/SiO 02%)', 'PT. FANINDO CHIPTRONIC', 'N/A', 'Solder Paste SCS7 (Sn/Cu 0.7%/SiO 02%)', '5', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('SOLDER MASK DRY FILM TYPE KM 5030\n(03000051)', 'DM05450045', 'N/A', '10', '1010001', 'KM5030 03000051', 'PCB GRAPHTECH PTE LTD', 'N/A', 'SOLDER MASK DRY FILM TYPE KM 5030\n(03000051)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Solder Paste Sn 99%/Ag 3%/Cu 0.7%)', 'DM05599007', 'N/A', '30', '3010001', '99%/Ag 3%/Cu 0.7%)', 'PT.SOLDER INDONESIA', 'N/A', 'Solder Paste Sn 99%/Ag 3%/Cu 0.7%)', '1', 'N/A', '2', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2014-10-11', '', ''),
('Solder Bar Sn-R/Cu 0.7%/Ni/P', 'DM05607008', 'N/A', '30', '3010001', 'Sn-R/Cu 0.7%/Ni/P', 'PT.SOLDER INDONESIA', 'N/A', 'Solder Bar Sn-R/Cu 0.7%/Ni/P', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Solder Paste Sn 96.5%/Ag 3%/Cu 0.5%', 'DM05896009', 'N/A', '30', '3010001', 'Sn 96.5%/Ag 3%/Cu 0.5%', 'PT.SOLDER INDONESIA', 'N/A', 'Solder Paste Sn 96.5%/Ag 3%/Cu 0.5%', '20', 'N/A', '20', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2018-12-31', 'N/A', 'N/A', '', ''),
('Solder Paste Sn 99%/Ag 0.3%/Cu 0.7%', 'DM05999010', 'N/A', '30', '3010001', 'Sn 99%/Ag 0.3%/Cu 0.7%', 'PT.SOLDER INDONESIA', 'N/A', 'Solder Paste Sn 99%/Ag 0.3%/Cu 0.7%', '1', 'N/A', '38', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2015-04-02', '', ''),
('Gold Wire 1.25mils', 'DM06012005', 'N/A', '30', '3010001', '1.25MILS', 'HERAEUS', 'N/A', 'Gold Wire 1.25mils', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Solder mask film (general)', 'DM07600046', 'N/A', '10', '1010001', 'N/A', 'N/A', 'N/A', 'Solder mask film (general)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('SOLDER RESIST INK UM-1000 (WHITE)', 'DM09710047', 'N/A', '10', '1010001', 'UM-1000', 'PCB GRAPHTECH PTE LTD', 'N/A', 'SOLDER RESIST INK UM-1000 (WHITE)', '', 'N/A', '5', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2015-02-12', '', ''),
('Sand paper', 'GN00000233', 'N/A', '20', '2010001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Melamine rubber', 'GN00000234', 'N/A', '20', '2010001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Wax rubber', 'GN00000235', 'N/A', '20', '2010001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Electroclean', 'GN00000236', 'N/A', '20', '2010001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Descaler', 'GN00000237', 'N/A', '20', '2010001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Plating', 'GN00000238', 'N/A', '20', '2010001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Flux', 'GN00000239', 'N/A', '20', '2010001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Sticky mat', 'GN00000242', 'N/A', '40', '4020001', 'N/A', 'PT. Nikko', 'N/A', 'sticky mat size 26\"x45\" clour blue', '200', 'N/A', '200', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2018-12-26', 'N/A', 'N/A', '', ''),
('Finget coat', 'GN00000243', 'N/A', '40', '4010001', 'N/A', 'PT. Nikko', 'N/A', 'N/A', '150', 'N/A', '144', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2018-12-27', 'N/A', 'N/A', '', ''),
('Gloves', 'GN00000244', 'N/A', '40', '4010001', 'N/A', 'PT. Nikko', 'N/A', 'N/A', '80', 'N/A', '64', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2018-12-28', 'N/A', 'N/A', '', ''),
('Capillary', 'GN00000245', 'N/A', '30', '3010001', 'N/A', 'CV. ATB', 'N/A', 'N/A', '300', 'N/A', '299', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2018-12-31', 'N/A', 'N/A', '', ''),
('Dicing blade', 'GN00000246', 'N/A', '30', '3010001', 'N/A', 'CV. ATB', 'N/A', 'N/A', '60', 'N/A', '50', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2018-12-31', 'N/A', 'N/A', '', ''),
('Unplugger', 'GN00000247', 'N/A', '40', '4010001', 'N/A', 'CV. ATB', 'N/A', 'N/A', '50', 'N/A', '60', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2018-12-31', 'N/A', 'N/A', '', ''),
('Sodium Hidroxide', 'GN00000248', 'N/A', '40', '4010001', 'N/A', 'PT. Nikko', 'N/A', 'N/A', '3', 'N/A', '3', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2018-12-30', 'N/A', 'N/A', '', ''),
('UV Lamp DI Water', 'GN00000249', 'N/A', '40', '4010001', 'N/A', 'PT. Pilar Mas', 'N/A', 'N/A', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2018-12-20', 'N/A', 'N/A', '', ''),
('Hepa Filter CW Aluminium', 'GN00000250', 'N/A', '40', '4010001', 'N/A', 'PT. Pilar Mas', 'N/A', 'N/A', '20', 'N/A', '20', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2018-12-20', 'N/A', 'N/A', '', ''),
('Nitrogen cair', 'GN00000251', 'N/A', '40', '4010001', 'N/A', 'PT. Soxal', 'N/A', 'N/A', '28', 'N/A', '20', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2018-12-31', 'N/A', 'N/A', '', ''),
('PVC', 'GN00000252', 'N/A', '40', '4010001', 'N/A', 'PT. Nikko', 'N/A', 'N/A', '400', 'N/A', '400', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2018-12-31', 'N/A', 'N/A', '', ''),
('Substrate ', 'GN00000253', 'N/A', '40', '4010001', 'COB', 'CV. ATB', 'N/A', 'N/A', '6000', 'N/A', '5990', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2018-12-31', 'N/A', 'N/A', '', ''),
('Blackhole ', 'GN00000254', 'N/A', '40', '4010001', 'Blackhole Microclean', 'PT. Nikko', 'N/A', 'N/A', '1', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2018-12-31', 'N/A', 'N/A', '', ''),
('PC Acid copper plating solution', 'GN00000255', 'N/A', '40', '4010001', 'N/A', 'PT. Nikko', 'N/A', 'N/A', '1', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2018-12-31', 'N/A', 'N/A', '', ''),
('Sodium Hidroxide', 'GN00000256', 'N/A', '40', '4010001', 'N/A', 'PT. NIKKO', 'N/A', 'N/A', '3', 'N/A', '3', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2018-12-31', 'N/A', 'N/A', '', ''),
('UV Lamp DI Water', 'GN00000257', 'N/A', '40', '4010001', 'N/A', 'PT. Pilar Mas', 'N/A', 'N/A', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2018-12-20', 'N/A', 'N/A', '', ''),
('Hepa Filter CW Aluminium', 'GN00000258', 'N/A', '40', '4010001', 'N/A', 'PT. Pilar Mas', 'N/A', 'N/A', '20', 'N/A', '20', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2018-12-20', 'N/A', 'N/A', '', ''),
('Nitrogen cair', 'GN00000259', 'N/A', '40', '4010001', 'N/A', 'PT. Soxal', 'N/A', 'N/A', '28', 'N/A', '20', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2018-12-31', 'N/A', 'N/A', '', ''),
('CCD MW', 'GN00000260', 'N/A', '10', '1020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('IN LINE AIR DRYER', 'GN00000262', 'N/A', '10', '1020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Through-Hole Elating Line', 'GN00000263', 'N/A', '10', '1020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Black Oxide OSP Machine I', 'GN00000265', 'N/A', '10', '1020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('DRY LAMINATING', 'GN00000266', 'N/A', '10', '1020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('PHOTOPLOTTER', 'GN00000267', 'N/A', '10', '1020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('AKTINA S', 'GN00000268', 'N/A', '10', '1020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('WALTER LEMMEN I ETTCHING CENTER', 'GN00000269', 'N/A', '10', '1020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('FILM SCREEN PRINTER', 'GN00000270', 'N/A', '10', '1020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Print screen', 'GN00000271', 'N/A', '10', '1020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Auto Megazine Loader ', 'GN00000272', 'N/A', '20', '2020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Multi Connection Conveyor', 'GN00000273', 'N/A', '20', '2020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Lead Free Soldering Machine', 'GN00000274', 'N/A', '20', '2020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Offline Automatic Optic Inspection (AOI)', 'GN00000275', 'N/A', '20', '2020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('PCB Moving Probe Tester', 'GN00000276', 'N/A', '20', '2020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Nonstop Tray Feeder', 'GN00000277', 'N/A', '20', '2020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Megazine Unloader', 'GN00000278', 'N/A', '20', '2020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Uploader', 'GN00000279', 'N/A', '20', '2020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Solder Paste Printer', 'GN00000280', 'N/A', '20', '2020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Pick and Place', 'GN00000281', 'N/A', '20', '2020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('reflow oven', 'GN00000282', 'N/A', '20', '2020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Downloader', 'GN00000283', 'N/A', '20', '2020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Automatic optical Inspection', 'GN00000284', 'N/A', '20', '2020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('wave solder', 'GN00000285', 'N/A', '20', '2020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('High Performance Air Flow Oven', 'GN00000286', 'N/A', '20', '2020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Deflashing & Tin Plating System', 'GN00000290', 'N/A', '30', '3020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('De-Junk. Trim. Form & Singulation', 'GN00000292', 'N/A', '30', '3020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('IC Molding Fico MMS-i', 'GN00000293', 'N/A', '30', '3020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('PC Phenom Pro X', 'GN00000295', 'N/A', '30', '3020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Picking System', 'GN00000296', 'N/A', '30', '3020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Zonke Equipment (Automatic Die Bonder)', 'GN00000298', 'N/A', '30', '3020001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Tray', 'GN00010241', 'N/A', '20', '2010001', 'TRAY 100LQFP ISI 90', 'N/A', 'N/A', 'TRAY 100LQFP ISI 90', 'N/A', 'N/A', '16', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Resin Blade ', 'GN00023240', 'N/A', '20', '2010001', 'HUBLESS TYPE BLADE SDC230-R100NMR', 'ACCRETECH TOKYO SEIMITSU CO.LTD', 'N/A', 'RESIN BLADE HUBLESS TYPE BLADE OD 55.220D ID40.000H TICKNESS 0.52T', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('BRUSHING RMB 300', 'GN00030261', 'N/A', '10', '1020001', 'RMB300', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Metal blade', 'GN00035232', 'N/A', '20', '2010001', 'HUB TYPE BLADE SPEC CCBR352576', 'ACCRETECH TOKYO SEIMITSU CO.LTD', 'N/A', 'METAL BLADE HIGH TEMP  KERF WIDTH 0.025 T EXPOSURE 0.760 L', 'N/A', 'N/A', '6', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Royce DE35-st Semi Automatic Die Handler', 'GN00035297', 'N/A', '30', '3020001', 'DE-35-st', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('OVEN UFB 400', 'GN00040264', 'N/A', '10', '1020001', 'UFB 400', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Drying Oven VWR 47746-712', 'GN00047291', 'N/A', '30', '3020001', 'VWR 47746-712', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('ADT (Advance Dicing Technologies) 7100', 'GN00071288', 'N/A', '30', '3020001', '7100', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
(' Measure Scope KY-90', 'GN00090294', 'N/A', '30', '3020001', 'KY-90', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('ADT (Advance Dicing Technologies) WM - 966', 'GN00096289', 'N/A', '30', '3020001', 'WM-966', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('ADT (Advance Dicing Technologies) 977', 'GN00097287', 'N/A', '30', '3020001', '977', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Kain screen', 'GN00100001', 'N/A', '40', '4010001', 'N/A', 'N/A', 'N/A', 'Kain screen', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('ACETON', 'GN00100069', 'N/A', '30', '3010001', 'Teknis', 'PT. Prochem Tritama', 'N/A', 'ACETON', '1', 'N/A', '18', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2020-06-30', '', ''),
('ACETIC ACID', 'GN00100112', 'N/A', '10', '1010001', 'N/A', 'N/A', 'N/A', 'ACETIC ACID', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Tong plastik limbah', 'GN00200002', 'N/A', '40', '4010001', 'N/A', 'N/A', 'N/A', 'Tong plastik limbah', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('AMONIA', 'GN00200113', 'N/A', '10', '1010001', 'N/A', 'N/A', 'N/A', 'AMONIA', '', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2017-01-31', '', ''),
('ADDITIVE S-1', 'GN00231070', 'N/A', '30', '3010001', 'code 318000', 'TECHNIC ASIA PACIFIC PTE LTD', 'N/A', 'ADDITIVE S-1', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('FC840 VBLUE 1KG (3D PRINTER STRATASYS-\nPOLYJET OBJ', 'GN00304003', 'N/A', '40', '4020001', 'OBJ-04034', 'PT.HONG CEK', 'N/A', 'FC840 VBLUE 1KG (3D PRINTER STRATASYS-\nPOLYJET OBJECT30)', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('CAPILLARY', 'GN00312071', 'N/A', '30', '3020001', '1.2-1.3STD3.9-6.0', 'DOU YEE', 'N/A', 'CAPILLARY', '60', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('BLACKHOLE ACID CLEANER 717 (P175032)', 'GN00317114', 'N/A', '10', '1010001', 'P175032', 'PCB GRAPHTECH PTE LTD', 'N/A', 'BLACKHOLE ACID CLEANER 717 (P175032)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('CCCFMIC 1N0F +5% -5%', 'GN00400229', 'N/A', '20', '2010001', 'PHOTOGRAPHIC FILM', 'PT.PROFIX INSPIRA', 'N/A', 'PHOTOGRAPHIC FILM', '2800', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('FC705 SUPPORT RESIN 1KG (3D PRINTER STRATAYS-POLYJ', 'GN00404004', 'N/A', '40', '4020001', 'OBJ-04020', 'PT.HONG CEK', 'N/A', 'FC705 SUPPORT RESIN 1KG (3D PRINTER\nSTRATAYS-POLYJET OBJECT30)', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('BLACKHOLE ANTI TARNISH (P115711)', 'GN00411115', 'N/A', '10', '1010001', 'P115711', 'PCB GRAPHTECH PTE LTD', 'N/A', 'BLACKHOLE ANTI TARNISH (P115711)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('CS liquid conducting solution', 'GN00467072', 'N/A', '30', '3010001', 'code : X6762000', 'TECHNIC ASIA PACIFIC PTE LT', 'N/A', 'CS liquid conducting solution', '5', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('DAISY TEST WAFER', 'GN00500073', 'N/A', '30', '3010001', 'N/A', 'N/A', 'N/A', 'DAISY TEST WAFER', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('CL21C150JBNC', 'GN00501230', 'N/A', '20', '2010001', 'CCCFMIC 1N0F +5% -5%', 'PT.PROFIX INSPIRA', 'N/A', 'CCCFMIC 1N0F +5% -5%', '2000', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('BLACKHOLE CLEANER ESP A(P115743)', 'GN00511116', 'N/A', '10', '1010001', 'P115743', 'PT NIKKO', 'N/A', 'BLACKHOLE CLEANER ESP A(P115743)', '1', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2018-12-31', 'N/A', '2019-08-16', '', ''),
('PROTEK L1 PRE-TREAT/DI WATER GENERATOR \"ELGA\" CONS', 'GN00517005', 'N/A', '40', '4010001', 'LC175', 'CHEMOSIENCE INDONESIA', 'N/A', 'PROTEK L1 PRE-TREAT/DI WATER\nGENERATOR \"ELGA\" CONSUMABLES', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('BLACKHOLE CLEANER ESP B (P115744)', 'GN00611117', 'N/A', '10', '1010001', 'P115744', 'PT NIKKO', 'N/A', 'BLACKHOLE CLEANER ESP B (P115744)', '1', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2018-12-31', 'N/A', '2019-08-16', '', ''),
('Filter 0.2 MIC 10\" pleat LC204', 'GN00620006', 'N/A', '40', '4020001', 'LC204', 'CHEMOSIENCE INDONESIA', 'N/A', 'Filter 0.2 MIC 10\" pleat LC204', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('CCFMIC 4N7F +10 -1', 'GN00621231', 'N/A', '20', '2010001', 'CL21C150JBNC', 'PT.PROFIX INSPIRA', 'N/A', 'CL21C150JBNC', '2800', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('DIE TIP LARGE AREA', 'GN00700074', 'N/A', '30', '3010001', 'N/A', 'N/A', 'N/A', 'DIE TIP LARGE AREA', '', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('BH MICROCLEAN 1 @@ (P115702)', 'GN00711118', 'N/A', '10', '1010001', 'P115702', 'PCB GRAPHTECH PTE LTD', 'N/A', 'BH MICROCLEAN 1 @@ (P115702)', '', 'N/A', '25', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2017-11-07', '', ''),
('Protek L2 Pre-treat cartrigde (ELGA- Consumables)', 'GN00717007', 'N/A', '40', '4010001', 'LC177', 'CHEMOSIENCE INDONESIA', 'N/A', 'Protek L2 Pre-treat cartrigde (ELGA-\nConsumables)', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Alkohol (Ethanol) Teknis', 'GN00800008', 'N/A', '40', '4010001', 'N/A', 'N/A', 'N/A', 'Alkohol (Ethanol) Teknis', '', 'N/A', '17', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '21/04/0000', '', ''),
('EP1 SCREEN GLOSS VYNIL', 'GN00800075', 'N/A', '30', '3010001', 'N/A', 'N/A', 'N/A', 'EP1 SCREEN GLOSS VYNIL', '', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('BLACKHOLE (TM) SP REPLENISHER (P115746)', 'GN00811119', 'N/A', '10', '1010001', 'P115746', 'PT. Nikko', 'N/A', 'BLACKHOLE (TM) SP REPLENISHER (P115746)', '1', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2018-12-31', 'N/A', 'N/A', '', ''),
('BLACKHOLE SP STARTER (P115735)', 'GN00911120', 'N/A', '10', '1010001', 'P115735', 'PT NIKKO', 'N/A', 'BLACKHOLE SP STARTER (P115735)', '1', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2018-12-31', 'N/A', '2017-12-01', '', ''),
('Module degasser E-cartridge (ELGA- Consumables)', 'GN00918009', 'N/A', '40', '4010001', 'LC181', 'CHEMOSIENCE INDONESIA', 'N/A', 'Module degasser E-cartridge (ELGA-\nConsumables)', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('COPPER SULFAT PENTAHYDRATE', 'GN01000121', 'N/A', '10', '1010001', 'N/A', 'PROCHEM TRITAMA', 'N/A', 'COPPER SULFAT PENTAHYDRATE', '20', 'N/A', '20', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2018-11-14', '', ''),
('Purification pack-purelab (ELGA- Consumables)', 'GN01018010', 'N/A', '40', '4010001', 'LC187', 'CHEMOSIENCE INDONESIA', 'N/A', 'Purification pack-purelab (ELGA-\nConsumables)', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('DEVELOPER REPLENISHER (FUJIFILM)', 'GN01100122', 'N/A', '10', '1010001', 'N/A', 'SARKARA INTI UTAMA', 'N/A', 'DEVELOPER REPLENISHER (FUJIFILM)', '', 'N/A', '13', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Chemical elgalite CT1 tablets (ELGA- Consumables)', 'GN01101011', 'N/A', '40', '4010001', 'CT1', 'CHEMOSIENCE INDONESIA', 'N/A', 'Chemical elgalite CT1 tablets (ELGA-\nConsumables)', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('JM 6000 MAKE UP', 'GN01102076', 'N/A', '30', '3010001', 'MC0282L', 'TECHNIC ASIA PACIFIC PTE LTD', 'N/A', 'JM 6000 MAKE UP', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('UV lamp for maxima HPLC (ELGA- Consumables)UV lamp', 'GN01211012', 'N/A', '40', '4010001', 'LC118', 'CHEMOSIENCE INDONESIA', 'N/A', 'UV lamp for maxima HPLC (ELGA- Consumables)UV lamp for maxima HPLC\n(ELGA-Consumables)', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('ELIMINATOR II MAKE UP (SP179212)', 'GN01217123', 'N/A', '10', '1010001', 'SP179212', 'PCB GRAPHTECH PTE LTD', 'N/A', 'ELIMINATOR II MAKE UP (SP179212)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('JM 6000 SOLUTION', 'GN01260077', 'N/A', '30', '3010001', 'JM 6000 SOLUTION', 'TECHNIC ASIA PACIFIC PTE LTD', 'N/A', 'JM 6000 SOLUTION', '', 'N/A', '5', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2015-08-15', '', ''),
('FERRIC CHLORIDE (FeCl3) PA', 'GN01300124', 'N/A', '10', '1010001', 'N/A', 'NIKKO INDONESIA', 'N/A', 'FERRIC CHLORIDE (FeCl3) PA', '', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('LC136 Mark 2-composite vent folter (ELGA-Consumabl', 'GN01313013', 'N/A', '40', '4010001', 'LC136M2', 'CHEMOSIENCE INDONESIA', 'N/A', 'LC136 Mark 2-composite vent folter (ELGA-\nConsumables)', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2014-08-14', '', ''),
('NF ACID 10%', 'GN01400078', 'N/A', '30', '3010001', 'MC00751', 'TECHNIC ASIA PACIFIC PTE LTD', 'N/A', 'NF ACID 10%', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('FINAL FINISH ACID CLEANER (P175039)', 'GN01417125', 'N/A', '10', '1010001', 'P175039', 'PCB GRAPHTECH PTE LTD', 'N/A', 'FINAL FINISH ACID CLEANER (P175039)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('60 I/HR RO cartridge (ELGA-Consumables)', 'GN01418014', 'N/A', '40', '4010001', 'LC180', 'CHEMOSIENCE INDONESIA', 'N/A', '60 I/HR RO cartridge (ELGA-Consumables)', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('HS ADDITIVE', 'GN01500079', 'N/A', '30', '3010001', 'OTUS$GLS', 'TECHNIC ASIA PACIFIC PTE LTD', 'N/A', 'HS ADDITIVE', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('FIXER FILMSTAR ( 01003101)', 'GN01510126', 'N/A', '10', '1010001', '1003101', 'PCB GRAPHTECH PTE LTD', 'N/A', 'FIXER FILMSTAR ( 01003101)', '', 'N/A', '55', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('PRE-TREATMENT CARTRIDGE', 'GN01514015', 'N/A', '40', '4010001', 'LC 140', 'CHEMOSIENCE INDONESIA', 'N/A', 'PRE-TREATMENT CARTRIDGE', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('HS ELECTROLYTE ADDITIVE-50 LB', 'GN01600080', 'N/A', '30', '3010001', 'OTUS$LBS', 'TECHNIC ASIA PACIFIC PTE LTD', 'N/A', 'HS ELECTROLYTE ADDITIVE-50 LB', '5', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('REVERSE OSMOSIS CARTRIDGE MODULE', 'GN01614016', 'N/A', '40', '4010001', 'LC 143', 'CHEMOSIENCE INDONESIA', 'N/A', 'REVERSE OSMOSIS CARTRIDGE MODULE', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('ASAM SULFAT (H2SO4) 98% TEKNIS', 'GN01698127', 'N/A', '10', '1010001', '98%', 'PT.AIK MOH CHEMICALS INDONESIA', 'N/A', 'ASAM SULFAT (H2SO4) 98% TEKNIS', '5', 'N/A', '30', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2018-08-30', '', ''),
('OT Gold Replenisher', 'GN01700081', 'N/A', '30', '3010001', 'N/A', 'N/A', 'N/A', 'OT Gold Replenisher', '50', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('SANIZATIZION TABLETS', 'GN01703017', 'N/A', '40', '4010001', 'CT3', 'CHEMOSIENCE INDONESIA', 'N/A', 'SANIZATIZION TABLETS', '1', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2015-04-24', '', ''),
('ASAM KLORIDA (HCl) 33% TEKNIS', 'GN01733128', 'N/A', '10', '1010001', '33%', 'PT.AIK MOH CHEMICALS INDONESIA', 'N/A', 'ASAM KLORIDA (HCl) 33% TEKNIS', '5', 'N/A', '20', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2018-08-30', '', ''),
('PH + Control ACR', 'GN01800082', 'N/A', '30', '3010001', 'N/A', 'N/A', 'N/A', 'PH + Control ACR', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('HS ACCU GUARD REPLENISHER (P117019)', 'GN01811129', 'N/A', '10', '1010001', 'P117019', 'PCB GRAPHTECH PTE LTD', 'N/A', 'HS ACCU GUARD REPLENISHER (P117019)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('COMPOSITE VENT FILTER', 'GN01813018', 'N/A', '40', '4010001', 'LC 136', 'CHEMOSIENCE INDONESIA', 'N/A', 'COMPOSITE VENT FILTER', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('PH CONTROL', 'GN01900083', 'N/A', '30', '3010001', 'N/A', 'N/A', 'N/A', 'PH CONTROL', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('HS ACCU GUARD STARTER (P117009)', 'GN01911130', 'N/A', '10', '1010001', 'P117009', 'PCB GRAPHTECH PTE LTD', 'N/A', 'HS ACCU GUARD STARTER (P117009)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('PRE-TREATMENT FILTER', 'GN01912019', 'N/A', '40', '4010001', 'LC 123', 'CHEMOSIENCE INDONESIA', 'N/A', 'PRE-TREATMENT FILTER', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('AIR COMPRESSOR \"SULLAIR\" CONSUMABLES', 'GN02000020', 'N/A', '40', '4010001', 'N/A', 'N/A', 'N/A', 'AIR COMPRESSOR \"SULLAIR\" CONSUMABLES', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('PLATINUM MESH', 'GN02000084', 'N/A', '30', '3010001', 'N/A', 'N/A', 'N/A', 'PLATINUM MESH', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('ISOPROPIL ALKOHOL (IPA)', 'GN02000131', 'N/A', '10', '1010001', 'ISOPROPYL ALCOHOL 18LTR/TIN', 'PT AIK MOH CHEMICALS INDONESIA', 'N/A', 'ISOPROPYL ALCOHOL BATCH NO. 1410T015 PACKING 18LTR/TIN', '5', 'N/A', '18', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2016-10-08', '', ''),
('Potasium gold cyanide', 'GN02100085', 'N/A', '30', '3010001', 'N/A', 'N/A', 'N/A', 'Potasium gold cyanide', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('LAMINAR DRY FILM PHOTOPOLYMER 5038 (03000780)\n', 'GN02150132', 'N/A', '10', '1010001', '5038 3000780', 'PCB GRAPHTECH PTE LTD', 'N/A', 'LAMINAR DRY FILM PHOTOPOLYMER 5038\n(03000780)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('OIL FILTER', 'GN02188021', 'N/A', '40', '4010001', 'PN.88290014-484', 'PETROTEC AIR POWER', 'N/A', 'OIL FILTER', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('#M 79224 ALKALI K (P179224)', 'GN02217133', 'N/A', '10', '1010001', 'P179224', 'PCB GRAPHTECH PTE LTD', 'N/A', '#M 79224 ALKALI K (P179224)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Potasium Silver Sianide 54.2%', 'GN02254086', 'N/A', '30', '3010001', 'Potasium Silver Sianide 54.2%', 'N/A', 'N/A', 'Potasium Silver Sianide 54.2%', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('AIR FILTER', 'GN02288022', 'N/A', '40', '4010001', 'PN.88290014-486', 'PETROTEC AIR POWER', 'N/A', 'AIR FILTER', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('REDUCER M3', 'GN02303087', 'N/A', '30', '3010001', 'REDUCER M3', 'N/A', 'N/A', 'REDUCER M3', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('#MACUDIZER 9276 (P119276)', 'GN02311134', 'N/A', '10', '1010001', 'P119276', 'PCB GRAPHTECH PTE LTD', 'N/A', '#MACUDIZER 9276 (P119276)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('SEPARATOR ELEMENT', 'GN02388023', 'N/A', '40', '4010001', 'PN.88290015-049', 'PETROTEC AIR POWER', 'N/A', 'SEPARATOR ELEMENT', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('RESIN MOLDING COMPOUND', 'GN02400088', 'N/A', '30', '3010001', 'N/A', 'N/A', 'N/A', 'RESIN MOLDING COMPOUND', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('MACUDIZER 9279 (P119279)', 'GN02411135', 'N/A', '10', '1010001', 'P119279', 'PCB GRAPHTECH PTE LTD', 'N/A', 'MACUDIZER 9279 (P119279)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('LUBRICANT SULLUBE', 'GN02425024', 'N/A', '', '4010001', 'PN.250022-669', 'PETROTEC AIR POWER', 'N/A', 'LUBRICANT SULLUBE', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('MACUSPEC MP 100 BRIGHTENER (P172493)', 'GN02517136', 'N/A', '10', '1010001', 'P172493', 'PCB GRAPHTECH PTE LTD', 'N/A', 'MACUSPEC MP 100 BRIGHTENER (P172493)', '', 'N/A', '20', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2017-07-27', '', ''),
('SYNTHETIC RUBBER CLEAN', 'GN02560089', 'N/A', '30', '3010001', 'C60', 'Amemas SDN', 'N/A', 'SYNTHETIC RUBBER CLEAN', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Clean room paper', 'GN02600025', 'N/A', '40', '4010001', 'N/A', 'NIKKO INDONESIA', 'N/A', 'Clean room paper', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('MACUSPEC MP 100 MAKE UP (P172491)', 'GN02617137', 'N/A', '10', '1010001', 'P172491', 'PCB GRAPHTECH PTE LTD', 'N/A', 'MACUSPEC MP 100 MAKE UP (P172491)', '', 'N/A', '19', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2017-08-17', '', ''),
('SYNTHETIC RUBBER WAX', 'GN02680090', 'N/A', '30', '3010001', 'W80', 'Amemas SDn', 'N/A', 'SYNTHETIC RUBBER WAX', '200', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('\"LED street light turtle series SL-0202M-TX-\nDC Mo', 'GN02702026', 'N/A', '40', '4010001', 'SL-0202M-TX-DC Modular 40W ?5500lm. CCT:4000K. 12/', 'SOLARENS', 'N/A', '\"LED street light turtle series SL-0202M-TX-\nDC Modular 40W ?5500lm. CCT:4000K. 12/24VDC/220VAC\"', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('TECHNI ACT- 909 RTU', 'GN02705091', 'N/A', '30', '3010001', 'MC0595SL', 'TECHNIC ASIA PACIFIC PTE LTD', 'N/A', 'TECHNI ACT- 909 RTU', '200', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('MACUSPEC MP 100 WETTER (P172492)', 'GN02717138', 'N/A', '10', '1010001', 'P172492', 'PCB GRAPHTECH PTE LTD', 'N/A', 'MACUSPEC MP 100 WETTER (P172492)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('LED street light shark series SL-0503M-O\n80W. ?900', 'GN02805027', 'N/A', '', '4010001', ' SL-0503M-O 80W. ?9000lm. 4000K. 24VDC/220VAC', 'SOLARENS', 'N/A', 'LED street light shark series SL-0503M-O\n80W. ?9000lm. 4000K. 24VDC/220VAC', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('MATA BOR 1.3 mm (drill bit)', 'GN02813139', 'N/A', '10', '1010001', '1.3MM', 'CV G-TECH', 'N/A', 'MATA BOR 1.3 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Technic Silver EHS Make up-50 LB/DM', 'GN02831092', 'N/A', '30', '3010001', 'code : 310506', 'TECHNIC ASIA PACIFIC PTE LTD', 'N/A', 'Technic Silver EHS Make up-50 LB/DM', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('LED street light square series SL-0305M-TX 125W. ?', 'GN02903028', 'N/A', '40', '4010001', ' SL-0305M-TX 125W. ?16250lm. 4000K. 24VDC/220VAC', 'SOLARENS', 'N/A', 'LED street light square series SL-0305M-TX 125W. ?16250lm. 4000K. 24VDC/220VAC', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('TECHNI TSC-1509 RTU', 'GN02905093', 'N/A', '30', '3010001', 'MC0507L', 'TECHNIC ASIA PACIFIC PTE LTD', 'N/A', 'TECHNI TSC-1509 RTU', '50', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('MATA BOR 1.5 mm (drill bit)', 'GN02915140', 'N/A', '10', '1010001', '1.5MM', 'CV G-TECH', 'N/A', 'MATA BOR 1.5 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('MATA BOR 1.8 mm (drill bit)', 'GN03018141', 'N/A', '10', '1010001', '1.8MM', 'CV G-TECH', 'N/A', 'MATA BOR 1.8 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Philips LED Tube light essential 20 W 1200mm TB', 'GN03020029', 'N/A', '40', '4010001', '20 W 1200mm TB', 'SOLARENS', 'N/A', 'Philips LED Tube light essential 20 W\n1200mm TB', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Technic Silver EHS 3R Brightner', 'GN03031094', 'N/A', '30', '3010001', 'code : 310609', 'TECHNIC ASIA PACIFIC PTE LTD', 'N/A', 'Technic Silver EHS 3R Brightner', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Etanol teknis', 'GN03100030', 'N/A', '40', '4010001', 'N/A', 'N/A', 'N/A', 'Etanol teknis', '', 'N/A', '18000', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('MATA BOR 2.0 mm (drill bit)', 'GN03120142', 'N/A', '10', '1010001', '2.0MM', 'CV G-TECH', 'N/A', 'MATA BOR 2.0 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Technic Silver EHS Additive', 'GN03131095', 'N/A', '30', '3010001', 'code : 311508', 'TECHNIC ASIA PACIFIC PTE LTD', 'N/A', 'Technic Silver EHS Additive', '5', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('TQFP IC tray', 'GN03200096', 'N/A', '30', '3010001', 'N/A', 'N/A', 'N/A', 'TQFP IC tray', '5', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Sepatu ESD ', 'GN03223031', 'N/A', '40', '4020001', 'Sepatu ESD No. 235', 'N/A', 'N/A', 'Sepatu ESD No. 235', '-', 'N/A', '10', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2017-11-09', '', ''),
('MATA BOR 2.5 mm (drill bit)', 'GN03225143', 'N/A', '10', '1010001', '2.5MM', 'CV G-TECH', 'N/A', 'MATA BOR 2.5 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Sepatu ESD ', 'GN03325032', 'N/A', '40', '4020001', 'Sepatu ESD No. 250', 'N/A', 'N/A', 'Sepatu ESD No. 250', '-', 'N/A', '19', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2017-11-09', '', ''),
('MATA BOR 3.0 mm (drill bit)', 'GN03330144', 'N/A', '10', '1010001', '3.0MM', 'CV G-TECH', 'N/A', 'MATA BOR 3.0 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('PURE TIN HULL CELL ANODE (99.92%) Assy', 'GN03400097', 'N/A', '30', '3010001', 'SP00010A', 'TECHNIC ASIA PACIFIC PTE LTD', 'N/A', 'PURE TIN HULL CELL ANODE (99.92%) Assy', '4', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Sepatu ESD', 'GN03425033', 'N/A', '40', '4020001', 'Sepatu ESD No. 255', 'N/A', 'N/A', 'Sepatu ESD No. 255', '-', 'N/A', '5', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2017-11-09', '', ''),
('MATA BOR 3.2 mm (drill bit)', 'GN03432145', 'N/A', '10', '1010001', '3.2MM', 'CV G-TECH', 'N/A', 'MATA BOR 3.2 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Sepatu ESD ', 'GN03526034', 'N/A', '40', '4020001', 'Sepatu ESD No. 260', 'N/A', 'N/A', 'Sepatu ESD No. 260', '-', 'N/A', '10', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2017-11-09', '', ''),
('MATA BOR 3.5 mm (drill bit)', 'GN03535146', 'N/A', '10', '1010001', '3.5MM', 'CV G-TECH', 'N/A', 'MATA BOR 3.5 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Sepatu ESD ', 'GN03626035', 'N/A', '40', '4020001', 'Sepatu ESD No. 265', 'N/A', 'N/A', 'Sepatu ESD No. 265', '-', 'N/A', '30', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2017-11-09', '', ''),
('MATA BOR 4.0 mm (drill bit)', 'GN03640147', 'N/A', '10', '1010001', '4.0MM', 'CV G-TECH', 'N/A', 'MATA BOR 4.0 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('STRIPPERPLATE', 'GN03710098', 'N/A', '30', '3010001', 'FCL DAMBAR TOOL #109802', 'ESEC SINGAPORE', 'N/A', 'STRIPPERPLATE', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('M-COAT HT NEUTRALIZER (P179829)', 'GN03717148', 'N/A', '10', '1010001', 'P179829', 'PCB GRAPHTECH PTE LTD', 'N/A', 'M-COAT HT NEUTRALIZER (P179829)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Sepatu ESD ', 'GN03727036', 'N/A', '40', '4020001', 'Sepatu ESD No. 270', 'N/A', 'N/A', 'Sepatu ESD No. 270', '-', 'N/A', '25', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2017-11-09', '', ''),
('MOLD MELAMINE CLEANING COMPOUND', 'GN03800099', 'N/A', '30', '3010001', 'N/A', 'N/A', 'N/A', 'MOLD MELAMINE CLEANING COMPOUND', '', 'N/A', '2', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2013-07-05', '', ''),
('M-COAT HT PART A (P179827)', 'GN03817149', 'N/A', '10', '1020001', 'P179827', 'PCB GRAPHTECH PTE LTD', 'N/A', 'M-COAT HT PART A (P179827)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Sepatu ESD ', 'GN03828037', 'N/A', '40', '4020001', 'Sepatu ESD No. 280', 'N/A', 'N/A', 'Sepatu ESD No. 280', '-', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2017-11-09', '', ''),
('MOLD MELAMINE CONDITIONER\nCOMPOUND', 'GN03900100', 'N/A', '30', '3010001', 'N/A', 'N/A', 'N/A', 'MOLD MELAMINE CONDITIONER\nCOMPOUND', '', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2013-07-19', '', ''),
('M-COAT HT PART B (P179828)', 'GN03917150', 'N/A', '10', '1020001', 'P179828', 'PCB GRAPHTECH PTE LTD', 'N/A', 'M-COAT HT PART B (P179828)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Sandal ', 'GN03936038', 'N/A', '40', '4020001', 'Sandal 36/37', 'N/A', 'N/A', 'Sandal 36/37', '-', 'N/A', '20', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2017-11-09', '', ''),
('FICO TRIM FORM TOOL SET CONSUMABLES', 'GN04000101', 'N/A', '30', '3010001', 'N/A', 'ESEC SINGAPORE', 'N/A', 'FICO TRIM FORM TOOL SET CONSUMABLES', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('M-COAT HT PART R (P179825)', 'GN04017151', 'N/A', '10', '1020001', 'P179825', 'PCB GRAPHTECH PTE LTD', 'N/A', 'M-COAT HT PART R (P179825)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Sandal ', 'GN04038039', 'N/A', '40', '4020001', 'Sandal 38/39', 'N/A', 'N/A', 'Sandal 38/39', '-', 'N/A', '20', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2017-11-09', '', ''),
('DISTANCE BUSH', 'GN04110102', 'N/A', '30', '3010001', 'FCL FORMING TOOL #109803', 'ESEC SINGAPORE', 'N/A', 'DISTANCE BUSH', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('M TREAT AQ (P179220)', 'GN04117152', 'N/A', '10', '1020001', 'P179220', 'PCB GRAPHTECH PTE LTD', 'N/A', 'M TREAT AQ (P179220)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Sandal ', 'GN04140040', 'N/A', '40', '4020001', 'Sandal 40/41', 'N/A', 'N/A', 'Sandal 40/41', '-', 'N/A', '78', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2017-11-09', '', ''),
('SODIUM CARBONATE (Na2CO3) Teknis', 'GN04200153', 'N/A', '10', '1010001', 'N/A', 'PT NIKKO', 'N/A', 'SODIUM CARBONATE (Na2CO3) Teknis', '10', 'N/A', '10', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2018-12-31', '', ''),
('Sandal ', 'GN04242041', 'N/A', '40', '4020001', 'Sandal 42/43', 'N/A', 'N/A', 'Sandal 42/43', '-', 'N/A', '33', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2017-11-09', '', ''),
('#OMNIBOND 9249 MAKE UP (P119249)', 'GN04311154', 'N/A', '10', '1010001', 'P119249', 'PCB GRAPHTECH PTE LTD', 'N/A', '#OMNIBOND 9249 MAKE UP (P119249)', '', 'N/A', '20', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2017-09-01', '', ''),
('Sandal ', 'GN04344042', 'N/A', '40', '4020001', 'Sandal No. 44/45', 'N/A', 'N/A', 'Sandal No. 44/45', '-', 'N/A', '15', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2017-11-09', '', ''),
('OMNIBOND 9251 OXIDIZER (P119251)', 'GN04411155', 'N/A', '10', '1010001', 'P119251', 'PCB GRAPHTECH PTE LTD', 'N/A', 'OMNIBOND 9251 OXIDIZER (P119251)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Window clamp & heater plate for wire\nbonder', 'GN04430103', 'N/A', '30', '3010001', '3006', 'PT.OCTAGON PRECISION INDONESIA', 'N/A', 'Window clamp & heater plate for wire\nbonder', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Sandal ', 'GN04447043', 'N/A', '40', '4020001', 'Sandal No 47/48', 'N/A', 'N/A', 'Sandal No 47/48', '-', 'N/A', '20', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2017-11-09', '', '');
INSERT INTO `dt_inventory` (`item`, `part_number`, `supplier_no`, `cc`, `account_code`, `type`, `supplier`, `dwg_no`, `description`, `moq`, `cost`, `on_hand`, `in_transit`, `on_prep`, `on_pr_no`, `on_po_no`, `batch_no`, `iqa`, `received_date`, `manufacturing_date`, `expiration_date`, `po_date`, `pr_date`) VALUES
('Face Mask', 'GN04500044', 'N/A', '40', '4010001', 'N/A', 'PT NIKKO', 'N/A', 'Face Mask', '300', 'N/A', '255', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2018-12-29', 'N/A', '2017-11-09', '', ''),
('OMNIBOND+ OXIDE POST DIP J (P189200)', 'GN04518156', 'N/A', '10', '1010001', 'P189200', 'PCB GRAPHTECH PTE LTD', 'N/A', 'OMNIBOND+ OXIDE POST DIP J (P189200)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('TO FAB ESEC 3006 DHS', 'GN04560104', 'N/A', '30', '3010001', 'Part No.609.14.BP.ES36.001.00', 'FUTANI ENGINEERING PTE LTD', 'N/A', 'TO FAB ESEC 3006 DHS', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Wrist Strap', 'GN04600045', 'N/A', '40', '4020001', 'N/A', 'N/A', 'N/A', 'Wrist Strap', '-', 'N/A', '175', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2017-11-09', '', ''),
('Liquid Nitrogen (LGC)', 'GN04616105', 'N/A', '30', '3010001', '165 L', 'PT. INTI DUTA SURYA', 'N/A', 'Liquid Nitrogen (LGC)', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('OMNIBOND+ OXIDE POST B (P189201)', 'GN04618157', 'N/A', '10', '1010001', 'P189201', 'PCB GRAPHTECH PTE LTD', 'N/A', 'OMNIBOND+ OXIDE POST B (P189201)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Baju ESD (smock) uk.L', 'GN04700046', 'N/A', '40', '4020001', 'N/A', 'N/A', 'N/A', 'Baju ESD (smock) uk.L', '-', 'N/A', '2', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2017-11-09', '', ''),
('HS GOLD REPLENISHER UNIT B', 'GN04700106', 'N/A', '30', '3010001', 'OTUS$PCS', 'TECHNIC ASIA PACIFIC PTE LTD', 'N/A', 'HS GOLD REPLENISHER UNIT B', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('#OMNI CLEAN 707 (P188004)', 'GN04718158', 'N/A', '10', '1010001', 'P188004', 'PCB GRAPHTECH PTE LTD', 'N/A', '#OMNI CLEAN 707 (P188004)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Baju ESD (smock) uk.M', 'GN04800047', 'N/A', '40', '4020001', 'N/A', 'N/A', 'N/A', 'Baju ESD (smock) uk.M', '-', 'N/A', '20', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2017-11-09', '', ''),
('HS additive C-5 gal', 'GN04800107', 'N/A', '30', '3010001', 'N/A', 'TECHNIC ASIA PACIFIC PTE LTD', 'N/A', 'HS additive C-5 gal', '5', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Baju ESD (smock) uk.S', 'GN04900048', 'N/A', '40', '4020001', 'N/A', 'N/A', 'N/A', 'Baju ESD (smock) uk.S', '-', 'N/A', '9', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2017-11-09', '', ''),
('Ph-Control-5GL/DM', 'GN04963108', 'N/A', '30', '3010001', 'code : X6362000', 'TECHNIC ASIA PACIFIC PTE LT', 'N/A', 'Ph-Control-5GL/DM', '5', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Glove Karet (biru)', 'GN05000049', 'N/A', '40', '4010001', 'N/A', 'Doo Yee', 'N/A', 'Glove Karet (biru)', '-', 'N/A', '24', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2017-11-09', '', ''),
('\"Potasium pemanganat Restin PC additive Sodium Kar', 'GN05000159', 'N/A', '10', '1010001', 'N/A', 'PT NIKKO', 'N/A', '\"Potasium pemanganat Restin PC additive Sodium Karbonat Sodium persulfat\"', '1', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2018-12-31', 'N/A', 'N/A', '', ''),
('pH + control ACR-5GL/DM', 'GN05064109', 'N/A', '30', '3010001', 'code : X6462000', 'TECHNIC ASIA PACIFIC PTE LT', 'N/A', 'pH + control ACR-5GL/DM', '5', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Glove ESD uk.L', 'GN05100050', 'N/A', '40', '4020001', 'N/A', 'Doo Yee', 'N/A', 'Glove ESD uk.L', '-', 'N/A', '87', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2017-11-09', '', ''),
('Restin PC additive', 'GN05100160', 'N/A', '10', '1010001', 'N/A', 'N/A', 'N/A', 'Restin PC additive', '', 'N/A', '2', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2017-10-17', '', ''),
('Glove ESD uk.M', 'GN05200051', 'N/A', '40', '4020001', 'N/A', 'Doo Yee', 'N/A', 'Glove ESD uk.M', '-', 'N/A', '15', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2017-11-09', '', ''),
('Glove ESD uk.S', 'GN05300052', 'N/A', '40', '4020001', 'N/A', 'Doo Yee', 'N/A', 'Glove ESD uk.S', '-', 'N/A', '19', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2017-11-09', '', ''),
('Glove Nitrile Clean Room', 'GN05400053', 'N/A', '40', '4020001', 'N/A', 'Doo Yee', 'N/A', 'Glove Nitrile Clean Room', '-', 'N/A', '6', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2017-11-09', '', ''),
('Wiper Clean Room', 'GN05500054', 'N/A', '40', '4010001', 'N/A', 'N/A', 'N/A', 'Wiper Clean Room', '-', 'N/A', '139', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2017-11-09', '', ''),
('STANNOUS SULPHATE (R46562)', 'GN05546161', 'N/A', '10', '1010001', 'R46562', 'PCB GRAPHTECH PTE LTD', 'N/A', 'STANNOUS SULPHATE (R46562)', '', 'N/A', '4999', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Glove F-Telon', 'GN05600055', 'N/A', '40', '4010001', 'N/A', 'Doo Yee', 'N/A', 'Glove F-Telon', '-', 'N/A', '28', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2017-11-09', '', ''),
('STANTEK ADDITIVE SRO (P117826)', 'GN05611162', 'N/A', '10', '1010001', 'P117826', 'PCB GRAPHTECH PTE LTD', 'N/A', 'STANTEK ADDITIVE SRO (P117826)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Baju Pratikum Lab.Kimia uk.XL', 'GN05700056', 'N/A', '40', '4020001', 'N/A', 'N/A', 'N/A', 'Baju Pratikum Lab.Kimia uk.XL', '-', 'N/A', '2', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2017-11-09', '', ''),
('Indoflux', 'GN05700110', 'N/A', '30', '3010001', 'N/A', 'PT.SOLDER INDONESIA', 'N/A', 'Indoflux', '1', 'N/A', '2', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2014-08-28', '', ''),
('Ultrastrip 107 RESIST STRIPPER 107\n(P188051)', 'GN05710163', 'N/A', '10', '1010001', '107 P188051', 'PCB GRAPHTECH PTE LTD', 'N/A', 'Ultrastrip 107 RESIST STRIPPER 107\n(P188051)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Baju Pratikum Lab.Kimia uk.L', 'GN05800057', 'N/A', '40', '4020001', 'N/A', 'N/A', 'N/A', 'Baju Pratikum Lab.Kimia uk.L', '-', 'N/A', '17', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2017-11-09', '', ''),
('Methyl orange', 'GN05800164', 'N/A', '10', '1010001', 'N/A', 'INOVASI TEKNOLOGI', 'N/A', 'Methyl orange', '1', 'N/A', '99', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2018-04-30', '', ''),
('Baju Pratikum lab.Kimia uk.M', 'GN05900058', 'N/A', '40', '4020001', 'N/A', 'N/A', 'N/A', 'Baju Pratikum lab.Kimia uk.M', '-', 'N/A', '12', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2017-11-09', '', ''),
('Titriplex (EDTA)', 'GN05900165', 'N/A', '10', '1010001', 'N/A', 'INOVASI TEKNOLOGI', 'N/A', 'Titriplex (EDTA)', '1', 'N/A', '960', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2018-02-28', '', ''),
('Baju Pratikum Lab.Kimia uk.S', 'GN06000059', 'N/A', '40', '4020001', 'N/A', 'N/A', 'N/A', 'Baju Pratikum Lab.Kimia uk.S', '-', 'N/A', '4', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2017-11-09', '', ''),
('Starch soluble', 'GN06000166', 'N/A', '10', '1010001', 'N/A', 'INOVASI TEKNOLOGI', 'N/A', 'Starch soluble', '1', 'N/A', '250', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2020-10-31', '', ''),
('Pembersih Kerak (Spon Kasar)', 'GN06100060', 'N/A', '40', '4010001', 'N/A', 'N/A', 'N/A', 'Pembersih Kerak (Spon Kasar)', '-', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2017-02-27', '', ''),
('Syringe Hysol FP4460 10cc', 'GN06100111', 'N/A', '30', '3010001', 'N/A', 'Pilar Mas Belian', 'N/A', 'Syringe Hysol FP4460 10cc', '5', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Potasium hydrogen phtalate', 'GN06100167', 'N/A', '10', '1010001', 'N/A', 'INOVASI TEKNOLOGI', 'N/A', 'Potasium hydrogen phtalate', '1', 'N/A', '80', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2021-03-31', '', ''),
('Pinset / Tweezer', 'GN06200061', 'N/A', '40', '4020001', 'N/A', 'N/A', 'N/A', 'Pinset / Tweezer', '-', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2017-02-27', '', ''),
('Sodium thiosulfate pentahydrate', 'GN06200168', 'N/A', '10', '1010001', 'N/A', 'INOVASI TEKNOLOGI', 'N/A', 'Sodium thiosulfate pentahydrate', '1', 'N/A', '985', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2018-06-30', '', ''),
('Labu Takar 250 ml', 'GN06300062', 'N/A', '40', '4020001', 'N/A', 'N/A', 'N/A', 'Labu Takar 250 ml', '-', 'N/A', '6', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2017-02-27', '', ''),
('Potasium thiocyanate', 'GN06300169', 'N/A', '10', '1010001', 'N/A', 'INOVASI TEKNOLOGI', 'N/A', 'Potasium thiocyanate', '1', 'N/A', '1000', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2017-11-30', '', ''),
('labu Takar 300 ml', 'GN06400063', 'N/A', '40', '4020001', 'N/A', 'N/A', 'N/A', 'labu Takar 300 ml', '-', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2017-02-27', '', ''),
('Methyl red indicator', 'GN06400170', 'N/A', '10', '1010001', 'N/A', 'INOVASI TEKNOLOGI', 'N/A', 'Methyl red indicator', '1', 'N/A', '99', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2018-09-30', '', ''),
('Labu Takar 1000 ml', 'GN06500064', 'N/A', '40', '4020001', 'N/A', 'N/A', 'N/A', 'Labu Takar 1000 ml', '-', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2017-02-27', '', ''),
('Sodium hydroxide PA', 'GN06500171', 'N/A', '10', '1010001', 'N/A', 'INOVASI TEKNOLOGI', 'N/A', 'Sodium hydroxide PA', '5', 'N/A', '1000', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2019-03-31', '', ''),
('Hand Jack', 'GN06600065', 'N/A', '40', '4020001', 'N/A', 'N/A', 'N/A', 'Hand Jack', '-', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2017-11-09', '', ''),
('Phenolphthalein indicator PA', 'GN06600172', 'N/A', '10', '1010001', 'N/A', 'INOVASI TEKNOLOGI', 'N/A', 'Phenolphthalein indicator PA', '1', 'N/A', '99', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2020-05-31', '', ''),
('Jangka Sorong', 'GN06700066', 'N/A', '40', '4020001', 'N/A', 'N/A', 'N/A', 'Jangka Sorong', '-', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2017-11-09', '', ''),
('Potasium dichromate PA', 'GN06700173', 'N/A', '10', '1010001', 'N/A', 'INOVASI TEKNOLOGI', 'N/A', 'Potasium dichromate PA', '1', 'N/A', '495', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2019-04-30', '', ''),
('Potasium Iodide PA', 'GN06800174', 'N/A', '10', '1010001', 'N/A', 'INOVASI TEKNOLOGI', 'N/A', 'Potasium Iodide PA', '1', 'N/A', '985', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2020-11-30', '', ''),
('Masker (Organik Vapor)', 'GN06900067', 'N/A', '40', '4020001', 'N/A', 'N/A', 'N/A', 'Masker (Organik Vapor)', '-', 'N/A', '8', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2017-11-09', '', ''),
('PAN indicator (1-(2-pyridylazo)-2-naphthol)\nPA', 'GN06900175', 'N/A', '10', '1010001', 'N/A', 'INOVASI TEKNOLOGI', 'N/A', 'PAN indicator (1-(2-pyridylazo)-2-naphthol)\nPA', '5', 'N/A', '4', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2019-05-31', '', ''),
('Kacamata Worksafe', 'GN07000068', 'N/A', '40', '4020001', 'N/A', 'N/A', 'N/A', 'Kacamata Worksafe', '-', 'N/A', '10', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2017-11-09', '', ''),
('Sodium carbonat PA', 'GN07000176', 'N/A', '10', '1010001', 'N/A', 'MERCK', 'N/A', 'Sodium carbonat PA', '1', 'N/A', '2995', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2022-06-30', '', ''),
('Methanol PA', 'GN07100177', 'N/A', '10', '1010001', 'N/A', 'INOVASI TEKNOLOGI', 'N/A', 'Methanol PA', '1', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2020-12-31', '', ''),
('COMPACTA ACCESSORIES - COPPER ANODE.\n1 SET (890020', 'GN07289178', 'N/A', '10', '1010001', '89002015', 'PCB GRAPHTECH PTE LTD', 'N/A', 'COMPACTA ACCESSORIES - COPPER ANODE.\n1 SET (89002015)', '', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Sodium Hydrogen Carbonat PA', 'GN07300179', 'N/A', '10', '1010001', 'N/A', 'INOVASI TEKNOLOGI', 'N/A', 'Sodium Hydrogen Carbonat PA', '1', 'N/A', '1000', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2019-02-28', '', ''),
('Hydrochloric Acid 36% PA', 'GN07436180', 'N/A', '10', '1010001', '36% PA', 'INOVASI TEKNOLOGI', 'N/A', 'Hydrochloric Acid 36% PA', '1', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Sulfuric Acid 98% PA', 'GN07598181', 'N/A', '10', '1010001', '98% PA', 'INOVASI TEKNOLOGI', 'N/A', 'Sulfuric Acid 98% PA', '1', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2018-08-30', '', ''),
('Sodium Chloride PA', 'GN07700182', 'N/A', '10', '1010001', 'N/A', 'N/A', 'N/A', 'Sodium Chloride PA', '', 'N/A', '500', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2020-08-31', '', ''),
('Eosin Y PA', 'GN07800183', 'N/A', '10', '1010001', 'N/A', 'N/A', 'N/A', 'Eosin Y PA', '', 'N/A', '20', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2023-06-30', '', ''),
('Buffer Solution pH 4.0', 'GN07970184', 'N/A', '10', '1010001', 'p.H 4.0', 'N/A', 'N/A', 'Buffer Solution pH 4.0', '', 'N/A', '1000', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2018-07-31', '', ''),
('Buffer Solution pH 7.0', 'GN08070185', 'N/A', '10', '1010001', 'p.H 7.0', 'N/A', 'N/A', 'Buffer Solution pH 7.0', '', 'N/A', '1000', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2019-03-31', '', ''),
('Silver Nitrat PA', 'GN08100186', 'N/A', '10', '1010001', 'N/A', 'N/A', 'N/A', 'Silver Nitrat PA', '', 'N/A', '9', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2019-03-13', '', ''),
('Calcium carbonate', 'GN08200187', 'N/A', '10', '1010001', 'N/A', 'N/A', 'N/A', 'Calcium carbonate', '', 'N/A', '50', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2020-03-31', '', ''),
('BASIC MATERIAL (01000140)', 'GN08310188', 'N/A', '10', '1010001', '1000140', 'PCB GRAPHTECH PTE LTD', 'N/A', 'BASIC MATERIAL (01000140)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('COMPACTA ACCESSORIES - PCB RACK LEM 5\n(99002005)', 'GN08499189', 'N/A', '10', '1010001', '99002005', 'PCB GRAPHTECH PTE LTD', 'N/A', 'COMPACTA ACCESSORIES - PCB RACK LEM 5\n(99002005)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('COMPACTA ACCESSORIES - TIN ANODE. 1\nSET (89002017)', 'GN08589190', 'N/A', '10', '1010001', '89002017', 'PCB GRAPHTECH PTE LTD', 'N/A', 'COMPACTA ACCESSORIES - TIN ANODE. 1\nSET (89002017)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('CONTURE ROUTERS FOR PCB ROUTING\n(01000218)', 'GN08610191', 'N/A', '10', '1010001', '1000218', 'PCB GRAPHTECH PTE LTD', 'N/A', 'CONTURE ROUTERS FOR PCB ROUTING\n(01000218)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('DEVELOPER FILMSTAR ( 01003100 )', 'GN08710192', 'N/A', '10', '1010001', '1003100', 'PCB GRAPHTECH PTE LTD', 'N/A', 'DEVELOPER FILMSTAR ( 01003100 )', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('DRILLER WITH RING (01000839)', 'GN08810193', 'N/A', '10', '1010001', '1000839', 'PCB GRAPHTECH PTE LTD', 'N/A', 'DRILLER WITH RING (01000839)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('FILM PLOTTING ( 99006012 )', 'GN08999194', 'N/A', '10', '1010001', '99006012', 'PCB GRAPHTECH PTE LTD', 'N/A', 'FILM PLOTTING ( 99006012 )', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('ION EXCHANGER L2 ( 01000588 )', 'GN09110195', 'N/A', '10', '1010001', '1000588', 'PCB GRAPHTECH PTE LTD', 'N/A', 'ION EXCHANGER L2 ( 01000588 )', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('MULTILAYER PRESS CONSUMABLE\nMATERIAL (99001051)', 'GN09299196', 'N/A', '10', '1010001', '99001051', 'PCB GRAPHTECH PTE LTD', 'N/A', 'MULTILAYER PRESS CONSUMABLE\nMATERIAL (99001051)', '', 'N/A', '355', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2013-11-27', '', ''),
('PHOTO IMAGEABLE SOLDERMASK R500 GAH\n(GREEN)', 'GN09350197', 'N/A', '10', '1010001', 'R500', 'PT. Batam Universal Stars', 'N/A', 'PHOTO IMAGEABLE SOLDERMASK R500 GAH\n(GREEN)', '', 'N/A', '5', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2019-06-10', '', ''),
('REPLACEMENT CARTRIDGE L2 ( 01000052 )', 'GN09410198', 'N/A', '10', '1010001', '1000052', 'PCB GRAPHTECH PTE LTD', 'N/A', 'REPLACEMENT CARTRIDGE L2 ( 01000052 )', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('RESTIN (XD7151) - (P113351)', 'GN09571199', 'N/A', '10', '1010001', 'XD7151-P113351', 'PCB GRAPHTECH PTE LTD', 'N/A', 'RESTIN (XD7151) - (P113351)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('RISTON DRY FILM FX940', 'GN09694200', 'N/A', '10', '1010001', 'FX940', 'PCB GRAPHTECH PTE LTD', 'N/A', 'RISTON DRY FILM FX940', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('SPECIAL LAMP FOR DARK ROOM ( 99006011\n)', 'GN09899201', 'N/A', '10', '1010001', '99006011', 'PCB GRAPHTECH PTE LTD', 'N/A', 'SPECIAL LAMP FOR DARK ROOM ( 99006011\n)', '', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('ULANO 133', 'GN09913202', 'N/A', '10', '1010001', '133', 'N/A', 'N/A', 'ULANO 133', '', 'N/A', '5', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', '2017-10-10', '', ''),
('ULANO 5', 'GN10005203', 'N/A', '10', '1010001', '5', 'N/A', 'N/A', 'ULANO 5', '', 'N/A', '4', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('High speed Ac-Cu-Guard replenisher', 'GN10100204', 'N/A', '10', '1010001', 'N/A', 'PCB GRAPHTECH PTE LTD', 'N/A', 'High speed Ac-Cu-Guard replenisher', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('High speed Ac-Cu-Guard starter', 'GN10200205', 'N/A', '10', '1010001', 'N/A', 'PCB GRAPHTECH PTE LTD', 'N/A', 'High speed Ac-Cu-Guard starter', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Matabor 0.5 mm (drill bit)', 'GN10305206', 'N/A', '10', '1010001', 'Matabor 0.5 mm (drill bit)', 'CV G-TECH', 'N/A', 'Matabor 0.5 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Matabor 0.9 mm (drill bit)', 'GN10409207', 'N/A', '10', '1010001', 'Matabor 0.9 mm (drill bit)', 'CV G-TECH', 'N/A', 'Matabor 0.9 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Matabor 1.0 mm (drill bit)', 'GN10510208', 'N/A', '10', '1010001', 'Matabor 1.0 mm (drill bit)', 'CV G-TECH', 'N/A', 'Matabor 1.0 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Matabor 1.1 mm (drill bit)', 'GN10611209', 'N/A', '10', '1010001', 'Matabor 1.1 mm (drill bit)', 'CV G-TECH', 'N/A', 'Matabor 1.1 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Matabor 1.2 mm (drill bit)', 'GN10712210', 'N/A', '10', '1010001', 'Matabor 1.2 mm (drill bit)', 'CV G-TECH', 'N/A', 'Matabor 1.2 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Matabor 1.4 mm (drill bit)', 'GN10814211', 'N/A', '10', '1010001', 'Matabor 1.4 mm (drill bit)', 'CV G-TECH', 'N/A', 'Matabor 1.4 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Matabor 1.6 mm (drill bit)', 'GN10916212', 'N/A', '10', '1010001', 'Matabor 1.6 mm (drill bit)', 'CV G-TECH', 'N/A', 'Matabor 1.6 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Matabor 1.7 mm (drill bit)', 'GN11017213', 'N/A', '10', '1010001', 'Matabor 1.7 mm (drill bit)', 'CV G-TECH', 'N/A', 'Matabor 1.7 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Matabor 1.9 mm (drill bit)', 'GN11119214', 'N/A', '10', '1010001', 'Matabor 1.9 mm (drill bit)', 'CV G-TECH', 'N/A', 'Matabor 1.9 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Matabor 2.1 mm (drill bit)', 'GN11221215', 'N/A', '10', '1010001', 'Matabor 2.1 mm (drill bit)', 'CV G-TECH', 'N/A', 'Matabor 2.1 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Matabor 2.2 mm (drill bit)', 'GN11322216', 'N/A', '10', '1010001', 'Matabor 2.2 mm (drill bit)', 'CV G-TECH', 'N/A', 'Matabor 2.2 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Matabor 2.3 mm (drill bit)', 'GN11423217', 'N/A', '10', '1010001', 'Matabor 2.3 mm (drill bit)', 'CV G-TECH', 'N/A', 'Matabor 2.3 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Matabor 2.4 mm (drill bit)', 'GN11524218', 'N/A', '10', '1010001', 'Matabor 2.4 mm (drill bit)', 'CV G-TECH', 'N/A', 'Matabor 2.4 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Matabor 2.6 mm (drill bit)', 'GN11626219', 'N/A', '10', '1010001', 'Matabor 2.6 mm (drill bit)', 'CV G-TECH', 'N/A', 'Matabor 2.6 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Matabor 2.7 mm (drill bit)', 'GN11727220', 'N/A', '10', '1010001', 'Matabor 2.7 mm (drill bit)', 'CV G-TECH', 'N/A', 'Matabor 2.7 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Matabor 2.8 mm (drill bit)', 'GN11828221', 'N/A', '10', '1010001', 'Matabor 2.8 mm (drill bit)', 'CV G-TECH', 'N/A', 'Matabor 2.8 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Matabor 2.9 mm (drill bit)', 'GN11929222', 'N/A', '10', '1010001', 'Matabor 2.9 mm (drill bit)', 'CV G-TECH', 'N/A', 'Matabor 2.9 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Matabor 3.7 mm (drill bit)', 'GN12037223', 'N/A', '10', '1010001', 'Matabor 3.7 mm (drill bit)', 'CV G-TECH', 'N/A', 'Matabor 3.7 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Matabor 3.9 mm (drill bit)', 'GN12139224', 'N/A', '10', '1010001', 'Matabor 3.9 mm (drill bit)', 'CV G-TECH', 'N/A', 'Matabor 3.9 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Matabor 4.2 mm (drill bit)', 'GN12242225', 'N/A', '10', '1010001', 'Matabor 4.2 mm (drill bit)', 'CV G-TECH', 'N/A', 'Matabor 4.2 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Matabor 5.0 mm (drill bit)', 'GN12350226', 'N/A', '10', '1010001', 'Matabor 5.0 mm (drill bit)', 'CV G-TECH', 'N/A', 'Matabor 5.0 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Matabor 6.0 mm (drill bit)', 'GN12460227', 'N/A', '10', '1010001', 'Matabor 6.0 mm (drill bit)', 'CV G-TECH', 'N/A', 'Matabor 6.0 mm (drill bit)', '10', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('PHOTOGRAPHIC FILM', 'GN12500228', 'N/A', '10', '1010001', 'N/A', 'CV G-TECH', 'N/A', 'PHOTOGRAPHIC FILM', '1', 'N/A', '0', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('CAPILLARY SAMPLE', 'GR00000059', 'N/A', '30', '3010002', '', 'N/A', 'N/A', '', 'N/A', 'N/A', '450', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('CALIBRATOR', 'GR00000061', 'N/A', '40', '4020002', 'INDEXER', 'N/A', 'N/A', 'INDEXER', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('POST HEATER', 'GR00000075', 'N/A', '40', '4020002', '', 'N/A', 'N/A', '', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('BACK GRINDING', 'GR00000077', 'N/A', '40', '4020002', 'EHWA', 'N/A', 'N/A', 'EHWA', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('BOARD', 'GR00000080', 'N/A', '40', '4020002', 'TEMPERATURE CONTROL-EURITERM', 'N/A', 'N/A', 'TEMPERATURE CONTROL-EURITERM', 'N/A', 'N/A', '3', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('INDEXER CLAMP COIL', 'GR00000094', 'N/A', '40', '4020002', '', 'N/A', 'N/A', '', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('FIBER OPTIC CABLE', 'GR00000101', 'N/A', '40', '4020002', '', 'N/A', 'N/A', '', 'N/A', 'N/A', '5', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('ELEXTRODE HOLDER', 'GR00000103', 'N/A', '40', '4020002', 'ESSEC ', 'N/A', 'N/A', 'ESSEC ', 'N/A', 'N/A', '2', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('CALIBRATOR', 'GR00002060', 'N/A', '40', '4020002', 'OTC2', 'N/A', 'N/A', 'OTC2', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('CALIBRATOR', 'GR00002062', 'N/A', '40', '4020002', 'DFC2', 'N/A', 'N/A', 'DFC2', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('CAPILLARY', 'GR00004035', 'N/A', '30', '3010002', '4B878-2358-I39', 'N/A', 'N/A', '4B878-2358-I39', 'N/A', 'N/A', '6', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('CAPILLARY', 'GR00004055', 'N/A', '30', '3010002', '4BF88-5057-I36', 'N/A', 'N/A', '4BF88-5057-I36', 'N/A', 'N/A', '10', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('STENCIL', 'GR00004070', 'N/A', '40', '4010002', '4-UP 200L 10x10 ELP 8.7x8.7 EPAD (FLUX STENCIL-A)', 'N/A', 'N/A', '4-UP 200L 10x10 ELP 8.7x8.7 EPAD (FLUX STENCIL-A)', 'N/A', 'N/A', '2', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('DICING BLADE', 'GR00005005', 'N/A', '30', '3010002', 'ZH05-SD4000-N1-50', 'N/A', 'N/A', 'ZH05-SD4000-N1-50', 'N/A', 'N/A', '8', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('DICING BLADE', 'GR00005006', 'N/A', '30', '3010002', 'ZH05-SD3000-N1-50', 'N/A', 'N/A', 'ZH05-SD3000-N1-50', 'N/A', 'N/A', '5', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('DICING BLADE', 'GR00005008', 'N/A', '30', '3010002', 'ZH05-SD3500-N1-50', 'N/A', 'N/A', 'ZH05-SD3500-N1-50', 'N/A', 'N/A', '17', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('DICING BLADE', 'GR00005009', 'N/A', '30', '3010002', 'ZH05-SD2000-N1-30-A3867', 'N/A', 'N/A', 'ZH05-SD2000-N1-30-A3867', 'N/A', 'N/A', '5', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('DICING BLADE', 'GR00005010', 'N/A', '30', '3010002', 'ZH05-SD3000-N1-90', 'N/A', 'N/A', 'ZH05-SD3000-N1-90', 'N/A', 'N/A', '8', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('DICING BLADE', 'GR00005011', 'N/A', '30', '3010002', 'ZHO5-SD3500-N1-90', 'N/A', 'N/A', 'ZHO5-SD3500-N1-90', 'N/A', 'N/A', '6', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('DICING BLADE', 'GR00005013', 'N/A', '30', '3010002', 'ZH05-SD3000-N1-70', 'N/A', 'N/A', 'ZH05-SD3000-N1-70', 'N/A', 'N/A', '6', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('DICING BLADE', 'GR00007014', 'N/A', '30', '3010002', 'RO7-SDC600-BB500-75-N5421', 'N/A', 'N/A', 'RO7-SDC600-BB500-75-N5421', 'N/A', 'N/A', '8', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('CAPILLARY', 'GR00008044', 'N/A', '30', '3010002', 'B0811-28-14-04', 'N/A', 'N/A', 'B0811-28-14-04', 'N/A', 'N/A', '10', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('CAPILLARY', 'GR00009031', 'N/A', '30', '3010002', 'B0911-31-15-05', 'N/A', 'N/A', 'B0911-31-15-05', 'N/A', 'N/A', '10', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('CAPILLARY', 'GR00010036', 'N/A', '30', '3010002', 'B1013-35-16-05', 'N/A', 'N/A', 'B1013-35-16-05', 'N/A', 'N/A', '14', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('CAPILLARY', 'GR00010043', 'N/A', '30', '3010002', 'B1013-47-21-08', 'N/A', 'N/A', 'B1013-47-21-08', 'N/A', 'N/A', '89', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('CAPILLARY', 'GR00010056', 'N/A', '30', '3010002', 'B1013-52-21-08', 'N/A', 'N/A', 'B1013-52-21-08', 'N/A', 'N/A', '18', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('BOARD', 'GR00010089', 'N/A', '40', '4020002', 'CPU 10-0255-00 DE 29064 2', 'N/A', 'N/A', 'CPU 10-0255-00 DE 29064 2', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('CAPILLARY', 'GR00011051', 'N/A', '30', '3010002', 'RFE-1118-SHMX2-2XL(90DIC-OR12-T65)', 'N/A', 'N/A', 'RFE-1118-SHMX2-2XL(90DIC-OR12-T65)', 'N/A', 'N/A', '14', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('CAPILLARY', 'GR00013032', 'N/A', '30', '3010002', 'N1316-80-29-15', 'N/A', 'N/A', 'N1316-80-29-15', 'N/A', 'N/A', '14', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('EFO SELENOID', 'GR00013076', 'N/A', '40', '4020002', '130.0164.1', 'N/A', 'N/A', '130.0164.1', 'N/A', 'N/A', '4', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('DICING BLADE', 'GR00014004', 'N/A', '30', '3010002', 'ZH14-SD3500-V1-90-A2888', 'N/A', 'N/A', 'ZH14-SD3500-V1-90-A2888', 'N/A', 'N/A', '2', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('DICING BLADE', 'GR00014007', 'N/A', '30', '3010002', 'ZH14-SD4000-N1-50-A1184', 'N/A', 'N/A', 'ZH14-SD4000-N1-50-A1184', 'N/A', 'N/A', '6', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('DICING BLADE', 'GR00014012', 'N/A', '30', '3010002', 'ZH14-SD3500-V1-70-A2888', 'N/A', 'N/A', 'ZH14-SD3500-V1-70-A2888', 'N/A', 'N/A', '5', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('CAPILLARY', 'GR00014053', 'N/A', '30', '3010002', 'RFB-1420SHMX2-3XL(90SIC-OR12-T66-BH10', 'N/A', 'N/A', 'RFB-1420SHMX2-3XL(90SIC-OR12-T66-BH10', 'N/A', 'N/A', '9', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('LEADFRAME', 'GR00014069', 'N/A', '40', '4010002', '14008053', 'N/A', 'N/A', '14008053', 'N/A', 'N/A', '74', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('LAP POLISHING KIT', 'GR00014100', 'N/A', '40', '4010002', '14-066-010', 'N/A', 'N/A', '14-066-010', 'N/A', 'N/A', '2', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('CAPILLARY', 'GR00015019', 'N/A', '30', '3010002', '1553-17-437GG-80(411D-5)20D-CZ9', 'N/A', 'N/A', '1553-17-437GG-80(411D-5)20D-CZ9', 'N/A', 'N/A', '17', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('CAPILLARY', 'GR00015020', 'N/A', '30', '3010002', '1500-DWG100162-CZ9', 'N/A', 'N/A', '1500-DWG100162-CZ9', 'N/A', 'N/A', '7', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('CAPILLARY', 'GR00015021', 'N/A', '30', '3010002', '1551-13437GGD 55(1.5-8D-8)20D-CZ9', 'N/A', 'N/A', '1551-13437GGD 55(1.5-8D-8)20D-CZ9', 'N/A', 'N/A', '8', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('CAPILLARY', 'GR00015022', 'N/A', '30', '3010002', '1551-17-437GG-59(4-8D-10)20D-CZ9', 'N/A', 'N/A', '1551-17-437GG-59(4-8D-10)20D-CZ9', 'N/A', 'N/A', '16', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('CAPILLARY', 'GR00015023', 'N/A', '30', '3010002', '1553-13437GGB-65(2 8D-8)20D-CZ9', 'N/A', 'N/A', '1553-13437GGB-65(2 8D-8)20D-CZ9', 'N/A', 'N/A', '5', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('CAPILLARY', 'GR00015025', 'N/A', '30', '3010002', '1500-DWG110525-GGMTL0171A', 'N/A', 'N/A', '1500-DWG110525-GGMTL0171A', 'N/A', 'N/A', '10', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('CAPILLARY', 'GR00015026', 'N/A', '30', '3010002', '1500-DWG110417-GGMTL0171A', 'N/A', 'N/A', '1500-DWG110417-GGMTL0171A', 'N/A', 'N/A', '6', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('CAPILLARY', 'GR00015029', 'N/A', '30', '3010002', '1500-DWG110245-GGMTL0170', 'N/A', 'N/A', '1500-DWG110245-GGMTL0170', 'N/A', 'N/A', '4', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('CAPILLARY', 'GR00015041', 'N/A', '30', '3010002', '1553-18-437GGD80(4.5-11D-5)20D-CZ9', 'N/A', 'N/A', '1553-18-437GGD80(4.5-11D-5)20D-CZ9', 'N/A', 'N/A', '10', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('CAPILLARY', 'GR00015046', 'N/A', '30', '3010002', '1500-DWG110415-GGMTL0171A', 'N/A', 'N/A', '1500-DWG110415-GGMTL0171A', 'N/A', 'N/A', '10', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('CAPILLARY', 'GR00015048', 'N/A', '30', '3010002', '1551-13-437GM-55(48D)20D-CZR', 'N/A', 'N/A', '1551-13-437GM-55(48D)20D-CZR', 'N/A', 'N/A', '10', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('CAPILLARY', 'GR00017052', 'N/A', '30', '3010002', 'CSB-1726HMX-2XL(90DICOR15-T80)', 'N/A', 'N/A', 'CSB-1726HMX-2XL(90DICOR15-T80)', 'N/A', 'N/A', '10', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('CAPILLARY', 'GR00018015', 'N/A', '30', '3010002', '1853-13-437GG T431.0FP2.3-3.2', 'N/A', 'N/A', '1853-13-437GG T431.0FP2.3-3.2', 'N/A', 'N/A', '130', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('CAPILLARY', 'GR00018016', 'N/A', '30', '3010002', '1853-13-437-43(1.5 11D-5)20D-AB10x10 MTL0170', 'N/A', 'N/A', '1853-13-437-43(1.5 11D-5)20D-AB10x10 MTL0170', 'N/A', 'N/A', '360', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('CAPILLARY', 'GR00018017', 'N/A', '30', '3010002', '1851-13-T38-QFN-FP-BLUE', 'N/A', 'N/A', '1851-13-T38-QFN-FP-BLUE', 'N/A', 'N/A', '684', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('CAPILLARY', 'GR00018018', 'N/A', '30', '3010002', '1853-1-437-43(3.5 11D-8)20D-AB10x10MTL0171A-RF2-P', 'N/A', 'N/A', '1853-1-437-43(3.5 11D-8)20D-AB10x10MTL0171A-RF2-P', 'N/A', 'N/A', '17', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('CAPILLARY', 'GR00018024', 'N/A', '30', '3010002', '1853-13-437GG-43(1.5 8D-5)20D-AB10x10-CZ9', 'N/A', 'N/A', '1853-13-437GG-43(1.5 8D-5)20D-AB10x10-CZ9', 'N/A', 'N/A', '3', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('CAPILLARY', 'GR00018027', 'N/A', '30', '3010002', '1853-12.5-43734(1.75-11D-5)20DAB10x10-MTL0170', 'N/A', 'N/A', '1853-12.5-43734(1.75-11D-5)20DAB10x10-MTL0170', 'N/A', 'N/A', '9', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('CAPILLARY', 'GR00018028', 'N/A', '30', '3010002', '1853-10-437GG 33(1.25-11D-3)20DAB10x10-CZ9', 'N/A', 'N/A', '1853-10-437GG 33(1.25-11D-3)20DAB10x10-CZ9', 'N/A', 'N/A', '30', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('CAPILLARY', 'GR00018037', 'N/A', '30', '3010002', '1853-10.5-437P 30(0.75-11D-5)20DABx10-CDR2B-CZ1', 'N/A', 'N/A', '1853-10.5-437P 30(0.75-11D-5)20DABx10-CDR2B-CZ1', 'N/A', 'N/A', '5', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('CAPILLARY', 'GR00018038', 'N/A', '30', '3010002', '1854-11-437GM 30(1.5-11D-5)20DAB10xCDR-130-CZ1', 'N/A', 'N/A', '1854-11-437GM 30(1.5-11D-5)20DAB10xCDR-130-CZ1', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('CAPILLARY', 'GR00018039', 'N/A', '30', '3010002', '1851-13-4-437GM40(2-8D-8)20DAB5x10-CDR2B-CZ1', 'N/A', 'N/A', '1851-13-4-437GM40(2-8D-8)20DAB5x10-CDR2B-CZ1', 'N/A', 'N/A', '6', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('CAPILLARY', 'GR00018040', 'N/A', '30', '3010002', '1853-13-437GM-40(111D-5)20D-1B10X10 CDR2B-CZ1', 'N/A', 'N/A', '1853-13-437GM-40(111D-5)20D-1B10X10 CDR2B-CZ1', 'N/A', 'N/A', '5', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('CAPILLARY', 'GR00018042', 'N/A', '30', '3010002', '1851-13-437GM40(2-8D-8)20DAB5x10-CDR2B-CZ1', 'N/A', 'N/A', '1851-13-437GM40(2-8D-8)20DAB5x10-CDR2B-CZ1', 'N/A', 'N/A', '50', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('CAPILLARY', 'GR00018045', 'N/A', '30', '3010002', '1851-11-T43 GREENCZ3', 'N/A', 'N/A', '1851-11-T43 GREENCZ3', 'N/A', 'N/A', '6', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('CAPILLARY', 'GR00018047', 'N/A', '30', '3010002', '1853-13-437-43(1.54D-10)20D-1B10X10MTL0170', 'N/A', 'N/A', '1853-13-437-43(1.54D-10)20D-1B10X10MTL0170', 'N/A', 'N/A', '10', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('CAPILLARY', 'GR00018049', 'N/A', '30', '3010002', '1853-13-437GM-52(415D-5)20D-1B5X10-CZ1', 'N/A', 'N/A', '1853-13-437GM-52(415D-5)20D-1B5X10-CZ1', 'N/A', 'N/A', '10', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('CAPILLARY', 'GR00018050', 'N/A', '30', '3010002', '1853-13-437GM-35(215D-5)20D-AB10X10CZ1', 'N/A', 'N/A', '1853-13-437GM-35(215D-5)20D-AB10X10CZ1', 'N/A', 'N/A', '10', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('MAGAZINE  ', 'GR00020003', 'N/A', '30', '3010002', 'XD 2.0 x 9.0', 'N/A', 'N/A', 'XD 2.0 x 9.0', 'N/A', 'N/A', '6', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('DIE BONDER', 'GR00020064', 'N/A', '30', '4020002', 'DIE BONDER 2007 HS PLUS', 'N/A', 'N/A', 'DIE BONDER 2007 HS PLUS', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('DIE BONDER', 'GR00020065', 'N/A', '30', '4020002', 'DIE BONDER 2007 HS', 'N/A', 'N/A', 'DIE BONDER 2007 HS', 'N/A', 'N/A', '2', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('GRAM GAUGE', 'GR00020066', 'N/A', '40', '4020002', 'BATAS 2000', 'N/A', 'N/A', 'BATAS 2000', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('MAGAZINE  ', 'GR00023002', 'N/A', '30', '3010002', 'PDIP 2.3 x 8.4', 'N/A', 'N/A', 'PDIP 2.3 x 8.4', 'N/A', 'N/A', '18', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('GRAM GAUGE', 'GR00025067', 'N/A', '40', '4020002', 'BATAS 250', 'N/A', 'N/A', 'BATAS 250', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('CAP SCREW', 'GR00026068', 'N/A', '40', '4010002', '26-D27141', 'N/A', 'N/A', '26-D27141', 'N/A', 'N/A', '50', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('CAPILLARY', 'GR00028034', 'N/A', '30', '3010002', 'SI-28090-355F-ZS38TS-Y', 'N/A', 'N/A', 'SI-28090-355F-ZS38TS-Y', 'N/A', 'N/A', '5', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('DIE BONDER', 'GR00030063', 'N/A', '30', '4020002', 'ESSEC 3088', 'N/A', 'N/A', 'ESSEC 3088', 'N/A', 'N/A', '3', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('ENCODER', 'GR00030072', 'N/A', '40', '4020002', 'ESSEC 3088', 'N/A', 'N/A', 'ESSEC 3088', 'N/A', 'N/A', '2', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('ROCKER ARM.TRAND. W/CLAMP', 'GR00030073', 'N/A', '40', '4010002', 'ESSEC 3088', 'N/A', 'N/A', 'ESSEC 3088', 'N/A', 'N/A', '2', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('BOARD', 'GR00030081', 'N/A', '40', '4020002', 'PSU WB ESSEC 3088', 'N/A', 'N/A', 'PSU WB ESSEC 3088', 'N/A', 'N/A', '2', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('BOARD', 'GR00030086', 'N/A', '40', '4020002', 'HARDISK 3006', 'N/A', 'N/A', 'HARDISK 3006', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('BOARD', 'GR00030090', 'N/A', '40', '4020002', 'INDEXER 3006', 'N/A', 'N/A', 'INDEXER 3006', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('BOARD', 'GR00030091', 'N/A', '40', '4020002', 'HARDISK 3008', 'N/A', 'N/A', 'HARDISK 3008', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('PNEUMATIC REGULATOR', 'GR00030093', 'N/A', '40', '4020002', 'ESSEC 3006 5351300210', 'N/A', 'N/A', 'ESSEC 3006 5351300210', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('RAM', 'GR00030096', 'N/A', '40', '4020002', 'ESSEC 3088', 'N/A', 'N/A', 'ESSEC 3088', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('WIRE CLAMP ASSEMBLY', 'GR00030097', 'N/A', '30', '3020002', 'ESSEC 3008', 'N/A', 'N/A', 'ESSEC 3008', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('WIRE CLAMP ASSEMBLY', 'GR00030098', 'N/A', '30', '3020002', 'ESSEC 3006', 'N/A', 'N/A', 'ESSEC 3006', 'N/A', 'N/A', '26', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('FIBER OPTIC SENSOR INDEXER', 'GR00030099', 'N/A', '40', '4020002', 'ESSEC 3006', 'N/A', 'N/A', 'ESSEC 3006', 'N/A', 'N/A', '2', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('BOARD', 'GR00038083', 'N/A', '40', '4020002', 'HANDLER 388', 'N/A', 'N/A', 'HANDLER 388', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('CAPILLARY', 'GR00041030', 'N/A', '30', '3010002', 'BNC412-437RP-20D', 'N/A', 'N/A', 'BNC412-437RP-20D', 'N/A', 'N/A', '10', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('CAPILLARY', 'GR00041057', 'N/A', '30', '3010002', '413FC-3310-R33', 'N/A', 'N/A', '413FC-3310-R33', 'N/A', 'N/A', '10', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('BOARD', 'GR00042079', 'N/A', '40', '4020002', 'VCPU 4289 ELCO 10 8457 D96 002 025', 'N/A', 'N/A', 'VCPU 4289 ELCO 10 8457 D96 002 025', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('CAPILLARY', 'GR00052058', 'N/A', '30', '3010002', '524B 5393825783', 'N/A', 'N/A', '524B 5393825783', 'N/A', 'N/A', '10', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('CAPILLARY', 'GR00064033', 'N/A', '30', '3010002', 'P64641001', 'N/A', 'N/A', 'P64641001', 'N/A', 'N/A', '5', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('CAPILLARY', 'GR00064054', 'N/A', '30', '3010002', 'P-64614002', 'N/A', 'N/A', 'P-64614002', 'N/A', 'N/A', '10', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('BOND HEAD ASSEMBLY', 'GR00066092', 'N/A', '40', '4020002', 'MCM0066-076-1TA-25XB/0265', 'N/A', 'N/A', 'MCM0066-076-1TA-25XB/0265', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('PELLET', 'GR00075095', 'N/A', '40', '4020002', '75 ES1 010', 'N/A', 'N/A', '75 ES1 010', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('PAD ABSORBER', 'GR00075102', 'N/A', '40', '4010002', '75 ES3 025', 'N/A', 'N/A', '75 ES3 025', 'N/A', 'N/A', '8', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('MAGAZINE  ', 'GR00077001', 'N/A', '30', '3010002', 'TGFP 7X7', 'N/A', 'N/A', 'TGFP 7X7', 'N/A', 'N/A', '23', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('ENCODER', 'GR00090071', 'N/A', '40', '4020002', '901118', 'N/A', 'N/A', '901118', 'N/A', 'N/A', '', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('MOTOR INDEXER', 'GR00090074', 'N/A', '40', '4020002', '905.0979X797', 'N/A', 'N/A', '905.0979X797', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('BOARD', 'GR00090084', 'N/A', '40', '4020002', 'INDEXER 905.0030/02', 'N/A', 'N/A', 'INDEXER 905.0030/02', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('BOARD', 'GR00094078', 'N/A', '40', '4020002', 'NEFO 940.0002/02', 'N/A', 'N/A', 'NEFO 940.0002/02', 'N/A', 'N/A', '3', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('BOARD', 'GR00094082', 'N/A', '40', '4020002', 'BPA 947.060/3', 'N/A', 'N/A', 'BPA 947.060/3', 'N/A', 'N/A', '4', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('?', 'GR00094087', 'N/A', '40', '4020002', '946.051/3', 'N/A', 'N/A', '946.051/3', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('BOARD', 'GR00094088', 'N/A', '40', '4020002', '946.052/3', 'N/A', 'N/A', '946.052/3', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('?', 'GR00095085', 'N/A', '40', '4020002', '954.0902/06', 'N/A', 'N/A', '954.0902/06', 'N/A', 'N/A', '1', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2020-03-30', 'N/A', 'N/A', '', ''),
('Wrist Strap', 'SP00000001', 'N/A', '30', '3030001', 'N/A', 'PT. Nikko', 'N/A', 'N/A', '10', 'N/A', '10', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2018-12-31', 'N/A', 'N/A', '', ''),
('esd monitor', 'SP00000002', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('cutter', 'SP00000003', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('wafer ring', 'SP00000004', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('rubber tip', 'SP00000005', 'N/A', '30', '3030001', 'N/A', 'micro-mechanics', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('needle', 'SP00000006', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('nozzle', 'SP00000007', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Magazine ', 'SP00000008', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Capillary', 'SP00000009', 'N/A', '30', '3030001', 'N/A', 'CV. ATB', 'N/A', 'N/A', '300', 'N/A', '299', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2018-12-31', 'N/A', 'N/A', '', ''),
('down holder', 'SP00000010', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('cavity bar', 'SP00000011', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('cavity bar', 'SP00000012', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('vacuum', 'SP00000013', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('pellet handler', 'SP00000014', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('tweezers', 'SP00000015', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('bronze', 'SP00000016', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('brush', 'SP00000017', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('rubber tip', 'SP00000018', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('fluxing jig', 'SP00000019', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('rubber tip', 'SP00000020', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('fluxing jig', 'SP00000021', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('ball attach jig', 'SP00000022', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('squeeze', 'SP00000023', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('cutter', 'SP00000024', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('wafer ring', 'SP00000025', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('hub', 'SP00000026', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('dejunk punch', 'SP00000027', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('dejunk dies', 'SP00000028', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('trim punch', 'SP00000029', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('sing dies', 'SP00000030', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('anvil', 'SP00000031', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('form tools', 'SP00000032', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('sing punch', 'SP00000033', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', '');
INSERT INTO `dt_inventory` (`item`, `part_number`, `supplier_no`, `cc`, `account_code`, `type`, `supplier`, `dwg_no`, `description`, `moq`, `cost`, `on_hand`, `in_transit`, `on_prep`, `on_pr_no`, `on_po_no`, `batch_no`, `iqa`, `received_date`, `manufacturing_date`, `expiration_date`, `po_date`, `pr_date`) VALUES
('sing dies', 'SP00000034', 'N/A', '30', '3030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('stencil mask', 'SP00000035', 'N/A', '20', '2030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('lifting block', 'SP00000036', 'N/A', '20', '2030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('nozzle', 'SP00000037', 'N/A', '20', '2030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('T/R Conversion kit', 'SP00000038', 'N/A', '20', '2030001', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', '', 'N/A', 'N/A', 'N/A', '', ''),
('Dicing Blade', 'SP00000039', 'N/A', '30', '3030001', 'N/A', 'CV. ATB', 'N/A', 'N/A', '60', 'N/A', '60', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2018-12-31', 'N/A', 'N/A', '', ''),
('Unplugger', 'SP00000040', 'N/A', '20', '2030001', 'N/A', 'CV. ATB', 'N/A', 'N/A', '50', 'N/A', '50', 'N/A', 'N/A', 'N/A', 'N/A', '', '', '2018-12-31', 'N/A', 'N/A', '', '');

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
(3, 2, 'LUBRICANT SULLUBE', 'LUBRICANT SULLUBE', '09', '90', '90', '90', '90', '90', '2021-02-26', 'asda', 'LUBRICANT SULLUBE', 'LUBRICANT SULLUBE', 'waiting');

-- --------------------------------------------------------

--
-- Struktur dari tabel `form_pr`
--

CREATE TABLE `form_pr` (
  `id_pr` int(50) NOT NULL,
  `kode_pr` int(250) NOT NULL,
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
(1, 1, '', 'LC 123\r\n', '99', 'PRE-TREATMENT FILTER\r\n', 'GN01912019\r\n', '40', '2021-02-22', '4010001\r\n', 'waiting', 'anderson', '0'),
(2, 2, '', 'PN.250022-669\r\n', '87', 'LUBRICANT SULLUBE\r\n', 'GN02425024\r\n', '40', '2021-02-23', '4010001\r\n', 'approve', 'anderson', '1'),
(3, 2, '', 'SL-0202M-TX-DC Modul', '22', '\"\"\"LED street light turtle series SL-0202M-TX-\r\nDC Modular 40W ±5500lm, CCT:4000K, 12/24VDC/220VAC\"\"', 'GN02702026\r\n', '40', '2021-02-23', '4010001\r\n', 'approve', 'anderson', '0'),
(5, 3, '', 'LUBRICANT SULLUBE', '2', 'LUBRICANT SULLUBE', 'vLUBRICANT SULLUBE', '10', '2021-02-23', 'LUBRICANT SULLUBE', 'approve', 'anderson', '0'),
(6, 3, '', 'LUBRICANT SULLUBE', '22', 'LUBRICANT SULLUBE', 'LUBRICANT SULLUBE', '20', '2021-02-23', 'LUBRICANT SULLUBE', 'approve', 'anderson', '0'),
(7, 4, '', 'Purification pack-pu', '22', 'Purification pack-purelab (ELGA- Consumables)\r\n', 'Purification pack-purelab (ELGA- Consumables)\r\n', '20', '2021-02-27', 'Purification pack-purelab (ELG', 'rejected', 'anderson', '0'),
(8, 5, '', 'SEPARATOR ELEMENT\r\n', '33', 'SEPARATOR ELEMENT\r\n', 'SEPARATOR ELEMENT\r\n', '30', '2021-03-02', 'SEPARATOR ELEMENT\r\n', 'waiting', 'anderson', '0'),
(9, 6, '', 'SEPARATOR ELEMENT\r\n', '33', 'SEPARATOR ELEMENT\r\n', 'SEPARATOR ELEMENT\r\n', '40', '2021-03-06', 'SEPARATOR ELEMENT\r\n', 'waiting', 'anderson', '0'),
(10, 7, '', 'LUBRICANT SULLUBE', '12', 'LUBRICANT SULLUBE', 'LUBRICANT SULLUBE', '20', '2021-03-05', 'LUBRICANT SULLUBE', 'waiting', 'anderson', '0'),
(11, 8, '', 'Purification pack-pu', '22', 'Purification pack-purelab (ELGA- Consumables)', 'Purification pack-purelab (ELGA- Consumables)', '30', '2021-03-25', 'Purification pack-purelab (ELG', 'rejected', 'anderson', '0');

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
-- Indeks untuk tabel `dt_inventory`
--
ALTER TABLE `dt_inventory`
  ADD PRIMARY KEY (`part_number`);

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
  MODIFY `id_po` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `form_pr`
--
ALTER TABLE `form_pr`
  MODIFY `id_pr` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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

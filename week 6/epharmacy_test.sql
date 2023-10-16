-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 17, 2023 at 01:01 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `epharmacy_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `CartID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`CartID`, `UserID`, `ProductID`, `Quantity`) VALUES
(164, 3, 2, 1),
(165, 3, 3, 1),
(170, 1, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `HistoryID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`HistoryID`, `UserID`, `ProductID`, `Quantity`, `Timestamp`) VALUES
(24, 2, 1, 1, '2023-09-25 12:56:31'),
(25, 2, 2, 1, '2023-09-25 12:56:31'),
(26, 2, 3, 1, '2023-09-25 12:56:31'),
(27, 2, 4, 1, '2023-09-25 12:56:31'),
(28, 2, 5, 1, '2023-09-25 12:56:31'),
(54, 2, 30, 1, '2023-10-02 10:47:52'),
(55, 2, 7, 1, '2023-10-02 10:47:52'),
(56, 2, 8, 1, '2023-10-02 10:47:52'),
(57, 2, 9, 1, '2023-10-02 10:47:52'),
(58, 2, 10, 1, '2023-10-02 10:47:52'),
(59, 2, 3, 1, '2023-10-02 10:47:52'),
(136, 1, 3, 1, '2023-10-16 16:16:37'),
(137, 1, 24, 1, '2023-10-16 16:18:37'),
(138, 1, 4, 1, '2023-10-16 16:24:23'),
(139, 1, 3, 1, '2023-10-16 16:50:30'),
(140, 1, 55, 1, '2023-10-16 16:50:30'),
(141, 2, 1, 1, '2023-10-16 16:58:46'),
(142, 2, 7, 100, '2023-10-16 16:58:46'),
(143, 4, 1, 1, '2023-10-16 20:19:34'),
(144, 4, 3, 5, '2023-10-16 20:19:34'),
(145, 4, 12, 1, '2023-10-16 20:19:34'),
(146, 4, 483, 1, '2023-10-16 20:27:39'),
(147, 4, 218, 1, '2023-10-16 20:27:39'),
(148, 4, 218, 100, '2023-10-16 20:27:39'),
(149, 4, 100, 1, '2023-10-16 20:27:39'),
(150, 4, 83, 20, '2023-10-16 20:27:39');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `URL` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `category`, `URL`) VALUES
(1, 'Capsule', 'images/shop/capsule.png'),
(2, 'Cream', 'images/shop/cream.png'),
(3, 'Eye and Ear Drops', 'images/shop/eye_ear_drops.png'),
(4, 'Eye Drops', 'images/shop/eye_drops.png'),
(5, 'Eye Ointment', 'images/shop/eye_ointment.png'),
(6, 'Injection', 'images/shop/injection.png'),
(7, 'IV Infusion', 'images/shop/iv_infusion.png'),
(8, 'IV Injection', 'images/shop/iv_injection.png'),
(9, 'Ointment', 'images/shop/ointment.png'),
(10, 'Oral Solution', 'images/shop/oral_solution.png'),
(11, 'Paediatric Drops', 'images/shop/paediatric_drops.png'),
(12, 'Powder For Suspension', 'images/shop/powder_suspension.png'),
(13, 'Solution', 'images/shop/solution.png'),
(14, 'Syrup', 'images/shop/syrup.png'),
(15, 'Tablet', 'images/shop/tablet.png');

-- --------------------------------------------------------

--
-- Table structure for table `product_info`
--

CREATE TABLE `product_info` (
  `productID` int(11) NOT NULL,
  `Manufacturer` varchar(43) DEFAULT NULL,
  `BrandName` varchar(27) DEFAULT NULL,
  `GenericName` varchar(114) DEFAULT NULL,
  `Strength` varchar(60) DEFAULT NULL,
  `Description` varchar(21) DEFAULT NULL,
  `Price` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_info`
--

INSERT INTO `product_info` (`productID`, `Manufacturer`, `BrandName`, `GenericName`, `Strength`, `Description`, `Price`) VALUES
(1, 'Incepta Pharmaceuticals Ltd.', 'Mefoglip DS 5/500', 'Glipizide + Metformin Hydrochloride', '5 mg + 500 mg', 'Tablet', 3.7),
(2, 'Benham Pharmaceuticals Ltd.', 'Benocef 500', 'Cephradine', '500 mg', 'Capsule', 15),
(3, 'Unimed Unihealth Pharmaceuticals Ltd.', 'Imnoc 25mg', 'Imipramine Hydrochloride', '25 mg', 'Tablet', 4),
(4, 'Ibn Sina Pharmaceutical Ind. Ltd.', 'Bactin IV Infusion', 'Ciprofloxacin', '200 mg/100 ml', 'IV Infusion', 145),
(5, 'General Pharmaceuticals Ltd.', 'Vasoproct', 'Calcium Dobesilate', '500 mg', 'Capsule', 20),
(6, 'Euro Pharma Ltd.', 'Adiz', 'Azithromycin', '500 mg', 'Tablet', 30),
(7, 'G. A. Company Ltd.', 'Supraphen', 'Chloramphenicol', '1 gm/100 gm', 'Eye Ointment', 12.53),
(8, 'Aristopharma Limited', 'Water For Injection', 'Water For Injection', '5 ml', 'Injection', 3.32),
(9, 'Albion Laboratories Ltd.', 'Alfux-DS', 'Flucloxacillin', '125 mg/5 ml', 'Powder For Suspension', 75),
(10, 'Ad-din Pharmaceuticals Ltd.', 'Ciproxen 500', 'Ciprofloxacin', '500 mg', 'Tablet', 14),
(11, 'Sharif Pharmaceuticals Ltd.', 'Picaso Solution', 'Sodium Picosulfate', '100 mg/100 ml', 'Oral Solution', 85),
(12, 'Astra Biopharmaceuticals Ltd.', 'Pem 10mg/5ml', 'Zinc', '10 mg/5 ml', 'Syrup', 30),
(13, 'The ACME Laboratories Ltd.', 'Neobet 5', 'Betamethasone + Neomycin Sulphate', '100 mg + 500 mg/100 gm', 'Cream', 35),
(14, 'Incepta Pharmaceuticals Ltd.', 'Lafrost', 'Docosanol', '10 gm/100 gm', 'Cream', 50),
(15, 'APC Pharma Limited', 'Ciprotec 500', 'Ciprofloxacin', '500 mg', 'Tablet', 8),
(16, 'Opsonin Pharma Limited', 'Epam', 'Nitrazepam', '5 mg', 'Tablet', 0.75),
(17, 'Kemiko Pharmaceuticals Ltd.', 'Omex IV', 'Omeprazole', '40 mg/vial', 'Injection', 87),
(18, 'Zenith Pharmaceuticals Ltd.', 'Montezen 10', 'Montelukast', '10 mg', 'Tablet', 12),
(19, 'Drug International Ltd.', 'Fexofast 180', 'Fexofenadine Hydrochloride', '180 mg', 'Tablet', 9.05),
(20, 'Popular Pharmaceuticals Ltd.', 'Pelverin', 'Alverine Citrate', '60 mg', 'Tablet', 5),
(21, 'Navana Pharmaceuticals Ltd.', 'Torcox 90', 'Etoricoxib', '90 mg', 'Tablet', 12),
(22, 'Labaid Pharmaceuticals Ltd.', 'Ambrotus', 'Ambroxol', '15 mg/5 ml', 'Syrup', 50),
(23, 'Ibn Sina Pharmaceutical Ind. Ltd.', 'Isolon 1%', 'Prednisolone', '1 gm/100 ml', 'Eye Drops', 100),
(24, 'Unimed Unihealth Pharmaceuticals Ltd.', 'Utramal 100', 'Tramadol Hydrochloride', '100 mg/2 ml', 'Injection', 25),
(25, 'G. A. Company Ltd.', 'Brocef-CV 250', 'Cefuroxime + Clavulanic Acid', '250 mg + 62.5 mg', 'Tablet', 30),
(26, 'General Pharmaceuticals Ltd, Unit-2', 'Azomac 500', 'Azithromycin', '500 mg', 'Tablet', 40),
(27, 'Square Pharmaceuticals PLC, Pabna', 'Trupan 40', 'Pantoprazole', '40 mg/vial', 'Injection', 90),
(28, 'G. A. Company Ltd.', 'Gento', 'Gentamicin', '300 mg/100 ml', 'Eye and Ear Drops', 35),
(29, 'Advanced Chemical Industries Limited', 'Cartine', 'Levocarnitine', '330 mg', 'Tablet', 4),
(30, 'Hudson Pharmaceuticals Ltd.', 'Neuroson', 'Cyanocobalamin + Pyridoxine Hydrochloride + Vitamin B1', '200 mcg + 200 mg + 100 mg', 'Tablet', 8),
(31, 'Modern Pharmaceuticals Ltd.', 'Trufen 400', 'Ibuprofen', '400 mg', 'Tablet', 1.26),
(32, 'Somatec Pharmaceuticals Ltd.', 'Cefurim 250', 'Cefuroxime', '250 mg', 'Tablet', 25.1),
(33, 'Pristine Pharmaceuticals', 'Bizofast', 'Amlodipine + Olmesartan Medoxomil', '5 mg + 20 mg', 'Tablet', 10),
(34, 'Alco Pharma Limited', 'Adnix', 'Nitazoxanide', '100 mg/5 ml', 'Powder For Suspension', 35.11),
(35, 'Beximco Pharmaceuticals Ltd.', 'Intracef DS 250', 'Cephradine', '250 mg/5 ml', 'Powder For Suspension', 120),
(36, 'Genvio Pharma Ltd.', 'Iretavir 0.5 mg', 'Entecavir', '.5 mg', 'Tablet', 48),
(37, 'NIPRO JMI Pharma Limited', 'Nixon 250 mg IV', 'Ceftriaxone', '250 mg', 'IV Injection', 110.33),
(38, 'Jenphar Bangladesh Ltd.', 'Ribacee', 'Ribavirin', '200 mg', 'Capsule', 35),
(39, 'Eskayef Pharmaceuticals Ltd., Tongi,Gazipur', 'Aggra 100', 'Sildenafil', '100 mg', 'Tablet', 50),
(40, 'Navana Pharmaceuticals Ltd.', 'Conpan 0.5', 'Clonazepam', '.5 mg', 'Tablet', 6.6),
(41, 'Aristopharma Limited, Gazipur', 'Extracef', 'Cephradine', '125 mg/1.25 ml', 'Paediatric Drops', 62),
(42, 'Concord Pharmaceuticals Ltd.', 'Vildaglip', 'Vildagliptin', '50 mg', 'Tablet', 12),
(43, 'Popular Pharmaceuticals Ltd.', 'Clonapin 0.5', 'Clonazepam', '.5 mg', 'Tablet', 5),
(44, 'Rephco Pharmaceuticals Ltd.', 'Tinimet', 'Tiemonium Methylsulphate', '5 mg/2 ml', 'Injection', 20),
(45, 'SMC Enterprise Limited', 'Spadyl', 'Tiemonium Methylsulphate', '50 mg', 'Tablet', 5),
(46, 'Team Pharmaceuticals Ltd.', 'Temcox 60', 'Etoricoxib', '60 mg', 'Tablet', 6.5),
(47, 'Advanced Chemical Industries Limited', 'Combocef 100', 'Cefpodoxime + Clavulanic Acid', '100 mg + 62.5 mg', 'Tablet', 30.09),
(48, 'Ibn Sina Pharmaceutical Ind. Ltd.', 'Rivacap 1.5', 'Rivastigmine', '6 mg', 'Capsule', 10),
(49, 'SMC Enterprise Limited', 'Myxivent', 'Doxophylline', '400 mg', 'Tablet', 8),
(50, 'Beximco Pharmaceuticals Ltd.', 'Hyprosol', 'Hypromellose', '.3 %', 'Eye Drops', 65),
(51, 'Alco Pharma Limited', 'Vertig 10', 'Flunarizine', '10 mg', 'Tablet', 5.02),
(52, 'The ACME Laboratories Ltd.', 'Fluzin-10', 'Flunarizine', '10 mg', 'Tablet', 5.01),
(53, 'Delta Pharma Limited', 'Scabo 6', 'Ivermectin', '6 mg', 'Tablet', 5),
(54, 'The ACME Laboratories Ltd.', 'Rostab 10', 'Rosuvastatin', '10 mg', 'Tablet', 22),
(55, 'Sharif Pharmaceuticals Ltd.', 'Merivit', 'Elemental Iron + Folic Acid + Nicotinamide + Pyridoxine Hydrochloride + Riboflavin + Vitamin B1 + Vitamin C + Zinc', '47 mg + .5 mg + 10 mg + 1 mg + 2 mg + 2 mg + 50 mg + 22.5 mg', 'Capsule', 3.51),
(56, 'Labaid Pharmaceuticals Ltd.', 'Comfy 2', 'Clonazepam', '2 mg', 'Tablet', 10),
(57, 'The White Horse Pharmaceuticals Ltd.', 'Volton TR', 'Diclofenac Sodium', '100 mg', 'Capsule', 3),
(58, 'Aristopharma Limited', 'Napro 500', 'Naproxen', '500 mg', 'Tablet', 8.5),
(59, 'Quality Pharmaceuticals (Pvt) Ltd.', 'Oroclox 500', 'Cloxacillin', '500 mg', 'Capsule', 6.74),
(60, 'Desh Pharmaceuticals Ltd.', 'Trifol TR', 'Ferrous Sulphate + Folic Acid + Zinc', '150 mg + 500 mcg + 22.5 mg', 'Capsule', 2.9),
(61, 'Cosmic Pharma Ltd.', 'Brodamox DS 500', 'Amoxicillin', '500 mg', 'Capsule', 6.75),
(62, 'Reman Drug Laboratories Ltd.', 'Refol Z TR', 'Ferrous Sulphate + Folic Acid + Zinc', '150 mg + 500 mcg + 22.5 mg', 'Capsule', 2.91),
(63, 'Chemist Laboratories Ltd.', 'Vita-S', 'Nicotinamide + Pyridoxine Hydrochloride + Riboflavin + Vitamin B1', '20 mg + 2 mg + 2 mg + 5 mg', 'Tablet', 38.1),
(64, 'Labaid Pharmaceuticals Ltd.', 'Tigilow 10', 'Atorvastatin', '10 mg', 'Tablet', 12.04),
(65, 'Goodman Pharmaceuticals Ltd', 'Litam 250', 'Levetiracetam', '250 mg', 'Tablet', 15),
(66, 'Eskayef Pharmaceuticals Ltd., Tongi,Gazipur', 'Neorex', 'Cephalexin', '125 mg/5 ml', 'Powder For Suspension', 83.5),
(67, 'The ACME Laboratories Ltd.', 'A Flox 500', 'Flucloxacillin', '500 mg/vial', 'Injection', 45.3),
(68, 'Incepta Pharmaceuticals Ltd.', 'Flamyd 250', 'Metronidazole', '250 mg', 'Tablet', 0.87),
(69, 'General Pharmaceuticals Ltd.', 'Costin 250', 'Calcium Carbonate', '625 mg', 'Tablet', 4),
(70, 'Delta Pharma Limited', 'Demovo', 'Naproxen', '500 mg', 'Tablet', 10),
(71, 'Amico Laboratories Ltd.', 'Dyzin 10', 'Cetirizine Dihydrochloride', '10 mg', 'Tablet', 2.75),
(72, 'Eskayef Pharmaceuticals Ltd., Tongi,Gazipur', 'Rivarox 2.5', 'Rivaroxaban', '2.5 mg', 'Tablet', 8),
(73, 'Techno Drugs Ltd.', 'Pantosec', 'Pantoprazole', '40 mg/vial', 'Injection', 70.47),
(74, 'Albion Laboratories Ltd.', 'Cinnarizine 15', 'Cinnarizine', '15 mg', 'Tablet', 1),
(75, 'Rephco Pharmaceuticals Ltd.', 'Diab', 'Gliclazide', '80 mg', 'Tablet', 6),
(76, 'Ibn Sina Pharmaceutical Ind. Ltd.', 'Axosin IV 500 mg', 'Ceftriaxone', '500 mg', 'IV Injection', 120.46),
(77, 'Medicon Pharmaceuticals Ltd.', 'Pirocin', 'Mupirocin', '100 mg/5 gm', 'Ointment', 120),
(78, 'Drug International Ltd., Squib Road', 'Flupen', 'Flucloxacillin', '125 mg/5 ml', 'Powder For Suspension', 65),
(79, 'Chemist Laboratories Ltd.', 'Tetracycline 250', 'Tetracycline Hydrochloride', '250 mg', 'Capsule', 1.4),
(80, 'Silco Pharmaceuticlas Ltd.', 'Naxsil 500', 'Naproxen', '500 mg', 'Tablet', 7),
(81, 'EDCL (Dhaka)', 'Chloroquine Phos', 'Chloroquine Phosphate', '80 mg/5 ml', 'Syrup', 12.72),
(82, 'Drug International Ltd.', 'Palnox 0.25 IV', 'Palonosetron', '.25 mg/vial', 'Injection', 100.3),
(83, 'The ACME Laboratories Ltd.', 'Sematid 3', 'Semaglutide', '3 mg', 'Tablet', 800),
(84, 'Square Pharmaceuticals PLC, Pabna', 'Radirif 1', 'Nalbuphine Hydrochloride', '10 mg/ml', 'Injection', 60.4),
(85, 'Beacon Pharmaceuticals PLC', 'Alysa', 'Allystrenol', '5 mg', 'Tablet', 8.02),
(86, 'Nuvista Pharma Ltd', 'Anaroxyl', 'Adrenochrome Monosemicarbazone', '5 mg/ml', 'Injection', 66.9),
(87, 'Drug International Ltd., Squib Road', 'Demoxil DS', 'Amoxicillin', '250 mg/5 ml', 'Powder For Suspension', 65.2),
(88, 'Opso Saline Ltd.', 'Ebanil 10 mg', 'Ebastine', '10 mg', 'Tablet', 6),
(89, 'Square Formulations Ltd.', 'Timotor', 'Trimebutine Maleate', '100 mg', 'Tablet', 6),
(90, 'Pacific Pharmaceuticals Ltd.', 'Polypro', 'Polyethylene Glycol 400 + Propylene Glycol', '400 mg + 300 mg/100 ml', 'Eye Drops', 180),
(91, 'Veritas Pharmaceuticals Ltd.', 'Doxotas 400', 'Doxophylline', '400 mg', 'Tablet', 10),
(92, 'Renata Limited', 'Zithrin 250', 'Azithromycin', '250 mg', 'Tablet', 25),
(93, 'Opsonin Pharma Limited', 'Visral', 'Tiemonium Methylsulphate', '200 mg/100 ml', 'Syrup', 90),
(94, 'Synovia Pharma PLC.', 'Epilim', 'Sodium Valproate', '200 mg/5 ml', 'Syrup', 80.54),
(95, 'Advanced Chemical Industries Limited', 'Rinase Respiratory Solution', 'Ipratropium Bromide', '250 mcg/ml', 'Solution', 14.04),
(96, 'Square Formulations Ltd.', 'Ketoral', 'Ketoconazole', '200 mg', 'Tablet', 9.06),
(97, 'Renata Limited', 'Deltasone', 'Prednisolone', '5 mg/5 ml', 'Solution', 60),
(98, 'General Pharmaceuticals Ltd.', 'Peak', 'Sildenafil', '100 mg', 'Tablet', 50.15),
(99, 'Incepta Pharmaceuticals Ltd.', 'Dobesil', 'Calcium Dobesilate', '500 mg', 'Capsule', 20),
(100, 'Incepta Pharmaceuticals Ltd.', 'Emixef', 'Cefixime', '100 mg/5 ml', 'Powder For Suspension', 210),
(101, 'Unimed Unihealth Pharmaceuticals Ltd.', 'Gabatin 600', 'Gabapentin', '600 mg', 'Tablet', 20),
(102, 'Unimed Unihealth Pharmaceuticals Ltd.', 'Utramal-50', 'Tramadol Hydrochloride', '50 mg', 'Capsule', 8.5),
(103, 'Unimed Unihealth Pharmaceuticals Ltd.', 'Telamlo 40/5', 'Amlodipine + Telmisartan', '5 mg + 40 mg', 'Tablet', 12.5),
(104, 'Eskayef Pharmaceuticals Ltd. Mirpur.', 'Sentix 0.5', 'Flupenthixol', '.5 mg', 'Tablet', 3.5),
(105, 'Aristopharma Limited', 'Erdon', 'Diclofenac Sodium', '50 mg', 'Suppository', 15),
(106, 'Beacon Pharmaceuticals PLC', 'Lexel', 'Letrozole', '2.5 mg', 'Tablet', 40),
(107, 'Team Pharmaceuticals Ltd.', 'Desotem', 'Desloratadine', '2.5 mg/5 ml', 'Syrup', 30),
(108, 'Desh Pharmaceuticals Ltd.', 'Unibion', 'Cyanocobalamin + Pyridoxine Hydrochloride + Vitamin B1', '200 mcg + 200 mg + 100 mg', 'Tablet', 8),
(109, 'Opsonin Pharma Limited', 'Vorinox 200 mg Tablet', 'Voriconazole', '200 mg', 'Tablet', 110),
(110, 'Healthcare Pharmaceuticals Ltd.', 'Opal 40 mg', 'Omeprazole', '40 mg/vial', 'Injection', 95),
(111, 'Pacific Pharmaceuticals Ltd.', 'Linadi Plus 1000', 'Linagliptin + Metformin Hydrochloride', '2.5 mg + 1000 mg', 'Tablet', 16),
(112, 'Cosmic Pharma Ltd.', 'Sectil 20', 'Omeprazole', '20 mg', 'Capsule', 5),
(113, 'Sun Pharmaceutical (Bangladesh) Ltd.', 'Levipil 500', 'Levetiracetam', '500 mg', 'Tablet', 28),
(114, 'Everest Pharmaceuticals Ltd.', 'Niro TR', 'Diclofenac Sodium', '100 mg', 'Capsule', 2.5),
(115, 'NIPRO JMI Pharma Limited', 'Reflexen 10', 'Baclofen', '10 mg', 'Tablet', 8.02),
(116, 'Opsonin Pharma Limited', 'Tealis 40', 'Tadalafil', '40 mg', 'Tablet', 100.3),
(117, 'Techno Drugs Ltd.', 'Romilac-30', 'Ketorolac Tromethamine', '30 mg/ml', 'Injection', 56.38),
(118, 'Nipa Pharmaceuticals Ltd.', 'Moxapen 500', 'Amoxicillin', '500 mg', 'Capsule', 6),
(119, 'Unimed Unihealth Pharmaceuticals Ltd.', 'Clozox', 'Clotrimazole', '10 mg/gm', 'Cream', 25),
(120, 'Healthcare Pharmaceuticals Ltd.', 'Gembine Inj. 1 gm', 'Gemcitabine', '1 gm/vial', 'Injection', 5500),
(121, 'Euro Pharma Ltd.', 'Amtinol Plus', 'Amlodipine + Atenolol', '5 mg + 50 mg', 'Tablet', 4.5),
(122, 'Incepta Pharmaceuticals Ltd.', 'Lomequin', 'Lomefloxacin', '.3 gm/100 ml', 'Eye Drops', 70),
(123, 'Beacon Pharmaceuticals PLC', 'Xaloplat', 'Oxaliplatin', '50 mg/vial', 'Injection', 3000),
(124, 'Novatek Pharmaceuticals Ltd.', 'supersol hand rub', 'Isopropyl Alcohol', '75 ml/100 ml', 'Solution', 60),
(125, 'Globe Pharmaceuticals Ltd.', 'Butil', 'Butamirate Citrate', '150 mg/100 ml', 'Syrup', 80),
(126, 'Opsonin Pharma Limited', 'Esotid 40', 'Esomeprazole', '40 mg', 'Tablet', 9),
(127, 'Orion Pharma Ltd.', 'Xclor', 'Cefaclor', '125 mg/5 ml', 'Powder For Suspension', 190.57),
(128, 'Jenphar Bangladesh Ltd.', 'Atovex 20', 'Atorvastatin', '20 mg', 'Tablet', 18),
(129, 'Labaid Pharmaceuticals Ltd.', 'Montilab 5', 'Montelukast', '5 mg', 'Chewable Tablet', 9),
(130, 'NIPRO JMI Pharma Limited', 'Dmigrain 1.5', 'Pizotifen', '1.5 mg', 'Tablet', 7.02),
(131, 'Biopharma Ltd.', 'Mepen-1 gm IV', 'Meropenem', '1 gm/vial', 'Injection', 1200),
(132, 'Avarox Pharmaceuticals Ltd.', 'Alermet', 'Cetirizine Dihydrochloride', '5 mg/5 ml', 'Syrup', 16),
(133, 'Eskayef Pharmaceuticals Ltd. Mirpur.', 'Pred 20', 'Prednisolone', '20 mg', 'Tablet', 6.27),
(134, 'Square Pharmaceuticals PLC, Pabna', 'Anzitor EZ 10/10 Tablet', 'Atorvastatin + Ezetimibe', '10 mg + 10 mg', 'Tablet', 14),
(135, 'Asiatic Laboratories Ltd.', 'Tobicort', 'Dexamethasone + Tobramycin', '100 mg + 300 mg/100 ml', 'Eye Drops', 90),
(136, 'Drug International Ltd.', 'Eyebrom', 'Bromfenac', '90 mg/100 ml', 'Eye Drops', 100.3),
(137, 'Pristine Pharmaceuticals', 'Paragyl 400', 'Metronidazole', '400 mg', 'Tablet', 1.7),
(138, 'Ibn Sina Pharmaceutical Ind. Ltd.', 'Levosina 250', 'Levofloxacin', '250 mg', 'Tablet', 8),
(139, 'Ibn Sina Pharmaceutical Ind. Ltd.', 'Lytex SR 75', 'Ambroxol', '75 mg', 'Capsule', 5.5),
(140, 'Square Pharmaceuticals PLC, Gazipur', 'Alacot 0.1%', 'Olopatadine', '1 mg/ml', 'Eye Drops', 110.34),
(141, 'Beacon Pharmaceuticals PLC', 'Flexibac', 'Baclofen', '100 mg/100 ml', 'Syrup', 100),
(142, 'The ACME Laboratories Ltd.', 'Momet-F 200/5', 'Formoterol Fumarate Dihydrate + Mometasone Furoate', '5 mcg + 200 mcg/Puff', 'Inhaler', 895),
(143, 'Ibn Sina Pharmaceutical Ind. Ltd.', 'Unisaline', 'Dextrose Anhydrous + Potassium Chloride + Sodium Chloride + Trisodium Citrate', '10 gm + 750 gm + 1.75 gm + 1.45 gm/500 ml', 'Oral Saline', 5),
(144, 'Globe Pharmaceuticals Ltd.', 'Rolid 300', 'Roxithromycin', '300 mg', 'Tablet', 14),
(145, 'Eskayef Pharmaceuticals Ltd. Mirpur.', 'Flucloxin 500', 'Flucloxacillin', '500 mg', 'Capsule', 10.5),
(146, 'General Pharmaceuticals Ltd, Unit-2', 'Buprocaine', 'Oxybuprocaine Hydrochloride', '4 mg/ml', 'Eye Drops', 100.3),
(147, 'Aristopharma Limited', 'Extracef', 'Cephradine', '125 mg/5 ml', 'Powder For Suspension', 90),
(148, 'Cosmo Pharma Laboratories Ltd.', 'Cosmozole 20', 'Esomeprazole', '20 mg', 'Capsule', 6.5),
(149, 'Incepta Pharmaceuticals Ltd.', 'Timopress 0.5%', 'Timolol Maleate', '.5 %', 'Eye Drops', 70),
(150, 'DBL Pharmaceuticals Limited', 'Vilagli Tablet', 'Vildagliptin', '50 mg', 'Tablet', 25),
(151, 'Team Pharmaceuticals Ltd.', 'Ometem 40', 'Omeprazole', '40 mg', 'Capsule', 8),
(152, 'Jayson Pharmaceuticals Ltd.', 'Stiboson', 'Sodium Stibogluconate', '100 mg/ml', 'Injection', 91.71),
(153, 'EDCL (Dhaka)', 'Paracetamol', 'Paracetamol', '500 mg', 'Tablet', 0.8),
(154, 'Popular Pharmaceuticals Ltd.', 'Citalon 10', 'Escitalopram', '10 mg', 'Tablet', 10),
(155, 'Jayson Pharmaceuticals Ltd.', 'Meforex 850', 'Metformin Hydrochloride', '850 mg', 'Tablet', 2.52),
(156, 'Incepta Pharmaceuticals Ltd.', 'Iriban', 'Mebeverine Hydrochloride', '135 mg', 'Tablet', 6),
(157, 'Ibn Sina Pharmaceutical Ind. Ltd.', 'Bimolet', 'Brimonidine Tartrate + Timolol Maleate', '200 mg + 500 mg/100 ml', 'Eye Drops', 110),
(158, 'Sun Pharmaceutical (Bangladesh) Ltd.', 'Ranozex', 'Ranolazine', '500 mg', 'Er Tablet', 16),
(159, 'EDCL (Dhaka)', 'Chlorpheniramine', 'Chlorpheniramine Maleate', '2 mg/5 ml', 'Syrup', 13.64),
(160, 'Square Pharmaceuticals PLC, Gazipur', 'Folita 5', 'Folinic Acid', '5 mg', 'Tablet', 9),
(161, 'Somatec Pharmaceuticals Ltd.', 'Flunol', 'Fluconazole', '50 mg/5 ml', 'Powder For Suspension', 78.3),
(162, 'Novartis (Bangladesh) Ltd.', 'Gaboton 300', 'Gabapentin', '300 mg', 'Tablet', 16),
(163, 'Unimed Unihealth Pharmaceuticals Ltd.', 'Cadosil LD', 'Calcium Dobesilate + Dexamethasone Acetate + Lidocaine Hydrochloride', '4 gm + 25 mg + 2 gm/100 gm', 'Ointment', 170),
(164, 'Rephco Pharmaceuticals Ltd.', 'Knil 60', 'Ketorolac Tromethamine', '60 mg/2 ml', 'Injection', 100),
(165, 'Hudson Pharmaceuticals Ltd.', 'Hi Cef', 'Cephalexin', '125 mg/5 ml', 'Powder For Suspension', 70),
(166, 'Aristopharma Limited', 'Contine-200 CR', 'Theophylline', '200 mg', 'Tablet', 1.6),
(167, 'Drug International Ltd., Squib Road', 'Unipim 500', 'Cefepime', '500 mg/vial', 'IV_IM Injection', 301.1),
(168, 'Advanced Chemical Industries Limited', 'Karvedil 25', 'Carvedilol', '25 mg', 'Tablet', 8.05),
(169, 'General Pharmaceuticals Ltd.', 'Genamox 500', 'Amoxicillin', '500 mg', 'Capsule', 6.76),
(170, 'Incepta Pharmaceuticals Ltd. (Dhamrai Unit)', 'Dermomix Cream', 'Clobetasol Propionate + Ofloxacin + Ornidazole + Terbinafine Hydrochloride', '.05 gm + .75 gm + 2 gm + 1 gm/100 gm', 'Cream', 150),
(171, 'Square Pharmaceuticals PLC, Gazipur', 'Lanso 30', 'Lansoprazole', '30 mg', 'Capsule', 6.04),
(172, 'Incepta Pharmaceuticals Ltd.', 'Erlocent 100', 'Erlotinib', '100 mg', 'Tablet', 550),
(173, 'Globe Pharmaceuticals Ltd.', 'Glophen', 'Chloramphenicol', '5 mg/ml', 'Eye Drops', 34),
(174, 'General Pharmaceuticals Ltd.', 'Extopel', 'Diphenhydramine Hydrochloride + Guaiphenesin + Levomenthol', '280 mg + 2000 mg + 22 mg/100 ml', 'Syrup', 80),
(175, 'Incepta Pharmaceuticals Ltd. (Dhamrai Unit)', 'Ninacent 150', 'Nintedanib', '150 mg', 'Capsule', 350),
(176, 'Ibn Sina Pharmaceutical Ind. Ltd.', 'Dexlan 30', 'Dexlansoprazole', '30 mg', 'Capsule', 10),
(177, 'Millat Pharmaceuticals Ltd.', 'Emazol Plus', 'Esomeprazole + Naproxen', '20 mg + 500 mg', 'Tablet', 10),
(178, 'EDCL (Dhaka)', 'Erythromycin 250', 'Erythromycin', '250 mg', 'Tablet', 3.43),
(179, 'General Pharmaceuticals Ltd.', 'Glustin TS', 'Chondroitin + Glucosamine', '600 mg + 750 mg', 'Tablet', 16),
(180, 'Apex Pharma Ltd.', 'Gavipex Suspension', 'Calcium Carbonate + Sodium Alginate + Sodium Bicarbonate', '1.6 gm + 5 gm + 2.6 gm/100 ml', 'Suspension', 250),
(181, 'Ambee Pharmaceuticals Ltd.', 'Lexlo 250', 'Levofloxacin', '250 mg', 'Tablet', 8.03),
(182, 'Ibn Sina Pharmaceutical Ind. Ltd.', 'Dopadon', 'Domperidone', '10 mg', 'Tablet', 2.5),
(183, 'Beacon Pharmaceuticals PLC', 'Teslar 80', 'Telmisartan', '80 mg', 'Tablet', 21),
(184, 'Sun Pharmaceutical (Bangladesh) Ltd.', 'Olmezest AM', 'Amlodipine + Olmesartan Medoxomil', '5 mg + 20 mg', 'Tablet', 10),
(185, 'Popular Pharmaceuticals Ltd.', 'Spirocar Plus', 'Frusemide + Spironolactone', '20 mg + 50 mg', 'Tablet', 6.02),
(186, 'Prime Pharmaceuticals Ltd.', 'Pricef', 'Cephradine', '125 mg/5 ml', 'Powder For Suspension', 80),
(187, 'Drug International Ltd.', 'Famotid 40', 'Famotidine', '40 mg', 'Tablet', 4.05),
(188, 'Popular Pharmaceuticals Ltd.', 'Toramax 60', 'Ketorolac Tromethamine', '60 mg/2 ml', 'Injection', 190),
(189, 'Ibn Sina Pharmaceutical Ind. Ltd.', 'Sinamox 250', 'Amoxicillin', '250 mg', 'Capsule', 3.6),
(190, 'Opso Saline Ltd.', 'Curepen IV 500 mg', 'Meropenem', '500 mg/vial', 'Injection', 652.45),
(191, 'Drug International Ltd., Gopalpur', 'Barinib', 'Baricitinib', '2 mg', 'Tablet', 25),
(192, 'Millat Pharmaceuticals Ltd.', 'Capcin 500', 'Tetracycline Hydrochloride', '500 mg', 'Capsule', 2.2),
(193, 'Ibn Sina Pharmaceutical Ind. Ltd.', 'Acipam-10', 'Escitalopram', '10 mg', 'Tablet', 10),
(194, 'Alco Pharma Limited', 'Maxclin 300', 'Clindamycin', '300 mg', 'Capsule', 14),
(195, 'Incepta Pharmaceuticals Ltd.', 'Cortan 10', 'Prednisolone', '10 mg', 'Tablet', 3.23),
(196, 'Hudson Pharmaceuticals Ltd.', 'Metroson 400', 'Metronidazole', '400 mg', 'Tablet', 1.25),
(197, 'Asiatic Laboratories Ltd.', 'Asul', 'Salbutamol', '2 mg/5 ml', 'Syrup', 22.92),
(198, 'Novartis (Bangladesh) Ltd.', 'Epnil 0.5', 'Clonazepam', '.5 mg', 'Tablet', 7),
(199, 'Chemist Laboratories Ltd.', 'Promodin', 'Promethazine Hydrochloride', '5 mg/5 ml', 'Syrup', 77.5),
(200, 'General Pharmaceuticals Ltd, Unit-2', 'Claxo 60 SC/IV', 'Enoxaprin', '60 mg/.6 ml', 'Injection', 575),
(201, 'Beximco Pharmaceuticals Ltd.', 'Duvent', 'Rupatadine', '100 mg/100 ml', 'Oral Solution', 60),
(202, 'Nuvista Pharma Ltd', 'Zoleta', 'Letrozole', '2.5 mg', 'Tablet', 40.12),
(203, 'Beximco Pharmaceuticals Ltd.', 'Alpatin', 'Epinastine Hydrochloride', '.05 gm/100 ml', 'Eye Drops', 150),
(204, 'Ibn Sina Pharmaceutical Ind. Ltd.', 'Prolok 20', 'Omeprazole', '20 mg', 'Capsule', 5),
(205, 'Radiant Pharmaceuticals Ltd.', 'Rivotril 0.5', 'Clonazepam', '.5 mg', 'Tablet', 7.02),
(206, 'Synovia Pharma PLC.', 'Fimoxyl 250', 'Amoxicillin', '250 mg', 'Capsule', 3.62),
(207, 'Square Pharmaceuticals PLC, Pabna', 'Oxapro 5', 'Escitalopram', '5 mg', 'Tablet', 5.54),
(208, 'Concord Pharmaceuticals Ltd.', 'Novotril 2', 'Clonazepam', '2 mg', 'Tablet', 9),
(209, 'Opso Saline Ltd.', 'Diclofenac', 'Diclofenac Sodium', '1 mg/ml', 'Eye Drops', 80),
(210, 'Popular Pharmaceuticals Ltd.', 'Progest', 'Dydrogesterone', '10 mg', 'Tablet', 30),
(211, 'Amulet Pharmaceuticals Ltd.', 'Amupime 500 IV/IM', 'Cefepime', '500 mg/vial', 'IV_IM Injection', 300),
(212, 'Square Formulations Ltd.', 'Nexum 40', 'Esomeprazole', '40 mg', 'Tablet', 14),
(213, 'Pristine Pharmaceuticals', 'LABENDA 400', 'Albendazole', '400 mg', 'Tablet', 4),
(214, 'Incepta Pharmaceuticals Ltd.', 'Valsartil 160', 'Valsartan', '160 mg', 'Tablet', 8),
(215, 'Beximco Pharmaceuticals Ltd.', 'Adafil 20', 'Tadalafil', '20 mg', 'Tablet', 60),
(216, 'Silva Pharmaceuticals Ltd.', 'Serifen 400', 'Dexibuprofen (S Ibuprofen)', '400 mg', 'Tablet', 5.02),
(217, 'Eskayef Pharmaceuticals Ltd., Tongi,Gazipur', 'Ragil 1', 'Rasagiline', '1 mg', 'Tablet', 20),
(218, 'Everest Pharmaceuticals Ltd.', 'Acaluxen', 'Acalabrutinib', '100 mg', 'Capsule', 1000),
(219, 'Aristopharma Limited', 'Cilnipin 5', 'Cilnidipine', '5 mg', 'Tablet', 7),
(220, 'Globe Pharmaceuticals Ltd.', 'Ema 20', 'Esomeprazole', '20 mg', 'Tablet', 6),
(221, 'Opsonin Pharma Limited', 'Prucalo 2', 'Prucalopride', '2 mg', 'Tablet', 24),
(222, 'Amico Laboratories Ltd.', 'Dyzin', 'Cetirizine Dihydrochloride', '5 mg/5 ml', 'Syrup', 22),
(223, 'G. A. Company Ltd.', 'Bensal', 'Benzoic Acid + Salicylic Acid', '60 mg + 30 mg/gm', 'Ointment', 5.56),
(224, 'Incepta Pharmaceuticals Ltd.', 'Tergocin 200', 'Teicoplanin', '200 mg/vial', 'Injection', 700),
(225, 'Modern Pharmaceuticals Ltd.', 'M-Trim', 'Sulphamethoxazole + Trimethoprim', '800 mg + 160 mg', 'Tablet', 2.02),
(226, 'Albion Laboratories Ltd.', 'Levamisole', 'Levamisole', '40 mg/5 ml', 'Syrup', 12),
(227, 'Opsonin Pharma Limited', 'Linadus M 2.5/1000 mg', 'Linagliptin + Metformin Hydrochloride', '2.5 mg + 1000 mg', 'Tablet', 16),
(228, 'G. A. Company Ltd.', 'G-Fix 400', 'Cefixime', '400 mg', 'Capsule', 48),
(229, 'Millat Pharmaceuticals Ltd.', 'Glimet 850', 'Metformin Hydrochloride', '850 mg', 'Tablet', 4),
(230, 'The ACME Laboratories Ltd.', 'Angist SR 2.6', 'Glyceryl Trinitrate', '2.6 mg', 'Tablet', 4.03),
(231, 'General Pharmaceuticals Ltd.', 'Riscord 1', 'Risperidone', '1 mg', 'Tablet', 2.75),
(232, 'Aristopharma Limited', 'Ivacard 7.5', 'Ivabradine', '7.5 mg', 'Tablet', 60),
(233, 'Ad-din Pharmaceuticals Ltd.', 'Emigut', 'Ondansetron', '80 mg/100 ml', 'Solution', 48),
(234, 'Veritas Pharmaceuticals Ltd.', 'Vericef 500', 'Cephradine', '500 mg', 'Capsule', 13.5),
(235, 'Beximco Pharmaceuticals Ltd.', 'Aeronid HFA', 'Budesonide', '200 mcg/Metered Inhalation', 'Aerosol Inhalation', 410),
(236, 'Pharmasia Ltd.', 'Fuxtil IV/IM 750mg/Vial', 'Cefuroxime', '750 mg/vial', 'IV_IM Injection', 125),
(237, 'Albion Laboratories Ltd.', 'Diltiazem 60', 'Diltiazem Hydrochloride', '60 mg', 'Tablet', 3.8),
(238, 'General Pharmaceuticals Ltd.', 'Restobac 5', 'Baclofen', '5 mg', 'Tablet', 5.5),
(239, 'The ACME Laboratories Ltd.', 'Monas 4', 'Montelukast', '4 mg', 'Tablet', 7),
(240, 'Orion Pharma Ltd.', 'Ketorin 10', 'Ketorolac Tromethamine', '10 mg', 'Tablet', 10.07),
(241, 'Globe Pharmaceuticals Ltd.', 'Anobac 300', 'Clindamycin', '300 mg', 'Capsule', 15),
(242, 'Square Pharmaceuticals PLC, Gazipur', 'Darboren 40', 'Darbepoetin', '40 mcg/.4 ml', 'Injection', 4500),
(243, 'The White Horse Pharmaceuticals Ltd.', 'Laxicon', 'Frusemide + Spironolactone', '20 mg + 50 mg', 'Tablet', 6),
(244, 'Eskayef Pharmaceuticals Ltd., Tongi,Gazipur', 'Tuscof', 'Dextromethorphan Hydrobromide + Guaiphenesin + Menthol', '300 mg + 4 gm + 300 mg/100 ml', 'Syrup', 85),
(245, 'Square Pharmaceuticals PLC, Pabna', 'Flamfix 500', 'Nabumetone', '500 mg', 'Tablet', 15),
(246, 'Modern Pharmaceuticals Ltd.', 'Modern\'s White fields', 'Benzoic Acid + Salicylic Acid', '60 mg + 30 mg/gm', 'Ointment', 8),
(247, 'Incepta Pharmaceuticals Ltd.', 'Ziflu 10mg/5ml', 'Zinc', '10 mg/5 ml', 'Syrup', 30),
(248, 'Incepta Pharmaceuticals Ltd.', 'Lutisone 2', 'Fluticasone Propionate', '2 mg', 'Nebuliser Solution', 100),
(249, 'Aristopharma Limited', 'Empaglif 25', 'Empagliflozin', '25 mg', 'Tablet', 40),
(250, 'Unimed Unihealth Pharmaceuticals Ltd.', 'Nebicard 5', 'Nebivolol', '5 mg', 'Tablet', 12),
(251, 'Renata Limited', 'Topmate 50 mg', 'Topiramate', '50 mg', 'Tablet', 6),
(252, 'Globe Pharmaceuticals Ltd.', 'Sucorid-4', 'Glimepiride', '4 mg', 'Tablet', 8),
(253, 'EDCL (Dhaka)', 'Methyl Ergometrine', 'Methyl Ergometrine Maleate', '125 mcg', 'Tablet', 0.58),
(254, 'Pharmasia Ltd.', 'Voltid Plus', 'Diclofenac + Lidocaine Hydrochloride', '75 mg + 20 mg/2 ml', 'IM Injection', 9.5),
(255, 'The ACME Laboratories Ltd.', 'Trizon IV 250 mg', 'Ceftriaxone', '250 mg', 'IV Injection', 100.3),
(256, 'Square Pharmaceuticals PLC, Pabna', 'Ermox 500', 'Mebendazole', '500 mg', 'Tablet', 2.24),
(257, 'Unimed Unihealth Pharmaceuticals Ltd.', 'Ucardol 12.5', 'Carvedilol', '12.5 mg', 'Tablet', 5),
(258, 'Labaid Pharmaceuticals Ltd.', 'Domaid 10', 'Domperidone', '10 mg', 'Tablet', 4),
(259, 'Pacific Pharmaceuticals Ltd.', 'Diatrol MR', 'Gliclazide', '30 mg', 'Tablet', 8),
(260, 'Aristopharma Limited', 'T-Mycin PLUS', 'Dexamethasone + Tobramycin', '100 mg + 300 mg/100 ml', 'Eye Drops', 150),
(261, 'Kemiko Pharmaceuticals Ltd.', 'Doxikem 100', 'Doxycycline', '100 mg', 'Capsule', 2),
(262, 'Jayson Pharmaceuticals Ltd.', 'Jaflam 400', 'Ibuprofen', '400 mg', 'Tablet', 1.41),
(263, 'Square Pharmaceuticals PLC, Pabna', 'Levostar 2', 'Levosalbutamol', '2 mg', 'Tablet', 2),
(264, 'Eskayef Pharmaceuticals Ltd., Tongi,Gazipur', 'Ventofil 400', 'Doxophylline', '400 mg', 'Tablet', 10),
(265, 'Advanced Chemical Industries Limited', 'Biocal-D F/C Tablet', 'Calcium (Algae Source) + Vitamin D3', '500 mg + 200 IU', 'Tablet', 11),
(266, 'Eskayef Pharmaceuticals Ltd., Tongi,Gazipur', 'Arocef', 'Cefadroxil', '125 mg/5 ml', 'Powder For Suspension', 90),
(267, 'Opsonin Pharma Limited', 'Moxin 875', 'Amoxicillin', '875 mg', 'Tablet', 11.67),
(268, 'Genvio Pharma Ltd.', 'Seberb 250 mg Tablet', 'Gefitinib', '250 mg', 'Tablet', 250),
(269, 'Healthcare Pharmaceuticals Ltd.', 'Flowrap 4 mg', 'Silodosin', '4 mg', 'Capsule', 12),
(270, 'Incepta Pharmaceuticals Ltd.', 'Joinix TS Tablet', 'Chondroitin + Glucosamine', '600 mg + 750 mg', 'Tablet', 16),
(271, 'Delta Pharma Limited', 'Xone-3 IM 500 mg', 'Ceftriaxone', '500 mg', 'IM Injection', 130),
(272, 'Synovia Pharma PLC.', 'Sandom', 'Domperidone', '5 mg/ml', 'Paediatric Drops', 20.13),
(273, 'Incepta Pharmaceuticals Ltd.', 'Aprima 10', 'Apremilast', '10 mg', 'Tablet', 25),
(274, 'Orion Pharma Ltd.', 'Tone', 'Thiamine Hydrochloride (Vit-B1)', '100 mg', 'Tablet', 0.73),
(275, 'Biopharma Ltd.', 'Penfil 20', 'Tadalafil', '20 mg', 'Tablet', 55),
(276, 'Hudson Pharmaceuticals Ltd.', 'Cef PLUS', 'Cefixime', '100 mg/5 ml', 'Powder For Suspension', 170),
(277, 'Jayson Pharmaceuticals Ltd.', 'Megafen SR 100', 'Diclofenac Sodium', '100 mg', 'Sr Tablet', 3.02),
(278, 'Eskayef Pharmaceuticals Ltd., Narayanganj', 'Augment 1.2 IV', 'Amoxicillin + Clavulanic Acid', '1 gm + 200 mg', 'Injection', 300),
(279, 'Astra Biopharmaceuticals Ltd.', 'Esoz 40 mg', 'Esomeprazole', '40 mg', 'Capsule', 8),
(280, 'Eskayef Pharmaceuticals Ltd., Tongi,Gazipur', 'Handisafe Antiseptic', 'Ethanol (96%)', '83.333 ml/100 ml', 'Solution', 150),
(281, 'Sun Pharmaceutical (Bangladesh) Ltd.', 'Duzela 20', 'Duloxetine', '20 mg', 'Capsule', 7.07),
(282, 'Unimed Unihealth Pharmaceuticals Ltd.', 'Napexa 375/20', 'Esomeprazole + Naproxen', '20 mg + 375 mg', 'Tablet', 12),
(283, 'Everest Pharmaceuticals Ltd.', 'Ponaxen-15', 'Ponatinib', '15 mg', 'Tablet', 650),
(284, 'Pacific Pharmaceuticals Ltd.', 'Germ Wash Hand Sanitizer', 'Isopropyl Alcohol', '75 ml/100 ml', 'Solution', 80),
(285, 'Beximco Pharmaceuticals Ltd.', 'Rolacin 500', 'Clarithromycin', '500 mg', 'Tablet', 40),
(286, 'Aristopharma Limited', 'Aprocin', 'Ciprofloxacin', '125 mg/5 ml', 'Powder For Suspension', 100),
(287, 'EDCL (Dhaka)', 'Ketorolac Tromethmine', 'Ketorolac Tromethamine', '10 mg', 'Tablet', 5.7),
(288, 'Amulet Pharmaceuticals Ltd.', 'Rheunil', 'Aceclofenac', '100 mg', 'Tablet', 3.01),
(289, 'Premier Pharmaceuticals Ltd.', 'Mine 850', 'Metformin Hydrochloride', '850 mg', 'Tablet', 3),
(290, 'Techno Drugs Ltd.', 'Provera', 'Medroxyprogesterone Acetate', '150 mg/ml', 'Injection', 48),
(291, 'Aristopharma Limited', 'Glucozid MR 30', 'Gliclazide', '30 mg', 'Tablet', 8.8),
(292, 'Unimed Unihealth Pharmaceuticals Ltd.', 'Unifarin-1', 'Warfarin Sodium', '1 mg', 'Tablet', 1),
(293, 'Pacific Pharmaceuticals Ltd.', 'Cefodim', 'Cefpodoxime', '40 mg/5 ml', 'Powder For Suspension', 95),
(294, 'Euro Pharma Ltd.', 'Lopoten 50', 'Losartan Potassium', '50 mg', 'Tablet', 6),
(295, 'Doctor\'s Chemicals Works Ltd.', 'Esru 20', 'Esomeprazole', '20 mg', 'Tablet', 6),
(296, 'Veritas Pharmaceuticals Ltd.', 'Rabever 20', 'Rabeprazole Sodium', '20 mg', 'Capsule', 8),
(297, 'Pharmasia Ltd.', 'Trimax 2 Gm IV', 'Ceftriaxone', '2 gm', 'IV Injection', 300),
(298, 'Ambee Pharmaceuticals Ltd.', 'Tricef', 'Cefixime', '100 mg/5 ml', 'Powder For Suspension', 160.61),
(299, 'Cosmic Pharma Ltd.', 'Ifen 400', 'Ibuprofen', '400 mg', 'Tablet', 1.41),
(300, 'Novatek Pharmaceuticals Ltd.', 'Biscard 5', 'Bisoprolol Hemifumarate', '5 mg', 'Tablet', 10),
(301, 'Concord Pharmaceuticals Ltd.', 'Maxdol 30', 'Ketorolac Tromethamine', '30 mg/ml', 'Injection', 55),
(302, 'Asiatic Laboratories Ltd.', 'Asipine 1%', 'Pilocarpine Hydrochloride', '1 %', 'Eye Drops', 80),
(303, 'Asiatic Laboratories Ltd.', 'Lexnil', 'Bromazepam', '3 mg', 'Tablet', 4),
(304, 'The White Horse Pharmaceuticals Ltd.', 'Sigtil-M', 'Metformin Hydrochloride + Sitagliptin', '500 mg + 50 mg', 'Tablet', 18),
(305, 'Eskayef Pharmaceuticals Ltd. Mirpur.', 'Mycofin', 'Terbinafine', '250 mg', 'Tablet', 40),
(306, 'Gonoshasthaya Pharmaceuticals Ltd.', 'G Amoxicillin 500', 'Amoxicillin', '500 mg', 'Injection', 25),
(307, 'One Pharma Ltd.', 'Bidicod', 'Butamirate Citrate', '150 mg/100 ml', 'Syrup', 80),
(308, 'Aristopharma Limited', 'V-Gra 50 mg', 'Sildenafil', '50 mg', 'Tablet', 30),
(309, 'Square Pharmaceuticals PLC, Pabna', 'Timotor', 'Trimebutine Maleate', '100 mg', 'Tablet', 6),
(310, 'Popular Pharmaceuticals Ltd.', 'Pegalin 100', 'Pregabalin', '100 mg', 'Capsule', 22.08),
(311, 'Navana Pharmaceuticals Ltd.', 'Cefzon', 'Ceftazidime', '250 mg/vial', 'IV_IM Injection', 80),
(312, 'Square Pharmaceuticals PLC, Pabna', 'Pivalo-2', 'Pitavastatin', '2 mg', 'Tablet', 10.03),
(313, 'Biopharma Ltd.', 'Salbu', 'Salbutamol', '2 mg/5 ml', 'Syrup', 11.04),
(314, 'Globe Pharmaceuticals Ltd.', 'Actrim', 'Sulphamethoxazole + Trimethoprim', '200 mg + 40 mg/5 ml', 'Suspension', 22),
(315, 'Opsonin Pharma Limited', 'Tolson Plus', 'Lidocaine Hydrochloride + Tolperisone Hydrochloride', '2.5 mg + 100 mg', 'Injection', 30.2),
(316, 'Kumudini Pharma Ltd.', 'Pulmokast 4', 'Montelukast', '4 mg', 'Chewable Tablet', 5),
(317, 'Concord Pharmaceuticals Ltd.', 'Ostocare D', 'Calcium (Coral Calcium) + Vitamin D3', '500 mg + 200 IU', 'Tablet', 10),
(318, 'Beximco Pharmaceuticals Ltd.', 'Digecid Plus', 'Magaldrate + Simethicone', '480 mg + 20 mg/5 ml', 'Suspension', 110),
(319, 'Beximco Pharmaceuticals Ltd.', 'Bextram GOLD', 'Ascorbic Acid + Biotin + Boron + Calcium + Chromium + Copper + Cyanocobalamin + Elemental Iron + Folic Acid + Iodi', '60 mg + 30 mcg + 150 mcg + 162 mg + 120 mcg + 2 mg + 6 mcg +', 'Tablet', 7),
(320, 'Ambee Pharmaceuticals Ltd.', 'Arolak', 'Ketorolac Tromethamine', '10 mg/ml', 'Injection', 55.21),
(321, 'Doctor\'s Chemicals Works Ltd.', 'Eradex', 'Loratadine', '10 mg', 'Tablet', 3.5),
(322, 'Silco Pharmaceuticlas Ltd.', 'Naxsil E 500', 'Esomeprazole + Naproxen', '20 mg + 500 mg', 'Tablet', 10),
(323, 'Incepta Pharmaceuticals Ltd.', 'Pixorel 5', 'Apixaban', '5 mg', 'Tablet', 25),
(324, 'Pristine Pharmaceuticals', 'Coralbon DX', 'Calcium (Coral Calcium) + Vitamin D3', '500 mg + 200 IU', 'Tablet', 10),
(325, 'Rangs Pharmaceuticals Ltd.', 'Lindex', 'Cephradine', '125 mg/1.25 ml', 'Paediatric Drops', 60),
(326, 'Eskayef Pharmaceuticals Ltd., Tongi,Gazipur', 'Cloron 0.5', 'Clonazepam', '.5 mg', 'Tablet', 7),
(327, 'Incepta Pharmaceuticals Ltd.', 'Emospft Ointment', 'Liquid Paraffin + White Soft Paraffin', '50 gm + 50 gm/100 gm', 'Ointment', 300),
(328, 'Aristopharma Limited', 'Rhinil', 'Cetirizine Dihydrochloride', '5 mg/5 ml', 'Syrup', 30),
(329, 'S. N. Pharmaceuticals Ltd.', 'Candizol', 'Fluconazole', '50 mg', 'Capsule', 7),
(330, 'Opsonin Pharma Limited', 'Nixcof', 'Diphenhydramine Hydrochloride + Guaiphenesin + Levomenthol', '280 mg + 2000 mg + 22 mg/100 ml', 'Syrup', 80),
(331, 'Asiatic Laboratories Ltd.', 'Arbium Plus 100/12.50', 'Hydrochlorothiazide + Losartan Potassium', '12.5 mg + 100 mg', 'Tablet', 10),
(332, 'Silco Pharmaceuticlas Ltd.', 'Taspia', 'Tamsulosin Hydrochloride', '400 mcg', 'Capsule', 10),
(333, 'Asiatic Laboratories Ltd.', 'Ritoxib 90', 'Etoricoxib', '90 mg', 'Tablet', 12),
(334, 'The ACME Laboratories Ltd.', 'Cosium', 'Clobazam', '10 mg', 'Tablet', 3.52),
(335, 'Navana Pharmaceuticals Ltd.', 'Esotac 40', 'Esomeprazole', '40 mg', 'Capsule', 9),
(336, 'Zenith Pharmaceuticals Ltd.', 'Restovit-B', 'Nicotinamide + Pyridoxine Hydrochloride + Riboflavin + Vitamin B1', '20 mg + 2 mg + 2 mg + 5 mg', 'Capsule', 0.6),
(337, 'Gonoshasthaya Pharmaceuticals Ltd.', 'G Atropine', 'Atropine Sulphate', '.6 mg/ml', 'Injection', 5),
(338, 'Ibn Sina Pharmaceutical Ind. Ltd.', 'Gemitab 320', 'Gemefloxacin', '320 mg', 'Tablet', 35),
(339, 'Team Pharmaceuticals Ltd.', 'Tekast 10', 'Montelukast', '10 mg', 'Tablet', 14),
(340, 'Square Pharmaceuticals PLC, Gazipur', 'Alacot DS', 'Olopatadine', '.2 gm/100 ml', 'Eye Drops', 175),
(341, 'Orion Pharma Ltd.', 'Torped 1g', 'Cefotaxime', '1 gm/vial', 'IV_IM Injection', 130.88),
(342, 'Eskayef Pharmaceuticals Ltd., Tongi,Gazipur', 'Amboten', 'Ambroxol', '15 mg/5 ml', 'Syrup', 50),
(343, 'Advanced Chemical Industries Limited', 'Metform 500', 'Metformin Hydrochloride', '500 mg', 'Tablet', 4),
(344, 'Ibn Sina Pharmaceutical Ind. Ltd.', 'D-40000 Capsule', 'Cholecalciferol (Vit. D3)', '40000 IU', 'Capsule', 35),
(345, 'Leon Pharmaceuticals Ltd.', 'Visalex', 'Tiemonium Methylsulphate', '50 mg', 'Tablet', 5.01),
(346, 'Benham Pharmaceuticals Ltd.', 'Fluderm 150', 'Fluconazole', '150 mg', 'Tablet', 22),
(347, 'Opsonin Pharma Limited', 'Panoset 0.25 mg', 'Palonosetron', '.25 mg/vial', 'Injection', 100.3),
(348, 'Unimed Unihealth Pharmaceuticals Ltd.', 'Cilnical 10 mg', 'Cilnidipine', '10 mg', 'Tablet', 9),
(349, 'Popular Pharmaceuticals Ltd.', 'Patadin Max', 'Olopatadine', '700 mg/100 ml', 'Eye Drops', 240),
(350, 'Jenphar Bangladesh Ltd.', 'Eltrom 50', 'Eltrombopag', '50 mg', 'Tablet', 900),
(351, 'Healthcare Pharmaceuticals Ltd.', 'Paxel 100 mg', 'Paclitaxel', '100 mg/vial', 'Injection', 5330),
(352, 'Biogen Pharmaceuticals Ltd.', 'Cetrigen', 'Cetirizine Dihydrochloride', '10 mg', 'Tablet', 2.5),
(353, 'Square Pharmaceuticals PLC, Gazipur', 'Emjard 25', 'Empagliflozin', '25 mg', 'Tablet', 40),
(354, 'Mystic Pharmaceuticals Ltd.', 'SEMIGEL 40', 'Esomeprazole', '40 mg', 'Capsule', 9),
(355, 'Incepta Pharmaceuticals Ltd.', 'Purifen 300', 'Dexibuprofen (S Ibuprofen)', '300 mg', 'Tablet', 5),
(356, 'Chemist Laboratories Ltd.', 'Ticofen', 'Ketotifen', '1 mg/5 ml', 'Syrup', 60),
(357, 'Opso Saline Ltd.', 'Brinz T', 'Brinzolamide + Timolol', '1 gm + 500 mg/100 ml', 'Eye Drops', 550),
(358, 'Delta Pharma Limited', 'Azo 500', 'Azithromycin', '500 mg', 'Tablet', 30),
(359, 'Advanced Chemical Industries Limited', 'Permisol 5%', 'Permethrin', '5 gm/100 gm', 'Cream', 30.09),
(360, 'Popular Pharmaceuticals Ltd.', 'Bilastin 20', 'Bilastine', '20 mg', 'Tablet', 15),
(361, 'Pharmik Laboratories Ltd.', 'Beplex', 'Nicotinamide + Pyridoxine Hydrochloride + Riboflavin + Vitamin B1', '20 mg + 2 mg + 2 mg + 5 mg/5 ml', 'Syrup', 35),
(362, 'Royal Pharmaceuticals Ltd.', 'DOMERIN10', 'Domperidone', '10 mg', 'Tablet', 2.5),
(363, 'Team Pharmaceuticals Ltd.', 'Cefurav Plus PFS', 'Cefuroxime + Clavulanic Acid', '125 mg + 31.25 mg/5 ml', 'Powder For Suspension', 250),
(364, 'Drug International Ltd.', 'Tanox', 'Betacarotene + Vitamin C + Vitamin E', '6 mg + 200 mg + 50 mg', 'Soft Gelatin Capsule', 3.05),
(365, 'SMC Enterprise Limited', 'Prazomax 20', 'Omeprazole', '20 mg', 'Capsule', 4),
(366, 'The ACME Laboratories Ltd.', 'Famiclav 500', 'Cefuroxime + Clavulanic Acid', '500 mg + 125 mg', 'Tablet', 50),
(367, 'Sharif Pharmaceuticals Ltd.', 'Promezol 40', 'Omeprazole', '40 mg', 'Capsule', 8.03),
(368, 'Drug International Ltd., Squib Road', 'Demoxiclave 625', 'Amoxicillin + Clavulanic Acid', '500 mg + 125 mg', 'Tablet', 30),
(369, 'Nipa Pharmaceuticals Ltd.', 'Hypro 0.5%', 'Hypromellose', '.5 %', 'Eye Drops', 80),
(370, 'Rephco Pharmaceuticals Ltd.', 'Inoxon IM 250 mg', 'Ceftriaxone', '250 mg', 'IM Injection', 90),
(371, 'Unimed Unihealth Pharmaceuticals Ltd.', 'Xenoderm', 'Clobetasol Propionate + Neomycin Sulphate + Nystatin', '50 mg + 500 mg + 100 Lac IU/100 gm', 'Cream', 150),
(372, 'Incepta Pharmaceuticals Ltd.', 'Esipram 5', 'Escitalopram', '5 mg', 'Tablet', 5.5),
(373, 'Opsonin Pharma Limited', 'Keviclean', 'Chlorhexidine Gluconate', '4 gm/100 ml', 'Solution', 300),
(374, 'Opsonin Pharma Limited', 'Larb 50', 'Losartan Potassium', '50 mg', 'Tablet', 10),
(375, 'Advanced Chemical Industries Limited', 'Motoral 20', 'Leflunomide', '20 mg', 'Tablet', 5.04),
(376, 'Eskayef Pharmaceuticals Ltd., Tongi,Gazipur', 'Cortider', 'Hydrocortisone', '1 gm/100 gm', 'Cream', 35),
(377, 'Opsonin Pharma Limited', 'Pulmolin', 'Salbutamol', '2 mg/5 ml', 'Syrup', 10.49),
(378, 'Ibn Sina Pharmaceutical Ind. Ltd.', 'Esolok 40', 'Esomeprazole', '40 mg', 'Tablet', 8),
(379, 'Square Pharmaceuticals PLC, Pabna', 'Iracet 500', 'Levetiracetam', '500 mg', 'Tablet', 30),
(380, 'Ibn Sina Pharmaceutical Ind. Ltd.', 'Ribosina', 'Riboflavin', '5 mg', 'Tablet', 0.3),
(381, 'Zenith Pharmaceuticals Ltd.', 'Naproxen Plus', 'Esomeprazole + Naproxen', '20 mg + 375 mg', 'Tablet', 8),
(382, 'Beximco Pharmaceuticals Ltd.', 'Tranexil', 'Tranexamic Acid', '500 mg/5 ml', 'Injection', 50),
(383, 'Albion Laboratories Ltd.', 'Clozapin 100', 'Clozapine', '100 mg', 'Tablet', 9.55),
(384, 'Apollo Pharmaceutical Laboratories Ltd.', 'A Plex', 'Nicotinamide + Pyridoxine Hydrochloride + Riboflavin + Vitamin B1', '20 mg + 2 mg + 2 mg + 5 mg/5 ml', 'Syrup', 30.5),
(385, 'Jayson Pharmaceuticals Ltd.', 'Meliva 10', 'Escitalopram', '10 mg', 'Tablet', 8.06),
(386, 'Advanced Chemical Industries Limited', 'Abaclor', 'Cefaclor', '125 mg/1.25 ml', 'Paediatric Drops', 125.85),
(387, 'Gonoshasthaya Pharmaceuticals Ltd.', 'G Pefloxacin', 'Pefloxacin', '400 mg', 'Tablet', 5),
(388, 'General Pharmaceuticals Ltd, Unit-2', 'Toroaid 30 IV/IM', 'Ketorolac Tromethamine', '30 mg/ml', 'Injection', 55.17),
(389, 'Monicopharma Limited', 'Orextil 500', 'Cefuroxime', '500 mg', 'Tablet', 25),
(390, 'Jayson Pharmaceuticals Ltd.', 'Jasotrim', 'Sulphamethoxazole + Trimethoprim', '200 mg + 40 mg/5 ml', 'Suspension', 21.68),
(391, 'Alco Pharma Limited', 'Esopra 40', 'Esomeprazole', '40 mg', 'Capsule', 9.03),
(392, 'Labaid Pharmaceuticals Ltd.', 'Ceftriaid 500 IV', 'Ceftriaxone', '500 mg', 'IV Injection', 200),
(393, 'Doctor\'s Chemicals Works Ltd.', 'Doctrim', 'Sulphamethoxazole + Trimethoprim', '800 mg + 160 mg', 'Tablet', 1.74),
(394, 'Square Pharmaceuticals PLC, Pabna', 'Clofenac DT 50', 'Diclofenac Sodium', '50 mg', 'Tablet', 3.01),
(395, 'Nipa Pharmaceuticals Ltd.', 'Ketolac', 'Ketorolac Tromethamine', '10 mg', 'Tablet', 10),
(396, 'Drug International Ltd.', 'T Cef 400', 'Cefixime', '400 mg', 'Capsule', 50.2),
(397, 'Beacon Pharmaceuticals PLC', 'Rifax', 'Rifaximin', '200 mg', 'Tablet', 20),
(398, 'Square Pharmaceuticals PLC, Gazipur', 'Loracef', 'Cefaclor', '125 mg/1.25 ml', 'Paediatric Drops', 135),
(399, 'Novatek Pharmaceuticals Ltd.', 'Biscard 2.5', 'Bisoprolol Hemifumarate', '2.5 mg', 'Tablet', 6),
(400, 'The White Horse Pharmaceuticals Ltd.', 'Spinolex', 'Baclofen', '10 mg', 'Tablet', 8),
(401, 'G. A. Company Ltd.', 'Magadrox PLUS', 'Aluminium Oxide + Magnesium Hydroxide + Simethicone', '200 mg + 400 mg + 30 mg/5 ml', 'Suspension', 75.23),
(402, 'Gonoshasthaya Pharmaceuticals Ltd.', 'G-Lomustin', 'Lomustine', '10 mg', 'Capsule', 70),
(403, 'Benham Pharmaceuticals Ltd.', 'Kof-free', 'Diphenhydramine Hydrochloride + Guaiphenesin + Levomenthol', '280 mg + 2000 mg + 22 mg/100 ml', 'Syrup', 85),
(404, 'Kemiko Pharmaceuticals Ltd.', 'Anet', 'Domperidone', '10 mg', 'Tablet', 2.3),
(405, 'Healthcare Pharmaceuticals Ltd.', 'Survec 10 mg', 'Vecuronium Bromide', '10 mg/ml', 'Injection', 350),
(406, 'Leon Pharmaceuticals Ltd.', 'Clavuxet', 'Cefuroxime + Clavulanic Acid', '250 mg + 62.5 mg', 'Tablet', 30.09),
(407, 'Everest Pharmaceuticals Ltd.', 'Candifast SB', 'Itraconazole', '65 mg', 'Capsule', 20),
(408, 'Apex Pharma Ltd.', 'Eflam 60', 'Etoricoxib', '60 mg', 'Tablet', 7),
(409, 'Advanced Chemical Industries Limited', 'Palimax ER 3', 'Paliperidone', '3 mg', 'Er Tablet', 7),
(410, 'Team Pharmaceuticals Ltd.', 'Apidone', 'Domperidone', '10 mg', 'Tablet', 2.5),
(411, 'Healthcare Pharmaceuticals Ltd.', 'Ferisen Inj. 500 mg/10 ml', 'Ferric Carboxymaltose', '500 mg/10 ml', 'Injection', 710),
(412, 'Ibn Sina Pharmaceutical Ind. Ltd.', 'Ipical 500', 'Calcium Carbonate', '1250 mg', 'Tablet', 3.5),
(413, 'Square Pharmaceuticals PLC, Pabna', 'Phylopen DS 500', 'Flucloxacillin', '500 mg', 'Capsule', 10.57),
(414, 'Beacon Pharmaceuticals PLC', 'Xvit', 'Ascorbic Acid + Elemental Iron + Folic Acid + Nicotinamide + Pyridoxine Hydrochloride + Riboflavin + Vitamin B1 + ', '50 mg + 47 mg + 500 mcg + 10 mg + 1 mg + 2 mg + 2 mg + 22.5 ', 'Capsule', 3.51),
(415, 'Advanced Chemical Industries Limited', 'Glitin', 'Linagliptin', '5 mg', 'Tablet', 20),
(416, 'Beacon Pharmaceuticals PLC', 'Cetuxim', 'Cetuximab', '100 mg/20 ml', 'Injection', 25000),
(417, 'Advanced Chemical Industries Limited', 'Dormilat', 'Midazolam', '15 mg', 'Tablet', 15.05),
(418, 'Square Formulations Ltd.', 'Tory 60', 'Etoricoxib', '60 mg', 'Tablet', 7.04),
(419, 'Aristopharma Limited', 'Aristomox 250', 'Amoxicillin', '250 mg', 'Capsule', 3.5),
(420, 'Doctor\'s Chemicals Works Ltd.', 'Distamin', 'Chlorpheniramine Maleate', '2 mg/5 ml', 'Syrup', 21.78),
(421, 'The ACME Laboratories Ltd.', 'Rhitin', 'Ebastine', '10 mg', 'Tablet', 6),
(422, 'Ibn Sina Pharmaceutical Ind. Ltd.', 'Patalon 0.1%', 'Olopatadine', '1 mg/ml', 'Eye Drops', 110),
(423, 'Veritas Pharmaceuticals Ltd.', 'Veridipin 10', 'Amlodipine', '10 mg', 'Tablet', 7.02),
(424, 'Sun Pharmaceutical (Bangladesh) Ltd.', 'Repace 25', 'Losartan Potassium', '25 mg', 'Tablet', 4.51),
(425, 'Nipa Pharmaceuticals Ltd.', 'Fexlor 180', 'Fexofenadine Hydrochloride', '180 mg', 'Tablet', 9),
(426, 'Popular Pharmaceuticals Ltd.', 'Vitafol', 'Adenosine + Cytochrome C + Nicotinamide + Sodium Succinate', '200 mg + 50 mg + 1 gm + 60 mg/100 ml', 'Eye Drops', 125),
(427, 'Mystic Pharmaceuticals Ltd.', 'Foliron TR', 'Ferrous Sulphate + Folic Acid + Zinc', '150 mg + 500 mcg + 22.5 mg', 'Capsule', 3),
(428, 'Synovia Pharma PLC.', 'Largactil 100', 'Chlorpromazine Hydrochloride', '100 mg', 'Tablet', 1.01),
(429, 'Healthcare Pharmaceuticals Ltd.', 'Zeropain', 'Ketorolac Tromethamine', '30 mg/ml', 'Injection', 60),
(430, 'Drug International Ltd.', 'Foly', 'Folinic Acid', '15 mg', 'Tablet', 25),
(431, 'Healthcare Pharmaceuticals Ltd.', 'Pregel', 'Pantoprazole', '20 mg', 'Tablet', 5),
(432, 'Techno Drugs Ltd., Gazipur', 'Rapiclav 250', 'Cefuroxime + Clavulanic Acid', '250 mg + 62.5 mg', 'Tablet', 30),
(433, 'The ACME Laboratories Ltd.', 'Ascon Inhalation Aer', 'Beclomethasone Dipropionate', '100 mcg', 'Inhalation Solution', 270.81),
(434, 'Orion Pharma Ltd.', 'Frulac 20/50', 'Frusemide + Spironolactone', '20 mg + 50 mg', 'Tablet', 9),
(435, 'Aristopharma Limited', 'Stafoxin 250', 'Flucloxacillin', '250 mg', 'Capsule', 5.5),
(436, 'Edruc Ltd.', 'Greatnap', 'Esomeprazole + Naproxen', '20 mg + 500 mg', 'Tablet', 10),
(437, 'Drug International Ltd.', 'Nasochrom', 'Sodium Cromoglycate', '20 mg/ml', 'Eye & Nasal Drops', 60.2),
(438, 'Drug International Ltd.', 'Ursolic', 'Ursodeoxycholic Acid', '250 mg/5 ml', 'Suspension', 150),
(439, 'Beximco Pharmaceuticals Ltd.', 'Hepagurd', 'L-Ornithine L-Aspartate', '3 gm', 'Granules For Suspensi', 75),
(440, 'Advanced Chemical Industries Limited', 'Dermasim', 'Clotrimazole', '10 mg/gm', 'Solution', 68.2),
(441, 'Jenphar Bangladesh Ltd.', 'Lubicon 8', 'Lubiprostone', '8 mcg', 'Capsule', 15),
(442, 'Incepta Pharmaceuticals Ltd.', 'Gatiflox', 'Gatifloxacin', '.3 gm/100 ml', 'Eye Drops', 100),
(443, 'Globe Pharmaceuticals Ltd.', 'Roket 30 mg', 'Ketorolac Tromethamine', '30 mg/ml', 'Injection', 55),
(444, 'Ad-din Pharmaceuticals Ltd.', 'Vinzam', 'Azithromycin', '500 mg', 'Tablet', 30),
(445, 'The ACME Laboratories Ltd.', 'Defrol 20000', 'Cholecalciferol (Vit. D3)', '20000 IU', 'Capsule', 20),
(446, 'Millat Pharmaceuticals Ltd.', 'Edin', 'Cephradine', '125 mg/1.25 ml', 'Paediatric Drops', 55),
(447, 'Incepta Pharmaceuticals Ltd.', 'Lacidip 2', 'Lacidipine', '2 mg', 'Tablet', 4),
(448, 'Globe Pharmaceuticals Ltd.', 'Serotal 10', 'Escitalopram', '10 mg', 'Tablet', 10),
(449, 'The ACME Laboratories Ltd.', 'Fix-A Paediatric Drops', 'Cefixime', '2.5 gm/100 ml', 'Paediatric Drops', 100.3),
(450, 'The ACME Laboratories Ltd.', 'Thenglate', 'Theophylline', '120 mg/5 ml', 'Syrup', 31.04),
(451, 'Drug International Ltd.', 'Olmetic Plus', 'Hydrochlorothiazide + Olmesartan Medoxomil', '12.5 mg + 20 mg', 'Tablet', 8.05),
(452, 'Jayson Pharmaceuticals Ltd.', 'Amoxon', 'Amoxicillin', '125 mg/5 ml', 'Powder For Suspension', 47.6),
(453, 'Advanced Chemical Industries Limited', 'Revital Syrup', 'Ascorbic Acid + Biotin + Calcium + Choline Bitartrate + Chromium + Cyanocobalamin + Inositol + Iodine + Magnesium ', '1350 mg + 650 mcg + 550 mg + 200 mg + 70 mcg + 60 mcg + 200 ', 'Syrup', 175),
(454, 'Chemist Laboratories Ltd.', 'Riboflavine', 'Riboflavin', '5 mg', 'Tablet', 0.2),
(455, 'Albion Laboratories Ltd.', 'Rislock-4', 'Risperidone', '4 mg', 'Tablet', 9),
(456, 'Beacon Pharmaceuticals PLC', 'Amlozep 5/10', 'Amlodipine + Benazepril Hydrochloride', '5 mg + 10 mg', 'Capsule', 6.04),
(457, 'Square Pharmaceuticals PLC, Pabna', 'Afun VT 200', 'Clotrimazole', '200 mg', 'Vaginal Tablet', 20.06),
(458, 'Square Pharmaceuticals PLC, Gazipur', 'Seroprex 25', 'Quetiapine', '25 mg', 'Tablet', 3),
(459, 'Hudson Pharmaceuticals Ltd.', 'Floxason 250', 'Flucloxacillin', '250 mg', 'Capsule', 5),
(460, 'Opsonin Pharma Limited', 'Klabex', 'Clarithromycin', '250 mg/5 ml', 'Powder For Suspension', 302.04),
(461, 'Square Pharmaceuticals PLC, Pabna', 'Ofran', 'Ondansetron', '4 mg/5 ml', 'Syrup', 45),
(462, 'Techno Drugs Ltd., Gazipur', 'Cefixon 1 gm IV', 'Ceftriaxone', '1 gm', 'IV Injection', 200),
(463, 'Pharmik Laboratories Ltd.', 'Gaxoma', 'Boric Acid + Dithranol + Salicylic Acid', '2 gm + 100 mg + 1 gm/100 gm', 'Ointment', 25),
(464, 'Veritas Pharmaceuticals Ltd.', 'Ceftrimax 250 mg', 'Ceftriaxone', '250 mg', 'IV Injection', 100.3),
(465, 'Beximco Pharmaceuticals Ltd.', 'Jardimet 5/500', 'Empagliflozin + Metformin Hydrochloride', '5 mg + 500 mg', 'Tablet', 20),
(466, 'Orion Pharma Ltd.', 'Baclon', 'Baclofen', '100 mg/100 ml', 'Syrup', 130),
(467, 'EDCL (Dhaka)', 'Pethidine 50', 'Pethidine Hydrochloride', '50 mg/ml', 'Injection', 13.8),
(468, 'Silco Pharmaceuticlas Ltd.', 'Fexsil 120', 'Fexofenadine Hydrochloride', '120 mg', 'Tablet', 7),
(469, 'Beximco Pharmaceuticals Ltd.', 'Voligel Gel', 'Diclofenac Sodium', '1 gm/100 gm', 'Emulgel', 80),
(470, 'Square Pharmaceuticals PLC, Pabna', 'Moxaclav 375', 'Amoxicillin + Clavulanic Acid', '250 mg + 125 mg', 'Tablet', 20.06),
(471, 'The ACME Laboratories Ltd.', 'Dclot 75', 'Clopidogrel', '75 mg', 'Tablet', 12),
(472, 'Eskayef Pharmaceuticals Ltd., Tongi,Gazipur', 'FAVIPIR', 'Favipiravir', '200 mg', 'Tablet', 400),
(473, 'Asiatic Laboratories Ltd.', 'Lerex', 'Levocetirizine Hydrochloride', '5 mg', 'Tablet', 2),
(474, 'Beximco Pharmaceuticals Ltd.', 'Etrocin 500', 'Erythromycin', '500 mg', 'Tablet', 9.03),
(475, 'Nipa Pharmaceuticals Ltd.', 'Dial 60', 'Diltiazem Hydrochloride', '60 mg', 'Tablet', 3.8),
(476, 'Incepta Pharmaceuticals Ltd.', 'Litizem 30', 'Diltiazem Hydrochloride', '30 mg', 'Tablet', 2),
(477, 'Apex Pharma Ltd.', 'Bilaxe', 'Bilastine', '20 mg', 'Tablet', 15),
(478, 'G. A. Company Ltd.', 'Methovate N', 'Betamethasone + Neomycin Sulphate', '100 mg + 500 mg/100 gm', 'Cream', 15.39),
(479, 'Aristopharma Limited', 'Apuldon 15', 'Domperidone', '15 mg', 'Suppository', 6),
(480, 'Orion Pharma Ltd.', 'Orioplex M', 'Ascorbic Acid + Calcium Pantothenate + Cupric Sulphate + Cyanocobalamin + Ferrous Sulphate + Folic Acid + Manganes', '60 mg + 10.92 mg + 2 mg + 6 mcg + 50 mg + 400 mcg + 1 mg + 2', 'Tablet', 1.81),
(481, 'Concord Pharmaceuticals Ltd.', 'Pyrex Plus', 'Caffeine + Paracetamol', '65 mg + 500 mg', 'Tablet', 1.81),
(482, 'Silva Pharmaceuticals Ltd.', 'Ambosil', 'Ambroxol', '6 mg/ml', 'Paediatric Drops', 20.07),
(483, 'Opsonin Pharma Limited', 'Levox TS 1.5%', 'Levofloxacin', '15 mg/ml', 'Eye Drops', 130.39),
(484, 'MST Pharma and Healthcare Ltd.', 'Sypron 500', 'Ciprofloxacin', '500 mg', 'Tablet', 14.42),
(485, 'Healthcare Pharmaceuticals Ltd.', 'Mirez 30 mg', 'Mirtazapine', '30 mg', 'Tablet', 15),
(486, 'Unimed Unihealth Pharmaceuticals Ltd.', 'MSL 10mg/5 ml', 'Morphine Sulphate', '10 mg/5 ml', 'Oral Solution', 80),
(487, 'Chemist Laboratories Ltd.', 'Cefuxet Plus', 'Cefuroxime + Clavulanic Acid', '500 mg + 125 mg', 'Tablet', 60);
INSERT INTO `product_info` (`productID`, `Manufacturer`, `BrandName`, `GenericName`, `Strength`, `Description`, `Price`) VALUES
(488, 'Renata Limited', 'Ostan 25', 'Losartan Potassium', '25 mg', 'Tablet', 5.5),
(489, 'Square Pharmaceuticals PLC, Pabna', 'Bisocor Plus 5/6.25', 'Bisoprolol Hemifumarate + Hydrochlorothiazide', '5 mg + 6.25 mg', 'Tablet', 10.03),
(490, 'Advanced Chemical Industries Limited', 'Memopil', 'Piracetam', '200 mg/ml', 'Injection', 75.51),
(491, 'Ibn Sina Pharmaceutical Ind. Ltd.', 'Natazol Paediatric Nasal Dr', 'Oxymetazoline Hydrochloride', '.025 %', 'Nasal Drops', 40),
(492, 'General Pharmaceuticals Ltd, Unit-2', 'Telukast 4', 'Montelukast', '4 mg', 'Chewable Tablet', 7),
(493, 'Incepta Pharmaceuticals Ltd. (Dhamrai Unit)', 'Ninacent 100', 'Nintedanib', '100 mg', 'Capsule', 235),
(494, 'Square Pharmaceuticals PLC, Pabna', 'Neurolep', 'Piracetam', '500 mg/5 ml', 'Syrup', 151.02),
(495, 'Concord Pharmaceuticals Ltd.', 'Erectus 20', 'Tadalafil', '20 mg', 'Tablet', 55),
(496, 'Somatec Pharmaceuticals Ltd.', 'Rabeprol 20', 'Rabeprazole Sodium', '20 mg', 'Tablet', 5),
(497, 'Orion Infusion Ltd.', 'Dextrosal BABY', 'Dextrose + Sodium Chloride', '5 gm + 225 mg/100 ml', 'IV Infusion', 89.52),
(498, 'Doctor\'s Chemicals Works Ltd.', 'Metfen 850', 'Metformin Hydrochloride', '850 mg', 'Tablet', 5),
(499, 'Drug International Ltd., Gopalpur', 'Diretic-DS', 'Frusemide + Spironolactone', '40 mg + 50 mg', 'Tablet', 10),
(500, 'Mystic Pharmaceuticals Ltd.', 'Age M', 'Betacarotene + Vitamin C + Vitamin E', '6 mg + 200 mg + 50 mg', 'Tablet', 2.53);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserID`, `Username`, `Email`, `Address`, `PhoneNumber`) VALUES
(1, 'Mushfique Abdullah Rafi 2031435642', 'mushfique.rafi@northsouth.edu', 'p homezz', '+8802222333'),
(2, 'Alif Abdullah Siam', 'alifabdullahsiam@gmail.com', 'ghjngfhlw', '+880678568657'),
(3, 'Shawn Ripper', 'steamboy1501@gmail.com', 'Heda', '+88019191191919'),
(4, 'Wakib Jahan Galib', 'xahangalib19@gmail.com', 'Tongi, Gazipur, Dhaka', '+8801648375548');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`CartID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`HistoryID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_info`
--
ALTER TABLE `product_info`
  ADD PRIMARY KEY (`productID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `CartID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=179;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `HistoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `product_info`
--
ALTER TABLE `product_info`
  MODIFY `productID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=501;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product_info` (`productID`);

--
-- Constraints for table `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  ADD CONSTRAINT `history_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product_info` (`productID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

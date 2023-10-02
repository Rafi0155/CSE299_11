-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 02, 2023 at 08:46 PM
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
(75, 2, 1, 1),
(137, 1, 14, 2);

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
(113, 1, 1, 1, '2023-10-02 18:32:34'),
(114, 1, 2, 1, '2023-10-02 18:32:34'),
(115, 1, 3, 1, '2023-10-02 18:32:34'),
(116, 1, 12, 5, '2023-10-02 18:36:11');

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
(100, 'Incepta Pharmaceuticals Ltd.', 'Emixef', 'Cefixime', '100 mg/5 ml', 'Powder For Suspension', 210);

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
(1, 'Mushfique Abdullah Rafi 2031435642', 'mushfique.rafi@northsouth.edu', 'x home', '+880999111'),
(2, 'Alif Abdullah Siam', 'alifabdullahsiam@gmail.com', 'ghjngfh', '+880678568657');

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
  MODIFY `CartID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `HistoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `product_info`
--
ALTER TABLE `product_info`
  MODIFY `productID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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

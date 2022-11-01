-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 02, 2022 at 12:15 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `patient_appointment`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@live.com', NULL, '$2y$10$gU9IpQ9.kC7nvE/n6bAgreJkL1YeX2c9isI6ivmQfvQwv0wJB4Y3G', NULL, '2022-11-01 17:03:47', '2022-11-01 17:03:47');

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` int(11) NOT NULL,
  `auth_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `appointment_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `patient_id`, `auth_id`, `service_id`, `appointment_date`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2022-11-17', 'pending', '2022-11-01 17:05:24', '2022-11-01 17:05:24');

-- --------------------------------------------------------

--
-- Table structure for table `auths`
--

CREATE TABLE `auths` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `auth_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auth_info` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `patient_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `auths`
--

INSERT INTO `auths` (`id`, `auth_name`, `auth_info`, `patient_id`, `created_at`, `updated_at`) VALUES
(1, 'auth 1', 'auth one test', 1, '2022-11-01 17:04:44', '2022-11-01 17:04:44');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(17, '2014_10_12_000000_create_users_table', 1),
(18, '2014_10_12_100000_create_password_resets_table', 1),
(19, '2019_08_19_000000_create_failed_jobs_table', 1),
(20, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(21, '2022_11_01_154245_create_super_admins_table', 1),
(22, '2022_11_01_154334_create_admins_table', 1),
(23, '2022_11_01_154357_create_providers_table', 1),
(24, '2022_11_01_175853_create_patients_table', 1),
(25, '2022_11_01_175953_create_auths_table', 1),
(26, '2022_11_01_180016_create_services_table', 1),
(27, '2022_11_01_195617_create_appointments_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `disease` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `patient_name`, `address`, `phone`, `disease`, `created_at`, `updated_at`) VALUES
(1, 'Prof. Jadyn Ullrich', '690 Cristobal Club\nVolkmanchester, IA 87493', '502-805-8923', 'Fugiat occaecati aut minima assumenda pariatur.', NULL, NULL),
(2, 'Mrs. Kattie Schamberger IV', '38593 Marilyne Green\nSouth Rylan, SC 76772-4612', '208.567.2793', 'Illo enim officia voluptate est dolorem omnis autem.', NULL, NULL),
(3, 'Dr. Shanel Lynch', '405 Monroe Via\nFerneton, HI 94000-1920', '+14796207848', 'Quasi ut repellendus ut cum laborum.', NULL, NULL),
(4, 'Miss Karina Crist DDS', '8956 Frederik Crest\nNew Neoma, TN 69109', '(646) 248-5496', 'Quis voluptatem accusantium doloribus atque delectus ut.', NULL, NULL),
(5, 'Prof. Arnulfo Boehm', '92194 Ruth Vista\nAureliochester, OH 70502', '1-773-291-6394', 'Dicta illum atque occaecati porro placeat.', NULL, NULL),
(6, 'Prof. Lavon Treutel II', '537 Kiehn Canyon\nGusikowskifurt, AL 55927', '585-594-2614', 'Omnis consequatur sunt perferendis nihil.', NULL, NULL),
(7, 'Dr. Verlie Moen', '655 Kuvalis Lane\nBrownmouth, OR 81686', '989-872-0037', 'Consequatur consectetur laboriosam sit omnis perspiciatis quia quidem.', NULL, NULL),
(8, 'Mr. Thurman Gulgowski Jr.', '9678 Esther Views Suite 032\nIzabellaview, AK 26633-5881', '1-970-218-3942', 'Et quaerat vitae in rerum.', NULL, NULL),
(9, 'Winfield Lemke', '746 Frami Roads Suite 142\nLeannaburgh, TN 43853-4852', '+1.743.602.0654', 'At voluptas ut dolorum accusantium.', NULL, NULL),
(10, 'Florian Russel', '5188 Emelia Keys Suite 120\nWest Johan, MS 61881', '+1.575.454.5481', 'Accusamus ullam repellendus numquam harum.', NULL, NULL),
(11, 'Prof. Eleanore Johnston Sr.', '124 Bernhard Villages Suite 486\nLake Audieton, FL 43303-4903', '(817) 820-4641', 'Quia quasi sunt quia repellendus et et deleniti.', NULL, NULL),
(12, 'Mrs. Madalyn Fisher Jr.', '23954 Homenick Drives\nNew Jeffery, HI 18527', '+1-520-364-3669', 'Officia exercitationem et rerum eum consectetur eius.', NULL, NULL),
(13, 'Anastasia Schowalter', '95536 Electa Plains\nFramiberg, MA 20367', '+19413012657', 'Dignissimos voluptas omnis quis ut quos beatae.', NULL, NULL),
(14, 'Gay Okuneva', '3975 Feest Roads\nPagacton, MN 28660', '+1-828-218-3908', 'Magni impedit omnis ea dolor distinctio consequuntur aperiam.', NULL, NULL),
(15, 'Carmine Orn', '5677 Gladys Branch Suite 321\nWest Ciara, WA 85896-9997', '+1-248-840-8290', 'Eligendi doloremque ut dolores magnam assumenda inventore.', NULL, NULL),
(16, 'Dr. Hayley Kulas II', '751 Kunde Corner\nHellerstad, NE 71562', '(607) 261-8501', 'Corporis quia debitis et voluptatem sed cum modi.', NULL, NULL),
(17, 'Jaqueline Sipes', '6518 Adams Mission\nNew Vinceport, KY 14796', '(463) 316-7021', 'Enim et aut officiis maxime consequatur dolores natus sint.', NULL, NULL),
(18, 'Sedrick Kozey', '54405 Trantow Circles Apt. 826\nLeliamouth, CT 83197-9042', '678-501-9998', 'Ut aliquam aut quis laboriosam exercitationem.', NULL, NULL),
(19, 'Weston Osinski', '24277 Sallie Highway Apt. 092\nSouth Bartland, NE 13040-3950', '828.823.1564', 'Ut maiores et fugit quas.', NULL, NULL),
(20, 'Clement Barton', '4625 Brandy Lakes Suite 911\nLake Drakefort, NC 57608-0312', '386-532-9220', 'Rerum similique illo animi tempore quia dignissimos corporis.', NULL, NULL),
(21, 'Dimitri Dooley III', '4088 Earnest Gardens\nEast Aaliyahstad, FL 39979', '+19549694725', 'Optio odio nobis sint praesentium laboriosam necessitatibus sed.', NULL, NULL),
(22, 'Maribel Stracke', '895 Dario Mountains Suite 111\nLake Destiny, AR 65275', '+1.681.647.5007', 'Dolores et placeat fugit dolor itaque quis et recusandae.', NULL, NULL),
(23, 'Mozell Ruecker', '801 Emmerich Orchard Apt. 746\nPort Genefurt, ID 32271-6269', '551.877.5543', 'Rerum exercitationem aut veritatis quis voluptatem qui aut.', NULL, NULL),
(24, 'Alexandria Mueller', '862 Lavon Junction Apt. 363\nNew Elza, NE 98351-3980', '347.324.1510', 'Hic adipisci aut qui itaque iure tempora.', NULL, NULL),
(25, 'Lennie Cole', '4989 Raynor Land\nAudreannebury, AL 99744', '+19163146621', 'Nostrum provident sapiente laboriosam consectetur velit dolorem hic doloremque.', NULL, NULL),
(26, 'Ms. Brionna Heller', '990 Sawayn Mission\nNew Anabel, MS 70272-8220', '+1-252-457-4178', 'Est odit ut ab ratione.', NULL, NULL),
(27, 'Stacy Zulauf', '68926 Larkin Glen Apt. 627\nNew Izabella, AK 92517-4095', '+1-256-789-4969', 'Consequatur ut delectus facere sit soluta voluptatem fuga.', NULL, NULL),
(28, 'Alexandro Kertzmann', '89468 Concepcion Fort\nPort Chanel, MD 61828-4594', '414.393.6041', 'Vel dolores quisquam vero velit enim.', NULL, NULL),
(29, 'Ms. Lenora Mosciski', '6691 McKenzie Manor Suite 473\nVivienview, KY 10199', '+1-270-883-3514', 'Sequi aspernatur sit nihil veritatis.', NULL, NULL),
(30, 'Kenny Torphy', '1651 Twila Lock Apt. 983\nWest Ignatiusmouth, OR 47947', '650.674.4814', 'Ut natus eius corporis ex ea officia voluptatem.', NULL, NULL),
(31, 'Hortense Armstrong DDS', '5175 Armstrong Mission\nJohnsonfort, WY 98363-3469', '(346) 598-4940', 'Impedit quasi et aut suscipit.', NULL, NULL),
(32, 'Aurore Bartoletti', '223 Clement Lakes Apt. 951\nDeanchester, NC 31460', '754.513.3845', 'Sit cum consequatur aliquam maiores sint.', NULL, NULL),
(33, 'Claudine Wisoky', '75903 Agustin Squares Suite 619\nWest Malinda, KS 12363', '1-720-974-2782', 'Quo modi aut debitis non beatae.', NULL, NULL),
(34, 'Breanna Mitchell', '7328 Rowe Radial\nPort Brenden, MS 69630-3199', '(872) 744-5924', 'Doloremque corrupti saepe et.', NULL, NULL),
(35, 'Hoyt Roberts', '61125 Hegmann Expressway\nJuvenalbury, IN 80513', '+1 (206) 832-3152', 'Autem saepe consectetur in consequatur autem et ut.', NULL, NULL),
(36, 'Kamron Collins', '1322 Dorcas Station Apt. 137\nHesselmouth, IA 89693-6019', '445.330.2091', 'Hic veritatis accusamus enim et doloribus repellendus impedit.', NULL, NULL),
(37, 'Cyrus McLaughlin Sr.', '123 Haley Branch Apt. 221\nEast Baileestad, NY 23416', '+1.870.947.9234', 'Aliquam sunt harum qui.', NULL, NULL),
(38, 'Jacky Hintz', '57726 Ullrich Shores Suite 595\nAllisonshire, KS 59275', '757.752.4211', 'Nihil repudiandae eum dolore non.', NULL, NULL),
(39, 'Vada Bergnaum V', '748 Walker Vista Apt. 810\nWest Jenashire, KS 41536', '(562) 513-9112', 'Fugit earum et perferendis officiis.', NULL, NULL),
(40, 'Marguerite Koch', '6038 Eichmann Ridges Apt. 934\nEast Pasquale, MN 56119', '+19714669549', 'Sed labore sequi voluptas officia.', NULL, NULL),
(41, 'Golden Heidenreich', '55948 Jon Junction\nSanfordfort, NM 98826', '1-838-903-3642', 'Omnis ea ut similique incidunt debitis.', NULL, NULL),
(42, 'Dr. Frederick Ondricka', '28442 Faye Ville\nSouth Glendahaven, KY 61715', '930.731.2748', 'Est eos accusantium eius tempore.', NULL, NULL),
(43, 'Prof. Cayla Trantow MD', '326 Waylon Rue\nEast Justenstad, KS 63728-9408', '+1-619-605-4934', 'Rem iure modi distinctio facilis iste atque a adipisci.', NULL, NULL),
(44, 'Katrine Pollich', '6890 Auer Wall Suite 393\nJadynshire, ID 01175-9598', '+1.445.429.1322', 'Odit eius ea explicabo et maiores.', NULL, NULL),
(45, 'Torrey Abbott', '43488 Mallie Square Apt. 238\nOkunevaville, IA 68069', '1-737-992-1006', 'Est quibusdam ex sit rerum.', NULL, NULL),
(46, 'Karianne Gusikowski', '196 Anjali Hills Suite 207\nPfannerstillborough, MT 42959-2319', '463.457.7155', 'Consequatur dolor exercitationem excepturi iste quis totam est.', NULL, NULL),
(47, 'Julia Kuhlman', '3777 Zula Parkways\nDarienberg, PA 86960-1997', '540-338-4482', 'Tenetur tempora repellat et.', NULL, NULL),
(48, 'Dr. Jamel Conn', '1050 Ledner Manor Apt. 798\nNew Allene, TN 37206', '+1-847-324-8970', 'Voluptates et molestiae sint magnam placeat.', NULL, NULL),
(49, 'Maynard Kutch', '6510 Fahey Hills\nPacochamouth, MO 94860', '986-813-7354', 'Voluptas rerum non rerum.', NULL, NULL),
(50, 'Prof. Alfonso Wyman PhD', '88254 Kameron Green\nWaelchifort, MT 36300-6706', '(805) 424-1688', 'Dolor aperiam laboriosam soluta natus et quibusdam eius.', NULL, NULL),
(51, 'Dr. Bonita Lowe II', '8073 Rodriguez Cape Apt. 110\nRandifurt, DC 29607', '(832) 465-9648', 'Tempora iusto non omnis sit.', NULL, NULL),
(52, 'Noemy Fisher', '40183 Maude Freeway Suite 078\nEast Nicole, NM 80843', '+15743796007', 'Vero tenetur voluptas soluta aperiam maxime omnis et quia.', NULL, NULL),
(53, 'Prof. Brando Von I', '44326 Luis Club\nEast Ethelynmouth, MI 03614', '+1-520-894-6974', 'Non nulla voluptatem qui.', NULL, NULL),
(54, 'Evelyn Block', '19244 Pouros Oval Apt. 918\nGrantport, OR 74283', '+19733623733', 'Totam earum facere sint in aut eos ut.', NULL, NULL),
(55, 'Karley Gusikowski', '694 Andy Club\nAshleighberg, SD 25921', '+12252915626', 'Dolore itaque explicabo labore doloremque illo molestiae a.', NULL, NULL),
(56, 'Genoveva O\'Hara DDS', '72814 Rashad Islands\nPort Bulahbury, AK 61097', '+1-716-838-0929', 'Est repellat dolorem dolore nisi et.', NULL, NULL),
(57, 'Ms. Simone Hyatt I', '7829 Hickle Burg\nEast Nicolas, MI 92655', '1-458-326-9270', 'Quidem quasi excepturi earum.', NULL, NULL),
(58, 'Miss Mariana Nader DVM', '3317 Brenna Pines\nNew Micaelabury, HI 35565', '+1-830-735-0573', 'Dolor et maxime voluptatem vel.', NULL, NULL),
(59, 'Miss Anika Monahan', '52863 Orn Place\nSouth Sashamouth, WA 55294-6382', '(614) 360-9578', 'Odit explicabo sit vitae necessitatibus.', NULL, NULL),
(60, 'Aiyana Hegmann Sr.', '632 Jayson Pines\nVeumfurt, NJ 32565-1553', '878.585.2077', 'Voluptatum qui alias deserunt vel occaecati nobis.', NULL, NULL),
(61, 'Shaylee Donnelly', '84060 Solon Trail Suite 829\nSwiftburgh, WV 41975-4075', '463.205.1208', 'Dolores sit eaque ea repellat in beatae suscipit.', NULL, NULL),
(62, 'Jonatan McGlynn V', '8866 Candida Villages Apt. 250\nEast Jameson, ID 02365', '+18479476756', 'Ut animi voluptates consectetur ad.', NULL, NULL),
(63, 'Ms. Edwina Ankunding II', '960 Walker Turnpike\nHammesfurt, AK 08254', '956-935-4187', 'Laborum consequuntur nobis et sit dolorum qui.', NULL, NULL),
(64, 'Prof. Magali Wiegand', '839 Arnold Avenue\nPort Damianside, CT 19204-6002', '(239) 938-5778', 'Aliquam occaecati qui modi asperiores.', NULL, NULL),
(65, 'Alessandro Sporer DVM', '770 Kohler Track\nSouth Kristopher, MD 52183-3566', '(920) 875-6373', 'Rerum sed laudantium fugit excepturi in qui.', NULL, NULL),
(66, 'Leola O\'Reilly', '3927 Dovie Summit Suite 540\nSouth Alyce, HI 53537-7861', '+1 (463) 815-4089', 'Exercitationem ut voluptas et et inventore ab quia.', NULL, NULL),
(67, 'Jevon Vandervort', '8671 Mante Extensions\nLeslieview, OH 66869', '(551) 230-7127', 'Commodi dolor aut laboriosam perspiciatis dignissimos sed eos.', NULL, NULL),
(68, 'Eden Jones', '400 Korbin Village Apt. 517\nNorth Branthaven, DC 07651-8631', '772-418-8075', 'Similique distinctio sed asperiores qui.', NULL, NULL),
(69, 'Akeem Glover MD', '73123 Swaniawski Green Apt. 008\nSouth Candidahaven, OR 32392-2889', '571-849-3537', 'Tempore corrupti explicabo quo voluptas accusamus repudiandae.', NULL, NULL),
(70, 'Francesco Daugherty', '91627 Hyatt Rapids\nLake Jamirshire, WI 89209', '(313) 892-1505', 'Debitis ad magnam rerum est perspiciatis.', NULL, NULL),
(71, 'Edmond Weber', '823 Skiles Burgs\nCorwinberg, MS 20262-1877', '267-378-4762', 'Quia deserunt et exercitationem.', NULL, NULL),
(72, 'Owen Russel', '388 Keon Knoll Suite 289\nFisherville, DE 61961-4969', '(903) 477-9423', 'Ad sed maxime voluptatem voluptatibus unde.', NULL, NULL),
(73, 'Ms. Raegan Stoltenberg Jr.', '92218 Ziemann Walk\nRuthefurt, MT 26330', '724.948.5717', 'Corporis esse qui dolor sapiente.', NULL, NULL),
(74, 'Ava Upton', '7038 Gregorio Walks Apt. 248\nSouth Brooke, FL 04371', '1-534-597-0090', 'Ut aut hic maxime mollitia ullam quia ipsa.', NULL, NULL),
(75, 'Luna Prosacco', '872 Janiya Port Apt. 504\nMollyville, LA 57808', '380-910-9445', 'Commodi ratione officia qui facilis voluptatem et.', NULL, NULL),
(76, 'Cristal Mitchell', '3723 Pouros Track\nNew Alisa, HI 55665', '1-361-821-9712', 'Corporis rerum est suscipit et non autem qui ratione.', NULL, NULL),
(77, 'Hortense Fahey', '395 Mikayla Alley\nGeovanyfurt, NJ 02740', '+1.848.940.8921', 'Ut assumenda suscipit aut architecto.', NULL, NULL),
(78, 'Florida Klocko', '447 Kamren Mall\nKuphalmouth, MO 42648', '231.239.7521', 'Recusandae delectus ea aut voluptatem vitae accusamus unde ut.', NULL, NULL),
(79, 'Ms. Isobel Feil III', '855 Addie Square Apt. 688\nFritschport, MO 53795-3793', '1-234-536-1220', 'Quo natus ipsa et esse quidem qui autem.', NULL, NULL),
(80, 'Gaston Prosacco', '29429 Freeda Dam\nCarolynemouth, IA 57673-2857', '1-319-390-8879', 'Suscipit harum rerum pariatur voluptatem accusamus quisquam.', NULL, NULL),
(81, 'Hyman O\'Kon', '9284 Okuneva Lakes Apt. 023\nLake Aditya, NH 11193-3441', '+1-541-933-2406', 'Iste tempore unde tenetur ducimus.', NULL, NULL),
(82, 'Lottie Schaden', '636 Kshlerin Island Suite 961\nLoriborough, SD 00627', '636-382-1215', 'Sed atque itaque ex eos cum cumque qui.', NULL, NULL),
(83, 'Narciso Corkery Sr.', '4669 Vandervort Crescent\nFredystad, NJ 97227-9987', '380-918-5760', 'Esse consequatur aspernatur aliquid qui.', NULL, NULL),
(84, 'Nathaniel Bernier', '62267 Clinton Common Apt. 863\nO\'Connerton, MD 59370-1451', '678.872.2083', 'Beatae et eum ut rerum ducimus nesciunt.', NULL, NULL),
(85, 'Lonny Schowalter', '6263 Lauretta River Apt. 239\nNatashatown, WI 59779', '559-256-4803', 'Rem consequatur ipsam aut nesciunt eos repellendus et.', NULL, NULL),
(86, 'Chauncey Berge', '44416 Borer Plains\nUptonmouth, NC 52498', '+1 (934) 448-0194', 'Aut consequatur aut itaque reiciendis.', NULL, NULL),
(87, 'Marc Casper', '919 Joanny Glen Apt. 033\nNew Ferneshire, WA 61677-8267', '1-252-655-5445', 'Possimus et eveniet esse tenetur nihil vel dolorum.', NULL, NULL),
(88, 'Miss Magdalen Doyle MD', '70428 Kade Track Suite 790\nO\'Connellmouth, MD 62141-7269', '424-758-4573', 'Voluptas aut quaerat sint quo.', NULL, NULL),
(89, 'Dr. Sonny Satterfield', '5808 Hilpert Extension Apt. 351\nShanahanburgh, UT 95919', '1-281-537-1107', 'Illum placeat sed est amet sit odit enim.', NULL, NULL),
(90, 'Astrid Koss', '4633 Wiegand Bypass Suite 510\nAdamouth, NM 77303-9428', '(308) 855-9154', 'Aut excepturi aliquam qui odio temporibus eius.', NULL, NULL),
(91, 'Estrella Windler', '77116 Royal Extensions Suite 112\nWolffmouth, LA 26474-5954', '443-778-8555', 'Sit dignissimos repudiandae consequatur laudantium quis.', NULL, NULL),
(92, 'Olen VonRueden PhD', '358 Darrin Springs\nRaynormouth, MA 11797', '1-458-793-9595', 'Beatae veniam voluptatem tempora laudantium.', NULL, NULL),
(93, 'Jevon Dietrich', '1796 Devyn Hills Apt. 418\nKihnview, PA 80012', '+1 (434) 831-0477', 'Illum qui quae ducimus qui pariatur nulla et.', NULL, NULL),
(94, 'Stacey Terry', '98693 Reese Underpass\nNew River, AK 64381-2469', '+1-816-701-1459', 'Voluptatem consequatur deleniti sit.', NULL, NULL),
(95, 'Lavada McDermott', '9973 Buckridge View\nNorth Bradford, NJ 71968', '1-262-684-0937', 'Totam perspiciatis reprehenderit laboriosam ipsa sint libero.', NULL, NULL),
(96, 'Mrs. Alena Simonis IV', '18469 Emard Unions Apt. 244\nGreenfelderberg, MO 22130', '(413) 226-8375', 'Qui optio nesciunt eos ipsa.', NULL, NULL),
(97, 'Ms. Meta Tremblay III', '63627 Rodriguez Extensions Apt. 576\nMeghanborough, SC 98184-5791', '+1-279-410-9419', 'Est doloremque modi iusto molestias.', NULL, NULL),
(98, 'Benjamin Dibbert', '839 Pete Courts\nWest Gail, TN 31078-1966', '1-571-784-6074', 'Nihil dignissimos accusamus et nisi quod dolor.', NULL, NULL),
(99, 'Joanne Gutmann PhD', '258 Kemmer Corner\nSpencerstad, SC 93449-8124', '+15125470239', 'Explicabo nisi blanditiis laborum quisquam voluptatem.', NULL, NULL),
(100, 'Prof. Hazle Conn Sr.', '711 Schaefer Square Suite 746\nShermanborough, NH 98989-7785', '651.817.8675', 'Quas sequi dolores illum hic soluta et qui sed.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `providers`
--

CREATE TABLE `providers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `providers`
--

INSERT INTO `providers` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Provider', 'provider@gmail.com', NULL, '$2y$10$j5ffAhbEYmwiT37YEUvshuvydLoOxdPD1WQ.MD1i.zCnHqRfgYzJG', NULL, '2022-11-01 17:03:47', '2022-11-01 17:03:47');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_info` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auth_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `service_name`, `service_info`, `auth_id`, `created_at`, `updated_at`) VALUES
(1, 'service 1', 'service 1 test', 1, '2022-11-01 17:05:07', '2022-11-01 17:05:07');

-- --------------------------------------------------------

--
-- Table structure for table `super_admins`
--

CREATE TABLE `super_admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `super_admins`
--

INSERT INTO `super_admins` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'superadmin@live.com', NULL, '$2y$10$aojvovpQq5hqknrkj0EDDuEUdo9dCNOxI54BlIjy1eNvHv2FGkIMy', NULL, '2022-11-01 17:03:47', '2022-11-01 17:03:47');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auths`
--
ALTER TABLE `auths`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `providers_email_unique` (`email`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `super_admins`
--
ALTER TABLE `super_admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `super_admins_email_unique` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auths`
--
ALTER TABLE `auths`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `providers`
--
ALTER TABLE `providers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `super_admins`
--
ALTER TABLE `super_admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

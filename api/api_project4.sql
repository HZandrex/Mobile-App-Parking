-- phpMyAdmin SQL Dump
-- version 4.0.4.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 28, 2019 at 12:28 PM
-- Server version: 5.6.13
-- PHP Version: 5.4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `api_project4`
--
CREATE DATABASE IF NOT EXISTS `api_project4` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `api_project4`;

-- --------------------------------------------------------

--
-- Table structure for table `evidences`
--

CREATE TABLE IF NOT EXISTS `evidences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fine_id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bewijsmateriaalBoete` (`fine_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=201 ;

--
-- Dumping data for table `evidences`
--

INSERT INTO `evidences` (`id`, `fine_id`, `url`) VALUES
(1, 24, 'http://www.ruecker.com/'),
(2, 38, 'http://stokes.com/'),
(3, 27, 'http://www.schummlarson.net/'),
(4, 90, 'http://www.toyrath.biz/'),
(5, 67, 'http://damore.com/'),
(6, 8, 'http://www.rathstiedemann.com/'),
(7, 60, 'http://langworth.biz/'),
(8, 5, 'http://www.larkinullrich.com/'),
(9, 3, 'http://www.borer.com/'),
(10, 6, 'http://stiedemannzemlak.org/'),
(11, 2, 'http://www.davisruecker.com/'),
(12, 81, 'http://hauckwest.biz/'),
(13, 25, 'http://www.goyette.com/'),
(14, 31, 'http://paucek.biz/'),
(15, 96, 'http://heaneyjakubowski.org/'),
(16, 8, 'http://dickibarrows.org/'),
(17, 16, 'http://www.altenwerth.biz/'),
(18, 56, 'http://pfeffer.com/'),
(19, 31, 'http://www.wyman.com/'),
(20, 24, 'http://pagac.com/'),
(21, 87, 'http://www.stoltenberg.com/'),
(22, 63, 'http://www.nolan.com/'),
(23, 44, 'http://zboncak.info/'),
(24, 81, 'http://ernser.info/'),
(25, 79, 'http://aufderhar.net/'),
(26, 10, 'http://www.bergnaum.com/'),
(27, 76, 'http://www.rosenbaum.com/'),
(28, 42, 'http://aufderharwalsh.com/'),
(29, 57, 'http://hahn.net/'),
(30, 84, 'http://www.mcclure.biz/'),
(31, 86, 'http://www.bogisich.net/'),
(32, 68, 'http://www.funk.info/'),
(33, 80, 'http://orn.net/'),
(34, 76, 'http://crona.com/'),
(35, 61, 'http://www.hamill.com/'),
(36, 76, 'http://brownhansen.net/'),
(37, 76, 'http://oberbrunner.info/'),
(38, 73, 'http://cruickshank.org/'),
(39, 55, 'http://www.daniel.com/'),
(40, 46, 'http://www.block.biz/'),
(41, 55, 'http://harber.biz/'),
(42, 70, 'http://weissnatbernhard.com/'),
(43, 19, 'http://www.kshlerinconnelly.com/'),
(44, 80, 'http://www.parker.com/'),
(45, 53, 'http://rolfson.com/'),
(46, 95, 'http://johnston.com/'),
(47, 6, 'http://moore.com/'),
(48, 79, 'http://bernhard.com/'),
(49, 87, 'http://koss.com/'),
(50, 36, 'http://www.koepp.com/'),
(51, 7, 'http://www.kingkuhic.com/'),
(52, 69, 'http://kunzebashirian.com/'),
(53, 74, 'http://schmeler.org/'),
(54, 7, 'http://www.leschdeckow.info/'),
(55, 65, 'http://www.bodeokeefe.com/'),
(56, 85, 'http://www.stroman.org/'),
(57, 20, 'http://www.kreiger.com/'),
(58, 57, 'http://botsford.biz/'),
(59, 18, 'http://www.brekke.net/'),
(60, 31, 'http://stromankovacek.com/'),
(61, 73, 'http://www.wehner.com/'),
(62, 27, 'http://www.bechtelarwalsh.net/'),
(63, 52, 'http://franeckirolfson.com/'),
(64, 26, 'http://goyette.com/'),
(65, 87, 'http://www.stromanstreich.info/'),
(66, 31, 'http://www.goyettefeeney.biz/'),
(67, 81, 'http://fishercassin.com/'),
(68, 35, 'http://abernathy.org/'),
(69, 34, 'http://www.grimessatterfield.com/'),
(70, 30, 'http://www.kuhic.com/'),
(71, 83, 'http://kohler.com/'),
(72, 52, 'http://www.walkercorkery.com/'),
(73, 9, 'http://www.kshlerinfahey.com/'),
(74, 36, 'http://bergecollier.com/'),
(75, 5, 'http://marquardtrutherford.com/'),
(76, 68, 'http://www.okeefe.com/'),
(77, 68, 'http://farrellschumm.biz/'),
(78, 58, 'http://bergstromhahn.net/'),
(79, 14, 'http://feestmiller.biz/'),
(80, 79, 'http://larkin.com/'),
(81, 54, 'http://www.goyette.com/'),
(82, 97, 'http://www.wehnerhilll.info/'),
(83, 50, 'http://schummbahringer.com/'),
(84, 30, 'http://www.marquardt.info/'),
(85, 20, 'http://www.barrowscarter.info/'),
(86, 33, 'http://www.dickinsongoldner.org/'),
(87, 47, 'http://www.harveyprosacco.com/'),
(88, 4, 'http://www.hane.com/'),
(89, 6, 'http://parisian.com/'),
(90, 21, 'http://www.watsica.org/'),
(91, 37, 'http://www.graham.com/'),
(92, 60, 'http://www.block.com/'),
(93, 46, 'http://www.kunde.org/'),
(94, 5, 'http://www.harveymoen.info/'),
(95, 19, 'http://www.hesselhilpert.biz/'),
(96, 41, 'http://sporer.org/'),
(97, 50, 'http://heathcote.com/'),
(98, 5, 'http://www.hammes.com/'),
(99, 86, 'http://mayernolan.biz/'),
(100, 48, 'http://huels.info/'),
(101, 41, 'http://www.kirlin.org/'),
(102, 74, 'http://abshire.com/'),
(103, 12, 'http://treutel.com/'),
(104, 87, 'http://www.bruen.biz/'),
(105, 7, 'http://vandervortswift.com/'),
(106, 37, 'http://deckowwelch.biz/'),
(107, 67, 'http://www.beahan.info/'),
(108, 23, 'http://fadelgutmann.com/'),
(109, 85, 'http://uptonbeer.com/'),
(110, 20, 'http://www.emmerichbreitenberg.com/'),
(111, 50, 'http://koepp.com/'),
(112, 99, 'http://www.damore.com/'),
(113, 99, 'http://www.caspercrist.org/'),
(114, 15, 'http://www.murazik.net/'),
(115, 21, 'http://schultz.info/'),
(116, 92, 'http://www.mraz.org/'),
(117, 50, 'http://www.ebertspencer.com/'),
(118, 90, 'http://www.bauchschimmel.net/'),
(119, 100, 'http://www.reichert.biz/'),
(120, 80, 'http://www.bartellrutherford.com/'),
(121, 71, 'http://blick.net/'),
(122, 46, 'http://skilesleuschke.com/'),
(123, 80, 'http://lubowitzherman.com/'),
(124, 21, 'http://www.hammesweissnat.com/'),
(125, 83, 'http://www.hermann.org/'),
(126, 10, 'http://stamm.com/'),
(127, 49, 'http://www.buckridge.com/'),
(128, 43, 'http://www.senger.org/'),
(129, 33, 'http://boyer.com/'),
(130, 81, 'http://beatty.com/'),
(131, 30, 'http://huels.com/'),
(132, 69, 'http://www.collinstorp.org/'),
(133, 95, 'http://watsica.org/'),
(134, 23, 'http://www.keebler.com/'),
(135, 15, 'http://strosinweissnat.com/'),
(136, 37, 'http://bernhard.com/'),
(137, 6, 'http://leschkunze.com/'),
(138, 43, 'http://www.crookschamplin.biz/'),
(139, 5, 'http://altenwerthbahringer.com/'),
(140, 54, 'http://wisoky.com/'),
(141, 93, 'http://www.funk.com/'),
(142, 99, 'http://www.walsh.com/'),
(143, 38, 'http://maggio.com/'),
(144, 9, 'http://www.champlinkoelpin.net/'),
(145, 1, 'http://www.dietrich.com/'),
(146, 18, 'http://hilll.com/'),
(147, 14, 'http://www.kshlerin.biz/'),
(148, 67, 'http://www.lynch.com/'),
(149, 3, 'http://www.hansen.com/'),
(150, 84, 'http://zulauf.biz/'),
(151, 46, 'http://lueilwitzhudson.com/'),
(152, 51, 'http://champlin.biz/'),
(153, 69, 'http://murphyschoen.com/'),
(154, 12, 'http://www.hermann.com/'),
(155, 43, 'http://www.marks.com/'),
(156, 46, 'http://www.rice.org/'),
(157, 39, 'http://www.cruickshank.com/'),
(158, 29, 'http://www.abshirefisher.net/'),
(159, 48, 'http://www.bradtke.info/'),
(160, 82, 'http://www.lesch.com/'),
(161, 61, 'http://www.hammes.biz/'),
(162, 12, 'http://dooleyframi.com/'),
(163, 78, 'http://www.hamill.com/'),
(164, 16, 'http://www.hilll.info/'),
(165, 19, 'http://deckowwaelchi.org/'),
(166, 19, 'http://daniel.info/'),
(167, 89, 'http://torphychristiansen.biz/'),
(168, 97, 'http://www.kuhn.com/'),
(169, 70, 'http://www.wiza.com/'),
(170, 12, 'http://hessel.org/'),
(171, 55, 'http://quigley.com/'),
(172, 60, 'http://www.williamson.com/'),
(173, 20, 'http://hettinger.com/'),
(174, 66, 'http://www.kozeyhartmann.com/'),
(175, 7, 'http://beerjakubowski.com/'),
(176, 51, 'http://cruickshank.com/'),
(177, 63, 'http://rolfsoncruickshank.com/'),
(178, 26, 'http://www.sipes.com/'),
(179, 56, 'http://www.kilback.com/'),
(180, 79, 'http://stromanruecker.com/'),
(181, 50, 'http://www.harber.com/'),
(182, 78, 'http://mosciski.com/'),
(183, 42, 'http://www.doylesmitham.net/'),
(184, 78, 'http://www.legros.com/'),
(185, 45, 'http://torphy.com/'),
(186, 83, 'http://www.kertzmann.biz/'),
(187, 18, 'http://www.boyerprice.com/'),
(188, 79, 'http://www.schmeler.com/'),
(189, 88, 'http://mayert.com/'),
(190, 37, 'http://hettinger.com/'),
(191, 80, 'http://luettgenklein.com/'),
(192, 28, 'http://www.okon.com/'),
(193, 76, 'http://hand.com/'),
(194, 86, 'http://www.wilderman.com/'),
(195, 51, 'http://hodkiewiczpagac.biz/'),
(196, 64, 'http://schmidt.info/'),
(197, 94, 'http://quigley.com/'),
(198, 94, 'http://sengerrosenbaum.com/'),
(199, 51, 'http://www.bogan.net/'),
(200, 87, 'http://langosh.com/');

-- --------------------------------------------------------

--
-- Table structure for table `fines`
--

CREATE TABLE IF NOT EXISTS `fines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license_plate` varchar(255) NOT NULL,
  `creator_id` int(11) NOT NULL,
  `fine_type_id` int(11) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fine_type_id` (`fine_type_id`),
  KEY `creator_id` (`creator_id`),
  KEY `creator_id_2` (`creator_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=102 ;

--
-- Dumping data for table `fines`
--

INSERT INTO `fines` (`id`, `license_plate`, `creator_id`, `fine_type_id`, `location`, `note`, `created_time`, `modified_time`) VALUES
(1, '82 dt', 1, 1, '64812 Sauer Mountains\nCarolinahaven, NJ 49767-3311', 'Provident ab minima magnam nesciunt autem velit non. Optio suscipit illum distinctio voluptatem ut. Voluptatem recusandae sit quisquam. Culpa placeat aut magni fugiat quam et. Ea ex praesentium quia voluptas alias.', '1996-02-11 21:53:57', '1982-11-10 22:54:58'),
(2, '96 mw', 2, 2, '6832 Nader Terrace\nLake Jovaniside, VA 62486-7619', 'Nesciunt fuga nemo rem optio vel quo cum. Ut qui facilis excepturi est perspiciatis deserunt corrupti. Voluptates sit qui ipsum qui odio reiciendis. Non cupiditate tempore eius.', '1996-03-15 15:22:12', '1973-05-11 17:51:31'),
(3, '27 xa', 3, 1, '110 Altenwerth Course\nWest Randallstad, AK 06343-0836', 'Eligendi voluptatem perspiciatis sunt aut consequatur sapiente maxime iste. Optio harum rerum ut distinctio. Tempora consectetur aperiam non consectetur eos praesentium.', '1981-07-18 15:07:51', '1991-10-12 06:57:12'),
(4, '13 ql', 4, 2, '525 Padberg Pass Suite 245\nNorth Sylvan, MD 90472', 'Esse aspernatur consequatur aspernatur in cupiditate consequuntur. Ab facilis sed sequi repudiandae sed. Ipsa itaque dolorem ducimus omnis repellat. Et fuga iure delectus consequatur repellendus praesentium voluptas.', '1996-04-13 14:54:43', '1979-06-10 17:37:54'),
(5, '34 dr', 5, 1, '17085 Fay Mill Suite 599\nEast Lavada, DE 63308', 'Sed id consequuntur accusamus et iste. Et cupiditate sapiente eligendi similique nam. Ut est corporis dolorum at corporis odit. Dolores est et officiis ut.', '1984-01-23 12:23:34', '1990-09-21 15:18:04'),
(6, '93 eq', 6, 2, '81303 Daniela Passage Suite 551\nEast Aubreyshire, CT 71586-1800', 'Delectus placeat et at. Quod dicta maiores optio nesciunt. Reiciendis quis rerum inventore ipsam explicabo laudantium quia.', '2018-02-09 21:13:08', '1985-08-25 09:48:33'),
(7, '89 gs', 7, 1, '96465 Clark Throughway Suite 664\nNew Herberttown, VT 51229', 'Molestiae doloribus numquam ea sit iste. Voluptatem sint aut numquam modi. Amet blanditiis et rem eos sint velit ipsam.', '1970-02-09 23:12:01', '2015-05-30 21:39:54'),
(8, 'test', 5, 2, 'nergens', 'Wereld vergaat', '2018-10-01 10:12:45', '2019-01-03 17:20:21'),
(9, '74 ya', 9, 1, '4190 McCullough Skyway Apt. 773\nEast Tatyana, HI 76647-9197', 'A maxime eaque est alias totam in molestias. Labore qui suscipit sint est in distinctio ut excepturi. Hic consequuntur beatae voluptas tenetur facere asperiores est. Omnis quia accusamus in dolor laboriosam. Et fuga et ad maxime.', '1972-10-30 09:22:30', '2002-12-01 18:10:45'),
(10, '95 ha', 10, 2, '33607 VonRueden Street\nNorth Fanny, GA 51948', 'Nihil et ducimus dicta consectetur quidem. Provident voluptas ut sit officia. Maiores laboriosam et maiores consequatur. Harum mollitia deserunt commodi in.', '2003-01-03 15:55:27', '2002-08-06 19:05:11'),
(11, '87 wo', 11, 1, '65506 Milo Ports\nEast Chasityshire, CT 20101', 'Voluptatum adipisci aut debitis a dicta nemo. Dignissimos eos odio quis sapiente. Commodi praesentium sunt omnis aut doloremque nam.', '2014-02-01 01:02:38', '2017-08-25 08:18:43'),
(12, '00 xb', 12, 2, '5590 Tia Ridge\nLake Liliana, NH 57119', 'Dolore est non commodi adipisci. Ea perspiciatis dolorum perspiciatis fuga est similique delectus. Unde omnis ex aut.', '2004-12-28 10:10:02', '1980-05-30 19:55:59'),
(13, '15 ol', 13, 1, '067 Jess Terrace\nWest Elvis, KY 07992-6346', 'Mollitia enim commodi quis consequatur. Incidunt autem dolor at illo aut ut ab. Autem inventore qui ipsa consequatur eum eum.', '2018-01-30 04:52:34', '1975-12-26 10:30:05'),
(14, '37 cw', 14, 2, '23615 Goodwin Heights\nCummeratastad, SC 62199-5911', 'Et voluptatem ipsum reiciendis accusantium. Itaque temporibus atque quaerat repellat. Quidem consectetur hic odit nam error.', '1983-12-02 08:51:51', '1976-08-26 16:19:47'),
(15, '11 xt', 15, 1, '67230 Russel Brook Apt. 679\nDoylehaven, IA 46931-5955', 'Qui eum perspiciatis repellendus atque aut dolorem nesciunt error. Ipsam accusantium est consequatur doloremque. Hic est amet numquam molestiae.', '1978-10-16 20:42:49', '2001-07-21 22:02:29'),
(16, '44 ln', 16, 2, '583 Bernhard Well Apt. 718\nMooretown, CT 74125', 'Repellat exercitationem quisquam est expedita voluptatum. Qui dolorum maxime et itaque. Quia molestiae quaerat nihil at. Similique saepe in dicta voluptas alias temporibus.', '1971-03-26 08:28:33', '1972-07-02 06:59:56'),
(17, '78 jz', 17, 1, '612 Legros Valley Apt. 650\nPowlowskichester, NV 32372', 'Odit esse blanditiis officiis laborum et dolores fuga. Doloribus sit error ut. Officiis impedit id doloremque quia et consequatur nesciunt. Repellat et cupiditate eaque hic temporibus rerum.', '1976-03-18 15:18:37', '1990-06-02 08:42:18'),
(18, '72 it', 18, 2, '0341 Gibson Pines Apt. 114\nTurcottefurt, NC 28768-6001', 'Id quo sint cumque ad. Eveniet temporibus aspernatur sapiente exercitationem. Ullam culpa omnis odio illum rem sit voluptatem. Doloremque ut veritatis voluptatum consectetur quas.', '1997-03-31 02:03:13', '2002-05-24 03:00:26'),
(19, '43 ia', 19, 1, '26957 Lowe Crest Suite 152\nWest Shanonborough, WI 75497', 'Quidem quia sequi sit eum. Exercitationem nesciunt non doloremque doloremque ipsa alias. Atque est qui et qui. Distinctio voluptatum sequi voluptatum repudiandae perspiciatis eveniet.', '1986-09-13 00:41:43', '1996-12-23 12:37:55'),
(20, '06 mb', 20, 2, '34531 Fay Parkways Apt. 337\nEast Clemens, NE 14746', 'Assumenda error dolorum aut odio. Voluptatem ipsum non expedita aut doloribus laborum. Maxime nulla magnam magnam eum.', '1987-02-12 08:30:11', '2016-06-14 00:36:22'),
(21, '89 yv', 21, 1, '836 Brekke Spur Apt. 753\nWest Armandburgh, NY 69560-8947', 'Tenetur distinctio aut perferendis molestias cupiditate beatae consequatur. Dolores cupiditate eius expedita. Velit et eligendi repellendus officia voluptates quia. Et soluta nisi aspernatur. Dolorem dolorem quas nihil delectus aperiam aspernatur sit.', '2011-06-04 12:52:25', '1986-07-02 06:09:20'),
(22, '54 zf', 22, 2, '472 Hilll Loaf Suite 294\nEast Lydamouth, NH 23920', 'Magnam suscipit voluptatum mollitia. Ut ea ea placeat sint voluptas quo voluptatum.', '1996-09-08 06:47:18', '2002-04-11 15:43:35'),
(23, '59 rr', 23, 1, '39557 Labadie Meadows\nMissouriborough, MA 39880-2621', 'Tenetur suscipit in dolores nesciunt nihil suscipit. Quaerat aut aut ad recusandae rerum voluptatum. Id cumque facilis accusantium officiis architecto id ducimus.', '2011-09-26 02:50:28', '1988-04-12 14:53:40'),
(24, '89 wi', 24, 2, '5415 Devonte Inlet\nNorth Carleymouth, DE 73308', 'Veritatis ipsam enim ratione repudiandae neque ratione et. Minus sunt dolores adipisci aut architecto aspernatur laudantium. Ullam aut quidem tenetur doloribus iure tenetur non.', '2011-04-22 00:15:55', '1998-09-11 03:18:08'),
(25, '29 np', 25, 1, '61086 Ozella Mills Suite 101\nNew Antonialand, ND 52325', 'Sed excepturi modi saepe numquam quod quaerat voluptatem. Aut dolor fugit aut mollitia distinctio qui et. Suscipit libero modi odio culpa ut. Quam saepe deserunt consequatur accusantium voluptatem porro minima. Laudantium molestiae ut doloremque quia ad q', '1980-02-19 11:51:01', '2018-08-15 12:21:27'),
(26, '78 ng', 26, 2, '619 Schinner Point\nPort Colbybury, MO 95623', 'Alias nesciunt illum distinctio veniam aliquam. Quas est sequi hic. Dolor magnam ut maiores asperiores et quia eius. Rerum qui sint et occaecati itaque in nisi.', '1981-06-24 15:53:10', '1984-12-20 22:50:24'),
(27, '35 dk', 27, 1, '4110 Forest Views Apt. 037\nEmardmouth, AR 39609', 'Modi amet et consequatur at. Culpa hic est dolores est libero. Repudiandae aliquam excepturi nihil error sint assumenda dolorem. Nobis nisi nihil omnis assumenda est placeat alias.', '2007-03-26 02:56:17', '2015-06-12 20:14:34'),
(28, '06 jg', 28, 2, '98701 Gusikowski Island Apt. 317\nAllisonside, MO 57821', 'Id aliquid voluptatem deserunt sed quia. Eligendi iusto mollitia possimus omnis molestias.', '1977-10-22 04:49:51', '1976-10-14 11:41:52'),
(29, '93 sc', 29, 1, '2581 Harry Burgs Apt. 017\nRosenbaumfort, MT 12877-2976', 'Eveniet ratione ducimus nihil recusandae quibusdam numquam est voluptatum. Rem ut sit nam totam. Et voluptatem earum deserunt exercitationem rerum est odio et. Tempora sequi omnis iusto aliquid.', '1981-06-18 15:12:10', '1982-04-25 10:54:07'),
(30, '82 op', 30, 2, '809 Stracke Stream Apt. 116\nEast Lulu, MI 83937-3460', 'Quisquam quia consectetur architecto aut. Mollitia praesentium vel eos. Facilis voluptate distinctio molestias. Dolorem minima est omnis assumenda provident quia quis.', '2008-10-10 13:45:41', '1970-03-26 11:21:21'),
(31, '11 ke', 31, 1, '2370 Collins Corner Apt. 707\nWest Winifredchester, NJ 50215-5451', 'Corrupti officiis voluptatibus est aut earum qui. Ea maiores repellat alias id.', '1984-04-24 22:17:33', '1996-07-05 09:03:39'),
(32, '31 eh', 32, 2, '091 Fritsch Vista\nHayesburgh, ME 56007', 'Eum quis natus est deserunt quaerat aut aliquid. Consectetur est nihil maxime natus laborum sed. Et quisquam ex aut blanditiis.', '1988-02-18 09:08:47', '1970-07-22 11:35:57'),
(33, '99 bv', 33, 1, '3789 Dixie Mission\nMonahanshire, MN 91181', 'Est eaque sed sapiente quia nemo. Quae excepturi dolore voluptas soluta.', '2007-10-18 20:48:37', '1998-03-06 11:21:10'),
(34, '76 yo', 34, 2, '317 Bartoletti Ridge\nEzrabury, IL 40912', 'Accusamus dolor consequatur quam atque eveniet impedit aliquam. Aliquid inventore non autem dignissimos deleniti accusantium. Accusantium nostrum dolores labore sit. Sunt est qui blanditiis illum quo aperiam. Consequatur adipisci nemo molestias et eos aut', '1989-12-18 11:02:08', '2004-09-28 07:25:36'),
(35, '88 ml', 35, 1, '80954 Rodriguez Lodge Apt. 209\nNorth Arvelborough, WI 25625', 'Eos dicta doloribus magnam beatae voluptates beatae nihil rerum. Laudantium dolorem id nam minus excepturi et unde in. Aliquid culpa voluptas incidunt veritatis culpa.', '2010-08-14 21:44:21', '1990-03-01 16:50:48'),
(36, '09 fg', 36, 2, '1177 Lehner Pike\nNorth Jonathanmouth, MS 70450', 'Est ipsam enim itaque dolore. Rerum quos ut sed nobis fugit dolores qui. Totam quaerat soluta exercitationem molestiae sint iure. Facilis a possimus perferendis ad consequuntur natus. Adipisci expedita voluptates maxime fugiat eveniet molestiae qui.', '2000-01-16 06:06:51', '1997-09-20 21:55:11'),
(37, '99 sz', 37, 1, '4922 Edmund Plaza\nWest Sylvesterton, TN 91572', 'Cupiditate voluptatem natus quis perspiciatis recusandae qui quidem. Deserunt veritatis et cum deleniti est qui quidem. Recusandae est eaque qui quis quos eligendi.', '1985-09-27 21:10:16', '1987-01-31 22:31:03'),
(38, '05 pi', 38, 2, '87659 Roberts Isle\nNew Cortneyberg, NC 92133', 'Officia qui iste minima id veniam. Incidunt ratione rerum velit soluta in aut consequatur. Ab cumque odit consequatur. Beatae quia est maiores illum molestiae eius.', '1971-10-21 08:30:40', '2018-06-23 02:10:16'),
(39, '17 ic', 39, 1, '6717 Joaquin Neck\nPort Imani, VT 19232', 'Possimus ducimus quis tenetur. Similique eveniet voluptates ut et temporibus voluptatem sequi. Odit velit dignissimos consequatur ea voluptates laborum. Dolores voluptatibus est facere dolorem qui vel. Id a eos occaecati dolores est.', '2017-01-09 02:01:42', '1992-05-20 01:10:12'),
(40, '47 pz', 40, 2, '5853 Jimmie Trace\nWest Alberto, LA 12473', 'Aspernatur quia aut quisquam sint nihil dolorem quia. Veritatis dolorum consequatur possimus perspiciatis est similique sint. Est quibusdam ut dolorem et sed id.', '2009-10-13 13:06:56', '1993-03-10 07:11:41'),
(41, '41 on', 41, 1, '4115 Kertzmann Ranch\nNew Terrellview, AK 20421', 'Tempora sequi illo ad necessitatibus qui velit. Nihil eum neque qui dolor. Autem nam sunt adipisci sint rerum quae. Laborum vel voluptatem nam adipisci officia delectus ipsam deserunt.', '1981-08-10 13:13:00', '2015-10-16 22:31:42'),
(42, '28 ww', 42, 2, '076 McClure Loop Apt. 866\nRasheedshire, WA 56624-8922', 'Asperiores nisi sed dignissimos fugit. Ut illum ad provident harum possimus doloribus et dolore.', '1997-02-17 04:28:23', '1971-10-21 16:59:07'),
(43, '26 zh', 43, 1, '537 Ryan Point Suite 421\nStrosinton, CO 77968', 'Soluta ut totam vitae consequatur. Et porro temporibus et ducimus excepturi quidem eius ea. Eum excepturi id est tempore reiciendis tempora cum.', '1997-02-26 02:51:11', '1971-07-07 12:54:30'),
(44, '41 rt', 44, 2, '668 Sterling Place Apt. 593\nPadbergmouth, WI 03807', 'Esse fugit aut quae ut quibusdam aut qui. Nisi minima repudiandae ipsam tempora consequuntur. Iste magnam fugiat alias non adipisci et.', '2004-12-27 02:24:49', '2005-05-24 09:28:07'),
(45, '20 to', 45, 1, '1242 Bernard Union\nTyrelstad, UT 80370-4396', 'Accusamus officia inventore voluptatibus ut quisquam totam asperiores beatae. Expedita consequatur deserunt quo adipisci ea repellat natus id. Ab explicabo quia sint quibusdam et. Sunt similique quaerat earum et ut et vel aut.', '1995-05-23 12:50:16', '2000-12-20 02:16:57'),
(46, '36 ye', 46, 2, '2093 Sunny Cliffs\nSterlingport, KY 85046-2476', 'Earum rerum dolorem sequi quas cumque ex et. Nisi magnam exercitationem architecto sint vel. Eum suscipit voluptas adipisci iusto assumenda odio.', '2017-01-29 10:39:31', '1994-07-25 05:45:08'),
(47, '05 ly', 47, 1, '166 Sawayn Curve\nRitchieside, OR 81880', 'Expedita itaque quia sunt dolore consequatur illo qui. Vel ipsum nobis inventore nemo. Minima quisquam dolorem odio. Assumenda ex et minus dignissimos quibusdam quae doloribus.', '2014-07-28 15:54:10', '2009-12-05 08:23:35'),
(48, '78 iz', 48, 2, '84980 Cormier Road Suite 271\nEichmannborough, NC 42140-7985', 'Dolor libero ratione unde illo molestiae ipsa temporibus voluptates. Maiores itaque aut dicta ut. Quia eius quasi dolor labore culpa id. Saepe voluptatem hic vero recusandae error omnis.', '1980-04-05 09:35:46', '1995-02-15 16:47:15'),
(49, '16 dx', 49, 1, '672 Buck Field Apt. 220\nBodeland, MS 07318', 'Iste assumenda adipisci sequi. At est eligendi tempore ad repellendus commodi vel. Officia velit autem ea aliquam non recusandae. Eveniet facilis quisquam voluptatum totam.', '1979-08-29 22:16:44', '1990-09-05 07:47:25'),
(50, '85 lk', 50, 2, '62037 Abshire Manors\nEast Giuseppe, SD 38608', 'Dolores reprehenderit neque molestiae consequuntur vitae non. Eligendi vel quo non iste vel quasi aut. Quaerat nihil quidem est officia qui voluptate sed optio.', '1980-01-28 04:29:37', '2004-07-21 22:26:52'),
(51, '01 zy', 51, 1, '78794 Stokes Lock\nAltenwerthchester, SD 41065', 'Et repellendus sit hic fugit dolores. Reiciendis aut exercitationem dolor rerum nesciunt cumque. Illo cum ad sint odit.', '1983-12-30 21:39:10', '1981-12-15 20:14:01'),
(52, '36 ic', 52, 2, '40737 Deckow Cove\nWilhelmtown, CA 98810-2282', 'Vel delectus illo cum error earum enim quod. Ea quo quas quisquam eum molestias qui reprehenderit. Quas non numquam repellat eaque blanditiis. Cum incidunt praesentium eum.', '2002-11-04 07:14:09', '2006-10-01 06:05:52'),
(53, '83 df', 53, 1, '145 Corine Street Apt. 735\nBrielleview, AK 78722-9274', 'Dolorem dolore magnam minus. Quasi a perspiciatis vel repellendus quod voluptatem.', '2015-03-02 06:12:23', '2007-01-23 22:40:31'),
(54, '65 zd', 54, 2, '13876 Runolfsson Fields Apt. 096\nCollinsburgh, SC 99703-1915', 'Quisquam quia sapiente soluta sit. Id dolorem aut delectus et qui error harum. Voluptas saepe voluptatem velit aut officiis. Excepturi accusamus aspernatur recusandae.', '2013-04-18 02:05:24', '1972-05-08 21:42:55'),
(55, '20 fr', 55, 1, '598 Kailyn Motorway Apt. 767\nSouth Jeramy, RI 54520', 'Est eos eligendi asperiores natus. Beatae tenetur voluptatem labore at ut omnis. Quia magni beatae vero quasi dolorem. Omnis quo praesentium unde atque.', '2009-03-22 11:51:36', '2006-06-19 15:02:58'),
(56, '49 xz', 56, 2, '3825 Gorczany Prairie\nLindport, OK 95233-6437', 'Nam incidunt consequatur velit esse pariatur quia fugit. Odio architecto debitis aut qui. Aliquid consequatur consequuntur id iusto. Odio dolor nihil ut deleniti voluptate sint.', '2011-12-18 04:30:55', '2005-08-03 12:31:51'),
(57, '92 ig', 57, 1, '16906 Yundt Haven Suite 239\nWest Wilburnport, WI 79007-7357', 'Totam ipsam rem praesentium non quibusdam hic accusantium. Voluptatem corporis maxime magnam quos deleniti fuga ut. Porro dignissimos quia ducimus cupiditate at sed ea.', '1985-01-14 08:52:03', '1986-12-13 15:42:59'),
(58, '79 re', 58, 2, '671 Raleigh Forest\nWest Kailyn, MA 54167-5291', 'Numquam exercitationem sit repudiandae officiis alias deleniti. Nulla iusto rerum neque et ea. Beatae fuga facilis et sit doloremque eum incidunt. Quasi quia ratione reiciendis sequi laborum dolores aliquid.', '1970-05-29 00:36:44', '1987-05-26 07:23:17'),
(59, '74 es', 59, 1, '150 Kara Wells Apt. 006\nTyraland, CA 06876-3881', 'Nesciunt voluptatem aut suscipit repudiandae reiciendis nam dolores alias. Ut fugit voluptatibus qui et cumque. Fuga et odio aliquam deleniti et odit. Facilis nulla molestiae quia optio id aut.', '1973-09-03 09:39:08', '1993-02-21 13:12:48'),
(60, '21 mz', 60, 2, '573 Krajcik Trail\nPort Laura, KY 83642', 'Minus ab eos praesentium temporibus corporis sapiente dolorum. Doloremque eum qui ipsa natus. Est earum rerum quidem ut rerum vel rerum ullam.', '1971-11-19 10:07:18', '1974-08-07 03:28:43'),
(61, '53 ch', 61, 1, '067 Streich Rest Apt. 371\nNicolasstad, IN 64655-7474', 'In esse iure ratione qui velit. Dolorum quis nesciunt omnis est. Reiciendis et pariatur deleniti ratione. Rerum accusamus sed reprehenderit enim ut dignissimos sed.', '2014-04-08 12:10:23', '2000-06-25 00:24:20'),
(62, '40 lb', 62, 2, '5191 Griffin Loop Apt. 899\nSouth Alessia, NM 89657-5680', 'Dolor sed excepturi nobis iusto. Dolorem iure non ut voluptas consectetur soluta.', '1977-07-21 07:26:31', '2001-05-23 07:28:57'),
(63, '05 wb', 63, 1, '42999 Heloise Gateway\nCreminland, WY 06833-4970', 'Magni ut et necessitatibus quia ut. Velit esse vel voluptate ab ut. Ut aut autem dignissimos doloribus et perferendis quis.', '2010-11-22 14:42:51', '2003-11-27 19:17:08'),
(64, '49 as', 64, 2, '707 Rhianna Curve\nRiverville, MN 16937', 'Qui nihil qui quia sed voluptate enim dignissimos. Est aspernatur beatae expedita sequi praesentium ut atque ullam. Quis dicta atque veritatis autem vel voluptatem voluptates sed. Facere consequatur officia ipsam repellat quas sit ut.', '2018-06-09 19:20:33', '1994-08-06 21:54:48'),
(65, '83 dj', 65, 1, '83503 Swaniawski Falls\nSchroederside, IL 73440-1849', 'Quam esse dicta quam maxime et. Quos ut ratione et reprehenderit iste. Reprehenderit animi expedita commodi ratione ab itaque.', '1976-07-24 03:57:36', '1990-01-05 11:38:20'),
(66, '93 ug', 66, 2, '22515 Carlee Wells Suite 009\nNorth Joanyport, UT 66367', 'Velit atque consectetur fugit sed dolores autem incidunt. Ipsum et non aspernatur et itaque numquam. Corrupti sint facilis rem nemo nulla dolorem placeat. Autem non minus iure autem perferendis.', '2014-08-07 13:02:32', '1986-10-31 20:35:02'),
(67, '91 pz', 67, 1, '39601 Derek Turnpike\nEdwardoland, OK 72213-2433', 'Optio deleniti natus sequi. Autem commodi repellendus et ea. Est corrupti expedita nam blanditiis quisquam et. Molestias soluta aut et nesciunt laboriosam.', '1998-11-08 01:42:26', '1987-12-09 22:12:26'),
(68, '79 zo', 68, 2, '945 Ferry Courts\nEast Lizeth, HI 97332', 'Quia aut corporis corrupti sint rerum consequatur aut. Earum dolores eos necessitatibus et quisquam. Eligendi quia nesciunt ut quo tenetur. Eum vero tempora ullam id alias omnis quia. Nostrum error quas molestias adipisci minus cum aut.', '1980-01-19 13:51:57', '1995-01-02 02:53:23'),
(69, '41 ap', 69, 1, '79728 Huels Ports Suite 869\nNorth Lillatown, MA 10074-4493', 'Et voluptatem molestiae expedita voluptatem voluptates architecto. Autem inventore et fugiat. Suscipit porro eaque atque aut quis consequatur.', '1971-07-07 11:24:40', '1992-08-10 19:37:43'),
(70, '66 bf', 70, 2, '803 Schuster Springs Apt. 950\nBetsymouth, CA 89431-3696', 'Assumenda exercitationem provident saepe eius esse facilis. Quod qui mollitia et ullam. Omnis voluptate ducimus est exercitationem ipsum. Expedita quam fugiat minima eligendi quis fugiat.', '2015-11-22 13:01:14', '1991-03-23 02:50:43'),
(71, '78 mx', 71, 1, '9503 Kuvalis Falls\nSchusterfort, GA 39298-6578', 'Cupiditate doloribus ut dolorem in voluptatum rem. Dignissimos vitae eaque perferendis ut soluta. Omnis dolores molestiae aliquam minus qui delectus. Numquam labore et provident doloremque optio officiis.', '2012-12-03 00:56:32', '1998-02-24 07:39:11'),
(72, '52 ky', 72, 2, '8608 Wolff Street\nNew Juana, WI 65138-7066', 'Qui voluptatem exercitationem praesentium id delectus. Mollitia laboriosam nam beatae. Omnis sapiente quas iure corrupti temporibus.', '1997-08-14 02:16:39', '1999-10-09 08:34:12'),
(73, '50 hr', 73, 1, '660 Floy Camp\nNorth Roosevelttown, PA 61627-8377', 'Autem sed sapiente ratione est. Quo doloribus architecto animi qui.', '1995-04-06 17:32:44', '1981-06-22 12:13:37'),
(74, '22 eg', 74, 2, '7545 Kelly Canyon Apt. 776\nWest Anthonymouth, OR 18478', 'Voluptate animi reprehenderit consequuntur doloremque nam sint voluptatem. A unde cupiditate quibusdam et reprehenderit quos. Est ullam perferendis debitis porro tenetur incidunt. Optio recusandae quia corrupti aperiam error aut voluptates.', '1972-07-06 04:12:44', '2018-08-24 01:01:05'),
(75, '02 to', 75, 1, '114 Feil Stravenue\nSouth Christopher, WA 91550-2300', 'Magni facere id tempora ea et sint. Unde odit minus nesciunt aut consequatur doloremque. Voluptas est aut consectetur molestiae quaerat expedita dolor corporis. Sint delectus sunt ullam necessitatibus at aut beatae. Et ab debitis tempore quibusdam reprehe', '2015-04-24 08:22:55', '2013-07-13 04:40:40'),
(76, '10 ry', 76, 2, '926 Graham Court\nNew Kathlyn, WY 72163', 'Aspernatur quod dignissimos velit ipsa accusamus. Tempore enim voluptas beatae aut vel culpa rerum. Excepturi ut consequuntur hic laborum similique.', '2003-11-22 09:56:42', '2001-02-25 03:01:09'),
(77, '75 la', 77, 1, '542 Mitchell Dam Apt. 008\nPort Willisland, KS 96637', 'Et consequatur molestias consequatur perferendis. Autem hic qui facilis et qui nam exercitationem. Et rerum accusantium nostrum.', '1990-04-18 23:52:35', '1995-07-17 13:06:03'),
(78, '25 si', 78, 2, '29557 Rau Common\nReubenmouth, NM 22097', 'Maiores sed assumenda ea et voluptatem voluptas. Autem occaecati sapiente ut exercitationem. Et cupiditate explicabo quia sequi.', '2013-02-03 03:59:55', '1993-12-26 04:21:39'),
(79, '80 ti', 79, 1, '189 Johns Drives Suite 913\nWest Cletaburgh, OH 01067', 'Debitis eveniet odit consequatur natus vel. Pariatur quia qui odio iure voluptatibus est consectetur. Facere et velit voluptas a quae pariatur laboriosam.', '1991-01-04 19:34:57', '2001-02-16 22:48:24'),
(80, '26 ha', 80, 2, '02199 Anika Plains Suite 882\nPort Pietro, NM 67620-0885', 'Dicta quas iste atque et aliquam. Id et laboriosam omnis rerum. Assumenda non voluptates nesciunt veritatis qui.', '1986-08-06 23:39:31', '1982-12-15 03:40:57'),
(81, '83 bh', 81, 1, '49361 Kunde Ramp\nMrazmouth, SC 33664', 'Id modi totam voluptatem non. Impedit vel magni nostrum dolores est aut. Id iste animi qui quia facilis. Qui unde ut unde quod deserunt.', '2016-11-03 13:29:29', '1972-05-15 01:03:59'),
(82, '79 uz', 82, 2, '960 Erin Landing Apt. 830\nHudsonburgh, NV 65519-6406', 'Debitis repellendus similique vel nemo quas. Harum voluptatem sequi beatae enim quia eveniet dignissimos. Atque voluptas deserunt nobis non libero in aspernatur. Blanditiis facilis voluptatem laborum adipisci.', '1982-07-09 12:42:40', '2011-07-23 09:21:53'),
(83, '83 gb', 83, 1, '985 Savion Coves\nPagacfurt, FL 52989', 'Qui sed similique cupiditate. Rerum adipisci molestiae non earum.', '2011-01-24 02:57:10', '1993-02-28 12:41:44'),
(84, '93 mk', 84, 2, '723 Winfield Mountain Suite 149\nReichelborough, SC 19605-5686', 'Amet et atque quia ullam non. Molestias consequatur accusamus ab nam dolores nostrum natus. Veritatis expedita a consequatur alias consectetur. Aut labore sed sint sit enim dolorum dolor.', '1972-06-15 16:26:33', '1981-06-10 03:33:19'),
(85, '07 dy', 85, 1, '4881 Carolyne Junction\nSouth Caesarton, VA 35255', 'Fugit soluta laborum quia quisquam nam. Qui odio aut sit. Quo adipisci ad ut optio voluptate nihil fugit.', '2006-09-29 00:56:45', '1983-01-16 06:25:42'),
(86, '69 aq', 86, 2, '779 Marquardt Dale\nWisozkview, MN 40210', 'Quis aut laboriosam minus fugit consectetur voluptas. Non excepturi neque et voluptatem quae ut.', '2006-12-18 06:13:03', '1972-11-12 02:34:24'),
(87, '66 kw', 87, 1, '7701 Drake Port Apt. 387\nSouth Christyfort, NE 51124-0573', 'Omnis neque excepturi quidem architecto. Fugiat sequi qui autem nostrum et culpa error. Possimus et nostrum dolorem itaque.', '1978-12-30 20:18:37', '1997-08-14 00:54:30'),
(88, '97 ra', 88, 2, '26404 Crona Points Apt. 932\nColinmouth, MD 37742-8437', 'Ut dolorum voluptatum esse sint. Eum et accusamus dolor vero. Tempora asperiores animi necessitatibus et nam expedita quos.', '2002-08-25 09:24:35', '1993-10-29 16:05:47'),
(89, '50 yw', 89, 1, '04530 Jones Overpass Suite 701\nSpencerfurt, AZ 25248', 'Ut aut aspernatur ut et accusantium. Sint explicabo et vel eos dolorum hic ex qui. Voluptas minus consectetur pariatur.', '1981-07-28 09:04:57', '2018-11-28 22:29:15'),
(90, '68 gl', 90, 2, '7994 Boehm Springs Suite 123\nBernhardbury, OH 25250-1338', 'Maxime harum expedita tenetur sit quo. Velit atque minima ipsam. Fuga quia facere eligendi velit est.', '1978-03-03 19:27:18', '2016-12-03 09:15:03'),
(91, '90 sc', 91, 1, '1463 Cleora Route Suite 624\nEast Julienstad, MO 60056-3739', 'Eaque et ut et et dolore harum. Nostrum nulla mollitia quia quo illo nemo dignissimos. Cupiditate doloremque laboriosam impedit culpa id aut.', '1977-03-13 01:51:31', '1986-11-11 23:55:09'),
(92, '92 by', 92, 2, '766 Koss Branch\nLake Spencerhaven, DC 41987', 'Neque quia sapiente maiores omnis provident. Voluptas quia quia laborum assumenda qui. Expedita repellendus tenetur mollitia asperiores.', '2002-07-28 08:10:28', '1992-12-23 20:21:52'),
(93, '47 rs', 93, 1, '7654 Hodkiewicz Tunnel Apt. 694\nNew Adahaven, KY 90844', 'Et ipsum praesentium iusto voluptatem accusamus odit. Mollitia libero veritatis exercitationem ullam. Eaque corrupti molestiae cum consequatur. Nihil doloremque ut reprehenderit excepturi autem omnis.', '2010-12-27 02:49:28', '1972-10-13 08:22:23'),
(94, '25 et', 94, 2, '312 Vida Loaf Apt. 474\nSouth Prudence, ME 51248-6797', 'Perspiciatis qui animi cupiditate suscipit. Quis quidem aut nisi est voluptatem quisquam. Ad qui et iure illo aut porro.', '2004-03-27 10:55:02', '2017-11-26 09:10:26'),
(95, '08 vv', 95, 1, '48817 Jimmie Trace Suite 719\nOctaviaview, DE 06695', 'Qui possimus asperiores aut dolor temporibus voluptate a. Facere neque deleniti ullam sit.', '1997-11-23 07:36:20', '1995-07-23 05:01:04'),
(96, '05 uu', 96, 2, '26087 Rosina Port\nEffertzfurt, PA 62475-6869', 'Sequi et fuga in quidem soluta. Id magni iusto similique enim repellendus sed aspernatur. Nobis id aut qui eum amet et alias.', '1987-05-01 05:41:06', '2006-10-19 17:16:32'),
(97, '09 gy', 97, 1, '0134 Devon Overpass\nCarterside, HI 19047-8289', 'Consequuntur quisquam facilis officiis error. Ipsam voluptatem dolores modi enim. Deserunt assumenda sit omnis commodi molestiae. Id sapiente recusandae illum.', '2010-10-12 10:53:41', '2017-08-04 10:02:27'),
(99, '51 gw', 99, 1, '3751 Bette Centers Suite 351\nNorth Reggie, SC 15149-2551', 'Aut harum eligendi repudiandae ea distinctio sint repudiandae. Dolores eveniet alias inventore reiciendis velit aut voluptates maxime. Molestiae magni fugiat excepturi quod dolorem. Ex aut sed laborum et.', '1972-02-25 10:21:24', '1989-12-25 23:08:30'),
(100, '06 ge', 100, 2, '89320 Eladio Fall\nEast Ulices, SD 46457', 'Est nostrum consequatur velit inventore eaque ut corrupti. Quas aut similique aut voluptatibus porro. Deserunt et voluptate repellendus vel.', '1981-09-16 08:46:00', '2011-05-16 22:09:07'),
(101, '123456', 1, 1, '123456', '123456', '2019-01-02 17:14:51', '2019-01-02 17:14:51');

-- --------------------------------------------------------

--
-- Table structure for table `fine_types`
--

CREATE TABLE IF NOT EXISTS `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `fine_types`
--

INSERT INTO `fine_types` (`id`, `name`) VALUES
(1, 'Papiertje'),
(2, 'Wielklem');

-- --------------------------------------------------------

--
-- Table structure for table `user_settings`
--

CREATE TABLE IF NOT EXISTS `user_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `second_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=108 ;

--
-- Dumping data for table `user_settings`
--

INSERT INTO `user_settings` (`id`, `first_name`, `second_name`) VALUES
(1, 'Nico', 'Claes'),
(2, 'Eryn', 'voluptates'),
(3, 'Cale', 'facere'),
(4, 'Lou', 'harum'),
(5, 'Eli', 'autem'),
(6, 'Melyna', 'nemo'),
(7, 'Easter', 'perferendis'),
(8, 'Dina', 'consectetur'),
(9, 'Rosemary', 'provident'),
(10, 'Devante', 'fugiat'),
(11, 'Kennedy', 'ut'),
(12, 'Loyal', 'animi'),
(13, 'Evangeline', 'esse'),
(14, 'Lynn', 'inventore'),
(15, 'Callie', 'saepe'),
(16, 'Joannie', 'quisquam'),
(17, 'Justice', 'quia'),
(18, 'Lauretta', 'repellat'),
(19, 'Ansel', 'ipsam'),
(20, 'Price', 'totam'),
(21, 'Destini', 'quibusdam'),
(22, 'Shanie', 'quam'),
(23, 'Olga', 'sequi'),
(24, 'Alyson', 'reiciendis'),
(25, 'Cesar', 'nesciunt'),
(26, 'Raina', 'eveniet'),
(27, 'Raul', 'laborum'),
(28, 'Mya', 'saepe'),
(29, 'Tremaine', 'laboriosam'),
(30, 'Sigrid', 'quisquam'),
(31, 'Rasheed', 'sunt'),
(32, 'Lisandro', 'quo'),
(33, 'Alf', 'qui'),
(34, 'Arianna', 'recusandae'),
(35, 'Alden', 'delectus'),
(36, 'Eleanora', 'earum'),
(37, 'Lucious', 'ducimus'),
(38, 'Eudora', 'et'),
(39, 'Domingo', 'et'),
(40, 'Abraham', 'aut'),
(41, 'Dahlia', 'praesentium'),
(42, 'Demario', 'cupiditate'),
(43, 'Zander', 'et'),
(44, 'Declan', 'magni'),
(45, 'Prudence', 'optio'),
(46, 'Carissa', 'reiciendis'),
(47, 'Trevion', 'impedit'),
(48, 'Antonina', 'quis'),
(49, 'Armando', 'non'),
(50, 'Mateo', 'consequatur'),
(51, 'Elizabeth', 'voluptas'),
(52, 'Meagan', 'quas'),
(53, 'Dewayne', 'soluta'),
(54, 'Savannah', 'optio'),
(55, 'Tad', 'laborum'),
(56, 'Erling', 'ex'),
(57, 'Twila', 'enim'),
(58, 'Gudrun', 'beatae'),
(59, 'Wendy', 'sunt'),
(60, 'Taylor', 'atque'),
(61, 'Jaunita', 'laudantium'),
(62, 'Ervin', 'sed'),
(63, 'Jana', 'dolorem'),
(64, 'Marcel', 'in'),
(65, 'Lola', 'ipsum'),
(66, 'Jane', 'illum'),
(67, 'Donna', 'quidem'),
(68, 'Shany', 'doloremque'),
(69, 'Ken', 'impedit'),
(70, 'Antoinette', 'ea'),
(71, 'Roscoe', 'assumenda'),
(72, 'Brad', 'quod'),
(73, 'Taya', 'sequi'),
(74, 'Nelda', 'debitis'),
(75, 'Rowan', 'omnis'),
(76, 'Miles', 'aut'),
(77, 'Caden', 'optio'),
(78, 'Hellen', 'et'),
(79, 'Buster', 'est'),
(80, 'Major', 'mollitia'),
(81, 'Kaden', 'omnis'),
(82, 'Chasity', 'et'),
(83, 'Sammy', 'vitae'),
(84, 'Joany', 'officia'),
(85, 'Antonia', 'rerum'),
(86, 'Joaquin', 'rerum'),
(87, 'Alexanne', 'officiis'),
(88, 'Tabitha', 'asperiores'),
(89, 'Patricia', 'deleniti'),
(90, 'Lucio', 'laborum'),
(91, 'Deion', 'fuga'),
(92, 'Ericka', 'sed'),
(93, 'Jermaine', 'officia'),
(94, 'Britney', 'laboriosam'),
(95, 'Evelyn', 'ut'),
(96, 'Porter', 'ipsam'),
(97, 'Clementina', 'in'),
(98, 'Kaelyn', 'et'),
(99, 'Kareem', 'iusto'),
(100, 'Keyon', 'distinctio'),
(101, 'test', 'test'),
(102, 'test', 'Claes'),
(103, 'test', 'Claes'),
(104, 'test', 'Claes'),
(105, 'test', 'Claes'),
(106, 'test', 'Claes'),
(107, 'test', 'Claes');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `evidences`
--
ALTER TABLE `evidences`
  ADD CONSTRAINT `evidences_ibfk_1` FOREIGN KEY (`fine_id`) REFERENCES `fines` (`id`);

--
-- Constraints for table `fines`
--
ALTER TABLE `fines`
  ADD CONSTRAINT `fines_ibfk_1` FOREIGN KEY (`fine_type_id`) REFERENCES `fine_types` (`id`),
  ADD CONSTRAINT `fines_ibfk_2` FOREIGN KEY (`creator_id`) REFERENCES `user_settings` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

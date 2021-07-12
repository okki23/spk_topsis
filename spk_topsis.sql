/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100419
 Source Host           : localhost:3306
 Source Schema         : spk_topsis

 Target Server Type    : MySQL
 Target Server Version : 100419
 File Encoding         : 65001

 Date: 12/07/2021 22:08:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bagian
-- ----------------------------
DROP TABLE IF EXISTS `bagian`;
CREATE TABLE `bagian`  (
  `id_bagian` char(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bagian` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_bagian`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bagian
-- ----------------------------
INSERT INTO `bagian` VALUES ('B-0001', 'Swalayan');
INSERT INTO `bagian` VALUES ('B-0002', 'Alat Rumah Tangga');
INSERT INTO `bagian` VALUES ('B-0003', 'Kosmetik');
INSERT INTO `bagian` VALUES ('B-0004', 'Roti Basah');
INSERT INTO `bagian` VALUES ('B-0005', 'Alat Tulis');
INSERT INTO `bagian` VALUES ('B-0006', 'Gudang');
INSERT INTO `bagian` VALUES ('B-0007', 'Busana');
INSERT INTO `bagian` VALUES ('B-0008', 'Kasir');
INSERT INTO `bagian` VALUES ('B-0009', 'All');

-- ----------------------------
-- Table structure for bobot_penilaian
-- ----------------------------
DROP TABLE IF EXISTS `bobot_penilaian`;
CREATE TABLE `bobot_penilaian`  (
  `id_bobot` int NOT NULL AUTO_INCREMENT,
  `id_bagian` char(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jabatan` enum('manager','HRD','koordinator','karyawan') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_bobot`) USING BTREE,
  INDEX `FK_bobot_penilaian_bagian`(`id_bagian`) USING BTREE,
  CONSTRAINT `FK_bobot_penilaian_bagian` FOREIGN KEY (`id_bagian`) REFERENCES `bagian` (`id_bagian`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bobot_penilaian
-- ----------------------------
INSERT INTO `bobot_penilaian` VALUES (17, 'B-0001', 'koordinator', 1);
INSERT INTO `bobot_penilaian` VALUES (18, 'B-0001', 'karyawan', 1);
INSERT INTO `bobot_penilaian` VALUES (19, 'B-0002', 'koordinator', 1);
INSERT INTO `bobot_penilaian` VALUES (20, 'B-0002', 'karyawan', 1);
INSERT INTO `bobot_penilaian` VALUES (21, 'B-0003', 'koordinator', 1);
INSERT INTO `bobot_penilaian` VALUES (22, 'B-0003', 'karyawan', 1);
INSERT INTO `bobot_penilaian` VALUES (23, 'B-0004', 'koordinator', 1);
INSERT INTO `bobot_penilaian` VALUES (24, 'B-0004', 'karyawan', 1);
INSERT INTO `bobot_penilaian` VALUES (25, 'B-0005', 'koordinator', 1);
INSERT INTO `bobot_penilaian` VALUES (26, 'B-0005', 'karyawan', 1);
INSERT INTO `bobot_penilaian` VALUES (27, 'B-0006', 'koordinator', 1);
INSERT INTO `bobot_penilaian` VALUES (28, 'B-0006', 'karyawan', 1);
INSERT INTO `bobot_penilaian` VALUES (29, 'B-0007', 'koordinator', 1);
INSERT INTO `bobot_penilaian` VALUES (30, 'B-0007', 'karyawan', 1);
INSERT INTO `bobot_penilaian` VALUES (31, 'B-0008', 'koordinator', 1);
INSERT INTO `bobot_penilaian` VALUES (32, 'B-0008', 'karyawan', 1);

-- ----------------------------
-- Table structure for detail_bobot
-- ----------------------------
DROP TABLE IF EXISTS `detail_bobot`;
CREATE TABLE `detail_bobot`  (
  `id_detailbobot` int NOT NULL AUTO_INCREMENT,
  `id_bobot` int NULL DEFAULT NULL,
  `id_kriteria` char(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bobot` int NULL DEFAULT NULL,
  `akumulasi` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id_detailbobot`) USING BTREE,
  INDEX `FK_detail_bobot_bobot_penilaian`(`id_bobot`) USING BTREE,
  INDEX `FK_detail_bobot_kriteria`(`id_kriteria`) USING BTREE,
  CONSTRAINT `FK_detail_bobot_bobot_penilaian` FOREIGN KEY (`id_bobot`) REFERENCES `bobot_penilaian` (`id_bobot`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_detail_bobot_kriteria` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 261 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of detail_bobot
-- ----------------------------
INSERT INTO `detail_bobot` VALUES (101, 17, 'K-0001', 3, 7.50);
INSERT INTO `detail_bobot` VALUES (102, 17, 'K-0002', 4, 10.00);
INSERT INTO `detail_bobot` VALUES (103, 17, 'K-0003', 4, 10.00);
INSERT INTO `detail_bobot` VALUES (104, 17, 'K-0004', 5, 12.50);
INSERT INTO `detail_bobot` VALUES (105, 17, 'K-0005', 5, 12.50);
INSERT INTO `detail_bobot` VALUES (106, 17, 'K-0006', 4, 10.00);
INSERT INTO `detail_bobot` VALUES (107, 17, 'K-0007', 4, 10.00);
INSERT INTO `detail_bobot` VALUES (108, 17, 'K-0008', 4, 10.00);
INSERT INTO `detail_bobot` VALUES (109, 17, 'K-0009', 3, 7.50);
INSERT INTO `detail_bobot` VALUES (110, 17, 'K-0010', 4, 10.00);
INSERT INTO `detail_bobot` VALUES (111, 18, 'K-0001', 3, 7.50);
INSERT INTO `detail_bobot` VALUES (112, 18, 'K-0002', 4, 10.00);
INSERT INTO `detail_bobot` VALUES (113, 18, 'K-0003', 4, 10.00);
INSERT INTO `detail_bobot` VALUES (114, 18, 'K-0004', 5, 12.50);
INSERT INTO `detail_bobot` VALUES (115, 18, 'K-0005', 5, 12.50);
INSERT INTO `detail_bobot` VALUES (116, 18, 'K-0006', 4, 10.00);
INSERT INTO `detail_bobot` VALUES (117, 18, 'K-0007', 4, 10.00);
INSERT INTO `detail_bobot` VALUES (118, 18, 'K-0008', 4, 10.00);
INSERT INTO `detail_bobot` VALUES (119, 18, 'K-0009', 3, 7.50);
INSERT INTO `detail_bobot` VALUES (120, 18, 'K-0010', 4, 10.00);
INSERT INTO `detail_bobot` VALUES (121, 19, 'K-0001', 4, 10.00);
INSERT INTO `detail_bobot` VALUES (122, 19, 'K-0002', 3, 7.50);
INSERT INTO `detail_bobot` VALUES (123, 19, 'K-0003', 4, 10.00);
INSERT INTO `detail_bobot` VALUES (124, 19, 'K-0004', 5, 12.50);
INSERT INTO `detail_bobot` VALUES (125, 19, 'K-0005', 5, 12.50);
INSERT INTO `detail_bobot` VALUES (126, 19, 'K-0006', 4, 10.00);
INSERT INTO `detail_bobot` VALUES (127, 19, 'K-0007', 4, 10.00);
INSERT INTO `detail_bobot` VALUES (128, 19, 'K-0008', 4, 10.00);
INSERT INTO `detail_bobot` VALUES (129, 19, 'K-0009', 3, 7.50);
INSERT INTO `detail_bobot` VALUES (130, 19, 'K-0010', 4, 10.00);
INSERT INTO `detail_bobot` VALUES (131, 20, 'K-0001', 4, 10.00);
INSERT INTO `detail_bobot` VALUES (132, 20, 'K-0002', 3, 7.50);
INSERT INTO `detail_bobot` VALUES (133, 20, 'K-0003', 4, 10.00);
INSERT INTO `detail_bobot` VALUES (134, 20, 'K-0004', 5, 12.50);
INSERT INTO `detail_bobot` VALUES (135, 20, 'K-0005', 5, 12.50);
INSERT INTO `detail_bobot` VALUES (136, 20, 'K-0006', 4, 10.00);
INSERT INTO `detail_bobot` VALUES (137, 20, 'K-0007', 4, 10.00);
INSERT INTO `detail_bobot` VALUES (138, 20, 'K-0008', 4, 10.00);
INSERT INTO `detail_bobot` VALUES (139, 20, 'K-0009', 3, 7.50);
INSERT INTO `detail_bobot` VALUES (140, 20, 'K-0010', 4, 10.00);
INSERT INTO `detail_bobot` VALUES (141, 21, 'K-0001', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (142, 21, 'K-0002', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (143, 21, 'K-0003', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (144, 21, 'K-0004', 5, 11.90);
INSERT INTO `detail_bobot` VALUES (145, 21, 'K-0005', 5, 11.90);
INSERT INTO `detail_bobot` VALUES (146, 21, 'K-0006', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (147, 21, 'K-0007', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (148, 21, 'K-0008', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (149, 21, 'K-0009', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (150, 21, 'K-0010', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (151, 22, 'K-0001', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (152, 22, 'K-0002', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (153, 22, 'K-0003', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (154, 22, 'K-0004', 5, 11.90);
INSERT INTO `detail_bobot` VALUES (155, 22, 'K-0005', 5, 11.90);
INSERT INTO `detail_bobot` VALUES (156, 22, 'K-0006', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (157, 22, 'K-0007', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (158, 22, 'K-0008', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (159, 22, 'K-0009', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (160, 22, 'K-0010', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (161, 23, 'K-0001', 3, 7.50);
INSERT INTO `detail_bobot` VALUES (162, 23, 'K-0002', 4, 10.00);
INSERT INTO `detail_bobot` VALUES (163, 23, 'K-0003', 4, 10.00);
INSERT INTO `detail_bobot` VALUES (164, 23, 'K-0004', 5, 12.50);
INSERT INTO `detail_bobot` VALUES (165, 23, 'K-0005', 5, 12.50);
INSERT INTO `detail_bobot` VALUES (166, 23, 'K-0006', 4, 10.00);
INSERT INTO `detail_bobot` VALUES (167, 23, 'K-0007', 4, 10.00);
INSERT INTO `detail_bobot` VALUES (168, 23, 'K-0008', 3, 7.50);
INSERT INTO `detail_bobot` VALUES (169, 23, 'K-0009', 4, 10.00);
INSERT INTO `detail_bobot` VALUES (170, 23, 'K-0010', 4, 10.00);
INSERT INTO `detail_bobot` VALUES (171, 24, 'K-0001', 3, 7.50);
INSERT INTO `detail_bobot` VALUES (172, 24, 'K-0002', 4, 10.00);
INSERT INTO `detail_bobot` VALUES (173, 24, 'K-0003', 4, 10.00);
INSERT INTO `detail_bobot` VALUES (174, 24, 'K-0004', 5, 12.50);
INSERT INTO `detail_bobot` VALUES (175, 24, 'K-0005', 5, 12.50);
INSERT INTO `detail_bobot` VALUES (176, 24, 'K-0006', 4, 10.00);
INSERT INTO `detail_bobot` VALUES (177, 24, 'K-0007', 4, 10.00);
INSERT INTO `detail_bobot` VALUES (178, 24, 'K-0008', 3, 7.50);
INSERT INTO `detail_bobot` VALUES (179, 24, 'K-0009', 4, 10.00);
INSERT INTO `detail_bobot` VALUES (180, 24, 'K-0010', 4, 10.00);
INSERT INTO `detail_bobot` VALUES (181, 25, 'K-0001', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (182, 25, 'K-0002', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (183, 25, 'K-0003', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (184, 25, 'K-0004', 5, 11.90);
INSERT INTO `detail_bobot` VALUES (185, 25, 'K-0005', 5, 11.90);
INSERT INTO `detail_bobot` VALUES (186, 25, 'K-0006', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (187, 25, 'K-0007', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (188, 25, 'K-0008', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (189, 25, 'K-0009', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (190, 25, 'K-0010', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (191, 26, 'K-0001', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (192, 26, 'K-0002', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (193, 26, 'K-0003', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (194, 26, 'K-0004', 5, 11.90);
INSERT INTO `detail_bobot` VALUES (195, 26, 'K-0005', 5, 11.90);
INSERT INTO `detail_bobot` VALUES (196, 26, 'K-0006', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (197, 26, 'K-0007', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (198, 26, 'K-0008', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (199, 26, 'K-0009', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (200, 26, 'K-0010', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (201, 27, 'K-0001', 3, 7.14);
INSERT INTO `detail_bobot` VALUES (202, 27, 'K-0002', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (203, 27, 'K-0003', 5, 11.90);
INSERT INTO `detail_bobot` VALUES (204, 27, 'K-0004', 5, 11.90);
INSERT INTO `detail_bobot` VALUES (205, 27, 'K-0005', 5, 11.90);
INSERT INTO `detail_bobot` VALUES (206, 27, 'K-0006', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (207, 27, 'K-0007', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (208, 27, 'K-0008', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (209, 27, 'K-0009', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (210, 27, 'K-0010', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (211, 28, 'K-0001', 3, 7.14);
INSERT INTO `detail_bobot` VALUES (212, 28, 'K-0002', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (213, 28, 'K-0003', 5, 11.90);
INSERT INTO `detail_bobot` VALUES (214, 28, 'K-0004', 5, 11.90);
INSERT INTO `detail_bobot` VALUES (215, 28, 'K-0005', 5, 11.90);
INSERT INTO `detail_bobot` VALUES (216, 28, 'K-0006', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (217, 28, 'K-0007', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (218, 28, 'K-0008', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (219, 28, 'K-0009', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (220, 28, 'K-0010', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (221, 29, 'K-0001', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (222, 29, 'K-0002', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (223, 29, 'K-0003', 5, 11.90);
INSERT INTO `detail_bobot` VALUES (224, 29, 'K-0004', 5, 11.90);
INSERT INTO `detail_bobot` VALUES (225, 29, 'K-0005', 5, 11.90);
INSERT INTO `detail_bobot` VALUES (226, 29, 'K-0006', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (227, 29, 'K-0007', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (228, 29, 'K-0008', 3, 7.14);
INSERT INTO `detail_bobot` VALUES (229, 29, 'K-0009', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (230, 29, 'K-0010', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (231, 30, 'K-0001', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (232, 30, 'K-0002', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (233, 30, 'K-0003', 5, 11.90);
INSERT INTO `detail_bobot` VALUES (234, 30, 'K-0004', 5, 11.90);
INSERT INTO `detail_bobot` VALUES (235, 30, 'K-0005', 5, 11.90);
INSERT INTO `detail_bobot` VALUES (236, 30, 'K-0006', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (237, 30, 'K-0007', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (238, 30, 'K-0008', 3, 7.14);
INSERT INTO `detail_bobot` VALUES (239, 30, 'K-0009', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (240, 30, 'K-0010', 4, 9.52);
INSERT INTO `detail_bobot` VALUES (241, 31, 'K-0001', 4, 10.00);
INSERT INTO `detail_bobot` VALUES (242, 31, 'K-0002', 4, 10.00);
INSERT INTO `detail_bobot` VALUES (243, 31, 'K-0003', 3, 7.50);
INSERT INTO `detail_bobot` VALUES (244, 31, 'K-0004', 5, 12.50);
INSERT INTO `detail_bobot` VALUES (245, 31, 'K-0005', 5, 12.50);
INSERT INTO `detail_bobot` VALUES (246, 31, 'K-0006', 4, 10.00);
INSERT INTO `detail_bobot` VALUES (247, 31, 'K-0007', 4, 10.00);
INSERT INTO `detail_bobot` VALUES (248, 31, 'K-0008', 4, 10.00);
INSERT INTO `detail_bobot` VALUES (249, 31, 'K-0009', 3, 7.50);
INSERT INTO `detail_bobot` VALUES (250, 31, 'K-0010', 4, 10.00);
INSERT INTO `detail_bobot` VALUES (251, 32, 'K-0001', 4, 10.00);
INSERT INTO `detail_bobot` VALUES (252, 32, 'K-0002', 4, 10.00);
INSERT INTO `detail_bobot` VALUES (253, 32, 'K-0003', 3, 7.50);
INSERT INTO `detail_bobot` VALUES (254, 32, 'K-0004', 5, 12.50);
INSERT INTO `detail_bobot` VALUES (255, 32, 'K-0005', 5, 12.50);
INSERT INTO `detail_bobot` VALUES (256, 32, 'K-0006', 4, 10.00);
INSERT INTO `detail_bobot` VALUES (257, 32, 'K-0007', 4, 10.00);
INSERT INTO `detail_bobot` VALUES (258, 32, 'K-0008', 4, 10.00);
INSERT INTO `detail_bobot` VALUES (259, 32, 'K-0009', 3, 7.50);
INSERT INTO `detail_bobot` VALUES (260, 32, 'K-0010', 4, 10.00);

-- ----------------------------
-- Table structure for detail_penilaian
-- ----------------------------
DROP TABLE IF EXISTS `detail_penilaian`;
CREATE TABLE `detail_penilaian`  (
  `id_detailnilai` int NOT NULL AUTO_INCREMENT,
  `id_nilai` int NULL DEFAULT NULL,
  `id_detailbobot` int NULL DEFAULT NULL,
  `nilai` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_detailnilai`) USING BTREE,
  INDEX `FK_detail_penilaian_penilaian`(`id_nilai`) USING BTREE,
  INDEX `FK_detail_penilaian_detail_bobot`(`id_detailbobot`) USING BTREE,
  CONSTRAINT `FK_detail_penilaian_detail_bobot` FOREIGN KEY (`id_detailbobot`) REFERENCES `detail_bobot` (`id_detailbobot`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_detail_penilaian_penilaian` FOREIGN KEY (`id_nilai`) REFERENCES `penilaian` (`id_nilai`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1673 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of detail_penilaian
-- ----------------------------
INSERT INTO `detail_penilaian` VALUES (194, 26, 241, 70);
INSERT INTO `detail_penilaian` VALUES (195, 26, 242, 75);
INSERT INTO `detail_penilaian` VALUES (196, 26, 243, 2);
INSERT INTO `detail_penilaian` VALUES (197, 26, 244, 80);
INSERT INTO `detail_penilaian` VALUES (198, 26, 245, 80);
INSERT INTO `detail_penilaian` VALUES (199, 26, 246, 85);
INSERT INTO `detail_penilaian` VALUES (200, 26, 247, 80);
INSERT INTO `detail_penilaian` VALUES (201, 26, 248, 70);
INSERT INTO `detail_penilaian` VALUES (202, 26, 249, 65);
INSERT INTO `detail_penilaian` VALUES (203, 26, 250, 85);
INSERT INTO `detail_penilaian` VALUES (204, 27, 251, 65);
INSERT INTO `detail_penilaian` VALUES (205, 27, 252, 80);
INSERT INTO `detail_penilaian` VALUES (206, 27, 253, 2);
INSERT INTO `detail_penilaian` VALUES (207, 27, 254, 75);
INSERT INTO `detail_penilaian` VALUES (208, 27, 255, 80);
INSERT INTO `detail_penilaian` VALUES (209, 27, 256, 70);
INSERT INTO `detail_penilaian` VALUES (210, 27, 257, 80);
INSERT INTO `detail_penilaian` VALUES (211, 27, 258, 65);
INSERT INTO `detail_penilaian` VALUES (212, 27, 259, 85);
INSERT INTO `detail_penilaian` VALUES (213, 27, 260, 80);
INSERT INTO `detail_penilaian` VALUES (214, 28, 251, 85);
INSERT INTO `detail_penilaian` VALUES (215, 28, 252, 70);
INSERT INTO `detail_penilaian` VALUES (216, 28, 253, 1);
INSERT INTO `detail_penilaian` VALUES (217, 28, 254, 70);
INSERT INTO `detail_penilaian` VALUES (218, 28, 255, 75);
INSERT INTO `detail_penilaian` VALUES (219, 28, 256, 70);
INSERT INTO `detail_penilaian` VALUES (220, 28, 257, 85);
INSERT INTO `detail_penilaian` VALUES (221, 28, 258, 75);
INSERT INTO `detail_penilaian` VALUES (222, 28, 259, 85);
INSERT INTO `detail_penilaian` VALUES (223, 28, 260, 70);
INSERT INTO `detail_penilaian` VALUES (224, 29, 251, 75);
INSERT INTO `detail_penilaian` VALUES (225, 29, 252, 80);
INSERT INTO `detail_penilaian` VALUES (226, 29, 253, 1);
INSERT INTO `detail_penilaian` VALUES (227, 29, 254, 75);
INSERT INTO `detail_penilaian` VALUES (228, 29, 255, 75);
INSERT INTO `detail_penilaian` VALUES (229, 29, 256, 80);
INSERT INTO `detail_penilaian` VALUES (230, 29, 257, 75);
INSERT INTO `detail_penilaian` VALUES (231, 29, 258, 70);
INSERT INTO `detail_penilaian` VALUES (232, 29, 259, 85);
INSERT INTO `detail_penilaian` VALUES (233, 29, 260, 60);
INSERT INTO `detail_penilaian` VALUES (234, 30, 251, 80);
INSERT INTO `detail_penilaian` VALUES (235, 30, 252, 75);
INSERT INTO `detail_penilaian` VALUES (236, 30, 253, 3);
INSERT INTO `detail_penilaian` VALUES (237, 30, 254, 85);
INSERT INTO `detail_penilaian` VALUES (238, 30, 255, 70);
INSERT INTO `detail_penilaian` VALUES (239, 30, 256, 75);
INSERT INTO `detail_penilaian` VALUES (240, 30, 257, 70);
INSERT INTO `detail_penilaian` VALUES (241, 30, 258, 75);
INSERT INTO `detail_penilaian` VALUES (242, 30, 259, 65);
INSERT INTO `detail_penilaian` VALUES (243, 30, 260, 75);
INSERT INTO `detail_penilaian` VALUES (244, 31, 121, 75);
INSERT INTO `detail_penilaian` VALUES (245, 31, 122, 80);
INSERT INTO `detail_penilaian` VALUES (246, 31, 123, 1);
INSERT INTO `detail_penilaian` VALUES (247, 31, 124, 75);
INSERT INTO `detail_penilaian` VALUES (248, 31, 125, 75);
INSERT INTO `detail_penilaian` VALUES (249, 31, 126, 90);
INSERT INTO `detail_penilaian` VALUES (250, 31, 127, 75);
INSERT INTO `detail_penilaian` VALUES (251, 31, 128, 85);
INSERT INTO `detail_penilaian` VALUES (252, 31, 129, 85);
INSERT INTO `detail_penilaian` VALUES (253, 31, 130, 75);
INSERT INTO `detail_penilaian` VALUES (254, 32, 131, 70);
INSERT INTO `detail_penilaian` VALUES (255, 32, 132, 65);
INSERT INTO `detail_penilaian` VALUES (256, 32, 133, 2);
INSERT INTO `detail_penilaian` VALUES (257, 32, 134, 80);
INSERT INTO `detail_penilaian` VALUES (258, 32, 135, 80);
INSERT INTO `detail_penilaian` VALUES (259, 32, 136, 65);
INSERT INTO `detail_penilaian` VALUES (260, 32, 137, 80);
INSERT INTO `detail_penilaian` VALUES (261, 32, 138, 70);
INSERT INTO `detail_penilaian` VALUES (262, 32, 139, 75);
INSERT INTO `detail_penilaian` VALUES (263, 32, 140, 85);
INSERT INTO `detail_penilaian` VALUES (264, 33, 131, 65);
INSERT INTO `detail_penilaian` VALUES (265, 33, 132, 70);
INSERT INTO `detail_penilaian` VALUES (266, 33, 133, 1);
INSERT INTO `detail_penilaian` VALUES (267, 33, 134, 70);
INSERT INTO `detail_penilaian` VALUES (268, 33, 135, 65);
INSERT INTO `detail_penilaian` VALUES (269, 33, 136, 70);
INSERT INTO `detail_penilaian` VALUES (270, 33, 137, 85);
INSERT INTO `detail_penilaian` VALUES (271, 33, 138, 80);
INSERT INTO `detail_penilaian` VALUES (272, 33, 139, 85);
INSERT INTO `detail_penilaian` VALUES (273, 33, 140, 65);
INSERT INTO `detail_penilaian` VALUES (274, 34, 131, 80);
INSERT INTO `detail_penilaian` VALUES (275, 34, 132, 75);
INSERT INTO `detail_penilaian` VALUES (276, 34, 133, 3);
INSERT INTO `detail_penilaian` VALUES (277, 34, 134, 85);
INSERT INTO `detail_penilaian` VALUES (278, 34, 135, 70);
INSERT INTO `detail_penilaian` VALUES (279, 34, 136, 85);
INSERT INTO `detail_penilaian` VALUES (280, 34, 137, 70);
INSERT INTO `detail_penilaian` VALUES (281, 34, 138, 75);
INSERT INTO `detail_penilaian` VALUES (282, 34, 139, 75);
INSERT INTO `detail_penilaian` VALUES (283, 34, 140, 75);
INSERT INTO `detail_penilaian` VALUES (284, 35, 131, 65);
INSERT INTO `detail_penilaian` VALUES (285, 35, 132, 80);
INSERT INTO `detail_penilaian` VALUES (286, 35, 133, 2);
INSERT INTO `detail_penilaian` VALUES (287, 35, 134, 75);
INSERT INTO `detail_penilaian` VALUES (288, 35, 135, 80);
INSERT INTO `detail_penilaian` VALUES (289, 35, 136, 70);
INSERT INTO `detail_penilaian` VALUES (290, 35, 137, 80);
INSERT INTO `detail_penilaian` VALUES (291, 35, 138, 65);
INSERT INTO `detail_penilaian` VALUES (292, 35, 139, 85);
INSERT INTO `detail_penilaian` VALUES (293, 35, 140, 80);
INSERT INTO `detail_penilaian` VALUES (294, 36, 141, 75);
INSERT INTO `detail_penilaian` VALUES (295, 36, 142, 80);
INSERT INTO `detail_penilaian` VALUES (296, 36, 143, 1);
INSERT INTO `detail_penilaian` VALUES (297, 36, 144, 75);
INSERT INTO `detail_penilaian` VALUES (298, 36, 145, 75);
INSERT INTO `detail_penilaian` VALUES (299, 36, 146, 80);
INSERT INTO `detail_penilaian` VALUES (300, 36, 147, 80);
INSERT INTO `detail_penilaian` VALUES (301, 36, 148, 85);
INSERT INTO `detail_penilaian` VALUES (302, 36, 149, 85);
INSERT INTO `detail_penilaian` VALUES (303, 36, 150, 80);
INSERT INTO `detail_penilaian` VALUES (304, 37, 151, 70);
INSERT INTO `detail_penilaian` VALUES (305, 37, 152, 70);
INSERT INTO `detail_penilaian` VALUES (306, 37, 153, 2);
INSERT INTO `detail_penilaian` VALUES (307, 37, 154, 60);
INSERT INTO `detail_penilaian` VALUES (308, 37, 155, 80);
INSERT INTO `detail_penilaian` VALUES (309, 37, 156, 65);
INSERT INTO `detail_penilaian` VALUES (310, 37, 157, 80);
INSERT INTO `detail_penilaian` VALUES (311, 37, 158, 70);
INSERT INTO `detail_penilaian` VALUES (312, 37, 159, 60);
INSERT INTO `detail_penilaian` VALUES (313, 37, 160, 85);
INSERT INTO `detail_penilaian` VALUES (314, 38, 151, 70);
INSERT INTO `detail_penilaian` VALUES (315, 38, 152, 70);
INSERT INTO `detail_penilaian` VALUES (316, 38, 153, 1);
INSERT INTO `detail_penilaian` VALUES (317, 38, 154, 70);
INSERT INTO `detail_penilaian` VALUES (318, 38, 155, 70);
INSERT INTO `detail_penilaian` VALUES (319, 38, 156, 70);
INSERT INTO `detail_penilaian` VALUES (320, 38, 157, 85);
INSERT INTO `detail_penilaian` VALUES (321, 38, 158, 60);
INSERT INTO `detail_penilaian` VALUES (322, 38, 159, 85);
INSERT INTO `detail_penilaian` VALUES (323, 38, 160, 65);
INSERT INTO `detail_penilaian` VALUES (324, 39, 151, 80);
INSERT INTO `detail_penilaian` VALUES (325, 39, 152, 75);
INSERT INTO `detail_penilaian` VALUES (326, 39, 153, 3);
INSERT INTO `detail_penilaian` VALUES (327, 39, 154, 85);
INSERT INTO `detail_penilaian` VALUES (328, 39, 155, 70);
INSERT INTO `detail_penilaian` VALUES (329, 39, 156, 85);
INSERT INTO `detail_penilaian` VALUES (330, 39, 157, 70);
INSERT INTO `detail_penilaian` VALUES (331, 39, 158, 75);
INSERT INTO `detail_penilaian` VALUES (332, 39, 159, 65);
INSERT INTO `detail_penilaian` VALUES (333, 39, 160, 75);
INSERT INTO `detail_penilaian` VALUES (334, 40, 151, 70);
INSERT INTO `detail_penilaian` VALUES (335, 40, 152, 80);
INSERT INTO `detail_penilaian` VALUES (336, 40, 153, 2);
INSERT INTO `detail_penilaian` VALUES (337, 40, 154, 75);
INSERT INTO `detail_penilaian` VALUES (338, 40, 155, 70);
INSERT INTO `detail_penilaian` VALUES (339, 40, 156, 70);
INSERT INTO `detail_penilaian` VALUES (340, 40, 157, 80);
INSERT INTO `detail_penilaian` VALUES (341, 40, 158, 80);
INSERT INTO `detail_penilaian` VALUES (342, 40, 159, 85);
INSERT INTO `detail_penilaian` VALUES (343, 40, 160, 65);
INSERT INTO `detail_penilaian` VALUES (344, 41, 161, 75);
INSERT INTO `detail_penilaian` VALUES (345, 41, 162, 80);
INSERT INTO `detail_penilaian` VALUES (346, 41, 163, 1);
INSERT INTO `detail_penilaian` VALUES (347, 41, 164, 75);
INSERT INTO `detail_penilaian` VALUES (348, 41, 165, 75);
INSERT INTO `detail_penilaian` VALUES (349, 41, 166, 60);
INSERT INTO `detail_penilaian` VALUES (350, 41, 167, 75);
INSERT INTO `detail_penilaian` VALUES (351, 41, 168, 85);
INSERT INTO `detail_penilaian` VALUES (352, 41, 169, 85);
INSERT INTO `detail_penilaian` VALUES (353, 41, 170, 80);
INSERT INTO `detail_penilaian` VALUES (354, 42, 171, 70);
INSERT INTO `detail_penilaian` VALUES (355, 42, 172, 85);
INSERT INTO `detail_penilaian` VALUES (356, 42, 173, 2);
INSERT INTO `detail_penilaian` VALUES (357, 42, 174, 60);
INSERT INTO `detail_penilaian` VALUES (358, 42, 175, 80);
INSERT INTO `detail_penilaian` VALUES (359, 42, 176, 85);
INSERT INTO `detail_penilaian` VALUES (360, 42, 177, 80);
INSERT INTO `detail_penilaian` VALUES (361, 42, 178, 70);
INSERT INTO `detail_penilaian` VALUES (362, 42, 179, 85);
INSERT INTO `detail_penilaian` VALUES (363, 42, 180, 85);
INSERT INTO `detail_penilaian` VALUES (364, 43, 171, 60);
INSERT INTO `detail_penilaian` VALUES (365, 43, 172, 70);
INSERT INTO `detail_penilaian` VALUES (366, 43, 173, 3);
INSERT INTO `detail_penilaian` VALUES (367, 43, 174, 70);
INSERT INTO `detail_penilaian` VALUES (368, 43, 175, 85);
INSERT INTO `detail_penilaian` VALUES (369, 43, 176, 70);
INSERT INTO `detail_penilaian` VALUES (370, 43, 177, 85);
INSERT INTO `detail_penilaian` VALUES (371, 43, 178, 80);
INSERT INTO `detail_penilaian` VALUES (372, 43, 179, 85);
INSERT INTO `detail_penilaian` VALUES (373, 43, 180, 60);
INSERT INTO `detail_penilaian` VALUES (374, 44, 171, 80);
INSERT INTO `detail_penilaian` VALUES (375, 44, 172, 75);
INSERT INTO `detail_penilaian` VALUES (376, 44, 173, 3);
INSERT INTO `detail_penilaian` VALUES (377, 44, 174, 85);
INSERT INTO `detail_penilaian` VALUES (378, 44, 175, 70);
INSERT INTO `detail_penilaian` VALUES (379, 44, 176, 85);
INSERT INTO `detail_penilaian` VALUES (380, 44, 177, 70);
INSERT INTO `detail_penilaian` VALUES (381, 44, 178, 75);
INSERT INTO `detail_penilaian` VALUES (382, 44, 179, 60);
INSERT INTO `detail_penilaian` VALUES (383, 44, 180, 75);
INSERT INTO `detail_penilaian` VALUES (384, 45, 171, 60);
INSERT INTO `detail_penilaian` VALUES (385, 45, 172, 80);
INSERT INTO `detail_penilaian` VALUES (386, 45, 173, 2);
INSERT INTO `detail_penilaian` VALUES (387, 45, 174, 75);
INSERT INTO `detail_penilaian` VALUES (388, 45, 175, 70);
INSERT INTO `detail_penilaian` VALUES (389, 45, 176, 70);
INSERT INTO `detail_penilaian` VALUES (390, 45, 177, 80);
INSERT INTO `detail_penilaian` VALUES (391, 45, 178, 60);
INSERT INTO `detail_penilaian` VALUES (392, 45, 179, 85);
INSERT INTO `detail_penilaian` VALUES (393, 45, 180, 80);
INSERT INTO `detail_penilaian` VALUES (394, 46, 181, 75);
INSERT INTO `detail_penilaian` VALUES (395, 46, 182, 85);
INSERT INTO `detail_penilaian` VALUES (396, 46, 183, 1);
INSERT INTO `detail_penilaian` VALUES (397, 46, 184, 75);
INSERT INTO `detail_penilaian` VALUES (398, 46, 185, 75);
INSERT INTO `detail_penilaian` VALUES (399, 46, 186, 66);
INSERT INTO `detail_penilaian` VALUES (400, 46, 187, 80);
INSERT INTO `detail_penilaian` VALUES (401, 46, 188, 66);
INSERT INTO `detail_penilaian` VALUES (402, 46, 189, 75);
INSERT INTO `detail_penilaian` VALUES (403, 46, 190, 75);
INSERT INTO `detail_penilaian` VALUES (404, 47, 191, 70);
INSERT INTO `detail_penilaian` VALUES (405, 47, 192, 78);
INSERT INTO `detail_penilaian` VALUES (406, 47, 193, 2);
INSERT INTO `detail_penilaian` VALUES (407, 47, 194, 80);
INSERT INTO `detail_penilaian` VALUES (408, 47, 195, 80);
INSERT INTO `detail_penilaian` VALUES (409, 47, 196, 77);
INSERT INTO `detail_penilaian` VALUES (410, 47, 197, 88);
INSERT INTO `detail_penilaian` VALUES (411, 47, 198, 70);
INSERT INTO `detail_penilaian` VALUES (412, 47, 199, 85);
INSERT INTO `detail_penilaian` VALUES (413, 47, 200, 70);
INSERT INTO `detail_penilaian` VALUES (414, 48, 191, 85);
INSERT INTO `detail_penilaian` VALUES (415, 48, 192, 80);
INSERT INTO `detail_penilaian` VALUES (416, 48, 193, 1);
INSERT INTO `detail_penilaian` VALUES (417, 48, 194, 70);
INSERT INTO `detail_penilaian` VALUES (418, 48, 195, 85);
INSERT INTO `detail_penilaian` VALUES (419, 48, 196, 70);
INSERT INTO `detail_penilaian` VALUES (420, 48, 197, 75);
INSERT INTO `detail_penilaian` VALUES (421, 48, 198, 85);
INSERT INTO `detail_penilaian` VALUES (422, 48, 199, 70);
INSERT INTO `detail_penilaian` VALUES (423, 48, 200, 65);
INSERT INTO `detail_penilaian` VALUES (424, 49, 191, 80);
INSERT INTO `detail_penilaian` VALUES (425, 49, 192, 70);
INSERT INTO `detail_penilaian` VALUES (426, 49, 193, 3);
INSERT INTO `detail_penilaian` VALUES (427, 49, 194, 85);
INSERT INTO `detail_penilaian` VALUES (428, 49, 195, 70);
INSERT INTO `detail_penilaian` VALUES (429, 49, 196, 80);
INSERT INTO `detail_penilaian` VALUES (430, 49, 197, 70);
INSERT INTO `detail_penilaian` VALUES (431, 49, 198, 80);
INSERT INTO `detail_penilaian` VALUES (432, 49, 199, 80);
INSERT INTO `detail_penilaian` VALUES (433, 49, 200, 75);
INSERT INTO `detail_penilaian` VALUES (434, 50, 191, 80);
INSERT INTO `detail_penilaian` VALUES (435, 50, 192, 80);
INSERT INTO `detail_penilaian` VALUES (436, 50, 193, 2);
INSERT INTO `detail_penilaian` VALUES (437, 50, 194, 75);
INSERT INTO `detail_penilaian` VALUES (438, 50, 195, 80);
INSERT INTO `detail_penilaian` VALUES (439, 50, 196, 70);
INSERT INTO `detail_penilaian` VALUES (440, 50, 197, 85);
INSERT INTO `detail_penilaian` VALUES (441, 50, 198, 77);
INSERT INTO `detail_penilaian` VALUES (442, 50, 199, 85);
INSERT INTO `detail_penilaian` VALUES (443, 50, 200, 80);
INSERT INTO `detail_penilaian` VALUES (444, 51, 201, 80);
INSERT INTO `detail_penilaian` VALUES (445, 51, 202, 80);
INSERT INTO `detail_penilaian` VALUES (446, 51, 203, 1);
INSERT INTO `detail_penilaian` VALUES (447, 51, 204, 85);
INSERT INTO `detail_penilaian` VALUES (448, 51, 205, 75);
INSERT INTO `detail_penilaian` VALUES (449, 51, 206, 70);
INSERT INTO `detail_penilaian` VALUES (450, 51, 207, 75);
INSERT INTO `detail_penilaian` VALUES (451, 51, 208, 80);
INSERT INTO `detail_penilaian` VALUES (452, 51, 209, 75);
INSERT INTO `detail_penilaian` VALUES (453, 51, 210, 80);
INSERT INTO `detail_penilaian` VALUES (454, 52, 211, 75);
INSERT INTO `detail_penilaian` VALUES (455, 52, 212, 85);
INSERT INTO `detail_penilaian` VALUES (456, 52, 213, 2);
INSERT INTO `detail_penilaian` VALUES (457, 52, 214, 70);
INSERT INTO `detail_penilaian` VALUES (458, 52, 215, 80);
INSERT INTO `detail_penilaian` VALUES (459, 52, 216, 80);
INSERT INTO `detail_penilaian` VALUES (460, 52, 217, 80);
INSERT INTO `detail_penilaian` VALUES (461, 52, 218, 75);
INSERT INTO `detail_penilaian` VALUES (462, 52, 219, 85);
INSERT INTO `detail_penilaian` VALUES (463, 52, 220, 85);
INSERT INTO `detail_penilaian` VALUES (474, 54, 211, 75);
INSERT INTO `detail_penilaian` VALUES (475, 54, 212, 75);
INSERT INTO `detail_penilaian` VALUES (476, 54, 214, 85);
INSERT INTO `detail_penilaian` VALUES (477, 54, 215, 70);
INSERT INTO `detail_penilaian` VALUES (478, 54, 216, 85);
INSERT INTO `detail_penilaian` VALUES (479, 54, 217, 70);
INSERT INTO `detail_penilaian` VALUES (480, 54, 218, 80);
INSERT INTO `detail_penilaian` VALUES (481, 54, 219, 85);
INSERT INTO `detail_penilaian` VALUES (482, 54, 220, 75);
INSERT INTO `detail_penilaian` VALUES (483, 55, 211, 80);
INSERT INTO `detail_penilaian` VALUES (484, 55, 212, 80);
INSERT INTO `detail_penilaian` VALUES (485, 55, 213, 2);
INSERT INTO `detail_penilaian` VALUES (486, 55, 214, 80);
INSERT INTO `detail_penilaian` VALUES (487, 55, 215, 80);
INSERT INTO `detail_penilaian` VALUES (488, 55, 216, 80);
INSERT INTO `detail_penilaian` VALUES (489, 55, 217, 80);
INSERT INTO `detail_penilaian` VALUES (490, 55, 218, 70);
INSERT INTO `detail_penilaian` VALUES (491, 55, 219, 70);
INSERT INTO `detail_penilaian` VALUES (492, 55, 220, 80);
INSERT INTO `detail_penilaian` VALUES (493, 56, 221, 75);
INSERT INTO `detail_penilaian` VALUES (494, 56, 222, 80);
INSERT INTO `detail_penilaian` VALUES (495, 56, 223, 1);
INSERT INTO `detail_penilaian` VALUES (496, 56, 224, 75);
INSERT INTO `detail_penilaian` VALUES (497, 56, 225, 75);
INSERT INTO `detail_penilaian` VALUES (498, 56, 226, 80);
INSERT INTO `detail_penilaian` VALUES (499, 56, 227, 75);
INSERT INTO `detail_penilaian` VALUES (500, 56, 228, 85);
INSERT INTO `detail_penilaian` VALUES (501, 56, 229, 85);
INSERT INTO `detail_penilaian` VALUES (502, 56, 230, 80);
INSERT INTO `detail_penilaian` VALUES (503, 57, 231, 70);
INSERT INTO `detail_penilaian` VALUES (504, 57, 232, 85);
INSERT INTO `detail_penilaian` VALUES (505, 57, 233, 2);
INSERT INTO `detail_penilaian` VALUES (506, 57, 234, 80);
INSERT INTO `detail_penilaian` VALUES (507, 57, 235, 80);
INSERT INTO `detail_penilaian` VALUES (508, 57, 236, 85);
INSERT INTO `detail_penilaian` VALUES (509, 57, 237, 80);
INSERT INTO `detail_penilaian` VALUES (510, 57, 238, 70);
INSERT INTO `detail_penilaian` VALUES (511, 57, 239, 85);
INSERT INTO `detail_penilaian` VALUES (512, 57, 240, 85);
INSERT INTO `detail_penilaian` VALUES (523, 59, 231, 80);
INSERT INTO `detail_penilaian` VALUES (524, 59, 232, 75);
INSERT INTO `detail_penilaian` VALUES (525, 59, 233, 3);
INSERT INTO `detail_penilaian` VALUES (526, 59, 234, 85);
INSERT INTO `detail_penilaian` VALUES (527, 59, 235, 70);
INSERT INTO `detail_penilaian` VALUES (528, 59, 236, 85);
INSERT INTO `detail_penilaian` VALUES (529, 59, 237, 70);
INSERT INTO `detail_penilaian` VALUES (530, 59, 238, 75);
INSERT INTO `detail_penilaian` VALUES (531, 59, 239, 85);
INSERT INTO `detail_penilaian` VALUES (532, 59, 240, 75);
INSERT INTO `detail_penilaian` VALUES (533, 60, 231, 80);
INSERT INTO `detail_penilaian` VALUES (534, 60, 232, 80);
INSERT INTO `detail_penilaian` VALUES (535, 60, 233, 2);
INSERT INTO `detail_penilaian` VALUES (536, 60, 234, 75);
INSERT INTO `detail_penilaian` VALUES (537, 60, 235, 80);
INSERT INTO `detail_penilaian` VALUES (538, 60, 236, 70);
INSERT INTO `detail_penilaian` VALUES (539, 60, 237, 80);
INSERT INTO `detail_penilaian` VALUES (540, 60, 238, 80);
INSERT INTO `detail_penilaian` VALUES (541, 60, 239, 85);
INSERT INTO `detail_penilaian` VALUES (542, 60, 240, 80);
INSERT INTO `detail_penilaian` VALUES (543, 61, 101, 75);
INSERT INTO `detail_penilaian` VALUES (544, 61, 102, 80);
INSERT INTO `detail_penilaian` VALUES (545, 61, 103, 1);
INSERT INTO `detail_penilaian` VALUES (546, 61, 104, 75);
INSERT INTO `detail_penilaian` VALUES (547, 61, 105, 75);
INSERT INTO `detail_penilaian` VALUES (548, 61, 106, 80);
INSERT INTO `detail_penilaian` VALUES (549, 61, 107, 75);
INSERT INTO `detail_penilaian` VALUES (550, 61, 108, 85);
INSERT INTO `detail_penilaian` VALUES (551, 61, 109, 85);
INSERT INTO `detail_penilaian` VALUES (552, 61, 110, 60);
INSERT INTO `detail_penilaian` VALUES (553, 62, 111, 70);
INSERT INTO `detail_penilaian` VALUES (554, 62, 112, 75);
INSERT INTO `detail_penilaian` VALUES (555, 62, 113, 2);
INSERT INTO `detail_penilaian` VALUES (556, 62, 114, 80);
INSERT INTO `detail_penilaian` VALUES (557, 62, 115, 80);
INSERT INTO `detail_penilaian` VALUES (558, 62, 116, 65);
INSERT INTO `detail_penilaian` VALUES (559, 62, 117, 80);
INSERT INTO `detail_penilaian` VALUES (560, 62, 118, 70);
INSERT INTO `detail_penilaian` VALUES (561, 62, 119, 60);
INSERT INTO `detail_penilaian` VALUES (562, 62, 120, 85);
INSERT INTO `detail_penilaian` VALUES (563, 63, 111, 85);
INSERT INTO `detail_penilaian` VALUES (564, 63, 112, 70);
INSERT INTO `detail_penilaian` VALUES (565, 63, 113, 1);
INSERT INTO `detail_penilaian` VALUES (566, 63, 114, 70);
INSERT INTO `detail_penilaian` VALUES (567, 63, 115, 85);
INSERT INTO `detail_penilaian` VALUES (568, 63, 116, 70);
INSERT INTO `detail_penilaian` VALUES (569, 63, 117, 60);
INSERT INTO `detail_penilaian` VALUES (570, 63, 118, 80);
INSERT INTO `detail_penilaian` VALUES (571, 63, 119, 85);
INSERT INTO `detail_penilaian` VALUES (572, 63, 120, 70);
INSERT INTO `detail_penilaian` VALUES (573, 64, 111, 55);
INSERT INTO `detail_penilaian` VALUES (574, 64, 112, 75);
INSERT INTO `detail_penilaian` VALUES (575, 64, 113, 3);
INSERT INTO `detail_penilaian` VALUES (576, 64, 114, 85);
INSERT INTO `detail_penilaian` VALUES (577, 64, 115, 70);
INSERT INTO `detail_penilaian` VALUES (578, 64, 116, 85);
INSERT INTO `detail_penilaian` VALUES (579, 64, 117, 70);
INSERT INTO `detail_penilaian` VALUES (580, 64, 118, 75);
INSERT INTO `detail_penilaian` VALUES (581, 64, 119, 60);
INSERT INTO `detail_penilaian` VALUES (582, 64, 120, 75);
INSERT INTO `detail_penilaian` VALUES (583, 65, 111, 80);
INSERT INTO `detail_penilaian` VALUES (584, 65, 112, 65);
INSERT INTO `detail_penilaian` VALUES (585, 65, 113, 2);
INSERT INTO `detail_penilaian` VALUES (586, 65, 114, 75);
INSERT INTO `detail_penilaian` VALUES (587, 65, 115, 80);
INSERT INTO `detail_penilaian` VALUES (588, 65, 116, 70);
INSERT INTO `detail_penilaian` VALUES (589, 65, 117, 70);
INSERT INTO `detail_penilaian` VALUES (590, 65, 118, 80);
INSERT INTO `detail_penilaian` VALUES (591, 65, 119, 50);
INSERT INTO `detail_penilaian` VALUES (592, 65, 120, 80);
INSERT INTO `detail_penilaian` VALUES (593, 66, 211, 85);
INSERT INTO `detail_penilaian` VALUES (594, 66, 212, 70);
INSERT INTO `detail_penilaian` VALUES (595, 66, 213, 1);
INSERT INTO `detail_penilaian` VALUES (596, 66, 214, 80);
INSERT INTO `detail_penilaian` VALUES (597, 66, 215, 85);
INSERT INTO `detail_penilaian` VALUES (598, 66, 216, 75);
INSERT INTO `detail_penilaian` VALUES (599, 66, 217, 85);
INSERT INTO `detail_penilaian` VALUES (600, 66, 218, 75);
INSERT INTO `detail_penilaian` VALUES (601, 66, 219, 80);
INSERT INTO `detail_penilaian` VALUES (602, 66, 220, 70);
INSERT INTO `detail_penilaian` VALUES (603, 67, 111, 75);
INSERT INTO `detail_penilaian` VALUES (604, 67, 112, 85);
INSERT INTO `detail_penilaian` VALUES (605, 67, 113, 3);
INSERT INTO `detail_penilaian` VALUES (606, 67, 114, 70);
INSERT INTO `detail_penilaian` VALUES (607, 67, 115, 80);
INSERT INTO `detail_penilaian` VALUES (608, 67, 116, 65);
INSERT INTO `detail_penilaian` VALUES (609, 67, 117, 80);
INSERT INTO `detail_penilaian` VALUES (610, 67, 118, 60);
INSERT INTO `detail_penilaian` VALUES (611, 67, 119, 60);
INSERT INTO `detail_penilaian` VALUES (612, 67, 120, 80);
INSERT INTO `detail_penilaian` VALUES (613, 68, 231, 85);
INSERT INTO `detail_penilaian` VALUES (614, 68, 232, 70);
INSERT INTO `detail_penilaian` VALUES (615, 68, 233, 1);
INSERT INTO `detail_penilaian` VALUES (616, 68, 234, 70);
INSERT INTO `detail_penilaian` VALUES (617, 68, 235, 85);
INSERT INTO `detail_penilaian` VALUES (618, 68, 236, 70);
INSERT INTO `detail_penilaian` VALUES (619, 68, 237, 85);
INSERT INTO `detail_penilaian` VALUES (620, 68, 238, 80);
INSERT INTO `detail_penilaian` VALUES (621, 68, 239, 85);
INSERT INTO `detail_penilaian` VALUES (622, 68, 240, 70);
INSERT INTO `detail_penilaian` VALUES (623, 69, 111, 75);
INSERT INTO `detail_penilaian` VALUES (624, 69, 112, 75);
INSERT INTO `detail_penilaian` VALUES (625, 69, 113, 2);
INSERT INTO `detail_penilaian` VALUES (626, 69, 114, 75);
INSERT INTO `detail_penilaian` VALUES (627, 69, 115, 70);
INSERT INTO `detail_penilaian` VALUES (628, 69, 116, 85);
INSERT INTO `detail_penilaian` VALUES (629, 69, 117, 70);
INSERT INTO `detail_penilaian` VALUES (630, 69, 118, 80);
INSERT INTO `detail_penilaian` VALUES (631, 69, 119, 60);
INSERT INTO `detail_penilaian` VALUES (632, 69, 120, 75);
INSERT INTO `detail_penilaian` VALUES (633, 70, 111, 65);
INSERT INTO `detail_penilaian` VALUES (634, 70, 112, 65);
INSERT INTO `detail_penilaian` VALUES (635, 70, 113, 2);
INSERT INTO `detail_penilaian` VALUES (636, 70, 114, 80);
INSERT INTO `detail_penilaian` VALUES (637, 70, 115, 80);
INSERT INTO `detail_penilaian` VALUES (638, 70, 116, 70);
INSERT INTO `detail_penilaian` VALUES (639, 70, 117, 70);
INSERT INTO `detail_penilaian` VALUES (640, 70, 118, 85);
INSERT INTO `detail_penilaian` VALUES (641, 70, 119, 50);
INSERT INTO `detail_penilaian` VALUES (642, 70, 120, 80);
INSERT INTO `detail_penilaian` VALUES (643, 71, 121, 75);
INSERT INTO `detail_penilaian` VALUES (644, 71, 122, 60);
INSERT INTO `detail_penilaian` VALUES (645, 71, 123, 2);
INSERT INTO `detail_penilaian` VALUES (646, 71, 124, 75);
INSERT INTO `detail_penilaian` VALUES (647, 71, 125, 75);
INSERT INTO `detail_penilaian` VALUES (648, 71, 126, 80);
INSERT INTO `detail_penilaian` VALUES (649, 71, 127, 75);
INSERT INTO `detail_penilaian` VALUES (650, 71, 128, 75);
INSERT INTO `detail_penilaian` VALUES (651, 71, 129, 75);
INSERT INTO `detail_penilaian` VALUES (652, 71, 130, 75);
INSERT INTO `detail_penilaian` VALUES (653, 72, 131, 80);
INSERT INTO `detail_penilaian` VALUES (654, 72, 132, 85);
INSERT INTO `detail_penilaian` VALUES (655, 72, 133, 2);
INSERT INTO `detail_penilaian` VALUES (656, 72, 134, 80);
INSERT INTO `detail_penilaian` VALUES (657, 72, 135, 80);
INSERT INTO `detail_penilaian` VALUES (658, 72, 136, 65);
INSERT INTO `detail_penilaian` VALUES (659, 72, 137, 80);
INSERT INTO `detail_penilaian` VALUES (660, 72, 138, 80);
INSERT INTO `detail_penilaian` VALUES (661, 72, 139, 80);
INSERT INTO `detail_penilaian` VALUES (662, 72, 140, 80);
INSERT INTO `detail_penilaian` VALUES (663, 73, 131, 85);
INSERT INTO `detail_penilaian` VALUES (664, 73, 132, 60);
INSERT INTO `detail_penilaian` VALUES (665, 73, 133, 2);
INSERT INTO `detail_penilaian` VALUES (666, 73, 134, 85);
INSERT INTO `detail_penilaian` VALUES (667, 73, 135, 75);
INSERT INTO `detail_penilaian` VALUES (668, 73, 136, 75);
INSERT INTO `detail_penilaian` VALUES (669, 73, 137, 60);
INSERT INTO `detail_penilaian` VALUES (670, 73, 138, 85);
INSERT INTO `detail_penilaian` VALUES (671, 73, 139, 85);
INSERT INTO `detail_penilaian` VALUES (672, 73, 140, 85);
INSERT INTO `detail_penilaian` VALUES (673, 74, 131, 80);
INSERT INTO `detail_penilaian` VALUES (674, 74, 132, 80);
INSERT INTO `detail_penilaian` VALUES (675, 74, 133, 2);
INSERT INTO `detail_penilaian` VALUES (676, 74, 134, 75);
INSERT INTO `detail_penilaian` VALUES (677, 74, 135, 80);
INSERT INTO `detail_penilaian` VALUES (678, 74, 136, 80);
INSERT INTO `detail_penilaian` VALUES (679, 74, 137, 70);
INSERT INTO `detail_penilaian` VALUES (680, 74, 138, 80);
INSERT INTO `detail_penilaian` VALUES (681, 74, 139, 60);
INSERT INTO `detail_penilaian` VALUES (682, 74, 140, 75);
INSERT INTO `detail_penilaian` VALUES (683, 75, 131, 85);
INSERT INTO `detail_penilaian` VALUES (684, 75, 132, 85);
INSERT INTO `detail_penilaian` VALUES (685, 75, 133, 2);
INSERT INTO `detail_penilaian` VALUES (686, 75, 134, 80);
INSERT INTO `detail_penilaian` VALUES (687, 75, 135, 85);
INSERT INTO `detail_penilaian` VALUES (688, 75, 136, 85);
INSERT INTO `detail_penilaian` VALUES (689, 75, 137, 80);
INSERT INTO `detail_penilaian` VALUES (690, 75, 138, 85);
INSERT INTO `detail_penilaian` VALUES (691, 75, 139, 50);
INSERT INTO `detail_penilaian` VALUES (692, 75, 140, 80);
INSERT INTO `detail_penilaian` VALUES (703, 77, 151, 70);
INSERT INTO `detail_penilaian` VALUES (704, 77, 152, 85);
INSERT INTO `detail_penilaian` VALUES (705, 77, 153, 1);
INSERT INTO `detail_penilaian` VALUES (706, 77, 154, 70);
INSERT INTO `detail_penilaian` VALUES (707, 77, 155, 65);
INSERT INTO `detail_penilaian` VALUES (708, 77, 156, 65);
INSERT INTO `detail_penilaian` VALUES (709, 77, 157, 80);
INSERT INTO `detail_penilaian` VALUES (710, 77, 158, 80);
INSERT INTO `detail_penilaian` VALUES (711, 77, 159, 60);
INSERT INTO `detail_penilaian` VALUES (712, 77, 160, 80);
INSERT INTO `detail_penilaian` VALUES (713, 78, 151, 70);
INSERT INTO `detail_penilaian` VALUES (714, 78, 152, 60);
INSERT INTO `detail_penilaian` VALUES (715, 78, 153, 1);
INSERT INTO `detail_penilaian` VALUES (716, 78, 154, 80);
INSERT INTO `detail_penilaian` VALUES (717, 78, 155, 75);
INSERT INTO `detail_penilaian` VALUES (718, 78, 156, 75);
INSERT INTO `detail_penilaian` VALUES (719, 78, 157, 60);
INSERT INTO `detail_penilaian` VALUES (720, 78, 158, 85);
INSERT INTO `detail_penilaian` VALUES (721, 78, 159, 85);
INSERT INTO `detail_penilaian` VALUES (722, 78, 160, 85);
INSERT INTO `detail_penilaian` VALUES (723, 79, 151, 75);
INSERT INTO `detail_penilaian` VALUES (724, 79, 152, 80);
INSERT INTO `detail_penilaian` VALUES (725, 79, 153, 1);
INSERT INTO `detail_penilaian` VALUES (726, 79, 154, 75);
INSERT INTO `detail_penilaian` VALUES (727, 79, 155, 80);
INSERT INTO `detail_penilaian` VALUES (728, 79, 156, 80);
INSERT INTO `detail_penilaian` VALUES (729, 79, 157, 70);
INSERT INTO `detail_penilaian` VALUES (730, 79, 158, 80);
INSERT INTO `detail_penilaian` VALUES (731, 79, 159, 60);
INSERT INTO `detail_penilaian` VALUES (732, 79, 160, 75);
INSERT INTO `detail_penilaian` VALUES (733, 80, 151, 65);
INSERT INTO `detail_penilaian` VALUES (734, 80, 152, 85);
INSERT INTO `detail_penilaian` VALUES (735, 80, 153, 1);
INSERT INTO `detail_penilaian` VALUES (736, 80, 154, 80);
INSERT INTO `detail_penilaian` VALUES (737, 80, 155, 80);
INSERT INTO `detail_penilaian` VALUES (738, 80, 156, 85);
INSERT INTO `detail_penilaian` VALUES (739, 80, 157, 70);
INSERT INTO `detail_penilaian` VALUES (740, 80, 158, 85);
INSERT INTO `detail_penilaian` VALUES (741, 80, 159, 50);
INSERT INTO `detail_penilaian` VALUES (742, 80, 160, 80);
INSERT INTO `detail_penilaian` VALUES (753, 82, 171, 80);
INSERT INTO `detail_penilaian` VALUES (754, 82, 172, 85);
INSERT INTO `detail_penilaian` VALUES (755, 82, 173, 1);
INSERT INTO `detail_penilaian` VALUES (756, 82, 174, 70);
INSERT INTO `detail_penilaian` VALUES (757, 82, 175, 80);
INSERT INTO `detail_penilaian` VALUES (758, 82, 176, 65);
INSERT INTO `detail_penilaian` VALUES (759, 82, 177, 80);
INSERT INTO `detail_penilaian` VALUES (760, 82, 178, 80);
INSERT INTO `detail_penilaian` VALUES (761, 82, 179, 60);
INSERT INTO `detail_penilaian` VALUES (762, 82, 180, 80);
INSERT INTO `detail_penilaian` VALUES (763, 83, 171, 85);
INSERT INTO `detail_penilaian` VALUES (764, 83, 172, 60);
INSERT INTO `detail_penilaian` VALUES (765, 83, 173, 1);
INSERT INTO `detail_penilaian` VALUES (766, 83, 174, 80);
INSERT INTO `detail_penilaian` VALUES (767, 83, 175, 60);
INSERT INTO `detail_penilaian` VALUES (768, 83, 176, 75);
INSERT INTO `detail_penilaian` VALUES (769, 83, 177, 60);
INSERT INTO `detail_penilaian` VALUES (770, 83, 178, 85);
INSERT INTO `detail_penilaian` VALUES (771, 83, 179, 85);
INSERT INTO `detail_penilaian` VALUES (772, 83, 180, 85);
INSERT INTO `detail_penilaian` VALUES (773, 84, 171, 80);
INSERT INTO `detail_penilaian` VALUES (774, 84, 172, 80);
INSERT INTO `detail_penilaian` VALUES (775, 84, 173, 2);
INSERT INTO `detail_penilaian` VALUES (776, 84, 174, 75);
INSERT INTO `detail_penilaian` VALUES (777, 84, 175, 70);
INSERT INTO `detail_penilaian` VALUES (778, 84, 176, 80);
INSERT INTO `detail_penilaian` VALUES (779, 84, 177, 70);
INSERT INTO `detail_penilaian` VALUES (780, 84, 178, 80);
INSERT INTO `detail_penilaian` VALUES (781, 84, 179, 60);
INSERT INTO `detail_penilaian` VALUES (782, 84, 180, 75);
INSERT INTO `detail_penilaian` VALUES (783, 85, 171, 85);
INSERT INTO `detail_penilaian` VALUES (784, 85, 172, 85);
INSERT INTO `detail_penilaian` VALUES (785, 85, 173, 2);
INSERT INTO `detail_penilaian` VALUES (786, 85, 174, 80);
INSERT INTO `detail_penilaian` VALUES (787, 85, 175, 80);
INSERT INTO `detail_penilaian` VALUES (788, 85, 176, 85);
INSERT INTO `detail_penilaian` VALUES (789, 85, 177, 80);
INSERT INTO `detail_penilaian` VALUES (790, 85, 178, 85);
INSERT INTO `detail_penilaian` VALUES (791, 85, 179, 50);
INSERT INTO `detail_penilaian` VALUES (792, 85, 180, 80);
INSERT INTO `detail_penilaian` VALUES (793, 86, 181, 75);
INSERT INTO `detail_penilaian` VALUES (794, 86, 182, 60);
INSERT INTO `detail_penilaian` VALUES (795, 86, 183, 2);
INSERT INTO `detail_penilaian` VALUES (796, 86, 184, 75);
INSERT INTO `detail_penilaian` VALUES (797, 86, 185, 75);
INSERT INTO `detail_penilaian` VALUES (798, 86, 186, 80);
INSERT INTO `detail_penilaian` VALUES (799, 86, 187, 75);
INSERT INTO `detail_penilaian` VALUES (800, 86, 188, 75);
INSERT INTO `detail_penilaian` VALUES (801, 86, 189, 75);
INSERT INTO `detail_penilaian` VALUES (802, 86, 190, 75);
INSERT INTO `detail_penilaian` VALUES (803, 87, 191, 80);
INSERT INTO `detail_penilaian` VALUES (804, 87, 192, 85);
INSERT INTO `detail_penilaian` VALUES (805, 87, 193, 2);
INSERT INTO `detail_penilaian` VALUES (806, 87, 194, 80);
INSERT INTO `detail_penilaian` VALUES (807, 87, 195, 80);
INSERT INTO `detail_penilaian` VALUES (808, 87, 196, 65);
INSERT INTO `detail_penilaian` VALUES (809, 87, 197, 80);
INSERT INTO `detail_penilaian` VALUES (810, 87, 198, 80);
INSERT INTO `detail_penilaian` VALUES (811, 87, 199, 80);
INSERT INTO `detail_penilaian` VALUES (812, 87, 200, 80);
INSERT INTO `detail_penilaian` VALUES (813, 88, 191, 85);
INSERT INTO `detail_penilaian` VALUES (814, 88, 192, 60);
INSERT INTO `detail_penilaian` VALUES (815, 88, 193, 2);
INSERT INTO `detail_penilaian` VALUES (816, 88, 194, 85);
INSERT INTO `detail_penilaian` VALUES (817, 88, 195, 75);
INSERT INTO `detail_penilaian` VALUES (818, 88, 196, 75);
INSERT INTO `detail_penilaian` VALUES (819, 88, 197, 60);
INSERT INTO `detail_penilaian` VALUES (820, 88, 198, 85);
INSERT INTO `detail_penilaian` VALUES (821, 88, 199, 85);
INSERT INTO `detail_penilaian` VALUES (822, 88, 200, 85);
INSERT INTO `detail_penilaian` VALUES (823, 89, 191, 80);
INSERT INTO `detail_penilaian` VALUES (824, 89, 192, 80);
INSERT INTO `detail_penilaian` VALUES (825, 89, 193, 2);
INSERT INTO `detail_penilaian` VALUES (826, 89, 194, 75);
INSERT INTO `detail_penilaian` VALUES (827, 89, 195, 80);
INSERT INTO `detail_penilaian` VALUES (828, 89, 196, 80);
INSERT INTO `detail_penilaian` VALUES (829, 89, 197, 70);
INSERT INTO `detail_penilaian` VALUES (830, 89, 198, 80);
INSERT INTO `detail_penilaian` VALUES (831, 89, 199, 60);
INSERT INTO `detail_penilaian` VALUES (832, 89, 200, 75);
INSERT INTO `detail_penilaian` VALUES (833, 90, 191, 85);
INSERT INTO `detail_penilaian` VALUES (834, 90, 192, 85);
INSERT INTO `detail_penilaian` VALUES (835, 90, 193, 2);
INSERT INTO `detail_penilaian` VALUES (836, 90, 194, 80);
INSERT INTO `detail_penilaian` VALUES (837, 90, 195, 85);
INSERT INTO `detail_penilaian` VALUES (838, 90, 196, 85);
INSERT INTO `detail_penilaian` VALUES (839, 90, 197, 80);
INSERT INTO `detail_penilaian` VALUES (840, 90, 198, 85);
INSERT INTO `detail_penilaian` VALUES (841, 90, 199, 50);
INSERT INTO `detail_penilaian` VALUES (842, 90, 200, 80);
INSERT INTO `detail_penilaian` VALUES (843, 91, 201, 80);
INSERT INTO `detail_penilaian` VALUES (844, 91, 202, 75);
INSERT INTO `detail_penilaian` VALUES (845, 91, 203, 2);
INSERT INTO `detail_penilaian` VALUES (846, 91, 204, 75);
INSERT INTO `detail_penilaian` VALUES (847, 91, 205, 75);
INSERT INTO `detail_penilaian` VALUES (848, 91, 206, 60);
INSERT INTO `detail_penilaian` VALUES (849, 91, 207, 75);
INSERT INTO `detail_penilaian` VALUES (850, 91, 208, 60);
INSERT INTO `detail_penilaian` VALUES (851, 91, 209, 75);
INSERT INTO `detail_penilaian` VALUES (852, 91, 210, 75);
INSERT INTO `detail_penilaian` VALUES (853, 92, 211, 80);
INSERT INTO `detail_penilaian` VALUES (854, 92, 212, 80);
INSERT INTO `detail_penilaian` VALUES (855, 92, 213, 2);
INSERT INTO `detail_penilaian` VALUES (856, 92, 214, 80);
INSERT INTO `detail_penilaian` VALUES (857, 92, 215, 80);
INSERT INTO `detail_penilaian` VALUES (858, 92, 216, 70);
INSERT INTO `detail_penilaian` VALUES (859, 92, 217, 80);
INSERT INTO `detail_penilaian` VALUES (860, 92, 218, 70);
INSERT INTO `detail_penilaian` VALUES (861, 92, 219, 80);
INSERT INTO `detail_penilaian` VALUES (862, 92, 220, 80);
INSERT INTO `detail_penilaian` VALUES (863, 93, 211, 85);
INSERT INTO `detail_penilaian` VALUES (864, 93, 212, 75);
INSERT INTO `detail_penilaian` VALUES (865, 93, 213, 2);
INSERT INTO `detail_penilaian` VALUES (866, 93, 214, 85);
INSERT INTO `detail_penilaian` VALUES (867, 93, 215, 75);
INSERT INTO `detail_penilaian` VALUES (868, 93, 216, 80);
INSERT INTO `detail_penilaian` VALUES (869, 93, 217, 60);
INSERT INTO `detail_penilaian` VALUES (870, 93, 218, 80);
INSERT INTO `detail_penilaian` VALUES (871, 93, 219, 85);
INSERT INTO `detail_penilaian` VALUES (872, 93, 220, 60);
INSERT INTO `detail_penilaian` VALUES (873, 94, 211, 80);
INSERT INTO `detail_penilaian` VALUES (874, 94, 212, 80);
INSERT INTO `detail_penilaian` VALUES (875, 94, 213, 2);
INSERT INTO `detail_penilaian` VALUES (876, 94, 214, 75);
INSERT INTO `detail_penilaian` VALUES (877, 94, 215, 80);
INSERT INTO `detail_penilaian` VALUES (878, 94, 216, 80);
INSERT INTO `detail_penilaian` VALUES (879, 94, 217, 70);
INSERT INTO `detail_penilaian` VALUES (880, 94, 218, 80);
INSERT INTO `detail_penilaian` VALUES (881, 94, 219, 60);
INSERT INTO `detail_penilaian` VALUES (882, 94, 220, 70);
INSERT INTO `detail_penilaian` VALUES (883, 95, 211, 85);
INSERT INTO `detail_penilaian` VALUES (884, 95, 212, 85);
INSERT INTO `detail_penilaian` VALUES (885, 95, 213, 2);
INSERT INTO `detail_penilaian` VALUES (886, 95, 214, 80);
INSERT INTO `detail_penilaian` VALUES (887, 95, 215, 85);
INSERT INTO `detail_penilaian` VALUES (888, 95, 216, 85);
INSERT INTO `detail_penilaian` VALUES (889, 95, 217, 80);
INSERT INTO `detail_penilaian` VALUES (890, 95, 218, 85);
INSERT INTO `detail_penilaian` VALUES (891, 95, 219, 50);
INSERT INTO `detail_penilaian` VALUES (892, 95, 220, 80);
INSERT INTO `detail_penilaian` VALUES (943, 101, 141, 60);
INSERT INTO `detail_penilaian` VALUES (944, 101, 142, 60);
INSERT INTO `detail_penilaian` VALUES (945, 101, 143, 1);
INSERT INTO `detail_penilaian` VALUES (946, 101, 144, 85);
INSERT INTO `detail_penilaian` VALUES (947, 101, 145, 75);
INSERT INTO `detail_penilaian` VALUES (948, 101, 146, 80);
INSERT INTO `detail_penilaian` VALUES (949, 101, 147, 75);
INSERT INTO `detail_penilaian` VALUES (950, 101, 148, 75);
INSERT INTO `detail_penilaian` VALUES (951, 101, 149, 85);
INSERT INTO `detail_penilaian` VALUES (952, 101, 150, 75);
INSERT INTO `detail_penilaian` VALUES (953, 102, 251, 70);
INSERT INTO `detail_penilaian` VALUES (954, 102, 252, 85);
INSERT INTO `detail_penilaian` VALUES (955, 102, 253, 1);
INSERT INTO `detail_penilaian` VALUES (956, 102, 254, 70);
INSERT INTO `detail_penilaian` VALUES (957, 102, 255, 65);
INSERT INTO `detail_penilaian` VALUES (958, 102, 256, 65);
INSERT INTO `detail_penilaian` VALUES (959, 102, 257, 80);
INSERT INTO `detail_penilaian` VALUES (960, 102, 258, 80);
INSERT INTO `detail_penilaian` VALUES (961, 102, 259, 60);
INSERT INTO `detail_penilaian` VALUES (962, 102, 260, 80);
INSERT INTO `detail_penilaian` VALUES (963, 103, 251, 70);
INSERT INTO `detail_penilaian` VALUES (964, 103, 252, 60);
INSERT INTO `detail_penilaian` VALUES (965, 103, 253, 1);
INSERT INTO `detail_penilaian` VALUES (966, 103, 254, 80);
INSERT INTO `detail_penilaian` VALUES (967, 103, 255, 75);
INSERT INTO `detail_penilaian` VALUES (968, 103, 256, 75);
INSERT INTO `detail_penilaian` VALUES (969, 103, 257, 60);
INSERT INTO `detail_penilaian` VALUES (970, 103, 258, 85);
INSERT INTO `detail_penilaian` VALUES (971, 103, 259, 85);
INSERT INTO `detail_penilaian` VALUES (972, 103, 260, 85);
INSERT INTO `detail_penilaian` VALUES (973, 104, 251, 75);
INSERT INTO `detail_penilaian` VALUES (974, 104, 252, 80);
INSERT INTO `detail_penilaian` VALUES (975, 104, 253, 1);
INSERT INTO `detail_penilaian` VALUES (976, 104, 254, 75);
INSERT INTO `detail_penilaian` VALUES (977, 104, 255, 80);
INSERT INTO `detail_penilaian` VALUES (978, 104, 256, 80);
INSERT INTO `detail_penilaian` VALUES (979, 104, 257, 70);
INSERT INTO `detail_penilaian` VALUES (980, 104, 258, 80);
INSERT INTO `detail_penilaian` VALUES (981, 104, 259, 60);
INSERT INTO `detail_penilaian` VALUES (982, 104, 260, 75);
INSERT INTO `detail_penilaian` VALUES (983, 105, 251, 65);
INSERT INTO `detail_penilaian` VALUES (984, 105, 252, 85);
INSERT INTO `detail_penilaian` VALUES (985, 105, 253, 1);
INSERT INTO `detail_penilaian` VALUES (986, 105, 254, 80);
INSERT INTO `detail_penilaian` VALUES (987, 105, 255, 80);
INSERT INTO `detail_penilaian` VALUES (988, 105, 256, 85);
INSERT INTO `detail_penilaian` VALUES (989, 105, 257, 70);
INSERT INTO `detail_penilaian` VALUES (990, 105, 258, 85);
INSERT INTO `detail_penilaian` VALUES (991, 105, 259, 50);
INSERT INTO `detail_penilaian` VALUES (992, 105, 260, 80);
INSERT INTO `detail_penilaian` VALUES (993, 54, 213, 3);
INSERT INTO `detail_penilaian` VALUES (994, 106, 101, 80);
INSERT INTO `detail_penilaian` VALUES (995, 106, 102, 70);
INSERT INTO `detail_penilaian` VALUES (996, 106, 103, 1);
INSERT INTO `detail_penilaian` VALUES (997, 106, 104, 85);
INSERT INTO `detail_penilaian` VALUES (998, 106, 105, 75);
INSERT INTO `detail_penilaian` VALUES (999, 106, 106, 80);
INSERT INTO `detail_penilaian` VALUES (1000, 106, 107, 75);
INSERT INTO `detail_penilaian` VALUES (1001, 106, 108, 85);
INSERT INTO `detail_penilaian` VALUES (1002, 106, 109, 85);
INSERT INTO `detail_penilaian` VALUES (1003, 106, 110, 75);
INSERT INTO `detail_penilaian` VALUES (1004, 107, 111, 70);
INSERT INTO `detail_penilaian` VALUES (1005, 107, 112, 75);
INSERT INTO `detail_penilaian` VALUES (1006, 107, 113, 2);
INSERT INTO `detail_penilaian` VALUES (1007, 107, 114, 80);
INSERT INTO `detail_penilaian` VALUES (1008, 107, 115, 85);
INSERT INTO `detail_penilaian` VALUES (1009, 107, 116, 70);
INSERT INTO `detail_penilaian` VALUES (1010, 107, 117, 60);
INSERT INTO `detail_penilaian` VALUES (1011, 107, 118, 75);
INSERT INTO `detail_penilaian` VALUES (1012, 107, 119, 85);
INSERT INTO `detail_penilaian` VALUES (1013, 107, 120, 85);
INSERT INTO `detail_penilaian` VALUES (1014, 108, 241, 60);
INSERT INTO `detail_penilaian` VALUES (1015, 108, 242, 60);
INSERT INTO `detail_penilaian` VALUES (1016, 108, 243, 1);
INSERT INTO `detail_penilaian` VALUES (1017, 108, 244, 85);
INSERT INTO `detail_penilaian` VALUES (1018, 108, 245, 75);
INSERT INTO `detail_penilaian` VALUES (1019, 108, 246, 80);
INSERT INTO `detail_penilaian` VALUES (1020, 108, 247, 75);
INSERT INTO `detail_penilaian` VALUES (1021, 108, 248, 75);
INSERT INTO `detail_penilaian` VALUES (1022, 108, 249, 85);
INSERT INTO `detail_penilaian` VALUES (1023, 108, 250, 75);
INSERT INTO `detail_penilaian` VALUES (1024, 109, 101, 80);
INSERT INTO `detail_penilaian` VALUES (1025, 109, 102, 70);
INSERT INTO `detail_penilaian` VALUES (1026, 109, 103, 1);
INSERT INTO `detail_penilaian` VALUES (1027, 109, 104, 85);
INSERT INTO `detail_penilaian` VALUES (1028, 109, 105, 75);
INSERT INTO `detail_penilaian` VALUES (1029, 109, 106, 80);
INSERT INTO `detail_penilaian` VALUES (1030, 109, 107, 75);
INSERT INTO `detail_penilaian` VALUES (1031, 109, 108, 85);
INSERT INTO `detail_penilaian` VALUES (1032, 109, 109, 85);
INSERT INTO `detail_penilaian` VALUES (1033, 109, 110, 75);
INSERT INTO `detail_penilaian` VALUES (1034, 110, 111, 75);
INSERT INTO `detail_penilaian` VALUES (1035, 110, 112, 75);
INSERT INTO `detail_penilaian` VALUES (1036, 110, 113, 2);
INSERT INTO `detail_penilaian` VALUES (1037, 110, 114, 70);
INSERT INTO `detail_penilaian` VALUES (1038, 110, 115, 80);
INSERT INTO `detail_penilaian` VALUES (1039, 110, 116, 77);
INSERT INTO `detail_penilaian` VALUES (1040, 110, 117, 80);
INSERT INTO `detail_penilaian` VALUES (1041, 110, 118, 60);
INSERT INTO `detail_penilaian` VALUES (1042, 110, 119, 75);
INSERT INTO `detail_penilaian` VALUES (1043, 110, 120, 80);
INSERT INTO `detail_penilaian` VALUES (1044, 111, 111, 70);
INSERT INTO `detail_penilaian` VALUES (1045, 111, 112, 75);
INSERT INTO `detail_penilaian` VALUES (1046, 111, 113, 2);
INSERT INTO `detail_penilaian` VALUES (1047, 111, 114, 80);
INSERT INTO `detail_penilaian` VALUES (1048, 111, 115, 88);
INSERT INTO `detail_penilaian` VALUES (1049, 111, 116, 70);
INSERT INTO `detail_penilaian` VALUES (1050, 111, 117, 60);
INSERT INTO `detail_penilaian` VALUES (1051, 111, 118, 75);
INSERT INTO `detail_penilaian` VALUES (1052, 111, 119, 85);
INSERT INTO `detail_penilaian` VALUES (1053, 111, 120, 80);
INSERT INTO `detail_penilaian` VALUES (1054, 112, 111, 75);
INSERT INTO `detail_penilaian` VALUES (1055, 112, 112, 75);
INSERT INTO `detail_penilaian` VALUES (1056, 112, 113, 1);
INSERT INTO `detail_penilaian` VALUES (1057, 112, 114, 75);
INSERT INTO `detail_penilaian` VALUES (1058, 112, 115, 70);
INSERT INTO `detail_penilaian` VALUES (1059, 112, 116, 85);
INSERT INTO `detail_penilaian` VALUES (1060, 112, 117, 70);
INSERT INTO `detail_penilaian` VALUES (1061, 112, 118, 80);
INSERT INTO `detail_penilaian` VALUES (1062, 112, 119, 75);
INSERT INTO `detail_penilaian` VALUES (1063, 112, 120, 75);
INSERT INTO `detail_penilaian` VALUES (1064, 113, 111, 75);
INSERT INTO `detail_penilaian` VALUES (1065, 113, 112, 65);
INSERT INTO `detail_penilaian` VALUES (1066, 113, 113, 3);
INSERT INTO `detail_penilaian` VALUES (1067, 113, 114, 80);
INSERT INTO `detail_penilaian` VALUES (1068, 113, 115, 80);
INSERT INTO `detail_penilaian` VALUES (1069, 113, 116, 70);
INSERT INTO `detail_penilaian` VALUES (1070, 113, 117, 70);
INSERT INTO `detail_penilaian` VALUES (1071, 113, 118, 85);
INSERT INTO `detail_penilaian` VALUES (1072, 113, 119, 70);
INSERT INTO `detail_penilaian` VALUES (1073, 113, 120, 80);
INSERT INTO `detail_penilaian` VALUES (1084, 115, 131, 80);
INSERT INTO `detail_penilaian` VALUES (1085, 115, 132, 80);
INSERT INTO `detail_penilaian` VALUES (1086, 115, 133, 2);
INSERT INTO `detail_penilaian` VALUES (1087, 115, 134, 80);
INSERT INTO `detail_penilaian` VALUES (1088, 115, 135, 80);
INSERT INTO `detail_penilaian` VALUES (1089, 115, 136, 65);
INSERT INTO `detail_penilaian` VALUES (1090, 115, 137, 80);
INSERT INTO `detail_penilaian` VALUES (1091, 115, 138, 80);
INSERT INTO `detail_penilaian` VALUES (1092, 115, 139, 75);
INSERT INTO `detail_penilaian` VALUES (1093, 115, 140, 80);
INSERT INTO `detail_penilaian` VALUES (1094, 116, 131, 85);
INSERT INTO `detail_penilaian` VALUES (1095, 116, 132, 85);
INSERT INTO `detail_penilaian` VALUES (1096, 116, 133, 2);
INSERT INTO `detail_penilaian` VALUES (1097, 116, 134, 85);
INSERT INTO `detail_penilaian` VALUES (1098, 116, 135, 80);
INSERT INTO `detail_penilaian` VALUES (1099, 116, 136, 75);
INSERT INTO `detail_penilaian` VALUES (1100, 116, 137, 60);
INSERT INTO `detail_penilaian` VALUES (1101, 116, 138, 85);
INSERT INTO `detail_penilaian` VALUES (1102, 116, 139, 75);
INSERT INTO `detail_penilaian` VALUES (1103, 116, 140, 85);
INSERT INTO `detail_penilaian` VALUES (1104, 117, 131, 80);
INSERT INTO `detail_penilaian` VALUES (1105, 117, 132, 80);
INSERT INTO `detail_penilaian` VALUES (1106, 117, 133, 2);
INSERT INTO `detail_penilaian` VALUES (1107, 117, 134, 75);
INSERT INTO `detail_penilaian` VALUES (1108, 117, 135, 80);
INSERT INTO `detail_penilaian` VALUES (1109, 117, 136, 80);
INSERT INTO `detail_penilaian` VALUES (1110, 117, 137, 70);
INSERT INTO `detail_penilaian` VALUES (1111, 117, 138, 80);
INSERT INTO `detail_penilaian` VALUES (1112, 117, 139, 75);
INSERT INTO `detail_penilaian` VALUES (1113, 117, 140, 75);
INSERT INTO `detail_penilaian` VALUES (1114, 118, 131, 85);
INSERT INTO `detail_penilaian` VALUES (1115, 118, 132, 85);
INSERT INTO `detail_penilaian` VALUES (1116, 118, 133, 2);
INSERT INTO `detail_penilaian` VALUES (1117, 118, 134, 80);
INSERT INTO `detail_penilaian` VALUES (1118, 118, 135, 80);
INSERT INTO `detail_penilaian` VALUES (1119, 118, 136, 85);
INSERT INTO `detail_penilaian` VALUES (1120, 118, 137, 80);
INSERT INTO `detail_penilaian` VALUES (1121, 118, 138, 85);
INSERT INTO `detail_penilaian` VALUES (1122, 118, 139, 75);
INSERT INTO `detail_penilaian` VALUES (1123, 118, 140, 80);
INSERT INTO `detail_penilaian` VALUES (1124, 119, 141, 75);
INSERT INTO `detail_penilaian` VALUES (1125, 119, 142, 60);
INSERT INTO `detail_penilaian` VALUES (1126, 119, 143, 2);
INSERT INTO `detail_penilaian` VALUES (1127, 119, 144, 85);
INSERT INTO `detail_penilaian` VALUES (1128, 119, 145, 75);
INSERT INTO `detail_penilaian` VALUES (1129, 119, 146, 80);
INSERT INTO `detail_penilaian` VALUES (1130, 119, 147, 75);
INSERT INTO `detail_penilaian` VALUES (1131, 119, 148, 75);
INSERT INTO `detail_penilaian` VALUES (1132, 119, 149, 85);
INSERT INTO `detail_penilaian` VALUES (1133, 119, 150, 75);
INSERT INTO `detail_penilaian` VALUES (1134, 120, 151, 70);
INSERT INTO `detail_penilaian` VALUES (1135, 120, 152, 85);
INSERT INTO `detail_penilaian` VALUES (1136, 120, 153, 1);
INSERT INTO `detail_penilaian` VALUES (1137, 120, 154, 70);
INSERT INTO `detail_penilaian` VALUES (1138, 120, 155, 75);
INSERT INTO `detail_penilaian` VALUES (1139, 120, 156, 65);
INSERT INTO `detail_penilaian` VALUES (1140, 120, 157, 80);
INSERT INTO `detail_penilaian` VALUES (1141, 120, 158, 80);
INSERT INTO `detail_penilaian` VALUES (1142, 120, 159, 80);
INSERT INTO `detail_penilaian` VALUES (1143, 120, 160, 80);
INSERT INTO `detail_penilaian` VALUES (1144, 121, 151, 70);
INSERT INTO `detail_penilaian` VALUES (1145, 121, 152, 60);
INSERT INTO `detail_penilaian` VALUES (1146, 121, 153, 3);
INSERT INTO `detail_penilaian` VALUES (1147, 121, 154, 80);
INSERT INTO `detail_penilaian` VALUES (1148, 121, 155, 75);
INSERT INTO `detail_penilaian` VALUES (1149, 121, 156, 75);
INSERT INTO `detail_penilaian` VALUES (1150, 121, 157, 60);
INSERT INTO `detail_penilaian` VALUES (1151, 121, 158, 85);
INSERT INTO `detail_penilaian` VALUES (1152, 121, 159, 85);
INSERT INTO `detail_penilaian` VALUES (1153, 121, 160, 85);
INSERT INTO `detail_penilaian` VALUES (1154, 122, 151, 75);
INSERT INTO `detail_penilaian` VALUES (1155, 122, 152, 80);
INSERT INTO `detail_penilaian` VALUES (1156, 122, 153, 1);
INSERT INTO `detail_penilaian` VALUES (1157, 122, 154, 75);
INSERT INTO `detail_penilaian` VALUES (1158, 122, 155, 75);
INSERT INTO `detail_penilaian` VALUES (1159, 122, 156, 80);
INSERT INTO `detail_penilaian` VALUES (1160, 122, 157, 70);
INSERT INTO `detail_penilaian` VALUES (1161, 122, 158, 80);
INSERT INTO `detail_penilaian` VALUES (1162, 122, 159, 60);
INSERT INTO `detail_penilaian` VALUES (1163, 122, 160, 80);
INSERT INTO `detail_penilaian` VALUES (1164, 123, 151, 80);
INSERT INTO `detail_penilaian` VALUES (1165, 123, 152, 85);
INSERT INTO `detail_penilaian` VALUES (1166, 123, 153, 1);
INSERT INTO `detail_penilaian` VALUES (1167, 123, 154, 80);
INSERT INTO `detail_penilaian` VALUES (1168, 123, 155, 75);
INSERT INTO `detail_penilaian` VALUES (1169, 123, 156, 85);
INSERT INTO `detail_penilaian` VALUES (1170, 123, 157, 70);
INSERT INTO `detail_penilaian` VALUES (1171, 123, 158, 85);
INSERT INTO `detail_penilaian` VALUES (1172, 123, 159, 50);
INSERT INTO `detail_penilaian` VALUES (1173, 123, 160, 85);
INSERT INTO `detail_penilaian` VALUES (1224, 129, 181, 75);
INSERT INTO `detail_penilaian` VALUES (1225, 129, 182, 60);
INSERT INTO `detail_penilaian` VALUES (1226, 129, 183, 2);
INSERT INTO `detail_penilaian` VALUES (1227, 129, 184, 75);
INSERT INTO `detail_penilaian` VALUES (1228, 129, 185, 75);
INSERT INTO `detail_penilaian` VALUES (1229, 129, 186, 80);
INSERT INTO `detail_penilaian` VALUES (1230, 129, 187, 75);
INSERT INTO `detail_penilaian` VALUES (1231, 129, 188, 75);
INSERT INTO `detail_penilaian` VALUES (1232, 129, 189, 75);
INSERT INTO `detail_penilaian` VALUES (1233, 129, 190, 75);
INSERT INTO `detail_penilaian` VALUES (1234, 130, 191, 80);
INSERT INTO `detail_penilaian` VALUES (1235, 130, 192, 75);
INSERT INTO `detail_penilaian` VALUES (1236, 130, 193, 1);
INSERT INTO `detail_penilaian` VALUES (1237, 130, 194, 80);
INSERT INTO `detail_penilaian` VALUES (1238, 130, 195, 80);
INSERT INTO `detail_penilaian` VALUES (1239, 130, 196, 65);
INSERT INTO `detail_penilaian` VALUES (1240, 130, 197, 80);
INSERT INTO `detail_penilaian` VALUES (1241, 130, 198, 80);
INSERT INTO `detail_penilaian` VALUES (1242, 130, 199, 80);
INSERT INTO `detail_penilaian` VALUES (1243, 130, 200, 80);
INSERT INTO `detail_penilaian` VALUES (1244, 131, 191, 85);
INSERT INTO `detail_penilaian` VALUES (1245, 131, 192, 60);
INSERT INTO `detail_penilaian` VALUES (1246, 131, 193, 3);
INSERT INTO `detail_penilaian` VALUES (1247, 131, 194, 70);
INSERT INTO `detail_penilaian` VALUES (1248, 131, 195, 75);
INSERT INTO `detail_penilaian` VALUES (1249, 131, 196, 75);
INSERT INTO `detail_penilaian` VALUES (1250, 131, 197, 75);
INSERT INTO `detail_penilaian` VALUES (1251, 131, 198, 85);
INSERT INTO `detail_penilaian` VALUES (1252, 131, 199, 85);
INSERT INTO `detail_penilaian` VALUES (1253, 131, 200, 85);
INSERT INTO `detail_penilaian` VALUES (1254, 132, 191, 80);
INSERT INTO `detail_penilaian` VALUES (1255, 132, 192, 80);
INSERT INTO `detail_penilaian` VALUES (1256, 132, 193, 2);
INSERT INTO `detail_penilaian` VALUES (1257, 132, 194, 75);
INSERT INTO `detail_penilaian` VALUES (1258, 132, 195, 80);
INSERT INTO `detail_penilaian` VALUES (1259, 132, 196, 80);
INSERT INTO `detail_penilaian` VALUES (1260, 132, 197, 70);
INSERT INTO `detail_penilaian` VALUES (1261, 132, 198, 80);
INSERT INTO `detail_penilaian` VALUES (1262, 132, 199, 60);
INSERT INTO `detail_penilaian` VALUES (1263, 132, 200, 75);
INSERT INTO `detail_penilaian` VALUES (1264, 133, 191, 85);
INSERT INTO `detail_penilaian` VALUES (1265, 133, 192, 80);
INSERT INTO `detail_penilaian` VALUES (1266, 133, 193, 1);
INSERT INTO `detail_penilaian` VALUES (1267, 133, 194, 80);
INSERT INTO `detail_penilaian` VALUES (1268, 133, 195, 85);
INSERT INTO `detail_penilaian` VALUES (1269, 133, 196, 85);
INSERT INTO `detail_penilaian` VALUES (1270, 133, 197, 80);
INSERT INTO `detail_penilaian` VALUES (1271, 133, 198, 85);
INSERT INTO `detail_penilaian` VALUES (1272, 133, 199, 70);
INSERT INTO `detail_penilaian` VALUES (1273, 133, 200, 80);
INSERT INTO `detail_penilaian` VALUES (1274, 134, 201, 80);
INSERT INTO `detail_penilaian` VALUES (1275, 134, 202, 75);
INSERT INTO `detail_penilaian` VALUES (1276, 134, 203, 1);
INSERT INTO `detail_penilaian` VALUES (1277, 134, 204, 75);
INSERT INTO `detail_penilaian` VALUES (1278, 134, 205, 75);
INSERT INTO `detail_penilaian` VALUES (1279, 134, 206, 60);
INSERT INTO `detail_penilaian` VALUES (1280, 134, 207, 75);
INSERT INTO `detail_penilaian` VALUES (1281, 134, 208, 60);
INSERT INTO `detail_penilaian` VALUES (1282, 134, 209, 75);
INSERT INTO `detail_penilaian` VALUES (1283, 134, 210, 75);
INSERT INTO `detail_penilaian` VALUES (1284, 135, 211, 80);
INSERT INTO `detail_penilaian` VALUES (1285, 135, 212, 80);
INSERT INTO `detail_penilaian` VALUES (1286, 135, 213, 1);
INSERT INTO `detail_penilaian` VALUES (1287, 135, 214, 80);
INSERT INTO `detail_penilaian` VALUES (1288, 135, 215, 75);
INSERT INTO `detail_penilaian` VALUES (1289, 135, 216, 70);
INSERT INTO `detail_penilaian` VALUES (1290, 135, 217, 80);
INSERT INTO `detail_penilaian` VALUES (1291, 135, 218, 70);
INSERT INTO `detail_penilaian` VALUES (1292, 135, 219, 80);
INSERT INTO `detail_penilaian` VALUES (1293, 135, 220, 80);
INSERT INTO `detail_penilaian` VALUES (1294, 136, 211, 80);
INSERT INTO `detail_penilaian` VALUES (1295, 136, 212, 75);
INSERT INTO `detail_penilaian` VALUES (1296, 136, 213, 1);
INSERT INTO `detail_penilaian` VALUES (1297, 136, 214, 85);
INSERT INTO `detail_penilaian` VALUES (1298, 136, 215, 75);
INSERT INTO `detail_penilaian` VALUES (1299, 136, 216, 80);
INSERT INTO `detail_penilaian` VALUES (1300, 136, 217, 60);
INSERT INTO `detail_penilaian` VALUES (1301, 136, 218, 75);
INSERT INTO `detail_penilaian` VALUES (1302, 136, 219, 85);
INSERT INTO `detail_penilaian` VALUES (1303, 136, 220, 60);
INSERT INTO `detail_penilaian` VALUES (1304, 137, 211, 80);
INSERT INTO `detail_penilaian` VALUES (1305, 137, 212, 80);
INSERT INTO `detail_penilaian` VALUES (1306, 137, 213, 1);
INSERT INTO `detail_penilaian` VALUES (1307, 137, 214, 75);
INSERT INTO `detail_penilaian` VALUES (1308, 137, 215, 75);
INSERT INTO `detail_penilaian` VALUES (1309, 137, 216, 80);
INSERT INTO `detail_penilaian` VALUES (1310, 137, 217, 70);
INSERT INTO `detail_penilaian` VALUES (1311, 137, 218, 80);
INSERT INTO `detail_penilaian` VALUES (1312, 137, 219, 60);
INSERT INTO `detail_penilaian` VALUES (1313, 137, 220, 70);
INSERT INTO `detail_penilaian` VALUES (1314, 138, 211, 80);
INSERT INTO `detail_penilaian` VALUES (1315, 138, 212, 85);
INSERT INTO `detail_penilaian` VALUES (1316, 138, 213, 1);
INSERT INTO `detail_penilaian` VALUES (1317, 138, 214, 80);
INSERT INTO `detail_penilaian` VALUES (1318, 138, 215, 75);
INSERT INTO `detail_penilaian` VALUES (1319, 138, 216, 85);
INSERT INTO `detail_penilaian` VALUES (1320, 138, 217, 80);
INSERT INTO `detail_penilaian` VALUES (1321, 138, 218, 85);
INSERT INTO `detail_penilaian` VALUES (1322, 138, 219, 50);
INSERT INTO `detail_penilaian` VALUES (1323, 138, 220, 80);
INSERT INTO `detail_penilaian` VALUES (1374, 144, 241, 60);
INSERT INTO `detail_penilaian` VALUES (1375, 144, 242, 70);
INSERT INTO `detail_penilaian` VALUES (1376, 144, 243, 2);
INSERT INTO `detail_penilaian` VALUES (1377, 144, 244, 85);
INSERT INTO `detail_penilaian` VALUES (1378, 144, 245, 75);
INSERT INTO `detail_penilaian` VALUES (1379, 144, 246, 80);
INSERT INTO `detail_penilaian` VALUES (1380, 144, 247, 75);
INSERT INTO `detail_penilaian` VALUES (1381, 144, 248, 75);
INSERT INTO `detail_penilaian` VALUES (1382, 144, 249, 85);
INSERT INTO `detail_penilaian` VALUES (1383, 144, 250, 75);
INSERT INTO `detail_penilaian` VALUES (1384, 145, 251, 70);
INSERT INTO `detail_penilaian` VALUES (1385, 145, 252, 85);
INSERT INTO `detail_penilaian` VALUES (1386, 145, 253, 2);
INSERT INTO `detail_penilaian` VALUES (1387, 145, 254, 70);
INSERT INTO `detail_penilaian` VALUES (1388, 145, 255, 70);
INSERT INTO `detail_penilaian` VALUES (1389, 145, 256, 65);
INSERT INTO `detail_penilaian` VALUES (1390, 145, 257, 80);
INSERT INTO `detail_penilaian` VALUES (1391, 145, 258, 80);
INSERT INTO `detail_penilaian` VALUES (1392, 145, 259, 77);
INSERT INTO `detail_penilaian` VALUES (1393, 145, 260, 75);
INSERT INTO `detail_penilaian` VALUES (1394, 146, 251, 70);
INSERT INTO `detail_penilaian` VALUES (1395, 146, 252, 75);
INSERT INTO `detail_penilaian` VALUES (1396, 146, 253, 2);
INSERT INTO `detail_penilaian` VALUES (1397, 146, 254, 80);
INSERT INTO `detail_penilaian` VALUES (1398, 146, 255, 75);
INSERT INTO `detail_penilaian` VALUES (1399, 146, 256, 75);
INSERT INTO `detail_penilaian` VALUES (1400, 146, 257, 60);
INSERT INTO `detail_penilaian` VALUES (1401, 146, 258, 85);
INSERT INTO `detail_penilaian` VALUES (1402, 146, 259, 85);
INSERT INTO `detail_penilaian` VALUES (1403, 146, 260, 85);
INSERT INTO `detail_penilaian` VALUES (1404, 147, 251, 75);
INSERT INTO `detail_penilaian` VALUES (1405, 147, 252, 80);
INSERT INTO `detail_penilaian` VALUES (1406, 147, 253, 2);
INSERT INTO `detail_penilaian` VALUES (1407, 147, 254, 75);
INSERT INTO `detail_penilaian` VALUES (1408, 147, 255, 80);
INSERT INTO `detail_penilaian` VALUES (1409, 147, 256, 80);
INSERT INTO `detail_penilaian` VALUES (1410, 147, 257, 70);
INSERT INTO `detail_penilaian` VALUES (1411, 147, 258, 80);
INSERT INTO `detail_penilaian` VALUES (1412, 147, 259, 69);
INSERT INTO `detail_penilaian` VALUES (1413, 147, 260, 75);
INSERT INTO `detail_penilaian` VALUES (1414, 148, 251, 65);
INSERT INTO `detail_penilaian` VALUES (1415, 148, 252, 85);
INSERT INTO `detail_penilaian` VALUES (1416, 148, 253, 2);
INSERT INTO `detail_penilaian` VALUES (1417, 148, 254, 80);
INSERT INTO `detail_penilaian` VALUES (1418, 148, 255, 80);
INSERT INTO `detail_penilaian` VALUES (1419, 148, 256, 85);
INSERT INTO `detail_penilaian` VALUES (1420, 148, 257, 70);
INSERT INTO `detail_penilaian` VALUES (1421, 148, 258, 85);
INSERT INTO `detail_penilaian` VALUES (1422, 148, 259, 77);
INSERT INTO `detail_penilaian` VALUES (1423, 148, 260, 80);
INSERT INTO `detail_penilaian` VALUES (1454, 149, 221, 60);
INSERT INTO `detail_penilaian` VALUES (1455, 149, 222, 70);
INSERT INTO `detail_penilaian` VALUES (1456, 149, 223, 2);
INSERT INTO `detail_penilaian` VALUES (1457, 149, 224, 85);
INSERT INTO `detail_penilaian` VALUES (1458, 149, 225, 75);
INSERT INTO `detail_penilaian` VALUES (1459, 149, 226, 80);
INSERT INTO `detail_penilaian` VALUES (1460, 149, 227, 75);
INSERT INTO `detail_penilaian` VALUES (1461, 149, 228, 75);
INSERT INTO `detail_penilaian` VALUES (1462, 149, 229, 85);
INSERT INTO `detail_penilaian` VALUES (1463, 149, 230, 75);
INSERT INTO `detail_penilaian` VALUES (1464, 150, 231, 70);
INSERT INTO `detail_penilaian` VALUES (1465, 150, 232, 85);
INSERT INTO `detail_penilaian` VALUES (1466, 150, 233, 2);
INSERT INTO `detail_penilaian` VALUES (1467, 150, 234, 70);
INSERT INTO `detail_penilaian` VALUES (1468, 150, 235, 80);
INSERT INTO `detail_penilaian` VALUES (1469, 150, 236, 70);
INSERT INTO `detail_penilaian` VALUES (1470, 150, 237, 80);
INSERT INTO `detail_penilaian` VALUES (1471, 150, 238, 80);
INSERT INTO `detail_penilaian` VALUES (1472, 150, 239, 70);
INSERT INTO `detail_penilaian` VALUES (1473, 150, 240, 78);
INSERT INTO `detail_penilaian` VALUES (1474, 151, 231, 70);
INSERT INTO `detail_penilaian` VALUES (1475, 151, 232, 75);
INSERT INTO `detail_penilaian` VALUES (1476, 151, 233, 2);
INSERT INTO `detail_penilaian` VALUES (1477, 151, 234, 85);
INSERT INTO `detail_penilaian` VALUES (1478, 151, 235, 85);
INSERT INTO `detail_penilaian` VALUES (1479, 151, 236, 75);
INSERT INTO `detail_penilaian` VALUES (1480, 151, 237, 60);
INSERT INTO `detail_penilaian` VALUES (1481, 151, 238, 85);
INSERT INTO `detail_penilaian` VALUES (1482, 151, 239, 85);
INSERT INTO `detail_penilaian` VALUES (1483, 151, 240, 85);
INSERT INTO `detail_penilaian` VALUES (1484, 152, 231, 75);
INSERT INTO `detail_penilaian` VALUES (1485, 152, 232, 80);
INSERT INTO `detail_penilaian` VALUES (1486, 152, 233, 3);
INSERT INTO `detail_penilaian` VALUES (1487, 152, 234, 75);
INSERT INTO `detail_penilaian` VALUES (1488, 152, 235, 70);
INSERT INTO `detail_penilaian` VALUES (1489, 152, 236, 80);
INSERT INTO `detail_penilaian` VALUES (1490, 152, 237, 70);
INSERT INTO `detail_penilaian` VALUES (1491, 152, 238, 80);
INSERT INTO `detail_penilaian` VALUES (1492, 152, 239, 85);
INSERT INTO `detail_penilaian` VALUES (1493, 152, 240, 75);
INSERT INTO `detail_penilaian` VALUES (1494, 153, 231, 65);
INSERT INTO `detail_penilaian` VALUES (1495, 153, 232, 85);
INSERT INTO `detail_penilaian` VALUES (1496, 153, 233, 2);
INSERT INTO `detail_penilaian` VALUES (1497, 153, 234, 80);
INSERT INTO `detail_penilaian` VALUES (1498, 153, 235, 80);
INSERT INTO `detail_penilaian` VALUES (1499, 153, 236, 85);
INSERT INTO `detail_penilaian` VALUES (1500, 153, 237, 70);
INSERT INTO `detail_penilaian` VALUES (1501, 153, 238, 85);
INSERT INTO `detail_penilaian` VALUES (1502, 153, 239, 80);
INSERT INTO `detail_penilaian` VALUES (1503, 153, 240, 80);
INSERT INTO `detail_penilaian` VALUES (1504, 154, 161, 80);
INSERT INTO `detail_penilaian` VALUES (1505, 154, 162, 60);
INSERT INTO `detail_penilaian` VALUES (1506, 154, 163, 3);
INSERT INTO `detail_penilaian` VALUES (1507, 154, 164, 85);
INSERT INTO `detail_penilaian` VALUES (1508, 154, 165, 75);
INSERT INTO `detail_penilaian` VALUES (1509, 154, 166, 80);
INSERT INTO `detail_penilaian` VALUES (1510, 154, 167, 75);
INSERT INTO `detail_penilaian` VALUES (1511, 154, 168, 75);
INSERT INTO `detail_penilaian` VALUES (1512, 154, 169, 85);
INSERT INTO `detail_penilaian` VALUES (1513, 154, 170, 75);
INSERT INTO `detail_penilaian` VALUES (1514, 155, 171, 80);
INSERT INTO `detail_penilaian` VALUES (1515, 155, 172, 85);
INSERT INTO `detail_penilaian` VALUES (1516, 155, 173, 1);
INSERT INTO `detail_penilaian` VALUES (1517, 155, 174, 70);
INSERT INTO `detail_penilaian` VALUES (1518, 155, 175, 80);
INSERT INTO `detail_penilaian` VALUES (1519, 155, 176, 65);
INSERT INTO `detail_penilaian` VALUES (1520, 155, 177, 80);
INSERT INTO `detail_penilaian` VALUES (1521, 155, 178, 80);
INSERT INTO `detail_penilaian` VALUES (1522, 155, 179, 60);
INSERT INTO `detail_penilaian` VALUES (1523, 155, 180, 80);
INSERT INTO `detail_penilaian` VALUES (1524, 156, 171, 80);
INSERT INTO `detail_penilaian` VALUES (1525, 156, 172, 60);
INSERT INTO `detail_penilaian` VALUES (1526, 156, 173, 1);
INSERT INTO `detail_penilaian` VALUES (1527, 156, 174, 80);
INSERT INTO `detail_penilaian` VALUES (1528, 156, 175, 60);
INSERT INTO `detail_penilaian` VALUES (1529, 156, 176, 75);
INSERT INTO `detail_penilaian` VALUES (1530, 156, 177, 60);
INSERT INTO `detail_penilaian` VALUES (1531, 156, 178, 85);
INSERT INTO `detail_penilaian` VALUES (1532, 156, 179, 85);
INSERT INTO `detail_penilaian` VALUES (1533, 156, 180, 85);
INSERT INTO `detail_penilaian` VALUES (1534, 157, 161, 75);
INSERT INTO `detail_penilaian` VALUES (1535, 157, 162, 60);
INSERT INTO `detail_penilaian` VALUES (1536, 157, 163, 2);
INSERT INTO `detail_penilaian` VALUES (1537, 157, 164, 85);
INSERT INTO `detail_penilaian` VALUES (1538, 157, 165, 75);
INSERT INTO `detail_penilaian` VALUES (1539, 157, 166, 80);
INSERT INTO `detail_penilaian` VALUES (1540, 157, 167, 75);
INSERT INTO `detail_penilaian` VALUES (1541, 157, 168, 75);
INSERT INTO `detail_penilaian` VALUES (1542, 157, 169, 85);
INSERT INTO `detail_penilaian` VALUES (1543, 157, 170, 75);
INSERT INTO `detail_penilaian` VALUES (1544, 158, 171, 80);
INSERT INTO `detail_penilaian` VALUES (1545, 158, 172, 85);
INSERT INTO `detail_penilaian` VALUES (1546, 158, 173, 2);
INSERT INTO `detail_penilaian` VALUES (1547, 158, 174, 80);
INSERT INTO `detail_penilaian` VALUES (1548, 158, 175, 80);
INSERT INTO `detail_penilaian` VALUES (1549, 158, 176, 85);
INSERT INTO `detail_penilaian` VALUES (1550, 158, 177, 80);
INSERT INTO `detail_penilaian` VALUES (1551, 158, 178, 85);
INSERT INTO `detail_penilaian` VALUES (1552, 158, 179, 75);
INSERT INTO `detail_penilaian` VALUES (1553, 158, 180, 80);
INSERT INTO `detail_penilaian` VALUES (1554, 159, 171, 80);
INSERT INTO `detail_penilaian` VALUES (1555, 159, 172, 80);
INSERT INTO `detail_penilaian` VALUES (1556, 159, 173, 2);
INSERT INTO `detail_penilaian` VALUES (1557, 159, 174, 75);
INSERT INTO `detail_penilaian` VALUES (1558, 159, 175, 70);
INSERT INTO `detail_penilaian` VALUES (1559, 159, 176, 80);
INSERT INTO `detail_penilaian` VALUES (1560, 159, 177, 70);
INSERT INTO `detail_penilaian` VALUES (1561, 159, 178, 80);
INSERT INTO `detail_penilaian` VALUES (1562, 159, 179, 70);
INSERT INTO `detail_penilaian` VALUES (1563, 159, 180, 75);
INSERT INTO `detail_penilaian` VALUES (1564, 160, 221, 60);
INSERT INTO `detail_penilaian` VALUES (1565, 160, 222, 70);
INSERT INTO `detail_penilaian` VALUES (1566, 160, 223, 1);
INSERT INTO `detail_penilaian` VALUES (1567, 160, 224, 85);
INSERT INTO `detail_penilaian` VALUES (1568, 160, 225, 75);
INSERT INTO `detail_penilaian` VALUES (1569, 160, 226, 80);
INSERT INTO `detail_penilaian` VALUES (1570, 160, 227, 75);
INSERT INTO `detail_penilaian` VALUES (1571, 160, 228, 75);
INSERT INTO `detail_penilaian` VALUES (1572, 160, 229, 85);
INSERT INTO `detail_penilaian` VALUES (1573, 160, 230, 75);
INSERT INTO `detail_penilaian` VALUES (1574, 161, 231, 70);
INSERT INTO `detail_penilaian` VALUES (1575, 161, 232, 85);
INSERT INTO `detail_penilaian` VALUES (1576, 161, 233, 2);
INSERT INTO `detail_penilaian` VALUES (1577, 161, 234, 70);
INSERT INTO `detail_penilaian` VALUES (1578, 161, 235, 80);
INSERT INTO `detail_penilaian` VALUES (1579, 161, 236, 65);
INSERT INTO `detail_penilaian` VALUES (1580, 161, 237, 80);
INSERT INTO `detail_penilaian` VALUES (1581, 161, 238, 80);
INSERT INTO `detail_penilaian` VALUES (1582, 161, 239, 60);
INSERT INTO `detail_penilaian` VALUES (1583, 161, 240, 80);
INSERT INTO `detail_penilaian` VALUES (1584, 162, 231, 70);
INSERT INTO `detail_penilaian` VALUES (1585, 162, 232, 75);
INSERT INTO `detail_penilaian` VALUES (1586, 162, 233, 3);
INSERT INTO `detail_penilaian` VALUES (1587, 162, 234, 80);
INSERT INTO `detail_penilaian` VALUES (1588, 162, 235, 85);
INSERT INTO `detail_penilaian` VALUES (1589, 162, 236, 75);
INSERT INTO `detail_penilaian` VALUES (1590, 162, 237, 60);
INSERT INTO `detail_penilaian` VALUES (1591, 162, 238, 85);
INSERT INTO `detail_penilaian` VALUES (1592, 162, 239, 85);
INSERT INTO `detail_penilaian` VALUES (1593, 162, 240, 85);
INSERT INTO `detail_penilaian` VALUES (1594, 163, 231, 75);
INSERT INTO `detail_penilaian` VALUES (1595, 163, 232, 80);
INSERT INTO `detail_penilaian` VALUES (1596, 163, 233, 3);
INSERT INTO `detail_penilaian` VALUES (1597, 163, 234, 75);
INSERT INTO `detail_penilaian` VALUES (1598, 163, 235, 70);
INSERT INTO `detail_penilaian` VALUES (1599, 163, 236, 80);
INSERT INTO `detail_penilaian` VALUES (1600, 163, 237, 70);
INSERT INTO `detail_penilaian` VALUES (1601, 163, 238, 80);
INSERT INTO `detail_penilaian` VALUES (1602, 163, 239, 60);
INSERT INTO `detail_penilaian` VALUES (1603, 163, 240, 75);
INSERT INTO `detail_penilaian` VALUES (1604, 164, 231, 65);
INSERT INTO `detail_penilaian` VALUES (1605, 164, 232, 85);
INSERT INTO `detail_penilaian` VALUES (1606, 164, 233, 2);
INSERT INTO `detail_penilaian` VALUES (1607, 164, 234, 80);
INSERT INTO `detail_penilaian` VALUES (1608, 164, 235, 80);
INSERT INTO `detail_penilaian` VALUES (1609, 164, 236, 85);
INSERT INTO `detail_penilaian` VALUES (1610, 164, 237, 70);
INSERT INTO `detail_penilaian` VALUES (1611, 164, 238, 85);
INSERT INTO `detail_penilaian` VALUES (1612, 164, 239, 50);
INSERT INTO `detail_penilaian` VALUES (1613, 164, 240, 80);
INSERT INTO `detail_penilaian` VALUES (1614, 165, 121, 75);
INSERT INTO `detail_penilaian` VALUES (1615, 165, 122, 75);
INSERT INTO `detail_penilaian` VALUES (1616, 165, 123, 2);
INSERT INTO `detail_penilaian` VALUES (1617, 165, 124, 75);
INSERT INTO `detail_penilaian` VALUES (1618, 165, 125, 80);
INSERT INTO `detail_penilaian` VALUES (1619, 165, 126, 80);
INSERT INTO `detail_penilaian` VALUES (1620, 165, 127, 75);
INSERT INTO `detail_penilaian` VALUES (1621, 165, 128, 75);
INSERT INTO `detail_penilaian` VALUES (1622, 165, 129, 75);
INSERT INTO `detail_penilaian` VALUES (1623, 165, 130, 75);
INSERT INTO `detail_penilaian` VALUES (1624, 166, 241, 7);
INSERT INTO `detail_penilaian` VALUES (1625, 166, 242, 7);
INSERT INTO `detail_penilaian` VALUES (1626, 166, 243, 7);
INSERT INTO `detail_penilaian` VALUES (1627, 166, 244, 7);
INSERT INTO `detail_penilaian` VALUES (1628, 166, 245, 7);
INSERT INTO `detail_penilaian` VALUES (1629, 166, 246, 7);
INSERT INTO `detail_penilaian` VALUES (1630, 166, 247, 7);
INSERT INTO `detail_penilaian` VALUES (1631, 166, 248, 7);
INSERT INTO `detail_penilaian` VALUES (1632, 166, 249, 7);
INSERT INTO `detail_penilaian` VALUES (1633, 166, 250, 7);
INSERT INTO `detail_penilaian` VALUES (1634, 167, 241, 7);
INSERT INTO `detail_penilaian` VALUES (1635, 167, 242, 7);
INSERT INTO `detail_penilaian` VALUES (1636, 167, 243, 7);
INSERT INTO `detail_penilaian` VALUES (1637, 167, 244, 7);
INSERT INTO `detail_penilaian` VALUES (1638, 167, 245, 7);
INSERT INTO `detail_penilaian` VALUES (1639, 167, 246, 7);
INSERT INTO `detail_penilaian` VALUES (1640, 167, 247, 7);
INSERT INTO `detail_penilaian` VALUES (1641, 167, 248, 7);
INSERT INTO `detail_penilaian` VALUES (1642, 167, 249, 7);
INSERT INTO `detail_penilaian` VALUES (1643, 168, 241, 7);
INSERT INTO `detail_penilaian` VALUES (1644, 168, 242, 7);
INSERT INTO `detail_penilaian` VALUES (1645, 168, 243, 7);
INSERT INTO `detail_penilaian` VALUES (1646, 168, 244, 7);
INSERT INTO `detail_penilaian` VALUES (1647, 168, 245, 7);
INSERT INTO `detail_penilaian` VALUES (1648, 168, 246, 7);
INSERT INTO `detail_penilaian` VALUES (1649, 168, 247, 7);
INSERT INTO `detail_penilaian` VALUES (1650, 168, 248, 7);
INSERT INTO `detail_penilaian` VALUES (1651, 168, 249, 7);
INSERT INTO `detail_penilaian` VALUES (1652, 168, 250, 7);
INSERT INTO `detail_penilaian` VALUES (1653, 169, 241, 7);
INSERT INTO `detail_penilaian` VALUES (1654, 169, 242, 7);
INSERT INTO `detail_penilaian` VALUES (1655, 169, 243, 7);
INSERT INTO `detail_penilaian` VALUES (1656, 169, 244, 7);
INSERT INTO `detail_penilaian` VALUES (1657, 169, 245, 7);
INSERT INTO `detail_penilaian` VALUES (1658, 169, 246, 7);
INSERT INTO `detail_penilaian` VALUES (1659, 169, 247, 7);
INSERT INTO `detail_penilaian` VALUES (1660, 169, 248, 7);
INSERT INTO `detail_penilaian` VALUES (1661, 169, 249, 7);
INSERT INTO `detail_penilaian` VALUES (1662, 169, 250, 7);
INSERT INTO `detail_penilaian` VALUES (1663, 170, 241, 2);
INSERT INTO `detail_penilaian` VALUES (1664, 170, 242, 3);
INSERT INTO `detail_penilaian` VALUES (1665, 170, 243, 4);
INSERT INTO `detail_penilaian` VALUES (1666, 170, 244, 2);
INSERT INTO `detail_penilaian` VALUES (1667, 170, 245, 4);
INSERT INTO `detail_penilaian` VALUES (1668, 170, 246, 5);
INSERT INTO `detail_penilaian` VALUES (1669, 170, 247, 2);
INSERT INTO `detail_penilaian` VALUES (1670, 170, 248, 3);
INSERT INTO `detail_penilaian` VALUES (1671, 170, 249, 4);
INSERT INTO `detail_penilaian` VALUES (1672, 170, 250, 2);

-- ----------------------------
-- Table structure for jabatan_pegawai
-- ----------------------------
DROP TABLE IF EXISTS `jabatan_pegawai`;
CREATE TABLE `jabatan_pegawai`  (
  `id_jabatan` int NOT NULL AUTO_INCREMENT,
  `id_pegawai` char(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `id_unit_kerja` int NOT NULL DEFAULT 0,
  `id_bagian` char(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `jabatan` enum('manager','HRD','koordinator','karyawan') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Status` tinyint(1) NOT NULL,
  `tgl_jabat` date NOT NULL,
  PRIMARY KEY (`id_jabatan`) USING BTREE,
  INDEX `FK_jabatan_pegawai_pegawai`(`id_pegawai`) USING BTREE,
  INDEX `FK_jabatan_pegawai_toko`(`id_unit_kerja`) USING BTREE,
  INDEX `FK_jabatan_pegawai_bagian`(`id_bagian`) USING BTREE,
  CONSTRAINT `FK_jabatan_pegawai_bagian` FOREIGN KEY (`id_bagian`) REFERENCES `bagian` (`id_bagian`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_jabatan_pegawai_pegawai` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`no_pegawai`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_jabatan_pegawai_toko` FOREIGN KEY (`id_unit_kerja`) REFERENCES `unit_kerja` (`id_unit_kerja`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 137 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jabatan_pegawai
-- ----------------------------
INSERT INTO `jabatan_pegawai` VALUES (15, 'P-0001', 27, 'B-0008', 'koordinator', 1, '2010-02-20');
INSERT INTO `jabatan_pegawai` VALUES (16, 'P-0002', 27, 'B-0008', 'karyawan', 1, '2011-02-10');
INSERT INTO `jabatan_pegawai` VALUES (17, 'P-0003', 27, 'B-0008', 'karyawan', 1, '2012-11-10');
INSERT INTO `jabatan_pegawai` VALUES (18, 'P-0004', 27, 'B-0008', 'karyawan', 1, '2015-07-20');
INSERT INTO `jabatan_pegawai` VALUES (19, 'P-0005', 27, 'B-0008', 'karyawan', 1, '2015-10-10');
INSERT INTO `jabatan_pegawai` VALUES (20, 'P-0006', 27, 'B-0002', 'koordinator', 1, '2010-03-13');
INSERT INTO `jabatan_pegawai` VALUES (21, 'P-0007', 27, 'B-0002', 'karyawan', 1, '2010-10-12');
INSERT INTO `jabatan_pegawai` VALUES (22, 'P-0008', 27, 'B-0002', 'karyawan', 1, '2012-01-25');
INSERT INTO `jabatan_pegawai` VALUES (23, 'P-0009', 27, 'B-0002', 'karyawan', 1, '2014-05-02');
INSERT INTO `jabatan_pegawai` VALUES (24, 'P-0010', 27, 'B-0002', 'karyawan', 1, '2016-09-10');
INSERT INTO `jabatan_pegawai` VALUES (25, 'P-0011', 27, 'B-0003', 'koordinator', 1, '2010-10-20');
INSERT INTO `jabatan_pegawai` VALUES (26, 'P-0012', 27, 'B-0003', 'karyawan', 1, '2011-02-10');
INSERT INTO `jabatan_pegawai` VALUES (27, 'P-0013', 27, 'B-0003', 'karyawan', 1, '2012-11-10');
INSERT INTO `jabatan_pegawai` VALUES (28, 'P-0014', 27, 'B-0003', 'karyawan', 1, '2015-07-02');
INSERT INTO `jabatan_pegawai` VALUES (29, 'P-0015', 27, 'B-0003', 'karyawan', 1, '2016-10-10');
INSERT INTO `jabatan_pegawai` VALUES (30, 'P-0016', 27, 'B-0004', 'koordinator', 1, '2009-03-10');
INSERT INTO `jabatan_pegawai` VALUES (31, 'P-0017', 27, 'B-0004', 'karyawan', 1, '2010-07-27');
INSERT INTO `jabatan_pegawai` VALUES (32, 'P-0018', 27, 'B-0004', 'karyawan', 1, '2013-01-21');
INSERT INTO `jabatan_pegawai` VALUES (33, 'P-0019', 27, 'B-0004', 'karyawan', 1, '2015-11-02');
INSERT INTO `jabatan_pegawai` VALUES (34, 'P-0020', 27, 'B-0004', 'karyawan', 1, '2015-12-02');
INSERT INTO `jabatan_pegawai` VALUES (35, 'P-0021', 27, 'B-0005', 'koordinator', 1, '2009-04-12');
INSERT INTO `jabatan_pegawai` VALUES (36, 'P-0022', 27, 'B-0005', 'karyawan', 1, '2010-12-10');
INSERT INTO `jabatan_pegawai` VALUES (37, 'P-0023', 27, 'B-0005', 'karyawan', 1, '2011-05-01');
INSERT INTO `jabatan_pegawai` VALUES (38, 'P-0024', 27, 'B-0005', 'karyawan', 1, '2014-10-02');
INSERT INTO `jabatan_pegawai` VALUES (39, 'P-0025', 27, 'B-0005', 'karyawan', 1, '2014-11-20');
INSERT INTO `jabatan_pegawai` VALUES (40, 'P-0026', 27, 'B-0007', 'koordinator', 1, '2010-10-20');
INSERT INTO `jabatan_pegawai` VALUES (41, 'P-0027', 27, 'B-0007', 'karyawan', 1, '2011-02-10');
INSERT INTO `jabatan_pegawai` VALUES (42, 'P-0028', 27, 'B-0007', 'karyawan', 1, '2012-11-10');
INSERT INTO `jabatan_pegawai` VALUES (43, 'P-0029', 27, 'B-0007', 'karyawan', 1, '2015-02-02');
INSERT INTO `jabatan_pegawai` VALUES (44, 'P-0030', 27, 'B-0007', 'karyawan', 1, '2015-07-07');
INSERT INTO `jabatan_pegawai` VALUES (45, 'P-0031', 27, 'B-0001', 'koordinator', 1, '2009-02-21');
INSERT INTO `jabatan_pegawai` VALUES (46, 'P-0032', 27, 'B-0001', 'karyawan', 1, '2011-09-10');
INSERT INTO `jabatan_pegawai` VALUES (47, 'P-0033', 27, 'B-0001', 'karyawan', 1, '2011-10-11');
INSERT INTO `jabatan_pegawai` VALUES (48, 'P-0034', 27, 'B-0001', 'karyawan', 1, '2011-10-11');
INSERT INTO `jabatan_pegawai` VALUES (49, 'P-0035', 27, 'B-0001', 'karyawan', 1, '2013-08-25');
INSERT INTO `jabatan_pegawai` VALUES (50, 'P-0036', 27, 'B-0006', 'koordinator', 1, '2009-05-12');
INSERT INTO `jabatan_pegawai` VALUES (51, 'P-0037', 27, 'B-0006', 'karyawan', 1, '2010-12-10');
INSERT INTO `jabatan_pegawai` VALUES (52, 'P-0038', 27, 'B-0006', 'karyawan', 1, '2011-11-11');
INSERT INTO `jabatan_pegawai` VALUES (53, 'P-0039', 27, 'B-0006', 'karyawan', 1, '2012-08-05');
INSERT INTO `jabatan_pegawai` VALUES (54, 'P-0040', 27, 'B-0006', 'karyawan', 1, '2012-08-05');
INSERT INTO `jabatan_pegawai` VALUES (55, 'P-0041', 28, 'B-0001', 'koordinator', 1, '2010-01-20');
INSERT INTO `jabatan_pegawai` VALUES (56, 'P-0042', 28, 'B-0001', 'karyawan', 1, '2011-02-10');
INSERT INTO `jabatan_pegawai` VALUES (57, 'P-0043', 28, 'B-0001', 'karyawan', 1, '2012-11-10');
INSERT INTO `jabatan_pegawai` VALUES (58, 'P-0044', 28, 'B-0001', 'karyawan', 1, '2015-07-02');
INSERT INTO `jabatan_pegawai` VALUES (59, 'P-0045', 28, 'B-0001', 'karyawan', 1, '2016-09-10');
INSERT INTO `jabatan_pegawai` VALUES (60, 'P-0046', 28, 'B-0002', 'koordinator', 1, '2009-08-17');
INSERT INTO `jabatan_pegawai` VALUES (61, 'P-0047', 28, 'B-0002', 'karyawan', 1, '2011-09-07');
INSERT INTO `jabatan_pegawai` VALUES (62, 'P-0048', 28, 'B-0002', 'karyawan', 1, '2011-09-09');
INSERT INTO `jabatan_pegawai` VALUES (63, 'P-0049', 28, 'B-0002', 'karyawan', 1, '2013-05-10');
INSERT INTO `jabatan_pegawai` VALUES (64, 'P-0050', 28, 'B-0002', 'karyawan', 1, '2014-09-04');
INSERT INTO `jabatan_pegawai` VALUES (65, 'P-0051', 28, 'B-0003', 'koordinator', 1, '2010-05-21');
INSERT INTO `jabatan_pegawai` VALUES (66, 'P-0052', 28, 'B-0003', 'karyawan', 1, '2010-06-05');
INSERT INTO `jabatan_pegawai` VALUES (67, 'P-0053', 28, 'B-0003', 'karyawan', 1, '2010-06-05');
INSERT INTO `jabatan_pegawai` VALUES (68, 'P-0054', 28, 'B-0003', 'karyawan', 1, '2013-09-10');
INSERT INTO `jabatan_pegawai` VALUES (69, 'P-0055', 28, 'B-0003', 'karyawan', 1, '2015-09-05');
INSERT INTO `jabatan_pegawai` VALUES (70, 'P-0056', 28, 'B-0004', 'koordinator', 1, '2009-12-11');
INSERT INTO `jabatan_pegawai` VALUES (71, 'P-0057', 28, 'B-0004', 'karyawan', 1, '2010-10-05');
INSERT INTO `jabatan_pegawai` VALUES (72, 'P-0058', 28, 'B-0004', 'karyawan', 1, '2010-10-05');
INSERT INTO `jabatan_pegawai` VALUES (73, 'P-0059', 28, 'B-0004', 'karyawan', 1, '2014-04-04');
INSERT INTO `jabatan_pegawai` VALUES (74, 'P-0060', 28, 'B-0004', 'karyawan', 1, '2016-04-04');
INSERT INTO `jabatan_pegawai` VALUES (75, 'P-0061', 28, 'B-0005', 'koordinator', 1, '2009-06-21');
INSERT INTO `jabatan_pegawai` VALUES (76, 'P-0062', 28, 'B-0005', 'karyawan', 1, '2010-08-20');
INSERT INTO `jabatan_pegawai` VALUES (77, 'P-0063', 28, 'B-0005', 'karyawan', 1, '2010-08-20');
INSERT INTO `jabatan_pegawai` VALUES (78, 'P-0064', 28, 'B-0005', 'karyawan', 1, '2013-09-21');
INSERT INTO `jabatan_pegawai` VALUES (79, 'P-0065', 28, 'B-0005', 'karyawan', 1, '2015-10-02');
INSERT INTO `jabatan_pegawai` VALUES (80, 'P-0066', 28, 'B-0006', 'koordinator', 1, '2010-11-10');
INSERT INTO `jabatan_pegawai` VALUES (81, 'P-0067', 28, 'B-0006', 'karyawan', 1, '2011-11-10');
INSERT INTO `jabatan_pegawai` VALUES (82, 'P-0068', 28, 'B-0006', 'karyawan', 1, '2011-12-10');
INSERT INTO `jabatan_pegawai` VALUES (83, 'P-0069', 28, 'B-0006', 'karyawan', 1, '2011-12-10');
INSERT INTO `jabatan_pegawai` VALUES (84, 'P-0070', 28, 'B-0006', 'karyawan', 1, '2012-12-12');
INSERT INTO `jabatan_pegawai` VALUES (85, 'P-0071', 28, 'B-0007', 'koordinator', 1, '2011-09-10');
INSERT INTO `jabatan_pegawai` VALUES (86, 'P-0072', 28, 'B-0007', 'karyawan', 1, '2012-09-10');
INSERT INTO `jabatan_pegawai` VALUES (87, 'P-0073', 28, 'B-0007', 'karyawan', 1, '2012-10-11');
INSERT INTO `jabatan_pegawai` VALUES (88, 'P-0074', 28, 'B-0007', 'karyawan', 1, '2012-10-11');
INSERT INTO `jabatan_pegawai` VALUES (89, 'P-0075', 28, 'B-0007', 'karyawan', 1, '2015-09-04');
INSERT INTO `jabatan_pegawai` VALUES (90, 'P-0076', 28, 'B-0008', 'koordinator', 1, '2011-05-05');
INSERT INTO `jabatan_pegawai` VALUES (91, 'P-0077', 28, 'B-0008', 'karyawan', 1, '2012-06-05');
INSERT INTO `jabatan_pegawai` VALUES (92, 'P-0078', 28, 'B-0008', 'karyawan', 1, '2012-06-05');
INSERT INTO `jabatan_pegawai` VALUES (93, 'P-0079', 28, 'B-0008', 'karyawan', 1, '2014-07-07');
INSERT INTO `jabatan_pegawai` VALUES (94, 'P-0080', 28, 'B-0008', 'karyawan', 1, '2014-08-07');
INSERT INTO `jabatan_pegawai` VALUES (95, 'P-0081', 29, 'B-0001', 'koordinator', 1, '2010-06-26');
INSERT INTO `jabatan_pegawai` VALUES (96, 'P-0082', 29, 'B-0001', 'karyawan', 1, '2012-07-26');
INSERT INTO `jabatan_pegawai` VALUES (97, 'P-0083', 29, 'B-0001', 'karyawan', 1, '2012-07-26');
INSERT INTO `jabatan_pegawai` VALUES (98, 'P-0084', 29, 'B-0001', 'karyawan', 1, '2014-09-05');
INSERT INTO `jabatan_pegawai` VALUES (99, 'P-0085', 29, 'B-0001', 'karyawan', 1, '2014-09-05');
INSERT INTO `jabatan_pegawai` VALUES (100, 'P-0086', 29, 'B-0002', 'koordinator', 1, '2008-12-25');
INSERT INTO `jabatan_pegawai` VALUES (101, 'P-0087', 29, 'B-0002', 'karyawan', 1, '2010-01-02');
INSERT INTO `jabatan_pegawai` VALUES (102, 'P-0088', 29, 'B-0002', 'karyawan', 1, '2010-02-03');
INSERT INTO `jabatan_pegawai` VALUES (103, 'P-0089', 29, 'B-0002', 'karyawan', 1, '2010-02-03');
INSERT INTO `jabatan_pegawai` VALUES (104, 'P-0090', 29, 'B-0002', 'karyawan', 1, '2014-08-31');
INSERT INTO `jabatan_pegawai` VALUES (105, 'P-0091', 29, 'B-0003', 'koordinator', 1, '2009-12-05');
INSERT INTO `jabatan_pegawai` VALUES (106, 'P-0092', 29, 'B-0003', 'karyawan', 1, '2010-11-05');
INSERT INTO `jabatan_pegawai` VALUES (107, 'P-0093', 29, 'B-0003', 'karyawan', 1, '2011-07-06');
INSERT INTO `jabatan_pegawai` VALUES (108, 'P-0094', 29, 'B-0003', 'karyawan', 1, '2011-07-08');
INSERT INTO `jabatan_pegawai` VALUES (109, 'P-0095', 29, 'B-0003', 'karyawan', 1, '2011-07-08');
INSERT INTO `jabatan_pegawai` VALUES (110, 'P-0096', 29, 'B-0004', 'koordinator', 1, '2010-03-25');
INSERT INTO `jabatan_pegawai` VALUES (111, 'P-0097', 29, 'B-0004', 'karyawan', 1, '2010-03-26');
INSERT INTO `jabatan_pegawai` VALUES (112, 'P-0098', 29, 'B-0004', 'karyawan', 1, '2011-07-02');
INSERT INTO `jabatan_pegawai` VALUES (113, 'P-0099', 29, 'B-0004', 'karyawan', 1, '2011-07-02');
INSERT INTO `jabatan_pegawai` VALUES (114, 'P-0100', 29, 'B-0004', 'karyawan', 1, '2011-11-20');
INSERT INTO `jabatan_pegawai` VALUES (115, 'P-0101', 29, 'B-0005', 'koordinator', 1, '2009-06-05');
INSERT INTO `jabatan_pegawai` VALUES (116, 'P-0102', 29, 'B-0005', 'karyawan', 1, '2010-07-05');
INSERT INTO `jabatan_pegawai` VALUES (117, 'P-0103', 29, 'B-0005', 'karyawan', 1, '2010-07-25');
INSERT INTO `jabatan_pegawai` VALUES (118, 'P-0104', 29, 'B-0005', 'karyawan', 1, '2011-10-10');
INSERT INTO `jabatan_pegawai` VALUES (119, 'P-0105', 29, 'B-0005', 'karyawan', 1, '2011-10-11');
INSERT INTO `jabatan_pegawai` VALUES (120, 'P-0106', 29, 'B-0006', 'koordinator', 1, '2010-12-12');
INSERT INTO `jabatan_pegawai` VALUES (121, 'P-0107', 29, 'B-0006', 'karyawan', 1, '2011-11-12');
INSERT INTO `jabatan_pegawai` VALUES (122, 'P-0108', 29, 'B-0006', 'karyawan', 1, '2011-11-12');
INSERT INTO `jabatan_pegawai` VALUES (123, 'P-0109', 29, 'B-0006', 'karyawan', 1, '2012-04-24');
INSERT INTO `jabatan_pegawai` VALUES (124, 'P-0110', 29, 'B-0006', 'karyawan', 1, '2012-05-25');
INSERT INTO `jabatan_pegawai` VALUES (125, 'P-0111', 29, 'B-0007', 'koordinator', 1, '2009-05-15');
INSERT INTO `jabatan_pegawai` VALUES (126, 'P-0112', 29, 'B-0007', 'karyawan', 1, '2010-05-15');
INSERT INTO `jabatan_pegawai` VALUES (127, 'P-0113', 29, 'B-0007', 'karyawan', 1, '2011-06-16');
INSERT INTO `jabatan_pegawai` VALUES (128, 'P-0114', 29, 'B-0007', 'karyawan', 1, '2011-07-20');
INSERT INTO `jabatan_pegawai` VALUES (129, 'P-0115', 29, 'B-0007', 'karyawan', 1, '2012-08-21');
INSERT INTO `jabatan_pegawai` VALUES (130, 'P-0116', 29, 'B-0008', 'koordinator', 1, '2010-10-06');
INSERT INTO `jabatan_pegawai` VALUES (131, 'P-0117', 29, 'B-0008', 'karyawan', 1, '2012-07-07');
INSERT INTO `jabatan_pegawai` VALUES (132, 'P-0118', 29, 'B-0008', 'karyawan', 1, '2012-07-08');
INSERT INTO `jabatan_pegawai` VALUES (133, 'P-0119', 29, 'B-0008', 'karyawan', 1, '2012-09-09');
INSERT INTO `jabatan_pegawai` VALUES (134, 'P-0120', 29, 'B-0008', 'karyawan', 1, '2013-10-09');
INSERT INTO `jabatan_pegawai` VALUES (135, 'P-0121', 34, 'B-0009', 'HRD', 1, '1999-05-03');
INSERT INTO `jabatan_pegawai` VALUES (136, 'P-0122', 34, 'B-0009', 'manager', 1, '2012-12-12');

-- ----------------------------
-- Table structure for kriteria
-- ----------------------------
DROP TABLE IF EXISTS `kriteria`;
CREATE TABLE `kriteria`  (
  `id_kriteria` char(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_kriteria` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `atribut` enum('K','B') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_kriteria`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kriteria
-- ----------------------------
INSERT INTO `kriteria` VALUES ('K-0001', 'Kejujuran', 'K');
INSERT INTO `kriteria` VALUES ('K-0002', 'Taat Peraturan', 'K');
INSERT INTO `kriteria` VALUES ('K-0003', 'Alfa/Absen', 'B');
INSERT INTO `kriteria` VALUES ('K-0004', 'Kedisiplinan', 'K');
INSERT INTO `kriteria` VALUES ('K-0005', 'Tanggung Jawab', 'K');
INSERT INTO `kriteria` VALUES ('K-0006', 'Kebersihan', 'K');
INSERT INTO `kriteria` VALUES ('K-0007', 'Kerajinan', 'K');
INSERT INTO `kriteria` VALUES ('K-0008', 'Kreatifitas', 'K');
INSERT INTO `kriteria` VALUES ('K-0009', 'Kerjasama', 'K');
INSERT INTO `kriteria` VALUES ('K-0010', 'Senyuman', 'K');

-- ----------------------------
-- Table structure for pegawai
-- ----------------------------
DROP TABLE IF EXISTS `pegawai`;
CREATE TABLE `pegawai`  (
  `no_pegawai` char(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tempat_lahir` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jekel` enum('L','P') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `agama` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status_perkawinan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_telp` char(13) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `alamat` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_masuk` date NOT NULL,
  PRIMARY KEY (`no_pegawai`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pegawai
-- ----------------------------
INSERT INTO `pegawai` VALUES ('P-0001', 'Lala', 'Bantul', '1990-02-03', 'P', 'Islam', 'Kawin', '085643127677', 'Jalan Bantul no 10 Yogyakarta', '2010-01-20');
INSERT INTO `pegawai` VALUES ('P-0002', 'Brian', 'Yogyakarta', '1990-06-18', 'L', 'Islam', 'Belum kawin', '089729987678', 'Jalan Veteran no 101 Yogyakarta', '2011-02-10');
INSERT INTO `pegawai` VALUES ('P-0003', 'Mei ', 'Sleman', '1989-05-15', 'P', 'Islam', 'Belum kawin', '089765432199', 'Kalasan Sleman Yogyakarta', '2012-11-10');
INSERT INTO `pegawai` VALUES ('P-0004', 'Rafiq', 'Bantul ', '1996-06-13', 'L', 'Islam', 'Belum kawin', '085678901234', 'Jalan Imogiri Barat km 7 Bantul', '2015-07-20');
INSERT INTO `pegawai` VALUES ('P-0005', 'Riri', 'Bantul', '1996-02-03', 'P', 'Islam', 'Belum kawin', '085137677011', 'Sewon Bantul Yogyakarta', '2015-10-10');
INSERT INTO `pegawai` VALUES ('P-0006', 'Fahmi', 'Sleman', '1989-02-10', 'L', 'Islam', 'Kawin', '098765432199', 'Sleman Yogyakarta', '2010-03-12');
INSERT INTO `pegawai` VALUES ('P-0007', 'Rahmad', 'Bantul', '1992-03-12', 'L', 'Islam', 'Kawin', '081327677015', 'Bantul Yogyakarta', '2010-10-12');
INSERT INTO `pegawai` VALUES ('P-0008', 'Linda', 'Yogyakarta', '1996-11-12', 'P', 'Islam', 'Belum kawin', '082137788977', 'Jalan Kusumanegara', '2012-01-25');
INSERT INTO `pegawai` VALUES ('P-0009', 'Febri', 'Bantul', '1995-03-10', 'L', 'Islam', 'Belum kawin', '087677577877', 'Kalasan Sleman', '2014-05-02');
INSERT INTO `pegawai` VALUES ('P-0010', 'Khoir', 'Kulon Progo', '1991-01-01', 'P', 'Islam', 'Kawin', '087977899001', 'Jalan Tamansiswa Yogyakarta', '2016-09-10');
INSERT INTO `pegawai` VALUES ('P-0011', 'Rohma', 'Bantul', '1990-08-09', 'P', 'Islam', 'Kawin', '087654321000', 'Bantul Yogyakarta', '2010-10-20');
INSERT INTO `pegawai` VALUES ('P-0012', 'Kartika', 'Yogyakarta', '1992-01-12', 'L', 'Islam', 'Kawin', '089765432111', 'Jalan Abu Bakar Yogyakarta', '2011-02-10');
INSERT INTO `pegawai` VALUES ('P-0013', 'Yuyun', 'Sleman', '1988-10-11', 'P', 'Islam', 'Kawin', '089765432188', 'Sleman Yogyakarta', '2012-11-10');
INSERT INTO `pegawai` VALUES ('P-0014', 'Puput', 'Gunungkidul', '1990-10-20', 'P', 'Islam', 'Belum kawin', '087654123321', 'Piyungan Bantul Yogyakarta', '2015-07-02');
INSERT INTO `pegawai` VALUES ('P-0015', 'Meida', 'Yogyakarta', '1992-03-03', 'P', 'Islam', 'Kawin', '087654321444', 'Jalan Sultan Agung Yogyakarta', '2016-10-10');
INSERT INTO `pegawai` VALUES ('P-0016', 'Sigit', 'Sleman', '1988-12-27', 'L', 'Islam', 'Kawin', '086543217877', 'Sleman Yogyakarta', '2009-03-10');
INSERT INTO `pegawai` VALUES ('P-0017', 'Ika', 'Bantul', '1993-03-10', 'P', 'Islam', 'Belum kawin', '089765432100', 'Bantul Yogyakarta', '2010-07-27');
INSERT INTO `pegawai` VALUES ('P-0018', 'Aldo', 'Gunungkidul', '1990-07-20', 'L', 'Islam', 'Belum kawin', '087654123900', 'Gunungkidul Yogyakarta', '2013-01-21');
INSERT INTO `pegawai` VALUES ('P-0019', 'Irman', 'Bantul', '1989-09-09', 'L', 'Islam', 'Kawin', '089765432199', 'Bantul Yogyakarta', '2015-11-02');
INSERT INTO `pegawai` VALUES ('P-0020', 'Laily', 'Yogyakarta', '1996-11-10', 'P', 'Islam', 'Belum kawin', '087654399877', 'Bantul Yogyakarta', '2015-12-02');
INSERT INTO `pegawai` VALUES ('P-0021', 'Nia', 'Cilacap', '1989-11-20', 'P', 'Islam', 'Kawin', '081234567890', 'Kalasan Sleman', '2009-04-12');
INSERT INTO `pegawai` VALUES ('P-0022', 'Iwan ', 'Lampung', '1991-11-12', 'L', 'Islam', 'Belum kawin', '085643789654', 'Yogyakarta', '2010-12-10');
INSERT INTO `pegawai` VALUES ('P-0023', 'Listia', 'Bantul', '1994-08-09', 'P', 'Islam', 'Belum kawin', '089765432188', 'Bantul Yogyakarta', '2011-05-01');
INSERT INTO `pegawai` VALUES ('P-0024', 'Tata', 'Yogyakarta', '1990-08-08', 'P', 'Islam', 'Belum kawin', '082234567789', 'Yogyakarta', '2014-10-02');
INSERT INTO `pegawai` VALUES ('P-0025', 'Syamsul', 'Sleman', '1989-12-10', 'L', 'Islam', 'Kawin', '089456789987', 'Sleman', '2014-11-20');
INSERT INTO `pegawai` VALUES ('P-0026', 'Ibnu', 'Bantul', '1988-09-09', 'L', 'Islam', 'Kawin', '089765876500', 'Bantul Yogyakarta', '2010-10-20');
INSERT INTO `pegawai` VALUES ('P-0027', 'Ifah', 'Yogyakarta', '1992-09-10', 'P', 'Islam', 'Belum kawin', '087890098765', 'Sleman Yogyakarta', '2011-02-10');
INSERT INTO `pegawai` VALUES ('P-0028', 'Joko', 'Kulon Progo', '1990-08-07', 'L', 'Islam', 'Kawin', '087654123900', 'Bantul Yogyakarta', '2012-11-10');
INSERT INTO `pegawai` VALUES ('P-0029', 'Affa', 'Sleman', '1995-08-03', 'P', 'Islam', 'Belum kawin', '087654321900', 'Yogyakarta', '2015-02-02');
INSERT INTO `pegawai` VALUES ('P-0030', 'Rina', 'Bantul', '1997-07-07', 'P', 'Islam', 'Belum kawin', '086543123444', 'Bantul Yogyakarta', '2015-07-07');
INSERT INTO `pegawai` VALUES ('P-0031', 'Iput', 'Sleman', '1990-10-12', 'P', 'Islam', 'Belum kawin', '085678987665', 'Sleman Yogyakarta', '2009-02-21');
INSERT INTO `pegawai` VALUES ('P-0032', 'Fitri', 'Bantul', '1989-01-30', 'P', 'Islam', 'Kawin', '089789654123', 'Bantul Yogyakarta', '2011-09-10');
INSERT INTO `pegawai` VALUES ('P-0033', 'Ukon', 'Yogyakarta', '1990-09-09', 'L', 'Islam', 'Belum kawin', '087654332221', 'Kulon Progo', '2011-10-11');
INSERT INTO `pegawai` VALUES ('P-0034', 'Ivan ', 'Gunungkidul', '1991-03-06', 'L', 'Islam', 'Belum kawin', '089765432123', 'Bantul Yogyakarta', '2011-10-11');
INSERT INTO `pegawai` VALUES ('P-0035', 'Ridwan', 'Yogyakarta', '1990-08-17', 'L', 'Islam', 'Belum kawin', '087654123890', 'Bantul Yogyakarta', '2013-08-25');
INSERT INTO `pegawai` VALUES ('P-0036', 'Ulil', 'Bantul', '1990-09-17', 'L', 'Islam', 'Belum kawin', '089765432100', 'Bantul Yogyakarta', '2009-05-12');
INSERT INTO `pegawai` VALUES ('P-0037', 'Minan', 'Yogyakarta', '1991-09-03', 'L', 'Islam', 'Belum kawin', '089001234567', 'Yogyakarta', '2010-12-10');
INSERT INTO `pegawai` VALUES ('P-0038', 'Agus', 'Sleman', '1992-07-08', 'L', 'Islam', 'Belum kawin', '087690012344', 'Sleman', '2011-11-11');
INSERT INTO `pegawai` VALUES ('P-0039', 'Dwi', 'Cilacap', '1991-10-09', 'L', 'Islam', 'Kawin', '087654234100', 'Yogyakarta', '2012-08-05');
INSERT INTO `pegawai` VALUES ('P-0040', 'Nursahid', 'Semarang', '1994-08-02', 'L', 'Islam', 'Belum kawin', '082345678900', 'Bantul Yogyakarta', '2012-08-05');
INSERT INTO `pegawai` VALUES ('P-0041', 'Agustian', 'Jakarta', '1989-09-08', 'L', 'Islam', 'Kawin', '087654321123', 'Jalan Mataram Yogyakarta', '2010-01-20');
INSERT INTO `pegawai` VALUES ('P-0042', 'Rini', 'Bantul', '1994-05-27', 'P', 'Islam', 'Belum kawin', '087654321777', 'Jalan Bantul', '2011-02-10');
INSERT INTO `pegawai` VALUES ('P-0043', 'Jono', 'Yogyakarta', '1990-06-23', 'L', 'Islam', 'Kawin', '087690087700', 'Jalan Kusumanegawa', '2012-11-10');
INSERT INTO `pegawai` VALUES ('P-0044', 'Endang', 'Sleman', '1992-10-03', '', 'Islam', 'Belum kawin', '083987098890', 'Jalan Tajem Yogyakarta', '2015-07-02');
INSERT INTO `pegawai` VALUES ('P-0045', 'Riswan', 'Semarang', '1991-09-04', 'L', 'Islam', 'Kawin', '084567890098', 'Jalan Kaliurang Yogyakarta', '2016-09-10');
INSERT INTO `pegawai` VALUES ('P-0046', 'Arimbi', 'Bantul', '1990-07-07', 'P', 'Islam', 'Belum kawin', '087654321000', 'Jalan Bantul', '2009-08-17');
INSERT INTO `pegawai` VALUES ('P-0047', 'Pratiwi', 'Yogyakarta', '1990-08-09', 'P', 'Islam', 'Kawin', '087654890001', 'Jalan Kusumadewi Yogyakarta', '2011-09-07');
INSERT INTO `pegawai` VALUES ('P-0048', 'Galih', 'Sleman', '1991-07-09', 'L', 'Islam', 'Belum kawin', '087654321900', 'Mutihan Bantul', '2011-09-09');
INSERT INTO `pegawai` VALUES ('P-0049', 'Reza', 'Magelang', '1992-06-03', 'L', 'Islam', 'Belum kawin', '087659001234', 'Jalan Parangtritis', '2013-05-10');
INSERT INTO `pegawai` VALUES ('P-0050', 'Kiki', 'Sleman', '1991-09-08', 'L', 'Islam', 'Belum kawin', '087654321999', 'Sleman Yogyakarta', '2014-09-04');
INSERT INTO `pegawai` VALUES ('P-0051', 'Roro', 'Bantul', '1990-09-06', 'P', 'Islam', 'Belum kawin', '087654321999', 'Bantul Yogyakarta', '2010-05-21');
INSERT INTO `pegawai` VALUES ('P-0052', 'Ari', 'Yogyakarta', '1990-08-09', 'P', 'Islam', 'Kawin', '089765430009', 'Jalan Cendana Yogyakarta', '2010-06-05');
INSERT INTO `pegawai` VALUES ('P-0053', 'Lifah', 'Sleman', '1995-05-25', '', 'Islam', 'Kawin', '087654321098', 'Jalan Godean', '2010-06-05');
INSERT INTO `pegawai` VALUES ('P-0054', 'Surya', 'Surabaya', '1992-10-07', 'L', 'Islam', 'Belum kawin', '087908812333', 'Sleman Yogyakarta', '2013-09-10');
INSERT INTO `pegawai` VALUES ('P-0055', 'Andi', 'Semarang', '1990-09-09', 'L', 'Islam', 'Belum kawin', '089098765890', 'Jalan Wonosari', '2015-09-05');
INSERT INTO `pegawai` VALUES ('P-0056', 'Fadila', 'Bantul', '1989-06-06', '', 'Islam', 'Belum kawin', '087909876567', 'Jalan Sultan Agung', '2009-12-11');
INSERT INTO `pegawai` VALUES ('P-0057', 'Husni', 'Kulon Progo', '1990-10-06', 'L', 'Islam', 'Belum kawin', '089909789987', 'Jalan Samas Bantul', '2010-10-05');
INSERT INTO `pegawai` VALUES ('P-0058', 'Tiwi', 'Jakarta', '1991-10-07', 'P', 'Islam', 'Belum kawin', '089765567123', 'Jalan Wonosari Km 5', '2010-10-05');
INSERT INTO `pegawai` VALUES ('P-0059', 'Farril', 'Bima', '1992-09-10', 'L', 'Islam', 'Belum kawin', '087906541231', 'Jalan Batikan Yogyakarta', '2014-04-04');
INSERT INTO `pegawai` VALUES ('P-0060', 'Andika', 'Bandung', '1992-10-08', 'L', 'Islam', 'Belum kawin', '081234567891', 'Jalan Diponegoro Yogyakarta', '2016-04-04');
INSERT INTO `pegawai` VALUES ('P-0061', 'Andin', 'Yogyakarta', '1990-10-20', 'P', 'Islam', 'Belum kawin', '087987789001', 'Jalan Kapas Yogyakarta', '2009-06-21');
INSERT INTO `pegawai` VALUES ('P-0062', 'Sarah', 'Bantul', '1995-04-03', 'P', 'Islam', 'Belum kawin', '083456789123', 'Bantul Yogyakarta', '2010-08-20');
INSERT INTO `pegawai` VALUES ('P-0063', 'Tora', 'Jakarta', '1992-07-05', 'L', 'Islam', 'Belum kawin', '086543213456', 'Jalan Magelang Yogyakarta', '2010-08-20');
INSERT INTO `pegawai` VALUES ('P-0064', 'Adit', 'Sleman', '1994-10-09', 'L', 'Islam', 'Belum kawin', '082123456777', 'Bantul Yogyakarta', '2013-09-21');
INSERT INTO `pegawai` VALUES ('P-0065', 'Sanum', 'Yogyakarta', '1992-03-02', 'P', 'Islam', 'Belum kawin', '087654321876', 'Jalan Godean Yogyakarta', '2015-10-02');
INSERT INTO `pegawai` VALUES ('P-0066', 'Bambang', 'Bantul', '1989-06-06', 'L', 'Islam', 'Kawin', '085678876999', 'Jalan Muja Muju', '2010-11-10');
INSERT INTO `pegawai` VALUES ('P-0067', 'Riski', 'Sleman', '1990-05-02', 'L', 'Islam', 'Belum kawin', '086543123333', 'Sleman Yogyakarta', '2011-11-10');
INSERT INTO `pegawai` VALUES ('P-0068', 'Risal', 'Bantul', '1995-02-09', 'L', 'Islam', 'Belum kawin', '089000123000', 'Jalan Imogiri Barat Bantul', '2011-12-10');
INSERT INTO `pegawai` VALUES ('P-0069', 'Rista', 'Yogyakarta', '1994-04-04', 'P', 'Islam', 'Belum kawin', '081234567800', 'Jalan A. Yani', '2011-12-10');
INSERT INTO `pegawai` VALUES ('P-0070', 'Lusiana ', 'Bantul', '1995-05-05', 'P', 'Islam', 'Belum kawin', '087654123456', 'Jalan Bantul', '2012-12-12');
INSERT INTO `pegawai` VALUES ('P-0071', 'Susi', 'Surabaya', '1989-08-07', 'P', 'Islam', 'Belum kawin', '083456789000', 'Jalan Manunggal Yogyakarta', '2011-09-10');
INSERT INTO `pegawai` VALUES ('P-0072', 'Rara', 'Bantul', '1990-10-02', 'P', 'Islam', 'Belum kawin', '087654321900', 'Jalan Bantul', '2012-09-10');
INSERT INTO `pegawai` VALUES ('P-0073', 'Dwika', 'Bandung', '1990-08-18', 'L', 'Islam', 'Kawin', '081234567800', 'Jalan Bandungan Yogyakarta', '2012-10-11');
INSERT INTO `pegawai` VALUES ('P-0074', 'Oki', 'Sleman', '1992-07-13', 'P', 'Islam', 'Kawin', '087658900888', 'Sleman Yogyakarta', '2012-10-11');
INSERT INTO `pegawai` VALUES ('P-0075', 'Andre', 'Kulon Progo', '1996-06-21', 'L', 'Islam', 'Belum kawin', '087654321000', 'Bantul Yogyakarta', '2015-09-04');
INSERT INTO `pegawai` VALUES ('P-0076', 'Riris', 'Bantul', '1989-12-30', 'P', 'Islam', 'Kawin', '087654890111', 'Bantul Yogyakarta', '2011-05-05');
INSERT INTO `pegawai` VALUES ('P-0077', 'Aris', 'Yogyakarta', '1989-12-08', 'L', 'Islam', 'Belum kawin', '087999888777', 'Jalan Abu Bakar Bantul', '2012-06-05');
INSERT INTO `pegawai` VALUES ('P-0078', 'Likah', 'Sleman', '1992-11-08', 'P', 'Islam', 'Belum kawin', '087990011222', 'Bantul Yogyakarta', '2012-06-05');
INSERT INTO `pegawai` VALUES ('P-0079', 'Yanto', 'Semarang', '1990-12-19', 'L', 'Islam', 'Belum kawin', '087900100111', 'Sleman, Yogyakarta', '2014-07-07');
INSERT INTO `pegawai` VALUES ('P-0080', 'Andang', 'Sleman', '1995-05-05', 'L', 'Islam', 'Belum kawin', '087699223311', 'Sleman Yogyakarta', '2014-08-07');
INSERT INTO `pegawai` VALUES ('P-0081', 'Riska', 'Yogyakarta', '1990-09-09', 'P', 'Islam', 'Belum kawin', '087999666777', 'Jalan Gejayan', '2010-06-26');
INSERT INTO `pegawai` VALUES ('P-0082', 'Iin', 'Bantul', '1991-05-09', 'P', 'Islam', 'Belum kawin', '087654567888', 'Jalan Samas', '2012-07-26');
INSERT INTO `pegawai` VALUES ('P-0083', 'Edi', 'Sleman', '1990-07-04', 'L', 'Islam', 'Kawin', '089087657777', 'Sleman Yogyakarta', '2012-07-26');
INSERT INTO `pegawai` VALUES ('P-0084', 'Anas', 'Bima', '1990-10-10', 'L', 'Islam', 'Belum kawin', '085678987789', 'Kalasan Sleman', '2014-09-05');
INSERT INTO `pegawai` VALUES ('P-0085', 'Fera', 'Bantul', '1992-02-05', 'P', 'Islam', 'Belum kawin', '085643213456', 'Jalan Pleret Bantul', '2014-09-05');
INSERT INTO `pegawai` VALUES ('P-0086', 'Sarita', 'Bandung', '1989-12-09', 'P', 'Islam', 'Kawin', '089765432100', 'Jalan Imogiti Timur ', '2008-12-25');
INSERT INTO `pegawai` VALUES ('P-0087', 'Tia', 'Jakarta', '1990-09-29', 'P', 'Islam', 'Belum kawin', '087654890111', 'Bantul Yogyakarta', '2010-01-02');
INSERT INTO `pegawai` VALUES ('P-0088', 'Pamungkas', 'Kulon Progo', '1990-02-08', 'L', 'Islam', 'Kawin', '089091234567', 'Kalasan Sleman', '2010-02-03');
INSERT INTO `pegawai` VALUES ('P-0089', 'Ragil', 'Sleman', '1989-11-05', 'P', 'Islam', 'Kawin', '087654789000', 'Sleman Yogyakarta', '2010-02-03');
INSERT INTO `pegawai` VALUES ('P-0090', 'Roni', 'Bantul', '1990-11-05', 'L', 'Islam', 'Belum kawin', '089768654123', 'Jalan Sultan Agung', '2014-08-31');
INSERT INTO `pegawai` VALUES ('P-0091', 'Soraya', 'Bantul', '1990-12-05', 'P', 'Islam', 'Belum kawin', '087909654269', 'Kasihan Bantul', '2009-12-05');
INSERT INTO `pegawai` VALUES ('P-0092', 'Niken', 'Yogyakarta', '1990-11-05', 'P', 'Islam', 'Belum kawin', '084787541234', 'Jalan Mangkubumi', '2010-11-05');
INSERT INTO `pegawai` VALUES ('P-0093', 'Ajeng', 'Bantul', '1994-10-10', 'P', 'Islam', 'Belum kawin', '089583169005', 'Jetis Bantul', '2011-07-06');
INSERT INTO `pegawai` VALUES ('P-0094', 'Asti', 'Ambon', '1995-10-06', 'P', 'Islam', 'Belum kawin', '089184703580', 'Jetis Bantul', '2011-07-08');
INSERT INTO `pegawai` VALUES ('P-0095', 'Sasa', 'Bantul', '1990-09-07', 'P', 'Islam', 'Belum kawin', '087296190411', 'Bantul Yogyakarta', '2011-07-08');
INSERT INTO `pegawai` VALUES ('P-0096', 'Susan', 'Bantul', '1990-07-03', 'P', 'Islam', 'Belum kawin', '087654890123', 'Bantul Yogyakarta', '2010-03-25');
INSERT INTO `pegawai` VALUES ('P-0097', 'Tio', 'Bogor', '1990-10-06', 'L', 'Islam', 'Belum kawin', '089012348712', 'Sleman Yogyakarta', '2010-03-26');
INSERT INTO `pegawai` VALUES ('P-0098', 'Ririn', 'Sleman', '1992-12-05', 'P', 'Islam', 'Belum kawin', '087182747900', 'Sleman Yogyakarta', '2011-07-02');
INSERT INTO `pegawai` VALUES ('P-0099', 'Fadli', 'Gunungkidul', '1991-08-23', 'L', 'Islam', 'Belum kawin', '081743985772', 'Jalan Wonosari', '2011-07-02');
INSERT INTO `pegawai` VALUES ('P-0100', 'Dika', 'Bantul', '1990-12-04', 'L', 'Islam', 'Belum kawin', '082601583910', 'Piyungan Bantul', '2011-11-05');
INSERT INTO `pegawai` VALUES ('P-0101', 'Aza', 'Bantul', '1990-02-01', 'P', 'Islam', 'Belum kawin', '085180268791', 'Jalan Parangtritis', '2009-06-05');
INSERT INTO `pegawai` VALUES ('P-0102', 'Falan ', 'Cilacap', '1991-09-07', 'P', 'Islam', 'Belum kawin', '081284147940', 'Jalan Bantul', '2010-07-05');
INSERT INTO `pegawai` VALUES ('P-0103', 'Fahri', 'Jakarta', '1990-09-08', 'L', 'Islam', 'Belum kawin', '085184823279', 'Sleman Yogyakarta', '2010-07-25');
INSERT INTO `pegawai` VALUES ('P-0104', 'Azam', 'Semarang', '1992-10-09', 'L', 'Islam', 'Belum kawin', '083287342999', 'Jalan Imam Bonjol', '2011-10-10');
INSERT INTO `pegawai` VALUES ('P-0105', 'Alma', 'Yogyakarta', '1991-01-01', 'P', 'Islam', 'Belum kawin', '089765437687', 'Jalan Kyai Mojo', '2011-10-11');
INSERT INTO `pegawai` VALUES ('P-0106', 'Joni', 'Gunungkidul', '1989-09-23', 'L', 'Islam', 'Kawin', '087268927665', 'Jalan Wonosari', '2010-12-12');
INSERT INTO `pegawai` VALUES ('P-0107', 'Anjani', 'Bantul', '1990-07-06', 'P', 'Islam', 'Belum kawin', '089642457800', 'Jalan Giwangan', '2011-11-12');
INSERT INTO `pegawai` VALUES ('P-0108', 'Dewi', 'Bantul', '1994-07-07', 'P', 'Islam', 'Belum kawin', '086546788975', 'Jalan Pramuka ', '2011-11-12');
INSERT INTO `pegawai` VALUES ('P-0109', 'Soni', 'Kulon Progo', '1990-06-23', 'L', 'Islam', 'Belum kawin', '086564567871', 'Sewon Bantul', '2012-04-24');
INSERT INTO `pegawai` VALUES ('P-0110', 'Ana', 'Sleman', '1992-06-03', 'P', 'Islam', 'Belum kawin', '086753628273', 'Moyudan Sleman', '2012-05-25');
INSERT INTO `pegawai` VALUES ('P-0111', 'Farah', 'Bantul', '1990-05-03', 'P', 'Islam', 'Belum kawin', '086546789766', 'Bantul Yogyakarta', '2009-05-15');
INSERT INTO `pegawai` VALUES ('P-0112', 'Lila', 'Cilacap', '1990-05-03', 'P', 'Islam', 'Belum kawin', '085678976541', 'Jalan Imogiri Barat', '2010-05-15');
INSERT INTO `pegawai` VALUES ('P-0113', 'Zahra', 'Sleman', '1991-10-04', 'L', 'Islam', 'Belum kawin', '089223565761', 'Jalan Solo ', '2011-06-16');
INSERT INTO `pegawai` VALUES ('P-0114', 'Ozi', 'Purworejo', '1991-07-12', 'L', 'Islam', 'Belum kawin', '087213567843', 'Jalan Mataram', '2011-07-20');
INSERT INTO `pegawai` VALUES ('P-0115', 'Yogo', 'Sleman', '1990-12-05', 'L', 'Islam', 'Belum kawin', '089625621361', 'Jalan Affandi', '2012-08-21');
INSERT INTO `pegawai` VALUES ('P-0116', 'Nada ', 'Bantul', '1990-07-03', 'P', 'Islam', 'Belum kawin', '087646788854', 'Jalan Ahmad Dahlan', '2010-10-06');
INSERT INTO `pegawai` VALUES ('P-0117', 'Lia', 'Bantul', '1990-08-06', 'P', 'Islam', 'Belum kawin', '089655755412', 'Jalan Kusumadewi', '2011-07-07');
INSERT INTO `pegawai` VALUES ('P-0118', 'Siska', 'Yogyakarta', '1991-10-06', 'P', 'Islam', 'Belum kawin', '089645798765', 'Jalan Sudirman', '2012-07-08');
INSERT INTO `pegawai` VALUES ('P-0119', 'Koko', 'Bantul', '1990-07-04', 'L', 'Islam', 'Belum kawin', '089765465432', 'Jalan Kyai Mojo', '2012-09-09');
INSERT INTO `pegawai` VALUES ('P-0120', 'Ali', 'Sleman', '1992-11-05', 'L', 'Islam', 'Belum kawin', '089754567851', 'Jalan Jogja - Solo', '2013-10-09');
INSERT INTO `pegawai` VALUES ('P-0121', 'Sulistio', 'Yogyakarta', '1972-03-19', 'L', 'Islam', 'Kawin', '082244413456', 'Yogyakarta', '1998-05-12');
INSERT INTO `pegawai` VALUES ('P-0122', 'Wildan', 'Sleman', '1984-08-01', 'L', 'Islam', 'Kawin', '081234567800', 'Sleman', '2012-12-12');

-- ----------------------------
-- Table structure for pendukung
-- ----------------------------
DROP TABLE IF EXISTS `pendukung`;
CREATE TABLE `pendukung`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_pegawai` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `file_pendukung` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nama_kegiatan` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pendukung
-- ----------------------------
INSERT INTO `pendukung` VALUES (5, 'P-0008', 'gila.jpg', 'makan');

-- ----------------------------
-- Table structure for penilaian
-- ----------------------------
DROP TABLE IF EXISTS `penilaian`;
CREATE TABLE `penilaian`  (
  `id_nilai` int NOT NULL AUTO_INCREMENT,
  `id_jabatan` int NOT NULL,
  `tgl_penilaian` date NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `rekomendasi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_nilai`) USING BTREE,
  INDEX `FK_penilaian_jabatan_pegawai`(`id_jabatan`) USING BTREE,
  CONSTRAINT `FK_penilaian_jabatan_pegawai` FOREIGN KEY (`id_jabatan`) REFERENCES `jabatan_pegawai` (`id_jabatan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 171 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of penilaian
-- ----------------------------
INSERT INTO `penilaian` VALUES (26, 15, '2017-11-30', 0, '');
INSERT INTO `penilaian` VALUES (27, 16, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (28, 17, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (29, 18, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (30, 19, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (31, 20, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (32, 21, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (33, 22, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (34, 23, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (35, 24, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (36, 25, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (37, 26, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (38, 27, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (39, 28, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (40, 29, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (41, 30, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (42, 31, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (43, 32, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (44, 33, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (45, 34, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (46, 35, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (47, 36, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (48, 37, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (49, 38, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (50, 39, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (51, 50, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (52, 51, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (54, 53, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (55, 54, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (56, 40, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (57, 41, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (59, 43, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (60, 44, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (61, 45, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (62, 46, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (63, 47, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (64, 48, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (65, 49, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (66, 52, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (67, 56, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (68, 42, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (69, 58, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (70, 59, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (71, 60, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (72, 61, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (73, 62, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (74, 63, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (75, 64, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (77, 66, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (78, 67, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (79, 68, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (80, 69, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (82, 71, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (83, 72, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (84, 73, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (85, 74, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (86, 75, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (87, 76, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (88, 77, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (89, 78, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (90, 79, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (91, 80, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (92, 81, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (93, 82, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (94, 83, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (95, 84, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (101, 65, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (102, 91, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (103, 92, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (104, 93, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (105, 94, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (106, 55, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (107, 57, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (108, 90, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (109, 95, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (110, 96, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (111, 97, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (112, 98, '2017-11-30', 1, 'okeede');
INSERT INTO `penilaian` VALUES (113, 99, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (115, 101, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (116, 102, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (117, 103, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (118, 104, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (119, 105, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (120, 106, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (121, 107, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (122, 108, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (123, 109, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (129, 115, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (130, 116, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (131, 117, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (132, 118, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (133, 119, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (134, 120, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (135, 121, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (136, 122, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (137, 123, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (138, 124, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (144, 130, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (145, 131, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (146, 132, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (147, 133, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (148, 134, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (149, 125, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (150, 126, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (151, 127, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (152, 128, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (153, 129, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (154, 110, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (155, 111, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (156, 112, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (157, 70, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (158, 114, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (159, 113, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (160, 85, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (161, 86, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (162, 87, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (163, 88, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (164, 89, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (165, 100, '2017-11-30', 1, '');
INSERT INTO `penilaian` VALUES (166, 15, '2021-07-04', 0, 'undefined');
INSERT INTO `penilaian` VALUES (167, 15, '2021-07-04', 0, 'undefined');
INSERT INTO `penilaian` VALUES (168, 15, '2021-07-04', 0, 'undefined');
INSERT INTO `penilaian` VALUES (169, 15, '2021-07-04', 0, ' fgfgdgdfgdfgd');
INSERT INTO `penilaian` VALUES (170, 15, '2021-07-15', 1, ' ter');

-- ----------------------------
-- Table structure for toko
-- ----------------------------
DROP TABLE IF EXISTS `toko`;
CREATE TABLE `toko`  (
  `id_toko` int NOT NULL AUTO_INCREMENT,
  `nama_toko` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `alamat_toko` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_toko`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of toko
-- ----------------------------
INSERT INTO `toko` VALUES (27, 'Pamella 1', 'Jl. Kusumanegara 135-141 Yogyakarta');
INSERT INTO `toko` VALUES (28, 'Pamella 2', '	Jl. Pandean 16 Yogyakarta');
INSERT INTO `toko` VALUES (29, 'Pamella 3', '	Jl. Wonocatur No. 377 Banguntapan Yogyakarta');
INSERT INTO `toko` VALUES (30, 'Pamella 4', '	Jl. Pramuka No.84 Yogyakarta');
INSERT INTO `toko` VALUES (31, 'Pamella 6', 'Jl. Raya Candigebang CC. Yogyakarta');
INSERT INTO `toko` VALUES (32, 'Pamella 7', 'Ds. Bromonillan, Purwomartani, Kalasan,Sleman, Yogyakarta');
INSERT INTO `toko` VALUES (33, 'Pamella 8', 'Jl. Lowanu 88 Yogyakarta');
INSERT INTO `toko` VALUES (34, 'All', '');

-- ----------------------------
-- Table structure for unit_kerja
-- ----------------------------
DROP TABLE IF EXISTS `unit_kerja`;
CREATE TABLE `unit_kerja`  (
  `id_unit_kerja` int NOT NULL AUTO_INCREMENT,
  `nama_unit_kerja` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `alamat_unit_kerja` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_unit_kerja`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of unit_kerja
-- ----------------------------
INSERT INTO `unit_kerja` VALUES (27, 'Pamella 1', 'Jl. Kusumanegara 135-141 Yogyakarta');
INSERT INTO `unit_kerja` VALUES (28, 'Pamella 2', '	Jl. Pandean 16 Yogyakarta');
INSERT INTO `unit_kerja` VALUES (29, 'Pamella 3', '	Jl. Wonocatur No. 377 Banguntapan Yogyakarta');
INSERT INTO `unit_kerja` VALUES (30, 'Pamella 4', '	Jl. Pramuka No.84 Yogyakarta');
INSERT INTO `unit_kerja` VALUES (31, 'Pamella 6', 'Jl. Raya Candigebang CC. Yogyakarta');
INSERT INTO `unit_kerja` VALUES (32, 'Pamella 7', 'Ds. Bromonillan, Purwomartani, Kalasan,Sleman, Yogyakarta');
INSERT INTO `unit_kerja` VALUES (33, 'Pamella 8', 'Jl. Lowanu 88 Yogyakarta');
INSERT INTO `unit_kerja` VALUES (34, 'All', '');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_name` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `password` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `hak_akses` int NULL DEFAULT NULL,
  `id_pegawai` char(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  UNIQUE INDEX `user_name`(`user_name`) USING BTREE,
  INDEX `FK_user_pegawai`(`id_pegawai`) USING BTREE,
  CONSTRAINT `FK_user_pegawai` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`no_pegawai`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('admin', 'admin', 0, NULL);
INSERT INTO `user` VALUES ('Brian', 'brian', 4, 'P-0002');
INSERT INTO `user` VALUES ('Lala', 'lala', 3, 'P-0001');
INSERT INTO `user` VALUES ('Sulistio', 'sulis', 2, 'P-0121');
INSERT INTO `user` VALUES ('Wildan', 'wildan', 1, 'P-0122');

-- ----------------------------
-- Table structure for usulan
-- ----------------------------
DROP TABLE IF EXISTS `usulan`;
CREATE TABLE `usulan`  (
  `id_usulan` int NOT NULL AUTO_INCREMENT,
  `no_pegawai` char(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_pegawai` char(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_unit_kerja` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nilai` decimal(10, 8) NOT NULL,
  `bagian` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jabatan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `periode` date NOT NULL,
  PRIMARY KEY (`id_usulan`) USING BTREE,
  INDEX `no_pegawai`(`no_pegawai`) USING BTREE,
  CONSTRAINT `usulan_ibfk_1` FOREIGN KEY (`no_pegawai`) REFERENCES `pegawai` (`no_pegawai`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of usulan
-- ----------------------------
INSERT INTO `usulan` VALUES (7, 'P-0031', 'Iput', 'Pamella 1', 0.73474747, 'Swalayan', 'koordinator', '2017-11-30');
INSERT INTO `usulan` VALUES (8, 'P-0033', 'Ukon', 'Pamella 1', 0.70568853, 'Swalayan', 'karyawan', '2017-11-30');
INSERT INTO `usulan` VALUES (9, 'P-0032', 'Fitri', 'Pamella 1', 0.51767268, 'Swalayan', 'karyawan', '2017-11-30');
INSERT INTO `usulan` VALUES (10, 'P-0035', 'Ridwan', 'Pamella 1', 0.48059621, 'Swalayan', 'karyawan', '2017-11-30');
INSERT INTO `usulan` VALUES (11, 'P-0034', 'Ivan', 'Pamella 1', 0.29151495, 'Swalayan', 'karyawan', '2017-11-30');
INSERT INTO `usulan` VALUES (12, 'P-0036', 'Ulil', 'Pamella 1', 0.82366641, 'Gudang', 'koordinator', '2017-11-30');
INSERT INTO `usulan` VALUES (13, 'P-0038', 'Agus', 'Pamella 1', 0.82195683, 'Gudang', 'karyawan', '2017-11-30');
INSERT INTO `usulan` VALUES (14, 'P-0107', 'Anjani', 'Pamella 3', 0.81494095, 'Gudang', 'karyawan', '2017-11-30');

SET FOREIGN_KEY_CHECKS = 1;

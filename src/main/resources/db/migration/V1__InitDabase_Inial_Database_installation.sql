-- MySQL Workbench Forward Engineering
SET @OLD_UNIQUE_CHECKS= @@UNIQUE_CHECKS,
UNIQUE_CHECKS= 0;
SET @OLD_FOREIGN_KEY_CHECKS= @@FOREIGN_KEY_CHECKS,
FOREIGN_KEY_CHECKS= 0;
SET @OLD_SQL_MODE= @@SQL_MODE,
SQL_MODE= 'TRADITIONAL,ALLOW_INVALID_DATES';
-- -----------------------------------------------------
-- Schema myDBb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema ChurchApp
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ChurchApp
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ChurchApp` DEFAULT CHARACTER SET utf8;
USE `ChurchApp`;
-- -----------------------------------------------------
-- Table `ChurchApp`.`cathedral_zone`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ChurchApp`.`cathedral_zone`;
CREATE TABLE IF NOT EXISTS `ChurchApp`.`cathedral_zone`
(
   `id` INT (11) NOT NULL AUTO_INCREMENT,
   `name` VARCHAR (245) NOT NULL,
   PRIMARY KEY (`id`)
)
ENGINE = InnoDB AUTO_INCREMENT = 11 DEFAULT CHARACTER SET = utf8;
-- -----------------------------------------------------
-- Table `ChurchApp`.`marital_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ChurchApp`.`marital_status`;
CREATE TABLE IF NOT EXISTS `ChurchApp`.`marital_status`
(
   `marital_status_id` INT (11) NOT NULL AUTO_INCREMENT,
   `marital_status_name` VARCHAR (245) NOT NULL,
   PRIMARY KEY (`marital_status_id`)
)
ENGINE = InnoDB AUTO_INCREMENT = 7 DEFAULT CHARACTER SET = utf8;
-- -----------------------------------------------------
-- Table `ChurchApp`.`citizenship`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ChurchApp`.`citizenship`;
CREATE TABLE IF NOT EXISTS `ChurchApp`.`citizenship`
(
   `citizenship_id` INT (11) NOT NULL AUTO_INCREMENT,
   `name` VARCHAR (245) NOT NULL,
   PRIMARY KEY (`citizenship_id`)
)
ENGINE = InnoDB AUTO_INCREMENT = 12 DEFAULT CHARACTER SET = utf8;
-- -----------------------------------------------------
-- Table `ChurchApp`.`marriage_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ChurchApp`.`marriage_type`;
CREATE TABLE IF NOT EXISTS `ChurchApp`.`marriage_type`
(
   `marriage_type_id` INT (11) NOT NULL AUTO_INCREMENT,
   `name` VARCHAR (245) NOT NULL,
   PRIMARY KEY (`marriage_type_id`)
)
ENGINE = InnoDB AUTO_INCREMENT = 12 DEFAULT CHARACTER SET = utf8;
-- -----------------------------------------------------
-- Table `ChurchApp`.`churchmembers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ChurchApp`.`churchmembers`;
CREATE TABLE IF NOT EXISTS `ChurchApp`.`churchmembers`
(
   `id` INT (11) NOT NULL,
   `first_name` VARCHAR (245) NOT NULL,
   `middle_name` VARCHAR (245) NOT NULL,
   `surname` VARCHAR (245) NOT NULL,
   `gender` VARCHAR (1) NULL DEFAULT NULL,
   `created_at` TIMESTAMP NULL DEFAULT NULL,
   `title` VARCHAR (45) NULL DEFAULT NULL,
   `marital_status` INT (11) NULL DEFAULT NULL,
   `type_of_marriage` INT (11) NULL DEFAULT NULL,
   `date_joint_cathedral` TIMESTAMP NULL DEFAULT NULL,
   `citizenship` INT (11) NULL DEFAULT NULL,
   `email` VARCHAR (100) NULL DEFAULT NULL,
   `phonenumber` VARCHAR (245) NULL DEFAULT NULL,
   `occupation` VARCHAR (245) NULL DEFAULT NULL,
   `place_of_work` VARCHAR (245) NULL DEFAULT NULL,
   `stewardship` VARCHAR (245) NULL DEFAULT NULL,
   PRIMARY KEY (`id`),
   INDEX `fk_churchmembers_marital_status1_idx`
   (
      `marital_status` ASC
   ),
   INDEX `fk_churchmembers_citizenship1_idx`
   (
      `citizenship` ASC
   ),
   INDEX `fk_churchmembers_marriage_type1_idx`
   (
      `type_of_marriage` ASC
   ),
   UNIQUE INDEX `id_UNIQUE`
   (
      `id` ASC
   ),
   CONSTRAINT `fk_churchmembers_marital_status1` FOREIGN KEY (`marital_status`) REFERENCES `ChurchApp`.`marital_status` (`marital_status_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
   CONSTRAINT `fk_churchmembers_citizenship1` FOREIGN KEY (`citizenship`) REFERENCES `ChurchApp`.`citizenship` (`citizenship_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
   CONSTRAINT `fk_churchmembers_marriage_type1` FOREIGN KEY (`type_of_marriage`) REFERENCES `ChurchApp`.`marriage_type` (`marriage_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
)
ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;
-- -----------------------------------------------------
-- Table `ChurchApp`.`households`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ChurchApp`.`households`;
CREATE TABLE IF NOT EXISTS `ChurchApp`.`households`
(
   `household_id` INT (11) NOT NULL,
   `household_code` VARCHAR (45) NOT NULL,
   `estate` VARCHAR (245) NOT NULL,
   `cathedral_zone_id` INT (11) NOT NULL,
   `postal_address` VARCHAR (245) NULL DEFAULT NULL,
   `active` INT (1) NOT NULL DEFAULT 0,
   `street` VARCHAR (245) NULL DEFAULT NULL,
   UNIQUE INDEX `household_id_UNIQUE`
   (
      `household_id` ASC
   ),
   INDEX `fk_households_cathedral_zone1_idx`
   (
      `cathedral_zone_id` ASC
   ),
   CONSTRAINT `fk_households_cathedral_zone1` FOREIGN KEY (`cathedral_zone_id`) REFERENCES `ChurchApp`.`cathedral_zone` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
)
ENGINE = InnoDB AUTO_INCREMENT = 419 DEFAULT CHARACTER SET = utf8;
-- -----------------------------------------------------
-- Table `ChurchApp`.`relationship_to_head`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ChurchApp`.`relationship_to_head`;
CREATE TABLE IF NOT EXISTS `ChurchApp`.`relationship_to_head`
(
   `relationship_to_head_id` INT (11) NOT NULL AUTO_INCREMENT,
   `name` VARCHAR (245) NOT NULL,
   PRIMARY KEY (`relationship_to_head_id`)
)
ENGINE = InnoDB AUTO_INCREMENT = 9 DEFAULT CHARACTER SET = utf8;
-- -----------------------------------------------------
-- Table `ChurchApp`.`household_members`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ChurchApp`.`household_members`;
CREATE TABLE IF NOT EXISTS `ChurchApp`.`household_members`
(
   `household_membership_id` INT (11) NOT NULL AUTO_INCREMENT,
   `household_uuid` VARCHAR (100) NULL DEFAULT NULL,
   `churchmember_uuid` VARCHAR (100) NULL DEFAULT NULL,
   `relationship_to_head_id` INT (11) NULL DEFAULT NULL,
   `isheadofhousehold` INT (1) NOT NULL DEFAULT 0,
   `household_id` INT (11) NOT NULL,
   `churchmember_id` INT (11) NOT NULL,
   PRIMARY KEY
   (
      `household_membership_id`,
      `churchmember_id`
   ),
   INDEX `fk_household_members_households1_idx`
   (
      `household_id` ASC
   ),
   INDEX `fk_household_members_relationship_to_head1_idx`
   (
      `relationship_to_head_id` ASC
   ),
   INDEX `fk_household_members_churchmembers1_idx`
   (
      `churchmember_id` ASC
   ),
   CONSTRAINT `fk_household_members_households1` FOREIGN KEY (`household_id`) REFERENCES `ChurchApp`.`households` (`household_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
   CONSTRAINT `fk_household_members_relationship_to_head1` FOREIGN KEY (`relationship_to_head_id`) REFERENCES `ChurchApp`.`relationship_to_head` (`relationship_to_head_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
   CONSTRAINT `fk_household_members_churchmembers1` FOREIGN KEY (`churchmember_id`) REFERENCES `ChurchApp`.`churchmembers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
)
ENGINE = InnoDB AUTO_INCREMENT = 1133 DEFAULT CHARACTER SET = utf8;
-- -----------------------------------------------------
-- Table `ChurchApp`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ChurchApp`.`users`;
CREATE TABLE IF NOT EXISTS `ChurchApp`.`users`
(
   `user_id` INT (11) NOT NULL AUTO_INCREMENT,
   `username` VARCHAR (50) NOT NULL,
   `password` VARCHAR (150) NOT NULL,
   `enabled` TINYINT (1) NOT NULL DEFAULT 0,
   PRIMARY KEY (`user_id`),
   UNIQUE INDEX `email`
   (
      `username` ASC
   ),
   UNIQUE INDEX `user_id_UNIQUE`
   (
      `user_id` ASC
   )
)
ENGINE = InnoDB DEFAULT CHARACTER SET = utf8 COLLATE = utf8_unicode_ci;
-- -----------------------------------------------------
-- Table `ChurchApp`.`roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ChurchApp`.`roles`;
CREATE TABLE IF NOT EXISTS `ChurchApp`.`roles`
(
   `role_id` INT (11) NOT NULL,
   `name` VARCHAR (45) NOT NULL,
   PRIMARY KEY (`role_id`),
   UNIQUE INDEX `role_id_UNIQUE`
   (
      `role_id` ASC
   )
)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `ChurchApp`.`users_roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ChurchApp`.`users_roles`;
CREATE TABLE IF NOT EXISTS `ChurchApp`.`users_roles`
(
   `user_id` INT (11) NOT NULL,
   `role_id` INT (11) NULL,
   INDEX `fk_users_roles_roles1_idx`
   (
      `role_id` ASC
   ),
   INDEX `fk_users_roles_users1_idx`
   (
      `user_id` ASC
   ),
   CONSTRAINT `fk_users_roles_roles1` FOREIGN KEY (`role_id`) REFERENCES `ChurchApp`.`roles` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
   CONSTRAINT `fk_users_roles_users1` FOREIGN KEY (`user_id`) REFERENCES `ChurchApp`.`users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
)
ENGINE = InnoDB;
SET SQL_MODE= @OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS= @OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS= @OLD_UNIQUE_CHECKS;
-- -----------------------------------------------------
-- Data for table `ChurchApp`.`users`
-- -----------------------------------------------------
START TRANSACTION;
USE `ChurchApp`;
INSERT INTO `ChurchApp`.`users`
(
   `user_id`,
   `username`,
   `password`,
   `enabled`
)
VALUES
(
   1,
   'patrick',
   '$2a$10$dJIYsl6wnM4IH5aACobCKeBqRGx/eZsHuFCyZAu6EG0UMd6Y8SwBG',
   1
);
INSERT INTO `ChurchApp`.`users`
(
   `user_id`,
   `username`,
   `password`,
   `enabled`
)
VALUES
(
   2,
   'alex',
   '$2a$10$dJIYsl6wnM4IH5aACobCKeBqRGx/eZsHuFCyZAu6EG0UMd6Y8SwBG',
   1
);
INSERT INTO `ChurchApp`.`users`
(
   `user_id`,
   `username`,
   `password`,
   `enabled`
)
VALUES
(
   3,
   'john',
   '$2a$10$dJIYsl6wnM4IH5aACobCKeBqRGx/eZsHuFCyZAu6EG0UMd6Y8SwBG',
   1
);
INSERT INTO `ChurchApp`.`users`
(
   `user_id`,
   `username`,
   `password`,
   `enabled`
)
VALUES
(
   4,
   'namhm',
   '$2a$10$dJIYsl6wnM4IH5aACobCKeBqRGx/eZsHuFCyZAu6EG0UMd6Y8SwBG',
   1
);
INSERT INTO `ChurchApp`.`users`
(
   `user_id`,
   `username`,
   `password`,
   `enabled`
)
VALUES
(
   5,
   'admin',
   '$2a$10$dJIYsl6wnM4IH5aACobCKeBqRGx/eZsHuFCyZAu6EG0UMd6Y8SwBG',
   1
);
COMMIT;
-- -----------------------------------------------------
-- Data for table `ChurchApp`.`roles`
-- -----------------------------------------------------
START TRANSACTION;
USE `ChurchApp`;
INSERT INTO `ChurchApp`.`roles`
(
   `role_id`,
   `name`
)
VALUES
(
   1,
   'USER'
);
INSERT INTO `ChurchApp`.`roles`
(
   `role_id`,
   `name`
)
VALUES
(
   2,
   'CREATOR'
);
INSERT INTO `ChurchApp`.`roles`
(
   `role_id`,
   `name`
)
VALUES
(
   3,
   'EDITOR'
);
INSERT INTO `ChurchApp`.`roles`
(
   `role_id`,
   `name`
)
VALUES
(
   4,
   'ADMIN'
);
COMMIT;
-- -----------------------------------------------------
-- Data for table `ChurchApp`.`users_roles`
-- -----------------------------------------------------
START TRANSACTION;
USE `ChurchApp`;
INSERT INTO `ChurchApp`.`users_roles`
(
   `user_id`,
   `role_id`
)
VALUES
(
   1,
   1
);
INSERT INTO `ChurchApp`.`users_roles`
(
   `user_id`,
   `role_id`
)
VALUES
(
   2,
   2
);
INSERT INTO `ChurchApp`.`users_roles`
(
   `user_id`,
   `role_id`
)
VALUES
(
   3,
   3
);
INSERT INTO `ChurchApp`.`users_roles`
(
   `user_id`,
   `role_id`
)
VALUES
(
   4,
   2
);
INSERT INTO `ChurchApp`.`users_roles`
(
   `user_id`,
   `role_id`
)
VALUES
(
   4,
   3
);
INSERT INTO `ChurchApp`.`users_roles`
(
   `user_id`,
   `role_id`
)
VALUES
(
   5,
   4
);
COMMIT;
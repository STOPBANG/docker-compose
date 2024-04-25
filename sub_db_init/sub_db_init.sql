-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Table `mydb`.`opened_review`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`opened_review` (
  `resident_r_id` INT NOT NULL,
  `review_rv_id` INT NOT NULL,
  `created_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`resident_r_id`, `review_rv_id`),
  INDEX `fk_resident_has_review_review1_idx` (`resident_r_id` ASC) VISIBLE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`bookmark`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`bookmark` (
  `bm_id` INT NOT NULL AUTO_INCREMENT,
  `agentList_ra_regno` VARCHAR(30) NOT NULL,
  `resident_r_id` INT NOT NULL,
  PRIMARY KEY (`bm_id`),
  INDEX `fk_bookmark_agentList1_idx` (`agentList_ra_regno` ASC) VISIBLE,
  INDEX `fk_bookmark_resident1_idx` (`resident_r_id` ASC) VISIBLE
);
-- -----------------------------------------------------
-- Table `mydb`.`report`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`report` (
    `reporter` VARCHAR(45) NOT NULL,
    `repo_rv_id` INT NOT NULL,
    `reportee` VARCHAR(45) NOT NULL UNIQUE,
    `reason` INT,
    CONSTRAINT PK_Report PRIMARY KEY (reporter, repo_rv_id)
);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
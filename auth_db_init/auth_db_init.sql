-- -----------------------------------------------------
-- Table `mydb`.`resident`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`resident` (
  `r_id` INT NOT NULL AUTO_INCREMENT,
  `r_username` VARCHAR(45) NOT NULL,
  `r_password` VARCHAR(255) NOT NULL,
  `r_phone` VARCHAR(45) NOT NULL,
  `r_realname` VARCHAR(15) NOT NULL,
  `r_email` VARCHAR(45) NOT NULL,
  `r_point` INT NOT NULL DEFAULT 0,
  `r_birth` DATE NULL,
  `created_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`r_id`),
  UNIQUE INDEX `r_phone_UNIQUE` (`r_phone` ASC) VISIBLE,
  UNIQUE INDEX `r_username_UNIQUE` (`r_username` ASC) VISIBLE,
  UNIQUE INDEX `r_id_UNIQUE` (`r_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`agentList`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`agentList` (
  `ra_regno` VARCHAR(30) NOT NULL,
  `rdealer_nm` VARCHAR(45) NOT NULL,
  `cmp_nm` VARCHAR(45) NOT NULL,
  `telno` VARCHAR(140) NOT NULL,
  `address` VARCHAR(70) NOT NULL,
  `sgg_nm` VARCHAR(45) NOT NULL,
  `bjdong_nm` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ra_regno`),
  UNIQUE INDEX `ra_regno_UNIQUE` (`ra_regno` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`agent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`agent` (
  `a_id` INT NOT NULL AUTO_INCREMENT,
  `agentList_ra_regno` VARCHAR(30) NOT NULL,
  `a_username` VARCHAR(45) NOT NULL,
  `a_password` VARCHAR(255) NOT NULL,
  `a_realname` VARCHAR(45) NOT NULL,
  `a_email` VARCHAR(45) NOT NULL,
  `a_auth` TINYINT NOT NULL DEFAULT 0,
  `a_auth_image` VARCHAR(200) NULL,
  `a_profile_image` VARCHAR(200) NULL,
  `a_introduction` VARCHAR(45) NULL,
  `a_office_hours` VARCHAR(45) NULL,
  `a_image1` VARCHAR(200) NULL,
  `a_image2` VARCHAR(200) NULL,
  `a_image3` VARCHAR(200) NULL,
  `created_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`a_id`, `agentList_ra_regno`),
  UNIQUE INDEX `idrealtor_UNIQUE` (`a_id` ASC) VISIBLE,
  UNIQUE INDEX `a_email_UNIQUE` (`a_email` ASC) VISIBLE,
  INDEX `fk_agent_agentList1_idx` (`agentList_ra_regno` ASC) VISIBLE,
  CONSTRAINT `fk_agent_agentList1`
    FOREIGN KEY (`agentList_ra_regno`)
    REFERENCES `mydb`.`agentList` (`ra_regno`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`agent_contact`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`agent_contact` (
  `contact_number` VARCHAR(20) NOT NULL,
  `agent_agentList_ra_regno` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`contact_number`, `agent_agentList_ra_regno`),
  UNIQUE INDEX `contact_number_UNIQUE` (`contact_number` ASC) VISIBLE,
  INDEX `fk_agent_contact_agentList1_idx` (`agent_agentList_ra_regno` ASC) VISIBLE,
  CONSTRAINT `fk_agent_contact_agentList1`
    FOREIGN KEY (`agent_agentList_ra_regno`)
    REFERENCES `mydb`.`agentList` (`ra_regno`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb`.`certification` (
    `code` INT(11) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    CONSTRAINT PK_Certification PRIMARY KEY (code, email)
);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
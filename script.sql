-- -----------------------------------------------------
-- Schema Pro
-- -----------------------------------------------------
-- Le schema Pro étant déjà créé sur le serveur, il ne faut pas le supprimer et le recréer à chaque lancement du script.
USE `Pro` ;

DROP TABLE IF EXISTS Personne, Certificat, Champ, Pays;
DROP FUNCTION IF EXISTS random_string;

-- -----------------------------------------------------
-- Table `Pays`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pays` (
  `idPays` char(3) NOT NULL,
  `nomPays` varchar(200) NOT NULL,
  `code` char(2) DEFAULT NULL,
  PRIMARY KEY (`idPays`)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Table `Personne`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Personne` (
  `idPersonne` INT NOT NULL AUTO_INCREMENT,
  `prenom` VARCHAR(45) NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `adresse` VARCHAR(45) NOT NULL,
  `npa` VARCHAR(45) NOT NULL,
  `typeCompte` VARCHAR(45) NULL,
  `email` VARCHAR(45) NOT NULL,
  `motDePasse` VARCHAR(128) NOT NULL,
  `idPersonnePays` CHAR(3) NOT NULL,
  PRIMARY KEY (`idPersonne`),
  UNIQUE INDEX `UC_Personne_email` (`email` ASC),
  CONSTRAINT `FK_Personne_Pays`
    FOREIGN KEY (`idPersonnePays`)
    REFERENCES `Pays` (`idPays`)
    ON UPDATE CASCADE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Certificat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Certificat` (
  `idCertificat` CHAR(10) NOT NULL,
  `idPersonnePersonne` INT NOT NULL,
  `dateSignature` DATE NOT NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idCertificat`),
  INDEX `IDX_FK_Certificat_Personne` (`idPersonnePersonne` ASC),
  INDEX `IDX_Certificat_id` (`id` ASC),
  CONSTRAINT `FK_Personne_Certificat`
    FOREIGN KEY (`idPersonnePersonne`)
    REFERENCES `Personne` (`idPersonne`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Champ`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Champ` (
  `idCertificatCertificat` CHAR(10) NOT NULL,
  `nom` VARCHAR(256) NOT NULL,
  `valeur` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`idCertificatCertificat`, `nom`),
  CONSTRAINT `FK_Certificat_Champ`
    FOREIGN KEY (`idCertificatCertificat`)
    REFERENCES `Certificat` (`idCertificat`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

INSERT INTO `Pays` (`idPays`, `nomPays`, `code`)
VALUES
('AFG','Afghanistan','AF'),
('ALA','Åland','AX'),
('ALB','Albania','AL'),
('DZA','Algeria','DZ'),
('ASM','American Samoa','AS'),
('AND','Andorra','AD'),
('AGO','Angola','AO'),
('AIA','Anguilla','AI'),
('ATA','Antarctica','AQ'),
('ATG','Antigua and Barbuda','AG'),
('ARG','Argentina','AR'),
('ARM','Armenia','AM'),
('ABW','Aruba','AW'),
('AUS','Australia','AU'),
('AUT','Austria','AT'),
('AZE','Azerbaijan','AZ'),
('BHS','Bahamas','BS'),
('BHR','Bahrain','BH'),
('BGD','Bangladesh','BD'),
('BRB','Barbados','BB'),
('BLR','Belarus','BY'),
('BEL','Belgium','BE'),
('BLZ','Belize','BZ'),
('BEN','Benin','BJ'),
('BMU','Bermuda','BM'),
('BTN','Bhutan','BT'),
('BOL','Bolivia','BO'),
('BES','Bonaire','BQ'),
('BIH','Bosnia and Herzegovina','BA'),
('BWA','Botswana','BW'),
('BVT','Bouvet Island','BV'),
('BRA','Brazil','BR'),
('IOT','British Indian Ocean Territory','IO'),
('VGB','British Virgin Islands','VG'),
('BRN','Brunei','BN'),
('BGR','Bulgaria','BG'),
('BFA','Burkina Faso','BF'),
('BDI','Burundi','BI'),
('KHM','Cambodia','KH'),
('CMR','Cameroon','CM'),
('CAN','Canada','CA'),
('CPV','Cape Verde','CV'),
('CYM','Cayman Islands','KY'),
('CAF','Central African Republic','CF'),
('TCD','Chad','TD'),
('CHL','Chile','CL'),
('CHN','China','CN'),
('CXR','Christmas Island','CX'),
('CCK','Cocos [Keeling] Islands','CC'),
('COL','Colombia','CO'),
('COM','Comoros','KM'),
('COK','Cook Islands','CK'),
('CRI','Costa Rica','CR'),
('HRV','Croatia','HR'),
('CUB','Cuba','CU'),
('CUW','Curacao','CW'),
('CYP','Cyprus','CY'),
('CZE','Czech Republic','CZ'),
('COD','Democratic Republic of the Congo','CD'),
('DNK','Denmark','DK'),
('DJI','Djibouti','DJ'),
('DMA','Dominica','DM'),
('DOM','Dominican Republic','DO'),
('TLS','East Timor','TL'),
('ECU','Ecuador','EC'),
('EGY','Egypt','EG'),
('SLV','El Salvador','SV'),
('GNQ','Equatorial Guinea','GQ'),
('ERI','Eritrea','ER'),
('EST','Estonia','EE'),
('ETH','Ethiopia','ET'),
('FLK','Falkland Islands','FK'),
('FRO','Faroe Islands','FO'),
('FJI','Fiji','FJ'),
('FIN','Finland','FI'),
('FRA','France','FR'),
('GUF','French Guiana','GF'),
('PYF','French Polynesia','PF'),
('ATF','French Southern Territories','TF'),
('GAB','Gabon','GA'),
('GMB','Gambia','GM'),
('GEO','Georgia','GE'),
('DEU','Germany','DE'),
('GHA','Ghana','GH'),
('GIB','Gibraltar','GI'),
('GRC','Greece','GR'),
('GRL','Greenland','GL'),
('GRD','Grenada','GD'),
('GLP','Guadeloupe','GP'),
('GUM','Guam','GU'),
('GTM','Guatemala','GT'),
('GGY','Guernsey','GG'),
('GIN','Guinea','GN'),
('GNB','Guinea-Bissau','GW'),
('GUY','Guyana','GY'),
('HTI','Haiti','HT'),
('HMD','Heard Island and McDonald Islands','HM'),
('HND','Honduras','HN'),
('HKG','Hong Kong','HK'),
('HUN','Hungary','HU'),
('ISL','Iceland','IS'),
('IND','India','IN'),
('IDN','Indonesia','ID'),
('IRN','Iran','IR'),
('IRQ','Iraq','IQ'),
('IRL','Ireland','IE'),
('IMN','Isle of Man','IM'),
('ISR','Israel','IL'),
('ITA','Italy','IT'),
('CIV','Ivory Coast','CI'),
('JAM','Jamaica','JM'),
('JPN','Japan','JP'),
('JEY','Jersey','JE'),
('JOR','Jordan','JO'),
('KAZ','Kazakhstan','KZ'),
('KEN','Kenya','KE'),
('KIR','Kiribati','KI'),
('XKX','Kosovo','XK'),
('KWT','Kuwait','KW'),
('KGZ','Kyrgyzstan','KG'),
('LAO','Laos','LA'),
('LVA','Latvia','LV'),
('LBN','Lebanon','LB'),
('LSO','Lesotho','LS'),
('LBR','Liberia','LR'),
('LBY','Libya','LY'),
('LIE','Liechtenstein','LI'),
('LTU','Lithuania','LT'),
('LUX','Luxembourg','LU'),
('MAC','Macao','MO'),
('MKD','Macedonia','MK'),
('MDG','Madagascar','MG'),
('MWI','Malawi','MW'),
('MYS','Malaysia','MY'),
('MDV','Maldives','MV'),
('MLI','Mali','ML'),
('MLT','Malta','MT'),
('MHL','Marshall Islands','MH'),
('MTQ','Martinique','MQ'),
('MRT','Mauritania','MR'),
('MUS','Mauritius','MU'),
('MYT','Mayotte','YT'),
('MEX','Mexico','MX'),
('FSM','Micronesia','FM'),
('MDA','Moldova','MD'),
('MCO','Monaco','MC'),
('MNG','Mongolia','MN'),
('MNE','Montenegro','ME'),
('MSR','Montserrat','MS'),
('MAR','Morocco','MA'),
('MOZ','Mozambique','MZ'),
('MMR','Myanmar [Burma]','MM'),
('NAM','Namibia','NA'),
('NRU','Nauru','NR'),
('NPL','Nepal','NP'),
('NLD','Netherlands','NL'),
('NCL','New Caledonia','NC'),
('NZL','New Zealand','NZ'),
('NIC','Nicaragua','NI'),
('NER','Niger','NE'),
('NGA','Nigeria','NG'),
('NIU','Niue','NU'),
('NFK','Norfolk Island','NF'),
('PRK','North Korea','KP'),
('MNP','Northern Mariana Islands','MP'),
('NOR','Norway','NO'),
('OMN','Oman','OM'),
('PAK','Pakistan','PK'),
('PLW','Palau','PW'),
('PSE','Palestine','PS'),
('PAN','Panama','PA'),
('PNG','Papua New Guinea','PG'),
('PRY','Paraguay','PY'),
('PER','Peru','PE'),
('PHL','Philippines','PH'),
('PCN','Pitcairn Islands','PN'),
('POL','Poland','PL'),
('PRT','Portugal','PT'),
('PRI','Puerto Rico','PR'),
('QAT','Qatar','QA'),
('COG','Republic of the Congo','CG'),
('REU','Réunion','RE'),
('ROU','Romania','RO'),
('RUS','Russia','RU'),
('RWA','Rwanda','RW'),
('BLM','Saint Barthélemy','BL'),
('SHN','Saint Helena','SH'),
('KNA','Saint Kitts and Nevis','KN'),
('LCA','Saint Lucia','LC'),
('MAF','Saint Martin','MF'),
('SPM','Saint Pierre and Miquelon','PM'),
('VCT','Saint Vincent and the Grenadines','VC'),
('WSM','Samoa','WS'),
('SMR','San Marino','SM'),
('STP','São Tomé and Príncipe','ST'),
('SAU','Saudi Arabia','SA'),
('SEN','Senegal','SN'),
('SRB','Serbia','RS'),
('SYC','Seychelles','SC'),
('SLE','Sierra Leone','SL'),
('SGP','Singapore','SG'),
('SXM','Sint Maarten','SX'),
('SVK','Slovakia','SK'),
('SVN','Slovenia','SI'),
('SLB','Solomon Islands','SB'),
('SOM','Somalia','SO'),
('ZAF','South Africa','ZA'),
('SGS','South Georgia and the South Sandwich Islands','GS'),
('KOR','South Korea','KR'),
('SSD','South Sudan','SS'),
('ESP','Spain','ES'),
('LKA','Sri Lanka','LK'),
('SDN','Sudan','SD'),
('SUR','Suriname','SR'),
('SJM','Svalbard and Jan Mayen','SJ'),
('SWZ','Swaziland','SZ'),
('SWE','Sweden','SE'),
('CHE','Switzerland','CH'),
('SYR','Syria','SY'),
('TWN','Taiwan','TW'),
('TJK','Tajikistan','TJ'),
('TZA','Tanzania','TZ'),
('THA','Thailand','TH'),
('TGO','Togo','TG'),
('TKL','Tokelau','TK'),
('TON','Tonga','TO'),
('TTO','Trinidad and Tobago','TT'),
('TUN','Tunisia','TN'),
('TUR','Turkey','TR'),
('TKM','Turkmenistan','TM'),
('TCA','Turks and Caicos Islands','TC'),
('TUV','Tuvalu','TV'),
('UMI','U.S. Minor Outlying Islands','UM'),
('VIR','U.S. Virgin Islands','VI'),
('UGA','Uganda','UG'),
('UKR','Ukraine','UA'),
('ARE','United Arab Emirates','AE'),
('GBR','United Kingdom','GB'),
('USA','United States','US'),
('URY','Uruguay','UY'),
('UZB','Uzbekistan','UZ'),
('VUT','Vanuatu','VU'),
('VAT','Vatican City','VA'),
('VEN','Venezuela','VE'),
('VNM','Vietnam','VN'),
('WLF','Wallis and Futuna','WF'),
('ESH','Western Sahara','EH'),
('YEM','Yemen','YE'),
('ZMB','Zambia','ZM'),
('ZWE','Zimbabwe','ZW');

-- -----------------------------------------------------
-- function random_string
-- -----------------------------------------------------

DELIMITER $$
CREATE FUNCTION `random_string`(length SMALLINT(3), seed VARCHAR(255)) RETURNS varchar(255) CHARSET utf8
    NO SQL
BEGIN
    SET @output = '';

    IF seed IS NULL OR seed = '' THEN SET seed = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'; END IF;

    SET @rnd_multiplier = LENGTH(seed);

    WHILE LENGTH(@output) < length DO
        # Select random character and add to output
        SET @output = CONCAT(@output, SUBSTRING(seed, RAND() * (@rnd_multiplier + 1), 1));
    END WHILE;

    RETURN @output;
END$$

DELIMITER $$
CREATE TRIGGER `Certificat_BEFORE_INSERT` BEFORE INSERT ON `Certificat` FOR EACH ROW
BEGIN
	SET @exists = 1;
    SET @id = 0;
	WHILE (@exists <> 0) DO
		SET @id = (SELECT random_string(10, ''));
		SELECT COUNT(*) INTO @exists FROM Certificat WHERE idCertificat = @id;
	END WHILE;
    
	SET NEW.idCertificat = @id;
END$$


DELIMITER ;
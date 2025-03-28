CREATE TABLE `cursos`(
    `idCurso` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `curso` VARCHAR(70) NOT NULL,
    `matricula` DECIMAL(10, 2) NOT NULL,
    `idArea` TINYINT UNSIGNED NOT NULL,
    `idNivel` TINYINT UNSIGNED NOT NULL
);
CREATE TABLE `areas`(
    `idArea` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `area` VARCHAR(50) NOT NULL
);
CREATE TABLE `niveles`(
    `idNivel` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nivel` VARCHAR(50) NOT NULL
);
CREATE TABLE `alumnos`(
    `idAlumno` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `apellido` VARCHAR(70) NOT NULL,
    `nombre` VARCHAR(70) NOT NULL,
    `dni` INT UNSIGNED NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `nacimiento` DATE NOT NULL
);
ALTER TABLE
    `alumnos` ADD UNIQUE `alumnos_dni_unique`(`dni`);
CREATE TABLE `inscripciones`(
    `idInscripcion` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `idCurso` SMALLINT UNSIGNED NOT NULL,
    `idAlumno` SMALLINT UNSIGNED NOT NULL,
    `activo` BOOLEAN NOT NULL
);
ALTER TABLE
    `cursos` ADD CONSTRAINT `cursos_idarea_foreign` FOREIGN KEY(`idArea`) REFERENCES `areas`(`idArea`);
ALTER TABLE
    `inscripciones` ADD CONSTRAINT `inscripciones_idcurso_foreign` FOREIGN KEY(`idCurso`) REFERENCES `cursos`(`idCurso`);
ALTER TABLE
    `inscripciones` ADD CONSTRAINT `inscripciones_idalumno_foreign` FOREIGN KEY(`idAlumno`) REFERENCES `alumnos`(`idAlumno`);
ALTER TABLE
    `cursos` ADD CONSTRAINT `cursos_idnivel_foreign` FOREIGN KEY(`idNivel`) REFERENCES `niveles`(`idNivel`);
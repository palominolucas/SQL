/*Creando la base de datos */
CREATE DATABASE cognizant;
/*Usando la base de datos */
USE cognizant;

/* Creando la tabla employees*/
CREATE TABLE employees (
    PersonID int NOT NULL AUTO_INCREMENT,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255) NOT NULL,
    Address varchar(255) NOT NULL,
    City varchar(255) NOT NULL,
    PRIMARY KEY (PersonID)
);

/* Insertando algunas entradas */
INSERT INTO employees (PersonID,LastName,FirstName,Address,City)
VALUES 
(	
    1,
    'Palomino',
    'Lucas',
    'una 123',
    'Buenos Aires'
),
(
    2,
    'Perez',
    'Juan',
    'otra 123',
    'New York'
),
(
    3,
    'Xuan',
    'Ling',
    'yi 123',
    'Hong Kong'
);


/* Creando tabla salarys */
CREATE TABLE salarys(
    salary int NOT NULL,
    sPersonID int NOT NULL,
    PRIMARY KEY (sPersonID),
    FOREIGN KEY (sPersonID) REFERENCES employees (PersonID)
)


/* insertando datos en tabla salarys */
INSERT INTO salarys(salary,sPersonID)
VALUES
(
    55000,
    1
),
(
    80000,
    2
),
(
    130000,
    3
);


/* Obteniendo el empleado mejor pagado */
SELECT *FROM employees
LEFT JOIN salarys ON PersonID = sPersonID WHERE salary > (SELECT AVG(salary) FROM salarys);
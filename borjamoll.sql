-- Creates the database and sets it to be used it
CREATE DATABASE borjamoll;
USE borjamoll;

-- Teachers table
CREATE TABLE Teacher (
  id INTEGER PRIMARY KEY,
  name VARCHAR(250),
  email VARCHAR(250)
);

-- Companies table
CREATE TABLE Company (
  id INTEGER PRIMARY KEY,
  name VARCHAR(250),
  email VARCHAR(250)
);

-- Employees table
CREATE TABLE Employee (
  id INTEGER PRIMARY KEY,
  name VARCHAR(250),
  email VARCHAR(250),
  company_id INT,

  FOREIGN KEY (company_id) REFERENCES Company(id)

);


-- Students table
CREATE TABLE Student (
  id INTEGER PRIMARY KEY,
  name VARCHAR(250),
  surname VARCHAR(250),
  email VARCHAR(250),
  phone_number VARCHAR(15),
  teacher_id INT,
  employee_id INT,

  FOREIGN KEY (teacher_id) REFERENCES Teacher(id),
  FOREIGN KEY (employee_id) REFERENCES Employee(id)

);

-- Insert teachers
INSERT INTO Teacher VALUES (1, 'Antonia', 'antonia@cifpfbmoll.eu');
INSERT INTO Teacher VALUES (2, 'Josep', 'josep@cifpfbmoll.eu');
INSERT INTO Teacher VALUES (3, 'Luis', 'luis@cifpfbmoll.eu');

-- Insert companies
INSERT INTO Company VALUES (1, 'Barcelo', 'contact@barcelo.com');
INSERT INTO Company VALUES (2, 'AirEuropa', 'contact@aireuropa.com');
INSERT INTO Company VALUES (3, 'Melia Hotels', 'contact@melia.com');
INSERT INTO Company VALUES (4, 'Iberostar', 'contact@iberostar.com');
INSERT INTO Company VALUES (5, 'NH Hotels', 'contact@nh-hotels.com');

-- Insert employees
INSERT INTO Employee VALUES (1, 'Aina', 'aina@barcelo.com', 1);
INSERT INTO Employee VALUES (2, 'Jaume', 'jaume@aireuropa.com', 2);
INSERT INTO Employee VALUES (3, 'Laura', 'laura@melia.com', 3);
INSERT INTO Employee VALUES (4, 'Carlos', 'carlos@iberostar.com', 4);
INSERT INTO Employee VALUES (5, 'Elena', 'elena@nh-hotels.com', 5);
INSERT INTO Employee VALUES (6, 'Pedro', 'pedro@barcelo.com', 1);
INSERT INTO Employee VALUES (7, 'Rosa', 'rosa@melia.com', 3);
INSERT INTO Employee VALUES (8, 'Luis', 'luis@aireuropa.com', 2);


-- Insert students and assign them teachers and employees
INSERT INTO Student VALUES (1, 'Maria', 'Garcia', 'maria@cifpfbmoll.eu', '123456789', 1, 1);
INSERT INTO Student VALUES (2, 'Joan', 'Martinez', 'joan@cifpfbmoll.eu', '987654321', 2, 2);
INSERT INTO Student VALUES (3, 'Ana', 'Perez', 'ana@cifpfbmoll.eu', '123123123', 1, 3); 
INSERT INTO Student VALUES (4, 'Miguel', 'Lopez', 'miguel@cifpfbmoll.eu', '321321321', 3, 4);
INSERT INTO Student VALUES (5, 'Sara', 'Jimenez', 'sara@cifpfbmoll.eu', '456456456', 2, 5);
INSERT INTO Student VALUES (6, 'Carlos', 'Moreno', 'carlos@cifpfbmoll.eu', '654654654', 1, 6);
INSERT INTO Student VALUES (7, 'Paula', 'Hernandez', 'paula@cifpfbmoll.eu', '789789789', 3, 7);
INSERT INTO Student VALUES (8, 'Jorge', 'Ruiz', 'jorge@cifpfbmoll.eu', '789123456', 2, 1);
INSERT INTO Student VALUES (9, 'Lucia', 'Alvarez', 'lucia@cifpfbmoll.eu', '456789123', 1, 8);
INSERT INTO Student VALUES (10, 'Victor', 'Sanchez', 'victor@cifpfbmoll.eu', '321789654', 3, 3);
INSERT INTO Student VALUES (11, 'Elena', 'Ortiz', 'elena@cifpfbmoll.eu', '123456987', 2, 4);
INSERT INTO Student VALUES (12, 'Alberto', 'Gomez', 'alberto@cifpfbmoll.eu', '987123456', 1, 5);
INSERT INTO Student VALUES (13, 'Isabel', 'Torres', 'isabel@cifpfbmoll.eu', '654321789', 3, 6);
INSERT INTO Student VALUES (14, 'Raul', 'Castillo', 'raul@cifpfbmoll.eu', '789654123', 2, 7);
INSERT INTO Student VALUES (15, 'Laura', 'Ramirez', 'laura@cifpfbmoll.eu', '321456789', 1, 8);

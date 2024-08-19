CREATE DATABASE CarWashDB;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Phone VARCHAR(15),
    Email VARCHAR(100),
    Address VARCHAR(255)
);


CREATE TABLE Vehicles (
    CarsID INT PRIMARY KEY,
    CustomerID INT,
    LicensePlate VARCHAR(15),
    Make VARCHAR(50),
    Model VARCHAR(50),
    Year INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


CREATE TABLE Services (
    ServiceID INT PRIMARY KEY,
    ServiceName VARCHAR(100),
    Price DECIMAL(10, 2)
);


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    Position VARCHAR(50)
);


CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    CustomerID INT,
    CarsID INT,
    EmployeeID INT,
    ServiceID INT,
    Date DATE,
    TotalPrice DECIMAL(60, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (CarsID) REFERENCES vehicles(carsID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID)
);


INSERT INTO Customers (Name, Phone, Email, Address) 
VALUES('kabelo', '7559303', 'Kb@gmail.com', ' 10 nelson mandela Street'),
('lerato', '0853327755', 'lerato@gmail.com', '4 freedom st');

INSERT INTO vehicles (CustomerID, LicensePlate, Make, Model, Year)
 VALUES(1, 'fnp 938 L', 'vw', 'polo', 2021),
(2, 'fmk 666 l', 'ford', 'ranger', 2022);

INSERT INTO Services (ServiceName, Price)
 VALUES('interior Wash', 60.00),
('interior n exterior Wash', 100.00);

INSERT INTO Employees (Name, Position)
 VALUES('blueberrry', 'Washer'),
('kyn', 'Manager');

INSERT INTO Transactions (CustomerID, CarsID, EmployeeID, ServiceID, Date, TotalPrice) VALUES
(1, 1, 1, 1, '2024-07-14', 60.00),
(2, 2, 2, 2, '2024-07-16', 100.00);

SELECT * FROM Customers;


SELECT * FROM vehicles;

SELECT * FROM Services;

SELECT * FROM Employees;


SELECT * FROM Transactions;


--joins

-- Inner join
SELECT 
    Transactions.TransactionID, 
    Customers.Name AS CustomerName, 
    vehicles.LicensePlate, 
    Services.ServiceName, 
    Employees.Name AS EmployeeName, 
    Transactions.Date, 
    Transactions.TotalPrice
FROM 
    Transactions
INNER JOIN Customers ON Transactions.CustomerID = Customers.CustomerID
INNER JOIN vehicles ON Transactions.CarsID = Vehicles.carsID
INNER JOIN Services ON Transactions.ServiceID = Services.ServiceID
INNER JOIN Employees ON Transactions.EmployeeID = Employees.EmployeeID;

--operators
SELECT * FROM Transactions WHERE TotalPrice > 2;

SELECT * FROM Customers WHERE Name LIKE 'J%';


SELECT CustomerID, COUNT(*) AS CarsCount FROM vehicles GROUP BY CustomerID;

SELECT * FROM Services WHERE Price BETWEEN 60 AND 100;

SELECT * FROM Transactions WHERE Date = '2024-07-14';

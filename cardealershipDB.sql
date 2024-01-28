-- Insert data into Cars table
INSERT INTO Cars (Make, Model, Year, Color, Price, Mileage, Transmission, FuelType)
VALUES
('Toyota', 'Camry', 2022, 'Blue', 25000.00, 15000, 'Automatic', 'Gasoline'),
('Honda', 'Civic', 2021, 'Silver', 22000.00, 12000, 'Automatic', 'Gasoline'),
('Ford', 'Mustang', 2023, 'Red', 40000.00, 8000, 'Manual', 'Gasoline');

-- Insert data into Customers table
INSERT INTO Customers (FirstName, LastName, PhoneNumber, Email, Address)
VALUES
('John', 'Doe', '123-456-7890', 'john.doe@example.com', '123 Main St'),
('Jane', 'Smith', '987-654-3210', 'jane.smith@example.com', '456 Oak St');

-- Insert data into Sales table
INSERT INTO Sales (CarID, CustomerID, SaleDate, SalePrice, FinancingDetails)
VALUES
(1, 1, '2022-01-15', 25000.00, 'Financed'),
(2, 2, '2022-02-20', 22000.00, 'Cash'),
(3, 1, '2022-03-25', 40000.00, 'Lease');

-- Insert data into ServiceRequests table
INSERT INTO ServiceRequests (CarID, CustomerID, ServiceDate, Description, ServiceStatus)
VALUES
(1, 1, '2022-02-01', 'Regular maintenance', 'Pending'),
(2, 2, '2022-03-10', 'Oil change', 'Completed'),
(3, 1, '2022-04-15', 'Tire replacement', 'In Progress');

-- Show tables in the cardealership1 schema
SHOW TABLES FROM car_dealership;
SELECT * FROM Cars;
SELECT * FROM Customers;
SELECT * FROM Sales;
SELECT * FROM ServiceRequests;

-- Use the cardealership1 schema
USE car_dealership;

-- Create Car Information Table
CREATE TABLE Cars (
    CarID INT PRIMARY KEY AUTO_INCREMENT,
    Make VARCHAR(50) NOT NULL,
    Model VARCHAR(50) NOT NULL,
    Year INT NOT NULL,
    Color VARCHAR(30),
    Price DECIMAL(10, 2),
    Mileage INT,
    Transmission VARCHAR(20),
    FuelType VARCHAR(20)
);

-- Create Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100),
    Address VARCHAR(255)
);

-- Create Sales Table
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY AUTO_INCREMENT,
    CarID INT,
    CustomerID INT,
    SaleDate DATE,
    SalePrice DECIMAL(10, 2),
    FinancingDetails VARCHAR(255),
    FOREIGN KEY (CarID) REFERENCES Cars(CarID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Create Service Requests Table
CREATE TABLE ServiceRequests (
    RequestID INT PRIMARY KEY AUTO_INCREMENT,
    CarID INT,
    CustomerID INT,
    ServiceDate DATE,
    Description VARCHAR(255),
    ServiceStatus VARCHAR(20),
    FOREIGN KEY (CarID) REFERENCES Cars(CarID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
SHOW TABLES FROM car_dealership;


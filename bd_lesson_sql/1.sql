CREATE TABLE Regions (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    Name VARCHAR(255) NOT NULL
);

CREATE TABLE Locations (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    Name VARCHAR(255) NOT NULL,
    Address VARCHAR(255),
    Region_id INTEGER,
    FOREIGN KEY (Region_id) REFERENCES Regions(id)
);

CREATE TABLE Departments (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    Name VARCHAR(255) NOT NULL,
    Location_id INTEGER,
    Manager_id INTEGER,
    FOREIGN KEY (Location_id) REFERENCES Locations(id),
    FOREIGN KEY (Manager_id) REFERENCES Employees(id)
);

CREATE TABLE Employees (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    Name VARCHAR(255) NOT NULL,
    Last_name VARCHAR(255) NOT NULL,
    Hire_date DATE,
    Salary INTEGER,
    Email VARCHAR(255),
    Manager_id INTEGER,
    Department_id INTEGER,
    FOREIGN KEY (Manager_id) REFERENCES Employees(id),
    FOREIGN KEY (Department_id) REFERENCES Departments(id)
);

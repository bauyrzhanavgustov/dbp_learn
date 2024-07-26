CREATE TABLE Regions (
    id SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL
);

CREATE TABLE Locations (
    id SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Address VARCHAR(255),
    Region_id INTEGER,
    CONSTRAINT fk_Region FOREIGN KEY (Region_id) REFERENCES Regions(id)
);

CREATE TABLE Departments (
    id SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Location_id INTEGER,
    Manager_id INTEGER,
    CONSTRAINT fk_Location FOREIGN KEY (Location_id) REFERENCES Locations(id),
    CONSTRAINT fk_Manager FOREIGN KEY (Manager_id) REFERENCES Employees(id)
);

CREATE TABLE Employees (
    id SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Last_name VARCHAR(255) NOT NULL,
    Hire_date DATE,
    Salary INTEGER,
    Email VARCHAR(255),
    Manager_id INTEGER,
    Department_id INTEGER,
    CONSTRAINT fk_Manager FOREIGN KEY (Manager_id) REFERENCES Employees(id),
    CONSTRAINT fk_Department FOREIGN KEY (Department_id) REFERENCES Departments(id)
);

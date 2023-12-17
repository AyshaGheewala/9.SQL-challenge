ALTER DATABASE sql_challenge SET datestyle TO "ISO, MDY";

CREATE TABLE Department (
    Department_no VARCHAR(255)   NOT NULL,
    Department_name VARCHAR(255)   NOT NULL,
    CONSTRAINT pk_Department PRIMARY KEY (
        Department_no
     )
);

CREATE TABLE Department_Employee (
    Employee_no INT   NOT NULL,
    Department_no VARCHAR(255)   NOT NULL,
    CONSTRAINT pk_Department_Employee PRIMARY KEY (
        Employee_no,Department_no
     )
);

CREATE TABLE Manager (
    Department_no VARCHAR(255)   NOT NULL,
    Employee_no INT   NOT NULL,
    CONSTRAINT pk_Manager PRIMARY KEY (
        Employee_no
     )
);

CREATE TABLE Employee (
    Employee_no INT   NOT NULL,
    Title_id VARCHAR(255)   NOT NULL,
    Birth_date DATE   NOT NULL,
    First_name VARCHAR(255)   NOT NULL,
    Last_name VARCHAR(255)   NOT NULL,
    Sex VARCHAR(255)   NOT NULL,
    Hire_date DATE   NOT NULL,
    CONSTRAINT pk_Employee PRIMARY KEY (
        Employee_no
     )
);

CREATE TABLE Salary (
    Employee_no INT   NOT NULL,
    Salary INT   NOT NULL,
    CONSTRAINT pk_Salary PRIMARY KEY (
        Employee_no
     )
);

CREATE TABLE Title (
    Title_id VARCHAR(255)   NOT NULL,
    Title VARCHAR(255)   NOT NULL,
    CONSTRAINT pk_Title PRIMARY KEY (
        Title_id
     )
);

ALTER TABLE Department_Employee ADD CONSTRAINT fk_Department_Employee_Employee_no FOREIGN KEY(Employee_no)
REFERENCES Employee (Employee_no);

ALTER TABLE Department_Employee ADD CONSTRAINT fk_Department_Employee_Department_no FOREIGN KEY(Department_no)
REFERENCES Department (Department_no);

ALTER TABLE Manager ADD CONSTRAINT fk_Manager_Department_no FOREIGN KEY(Department_no)
REFERENCES Department (Department_no);

ALTER TABLE Manager ADD CONSTRAINT fk_Manager_Employee_no FOREIGN KEY(Employee_no)
REFERENCES Employee (Employee_no);

ALTER TABLE Employee ADD CONSTRAINT fk_Employee_Title_id FOREIGN KEY(Title_id)
REFERENCES Title (Title_id);

ALTER TABLE Salary ADD CONSTRAINT fk_Salary_Employee_no FOREIGN KEY(Employee_no)
REFERENCES Employee (Employee_no);

-- Import CSV Files in the following order to handle foreign keys: 
-- Department, Title, Employee, Department_Employee, Manager and Salary


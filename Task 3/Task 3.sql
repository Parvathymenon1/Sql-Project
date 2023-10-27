--- create the events Table

CREATE TABLE Events(
    Event_Id SERIAL PRIMARY KEY,
    Event_Name VARCHAR(150) NOT NULL,
    Event_Date Date NOT NULL,
    Event_Location VARCHAR(255),
    Event_Description TEXT
);

--- create the attentees Table

CREATE TABLE Attendees(
    Attendee_Id SERIAL PRIMARY KEY,
    Attendee_Name VARCHAR(255) NOT NULL,
    Attendee_Phone VARCHAR(15),
    Attendee_Email VARCHAR(255),
    Attendee_City VARCHAR(255)
);

--- create the registrations Table

CREATE TABLE Registrations(
    Registration_ID SERIAL PRIMARY KEY,
    Event_Id INT REFERENCES Events(Event_Id),
    Attendee_Id INT REFERENCES Attendees(Attendee_Id),
    Registration_Date DATE,
    Registration_Amount NUMERIC(10,2)
);
--- insert sample data 

INSERT INTO Events(Event_Id,Event_Name,Event_Date,Event_Location,Event_Description)
VALUES
(101,'Event A','2023-10-26','Bangalore','Music concert by Agam Band'),
(102,'Event B','2023-10-14','Delhi','Music concert by Agam Band'),
(103,'Event C','2023-10-24','Hyderabad','Music concert by ABC Band'),
(104,'Event D','2023-10-26','Hyderabad','Music concert by ABC Band'),
(105,'Event E','2023-10-25','Bangalore','Music concert by Agam Band');

INSERT INTO Attendees(Attendee_Id,Attendee_Name,Attendee_Phone,Attendee_Email,Attendee_City)
VALUES
(1,'priya',81296,'priya@gmail.com','Bangalore'),
(2,'Mani',81290,'mani@gmail.com','Hyderabad'),
(3,'Sravan',81206,'sravan@gmail.com','Bangalore'),
(4,'Kim',81190,'kim@gmail.com','Delhi'),
(5,'Bella',712960,'bella@gmail.com','Delhi'),
(6,'priya',81296,'priya@gmail.com','Bangalore'),
(7,'Mani',81290,'mani@gmail.com','Hyderabad'),
(8,'Sravan',81206,'sravan@gmail.com','Bangalore'),
(9,'Kim',81190,'kim@gmail.com','Delhi'),
(10,'Bella',712960,'bella@gmail.com','Delhi');

INSERT INTO Registrations(Event_Id,Attendee_Id,Registration_Date,Registration_Amount)
VALUES
(101,1,'2023-10-20',1075.00),
(102,2,'2023-10-20',1050.00),
(103,3,'2023-10-20',1075.00),
(104,4,'2023-10-20',1075.00),
(105,5,'2023-10-10',1075.00);

--- insert a new event

INSERT INTO Events(Event_Id,Event_Name,Event_Date,Event_Location,Event_Description)
VALUES
(106,'Event F','2023-10-27','Bangalore','Music concert by Backstreet boys Band');
select * from Events;

UPDATE Events
SET Event_Location = 'Kochi'
WHERE Event_Id = 101;
select * from Events;

DELETE FROM Events
WHERE Event_Id = 102;
select * from Events;

INSERT INTO Attendees(Attendee_Id,Attendee_Name,Attendee_Phone,Attendee_Email,Attendee_City)
VALUES (11,'Devi',912960,'devi@gmail.com','Kochi');
select * from Attendees;

SELECT * from Events WHERE Event_Id = 101;

select * from Attendees;

Select count(*) from Registrations WHERE Event_Id = 102;

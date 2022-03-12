--Database Create Query

CREATE DATABASE ContactsApp

use ContactsApp

CREATE TABLE UserRegisters(
	User_ID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	User_EmailID varchar(60),
	User_Password varchar(60),
	User_Secret varchar(60) NOT NULL UNIQUE,
	Archived int DEFAULT 0,
	DateCreated datetime DEFAULT getdate()
)

CREATE TABLE ContactForm(
	Contact_ID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Contact_Name varchar(60),
	Contact_Phno varchar(60),
	Contact_Email varchar(60),
	Contact_UserID int FOREIGN KEY REFERENCES UserRegisters(User_ID),
	Archived int DEFAULT 0,
	UserCreated varchar(60),
	DateCreated datetime DEFAULT getdate()
)

CREATE SCHEMA [test];
CREATE TABLE [test].[Student](
    [id] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [name] [varchar](50) NOT NULL,
    [age] INT NOT NULL
);

INSERT test.Student ([name],[age]) VALUES (N'Bo', 23);
SELECT * from test.Student;

/* show all the databases */
Select Name FROM dbo.SysDatabases orDER BY Name

-- show all the tables
Select Name FROM SysObjects Where XType='U' orDER BY Name

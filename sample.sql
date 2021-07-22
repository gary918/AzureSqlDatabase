
CREATE SCHEMA [test];

-- Source table
CREATE TABLE [test].[Student](
    [id] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [name] [varchar](50) NOT NULL,
    [score] INT NOT NULL,
    [last_modified_time] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    [update_pid] INT NOT NULL
);

INSERT test.Student ([name],[score],[update_pid]) VALUES (N'James', 95, 1);
INSERT test.Student ([name],[score],[update_pid]) VALUES (N'Gary', 90, 1);
INSERT test.Student ([name],[score],[update_pid]) VALUES (N'James', 98, 2);
INSERT test.Student ([name],[score],[update_pid]) VALUES (N'Gary', 84, 2);
SELECT * from test.Student;


CREATE TABLE [test].[Class](
    [class_id] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [class_name] [varchar](50) NOT NULL
);

INSERT [test].[Class] ([class_name]) VALUES (N'A');
INSERT [test].[Class] ([class_name]) VALUES (N'B');
INSERT [test].[Class] ([class_name]) VALUES (N'C');
INSERT [test].[Class] ([class_name]) VALUES (N'D');
INSERT [test].[Class] ([class_name]) VALUES (N'E');


-- Watermark table
CREATE TABLE [test].[WatermarkTable](
    [watermark] INT NOT NULL
);
INSERT INTO test.WatermarkTable VALUES(0);
SELECT * from test.WatermarkTable;

-- Procedure for udpating watermark
CREATE PROCEDURE test.update_watermark @LastPid INT
as 
BEGIN
    UPDATE test.WatermarkTable
    SET [watermark] = @LastPid
END


/* show all the databases */
Select Name FROM dbo.SysDatabases orDER BY Name

-- show all the tables
Select Name FROM SysObjects Where XType='U' orDER BY Name

-- Other test
DROP TABLE test.Student
select @@IDENTITY


-- Check the column names of a table
SELECT Name FROM SysColumns WHERE id=Object_Id('test.Student')


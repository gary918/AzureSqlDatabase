
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


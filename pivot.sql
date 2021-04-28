CREATE SCHEMA [test];

-- Source table
CREATE TABLE [test].[Student](
    [student_id] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [name] [varchar](50) NOT NULL,
    [score] INT NOT NULL,
    [last_modified_time] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    [update_pid] INT NOT NULL
);

INSERT test.Student ([name],[score],[update_pid]) VALUES (N'James', 95, 1);
INSERT test.Student ([name],[score],[update_pid]) VALUES (N'Gary', 90, 1);
SELECT * from test.Student;

-- Create table for additional key value table
CREATE TABLE [test].[StudentAttribute](
	[student_id] INT FOREIGN KEY REFERENCES [test].[Student](student_id) NOT NULL,
	[key] VARCHAR(50),
	[value] VARCHAR(255)
	CONSTRAINT PK_StudentAttribute PRIMARY KEY ([student_id],[key])
)

INSERT [test].[StudentAttribute]([student_id],[key],[value]) VALUES(1,'gender','male')
INSERT [test].[StudentAttribute]([student_id],[key],[value]) VALUES(1,'hobby','soccer')
INSERT [test].[StudentAttribute]([student_id],[key],[value]) VALUES(2,'gender','male')
INSERT [test].[StudentAttribute]([student_id],[key],[value]) VALUES(2,'hobby','hocky')
SELECT * from [test].[StudentAttribute]


-- Join with the key value table
SELECT
	st.[student_id],
	st.[name],
	sa.[gender],
	sa.[hobby]
FROM
	test.Student st
	INNER JOIN
	(
		SELECT
			[student_id],
			[gender],
			[hobby]
		FROM
			(
				SELECT
					[student_id],
					[key],
					[value] 
				FROM test.StudentAttribute
			) AS SourceTable
		PIVOT
			(
			MIN([Value])    
			FOR [Key] IN
				(
					gender,
					hobby
				)
			) AS PivotOutput
	) sa
	ON st.student_id = sa.student_id
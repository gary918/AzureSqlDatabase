SELECT * FROM [test].[Student]

ALTER TABLE [test].[Student] 
ADD [Address] VARCHAR(200) NULL

UPDATE test.Student SET [Address]='New Zealand'

ALTER TABLE [test].[Student] 
--drop CONSTRAINT [DF__Student__Address__2A363CC5]
drop COLUMN [Address]

-- Make it transactional
BEGIN TRANSACTION
ALTER TABLE test.Student
ADD [part_name] VARCHAR(200) NULL

UPDATE test.Student SET [part_name]='Part'
COMMIT

-- Duplicate a table
select * INTO test.Student_20210709 FROM test.Student
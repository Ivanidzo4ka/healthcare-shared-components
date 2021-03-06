﻿CREATE TYPE dbo.NameType_2 AS TABLE
(
    Given nvarchar(128) NOT NULL,
    Family nvarchar(128) NOT NULL
)

GO

CREATE PROCEDURE dbo.MyProcedure_2
    @names dbo.NameType_1 READONLY
AS
    SELECT 1
GO

CREATE TABLE dbo.Table1
(
    Id int,
    Name nvarchar(20)
)

CREATE TABLE dbo.Table2
(
    Id int,
    City nvarchar(20)
)

GO

CREATE VIEW dbo.MyView
	WITH SCHEMABINDING
	AS

	SELECT 
        t1.Id, 
        t1.Name, 
        t2.City AS TheCity
	FROM dbo.Table1 t1
	INNER JOIN dbo.Table2 t2 ON t1.Id = t2.Id
GO

CREATE UNIQUE CLUSTERED INDEX IXC_View12 ON dbo.MyView
(
    Id,
    Name,
    TheCity
)
WITH (DATA_COMPRESSION = PAGE)

CREATE NONCLUSTERED INDEX IX_View12_City ON dbo.MyView
(	
    TheCity
)
WITH (DATA_COMPRESSION = PAGE)
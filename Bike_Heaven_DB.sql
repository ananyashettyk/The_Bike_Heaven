CREATE TABLE ProductInformation AS
SELECT 
    p.productkey,
    p.productalternatekey,
    p.englishproductname,
    p.color,
    p.size,
    p.daystomanufacture,
    p.productline,
    p.modelname,
    c.productcategorykey categorykey,
    c.englishproductcategoryname categoryname,
	c.productsubcategorykey subcategorykey,
    c.englishproductsubcategoryname subcategoryname
FROM 
    product p
LEFT JOIN
    (SELECT pc.productcategorykey, pc.englishproductcategoryname, psc.productsubcategorykey, psc.englishproductsubcategoryname
	FROM productcategory pc INNER JOIN productsubcategory psc ON pc.productcategorykey=psc.productcategorykey) c 
	ON p.productsubcategorykey = c.productsubcategorykey
ORDER BY productkey;
--
SELECT * FROM ProductInformation;
----------------------------------

UPDATE customer SET title='' WHERE title='NULL';
UPDATE customer SET middlename='' WHERE middlename='NULL';
UPDATE customer SET addressline2 =''  WHERE addressline2='NULL';

-------------------- SELECT * FROM internetsales
CREATE TABLE Customers  AS
SELECT 
  c.customerkey,
  TRIM(CONCAT(c.title, ' ', c.firstname, ' ', c.middlename, ' ', c.lastname)) AS fullname,
  c.birthdate,
  c.gender,
  c.emailaddress,
  c.yearlyincome,
  c.englishoccupation,
  TRIM(CONCAT(c.addressline1, c.addressline2)) AS address,
  c.phone,
  c.datefirstpurchase,
  c.commutedistance,
  g.city,
  g.stateprovincecode AS StateCode,
  g.stateprovincename AS StateName,
  g.countryregioncode AS CountryCode,
  g.englishcountryregionname AS CountryName,
  g.postalcode,
  g.salesterritorykey,
  g.ipaddresslocator
FROM 
  Customer c
LEFT JOIN 
  Geography g ON c.geographykey = g.geographykey
WHERE EXTRACT(YEAR FROM datefirstpurchase) > 2020;
-------------------------SELECT * FROM customers

ALTER TABLE date
DROP COLUMN spanishdaynameofweek,
DROP COLUMN frenchdaynameofweek,
DROP COLUMN spanishmonthname,
DROP COLUMN frenchmonthname,
DROP COLUMN monthnumberofyear,
DROP COLUMN calendarquarter,
DROP COLUMN calendaryear,
DROP COLUMN calendarsemester,
DROP COLUMN fiscalsemester;
---------------------------------SELECT * FROM DATE  --SELECT * FROM internetsales
SELECT * FROM DATE
	WHERE EXTRACT(YEAR FROM fulldatealternatekey) > 2020;

-- ALTER TABLE internetsales
-- ALTER COLUMN totalproductcost TYPE integer USING (totalproductcost::numeric)::integer;

delete from internetsales where orderdate <'2021-01-01 00:00:00:000';

CREATE TABLE SalesBudget (
    date DATE,
    budget NUMERIC
);
DROP TABLE SalesBudget;
COPY SalesBudget
FROM 'C:\Program Files\PostgreSQL\16\data\Data_copy_test\SalesBudget.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM SalesBudget;

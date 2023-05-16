BACKUP DATABASE max TO DISK = 'C:\backup\max';

CREATE LOGIN superuser WITH PASSWORD = 'max2005';
CREATE LOGIN admin WITH PASSWORD = 'aboba';
CREATE LOGIN username WITH PASSWORD = 'maga';

USE max;
CREATE USER superuser FOR LOGIN superuser;
ALTER ROLE db_owner ADD MEMBER superuser;

CREATE USER admin FOR LOGIN admin;
GRANT SELECT, UPDATE, DELETE, INSERT TO admin;

CREATE USER admin FOR LOGIN username;
GRANT SELECT, INSERT ON table TO admin;

DROP LOGIN admin;

GO
if exists (select * from dbo.AspNetUsers where Id = '9f419b0a-62c4-4623-a871-72409fc64f86')
update dbo.AspNetUsers 
set FirstName = 'John', LastName = 'Lennon'


select * from dbo.AspNetUsers
select * from dbo.AspNetRoles

if exists (select * from dbo.AspNetRoles where Id = '0127dbac-3799-48a0-a7d3-2af1b91a98ed')
update dbo.AspNetRoles 
set Name = 'Admin'
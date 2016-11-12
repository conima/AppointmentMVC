select * from dbo.Appointment
select * from dbo.AspNetUsers
select * from dbo.AppointmentUser
select * from dbo.TimeTable

select a.FirstName, a.LastName, a.Email, ap.AppNumber, (select Start from TimeTable where Slot = ap.Slot) as 'Time', ISNULL(ap.Description, '') as 'Description'
 from dbo.AspNetUsers a inner join dbo.AppointmentUser au on a.Id = au.UserId
 inner join Appointment ap on ap.Id = au.AppointmentId where ap.AppDate = '2015-03-05'

 

 
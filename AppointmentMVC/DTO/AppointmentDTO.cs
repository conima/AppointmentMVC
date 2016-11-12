using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AppointmentMVC.DTO
{
    public class AppointmentDTO
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public int AppNumber { get; set; }
        public TimeSpan Time { get; set; }
        public DateTime AppDate { get; set; }
        public string Description { get; set; }
    }
}
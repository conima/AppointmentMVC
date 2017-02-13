using AppointmentMVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace AppointmentMVC.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        [Authorize]
        public ActionResult Appointment()
        {
            ViewBag.Message = "Create your appointment";

            return View();
        }

        [Authorize(Users = "admin@test.com")]
        // pass: a000000
        
        public ActionResult Admin()
        {
            ViewBag.Message = "Administration page";

            return View();
        }

        [Authorize]
        public ActionResult Details(string user)
        {
            ApplicationDbContext db = new ApplicationDbContext();
            var currentUser = db.Users.Single(x => x.Email == user);
            return View(currentUser);
        }        
    }
}
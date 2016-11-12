using AppointmentMVC.DTO;
using AppointmentMVC.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace MvcAppointmentApp.Controllers
{
    public class CatalogController : Controller
    {
        ApplicationDbContext db = new ApplicationDbContext();
        //
        // GET: /Catalog/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult CheckDateAvailability(string desiredDay)
        {
            try
            {
                if (desiredDay == null)
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

                DateTime desiredDate = DateTime.Parse(desiredDay);
                var timeslots = db.Database.SqlQuery<TimeSpan>("uspGetAvailableTime @AppDate",
                    new SqlParameter("@AppDate", desiredDate));

                return Json(timeslots);
            }
            catch (Exception e)
            {
                //log error
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest, e.Message);
            }
        }

        public ActionResult SetAppointment(int timeSlot, DateTime appDate)
        {
            if (timeSlot == null && appDate == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            string name = User.Identity.Name;
            string message = "";
            try
            {
                db.Database.ExecuteSqlCommand("uspSetAppointment @userName, @timeSlot, @appDate",
                new SqlParameter("@userName", name),
                new SqlParameter("@timeSlot", timeSlot),
                new SqlParameter("@appDate", appDate));
                message = "Your appointment succesfully booked !";
            }
            catch (Exception e)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest, e.Message);
            }
            return Json(message);
        }

        public ActionResult GetAppointments(string appDay)
        {
            try
            {
                if (appDay == null)
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

                DateTime appDate = DateTime.Parse(appDay);
                var appList = db.Database.SqlQuery<AppointmentDTO>("uspGetAppointmentlist @AppDate",
                    new SqlParameter("@AppDate", appDate));

                return Json(appList);
            }
            catch (Exception e)
            {
                //log error
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest, e.Message);
            }
        }

        public ActionResult SetDescription(int id, string text)
        {
            if (id == null && text == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            string message = "";
            try
            {
                db.Database.ExecuteSqlCommand("uspSetDescription @Id, @text",
                new SqlParameter("@Id", id),
                new SqlParameter("@text", text));
                message = "Description succesfully added !";
            }
            catch (Exception e)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest, e.Message);
            }
            return Json(message);
        }

        public ActionResult getMyAppointments()
        {
            string name = User.Identity.Name;
            try
            {
                var appList = db.Database.SqlQuery<AppointmentDTO>("uspGetMyAppointments @UserName",
                    new SqlParameter("@UserName", name));

                return Json(appList);
            }
            catch (Exception e)
            {
                //log error
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest, e.Message);
            }
        }

        public ActionResult deleteMyAppointment(int id)
        {
            if (id == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            string message = "";
            try
            {
                db.Database.ExecuteSqlCommand("uspDeleteMyAppointments @Id",
                new SqlParameter("@Id", id));
                message = "Appointment deleted!";
            }
            catch (Exception e)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest, e.Message);
            }
            return Json(message);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}

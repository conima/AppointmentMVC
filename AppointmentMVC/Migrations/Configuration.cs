namespace AppointmentMVC.Migrations
{
    using AppointmentMVC.Models;
    using Microsoft.AspNet.Identity;
    using Microsoft.AspNet.Identity.EntityFramework;
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;

    internal sealed class Configuration : DbMigrationsConfiguration<AppointmentMVC.Models.ApplicationDbContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = true;
            ContextKey = "AppointmentMVC.Models.ApplicationDbContext";
        }

        protected override void Seed(AppointmentMVC.Models.ApplicationDbContext context)
        {
            if (!context.Users.Any(u => u.Email == "test@test.com"))
            {
                var store = new UserStore<ApplicationUser>(context);
                var manager = new UserManager<ApplicationUser>(store);
                var user = new ApplicationUser { Email = "test@test.com" };
                manager.UpdateAsync(user);

                manager.Create(user, "password");
            }
            var UserManager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(context));
            var RoleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(context));

            // Create Admin Role
            string roleName = "Admin";
            IdentityResult roleResult;

            // Check to see if Role Exists, if not create it
            if (!RoleManager.RoleExists(roleName))
            {
                roleResult = RoleManager.Create(new IdentityRole(roleName));
            }
        }
    }
}

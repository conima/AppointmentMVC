using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(AppointmentMVC.Startup))]
namespace AppointmentMVC
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}

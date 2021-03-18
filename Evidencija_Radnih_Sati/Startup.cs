using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Evidencija_Radnih_Sati.Startup))]
namespace Evidencija_Radnih_Sati
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}

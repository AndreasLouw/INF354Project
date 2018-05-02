using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(INF354Project.Startup))]
namespace INF354Project
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}

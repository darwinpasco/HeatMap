using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(HeatMap.Startup))]
namespace HeatMap
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}

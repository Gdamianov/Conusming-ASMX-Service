using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ConsumingASMXService.Startup))]
namespace ConsumingASMXService
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}

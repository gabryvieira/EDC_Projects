﻿using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(EDC2015_Trabalho2Parte2.Startup))]
namespace EDC2015_Trabalho2Parte2
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}

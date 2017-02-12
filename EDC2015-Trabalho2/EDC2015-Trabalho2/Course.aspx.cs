using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EDC2015_Trabalho2
{
    public partial class Course : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           XmlInfoCourse.DataFile = String.Format("http://acesso.ua.pt/xml/curso.asp?i={0}", Request.QueryString["ID"]);
        }

        protected void XmlInfoCourse_Transforming(object sender, EventArgs e)
        {

        }

        protected void DetailsView1_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
        {

        }
    }
}
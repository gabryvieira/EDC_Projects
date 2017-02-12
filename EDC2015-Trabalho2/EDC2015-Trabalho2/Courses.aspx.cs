using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EDC2015_Trabalho2
{
    public partial class Courses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { 
                XmlCourses.XPath = "/cursos/curso[@grau='Licenciatura' and @local='Campus Universitário de Santiago, Aveiro']"; 
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //System.Diagnostics.Debug.WriteLine(DropDownList1.SelectedValue);
            /*string grau = DropDownList1.SelectedValue;
            string local = DropDownList2.SelectedValue;
            XmlCourses.XPath = "/cursos/curso[@grau='" +grau + "'and @local='"+local+"']";*/
            XmlCourses.XPath = "/cursos/curso[@grau='" + DropDownList1.SelectedValue + "' and @local='" + DropDownList2.SelectedValue + "']";
            //GridView1.DataBind();
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            //System.Diagnostics.Debug.WriteLine(DropDownList2.SelectedValue);
            /*string grau = DropDownList1.SelectedValue;
            string local = DropDownList2.SelectedValue;
            XmlCourses.XPath = "/cursos/curso[@grau='" + grau + "'and @local='" + local + "']";*/
            XmlCourses.XPath = "/cursos/curso[@grau='" + DropDownList1.SelectedValue + "' and @local='" + DropDownList2.SelectedValue + "']";
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
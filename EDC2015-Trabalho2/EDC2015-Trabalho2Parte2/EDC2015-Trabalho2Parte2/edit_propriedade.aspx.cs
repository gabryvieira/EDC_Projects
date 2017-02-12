using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace EDC2015_Trabalho2Parte2
{
    public partial class edit_propriedade : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //protected void FormView1_ItemDeleting(object sender, FormViewUpdateEventArgs e)
        //{
        //
       // }

        protected void FormView1_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            XmlDocument xdoc = XmlDataSource1.GetXmlDocument();

            //verificar se os campos estao todos preenchidos
            string script = "<script language=\"javascript\">\n" + "alert (\"Preencha todos os campos\");\n" + "</script>";
            if (e.NewValues["city"].ToString().Length == 0 || e.NewValues["Street"].ToString().Length == 0 || e.NewValues["pnumber"].ToString().Length == 0 || e.NewValues["value"].ToString().Length == 0)
            {
                ClientScript.RegisterStartupScript(script.GetType(), "Error", script);
                e.Cancel = true;
            }
            else
            {
                //verificar se os valuees numericos sao validos
                uint pn;
                uint v;
                if (!UInt32.TryParse(e.NewValues["pnumber"].ToString(), out pn) || !UInt32.TryParse(e.NewValues["value"].ToString(), out v))
                {
                    script = "<script language=\"javascript\">\n" + "alert (\"Os campos numéricos tem de ser validos\");\n" + "</script>";
                    ClientScript.RegisterStartupScript(script.GetType(), "Error", script);
                    e.Cancel = true;
                }
                else
                {
                    //a morada ja existe
                    XmlElement moradarepetida = xdoc.SelectSingleNode("properties/property[@city='" + e.NewValues["city"].ToString() + "' and @Street='" + e.NewValues["Street"].ToString() + "' and @pnumber='" + e.NewValues["pnumber"].ToString() + "' and @id!='" + e.NewValues["id"].ToString() + "']") as XmlElement;
                    if (moradarepetida == null)
                    {
                        XmlElement propriedade = xdoc.SelectSingleNode("properties/property[@id='" + e.NewValues["id"].ToString() + "']") as XmlElement;


                        propriedade.Attributes["city"].Value = e.NewValues["city"].ToString();
                        propriedade.Attributes["Street"].Value = e.NewValues["Street"].ToString();
                        propriedade.Attributes["pnumber"].Value = e.NewValues["pnumber"].ToString();
                        propriedade.Attributes["value"].Value = e.NewValues["value"].ToString();

                        XmlDataSource1.Save();

                        e.Cancel = true;
                        FormView1.ChangeMode(FormViewMode.ReadOnly);
                        Response.Redirect("propriedades.aspx");
                    }
                    else
                    {
                        script = "<script language=\"javascript\">\n" + "alert (\"Já existe uma propriedade com essa morada\");\n" + "</script>";
                        ClientScript.RegisterStartupScript(script.GetType(), "Error", script);
                        e.Cancel = true;
                    }
                }
            }



        }

        protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {

        }
    }
}
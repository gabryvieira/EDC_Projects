using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace EDC2015_Trabalho2Parte2
{
    public partial class edit_owner : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void FormView1_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            XmlDocument xdoc = XmlDataSource1.GetXmlDocument();

            //verificar se os campos estao todos preenchidos
            string script = "<script language=\"javascript\">\n" + "alert (\"Preencha todos os campos\");\n" + "</script>";
            if (e.NewValues["nif"].ToString().Length == 0 || e.NewValues["fname"].ToString().Length == 0 || e.NewValues["lname"].ToString().Length == 0 || e.NewValues["pdate"].ToString().Length == 0)
            {
                ClientScript.RegisterStartupScript(script.GetType(), "Error", script);
                e.Cancel = true;
            }
            else
            {
                //verificar se os valores numericos sao validos
                uint pn;
                
                if (!UInt32.TryParse(e.NewValues["nif"].ToString(), out pn))
                {
                    script = "<script language=\"javascript\">\n" + "alert (\"Os campos numéricos tem de ser validos\");\n" + "</script>";
                    ClientScript.RegisterStartupScript(script.GetType(), "Error", script);
                    e.Cancel = true;
                }
                else
                {
                    //o nif ja existe
                  //  XmlElement nifrepetido = xdoc.SelectSingleNode("properties/property/owner[@nif='" + e.NewValues["nif"].ToString() + "' and @fname='" + e.NewValues["fname"].ToString() + "' and @lname='" + e.NewValues["lname"].ToString() + "' and @pdate!='" + e.NewValues["pdate"].ToString() + "']") as XmlElement;
                  //  if (nifrepetido == null)
                  //  {
                        XmlElement propriedade = xdoc.SelectSingleNode("properties/property/owner[@nif='" + e.NewValues["nif"].ToString() + "']") as XmlElement;


                        propriedade.Attributes["nif"].Value = e.NewValues["nif"].ToString();
                        propriedade.Attributes["fname"].Value = e.NewValues["fname"].ToString();
                        propriedade.Attributes["lname"].Value = e.NewValues["lname"].ToString();
                        propriedade.Attributes["pdate"].Value = e.NewValues["pdate"].ToString();

                        XmlDataSource1.Save();

                        e.Cancel = true;
                        FormView1.ChangeMode(FormViewMode.ReadOnly);
                        Response.Redirect("Owners.aspx");
                  //  }
                    //else
                   // {
                     //   script = "<script language=\"javascript\">\n" + "alert (\"Já existe um owner com esse nif\");\n" + "</script>";
                    //    ClientScript.RegisterStartupScript(script.GetType(), "Error", script);
                  //      e.Cancel = true;
                //    }
                }
            }



        }

        protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {

        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace EDC2015_Trabalho2Parte2
{
    public partial class remove_owner : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String nif = Request["nif"];
            XmlDataSource1.XPath = "listadonos/owner[not(@nif=preceding::owner/@nif) and (@nif='"+nif+"')]";
            XmlDataSource2.XPath = "listadonos/ownerprop[@nif='" + nif + "']";
            remover.Visible = true;
        }

        protected void remover_Click(object sender, EventArgs e)
        {
            String nif = Request["nif"];

            XmlDocument xdoc = XmlDataSource3.GetXmlDocument();

            XmlElement dono = xdoc.SelectSingleNode("properties/property/owner[@nif='" + nif + "']") as XmlElement;

            while (dono != null)
            {
                XmlElement prop = dono.ParentNode as XmlElement;

                prop.RemoveChild(dono);

                XmlDataSource3.Save();

                dono = xdoc.SelectSingleNode("properties/property/owner[@nif='" + nif + "']") as XmlElement;
            }
            Response.Redirect("Owners.aspx");
        }

        protected void FormView1_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            String nif = Request["nif"];
            XmlDocument xdoc = XmlDataSource3.GetXmlDocument();

            string script = "<script language=\"javascript\">\n" + "alert (\"Preencha todos os campos\");\n" + "</script>";
            if (e.NewValues["fname"].ToString().Length == 0 || e.NewValues["lname"].ToString().Length == 0 || e.NewValues["pdate"].ToString().Length == 0)
            {
                ClientScript.RegisterStartupScript(script.GetType(), "Error", script);
                e.Cancel = true;
            }
            else
            {
                //verificar se data e valida
                DateTime data;
                if (!DateTime.TryParse(e.NewValues["pdate"].ToString(), out data))
                {
                    script = "<script language=\"javascript\">\n" + "alert (\"O campo data tem de ser válido\");\n" + "</script>";
                    ClientScript.RegisterStartupScript(script.GetType(), "Error", script);
                    e.Cancel = true;
                }
                else
                {
                    XmlElement dono_inicial = xdoc.SelectSingleNode("properties/property/owner[@nif='" + e.OldValues["nif"].ToString() + "' and @fname='" + e.OldValues["fname"] + "' and @lname='" + e.OldValues["lname"] + "' and @pdate='" + e.OldValues["pdate"] + "']") as XmlElement;

                    while (dono_inicial != null)
                    {
                        dono_inicial.Attributes["fname"].Value = e.NewValues["fname"].ToString();
                        dono_inicial.Attributes["lname"].Value = e.NewValues["lname"].ToString();
                        dono_inicial.Attributes["pdate"].Value = e.NewValues["pdate"].ToString();

                        XmlDataSource3.Save();

                        dono_inicial = xdoc.SelectSingleNode("properties/property/owner[@nif='" + e.OldValues["nif"].ToString() + "' and @fname='" + e.OldValues["fname"] + "' and @lname='" + e.OldValues["lname"] + "' and @pdate='" + e.OldValues["pdate"] + "']") as XmlElement;
                    }
                    e.Cancel = true;
                    FormView1.ChangeMode(FormViewMode.ReadOnly);
                    Response.Redirect("prop_por_dono.aspx?nif=" + nif + "");
                }
            }
        }
    }
}
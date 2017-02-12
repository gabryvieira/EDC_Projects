using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace EDC2015_Trabalho2Parte2
{
    public partial class remove_prop : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String id = Request["id"];
            XmlDataSource1.XPath = "listadonos/ownerprop[not(@id=preceding::ownerprop/@id) and (@id='" + id + "')]";
            XmlDataSource2.XPath = "listadonos/ownerprop[@id='" + id + "']";
            remover.Visible = true;
        }

        protected void remover_Click(object sender, EventArgs e)
        {
            String id = Request["id"];

            XmlDocument xdoc = XmlDataSource3.GetXmlDocument();

            XmlElement dono = xdoc.SelectSingleNode("properties/property[@id='" + id + "']") as XmlElement;

            while (dono != null)
            {
                XmlElement prop = dono.ParentNode as XmlElement;

                prop.RemoveChild(dono);

                XmlDataSource3.Save();

                dono = xdoc.SelectSingleNode("properties/property[@id='" + id + "']") as XmlElement;
            }
            Response.Redirect("propriedades.aspx");
        }

        protected void FormView1_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            String id = Request["id"];
            XmlDocument xdoc = XmlDataSource3.GetXmlDocument();

            string script = "<script language=\"javascript\">\n" + "alert (\"Preencha todos os campos\");\n" + "</script>";
            if (e.NewValues["id"].ToString().Length == 0 || e.NewValues["city"].ToString().Length == 0 || e.NewValues["Street"].ToString().Length == 0 || e.NewValues["pnumber"].ToString().Length == 0 || e.NewValues["value"].ToString().Length == 0)
            {
                ClientScript.RegisterStartupScript(script.GetType(), "Error", script);
                e.Cancel = true;
            }
            else
            {
                XmlElement dono_inicial = xdoc.SelectSingleNode("properties/property[@id='" + e.OldValues["id"].ToString() + "' and @city='" + e.OldValues["city"] + "' and @Street='" + e.OldValues["Street"] + "' and @pnumber='" + e.OldValues["pnumber"] + "' and @value='" + e.OldValues["value"] + "']") as XmlElement;

                    while (dono_inicial != null)
                    {
                        dono_inicial.Attributes["id"].Value = e.NewValues["id"].ToString();
                        dono_inicial.Attributes["city"].Value = e.NewValues["city"].ToString();
                        dono_inicial.Attributes["Street"].Value = e.NewValues["Street"].ToString();
                        dono_inicial.Attributes["pnumber"].Value = e.NewValues["pnumber"].ToString();
                        dono_inicial.Attributes["value"].Value = e.NewValues["value"].ToString();

                        XmlDataSource3.Save();

                        dono_inicial = xdoc.SelectSingleNode("properties/property[@id='" + e.OldValues["id"].ToString() + "' and @id='" + e.OldValues["id"] + "' and @city='" + e.OldValues["city"] + "' and @Street='" + e.OldValues["Street"] + "'and @pnumber='" + e.OldValues["pnumber"] + "'and @value='" + e.OldValues["value"] + "']") as XmlElement;
                    }
                    e.Cancel = true;
                    FormView1.ChangeMode(FormViewMode.ReadOnly);
                    Response.Redirect("remove_prop.aspx?id=" + id + "");
                
            }
        }
    }
}
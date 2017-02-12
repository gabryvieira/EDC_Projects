using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace EDC2015_Trabalho2Parte2
{
    public partial class add_owner : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            XmlDataSource3.XPath = "properties/property[@id='" + DropDownList1.SelectedValue + "']";
            GridView1.Visible = true;

        }

        protected void DropDownList1_DataBound(object sender, EventArgs e)
        {
            XmlDataSource3.XPath = "//property[@id='" + DropDownList1.SelectedValue + "']";
        }

        protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            //verificar se os campos estao todos preenchidos
            DateTime datavelha = DateTime.Now;
            string script = "<script language=\"javascript\">\n" + "alert (\"Preencha todos os campos\");\n" + "</script>";
            if (e.Values["nif"].ToString().Length == 0 || e.Values["fname"].ToString().Length == 0 || e.Values["lname"].ToString().Length == 0 || e.Values["pdate"].ToString().Length == 0)
            {
                ClientScript.RegisterStartupScript(script.GetType(), "Error", script);
                e.Cancel = true;
            }
            else
            {

                //verificar se o nif foi corretamente preenchido
                UInt32 n;
                if (UInt32.TryParse(e.Values["nif"].ToString(), out n) && e.Values["nif"].ToString().Length == 9)
                {
                    //verificar se a data e valida
                    DateTime d;
                    if (DateTime.TryParse(e.Values["pdate"].ToString(), out d))
                    {
                        XmlDocument xdoc = XmlDataSource2.GetXmlDocument();
                        //verificar se a propriedade selecionada ja possui dono
                        XmlElement propSelecionada = xdoc.SelectSingleNode("properties/property[@id='" + DropDownList1.SelectedValue + "']") as XmlElement;
                        XmlElement dono = propSelecionada.SelectSingleNode("owner") as XmlElement;
                        if (dono == null)
                        {
                            dono = xdoc.CreateElement("owner");

                            XmlAttribute nif = xdoc.CreateAttribute("nif");
                            XmlAttribute fname = xdoc.CreateAttribute("fname");
                            XmlAttribute lname = xdoc.CreateAttribute("lname");
                            XmlAttribute pdate = xdoc.CreateAttribute("pdate");

                            nif.Value = e.Values["nif"].ToString();
                            fname.Value = e.Values["fname"].ToString();
                            lname.Value = e.Values["lname"].ToString();
                            pdate.Value = e.Values["pdate"].ToString();

                            dono.Attributes.Append(nif);
                            dono.Attributes.Append(fname);
                            dono.Attributes.Append(lname);
                            dono.Attributes.Append(pdate);

                            propSelecionada.AppendChild(dono);

                            XmlDataSource2.Save();
                            e.Cancel = true;

                            script = "<script language=\"javascript\">\n" + "alert (\"Criação de dono bem sucedida!\");\n" + "</script>";
                            ClientScript.RegisterStartupScript(script.GetType(), "Success", script);

                            Response.Redirect("Owners.aspx");
                        }
                        else
                        {
                            datavelha = Convert.ToDateTime(dono.GetAttribute("pdate").ToString());


                            if (datavelha < d)
                            {
                                dono.RemoveAllAttributes();
                                XmlAttribute nif = xdoc.CreateAttribute("nif");
                                XmlAttribute fname = xdoc.CreateAttribute("fname");
                                XmlAttribute lname = xdoc.CreateAttribute("lname");
                                XmlAttribute pdate = xdoc.CreateAttribute("pdate");

                                nif.Value = e.Values["nif"].ToString();
                                fname.Value = e.Values["fname"].ToString();
                                lname.Value = e.Values["lname"].ToString();
                                pdate.Value = e.Values["pdate"].ToString();

                                dono.Attributes.Append(nif);
                                dono.Attributes.Append(fname);
                                dono.Attributes.Append(lname);
                                dono.Attributes.Append(pdate);

                                propSelecionada.AppendChild(dono);
                                XmlDataSource2.Save();
                                e.Cancel = true;

                                script = "<script language=\"javascript\">\n" + "alert (\"Alteração de dono bem sucedida!\");\n" + "</script>";
                                ClientScript.RegisterStartupScript(script.GetType(), "Success", script);

                                Response.Redirect("propriedades.aspx");
                            }
                            else
                            {
                                script = "<script language=\"javascript\">\n" + "alert (\"a data de compra nao pode ser mais antiga que a do dono anterior\");\n" + "</script>";
                                ClientScript.RegisterStartupScript(script.GetType(), "Error", script);
                                e.Cancel = true;
                            }

                        }



                    }
                    else
                    {
                        script = "<script language=\"javascript\">\n" + "alert (\"a data não é válida\");\n" + "</script>";
                        ClientScript.RegisterStartupScript(script.GetType(), "Error", script);
                        e.Cancel = true;
                    }
                }
                else
                {
                    script = "<script language=\"javascript\">\n" + "alert (\"O nif nao foi bem preenchido\");\n" + "</script>";
                    ClientScript.RegisterStartupScript(script.GetType(), "Error", script);
                    e.Cancel = true;
                }
            }
        }
    }
}
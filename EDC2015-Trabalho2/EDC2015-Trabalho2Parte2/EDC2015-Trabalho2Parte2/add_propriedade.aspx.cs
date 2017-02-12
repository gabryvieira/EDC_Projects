using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace EDC2015_Trabalho2Parte2
{
    public partial class add_propriedade : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
           
            XmlDocument xdoc= XmlDataSource1.GetXmlDocument();

            XmlElement aProperty = xdoc.CreateElement("property");
            XmlAttribute theID= xdoc.CreateAttribute("id");
            XmlAttribute theCity = xdoc.CreateAttribute("city");
            XmlAttribute theStreet= xdoc.CreateAttribute("Street");
            XmlAttribute thePnumber = xdoc.CreateAttribute("pnumber");
            XmlAttribute theValue = xdoc.CreateAttribute("value");
            
            theID.Value= e.Values["id"].ToString();
            theCity.Value= e.Values["city"].ToString();
            theStreet.Value= e.Values["Street"].ToString();
            thePnumber.Value = e.Values["pnumber"].ToString();
            theValue.Value = e.Values["value"].ToString();

            aProperty.Attributes.Append(theID);
            aProperty.Attributes.Append(theCity);
            aProperty.Attributes.Append(theStreet);
            aProperty.Attributes.Append(thePnumber);
            aProperty.Attributes.Append(theValue);

            xdoc.DocumentElement.AppendChild(aProperty);
            XmlDataSource1.Save();
            e.Cancel = true;
            //---mostra o último elemento criado
            FormView1.PageIndex = xdoc.DocumentElement.ChildNodes.Count-1;
            FormView1.ChangeMode(FormViewMode.ReadOnly);
            Response.Redirect("propriedades.aspx");
        }
        protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {

        }       
    }
}
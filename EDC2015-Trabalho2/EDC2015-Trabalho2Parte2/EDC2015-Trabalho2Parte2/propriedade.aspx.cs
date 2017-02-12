using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EDC2015_Trabalho2Parte2
{
    public partial class propriedade : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            XmlDataSource1.XPath = "properties/property[@city='" + DropDownList1.SelectedValue + "']";
        }

        protected void DropDownList1_DataBound(object sender, EventArgs e)
        {
            XmlDataSource1.XPath = "properties/property[@city='" + DropDownList1.SelectedValue + "']";

        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            decimal total = 0;

            foreach (GridViewRow row in GridView1.Rows)
            {
                total += Convert.ToDecimal(row.Cells[4].Text);
            }
            Literal1.Text = String.Format("{0:N0}", total);

            // -------------------------------------------------------------
        }
    }
}
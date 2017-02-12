using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EDC2015_Trabalho1
{
    public partial class titles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void rpt1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

            string[] itens = e.CommandArgument.ToString().Split(',');

            string title = itens[0].ToString();
            string link = itens[1].ToString();// Scrub user data
            string descricao = itens[2].ToString();
            string categoria = itens[3].ToString();
            string pubDate = itens[4].ToString();

            string sc = @"Data Source=(LocalDb)\v11.0;AttachDbFilename=|DataDirectory|\aspnet-EDC2015-Trabalho1-20150923093014.mdf;Initial Catalog=aspnet-EDC2015-Trabalho1-20150923093014;Integrated Security=True";

            SqlConnection connection = new SqlConnection(sc);
            connection.Open();



            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.Connection = connection;
                cmd.CommandType = System.Data.CommandType.Text;
                cmd.CommandText = "DELETE FROM [favoritesList] WHERE title = @title";

                int rowsAffected = cmd.ExecuteNonQuery();

                if (rowsAffected == 1)
                {
                    //Success notification
                    //label1.Text = "Bem miudo!";
                }
                else
                {
                    //label1.Text = "nada!";
                }
            }




        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
          //  Label1.Text = DropDownList1.SelectedItem.Text;
         //isto funciona //  SqlDataSource4.SelectCommand = "SELECT * FROM [favoritesList] where categoria='Desporto'";
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        //protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //        e.Row.Attributes["onmouseover"] = "this.style.cursor='hand';this.style.textDecoration='underline';";
        //        e.Row.Attributes["onmouseout"] = "this.style.textDecoration='none';";

        //        e.Row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(this.GridView1, "Select$" + e.Row.RowIndex);
        //    }
        //}
    }
}
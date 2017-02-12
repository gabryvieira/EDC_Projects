using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Xml;

namespace EDC2015_Trabalho1
{
    public partial class Default1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void rpt1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

            string itens = e.CommandArgument.ToString();

            string category = itens.ToString();
           
         
            string sc = @"Data Source=(LocalDb)\v11.0;AttachDbFilename=|DataDirectory|\aspnet-EDC2015-Trabalho1-20150923093014.mdf;Initial Catalog=aspnet-EDC2015-Trabalho1-20150923093014;Integrated Security=True";

            SqlConnection connection = new SqlConnection(sc);
            connection.Open();



            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.Connection = connection;
                cmd.CommandType = System.Data.CommandType.Text;
                cmd.CommandText = "INSERT INTO favoritesCategory(category) Values (@category)";
                cmd.Parameters.AddWithValue("@category", category);

                System.Diagnostics.Debug.WriteLine(category);
          
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


            Response.Redirect("Favorites.aspx");


        }

      
    }
}
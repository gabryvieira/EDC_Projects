using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace EDC2015_Trabalho1.Categories
{
    public partial class SaudeNews : System.Web.UI.Page
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
                cmd.CommandText = "INSERT INTO favoritesList(title,link,descricao,categoria,pubDate) Values (@title,@link, @description, @categoria, @pubDate)";
                cmd.Parameters.AddWithValue("@title", title);
                cmd.Parameters.AddWithValue("@link", link);
                cmd.Parameters.AddWithValue("@description", descricao);
                cmd.Parameters.AddWithValue("@categoria", categoria);
                cmd.Parameters.AddWithValue("@pubDate", pubDate);

                System.Diagnostics.Debug.WriteLine(title);
                System.Diagnostics.Debug.WriteLine(link);
                System.Diagnostics.Debug.WriteLine(descricao);
                System.Diagnostics.Debug.WriteLine(categoria);
                System.Diagnostics.Debug.WriteLine(pubDate);
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
    }
}
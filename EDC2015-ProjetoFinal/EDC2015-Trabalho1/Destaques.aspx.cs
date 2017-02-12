using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.IO;
using System.Data.SqlClient;

namespace WebApplication3
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            
        }

        protected void addfavoritenew(object sender, EventArgs e)
        {
            //var cnnString = @"Data Source=(LocalDb)\v11.0;AttachDbFilename=D:\Documentos\Dropbox\UNIVERSIDADE\4Ano\4AnoMeu\EDC\TrabalhosEDC  Tomas&Gabriel\EDC2015-ProjetoFinal\EDC2015-Trabalho1\App_Data\aspnet-EDC2015-Trabalho1-20150923093014.mdf;Initial Catalog=aspnet-EDC2015-Trabalho1-20150923093014;Integrated Security=True";
            //var cmd = "insert into favoritesList values(@title,@link,@descricao,@pubdate,@id_userfav)";
            //using (SqlConnection cnn = new SqlConnection(cnnString))
            //{
            //    using (SqlCommand cm = new SqlCommand(cmd, cnn))
            //    {
            //        cm.Parameters.AddWithValue("@title", txttitle.Text);
            //        cm.Parameters.AddWithValue("@link", txtlink.Text);
            //        cm.Parameters.AddWithValue("@descricao", txtdescricao.Text);
            //        cm.Parameters.AddWithValue("@pubdate", txtpubdate.Text);
            //        cm.Parameters.AddWithValue("@id_userfav", txtid_userfav.Text);

            //        cnn.Open();
            //        cm.ExecuteNonQuery();

            //       ver isto usar XMLdocument 1º pa sacar os valores logo de la
            //    }
            //}
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
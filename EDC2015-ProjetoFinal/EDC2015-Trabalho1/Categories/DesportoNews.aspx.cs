using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Xml;
using System.Data;
using System.Web.Security;

namespace EDC2015_Trabalho1
{
    public partial class DesportoNews : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }


         protected void button_Click(object sender, EventArgs e)
         {

             /* string source = @"Data Source=(LocalDb)\v11.0;AttachDbFilename=D:\Documentos\Dropbox\UNIVERSIDADE\4Ano\4AnoMeu\EDC\TrabalhosEDC  Tomas&Gabriel\EDC2015-ProjetoFinal\EDC2015-Trabalho1\App_Data\aspnet-EDC2015-Trabalho1-20150923093014.mdf;Initial Catalog=aspnet-EDC2015-Trabalho1-20150923093014;Integrated Security=True";
              SqlConnection connection = new SqlConnection(source);
              //SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["NorthwindConnectionString"].ToString());
              connection.Open();

            
              XmlDataSource1.XPath = "/channel";
              XmlDocument xdoc = XmlDataSource1.GetXmlDocument();
              XmlNodeList noticias = xdoc.SelectNodes("//item");
              //XmlDataSource1.XPath = "/channel";

              ´//XmlDocument xdoc2 = XmlDataSource1.GetXmlDocument();
              //XmlNodeList noticias = xdoc2.SelectNodes("//movie");
               //using (SqlCommand command = new SqlCommand("INSERT INTO [favoritesList] ([title], [link], [descricao], [categoria], [pubDate], [id_userfav]) VALUES (@title, @link, @description, @categoria, @pubDate, @Id)", connection))
                 // using (SqlDataReader reader = command.ExecuteReader())
    

              foreach (XmlNode i in noticias)
              {
                 SqlCommand command = new SqlCommand("INSERT INTO [favoritesList] ([@title], [@link], [@descricao], [@categoria], [@pubDate], [@id_userfav]) VALUES (title, link, description, category, pubDate, Id)", connection);
                 SqlDataReader reader = command.ExecuteReader();
              }
                    
              connection.Close();

              */

             /*try
             {
                 XmlDataSource1.XPath = "/channel";
                 XmlDocument xdoc = XmlDataSource1.GetXmlDocument();
                 XmlNodeList noticias = xdoc.SelectNodes("//item");

                 //XmlDocument xdoc2 = XmlDataSource1.GetXmlDocument();
                 //XmlNodeList noticias = xdoc2.SelectNodes("//movie");
                 //using (SqlCommand command = new SqlCommand("INSERT INTO [favoritesList] ([title], [link], [descricao], [categoria], [pubDate], [id_userfav]) VALUES (@title, @link, @description, @categoria, @pubDate, @Id)", connection))
                 // using (SqlDataReader reader = command.ExecuteReader())


                 foreach (XmlNode i in noticias)
                 {
                     SqlCommand command = new SqlCommand("INSERT INTO [favoritesList] ([@title], [@link], [@descricao], [@categoria], [@pubDate], [@id_userfav]) VALUES (title, link, description, category, pubDate, Id)", connection);
                     SqlDataReader reader = command.ExecuteReader();
                 }

                 connection.Close();*/

          


             //LinkButton lnk = (LinkButton)sender;
             //DataListItem item = lnk.NamingContainer as DataListItem;
             //HiddenField hf = item.FindControl("Guid") as HiddenField;
             //  if (!(String.IsNullOrEmpty(User.Identity.Name)))
             // {
             //    try
             //    {
             //        SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString.ToString());

             //        SqlCommand cmdsql = conn.CreateCommand();
             //        string title = "ola";

             //        //String strQuery = "SELECT COUNT(*) FROM AspNetUser WHERE UserId = @ID AND ItemId = @ID";
             //        //cmdsql.CommandType = CommandType.Text;
             //        //cmdsql.CommandText = strQuery;
             //        cmdsql.CommandText = "Insert INTO favoritesList (id_userfav, title) values(@ID,@title)";
             //        cmdsql.Connection = conn;

             //        conn.Open();
             //        cmdsql.Parameters.AddWithValue("@ID", Membership.GetUser(User.Identity.Name).ProviderUserKey.ToString());
             //        cmdsql.Parameters.AddWithValue("@title", title);

             //          //  cmdsql.CommandText = "DELETE FROM Saved WHERE UserId = @UserId AND ItemId = @ItemId";
             //           // cmdsql.ExecuteNonQuery();
             //            //lnk.Text = "Guardar";


             //            cmdsql.ExecuteNonQuery();
             //           // lnk.Text = "Guardado";

             //    }
             //    catch(Exception Ex)
             //    {
             //     //   lnk.Text = Ex.Message;
             //    }

             //}
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
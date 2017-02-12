using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EDC2015_Trabalho1.Categories
{
    public partial class EconomiaNews : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //foreach (RepeaterItem item in Repeater1.Items)
            //{
             //   TextBox textbox1 = (TextBox)item.FindControl("title");
              //  textbox1.Text = item.FindControl("title").ToString();
                //Now you have your textbox to do with what you like
                //You can access the .Text property to find the new value that needs saving to the database

            //}
        }

        protected void Upvote_Click(object sender, ImageClickEventArgs e)
        {
            
            //tentativa3
            //string source = @"Data Source=(LocalDb)\v11.0;AttachDbFilename=|DataDirectory|\aspnet-EDC2015-Trabalho1-20150923093014.mdf;Initial Catalog=aspnet-EDC2015-Trabalho1-20150923093014;Integrated Security=True";
            //SqlConnection conn = new SqlConnection(source);
            //try
            //{
              
            //    foreach (RepeaterItem item in Repeater1.Items)
            //    {
            //        TextBox textbox1 = (TextBox)item.FindControl("title");
            //        //TextBox Amountbox = ((TextBox)e.Item.FindControl("txtAmount"));
            //        //Label EID = (Label)e.Item.FindControl("title");
            //        string strUpdate = "Insert INTO favoritesList (title) values(@title)";
            //        SqlCommand SqlCmd = new SqlCommand(strUpdate, conn);
            //        SqlCmd.Parameters.Add(new SqlParameter("@title", textbox1.Text));
            //        //SqlCmd.Parameters.Add(new SqlParameter("@title", EID.Text));
            //        if (conn.State == ConnectionState.Closed)
            //            conn.Open();
            //        SqlCmd.ExecuteNonQuery();
            //        Repeater1.DataBind();
            //    }
            //}
            
            //finally
            //{
            //    if (conn.State == ConnectionState.Open)
            //        conn.Close();
            //    conn.Dispose();
            //}

            
            
            
            //tentativa2
            //foreach (RepeaterItem item in Repeater1.Items)
            //{
            //        TextBox textbox1 = (TextBox)item.FindControl("title");
            //        textbox1.Text = item.FindControl("title").ToString();
            //        //Now you have your textbox to do with what you like
            //        //You can access the .Text property to find the new value that needs saving to the database
                
            //}

            //tentativa1
            //ImageButton lnk = (ImageButton)sender;
            //RepeaterItem item = lnk.NamingContainer as RepeaterItem;
            //HiddenField hf = item.FindControl("title") as HiddenField;

            //SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString.ToString());

            //SqlCommand cmdsql = conn.CreateCommand();

            //String strQuery = "Insert INTO favoritesList (title) values(@title)";
            //cmdsql.CommandType = CommandType.Text;
            //cmdsql.Connection = conn;
            //cmdsql.CommandText = strQuery;
            //conn.Open();
            ////cmdsql.Parameters.AddWithValue("@UserId", Membership.GetUser(User.Identity.Name).ProviderUserKey.ToString());
            //cmdsql.Parameters.AddWithValue("@title", hf.Value.ToString());
            //textbox1.Text = hf.Value.ToString();
            //cmdsql.ExecuteNonQuery();

            //Response.Redirect(Request.RawUrl);
            
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
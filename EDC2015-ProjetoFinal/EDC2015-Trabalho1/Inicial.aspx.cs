using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.IO;
using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //isto funciona
            //string source = @"Data Source=(LocalDb)\v11.0;AttachDbFilename=|DataDirectory|\aspnet-EDC2015-Trabalho1-20150923093014.mdf;Initial Catalog=aspnet-EDC2015-Trabalho1-20150923093014;Integrated Security=True";

            
            //SqlConnection conn = new SqlConnection(source);
            //try
            //{
            //    conn.Open();

            //    using (SqlCommand command = new SqlCommand("SELECT Email FROM AspNetUsers", conn))
            //    using (SqlDataReader reader = command.ExecuteReader())
            //    {
            //        while (reader.Read())
            //        {
            //            TextBox1.Text = reader.GetString(0);
            //            if(TextBox1.Text.Equals("test@hotmail.com"))
            //            {
            //                TextBox1.Text = "entrei!";
            //                break;
            //            }

            //        }
            //    }
                
            //}
            //catch (SqlException ex)
            //{
            //    TextBox1.Visible = true;
            //    TextBox1.Text = "Failed to connect to BD!"+ex.Message;
            //}
            //conn.Close();
        }
       
    }
}
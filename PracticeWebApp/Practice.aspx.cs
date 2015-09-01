using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace PracticeWebApp
{
    public partial class Practice : System.Web.UI.Page
    {
        //Required Connection string to connect to DB:
        private string conString = WebConfigurationManager.ConnectionStrings["DataConnectionString1"].ConnectionString;

        //Check if username and pass exist in the DB:
        private bool ValidateLogIn(string user, string pass)
        {
            bool result = false;
            using (SqlConnection conn = new SqlConnection(conString))
            {
                //Fetch data by checking passing UserName and Password entered (using SQL):
                SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Users WHERE UserName LIKE @user AND Password LIKE @pass", conn);

                //Open the connection:
                conn.Open();
                cmd.Parameters.AddWithValue("@user", user);
                cmd.Parameters.AddWithValue("@pass", pass);

                //Executes the query string:
                SqlDataReader readDB = cmd.ExecuteReader();
                try
                {
                    while (readDB.Read())
                    {
                        //If COUNT(*) comes back as 0 then record doesn't exist!
                        if (Convert.ToInt32(readDB[0]) <= 0)
                        {
                            result = false;
                        }
                        //Else it exists!
                        else
                        {
                            result = true;
                        }
                    }
                }
                //Always close reader:
                finally
                {
                    readDB.Close();
                }
            }

            return result;

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            string userName = Login1.UserName;
            string pass = Login1.Password;
            bool validLogin = ValidateLogIn(userName, pass);

            if (validLogin)
            {
                e.Authenticated = true;
                Response.Cookies["userName"].Value = userName;
                Response.Cookies["userName"].Expires = DateTime.Now.AddMinutes(15);
            }
            else
            {
                e.Authenticated = false;
            }
        }
    }
}
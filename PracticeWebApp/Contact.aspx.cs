using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PracticeWebApp
{
    public partial class Contact : System.Web.UI.Page
    {
        private string conString = WebConfigurationManager.ConnectionStrings["DataConnectionString1"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnClearContact_Click(object sender, EventArgs e)
        {
            txtContactName.Text = "";
            txtContactEmail.Text = "";
            txtContactMsg.Text = "";
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {

            string name = txtContactName.Text;
            string email = txtContactEmail.Text;
            string msg = txtContactMsg.Text;

            using (SqlConnection conn = new SqlConnection(conString))
            {
                //Fetch data by checking passing UserName and Password entered (using SQL):
                SqlCommand insertDetails = new SqlCommand("INSERT INTO ContactMessages(Name, Email, Message) VALUES (@name, @email, @message)", conn);

                //Open the connection:
                conn.Open();
                insertDetails.Parameters.AddWithValue("@name", name);
                insertDetails.Parameters.AddWithValue("@email", email);
                insertDetails.Parameters.AddWithValue("@message", msg);

                if (insertDetails.ExecuteNonQuery() != 0)
                {
                    txtContactEmail.Text = "";
                    txtContactMsg.Text = "";
                    txtContactName.Text = "";
                    lblThankYou.Text = "Thank you for your message!";
                }
                else
                {
                    lblThankYou.Text = "ERROR INSERTING!";
                }

                conn.Close();
            } 
        }
    }
}
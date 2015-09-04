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
    public partial class ForgotPass : System.Web.UI.Page
    {
        private string conString = WebConfigurationManager.ConnectionStrings["DataConnectionString1"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCancelRetrieval_Click(object sender, EventArgs e)
        {
            Response.Redirect("Practice.aspx");
        }

        protected void btnCancelPassChange_Click(object sender, EventArgs e)
        {
            Response.Redirect("Practice.aspx");
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (dataExists(txtForgotUser.Text, txtForgotEmail.Text))
            {
                //Enable change password input fields:
                lblValidInput.Text = "User name and email combination exists!";
                lblValidInput.ForeColor = System.Drawing.Color.Green;
                lblChangePass.Visible = true;
                txtNewPass.Visible = true;
                txtConfirmNewPass.Visible = true;
                btnChangePassword.Visible = true;
                btnCancelPassChange.Visible = true;

                //Disable top form!
                txtForgotUser.Enabled = false;
                txtForgotEmail.Enabled = false;
                btnCancelRetrieval.Visible = false;
                btnSubmit.Visible = false;
            }
            else
            {
                lblValidInput.Text = "User name and email combination doesn't exist!";
                lblValidInput.ForeColor = System.Drawing.Color.Red;
            }
        }

        private bool dataExists(string user, string email)
        {
            bool result = false;
            using (SqlConnection conn = new SqlConnection(conString))
            {
                //Fetch data by checking passing UserName and Password entered (using SQL):
                SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Users WHERE UserName LIKE @user AND Email LIKE @email", conn);

                //Open the connection:
                conn.Open();
                cmd.Parameters.AddWithValue("@user", user);
                cmd.Parameters.AddWithValue("@email", email);

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
                //Always close reader and database:
                finally
                {
                    readDB.Close();
                    conn.Close();
                }
            }
            return result;
        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            bool validatePassword = txtNewPass.Text == txtConfirmNewPass.Text;
            string user = txtForgotUser.Text;
            string email = txtForgotEmail.Text;
            string newPass = txtNewPass.Text;

            if (validatePassword)
            {
                using (SqlConnection conn = new SqlConnection(conString))
                {
                    //Update password:
                    SqlCommand updatePass = new SqlCommand("UPDATE Users SET Password = @newPass WHERE UserName LIKE @user AND Email LIKE @email ", conn);

                    //Open the connection:
                    conn.Open();
                    updatePass.Parameters.AddWithValue("@newPass", newPass);
                    updatePass.Parameters.AddWithValue("@user", user);
                    updatePass.Parameters.AddWithValue("@email", email);

                    if (updatePass.ExecuteNonQuery() != 0)
                    {
                        //Disable change password fields:
                        txtNewPass.Enabled = false;
                        txtConfirmNewPass.Enabled = false;
                        btnCancelPassChange.Visible = false;
                        btnChangePassword.Visible = false;
                        lblValidInput.Text = "Successfully changed your password! Redirecting to home page in 5 seconds.";
                        lblValidInput.ForeColor = System.Drawing.Color.Green;
                        Response.AddHeader("REFRESH", "5;URL=Practice.aspx");
                    }
                    else
                    {
                        //If there's an error in the database:
                        lblValidInput.Text = "ERROR UPDATING PASSWORD IN THE DATABASE!";
                        lblValidInput.ForeColor = System.Drawing.Color.Red;
                    }

                    conn.Close();
                }
            }
            else
            {
                lblValidInput.Text = "Passwords do not match!";
                lblValidInput.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}
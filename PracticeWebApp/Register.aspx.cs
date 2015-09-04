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
    public partial class Register : System.Web.UI.Page
    {
        private string conString = WebConfigurationManager.ConnectionStrings["DataConnectionString1"].ConnectionString;
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCancelReg_Click(object sender, EventArgs e)
        {
            txtFName.Text = "";
            txtLName.Text = "";
            txtEmail.Text = "";
            txtConfirmEmail.Text = "";
            txtRegUserName.Text = "";
            txtRegPassword.Text = "";
            txtConfirmPass.Text = "";

            Response.Redirect("Practice.aspx");
        }

        protected bool checkUserName(string user)
        {
            bool result = false;
            using (SqlConnection conn = new SqlConnection(conString))
            {
                //Fetch data by checking passing UserName and Password entered (using SQL):
                SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Users WHERE UserName LIKE @user", conn);

                //Open the connection:
                conn.Open();
                cmd.Parameters.AddWithValue("@user", user);

                //Executes the query string:
                SqlDataReader readDB = cmd.ExecuteReader();
                try
                {
                    while (readDB.Read())
                    {
                        //If COUNT(*) comes back as 0 then record doesn't exist!
                        if (Convert.ToInt32(readDB[0]) <= 0)
                        {
                            result = true;
                        }
                        //Else it exists!
                        else
                        {
                            result = false;
                        }
                    }
                }
                //Always close reader:
                finally
                {
                    readDB.Close();
                    conn.Close();
                }
            }

            return result;
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            bool availableUser = false;
            string userName = txtRegUserName.Text;
            if (userName.Trim().Length != 0)
            {
                availableUser = checkUserName(userName);
            }
            else
            {
                availableUser = false;
            }

            if(availableUser == false)
            {
                lblAvailable.Text = "User name is NOT available!";
                lblAvailable.ForeColor = System.Drawing.Color.Red;
            }

            if (validateRegForm() && availableUser)
            {
                registerUser();
                Response.AddHeader("REFRESH", "5;URL=Practice.aspx");

            }
            else
            {
                lblRegError.Text = "Please correct the errors in the form";
            }
        }

        private bool validateRegForm()
        {
            bool result;

            if (txtConfirmPass.Text != txtRegPassword.Text)
            {
                txtConfirmPass.ForeColor = System.Drawing.Color.Red;
                txtRegPassword.ForeColor = System.Drawing.Color.Red;
                result = false;
            }
            if (txtConfirmEmail.Text != txtEmail.Text)
            {
                txtConfirmEmail.ForeColor = System.Drawing.Color.Red;
                txtEmail.ForeColor = System.Drawing.Color.Red;
                result = false;
            }
            else
            {
                txtConfirmEmail.ForeColor = System.Drawing.Color.Black;
                txtEmail.ForeColor = System.Drawing.Color.Black;
                txtConfirmPass.ForeColor = System.Drawing.Color.Black;
                txtRegPassword.ForeColor = System.Drawing.Color.Black;
                result = true;
            }

            return result;
        }

        private void registerUser()
        {
            string fullName = txtFName.Text + " " + txtLName.Text;
            string email = txtEmail.Text;
            string userName = txtRegUserName.Text;
            string password = txtRegPassword.Text;
            string userID = "";

            using (SqlConnection conn = new SqlConnection(conString))
            {
                //Insert user details to Users:
                SqlCommand regUser = new SqlCommand("INSERT INTO Users(UserName, Password, FullName, Email) VALUES (@user, @pass, @fullName, @email)", conn);

                //Retrieve new userID:
                SqlCommand getUserID = new SqlCommand("SELECT UserID FROM Users WHERE UserName LIKE @userName", conn);

                //Insert userID to Accounts to create a new account:
                SqlCommand regAccount = new SqlCommand("INSERT INTO Accounts (UserID) VALUES (@userID)", conn);

                //Open the connection:
                conn.Open();
                regUser.Parameters.AddWithValue("@user", userName);
                regUser.Parameters.AddWithValue("@pass", password);
                regUser.Parameters.AddWithValue("@fullName", fullName);
                regUser.Parameters.AddWithValue("@email", email);

                //Inserting user data to Users Table:
                if (regUser.ExecuteNonQuery() != 0)
                {
                    txtFName.Text = "";
                    txtLName.Text = "";
                    txtEmail.Text = "";
                    txtConfirmEmail.Text = "";
                    txtRegUserName.Text = "";
                }
                else
                {
                    lblRegError.Text = "ERROR DURING REGISTRATION!";
                    lblRegError.ForeColor = System.Drawing.Color.Red;
                }

                //Getting UserID from Users:
                getUserID.Parameters.AddWithValue("@userName", userName);

                SqlDataReader readDB = getUserID.ExecuteReader();
                try
                {
                    while (readDB.Read())
                    {
                        userID = Convert.ToString(readDB[0]);
                    }
                }
                finally
                {
                    readDB.Close();
                }

                //Creating account:
                regAccount.Parameters.AddWithValue("@userID", userID);
                if (regAccount.ExecuteNonQuery() != 0)
                {
                    lblRegError.Text = "Successfully created your account! Redirecting to Home page in 5 seconds.";
                    lblRegError.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    lblRegError.Text = "ERROR DURING REGISTRATION!";
                    lblRegError.ForeColor = System.Drawing.Color.Red;
                }

                conn.Close();
            } 
        }
    }
}
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
    public partial class Account : System.Web.UI.Page
    {
        private string conString = WebConfigurationManager.ConnectionStrings["DataConnectionString1"].ConnectionString;
        private string userName = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            //Server.HtmlEncode(Request.Cookies["userName"].Value - Retrieves cookie data
            if (Request.Cookies["userName"] != null)
            {
                userName = Server.HtmlEncode(Request.Cookies["userName"].Value);
                txtTransactions.Text = "Date\t\tType\t\tAmount\t\tBalance After\n";
            }
            else
            {
                Response.Redirect("Practice.aspx");
            }

            if (!IsPostBack)
            {
                displayInformation(userName);
                
            }
        }

        protected void displayInformation(string user)
        {

            using (SqlConnection conn = new SqlConnection(conString))
            {
                //Fetch data by checking passing UserName and Password entered (using SQL):
                SqlCommand fetchDetails = new SqlCommand("SELECT AccountID, FullName, TotalBalance, Email FROM Users JOIN Accounts ON Users.UserID = Accounts.UserID WHERE Accounts.UserID = (SELECT UserID FROM Users WHERE UserName LIKE @user)", conn);
                SqlCommand fetchTrans = new SqlCommand("SELECT Date, Type, Amount, BalanceAfter FROM Transactions WHERE AccountID = @accID ORDER BY Date", conn);
                //Open the connection:
                conn.Open();
                fetchDetails.Parameters.AddWithValue("@user", user);

                //Executes the query string:
                SqlDataReader readDB = fetchDetails.ExecuteReader();
                try
                {
                    while (readDB.Read())
                    {
                         
                        fetchTrans.Parameters.AddWithValue("@accID", Convert.ToString(readDB[0]));
                        /*
                        Response.Cookies["fullName"].Value = Convert.ToString(readDB[1]);
                        Response.Cookies["totalBal"].Value = Convert.ToDecimal(readDB[2]).ToString("C2");
                        Response.Cookies["accEmail"].Value = Convert.ToString(readDB[3]).ToString();
                        Response.Cookies["fullName"].Expires = DateTime.Now.AddMinutes(15);
                        Response.Cookies["totalBal"].Expires = DateTime.Now.AddMinutes(15);
                        Response.Cookies["accEmail"].Expires = DateTime.Now.AddMinutes(15);
                        */
                        //Welcome text:
                        lblWelcome.Text = "Welcome " + Convert.ToString(readDB[1]);
                        //TotalBalance text:
                        lblTotalBal.Text = "Total Balance: " + Convert.ToDecimal(readDB[2]).ToString("C2");
                        //Fullname text:
                        txtAccFullName.Text = Convert.ToString(readDB[1]);
                        //Username text:
                        txtAccUserName.Text = user;
                        //Email text:
                        txtAccEmail.Text = Convert.ToString(readDB[3]).ToString();
                    }
                }
                //Always close reader:
                finally
                {
                    readDB.Close();
                }

                //Read transactions:
                readDB = fetchTrans.ExecuteReader();
                try
                {
                    while (readDB.Read())
                    {
                        txtTransactions.Text += Convert.ToDateTime(readDB[0]).ToShortDateString() + "\t" + Convert.ToString(readDB[1]) + "\t\t" + Convert.ToDecimal(readDB[2]).ToString("C2") + "\t\t" + Convert.ToDecimal(readDB[3]).ToString("C2") + "\n";

                    }
                }
                finally
                {
                    readDB.Close();
                }

                conn.Close();
            }
        }

        protected void btnEditProfile_Click(object sender, EventArgs e)
        {
            //Enable editing:
            btnEditCancel.Visible = true;
            btnEditSave.Visible = true;
            btnEditProfile.Enabled = false;

            txtAccPassword.Enabled = true;
            txtAccFullName.Enabled = true;
            txtAccEmail.Enabled = true;
        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            Response.Redirect("Practice.aspx");
        }

        protected void btnEditCancel_Click(object sender, EventArgs e)
        {
            displayInformation(userName);

            btnEditSave.Visible = false;
            btnEditCancel.Visible = false;
            btnEditProfile.Enabled = true;

            txtAccPassword.Enabled = false;
            txtAccFullName.Enabled = false;
            txtAccEmail.Enabled = false;
        }

        protected void btnEditSave_Click(object sender, EventArgs e)
        {
            //Retrieve text from textboxes:
            string newPass = txtAccPassword.Text;
            string name = txtAccFullName.Text;
            string email = txtAccEmail.Text;

            using (SqlConnection conn = new SqlConnection(conString))
            {
                //Update password:
                SqlCommand updatePass = new SqlCommand("UPDATE Users SET Password = @newPass, FullName = @name, Email = @email WHERE UserName LIKE @user", conn);

                //Open the connection:
                conn.Open();
                updatePass.Parameters.AddWithValue("@newPass", newPass);
                updatePass.Parameters.AddWithValue("@name", name);
                updatePass.Parameters.AddWithValue("@email", email);
                updatePass.Parameters.AddWithValue("@user", userName);

                if (updatePass.ExecuteNonQuery() != 0)
                {
                    lblUpdateErr.Text = "";
                }
                else
                {
                    //If there's an error in the database:
                    lblUpdateErr.Text = "ERROR UPDATING DATA IN THE DATABASE!";
                }

                
                conn.Close();
            }

            //redisplay data:
            displayInformation(userName);

            btnEditSave.Visible = false;
            btnEditCancel.Visible = false;
            btnEditProfile.Enabled = true;

            txtAccPassword.Enabled = false;
            txtAccFullName.Enabled = false;
            txtAccEmail.Enabled = false;
        }

        protected void btnResetRequest_Click(object sender, EventArgs e)
        {
            txtTargetEmail.Text = "";
            txtAmount.Text = "";
        }

        protected void btnRequestSend_Click(object sender, EventArgs e)
        {

            decimal totalBal = Convert.ToDecimal(lblTotalBal.Text.Substring(lblTotalBal.Text.IndexOf('$') + 1));
            decimal amountReq = Convert.ToDecimal(txtAmount.Text);
            string type;
            //lblRequestStatus.Text = totalBal.ToString();  //Validate that totalBal is correct

            //Check if requesting (0) or sending (1) money:
            if (rblActionType.SelectedIndex == 0)
            {
                   type = "D";
                   totalBal += amountReq;
                   addTransactions(type, amountReq, totalBal);
            }
            else if(rblActionType.SelectedIndex == 1)
            {
                if (totalBal < amountReq)   //If amount is more than totalBal
                {
                    lblRequestStatus.Text = "You can't send an amount larger than your current total balance!";
                    lblRequestStatus.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    type = "W";
                    totalBal -= amountReq;
                    addTransactions(type, amountReq, totalBal);
                }
            }
        }

        private void addTransactions(string type, decimal amount, decimal currBal)
        {

            using (SqlConnection conn = new SqlConnection(conString))
            {
                //Update password:
                SqlCommand insertTrans = new SqlCommand("INSERT INTO Transactions (AccountID, Type, Amount, BalanceAfter) VALUES ((SELECT AccountID FROM Accounts WHERE UserID = (SELECT UserID FROM Users WHERE UserName LIKE @user)), @type, @amount, @balAfter)", conn);
                SqlCommand updateAcc = new SqlCommand("UPDATE Accounts SET TotalBalance = @balAfter WHERE UserID = (SELECT UserID FROM Users WHERE UserName LIKE @user)", conn);

                //Open the connection:
                conn.Open();
                insertTrans.Parameters.AddWithValue("@user", userName);
                insertTrans.Parameters.AddWithValue("@type", type);
                insertTrans.Parameters.AddWithValue("@amount", amount);
                insertTrans.Parameters.AddWithValue("@balAfter", currBal);

                updateAcc.Parameters.AddWithValue("@balAfter", currBal);
                updateAcc.Parameters.AddWithValue("@user", userName);

                if (insertTrans.ExecuteNonQuery() != 0)
                {
                    lblTotalBal.Text = "Total Balance: $" + currBal.ToString();

                    if (updateAcc.ExecuteNonQuery() != 0)
                    {
                        displayInformation(userName);
                        txtTargetEmail.Text = "";
                        txtAmount.Text = "";
                        lblRequestStatus.Text = "Successfully finished transaction!";
                        lblRequestStatus.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        lblRequestStatus.Text = "ERROR UPDATING DATA IN THE DATABASE!";
                        lblRequestStatus.ForeColor = System.Drawing.Color.Red;
                    }
                    
                }
                else
                {
                    //If there's an error in the database:
                    lblRequestStatus.Text = "ERROR UPDATING DATA IN THE DATABASE!";
                    lblRequestStatus.ForeColor = System.Drawing.Color.Red;
                }


                conn.Close();
            }
        }
    }
}
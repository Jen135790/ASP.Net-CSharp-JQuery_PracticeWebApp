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

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Server.HtmlEncode(Request.Cookies["userName"].Value - Retrieves cookie data
                if (Request.Cookies["userName"] != null)
                {
                    string userName = Server.HtmlEncode(Request.Cookies["userName"].Value);
                    displayInformation(userName);
                }
                else
                {
                    Response.Redirect("Practice.aspx");
                }
            }
            else
            {
                lblWelcome.Text = "Error! Please log in!";
                Response.Redirect("Practice.aspx");
            }
        }

        protected void displayInformation(string user)
        {

            using (SqlConnection conn = new SqlConnection(conString))
            {
                //Fetch data by checking passing UserName and Password entered (using SQL):
                SqlCommand fetchDetails = new SqlCommand("SELECT AccountID, FullName, TotalBalance FROM Users JOIN Accounts ON Users.UserID = Accounts.UserID WHERE Accounts.UserID = (SELECT UserID FROM Users WHERE UserName LIKE @user)", conn);
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
                        Response.Cookies["fullName"].Value = Convert.ToString(readDB[1]);
                        Response.Cookies["totalBal"].Value = Convert.ToDecimal(readDB[2]).ToString("C2");
                        Response.Cookies["fullName"].Expires = DateTime.Now.AddMinutes(15);
                        Response.Cookies["totalBal"].Expires = DateTime.Now.AddMinutes(15);

                        //Welcome text:
                        lblWelcome.Text = "Welcome " + Response.Cookies["fullName"].Value;
                        //TotalBalance text:
                        lblTotalBal.Text = "Total Balance: " + Response.Cookies["totalBal"].Value;
                        //Fullname text:
                        lblName.Text += Response.Cookies["fullName"].Value;
                        //Username text:
                        lblUserName.Text += user;
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
                    txtTransactions.Text = "Date\t\tType\t\tAmount\t\tBalance After\n";
                    while (readDB.Read())
                    {
                        txtTransactions.Text += Convert.ToDateTime(readDB[0]).ToShortDateString() + "\t" + Convert.ToString(readDB[1]) + "\t\t" + Convert.ToDecimal(readDB[2]).ToString("C2") + "\t\t" + Convert.ToDecimal(readDB[3]).ToString("C2") + "\n";

                    }
                }
                finally
                {
                    readDB.Close();
                }
            }
        }

    }
}
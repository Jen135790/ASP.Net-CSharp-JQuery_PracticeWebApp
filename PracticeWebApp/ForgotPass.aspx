<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPass.aspx.cs" Inherits="PracticeWebApp.ForgotPass" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="css/style.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <title>Forgot Password :: SeaShark Bank</title>
    </head>
<body>
    <form id="form1" runat="server">
	<!-- Web page container -->
	<div class="container">
		
		<!-- Header and Button Navigation -->
		<header>
			<h1>Sea Shark Bank</h1>
			<h3>Saving You From Loan Sharks</h3>
			<!-- Navigation -->  
             <nav>
			    <!-- Display Navigation -->
		    </nav>
			
			<div class="clearFloat"> </div>
		</header>
		<!-- End HEADER -->
		
		<!-- Body Container -->
		<div class="bodyContainer">
		
		<!-- Content Container -->
		
			<!-- Content -->
			<div class="content">
			    <h1>Forgot Password</h1>
                
                <div id="forgotPassForm">
                    <p>Please fill in the form below to retrieve your password!</p>
                    <asp:TextBox ID="txtForgotUser" runat="server" placeholder="User Name" CssClass="registerInput"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredForgotUser" runat="server" ControlToValidate="txtForgotUser" ErrorMessage="* Enter your user name" Font-Bold="True" ForeColor="Red" ValidationGroup="ValidateForgotForm">*</asp:RequiredFieldValidator>
                    <br />
                    <asp:TextBox ID="txtForgotEmail" runat="server" placeholder="Email" CssClass="registerInput" TextMode="Email"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="RequiredForgotEmail" runat="server" ControlToValidate="txtForgotEmail" ErrorMessage="* Enter your email" Font-Bold="True" ForeColor="Red" ValidationGroup="ValidateForgotForm">*</asp:RequiredFieldValidator>

                    <br />
                    <asp:Button ID="btnCancelRetrieval" runat="server" CssClass="btnPost" Height="35px" Text="Cancel" OnClick="btnCancelRetrieval_Click" UseSubmitBehavior="False" PostBackUrl="~/Practice.aspx" />
                    <asp:Button ID="btnSubmit" runat="server" CssClass="btnPost" Height="35px" Text="Submit" Width="81px" ValidationGroup="ValidateForgotForm" OnClick="btnSubmit_Click" />

                    <br />
                    <br />
                    <asp:Label ID="lblValidInput" runat="server"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="lblChangePass" runat="server" Text="Please enter a new password below:" Visible="False"></asp:Label>
                    <br />
                    <asp:TextBox ID="txtNewPass" runat="server" CssClass="registerInput" TextMode="Password" Visible="False"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredNewPass" runat="server" ControlToValidate="txtNewPass" ErrorMessage="* Enter a new password" Font-Bold="True" ForeColor="Red" ValidationGroup="ValidateNewPass">*</asp:RequiredFieldValidator>
                    <br />
                    <asp:TextBox ID="txtConfirmNewPass" runat="server" CssClass="registerInput" TextMode="Password" Visible="False"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredConfirmNewPass" runat="server" ControlToValidate="txtConfirmNewPass" ErrorMessage="* Confirm your new password" Font-Bold="True" ForeColor="Red" ValidationGroup="ValidateNewPass">*</asp:RequiredFieldValidator>
                    <br />
                    <asp:Button ID="btnCancelPassChange" runat="server" CssClass="btnPost" Height="35px" Text="Cancel" OnClick="btnCancelPassChange_Click" UseSubmitBehavior="False" Visible="False" PostBackUrl="~/Practice.aspx" />
                    <asp:Button ID="btnChangePassword" runat="server" CssClass="btnPost" Height="35px" Text="Change Password" Width="145px" ValidationGroup="ValidateNewPass" Visible="False" OnClick="btnChangePassword_Click" />

                </div>
				
			</div>
			<!-- End CONTENT -->
		
		<div class="clearFloat"> </div>
		
		<!-- Footer -->
		<footer>
			<!--Display Footer-->
		</footer>
		<!-- End FOOTER -->
		</div>
		<!-- End BODY CONTAINER -->
		
	</div>
    </form>

    <!-- SCRIPTS -->
    <script src="js/displayHeaderFooter.js"></script>
</body>
</html>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="PracticeWebApp.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="css/style.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <title>Register :: SeaShark Bank</title>
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
			    <h1>Register</h1>
                <div id="registerForm">

                    <asp:Label ID="lblRegError" runat="server" ForeColor="Red"></asp:Label>
                    <br />

                    <asp:TextBox ID="txtFName" runat="server" placeholder="First Name" CssClass="registerInput"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFNameField" runat="server" ControlToValidate="txtFName" ErrorMessage="* Enter your first name" Font-Bold="True" ForeColor="Red" ValidationGroup="ValidateRegistration">*</asp:RequiredFieldValidator>
                    <br />
                    <asp:TextBox ID="txtLName" runat="server" placeholder="Last Name" CssClass="registerInput"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredLNameField" runat="server" ControlToValidate="txtLName" ErrorMessage="* Enter your last name" Font-Bold="True" ForeColor="Red" ValidationGroup="ValidateRegistration">*</asp:RequiredFieldValidator>
                    <br />
                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" placeholder="Email" CssClass="registerInput"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredEmailField" runat="server" ControlToValidate="txtEmail" ErrorMessage="* Enter your email" Font-Bold="True" ForeColor="Red" ValidationGroup="ValidateRegistration">*</asp:RequiredFieldValidator>
                    <br />
                    <asp:TextBox ID="txtConfirmEmail" runat="server" TextMode="Email" placeholder="Confirm Email" CssClass="registerInput"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredConfirmEmailField" runat="server" ControlToValidate="txtConfirmEmail" ErrorMessage="* Confirm your email" Font-Bold="True" ForeColor="Red" ValidationGroup="ValidateRegistration">*</asp:RequiredFieldValidator>
                    <br />
                    <asp:TextBox ID="txtRegUserName" runat="server" placeholder="User Name" CssClass="registerInput"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredUserNameField" runat="server" ControlToValidate="txtRegUserName" ErrorMessage="* Enter a user name" Font-Bold="True" ForeColor="Red" ValidationGroup="ValidateRegistration">*</asp:RequiredFieldValidator>
                    <asp:Label ID="lblAvailable" runat="server"></asp:Label>
                    <br />
                    <asp:TextBox ID="txtRegPassword" runat="server" TextMode="Password" placeholder="Password" CssClass="registerInput"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredPassField" runat="server" ControlToValidate="txtRegPassword" ErrorMessage="* Enter a password" Font-Bold="True" ForeColor="Red" ValidationGroup="ValidateRegistration">*</asp:RequiredFieldValidator>
                    <br />
                    <asp:TextBox ID="txtConfirmPass" runat="server" TextMode="Password" placeholder="Confirm Password" CssClass="registerInput"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredConfirmPass" runat="server" ControlToValidate="txtConfirmPass" ErrorMessage="* Confirm your email" Font-Bold="True" ForeColor="Red" ValidationGroup="ValidateRegistration">*</asp:RequiredFieldValidator>
                    <br />
                    <asp:Button ID="btnCancelReg" runat="server" CausesValidation="False" CssClass="btnPost" OnClick="btnCancelReg_Click" OnClientClick="return confirm('Are you sure you want to cancel registration?')" Text="Cancel" UseSubmitBehavior="False" />
                    <asp:Button ID="btnRegister" runat="server" CssClass="btnPost" Text="Register" ValidationGroup="ValidateRegistration" OnClick="btnRegister_Click" UseSubmitBehavior="False" />
                    <br />

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
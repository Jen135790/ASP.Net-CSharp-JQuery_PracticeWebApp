<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Practice.aspx.cs" Inherits="PracticeWebApp.Practice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="css/style.css" />
    <script src="Scripts/jquery-1.11.3.js"></script>
    <title>Home :: SeaShark Bank</title>
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
                <div id="loginForm">
			    <asp:Login ID="Login1" runat="server" RememberMeText="Save Log In" Width="251px" Height="132px" CreateUserText="Register" CreateUserUrl="~/Register.aspx" PasswordRecoveryText="Forgot Password" PasswordRecoveryUrl="~/ForgotPass.aspx" DestinationPageUrl="~/Account.aspx" OnAuthenticate="Login1_Authenticate" ValidateRequestMode="Enabled" VisibleWhenLoggedIn="False">
                    <TextBoxStyle Height="15px" Width="140px" />
                    <TitleTextStyle Font-Italic="True" />
                    <ValidatorTextStyle Font-Bold="True" />
                </asp:Login>
			    </div>
			    <h1>Home Page</h1>
                
                
                <p>[THIS IS THE HOME PAGE! PLEASE LOG IN!!!] This is just filler text to test the layout of this paragraph in the content dev!!! This is just filler text to test the layout of this paragraph in the content dev!!! This is just filler text to test the layout of this paragraph in the content dev!!! This is just filler text to test the layout of this paragraph in the content dev!!! This is just filler text to test the layout of this paragraph in the content dev!!! This is just filler text to test the layout of this paragraph in the content dev!!! This is just filler text to test the layout of this paragraph in the content dev!!! This is just filler text to test the layout of this paragraph in the content dev!!! This is just filler text to test the layout of this paragraph in the content dev!!! This is just filler text to test the layout of this paragraph in the content dev!!! </p>
				
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

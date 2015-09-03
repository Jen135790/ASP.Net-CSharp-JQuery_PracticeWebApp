<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="PracticeWebApp.Contact" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="css/style.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <title>Contact :: SeaShark Bank</title>
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
			    <h1>Contact Us</h1>
                <div id="contactForm">
                    <asp:Label ID="lblThankYou" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Large"></asp:Label>
                    <p>Fill out the Contact form below to send any suggestions or conflicts you've encountered! All messages are read and taken seriously. If you have any comments, leave them on the <a class="inlineLink" href="Feedback.aspx">Feedback page</a>!</p>
                    <asp:TextBox ID="txtContactName" runat="server" Font-Size="Medium" Height="25px" Width="400px" placeholder="Name" CssClass="contactInput"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredNameField" runat="server" ControlToValidate="txtContactName" ErrorMessage="Please enter your name" Font-Bold="True" ForeColor="Red" ValidationGroup="ValidateContact">*</asp:RequiredFieldValidator>
                    <br />
                    <asp:TextBox ID="txtContactEmail" runat="server" Font-Size="Medium" Height="25px" TextMode="Email" Width="400px" placeholder="Email" CssClass="contactInput"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredEmailField" runat="server" ControlToValidate="txtContactEmail" ErrorMessage="Please enter your email" Font-Bold="True" ForeColor="Red" ValidationGroup="ValidateContact">*</asp:RequiredFieldValidator>
                    <br />
                    <asp:TextBox ID="txtContactMsg" runat="server" Font-Size="Medium" Height="150px" Rows="4" TextMode="MultiLine" placeholder="Send me a message!" CssClass="contactInput"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredMessageField" runat="server" ControlToValidate="txtContactMsg" ErrorMessage="Please enter a message" Font-Bold="True" ForeColor="Red" ValidationGroup="ValidateContact">*</asp:RequiredFieldValidator>


                    <br />
                    <asp:Button ID="btnClearContact" runat="server" CssClass="btnPost" Text="Clear" OnClick="btnClearContact_Click" UseSubmitBehavior="False" />


                    <asp:Button ID="btnSend" runat="server" CssClass="btnPost" Text="Send" ValidationGroup="ValidateContact" OnClick="btnSend_Click" />


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
    <!-- End CONTAINER -->
    </form>

    <!-- SCRIPTS -->
    <script src="js/displayHeaderFooter.js"></script>
</body>
</html>

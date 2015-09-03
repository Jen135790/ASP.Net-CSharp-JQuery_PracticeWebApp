<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Feedback.aspx.cs" Inherits="PracticeWebApp.Feedback" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="css/style.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <title>Feedback :: SeaShark Bank</title>
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
			    <h1>Feedback</h1>
                
                <div id="commentForm">
                    <p>Fill in the form to post your comments. Let us know how we can improve!</p>
                    <p>Name: 
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldNameFB" runat="server" ControlToValidate="txtName" ErrorMessage="*" Font-Bold="True" ForeColor="Red" ValidationGroup="ValidateFeedback">*</asp:RequiredFieldValidator>
                    </p>
                    <textarea runat="server" id="txtComments" class="commentTextarea" rows="3" placeholder="Leave some feedback!"></textarea>
                    
                    <p class="post"><span class="charCount">200</span>
                        <asp:Button ID="btnPost" runat="server" CssClass="btnPost" Text="Post" OnClick="btnPost_Click" ValidationGroup="ValidateFeedback" />
                    </p>
                    <div class="clearFloat"> </div>
                </div>

                <asp:XmlDataSource ID="XmlDataSource1" runat="server" datafile="js/feedback.xml"></asp:XmlDataSource>
                <asp:ListView ID="ListView1" runat="server" DataSourceID="XmlDataSource1">
                <ItemTemplate>
                    <div class="comments">
                    <h4><%#XPath("NAME")%></h4>
                    <p><%#XPath("COMMENT")%></p>
                    </div>
                </ItemTemplate>
                </asp:ListView>
				
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
    <script src="js/feedback.js"></script>

</body>
</html>

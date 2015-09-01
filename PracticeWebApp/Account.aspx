<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="PracticeWebApp.Account" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="css/style.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <title>Account Details :: SeaShark Bank</title>
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
			    <h3 id="Welcome">
                    <asp:Label ID="lblWelcome" runat="server"></asp:Label>
                </h3>
                <div id="logout">

                    <asp:Button ID="btnLogOut" runat="server" OnClientClick="return confirm('Are you sure you want to log out?')" PostBackUrl="~/Practice.aspx" Text="Log Out" />

                </div>

                
                <div id="tabContainer">

                    <asp:TabContainer ID="AccContainer" runat="server" ActiveTabIndex="0" Height="400px" Width="750px" Font-Size="Medium" Font-Underline="False">
                        <asp:TabPanel runat="server" HeaderText="TabPanel1" ID="TabPanel1">
                            <HeaderTemplate>
                                Profile<br />
                                      <br />
                            </HeaderTemplate>
                        <ContentTemplate><div id="profileContents"><asp:Label ID="lblName" runat="server" Font-Size="Large" Text="Full Name: "></asp:Label><br /><asp:Label ID="lblUserName" runat="server" Font-Size="Large" Text="User Name: "></asp:Label><br /><asp:Label ID="lblPassword" runat="server" Font-Size="Large" Text="Password: ******"></asp:Label></div></ContentTemplate></asp:TabPanel>
                        <asp:TabPanel ID="TabPanel2" runat="server" HeaderText="TabPanel2">
                            <HeaderTemplate>
                                Account
                            </HeaderTemplate>
                            <ContentTemplate>
                                
                            <div class="totalBal"><asp:Label ID="lblTotalBal" runat="server" CssClass="totalBal" Font-Size="Large"></asp:Label></div></ContentTemplate>
                        </asp:TabPanel>
                        <asp:TabPanel ID="TabPanel3" runat="server" HeaderText="TabPanel3">
                            <HeaderTemplate>
                                Transactions<br />
                            </HeaderTemplate>
                        <ContentTemplate><asp:TextBox ID="txtTransactions" runat="server" ReadOnly="True" TextMode="MultiLine" Width="725px" Height="395px" BackColor="White" BorderStyle="Solid" CssClass="txtTransactions" Enabled="False" EnableTheming="False" Font-Size="Large" ForeColor="Black" ViewStateMode="Disabled"></asp:TextBox></ContentTemplate></asp:TabPanel>
                    </asp:TabContainer>

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

    <!-- SCRIPTS -->
    <script src="js/displayHeaderFooter.js"></script>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
    </form>

    </body>
</html>

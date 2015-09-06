<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="PracticeWebApp.Account" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="css/style.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <title>Account Details :: SeaShark Bank</title>
    <style type="text/css">
        .auto-style1 {
            margin-bottom: 0px;
        }
    </style>
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

                    <asp:Button ID="btnLogOut" runat="server" OnClientClick="return confirm('Are you sure you want to log out?')" PostBackUrl="~/Practice.aspx" Text="Log Out" OnClick="btnLogOut_Click" CssClass="btnPost" />

                </div>

                
                <div id="tabContainer">

                    <asp:TabContainer ID="AccContainer" runat="server" ActiveTabIndex="0" Height="400px" Width="750px" Font-Size="Medium" Font-Underline="False">
                        <asp:TabPanel runat="server" HeaderText="TabPanel1" ID="TabPanel1">
                            <HeaderTemplate>
                                Profile<br />
                                      <br />
                            </HeaderTemplate>
                        <ContentTemplate><div id="profileContents"><h3 class="tabHeaders">Profile</h3>
                            <div class="profileTab">
                                <asp:Label ID="lblUserName" runat="server" Font-Size="Large" Text="User Name: "></asp:Label>
                                <asp:TextBox ID="txtAccUserName" runat="server" Enabled="False"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredEditUser" runat="server" ControlToValidate="txtAccUserName" ErrorMessage="*" Font-Bold="True" ForeColor="Red">*</asp:RequiredFieldValidator>
                                <br />
                                <asp:Label ID="lblPassword" runat="server" Font-Size="Large" Text="Password: "></asp:Label>
                                <asp:TextBox ID="txtAccPassword" runat="server" Enabled="False" placeholder="******" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredEditPass" runat="server" ControlToValidate="txtAccPassword" ErrorMessage="*" Font-Bold="True" ForeColor="Red" ValidationGroup="ValidateEditProfile">*</asp:RequiredFieldValidator>
                            </div>
                            <br />
                            <h3 class="tabHeaders">Personal</h3>
                            <div class="profileTab">
                                <asp:Label ID="lblName" runat="server" Font-Size="Large" Text="Full Name: "></asp:Label>
                                <asp:TextBox ID="txtAccFullName" runat="server" Enabled="False"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredEditName" runat="server" ControlToValidate="txtAccFullName" ErrorMessage="*" Font-Bold="True" ForeColor="Red" ValidationGroup="ValidateEditProfile">*</asp:RequiredFieldValidator>
                                <br />
                                <asp:Label ID="lblAccEmail" runat="server" Font-Size="Large" Text="Email: "></asp:Label>
                                <asp:TextBox ID="txtAccEmail" runat="server" Enabled="False" TextMode="Email"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredEditEmail" runat="server" ControlToValidate="txtAccEmail" ErrorMessage="*" Font-Bold="True" ForeColor="Red" ValidationGroup="ValidateEditProfile">*</asp:RequiredFieldValidator>
                                <br />
                                <br />
                                <asp:Button ID="btnEditSave" runat="server" CssClass="btnPost" OnClick="btnEditSave_Click" Text="Save" ValidationGroup="ValidateEditProfile" Visible="False" />
                                <asp:Button ID="btnEditCancel" runat="server" CausesValidation="False" CssClass="btnPost" OnClick="btnEditCancel_Click" Text="Cancel" UseSubmitBehavior="False" Visible="False" />
                                <asp:Button ID="btnEditProfile" runat="server" CausesValidation="False" CssClass="btnPost" OnClick="btnEditProfile_Click" Text="Edit" UseSubmitBehavior="False" />
                                <br />
                                <asp:Label ID="lblUpdateErr" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                            </div>
                            </div></ContentTemplate></asp:TabPanel>
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
                        <asp:TabPanel ID="TabPanel4" runat="server" HeaderText="TabPanel4">
                            <HeaderTemplate>
                                Payments/Transfers
                            </HeaderTemplate>
                            <ContentTemplate>
                                <div class="transfersTab">
                                    <h3 class="tabHeaders">Send or Request Money</h3>
                                    <asp:RadioButtonList ID="rblActionType" runat="server" CssClass="TransRadButton">
                                        <asp:ListItem Selected="True">Request Money</asp:ListItem>
                                        <asp:ListItem>Send Money</asp:ListItem>
                                    </asp:RadioButtonList>
                                    <div class="profileTab">
                                        <asp:Label ID="lblTargetEmail" runat="server" Text="Request/Send to Email:"></asp:Label>
                                        <asp:TextBox ID="txtTargetEmail" runat="server" TextMode="Email"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" Font-Bold="True" ForeColor="Red" ControlToValidate="txtTargetEmail" ValidationGroup="ValidateRequest">*</asp:RequiredFieldValidator>
                                        <br />
                                        <asp:RegularExpressionValidator ID="RegularExMoney" runat="server" ControlToValidate="txtAmount" ErrorMessage="Enter a currency amount!   *" Font-Bold="True" Font-Italic="True" ForeColor="Red" ValidationExpression="^[+-]?[0-9]{1,3}(?:,?[0-9]{3})*(?:\.[0-9]{2})?$" ValidationGroup="ValidateRequest"></asp:RegularExpressionValidator>
                                        <asp:Label ID="lblAmount" runat="server" Text="Amount: $"></asp:Label>
                                        <asp:TextBox ID="txtAmount" runat="server" CssClass="auto-style1"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredAmount" runat="server" ErrorMessage="*" Font-Bold="True" ForeColor="Red" ControlToValidate="txtAmount" ValidationGroup="ValidateRequest">*</asp:RequiredFieldValidator>
                                        <br />
                                        <asp:Button ID="btnRequestSend" runat="server" CssClass="btnPost" Text="Request" OnClick="btnRequestSend_Click" ValidationGroup="ValidateRequest" />
                                        <asp:Button ID="btnResetRequest" runat="server" CausesValidation="False" CssClass="btnPost" Text="Reset" UseSubmitBehavior="False" OnClick="btnResetRequest_Click" />
                                        <br />
                                        <br />
                                        <asp:Label ID="lblRequestStatus" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                    </div>
                                    <br />
                                    <br />
                                    <br />
                                </div>
                            </ContentTemplate>
                        </asp:TabPanel>
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

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="IzvještavanjeAdministracija.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<script src="Scripts/jquery-3.0.0.js"></script>
<link href="Content/bootstrap.css" rel="stylesheet" />
<link href="Content/Login.css" rel="stylesheet" />
<head runat="server">
    <title></title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
        rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">

        <div id="login">
            <div id="mat-icon">
                <span class="material-icons">person
                </span>
            </div>

            <div class="form-group">
                <asp:Label ID="lblUsername" runat="server" CssClass="label">
                    <asp:TextBox ID="txtUsername" runat="server" placeholder="Korisnicko ime" autofocus="true" autocomplete="off"></asp:TextBox>
                </asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ControlToValidate="txtUsername" Display="Dynamic" ErrorMessage="Niste upisali korisničko ime"
                    Font-Bold="True" ForeColor="Red">*</asp:RequiredFieldValidator>
            </div>
            <br />
            <div class="form-group">
                <asp:Label ID="lbPassword" runat="server" CssClass="label">
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Zaporka"></asp:TextBox>
                </asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                    ControlToValidate="txtPassword" Display="Dynamic"
                    ErrorMessage="Niste upisali lozinku" Font-Bold="True"
                    ForeColor="Red">*</asp:RequiredFieldValidator>
            </div>
            <br />
            <br />
            <asp:Button ID="btnSubmit" runat="server" Font-Bold="True"
                Text="Prijavi se" CssClass="btn btn-primary btn-lg" OnClick="btnSubmit_Click" />

            <br />
            <br />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Bold="False"
                Font-Size="20px" ForeColor="Black" />

        </div>
        <asp:Label ID="lblInfo" runat="server" Text="Pogrešan username i password" ForeColor="Red"></asp:Label>
    </form>
</body>
</html>


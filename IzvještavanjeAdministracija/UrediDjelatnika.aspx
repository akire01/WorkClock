<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UrediDjelatnika.aspx.cs" Inherits="IzvještavanjeAdministracija.UrediDjelatnika" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 499px;
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Content/DodajUredi.css" rel="stylesheet" />

    <div >
        <div class="forma" style="border: 5px solid #ffbc42">
            <div id="login">
                <div id="mat-icon" class="auto-style1">
                    <span class="material-icons" style="color:#ffbc42 ">portrait
                    </span>
                </div>
                <div class="form-group container">
                    <div class="row">
                        <div class="col">
                            <asp:Label ID="lblFirstName" runat="server" Text="Ime"></asp:Label>
                            <br />
                            <asp:TextBox ID="txtIme" runat="server" CssClass="form-control" autocomplete="off" placeholder="Ime"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                ControlToValidate="txtIme" Display="Dynamic"
                                Font-Bold="True" ForeColor="Red">*Morate unijeti ime</asp:RequiredFieldValidator>
                            <br />
                            <br />
                            <asp:Label ID="LblEmail" runat="server" Text="Email"></asp:Label>
                            <br />
                            <asp:TextBox
                                ID="txtEmail"
                                runat="server" CssClass="form-control" autocomplete="off" placeholder="ime.prezime@mail.com">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                ControlToValidate="txtEmail" Display="Dynamic"
                                Font-Bold="True" ForeColor="Red">*Morate unijeti email adresu</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="RegularExpressionValidator1"
                                runat="server"
                                ErrorMessage="Invalid Email!"
                                ClientIDMode="Static"
                                ControlToValidate="txtEmail"
                                Text="*Pogrešna email adresa"
                                ForeColor="Red"
                                Font-Bold="True"
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                            </asp:RegularExpressionValidator>
                            <br />
                            <br />
                            <asp:Label ID="LblType" runat="server" Text="Tip djelatnika"></asp:Label>
                            <br />
                            <asp:DropDownList
                                ID="ddListTypes"
                                runat="server"
                                CssClass="form-control">
                            </asp:DropDownList>
                            <br />
                            <br />
                            
                        </div>
                        <div class="col">
                            <asp:Label ID="lblLastName" runat="server" Text="Prezime"></asp:Label>
                            <br />
                            <asp:TextBox ID="txtPrezime" runat="server" CssClass="form-control" autocomplete="off" placeholder="Prezime"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                ControlToValidate="txtPrezime" Display="Dynamic"
                                Font-Bold="True" ForeColor="Red">*Morate unijeti prezime</asp:RequiredFieldValidator>
                            </br>
                                </br>
                                <asp:Label ID="LblDate" runat="server" Text="Datum zaposlenja"></asp:Label>
                            <br />
                            <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" type="date"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                ControlToValidate="txtDate" Display="Dynamic"
                                Font-Bold="True" ForeColor="Red">*Morate unijeti datum zaposlenja</asp:RequiredFieldValidator>
                            <br />
                            <br />
                            <asp:Label ID="lblTeam" runat="server" Text="Tim"></asp:Label>
                            <br />
                            <asp:DropDownList
                                ID="ddListTeams"
                                runat="server"
                                CssClass="form-control">
                            </asp:DropDownList>
                            <br />
                            <br />
                            <br />
                            <div class="form-group" style="margin-left:20%">
                                <asp:Button
                                    ID="btnCancel"
                                    runat="server"
                                    Text="Odustani"
                                    CssClass="btn btn-primary btn-lg"
                                    Style="background-color: white; 
                                           border-color: #FFBC42; 
                                           color: black;" 
                                    onClick ="btnCancel_Click"/>
                                <asp:Button
                                    ID="btnAdd"
                                    runat="server"
                                    Text="Ažuriraj"
                                    CssClass="btn btn-primary btn-lg"
                                    Style="background-color: #FFBC42; border-color: #FFBC42; color: black; margin-left: 30px;"
                                    OnClick="btnAdd_Click" />
                            </div>
                        </div>
                        
                    </div>
                    <%--end of row--%>
                </div>
                <%--end of container--%>
                <div clientidmode="Static" class="modal fade" id="exampleModal" runat="server" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel"></h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body" style="font-size: 30px; font-weight: bold">
                                Djelatnik je uspješno ažuriran!
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-dark" data-dismiss="modal" >OK</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--end of login--%>
        </div>
        <%--end of forma--%>
    </div>
</asp:Content>

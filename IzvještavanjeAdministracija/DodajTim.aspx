<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DodajTim.aspx.cs" Inherits="IzvještavanjeAdministracija.DodajTim" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 499px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Content/DodajUredi.css" rel="stylesheet" />

    <form>
        <div class="forma">
            <div id="login">
                <div id="mat-icon" class="auto-style1">
                    <span class="material-icons">group_add
                    </span>
                </div>
                <div class="form-group container">
                    <div class="row">
                        <div class="col">
                            <asp:Label ID="lblNaziv" runat="server" Text="Naziv"></asp:Label>
                            <br />
                            <asp:TextBox ID="txtNaziv" runat="server" CssClass="form-control" autocomplete="off" placeholder="Naziv tima"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                ControlToValidate="txtNaziv" Display="Dynamic"
                                Font-Bold="True" ForeColor="Red">*Morate unijeti naziv</asp:RequiredFieldValidator>
                            <br />
                            <br />
                            <asp:Label ID="lblVoditelj" runat="server" Text="Voditelj"></asp:Label>
                            <br />
                            <asp:DropDownList
                                ID="ddlVoditelj"
                                runat="server"
                                CssClass="form-control">
                            </asp:DropDownList>
                            <br />
                            <br />
                        </div>
                        <div class="col">
                            <asp:Label ID="LblDate" runat="server" Text="Datum kreiranja"></asp:Label>
                            <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" type="date"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                ControlToValidate="txtDate" Display="Dynamic"
                                Font-Bold="True" ForeColor="Red">*Morate unijeti datum zaposlenja</asp:RequiredFieldValidator>
                            <br />
                            <br />
                            <br />
                            <br />
                            <div class="form-group">
                                <asp:Button
                                    ID="btnAddTeam"
                                    runat="server"
                                    Text="Dodaj"
                                    CssClass="btn btn-primary btn-lg"
                                    Style="background-color: #4056F4; border-color: #4056F4; margin-left: 80%"
                                    OnClick="btnAddTeam_Click" />
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
                                Tim je uspješno dodan!
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-dark" data-dismiss="modal">OK</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--end of login--%>
        </div>
        
    </form>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UrediTim.aspx.cs" Inherits="IzvještavanjeAdministracija.UrediTim" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 499px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Content/DodajUredi.css" rel="stylesheet" />

    <div>
        <div class="forma" style="border: 5px solid #ffbc42">
            <div id="login">
                <div id="mat-icon" class="auto-style1">
                    <span class="material-icons" style="color: #ffbc42">people
                    </span>                 
                </div>
                <div class="form-group container">
                    <div class="row">
                        <div class="col">
                            <asp:Label ID="lblNaziv" runat="server" Text="Naziv"></asp:Label>
                            <br />
                            <asp:TextBox ID="txtNaziv" runat="server" CssClass="form-control" autocomplete="off" placeholder="Naziv"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                ControlToValidate="txtNaziv" Display="Dynamic"
                                Font-Bold="True" ForeColor="Red">*Morate unijeti naziv</asp:RequiredFieldValidator>
                            <br />
                            <br />
                            <asp:Label ID="LblVoditelj" runat="server" Text="Voditelj"></asp:Label>
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
                            <asp:Label ID="LblDate" runat="server" Text="Datum otvaranja"></asp:Label>
                            <br />
                            <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" type="date"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                ControlToValidate="txtDate" Display="Dynamic"
                                Font-Bold="True" ForeColor="Red">*Morate unijeti datum zaposlenja</asp:RequiredFieldValidator>
                            <br />
                            <br />
                           <br />
                            <br />
                            <br />
                            <div class="form-group" style="margin-left: 20%">
                                <asp:Button
                                    ID="btnCancel"
                                    runat="server"
                                    Text="Odustani"
                                    CssClass="btn btn-primary btn-lg"
                                    Style="background-color: white; border-color: #FFBC42; color: black;" 
                                    OnClick="btnCancel_Click"
                                    />
                                <asp:Button
                                    ID="btnAdd"
                                    runat="server"
                                    Text="Ažuriraj"
                                    CssClass="btn btn-primary btn-lg"
                                    Style="background-color: #FFBC42; border-color: #FFBC42; color: black; margin-left: 30px;"
                                    OnClick="btnAdd_Click"
                                    />
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
                                Tim je uspješno ažuriran!
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

        <%--end of forma--%>
    </div>

</asp:Content>

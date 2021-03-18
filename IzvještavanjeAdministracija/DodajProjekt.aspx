<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DodajProjekt.aspx.cs" Inherits="IzvještavanjeAdministracija.DodajProjekt" %>
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
                    <span class="material-icons">post_add
                    </span>
                </div>
                <div class="form-group container">
                    <div class="row">
                        <div class="col">
                            <asp:Label ID="lblNaziv" runat="server" Text="Naziv"></asp:Label>
                            <br />
                            <asp:TextBox ID="txtNaziv" runat="server" CssClass="form-control" autocomplete="off" placeholder="Naziv projekta"></asp:TextBox>
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
                            <asp:Label ID="lblDjelatnici" runat="server" Text="Djelatnici"></asp:Label>
                            <br />
                            <asp:Button
                                ID="btnDjelatnici"
                                runat="server"
                                Text="Dodaj djelatnike"
                                CssClass="btn btn-group-sm border-dark"
                                Style="width: 100%"
                                OnClick="btnDjelatnici_Click" />
                        </div>
                        <div class="col">
                            <asp:Label ID="LblDate" runat="server" Text="Datum otvaranja"></asp:Label>
                            <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" type="date"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                ControlToValidate="txtDate" Display="Dynamic"
                                Font-Bold="True" ForeColor="Red">*Morate unijeti datum otvaranja</asp:RequiredFieldValidator>
                            <br />
                            <br />

                            <asp:Label ID="lblKlijent" runat="server" Text="Klijent"></asp:Label>
                            <br />
                            <asp:DropDownList
                                ID="ddlKlijent"
                                runat="server"
                                CssClass="form-control">
                            </asp:DropDownList>
                            </br>
                            </br>
                            <asp:Label ID="lblTeam" runat="server" Text="Timovi"></asp:Label>
                            <br />
                            <asp:Button 
                                ID="btnTimovi" 
                                runat="server"
                                Text="Dodaj timove"
                                CssClass="btn btn-group-sm border-dark" 
                                style="width:100%"
                                OnClick="btnTimovi_Click"/>
                            <br />
                            <br />
                            <div class="form-group">
                                <asp:Button
                                    ID="btnAddProject"
                                    runat="server"
                                    Text="Dodaj"
                                    CssClass="btn btn-primary btn-lg"
                                    Style="background-color: #4056F4; border-color: #4056F4; margin-left: 80%"
                                    OnClick="btnAddProject_Click" />
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
                               Projekt je uspješno dodan!
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
        <%--MODAL ZA DJELATNIKE--%>
        <div id="modalDjelatniciProjekta" class="modal" tabindex="-1" role="dialog">
            <div class="modal-dialog-lg modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <span style="font-weight:bold">DJELATNICI PROJEKTA:</span>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <asp:Label ID="lbDjelatnici" runat="server" Text="" Style="font-weight: bold"></asp:Label>
                        <asp:CheckBoxList ID="cbDjelatnici" runat="server"></asp:CheckBoxList>
                    </div>
                    <div class="modal-footer">
                        <asp:Button
                            ID="btnDodajDjelatnike" 
                            runat="server"
                            Text="Dodaj Djelatnike" 
                            CssClass="btn btn-primary"
                            OnClick="btnDodajDjelatnike_Click"/>
                    </div>
                </div>
            </div>
        </div>
        <%--end of forma--%>
            <%--MODAL ZA TIMOVE--%>
            <div id="modalTimoviProjekta" class="modal" tabindex="-1" role="dialog">
                <div class="modal-dialog-lg modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <span style="font-weight: bold">TIMOVI PROJEKTA:</span>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <asp:Label ID="lblTimovi" runat="server" Text="" Style="font-weight: bold"></asp:Label>
                            <asp:CheckBoxList ID="cbTimovi" runat="server"></asp:CheckBoxList>
                        </div>
                        <div class="modal-footer">
                            <asp:Button
                                ID="btnDodajTimove"
                                runat="server"
                                Text="Dodaj Timove"
                                CssClass="btn btn-primary"
                                OnClick="btnDodajTimove_Click" />
                        </div>
                    </div>
                </div>
              </div>
                <%--end of forma--%>
    </form>
</asp:Content>

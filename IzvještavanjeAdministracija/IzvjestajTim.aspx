<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="IzvjestajTim.aspx.cs" Inherits="IzvještavanjeAdministracija.IzvjestajTim" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" Style="font-size: large; margin-left: 30px;" Text="Izvještaj po timu:"></asp:Label>

    <asp:Label ID="lblNazivTima" runat="server" Style="font-size: large; font-weight: bold;" Text=""></asp:Label>
    &nbsp; &nbsp;
    <asp:Label ID="lbl1" runat="server" Style="font-size: large; font-weight: bold;" Text=""></asp:Label>
    - 
    <asp:Label ID="lbl2" runat="server" Style="font-size: large; font-weight: bold;" Text=""></asp:Label>
    <br />
    <br />

    <asp:Table ID="myTable" CssClass="table table-striped" Style="margin-left: 20px;" BorderColor="Black" runat="server">
        <asp:TableRow>
            <asp:TableCell>Ime djelatnika</asp:TableCell>
            <asp:TableCell>Prezime djelatnika</asp:TableCell>
            <asp:TableCell>Tip djelatnika</asp:TableCell>
            <asp:TableCell>Redovni sati</asp:TableCell>
            <asp:TableCell>Prekovremeni sati</asp:TableCell>
        </asp:TableRow>
    </asp:Table>

    <div style="margin-left:20px;">
        <asp:Button ID="btnExport" runat="server" CssClass="btn btn-dark" Text="Izvezi u CSV formatu" OnClick="btnExport_Click" Visible="false" />
    </div>

    <div id="modalTim" class="modal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered form-group" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p style="font-weight: bold; font-size: x-large;">IZVJEŠTAJ PO TIMU</p>
                </div>
                <div class="form-group container" style="display: flex; padding: 10px; font-size: 20px;">
                    <div class="row">
                        <div class="col">
                            <asp:Label ID="lblNaziv" runat="server" Text="Naziv tima: "></asp:Label>
                            <asp:DropDownList ID="ddlTim" runat="server" CssClass="form-control"></asp:DropDownList>
                            <br />
                            <asp:Label ID="lblPocetak" runat="server" Text="Početni datum izvještavanja:"></asp:Label>
                            <asp:TextBox ID="txtPocetak" runat="server" CssClass="form-control" type="date"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                ControlToValidate="txtPocetak" Display="Dynamic"
                                Font-Bold="True" ForeColor="Red">*Morate unijeti početni datum</asp:RequiredFieldValidator>
                            <br />
                            <asp:Label ID="lblKraj" runat="server" Text="Završni datum izvještavanja:"></asp:Label>
                            <asp:TextBox ID="txtKraj" runat="server" CssClass="form-control" type="date"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                ControlToValidate="txtKraj" Display="Dynamic"
                                Font-Bold="True" ForeColor="Red">*Morate unijeti završni datum</asp:RequiredFieldValidator>
                            <br />
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnTrazi" runat="server" CssClass="btn btn-primary" Text="Pretraži" OnClick="btnTrazi_Click" />

                </div>

            </div>

        </div>
    </div>
</asp:Content>

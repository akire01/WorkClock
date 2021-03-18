<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="IzvjestajKlijent.aspx.cs" Inherits="IzvještavanjeAdministracija.IzvjestajKlijent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Content/Pregled.css" rel="stylesheet" />
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" style="font-size:large; margin-left:30px;" Text="Izvještaj za klijenta:" ></asp:Label>
   
    <asp:Label ID="lblImeKlijenta" runat="server" Style="font-size: large; font-weight: bold;" Text=""></asp:Label>
    &nbsp; &nbsp;
    <asp:Label ID="lbl1" runat="server" Style="font-size: large; font-weight:bold;" Text=""></asp:Label>
    - 
    <asp:Label ID="lbl2" runat="server" Style="font-size: large; font-weight: bold;" Text=""></asp:Label>
    <br />
    <br />
    <asp:Table ID="myTable" CssClass="table table-striped" runat="server" Width="50%">
        
        <asp:TableRow>
            <asp:TableCell>Naziv projekta</asp:TableCell>
            <asp:TableCell>Sati rada</asp:TableCell>
        </asp:TableRow>
       
    </asp:Table>
 
    <div style="margin-left:390px; margin-top:10px;">
        <asp:Button ID="btnExport" runat="server" CssClass="btn btn-dark" Text="Izvezi u CSV formatu" OnClick="btnExport_Click" Visible="false"/>
      
    </div>
    

    <div id="modalKlijent" class="modal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered form-group" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p style="font-weight: bold; font-size: x-large;">IZVJEŠTAJ ZA KLIJENTA</p>
                </div>
                <div class="form-group container" style="display: flex; padding: 10px; font-size: 20px;">
                    <div class="row">
                        <div class="col">
                            <asp:Label ID="lblIme" runat="server" Text="Ime klijenta: "></asp:Label>
                            <asp:DropDownList ID="ddlKlijent" runat="server" CssClass="form-control"></asp:DropDownList>
                            <br />
                            <asp:Label ID="lblPocetak" runat="server" Text="Početni datum izvještavanja:"></asp:Label>
                            <asp:TextBox ID="txtPocetak" runat="server" CssClass="form-control" type="date"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                ControlToValidate="txtPocetak" Display="Dynamic"
                                Font-Bold="True" ForeColor="Red">*Morate unijeti početni datum</asp:RequiredFieldValidator>
                            <br />
                            <asp:Label ID="lblKraj" runat="server" Text="Završni datum izvještavanja:"></asp:Label>
                            <asp:TextBox ID="txtKraj" runat="server" CssClass="form-control" type="date"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
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

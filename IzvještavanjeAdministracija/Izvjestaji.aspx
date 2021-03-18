<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Izvjestaji.aspx.cs" Inherits="IzvještavanjeAdministracija.Izvjestaji" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    

    <div id="mojModal" class="modal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p style="font-weight: bold; font-size: x-large; align-content:center; color: black">IZVJEŠTAJI</p>
                    <p style="font-weight: bold; font-size: x-large; color: black">Odaberite tip izvještaja:</p>
                </div>
               <div class"gumbi" style="display:flex; justify-content:space-between; padding:10px;">
                    <asp:Button ID="btnKlijenti" class="btn btn-primary" Width="30%" runat="server" Text="Za klijente"
                        OnClick="btnKlijenti_Click" />
                    <asp:Button ID="btnTimovi" class="btn btn-primary" Width="30%" runat="server" Text="Po timovima"
                         OnClick="btnTimovi_Click"/>
               </div>
            </div>
        </div>
    </div>


   
</asp:Content>

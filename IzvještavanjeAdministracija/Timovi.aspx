<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Timovi.aspx.cs" Inherits="IzvještavanjeAdministracija.Timovi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Content/Pregled.css"  rel="stylesheet" />
    <asp:Button ID="btnAdd" runat="server" Text="Novi tim" CssClass="btn btn-primary" OnClick="btnAdd_Click"  />
    <asp:GridView
        ID="GridView1"
        runat="server"
        CssClass="table "
        AutoGenerateColumns="False"
        DataKeyNames="IDTim"
        DataSourceID="SqlDataSource2"
        AllowPaging="True"
        AllowSorting="True"
        OnRowDataBound="GridView1_RowDataBound"
        >
        <HeaderStyle BackColor="White" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle HorizontalAlign="Center" />
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <%-- <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Uredi"></asp:LinkButton>
                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Odustani"></asp:LinkButton>--%>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="btnUredi" runat="server" CausesValidation="False"
                        CommandName="Edit"
                        CommandArgument='<%#Eval("IDTim")%>'
                        OnClick="btnUredi_Click"
                        Text="Uredi"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="btnDeakt" runat="server" CausesValidation="False" CommandName="Change"
                        CommandArgument='<%#Eval("IDTim")%>'
                        Text="Odaberi status"
                        OnClick="btnDeakt_Click"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="IDTim" HeaderText="IDTim" InsertVisible="False" ReadOnly="True" SortExpression="IDTim" Visible="false"/>
            <asp:BoundField DataField="Naziv" HeaderText="Naziv" SortExpression="Naziv" />
            <asp:TemplateField HeaderText="Voditelj" SortExpression="VoditeljID">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("VoditeljID") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# ImeOsobe(Eval("VoditeljID").ToString()) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
           
            <asp:TemplateField HeaderText="Datum kreiranja" SortExpression="DatumKreiranja">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DatumKreiranja") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# GetDatum(Eval("DatumKreiranja").ToString()) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Djelatnici" SortExpression="IDTim">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("IDTim") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Button ID="btnDjelatnici" runat="server" Text="Djelatnici"
                        CssClass="btn btn-light border-dark"
                        CommandArgument='<%#Eval("IDTim")%>'
                        OnClick="btnDjelatnici_Click" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Aktivnost" SortExpression="Aktivnost">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Aktivnost") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblStatus" runat="server" Style="font-weight:bold" Text='<%# Aktivnost(Eval("Aktivnost").ToString()) %>' Enabled="false" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:PRA20-Erika-RagužConnectionString %>" DeleteCommand="DELETE FROM [Tim] WHERE [IDTim] = @original_IDTim AND [Naziv] = @original_Naziv AND (([VoditeljID] = @original_VoditeljID) OR ([VoditeljID] IS NULL AND @original_VoditeljID IS NULL)) AND (([Aktivnost] = @original_Aktivnost) OR ([Aktivnost] IS NULL AND @original_Aktivnost IS NULL)) AND (([DatumKreiranja] = @original_DatumKreiranja) OR ([DatumKreiranja] IS NULL AND @original_DatumKreiranja IS NULL))" InsertCommand="INSERT INTO [Tim] ([Naziv], [VoditeljID], [Aktivnost], [DatumKreiranja]) VALUES (@Naziv, @VoditeljID, @Aktivnost, @DatumKreiranja)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Tim]" UpdateCommand="UPDATE [Tim] SET [Naziv] = @Naziv, [VoditeljID] = @VoditeljID, [Aktivnost] = @Aktivnost, [DatumKreiranja] = @DatumKreiranja WHERE [IDTim] = @original_IDTim AND [Naziv] = @original_Naziv AND (([VoditeljID] = @original_VoditeljID) OR ([VoditeljID] IS NULL AND @original_VoditeljID IS NULL)) AND (([Aktivnost] = @original_Aktivnost) OR ([Aktivnost] IS NULL AND @original_Aktivnost IS NULL)) AND (([DatumKreiranja] = @original_DatumKreiranja) OR ([DatumKreiranja] IS NULL AND @original_DatumKreiranja IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_IDTim" Type="Int32" />
            <asp:Parameter Name="original_Naziv" Type="String" />
            <asp:Parameter Name="original_VoditeljID" Type="Int32" />
            <asp:Parameter Name="original_Aktivnost" Type="Boolean" />
            <asp:Parameter DbType="Date" Name="original_DatumKreiranja" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Naziv" Type="String" />
            <asp:Parameter Name="VoditeljID" Type="Int32" />
            <asp:Parameter Name="Aktivnost" Type="Boolean" />
            <asp:Parameter DbType="Date" Name="DatumKreiranja" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Naziv" Type="String" />
            <asp:Parameter Name="VoditeljID" Type="Int32" />
            <asp:Parameter Name="Aktivnost" Type="Boolean" />
            <asp:Parameter DbType="Date" Name="DatumKreiranja" />
            <asp:Parameter Name="original_IDTim" Type="Int32" />
            <asp:Parameter Name="original_Naziv" Type="String" />
            <asp:Parameter Name="original_VoditeljID" Type="Int32" />
            <asp:Parameter Name="original_Aktivnost" Type="Boolean" />
            <asp:Parameter DbType="Date" Name="original_DatumKreiranja" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <div id="mojModal" class="modal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p style="font-weight: bold; font-size: x-large; color: Red">Odaberite status tima:</p>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnNeaktivan" class="btn btn-secondary" runat="server" Text="Neaktivan"
                        CommandName="Deaktiviraj"
                        OnClick="Aktivnost_Click"
                         />
                    <asp:Button ID="btnAktivan" class="btn btn-primary" runat="server" Text="Aktivan"
                        CommandName="Aktiviraj"
                        OnClick="Aktivnost_Click" />
                </div>
            </div>
        </div>
    </div>

    <%--modal na prikazu--%>
    <div id="djelatniciModal" class="modal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <asp:label id="lbbulleted" runat="server" text="" style="font-weight: bold"></asp:label>
                    <asp:bulletedlist id="bl" runat="server"></asp:bulletedlist>
                </div>
                <div class="modal-footer">
                </div>
            </div>
        </div>
     </div>
</asp:Content>

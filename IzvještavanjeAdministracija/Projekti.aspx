<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Projekti.aspx.cs" Inherits="IzvještavanjeAdministracija.Projekti" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Content/Pregled.css" rel="stylesheet" />

    <asp:Button ID="btnAdd" runat="server" Text="Novi projekt" CssClass="btn btn-primary" OnClick="btnAdd_Click"  />
    <asp:GridView
        ID="GridView1"
        runat="server"
        CssClass="table "
        EnableHeadersVisualStyles="false"
        ColumnHeaderDefaultCellStyle="Blue"
        OnRowDataBound="GridView1_RowDataBound"
        AllowPaging="True"
        AllowSorting="True"
        AutoGenerateColumns="False"
        DataKeyNames="IDProjekt"
        DataSourceID="SqlDataSource1" BackColor="White" BorderStyle="Dotted">
        <HeaderStyle HorizontalAlign="Center" BackColor="White" />
        <RowStyle HorizontalAlign="Center" />
    <Columns>
        <asp:TemplateField ShowHeader="False">
            <EditItemTemplate>
               <%-- <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Uredi"></asp:LinkButton>
                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Odustani"></asp:LinkButton>--%>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:LinkButton ID="btnUredi" runat="server" CausesValidation="False" CommandName="Edit" Text="Uredi"
                    CommandArgument='<%#Eval("IDProjekt")%>'
                    onClick="btnUredi_Click"></asp:LinkButton>
                &nbsp;<asp:LinkButton ID="btnDeakt" runat="server" CausesValidation="False" CommandName="Change" Text="Odaberi status"
                    CommandArgument='<%#Eval("IDProjekt")%>'
                    onClick="btnDeakt_Click"></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="IDProjekt" HeaderText="IDProjekt" InsertVisible="False" ReadOnly="True" SortExpression="IDProjekt" Visible="false" />
        <asp:BoundField DataField="Naziv" HeaderText="Naziv" SortExpression="Naziv" />
        <asp:TemplateField HeaderText="Datum otvaranja" SortExpression="DatumOtvaranja">
            <EditItemTemplate>
                <asp:TextBox ID="txtDatumOtvaranja" runat="server" Text='<%# Bind("DatumOtvaranja") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="lblDatumOtvaranja" runat="server" Text='<%# GetDatum(Eval("DatumOtvaranja").ToString()) %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Voditelj" SortExpression="VoditeljID">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("VoditeljID") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# ImeOsobe(int.Parse(Eval("VoditeljID").ToString())) %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Klijent" SortExpression="KlijentID">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("KlijentID") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# ImeKlijenta(Eval("KlijentID").ToString()) %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Djelatnici" SortExpression="IDProjekt">
            <EditItemTemplate>
                <asp:TextBox ID="txtDjelatnici" runat="server" Text='<%# Bind("IDProjekt") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Button ID="btnDjelatnici" runat="server" Text="Djelatnici"
                    CssClass="btn btn-light border-dark"
                    CommandArgument='<%#Eval("IDProjekt")%>'
                    OnClick="btnDjelatnici_Click" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Timovi" SortExpression="IDProjekt">
            <EditItemTemplate>
                <asp:TextBox ID="txtTimovi" runat="server" Text='<%# Bind("IDProjekt") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Button ID="btnTimovi" runat="server" Text="Timovi"
                    CssClass="btn btn-light border-dark"
                    CommandArgument='<%#Eval("IDProjekt")%>'
                    OnClick="btnTimovi_Click" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Status" SortExpression="Aktivnost">
            <EditItemTemplate>
                <asp:TextBox ID="txtStatus" runat="server" Text='<%# Bind("Aktivnost") %>' />
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="lblStatus" runat="server" Style="font-weight: bold" Text='<%# Aktivnost(Eval("Aktivnost").ToString()) %>' />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
        <HeaderStyle BackColor="White" ForeColor="Black" />
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" 
    ConnectionString="<%$ ConnectionStrings:PRA20-Erika-RagužConnectionString2 %>" 
    DeleteCommand="DELETE FROM [Projekt] WHERE [IDProjekt] = @original_IDProjekt AND [Naziv] = @original_Naziv AND [DatumOtvaranja] = @original_DatumOtvaranja AND (([VoditeljID] = @original_VoditeljID) OR ([VoditeljID] IS NULL AND @original_VoditeljID IS NULL)) AND (([KlijentID] = @original_KlijentID) OR ([KlijentID] IS NULL AND @original_KlijentID IS NULL)) AND (([Aktivnost] = @original_Aktivnost) OR ([Aktivnost] IS NULL AND @original_Aktivnost IS NULL))" InsertCommand="INSERT INTO [Projekt] ([Naziv], [DatumOtvaranja], [VoditeljID], [KlijentID], [Aktivnost]) VALUES (@Naziv, @DatumOtvaranja, @VoditeljID, @KlijentID, @Aktivnost)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Projekt]" UpdateCommand="UPDATE [Projekt] SET [Naziv] = @Naziv, [DatumOtvaranja] = @DatumOtvaranja, [VoditeljID] = @VoditeljID, [KlijentID] = @KlijentID, [Aktivnost] = @Aktivnost WHERE [IDProjekt] = @original_IDProjekt AND [Naziv] = @original_Naziv AND [DatumOtvaranja] = @original_DatumOtvaranja AND (([VoditeljID] = @original_VoditeljID) OR ([VoditeljID] IS NULL AND @original_VoditeljID IS NULL)) AND (([KlijentID] = @original_KlijentID) OR ([KlijentID] IS NULL AND @original_KlijentID IS NULL)) AND (([Aktivnost] = @original_Aktivnost) OR ([Aktivnost] IS NULL AND @original_Aktivnost IS NULL))">
   
    
    <DeleteParameters>
        <asp:Parameter Name="original_IDProjekt" Type="Int32" />
        <asp:Parameter Name="original_Naziv" Type="String" />
        <asp:Parameter DbType="Date" Name="original_DatumOtvaranja" />
        <asp:Parameter Name="original_VoditeljID" Type="Int32" />
        <asp:Parameter Name="original_KlijentID" Type="Int32" />
        <asp:Parameter Name="original_Aktivnost" Type="Boolean" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="Naziv" Type="String" />
        <asp:Parameter DbType="Date" Name="DatumOtvaranja" />
        <asp:Parameter Name="VoditeljID" Type="Int32" />
        <asp:Parameter Name="KlijentID" Type="Int32" />
        <asp:Parameter Name="Aktivnost" Type="Boolean" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="Naziv" Type="String" />
        <asp:Parameter DbType="Date" Name="DatumOtvaranja" />
        <asp:Parameter Name="VoditeljID" Type="Int32" />
        <asp:Parameter Name="KlijentID" Type="Int32" />
        <asp:Parameter Name="Aktivnost" Type="Boolean" />
        <asp:Parameter Name="original_IDProjekt" Type="Int32" />
        <asp:Parameter Name="original_Naziv" Type="String" />
        <asp:Parameter DbType="Date" Name="original_DatumOtvaranja" />
        <asp:Parameter Name="original_VoditeljID" Type="Int32" />
        <asp:Parameter Name="original_KlijentID" Type="Int32" />
        <asp:Parameter Name="original_Aktivnost" Type="Boolean" />
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
                    <p style="font-weight: bold; font-size: x-large; color: Red">Odaberite status projekta:</p>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnNeaktivan" class="btn btn-secondary" runat="server" Text="Neaktivan"
                        CommandName="Deaktiviraj"
                        OnClick="btnAktivnost_Click" />
                    <asp:Button ID="btnAktivan" class="btn btn-primary" runat="server" Text="Aktivan"
                        CommandName="Aktiviraj"
                        OnClick="btnAktivnost_Click" />
                </div>
            </div>
        </div>
    </div>

    <%--MODAL NA PRIKAZU--%>
    <div id="projectsModal" class="modal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <asp:Label ID="lbbulleted" runat="server" Text="" Style="font-weight: bold"></asp:Label>
                    <asp:BulletedList ID="bl" runat="server"></asp:BulletedList>
                </div>
                <div class="modal-footer">
                </div>
            </div>
        </div>

</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Djelatnici.aspx.cs" Inherits="IzvještavanjeAdministracija.Djelatnici" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        window.addEventListener('DOMContentLoaded', () => {
            document.querySelector('#RegularExpressionValidator1').style.display = 'none';
        });
        
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Content/Pregled.css" rel="stylesheet" />
    <asp:Button ID="btnAdd" runat="server" Text="Novi djelatnik" CssClass="btn btn-primary"  OnClick="btnAdd_Click" />

    <div>
        <asp:ValidationSummary ID="RegularExpressionValidator1" runat="server" ForeColor="Red" Font-Size="Large"/>
    </div>

    <asp:GridView
        ID="GridView1"
        runat="server" 
        AutoGenerateColumns="False"
        CssClass="table " 
        DataKeyNames="IDDjelatnik"
        DataSourceID="SqlDataSource" 
        AllowPaging="True" 
        AllowSorting="True" 
        OnRowDataBound ="GridView1_RowDataBound"
        >
        <HeaderStyle BackColor="white" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle HorizontalAlign="Center" />
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <%--<asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Ažuriraj"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Odustani"></asp:LinkButton>--%>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="btnEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Uredi"
                        CommandArgument='<%#Eval("IDDjelatnik")%>'
                        OnClick="btnEdit_Click"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="btnDeact" runat="server" CausesValidation="False" CommandName="Delete" Text="Odaberi status"
                        CommandArgument='<%#Eval("IDDjelatnik")%>'
                        OnClick="btnDeact_Click"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="IDDjelatnik" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="IDDjelatnik" Visible="false" />
            <asp:BoundField DataField="Ime" HeaderText="Ime" SortExpression="Ime" />
            <asp:BoundField DataField="Prezime" HeaderText="Prezime" SortExpression="Prezime" />
            <asp:TemplateField HeaderText="Tip" SortExpression="TipID">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate >
                    <asp:Label ID="Label1" runat="server" Text='<%# NazivTipa(int.Parse(Eval("TipID").ToString()))  %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email" SortExpression="Email">
                <EditItemTemplate>
                    <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator
                        ID="RegularExpressionValidator1" 
                        runat="server" 
                        ErrorMessage="Pogrešna email adresa!"
                        ClientIDMode ="Static"
                        ControlToValidate="txtEmail"
                        Text="*"
                        ForeColor="Red"
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                    </asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Datum zaposlenja" SortExpression="DatumZaposlenja">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("DatumZaposlenja") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# GetDatum(Eval("DatumZaposlenja").ToString()) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tim" SortExpression="TimID">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("TimID") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# NazivTima(int.Parse(Eval("TimID").ToString())) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Projekti" SortExpression="IDDjelatnik">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("IDDjelatnik") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Button ID="btnProjekti" runat="server" Text="Projekti" 
                        cssClass="btn btn-light border-dark"
                        CommandArgument='<%#Eval("IDDjelatnik")%>'
                        OnClick="btnProjekti_Click" />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Status" SortExpression="Aktivnost" >
                <EditItemTemplate>
                    <asp:TextBox ID="txtStatus" runat="server" Text='<%# Bind("Aktivnost") %>' ></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate >
                    <asp:Label ID="lblStatus" runat="server" Style="font-weight: bold" Text='<%# Aktivnost(Eval("Aktivnost").ToString()) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
           
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:PRA20-Erika-RagužConnectionString %>" DeleteCommand="DELETE FROM [Djelatnik] WHERE [IDDjelatnik] = @original_IDDjelatnik AND [TipID] = @original_TipID AND [Ime] = @original_Ime AND [Prezime] = @original_Prezime AND [Email] = @original_Email AND [DatumZaposlenja] = @original_DatumZaposlenja AND [TimID] = @original_TimID" InsertCommand="INSERT INTO [Djelatnik] ([TipID], [Ime], [Prezime], [Email], [DatumZaposlenja], [TimID]) VALUES (@TipID, @Ime, @Prezime, @Email, @DatumZaposlenja, @TimID)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Djelatnik]" UpdateCommand="UPDATE [Djelatnik] SET [TipID] = @TipID, [Ime] = @Ime, [Prezime] = @Prezime, [Email] = @Email, [DatumZaposlenja] = @DatumZaposlenja, [TimID] = @TimID WHERE [IDDjelatnik] = @original_IDDjelatnik AND [TipID] = @original_TipID AND [Ime] = @original_Ime AND [Prezime] = @original_Prezime AND [Email] = @original_Email AND [DatumZaposlenja] = @original_DatumZaposlenja AND [TimID] = @original_TimID">
        <DeleteParameters>
            <asp:Parameter Name="original_IDDjelatnik" Type="Int32" />
            <asp:Parameter Name="original_TipID" Type="Int32" />
            <asp:Parameter Name="original_Ime" Type="String" />
            <asp:Parameter Name="original_Prezime" Type="String" />
            <asp:Parameter Name="original_Email" Type="String" />
            <asp:Parameter DbType="Date" Name="original_DatumZaposlenja" />
            <asp:Parameter Name="original_TimID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="TipID" Type="Int32" />
            <asp:Parameter Name="Ime" Type="String" />
            <asp:Parameter Name="Prezime" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter DbType="Date" Name="DatumZaposlenja" />
            <asp:Parameter Name="TimID" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="TipID" Type="Int32" />
            <asp:Parameter Name="Ime" Type="String" />
            <asp:Parameter Name="Prezime" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter DbType="Date" Name="DatumZaposlenja" />
            <asp:Parameter Name="TimID" Type="Int32" />
            <asp:Parameter Name="original_IDDjelatnik" Type="Int32" />
            <asp:Parameter Name="original_TipID" Type="Int32" />
            <asp:Parameter Name="original_Ime" Type="String" />
            <asp:Parameter Name="original_Prezime" Type="String" />
            <asp:Parameter Name="original_Email" Type="String" />
            <asp:Parameter DbType="Date" Name="original_DatumZaposlenja" />
            <asp:Parameter Name="original_TimID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>

    <div id="mojModal" class="modal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p style="font-weight:bold; font-size:x-large; color:Red">Odaberite status djelatnika:</p>
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

    <%--MODAL ZA PROJEKTE--%>
    <div id="djelatniciModal" class="modal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <asp:Label ID="lbProjekti" runat="server" Text="" Style="font-weight: bold"></asp:Label>
                    <asp:BulletedList ID="blProjekti" runat="server"></asp:BulletedList>
                </div>
                <div class="modal-footer">
                </div>
            </div>
        </div>
   

</asp:Content>

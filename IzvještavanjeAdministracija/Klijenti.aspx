<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Klijenti.aspx.cs" Inherits="IzvještavanjeAdministracija.Klijenti" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Content/Pregled.css" rel="stylesheet" />
    <asp:Button ID="btnAdd" runat="server" Text="Novi klijent" CssClass="btn btn-primary" OnClick="btnAdd_Click"  />

    <asp:GridView
        ID="GridView1"
        runat="server"
        CssClass="table"
        AllowPaging="True" 
        AllowSorting="True"
        AutoGenerateColumns="False" 
        DataKeyNames="IDKlijent"
        DataSourceID="SqlDataSource1">

        <HeaderStyle BackColor="white" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle HorizontalAlign="Center" />
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="btnUredi" runat="server" CausesValidation="False"
                        CommandName="Edit"
                        Text="Uredi"
                        CommandArgument='<%#Eval("IDKlijent")%>'
                        OnClick="btnUredi_Click"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="IDKlijent" HeaderText="IDKlijent" InsertVisible="False" ReadOnly="True" SortExpression="IDKlijent" Visible="false" />
            <asp:BoundField DataField="Ime" HeaderText="Ime" SortExpression="Ime" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:PRA20-Erika-RagužConnectionString %>" DeleteCommand="DELETE FROM [Klijent] WHERE [IDKlijent] = @original_IDKlijent AND [Ime] = @original_Ime AND [Email] = @original_Email" InsertCommand="INSERT INTO [Klijent] ([Ime], [Email]) VALUES (@Ime, @Email)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Klijent]" UpdateCommand="UPDATE [Klijent] SET [Ime] = @Ime, [Email] = @Email WHERE [IDKlijent] = @original_IDKlijent AND [Ime] = @original_Ime AND [Email] = @original_Email">
        <DeleteParameters>
            <asp:Parameter Name="original_IDKlijent" Type="Int32" />
            <asp:Parameter Name="original_Ime" Type="String" />
            <asp:Parameter Name="original_Email" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Ime" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Ime" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="original_IDKlijent" Type="Int32" />
            <asp:Parameter Name="original_Ime" Type="String" />
            <asp:Parameter Name="original_Email" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <p>
    </p>
</asp:Content>

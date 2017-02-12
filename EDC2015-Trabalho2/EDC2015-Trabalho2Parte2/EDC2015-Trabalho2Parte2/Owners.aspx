<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Owners.aspx.cs" Inherits="EDC2015_Trabalho2Parte2.Owners" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" Text="Owner's Info:" Font-Size="Large"></asp:Label>
    <br />
    <asp:TextBox runat="server" ID="remove" Visible="false" Width="233px">Carrega no Nif do Owner a remover</asp:TextBox>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="XmlDataSource2" ForeColor="#333333" GridLines="None" Height="276px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="892px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="nif" DataNavigateUrlFormatString="remove_owner.aspx?nif={0}" DataTextField="nif" HeaderText="NIF" />
            <asp:BoundField DataField="fname" HeaderText="Nome" SortExpression="fname" />
            <asp:BoundField DataField="lname" HeaderText="Apelido" SortExpression="lname" />
            <asp:BoundField DataField="pdate" HeaderText="Data da Compra" SortExpression="pdate" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <asp:XmlDataSource ID="XmlDataSource2" runat="server" DataFile="~/casas.xml" TransformFile="~/owners.xslt"></asp:XmlDataSource>
    <br />
    <div>
     <p>
            <asp:Button ID="Button2" runat="server" PostBackUrl="~/edit_owner.aspx" Text="Edit Owners" />
    </p>
    <p>
            <asp:Button ID="Button3" runat="server" PostBackUrl="~/add_owner.aspx" Text="Add Owners" />
    </p>
    </div>    
</asp:Content>

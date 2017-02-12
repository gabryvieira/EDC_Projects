<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="propriedade.aspx.cs" Inherits="EDC2015_Trabalho2Parte2.propriedade" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <asp:Label ID="Label" runat="server" Text="Properties Info:" Font-Size="Large"></asp:Label>
    <br />
    <br />
   <asp:XmlDataSource ID="XmlDataSource5" runat="server" DataFile="~/casas.xml" TransformFile="~/propMunicipio.xslt" XPath="listamunicipios/city[not(@cidadeteste=preceding::city/@cidadeteste)]"></asp:XmlDataSource>
      Cidade:
    <asp:Button ID="Button1"  runat="server" PostBackUrl="~/propriedades.aspx" Text="Ver Todas" />
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="XmlDataSource5" DataTextField="cidadeteste" DataValueField="cidadeteste" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" OnDataBound="DropDownList1_DataBound">
        </asp:DropDownList>
    
    <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-hover " AutoGenerateColumns="False" DataSourceID="XmlDataSource1" AllowSorting="True" Width="1036px" AllowPaging="True" GridLines="None" CellPadding="4" ForeColor="#333333" OnDataBound="GridView1_DataBound">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
            <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
            <asp:BoundField DataField="Street" HeaderText="Street" SortExpression="Street" />
            <asp:BoundField DataField="pnumber" HeaderText="pnumber" SortExpression="pnumber" />
            <asp:BoundField DataField="value" HeaderText="value" SortExpression="value" />
            <asp:BoundField DataField="fname" HeaderText="fname" SortExpression="fname" />
             <asp:BoundField DataField="pdate" HeaderText="pdate" SortExpression="pdate" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" CssClass="pagination-ys" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    
    <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/casas.xml" TransformFile="~/casas.xslt"></asp:XmlDataSource>

    Valor total das propriedades: <asp:Label ID="Literal1" runat="server" Font-Bold="true"></asp:Label>
    <p>
           <asp:Button ID="Button2"  runat="server" PostBackUrl="~/edit_propriedade.aspx" Text="Editar Propriedades" />
    </p>
    <p>
            <asp:Button ID="Button3"  runat="server" PostBackUrl="~/add_propriedade.aspx" Text="Add Property" />
    </p>

</asp:Content>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="remove_prop.aspx.cs" Inherits="EDC2015_Trabalho2Parte2.remove_prop" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Button ID="Button1" runat="server" PostBackUrl="~/propriedades.aspx" Text="Voltar" />
    
        <asp:FormView ID="FormView1" runat="server" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataSourceID="XmlDataSource1" ForeColor="Black" onitemupdating="FormView1_ItemUpdating">
            <EditItemTemplate>
                id:
                <asp:TextBox ID="idTextBox" runat="server" Text='<%# Bind("id") %>' />
                <br />
                city:
                <asp:TextBox ID="cityTextBox" runat="server" Text='<%# Bind("city") %>' />
                <br />
                Street:
                <asp:TextBox ID="StreetTextBox" runat="server" Text='<%# Bind("Street") %>' />
                <br />
                pnumber:
                <asp:TextBox ID="pnumberTextBox" runat="server" Text='<%# Bind("pnumber") %>' />
                <br />
                value:
                <asp:TextBox ID="valueTextBox" runat="server" Text='<%# Bind("value") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <EditRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <InsertItemTemplate>
                id:
                <asp:TextBox ID="idTextBox" runat="server" Text='<%# Bind("id") %>' />
                <br />
                city:
                <asp:TextBox ID="cityTextBox" runat="server" Text='<%# Bind("city") %>' />
                <br />
                Street:
                <asp:TextBox ID="StreetTextBox" runat="server" Text='<%# Bind("Street") %>' />
                <br />
                pnumber:
                <asp:TextBox ID="pnumberTextBox" runat="server" Text='<%# Bind("pnumber") %>' />
                <br />
                value:
                <asp:TextBox ID="valueTextBox" runat="server" Text='<%# Bind("value") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                id:
                <asp:Label ID="idLabel" runat="server" Text='<%# Bind("id") %>' />
                <br />
                city:
                <asp:Label ID="cityLabel" runat="server" Text='<%# Bind("city") %>' />
                <br />
                Street:
                <asp:Label ID="StreetLabel" runat="server" Text='<%# Bind("Street") %>' />
                <br />
                pnumber:
                <asp:Label ID="pnumberLabel" runat="server" Text='<%# Bind("pnumber") %>' />
                <br />

                value:
                <asp:Label ID="valueLabel" runat="server" Text='<%# Bind("value") %>' />
                <br />

            </ItemTemplate>
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
        </asp:FormView>
        
    
        <asp:Button ID="remover" runat="server" OnClick="remover_Click" Text="Remover" />
        <asp:XmlDataSource ID="XmlDataSource2" runat="server" DataFile="~/casas.xml" TransformFile="~/propremove.xslt"></asp:XmlDataSource>
        <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/casas.xml" TransformFile="~/propriedades.xslt"></asp:XmlDataSource>
        <br />
        <asp:Label ID="Label1" runat="server" Text="Propriedades"></asp:Label>
        :<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="XmlDataSource2" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
                <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                <asp:BoundField DataField="Street" HeaderText="Street" SortExpression="Street" />
                <asp:BoundField DataField="pnumber" HeaderText="pnumber" SortExpression="pnumber" />
                <asp:BoundField DataField="value" HeaderText="value" SortExpression="value" />     
            </Columns>
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <SortedAscendingCellStyle BackColor="#FAFAE7" />
            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
            <SortedDescendingCellStyle BackColor="#E1DB9C" />
            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
        </asp:GridView>
        <br />
        <asp:XmlDataSource ID="XmlDataSource3" runat="server" DataFile="~/casas.xml"></asp:XmlDataSource>
    
    </div>
    </form>
</body>
</html>

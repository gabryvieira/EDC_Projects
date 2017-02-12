<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="remove_owner.aspx.cs" Inherits="EDC2015_Trabalho2Parte2.remove_owner" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
     <form id="form1" runat="server">
    <div>
    
        <asp:Button ID="Button1" runat="server" PostBackUrl="~/Owners.aspx" Text="Voltar" />
    
        <asp:FormView ID="FormView1" runat="server" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataSourceID="XmlDataSource1" ForeColor="Black" onitemupdating="FormView1_ItemUpdating">
            <EditItemTemplate>
                fname:
                <asp:TextBox ID="fnameTextBox" runat="server" Text='<%# Bind("fname") %>' />
                <br />
                lname:
                <asp:TextBox ID="lnameTextBox" runat="server" Text='<%# Bind("lname") %>' />
                <br />
                nif:
                <asp:TextBox ID="nifTextBox" runat="server" Text='<%# Bind("nif") %>' />
                <br />
                pdate:
                <asp:TextBox ID="pdateTextBox" runat="server" Text='<%# Bind("pdate") %>' />
                <br />
                id:
                <asp:TextBox ID="idTextBox" runat="server" Text='<%# Bind("id") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <EditRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <InsertItemTemplate>
                fname:
                <asp:TextBox ID="fnameTextBox" runat="server" Text='<%# Bind("fname") %>' />
                <br />
                lname:
                <asp:TextBox ID="lnameTextBox" runat="server" Text='<%# Bind("lname") %>' />
                <br />
                nif:
                <asp:TextBox ID="nifTextBox" runat="server" Text='<%# Bind("nif") %>' />
                <br />
                pdate:
                <asp:TextBox ID="pdateTextBox" runat="server" Text='<%# Bind("pdate") %>' />
                <br />
                id:
                <asp:TextBox ID="idTextBox" runat="server" Text='<%# Bind("id") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                fname:
                <asp:Label ID="fnameLabel" runat="server" Text='<%# Bind("fname") %>' />
                <br />
                lname:
                <asp:Label ID="lnameLabel" runat="server" Text='<%# Bind("lname") %>' />
                <br />
                nif:
                <asp:Label ID="nifLabel" runat="server" Text='<%# Bind("nif") %>' />
                <br />
                pdate:
                <asp:Label ID="pdateLabel" runat="server" Text='<%# Bind("pdate") %>' />
                <br />

                id:
                <asp:Label ID="idLabel" runat="server" Text='<%# Bind("id") %>' />
                <br />

            </ItemTemplate>
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
        </asp:FormView>
        
    
        <asp:Button ID="remover" runat="server" OnClick="remover_Click" Text="Remover" />
        <asp:XmlDataSource ID="XmlDataSource2" runat="server" DataFile="~/casas.xml" TransformFile="~/propdonos.xslt"></asp:XmlDataSource>
        <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/casas.xml" TransformFile="~/owners.xslt"></asp:XmlDataSource>
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
                <asp:BoundField DataField="nif" HeaderText="nif" SortExpression="nif" />
                <asp:BoundField DataField="fname" HeaderText="fname" SortExpression="fname" />
                <asp:BoundField DataField="lname" HeaderText="lname" SortExpression="lname" />
                <asp:BoundField DataField="pdate" HeaderText="pdate" SortExpression="pdate" />
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

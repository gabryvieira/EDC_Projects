<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add_owner.aspx.cs" Inherits="EDC2015_Trabalho2Parte2.add_owner" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Owner</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Button ID="Button3" runat="server" PostBackUrl="~/Owners.aspx" Text="Voltar" />
        <asp:XmlDataSource ID="XmlDataSource2" runat="server" DataFile="~/casas.xml"></asp:XmlDataSource>
    
        <br />
        Propriedades:<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="XmlDataSource2" DataTextField="id" DataValueField="id" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
        </asp:DropDownList>
    
    </div>
        <asp:FormView ID="FormView1" runat="server" AllowPaging="True" DataSourceID="XmlDataSource1" DefaultMode="Insert" OnItemInserting="FormView1_ItemInserting" CellPadding="4" ForeColor="#333333" Height="152px" Width="231px">
            <EditItemTemplate>
                nif:
                <asp:TextBox ID="nifTextBox" runat="server" Text='<%# Bind("nif") %>' />
                <br />
                fname:
                <asp:TextBox ID="fnameTextBox" runat="server" Text='<%# Bind("fname") %>' />
                <br />
                lname:
                <asp:TextBox ID="lnameTextBox" runat="server" Text='<%# Bind("lname") %>' />
                <br />
                pdate:
                <asp:TextBox ID="pdateTextBox" runat="server" Text='<%# Bind("pdate") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <InsertItemTemplate>
                nif:
                <asp:TextBox ID="nifTextBox" runat="server" Text='<%# Bind("nif") %>' />
                <br />
                fname:
                <asp:TextBox ID="fnameTextBox" runat="server" Text='<%# Bind("fname") %>' />
                <br />
                lname:
                <asp:TextBox ID="lnameTextBox" runat="server" Text='<%# Bind("lname") %>' />
                <br />
                pdate:
                <asp:TextBox ID="pdateTextBox" runat="server" Text='<%# Bind("pdate") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                nif:
                <asp:Label ID="nifLabel" runat="server" Text='<%# Bind("nif") %>' />
                <br />
                fname:
                <asp:Label ID="fnameLabel" runat="server" Text='<%# Bind("fname") %>' />
                <br />
                lname:
                <asp:Label ID="lnameLabel" runat="server" Text='<%# Bind("lname") %>' />
                <br />
                pdate:
                <asp:Label ID="pdateLabel" runat="server" Text='<%# Bind("pdate") %>' />
                <br />
            </ItemTemplate>
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        </asp:FormView >
        <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/casas.xml" EnableCaching="False" XPath="/properties/property/owner"></asp:XmlDataSource>
        <br />
        Propriedade:<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="XmlDataSource3" Visible="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None">
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
        <asp:XmlDataSource ID="XmlDataSource3" runat="server" DataFile="~/casas.xml"></asp:XmlDataSource>
    </form>
</body>
</html>

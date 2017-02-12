<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="edit_owner.aspx.cs" Inherits="EDC2015_Trabalho2Parte2.edit_owner" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Button ID="Button2" runat="server" PostBackUrl="~/Owners.aspx" Text="Voltar" />
    
        <asp:FormView ID="FormView1" runat="server" CellPadding="4" DataSourceID="XmlDataSource1" DefaultMode="Edit" ForeColor="#333333"
            onitemupdating="FormView1_ItemUpdating"  OnPageIndexChanging="FormView1_PageIndexChanging" AllowPaging="True" Height="173px" Width="225px">
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
        </asp:FormView>
        <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/casas.xml" XPath="/properties/property/owner"></asp:XmlDataSource>
        
    </div>
    </form>
</body>
</html>

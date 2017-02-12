<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add_propriedade.aspx.cs" Inherits="EDC2015_Trabalho2Parte2.add_propriedade" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Button ID="Button3" runat="server" PostBackUrl="~/propriedades.aspx" Text="Voltar" />
        <asp:FormView ID="FormView1" runat="server" CellPadding="4" DataSourceID="XmlDataSource1" 
            OnItemInserting="FormView1_ItemInserting" DefaultMode="Insert" ForeColor="#333333" Height="134px" Width="230px" OnPageIndexChanging="FormView1_PageIndexChanging">
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
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
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
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        </asp:FormView>
        <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/casas.xml"></asp:XmlDataSource>
    <div>
    
    </div>
    </form>
</body>
</html>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="displayReports.aspx.cs" Inherits="EDC2015_Trabalho1.Personal.displayReports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" Text="My sales" Font-Size="Large"></asp:Label>
    <br />
    <br />
    <asp:GridView CssClass="table table-striped table-hover" runat ="server" AutoGenerateColumns="False" DataKeyNames="title_id,ord_num,stor_id" DataSourceID="SqlDataSource1" Height="135px" Width="1000px">
        <Columns>
            <asp:BoundField DataField="title_id" HeaderText="title_id" ReadOnly="True" SortExpression="title_id" />
            <asp:BoundField DataField="ord_num" HeaderText="ord_num" ReadOnly="True" SortExpression="ord_num" />
            <asp:BoundField DataField="stor_id" HeaderText="stor_id" ReadOnly="True" SortExpression="stor_id" />
            <asp:BoundField DataField="ord_date" HeaderText="ord_date" SortExpression="ord_date" />
            <asp:BoundField DataField="qty" HeaderText="qty" SortExpression="qty" />
            <asp:BoundField DataField="payterms" HeaderText="payterms" SortExpression="payterms" />
        </Columns>

    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:pubsConnectionString1 %>" SelectCommand="getMySales" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter Name="Username" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    </asp:Content>
    

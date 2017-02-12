<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Course.aspx.cs" Inherits="EDC2015_Trabalho2.Course" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <asp:Label ID="LabelInfoCurso" runat="server" Text="Informação do curso" Font-Size="Large"></asp:Label>
    <br />
    <br />
    <asp:DetailsView ID="DetailsView1" CssClass="table table-striped table-hover" runat="server" DataSourceID="XmlInfoCourse" Height="100px" Width="1035px" AutoGenerateRows="False" GridLines="None" CellPadding="4" ForeColor="#333333" OnPageIndexChanging="DetailsView1_PageIndexChanging">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
        <EditRowStyle BackColor="#2461BF" />
        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="guid" HeaderText="guid" SortExpression="guid" />
            <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome" />
            <asp:BoundField DataField="codigo" HeaderText="codigo" SortExpression="codigo" />
            <asp:BoundField DataField="grau" HeaderText="grau" SortExpression="grau" />
            <asp:TemplateField HeaderText="saidas_profissionais" SortExpression="saidas_profissionais">
                <ItemTemplate>
                    <asp:Literal ID="Label1" runat="server" Text='<%# Bind("saidas_profissionais") %>'></asp:Literal>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="fase1" HeaderText="fase1" SortExpression="fase1" />
            <asp:BoundField DataField="fase2" HeaderText="fase2" SortExpression="fase2" />
            <asp:BoundField DataField="duracao" HeaderText="duracao" SortExpression="duracao" />
            <asp:TemplateField HeaderText="provas" SortExpression="provas">
                <ItemTemplate>
                    <asp:Literal ID="Label2" runat="server" Text='<%# Bind("provas") %>'></asp:Literal>
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
    </asp:DetailsView>
    <asp:XmlDataSource ID="XmlInfoCourse" runat="server" DataFile="~/EngenhariaQuimica.xml" TransformFile="~/infoCurso.xslt" OnTransforming="XmlInfoCourse_Transforming"></asp:XmlDataSource>
</asp:Content>

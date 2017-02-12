<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Courses.aspx.cs" Inherits="EDC2015_Trabalho2.Courses" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <asp:Label ID="LabelCursos" runat="server" Text="Lista de Cursos" Font-Size="Large"> </asp:Label>
    <br />
    <br />
    <asp:Label ID="Labeltipos" runat="server" Text="Tipos:"></asp:Label>

    <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" AutoPostBack="True" DataSourceID="XmlDataSource2" DataTextField="grau" 
         Width="376px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
    </asp:DropDownList>
    <br />
    <asp:Label ID="LabelLocais" runat="server" Text="Locais:"></asp:Label>

    <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server" DataSourceID="XmlDataSource3" DataTextField="local" DataValueField="local"  
        AutoPostBack="True" Width="480px" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged"></asp:DropDownList>

    <asp:XmlDataSource ID="XmlDataSource2" runat="server" DataFile="~/cursos.xml" TransformFile="~/cursos.xslt" XPath="cursos/curso[not(@grau=preceding::curso/@grau)]" EnableCaching="false"></asp:XmlDataSource>
    <asp:XmlDataSource ID="XmlDataSource3" runat="server" DataFile="~/cursos.xml" TransformFile="~/cursos.xslt" XPath="cursos/curso[not(@local=preceding::curso/@local)]"></asp:XmlDataSource>
    <br />
    <asp:GridView ID="GridView1" CssClass= "table table-striped table-hover" runat="server" AutoGenerateColumns="False" DataSourceID="XmlCourses" AllowSorting="True" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"><i class="fa fa-check-circle"></i></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
            </asp:TemplateField>
             <asp:HyperLinkField DataNavigateUrlFields="Guid" 
                DataNavigateUrlFormatString="~/Course?ID={0}" 
                DataTextField="guid" HeaderText="guid" Target="_blank" />
           
            <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome" />
            <asp:BoundField DataField="grau" HeaderText="grau" SortExpression="grau" />
            <asp:BoundField DataField="local" HeaderText="local" SortExpression="local" />
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="Black" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="Black" />
        <PagerStyle CssClass="pagination-ys" BackColor="#666666" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#999999" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
    <asp:XmlDataSource ID="XmlCourses" runat="server" DataFile="~/cursos.xml" TransformFile="~/cursos.xslt"></asp:XmlDataSource>
</asp:Content>

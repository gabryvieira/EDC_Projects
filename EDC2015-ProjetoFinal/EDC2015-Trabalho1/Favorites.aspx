<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Favorites.aspx.cs" Inherits="EDC2015_Trabalho1.Default1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2><i class="fa fa-star"></i>Interesses Pessoais</h2>
   <br />
    <br />
    <asp:GridView ID="GridView1" Visible="false" runat="server" AllowPaging="True" AutoGenerateColumns="False" CssClass= "table table-striped table-hover" EmptyDataText="There are no data records to display." DataKeyNames="category" DataSourceID="SqlDataSource1" Width="566px" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="Interesses Pessoais" SortExpression="category">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("category") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("category") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField ShowHeader="False">

                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update"><i class="fa fa-floppy-o"></i></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"><i class="fa fa-backward"></i></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"><i class="fa fa-pencil"></i></asp:LinkButton>
                    <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Select"><i class="fa fa-check-square-o"></i></asp:LinkButton>
                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete"><i class="fa fa-trash"></i></asp:LinkButton>
                    <asp:LinkButton ID="LinkButton5" runat="server" CausesValidation="False" CommandName="Insert new"><i class="fa fa-plus-circle"></i></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
         <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
         <PagerStyle CssClass="pagination-ys" BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />

    </asp:GridView>

    <%-- Repeater só com as categorias da gridview/BD/dropdown --%>
    <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <div class="col-lg-5 col-md-6 col-xs-12">
                   
                      <asp:Label Visible="false" runat="server" ID="Label1" 
                 Text='<%# Eval("Category") %>' />

                     <div class="well" style="background-image: url('images/<%# Eval("Category") %>.jpg')">
                     <h2><i class="fa fa-plus-square"></i>&nbsp;<asp:Button BorderColor="Transparent" BorderWidth="0" Text='<%# Eval("Category") %>' PostBackUrl='<%#"Categories/"+ Eval("Category").ToString()+"News.aspx" %>' ID="ReplyButton" DataField="category" CommandName="Edit" runat="server" BorderStyle="NotSet" /></h2><br /><br />
                      
                    </div>
                </div>  
            </ItemTemplate>
            
        </asp:Repeater>
    <div><div class="col-lg-5 col-md-6 col-xs-12"></div></div>
    <br />
    
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <div></div>
    <div><div class="col-lg-5 col-md-6 col-xs-12"><h3>Todas as Categorias</h3></div></div>
   
    <div></div>
    

    <%-- Repeater com tudo em baixo --%>
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="CategoriaSource" onitemcommand="rpt1_ItemCommand">
          
            <ItemTemplate>
                <div class="col-lg-5 col-md-6 col-xs-12">
                    <div class="well" style="background-image: url('<%#Eval("imagem") %>')">
                         <h2><i class="fa fa-plus-square"></i>&nbsp;<asp:Button  BorderColor="Transparent" BorderWidth="0" ID="ReplyButton" Text='<%#Eval("categoria") %>' CommandName="Edit" PostBackUrl='<%#"Categories/"+ Eval("categoria").ToString()+"News.aspx" %>' runat="server" BorderStyle="NotSet" /></h2><br /><br />
 
                        &nbsp;&nbsp;<asp:Button ID="btnApprove" runat="server" class="btn btn-success btn-sm" Text="Adicionar aos meus interesses" CommandArgument='<%# Eval("categoria")%>'/>                       
                    </div>
                </div>  
            </ItemTemplate>
            
        </asp:Repeater>
        <asp:XmlDataSource ID="CategoriaSource" runat="server" DataFile="~/categories.xml" TransformFile="~/categories.xslt"></asp:XmlDataSource>
        <div class="row"></div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [favoritesCategory]"  DeleteCommand="DELETE FROM [favoritesCategory] WHERE [category] = @category" InsertCommand="INSERT INTO [favoritesCategory] ([title]), VALUES (@title)"></asp:SqlDataSource>

    
    
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NoticiasFavoritas.aspx.cs" Inherits="EDC2015_Trabalho1.titles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [favoritesList]" UpdateCommand="UPDATE [favoritesList] SET [title] = @title, [link] = @link, [descricao] = @descricao, [categoria] = @categoria, [pubDate] = @pubDate WHERE [title] = @title" DeleteCommand="DELETE FROM [favoritesList] WHERE [title] = @title" InsertCommand="INSERT INTO [favoritesList] ([title], [link], [descricao], [categoria], [pubdate], [id_userfav]) VALUES (@title, @link, @descricao, @categoria, @pubdate, @id_userfav)"></asp:SqlDataSource>

    <br />
    <asp:Label ID="Label2" runat="server" Font-Size="Large" Text="Notícias Favoritas p/Categoria"></asp:Label>
    
    <br />
     <asp:DropDownList ID="DropDownList1" runat="server" Height="40px" Width="778px" DataSourceID="XmlDataSource1" DataTextField="categoria" DataValueField="categoria" AppendDataBoundItems="True" 
        AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass="form-control" Font-Bold="False">
    </asp:DropDownList>
    <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/categories.xml" TransformFile="~/categories.xslt" XPath="/categories/category[@categoria]"></asp:XmlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [favoritesList] WHERE ([categoria] = @category)" UpdateCommand="UPDATE [favoritesList] SET [title] = @title, [link] = @link, [descricao] = @descricao, [categoria] = @categoria, [pubDate] = @pubDate WHERE [title] = @title" DeleteCommand="DELETE FROM [favoritesList] WHERE [title] = @title" InsertCommand="INSERT INTO [favoritesList] ([title], [link], [descricao], [categoria], [pubdate], [id_userfav]) VALUES (@title, @link, @descricao, @categoria, @pubdate, @id_userfav)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="category" PropertyName="SelectedValue" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="title" />
            <asp:Parameter Name="link" />
            <asp:Parameter Name="descricao" />
            <asp:Parameter Name="categoria" />
            <asp:Parameter Name="pubDate" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <br />

   
    
   <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource4">
        <ItemTemplate>
                <div class="col-lg-5 col-md-6 col-xs-12" >
                    <div class="well" style="background-image: url('images/<%#Eval("categoria") %>.jpg'); min-height:250px;">
                            <h4><a href="<%# Eval("link") %>"><%# Eval("title"+"   ") %>&nbsp<i class="fa fa-star-o"></i><a href="Default.aspx"></a> </a></h4>                       
                                          <small><i class="fa fa-info"></i> &nbsp; <%# Eval("descricao") %> <a href="<%# Eval("link") %>"> Ver mais...</small>  <br />
                        <!--BOTÃO  TWITTER-->
                        <br>
                            <a class="fa fa-twitter share-base share-twitter" onclick="window.open('https://twitter.com/intent/tweet?text=<%# Eval("link") %>')">&nbsp&nbsp Tweet &nbsp&nbsp </a>
                        <a class="fa fa-facebook share-base share-facebook" onclick="window.open('https://www.facebook.com/sharer/sharer.php?u=<%# Eval("link") %>')">acebook &nbsp&nbsp</a> 
                        <a class="fa fa-linkedin share-base share-linked-in spacing-left-5" onclick="window.open('https://www.linkedin.com/cws/share?url=<%# Eval("link") %>')">&nbsp&nbsp Likedin</a>
          
                    </div>
                </div>
                </ItemTemplate>
            </asp:Repeater>
    
    <br />
    <br />
    <br />
    <br />
     <div><div class="col-lg-5 col-md-6 col-xs-12"></div></div>
    <div><div class="col-lg-5 col-md-6 col-xs-12"><h3>Notícias Favoritas</h3></div></div>
   
    <div></div>
   
    <br />
    <br />

   <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource5"  >
        <ItemTemplate>

                <div class="col-lg-5 col-md-6 col-xs-12" >
                    <div class="well" style="background-image: url('images/<%#Eval("categoria") %>.jpg'); min-height:250px;">
                            <h4><a href="<%# Eval("link") %>"><%# Eval("title"+"   ") %>&nbsp<i class="fa fa-star-o"></i><a href="Default.aspx"></a> </a></h4>                       
                                           <small><i class="fa fa-info"></i> &nbsp; <%# Eval("descricao") %> <a href="<%# Eval("link") %>"> Ver mais...</small>  <br />
                         <br />
                        <!--BOTÃO  TWITTER-->
                        <br>
                            <a class="fa fa-twitter share-base share-twitter" onclick="window.open('https://twitter.com/intent/tweet?text=<%# Eval("link") %>')">&nbsp&nbsp Tweet &nbsp&nbsp </a>
                        <a class="fa fa-facebook share-base share-facebook" onclick="window.open('https://www.facebook.com/sharer/sharer.php?u=<%# Eval("link") %>')">acebook &nbsp&nbsp</a> 
                        <a class="fa fa-linkedin share-base share-linked-in spacing-left-5" onclick="window.open('https://www.linkedin.com/cws/share?url=<%# Eval("link") %>')">&nbsp&nbsp Likedin</a>
          
                    </div>
                </div>
                </ItemTemplate>
            </asp:Repeater>  
    <br />
  <div class="row"></div> 
</asp:Content>

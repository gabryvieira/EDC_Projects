<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DesportoNews.aspx.cs" Inherits="EDC2015_Trabalho1.DesportoNews" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="http://www.zerozero.pt/rss/noticias.php" TransformFile="~/feedinfo.xslt"></asp:XmlDataSource>

     <asp:Repeater ID="Repeater1" runat="server" DataSourceID="XmlDataSource1" onitemcommand="rpt1_ItemCommand">
                <HeaderTemplate>
                    <h2> 
                        Notícias Desporto
                    </h2> 
                    <hr />
                </HeaderTemplate>
                <ItemTemplate>
            <asp:TextBox Visible="false" runat="server" ID="TextBox1" 
                 Text='<%# Eval("title") %>' />

            <asp:TextBox Visible="false" runat="server" ID="TextBox2" 
                 Text='<%# Eval("link") %>' />

            <asp:TextBox Visible="false" runat="server" ID="TextBox3" 
                 Text='<%# Eval("description") %>' />

            <asp:TextBox Visible="false" runat="server" ID="TextBox4" 
                 Text='<%# Eval("category") %>' />

            <asp:TextBox Visible="false" runat="server" ID="TextBox5" 
                 Text='<%# Eval("pubdate") %>' />
                <div class="col-lg-5 col-md-6 col-xs-12" >
                    <div class="well" style="background-image:url(../images/Desporto.jpg); min-height: 260px;" >
                            <h4><a href="<%# Eval("link") %>"><%# Eval("title") %></a> &nbsp  </h4>                     
                            <small><i class="fa fa-calendar"></i> &nbsp; <%# Eval("pubDate") %></small><br /> 
                            <small><i class="fa fa-info"></i> &nbsp; <%# Eval("description") %></small>  <br />
                            <br />
                            <asp:Button ID="btnApprove" runat="server" class="btn btn-success btn-sm" Text="Adicionar aos favoritos" CommandArgument='<%# Eval("title") + "," + Eval("link") + "," + Eval("description") + "," + Eval("category") + "," + Eval("pubDate") %>'/>
                                                  
                    </div>
                </div>
                </ItemTemplate>
            </asp:Repeater>
           
            <asp:XmlDataSource ID="XmlDataSource2" runat="server" DataFile="http://feeds.jn.pt/JN-Desporto" TransformFile="~/feedinfo.xslt"></asp:XmlDataSource>
            <br />
            <asp:XmlDataSource ID="XmlDataSource3" runat="server" DataFile="http://feeds.ojogo.pt/OJ-Ultimas" TransformFile="~/feedinfo.xslt"></asp:XmlDataSource>
    <div class="row"></div>
</asp:Content>

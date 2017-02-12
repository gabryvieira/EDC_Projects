<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EconomiaNews.aspx.cs" Inherits="EDC2015_Trabalho1.EconomiaNews" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <asp:Repeater ID="Repeater1" runat="server" DataSourceID="XmlDataSource1">
                <HeaderTemplate>
                    <h2> 
                        Notícias Economia
                    </h2> 
                    <hr />
                </HeaderTemplate>
                <ItemTemplate>
                <div class="col-lg-4 col-md-6 col-xs-12" >
                    <div class="well" style="min-height:300px">
                        
                            <h4><a href="<%# Eval("link") %>"><%# Eval("title") %></a><a href="EconomiaNews.aspx"><i class="fa fa-star-o"></i></a> </h4>                     
                            <small><i class="fa fa-calendar"></i> &nbsp; <%# Eval("pubDate") %></small><br /> 
                            <small><i class="fa fa-info"></i> &nbsp; <%# Eval("description") %></small>  <br />
                                                  
                    </div>
                </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="http://feeds.jn.pt/JN-Economia" TransformFile="~/feedinfo.xslt" XPath="/channel/item[position()&lt;7]"></asp:XmlDataSource>
            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="XmlDataSource2">
                <HeaderTemplate>
                    <h2> 
                        <small>
                            <asp:Label ID="SportNews2" runat="server"></asp:Label>
                        </small> 
                    </h2> 
                    <hr />
                </HeaderTemplate>
                <ItemTemplate>
                <div class="col-lg-4 col-md-6 col-xs-12" >
                    <div class="well" style="min-height:300px">
                        
                            <h4><a href="<%# Eval("link") %>"><%# Eval("title") %></a><a href="DesportoNews.aspx"><i class="fa fa-star-o"></i></a> </h4></h4>                       
                            <small><i class="fa fa-calendar"></i> &nbsp; <%# Eval("pubDate") %></small><br /> 
                            <small><i class="fa fa-info"></i> &nbsp; <%# Eval("description") %></small>  <br />
                    </div>
                </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:XmlDataSource ID="XmlDataSource2" runat="server" DataFile="http://a-bola.webnode.pt/rss/noticias.xml" TransformFile="~/feedinfo.xslt"></asp:XmlDataSource>
            <br />
            <asp:Repeater ID="Repeater3" runat="server" DataSourceID="XmlDataSource3">
                <HeaderTemplate>
                    <h2> 
                        <small>
                            <asp:Label ID="SportNews3" runat="server"></asp:Label>
                        </small> 
                    </h2> 
                    <hr />
                </HeaderTemplate>
                <ItemTemplate>
                <div class="col-lg-4 col-md-6 col-xs-12" >
                    <div class="well" style="min-height:250px">
                        
                            <h4><a href="<%# Eval("link") %>"><%# Eval("title") %></a><a href="DesportoNews.aspx"><i class="fa fa-star-o"></i></a> </>   </h4>                       
                            <small><i class="fa fa-calendar"></i> &nbsp; <%# Eval("pubDate") %></small><br /> 
                            <small><i class="fa fa-info"></i> &nbsp; <%# Eval("description") %></small>  <br />
                                               
                    </div>
                </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:XmlDataSource ID="XmlDataSource3" runat="server" DataFile="http://feeds.ojogo.pt/OJ-Ultimas" TransformFile="~/feedinfo.xslt"></asp:XmlDataSource>
    <div class="row"></div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CulturaNews.aspx.cs" Inherits="EDC2015_Trabalho1.CulturaNews" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="XmlDataSource1">
                <HeaderTemplate>
                    <h2> 
                        Notícias Cultura
                    </h2> 
                    <hr />
                </HeaderTemplate>
                <ItemTemplate>
                <div class="col-lg-4 col-md-6 col-xs-12" >
                    <div class="well" style="min-height:250px">
                        
                            <h4><a href="<%# Eval("link") %>"><%# Eval("title") %></a><a href="EconomiaNews.aspx"><i class="fa fa-star-o"></i></a> </h4>                     
                            <small><i class="fa fa-calendar"></i> &nbsp; <%# Eval("pubDate") %></small><br /> 
                            <small><i class="fa fa-info"></i> &nbsp; <%# Eval("description") %></small>  <br />
                                                  
                    </div>
                </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="http://feeds.jn.pt/JN-Cultura" TransformFile="~/feedinfo.xslt"></asp:XmlDataSource>
           <div class="row"></div> 
</asp:Content>

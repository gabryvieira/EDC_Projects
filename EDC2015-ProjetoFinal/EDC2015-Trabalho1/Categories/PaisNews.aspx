<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PaisNews.aspx.cs" Inherits="EDC2015_Trabalho1.Categories.PaisNews" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
       <asp:Repeater ID="Repeater1" runat="server" DataSourceID="XmlDataSource1" onitemcommand="rpt1_ItemCommand">
                <HeaderTemplate>
                    <h2> 
                        Notícias País
                    </h2> 
                    <hr />
                </HeaderTemplate>
                <ItemTemplate>
                <div class="col-lg-5 col-md-6 col-xs-12" >
                    <div class="well" style="background-image:url(../images/Pais.jpg)">
                        
                            <h4><a href="<%# Eval("link") %>"><%# Eval("title") %></a>&nbsp</a> </h4>                     
                            <small><i class="fa fa-calendar"></i> &nbsp; <%# Eval("pubDate") %></small><br /> 
                            <small><i class="fa fa-info"></i> &nbsp; <%# Eval("description") %></small>  <br />
                             </br>
                         <asp:Button ID="btnApprove" runat="server" class="btn btn-success btn-sm" Text="Adicionar aos favoritos" CommandArgument='<%# Eval("title") + "," + Eval("link") + "," + Eval("description") + "," + Eval("category") + "," + Eval("pubDate") %>'/>                                                                
                    </div>
                </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="http://feeds.jn.pt/JN-Pais" TransformFile="~/feedinfo.xslt"></asp:XmlDataSource>
           <div class="row"></div> 
</asp:Content>

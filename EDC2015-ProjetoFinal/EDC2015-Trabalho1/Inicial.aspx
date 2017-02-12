<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inicial.aspx.cs" Inherits="WebApplication1.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server" >
    
    <h2><i class="fa fa-newspaper-o"></i> Feed News</h2>


   
     <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="http://feeds.feedburner.com/PublicoRSS?formal=xml" TransformFile="~/feedheader.xslt"></asp:XmlDataSource>
     <asp:XmlDataSource ID="XmlDataSource2" runat="server" DataFile="~/feedList.xml"></asp:XmlDataSource>
    <asp:XmlDataSource ID="XmlDataSource3" runat="server" DataFile="http://feeds.feedburner.com/PublicoRSS?format=xml" XPath="/feedinfo/title[position()&lt;4]" TransformFile="~/feedinfoInicial.xslt" EnableCaching="False"> </asp:XmlDataSource>
    <asp:XmlDataSource ID="XmlDataSource4" runat="server" DataFile="http://feeds.feedburner.com/PublicoRSS?format=xml" TransformFile="~/image.xslt" EnableCaching="False"></asp:XmlDataSource>

    <asp:XmlDataSource ID="XmlDataSource32" runat="server" DataFile="http://feeds.jn.pt/JN-Destaques" XPath="channel/item[position()&lt;7]" TransformFile="~/feedinfoInicial.xslt" EnableCaching="False"  ></asp:XmlDataSource>
    <asp:XmlDataSource ID="XmlDataSource322" runat="server" DataFile="http://feeds.jn.pt/JN-Destaques" TransformFile="~/image.xslt" EnableCaching="False"></asp:XmlDataSource>

    <asp:XmlDataSource ID="XmlDataSource31" runat="server" DataFile="http://economico.sapo.pt/rss/ultimas.html" XPath="channel/item[position()&lt;7]" TransformFile="~/feedinfoInicial.xslt" EnableCaching="False" ></asp:XmlDataSource>
    
     <asp:XmlDataSource ID="XmlDataSource33" runat="server" DataFile="http://expressoemprego.pt/rss/ultimas-ofertas" XPath="channel/item[position()&lt;7]" EnableCaching="False" TransformFile="~/feedinfoInicial.xslt" ></asp:XmlDataSource>
     <asp:XmlDataSource ID="XmlDataSource333" runat="server" DataFile="http://expressoemprego.pt/rss/ultimas-ofertas" TransformFile="~/image.xslt" EnableCaching="False"></asp:XmlDataSource>

    <asp:XmlDataSource ID="XmlDataSource34" runat="server" DataFile="http://a-bola.webnode.pt/rss/all.xml" XPath="channel/item[position()&lt;7]" TransformFile="~/feedinfoInicial.xslt" EnableCaching="False" ></asp:XmlDataSource>
   

    <%--<h3>Feed News    <asp:Label runat="server" ID="label1" ></asp:Label> </h3>--%>


   <asp:Repeater ID="Repeater1" runat="server" DataSourceID="XmlDataSource32">
        <ItemTemplate>
      
                <div class="col-lg-5 col-md-6 col-xs-12" >
                    <div class="well" style="background-image: url('images/<%#Eval("category") %>.jpg'); min-height:250px;">
                        
                            <h4><a href="<%# Eval("link") %>"><%# Eval("title"+"   ") %>&nbsp<a href="Inicial.aspx"></a> </a></h4>                       
                             <small><i class="fa fa-calendar"></i> &nbsp; <%# Eval("pubDate") %></small><br /> 
                            <small><i class="fa fa-info"></i> &nbsp; <%# Eval("description") %> <a href="<%# Eval("link") %>"> Ver mais...</small>  <br />
                            <br>
                         <!--BOTÃO  TWITTER-->
                            <a class="fa fa-twitter share-base share-twitter" onclick="window.open('https://twitter.com/intent/tweet?text=<%# Eval("link") %>')">Tweet &nbsp&nbsp  </a>
                        <a class="fa fa-facebook share-base share-facebook" onclick="window.open('https://www.facebook.com/sharer/sharer.php?u=<%# Eval("link") %>')">acebook  &nbsp&nbsp </a>
                        <a class="fa fa-linkedin share-base share-linked-in spacing-left-5" onclick="window.open('https://www.linkedin.com/cws/share?url=<%# Eval("link") %>')">&nbsp&nbsp Likedin</a>

                                                 
                    </div>
                </div>
                </ItemTemplate>
            </asp:Repeater>

            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="XmlDataSource31">
                
                <ItemTemplate>
                <div class="col-lg-5 col-md-6 col-xs-12" >
                    <div class="well" style="background-image: url('images/<%#Eval("category") %>.jpg'); min-height:250px;">
                        
                            <small><i class="fa fa-calendar"></i> &nbsp; <%# Eval("pubDate") %></small><br /> 
                            <h4><a href="<%# Eval("link") %>"><%# Eval("title"+"   ") %>&nbsp<a href="Inicial.aspx"></a>  </a></h4>                       
                             <small><i class="fa fa-info"></i> &nbsp; <%# Eval("description") %> <a href="<%# Eval("link") %>"> Ver mais...</small>  <br />

                          <!--BOTÃO  TWITTER-->
                        <br>
                            <a class="fa fa-twitter share-base share-twitter" onclick="window.open('https://twitter.com/intent/tweet?text=<%# Eval("link") %>')">Tweet &nbsp&nbsp </a>
                        <a class="fa fa-facebook share-base share-facebook" onclick="window.open('https://www.facebook.com/sharer/sharer.php?u=<%# Eval("link") %>')">acebook &nbsp&nbsp</a>
                         <a class="fa fa-linkedin share-base share-linked-in spacing-left-5" onclick="window.open('https://www.linkedin.com/cws/share?url=<%# Eval("link") %>')">&nbsp&nbsp Likedin</a>
             
                    </div>
                </div>
                </ItemTemplate>
            </asp:Repeater>
            <br />

            <asp:Repeater ID="Repeater3" runat="server" DataSourceID="XmlDataSource3">

                <ItemTemplate>
                <div class="col-lg-5 col-md-6 col-xs-12" >
                    <div class="well" style="background-image: url('images/<%#Eval("category") %>.jpg'); min-height:250px;">
                           
                        <small><i class="fa fa-calendar"></i> &nbsp; <%# Eval("pubDate") %></small><br /> 
                            <h4><a href="<%# Eval("link") %>"><%# Eval("title"+"   ") %>&nbsp<a href="Inicial.aspx"></a>      </a></h4>   
                          
                                                    <small><i class="fa fa-info"></i> &nbsp; <%# Eval("description") %> <a href="<%# Eval("link") %>"> Ver mais...</small>  <br />
                        <!--BOTÃO  TWITTER-->
                        <br>
                            <a class="fa fa-twitter share-base share-twitter" onclick="window.open('https://twitter.com/intent/tweet?text=<%# Eval("link") %>')">Tweet &nbsp&nbsp </a>
                        <a class="fa fa-facebook share-base share-facebook" onclick="window.open('https://www.facebook.com/sharer/sharer.php?u=<%# Eval("link") %>')">acebook &nbsp&nbsp</a>                    
                        <a class="fa fa-linkedin share-base share-linked-in spacing-left-5" onclick="window.open('https://www.linkedin.com/cws/share?url=<%# Eval("link") %>')">&nbsp&nbsp Likedin</a>
             
                    </div>
                </div>
                </ItemTemplate>
            </asp:Repeater>
    <div class="row"></div>

    
    </asp:Content>

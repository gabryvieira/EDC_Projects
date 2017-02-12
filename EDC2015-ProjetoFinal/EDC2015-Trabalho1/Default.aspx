<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EDC2015_Trabalho1.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Menu Principal</h2>
   <br />
        
                <div class="col-lg-5 col-md-6 col-xs-12">
                    <div class="well" style="background-image: url('images/Interesses.jpg')">
                         <h2><i class="fa fa-plus-square"></i>&nbsp;<asp:Button runat="server"  BorderColor="Transparent" BorderWidth="0" Text='Interesses' CommandName="Edit" PostBackUrl="~/Favorites.aspx" /></h2><br /><br />

                    </div>
                </div>  

    <div class="col-lg-5 col-md-6 col-xs-12">
                    <div class="well" style="background-image: url('images/news.jpg')">
                         <h2><i class="fa fa-plus-square"></i>&nbsp;<asp:Button runat="server"   BorderColor="Transparent" BorderWidth="0" Text='Destaques' CommandName="Edit" PostBackUrl="~/Destaques.aspx" /></h2><br /><br />

                    </div>
                </div>  
    
    <div class="col-lg-5 col-md-6 col-xs-12">
        <div class="well" style="background-image: url('images/noticiasgravadas.jpg')">
                         <h2><i class="fa fa-plus-square"></i>&nbsp;<asp:Button runat="server"   BorderColor="Transparent" BorderWidth="0" Text='Notícias Favoritas' CommandName="Edit" PostBackUrl="~/NoticiasFavoritas.aspx" /></h2><br /><br />
                    </div>
                </div>  
    <div class="col-lg-5 col-md-6 col-xs-12">
            <div class="well" style="background-image: url('images/edit.jpg')">
                 <h2><i class="fa fa-plus-square"></i>&nbsp;<asp:Button runat="server"   BorderColor="Transparent" BorderWidth="0" Text='Editar perfil' CommandName="Edit" PostBackUrl="~/Account/Manage.aspx" /></h2><br /><br />

                    </div>
                </div>  
            
        <div class="row"></div>
    
</asp:Content>

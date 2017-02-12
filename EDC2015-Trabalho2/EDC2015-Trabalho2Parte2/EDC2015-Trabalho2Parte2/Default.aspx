<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EDC2015_Trabalho2Parte2._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-md-4">
            <h2>Manage properties:</h2>
            <p>
            <asp:ImageButton ID="ImageButton1"  runat="server" ImageAlign="Middle"  ImageUrl="http://www.didsburyproperty.com/wp-content/uploads/2015/07/House_with_Keys.jpg" PostBackUrl="~/propriedades.aspx" />
            </p>
            
        </div>
        <div>
            <div class="col-md-4">
            </div>

        </div>
        <div class="col-md-4">
            <h2>Manage Owners:</h2>
            <p>
               <asp:ImageButton ID="ImageButton2" runat="server" ImageAlign="Middle" ImageUrl="http://www.stablecommunities.org/sites/all/files/images/House%20Exchange.png" PostBackUrl="~/Owners.aspx" />
            </p>
        </div>
    </div>

</asp:Content>

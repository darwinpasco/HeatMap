<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HeatMap._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

   <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <div class="row">
                <div class="col-md-6">
                    <h2>iBeacon Maps</h2>
                    <div class="thumbnail">
                        <img class="img-responsive" src="Maps/Figures/Level6_rotated.png" />
                        
                    </div>
                    <p>
                        <a class="btn btn-primary btn-lg" href="Maps/main.aspx">View Heat Map</a>
                    </p>
                </div>
                <div class="col-md-6">
                    <h2>Indoor Atlas Maps</h2>
                    <div class="thumbnail">
                        <img class="img-responsive" src="Maps/Figures/5th_Floor_Image_Overlay.png"/>
                    </div>
                    <p>
                        <a class="btn btn-primary btn-lg" href="Maps/TektiteEastMain.aspx">View Heat Map</a>
                    </p>
                </div>
                <%--<div class="col-md-4">
                    <h2>Level 7 East Hall</h2>
                    <div class="thumbnail">
                        <img class="img-responsive" src="Maps/Figures/Level7_rotated.png" />
                    </div>
                    <p>
                        <a class="btn btn-primary btn-lg" href="http://go.microsoft.com/fwlink/?LinkId=301950">View Heat Map</a>
                    </p>
                </div>--%>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

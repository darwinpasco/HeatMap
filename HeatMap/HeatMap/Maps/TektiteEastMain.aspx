<%@ Page Title="" Language="C#" MasterPageFile="~/Maps/main.Master" AutoEventWireup="true" CodeBehind="TektiteEastMain.aspx.cs" Inherits="HeatMap.Maps.TektiteEastMain" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <h2><%: Title %></h2>
            <p class="text-danger">
                <asp:Label ID="Message" runat="server"></asp:Label>
            </p>
            <div class="row">
                <div class="col-md-4">                   
                    <h2>Level 5 East Tower</h2>
                    <div class="thumbnail">
                        <asp:Label runat="server" AssociatedControlID="txtStartDate5ET">Start Date</asp:Label>
                        <asp:TextBox runat="server" ID="txtStartDate5ET" CssClass="form-control" TextMode="Date" />                                                                  
                        <asp:Label runat="server" AssociatedControlID="txtEndDate5ET">End Date</asp:Label>
                        <asp:TextBox runat="server" ID="txtEndDate5ET" CssClass="form-control" TextMode="Date" />
                        <asp:Button ID="btnSet5ET" runat="server" class="btn btn-primary btn-sm" Text="Set Date Range" OnClick="btnSet5ET_Click" />                                                                  
                        <iframe id="frame1" class="col-lg-12 col-md-12 col-sm-12" src="PSELevel5_EastTower.aspx" height="300"></iframe>
                    </div>
                    <p>
                        <a class="btn btn-primary btn-sm" href="PSELevel5_EastTower.aspx" target="_blank">View Full Page</a>
                    </p>      
                </div>
                <div class="col-md-4">
                    <h2>Device Tracker</h2>
                    <div class="thumbnail">     
                        <asp:Label runat="server" AssociatedControlID="txtStartDate6WH">Start Date</asp:Label>
                        <asp:TextBox runat="server" ID="txtStartDate6WH" CssClass="form-control" TextMode="Date" />                                                                  
                        <asp:Label runat="server" AssociatedControlID="txtEndDate6WH">End Date</asp:Label>
                        <asp:TextBox runat="server" ID="txtEndDate6WH" CssClass="form-control" TextMode="Date" />
                        <asp:Button ID="btnSetWH" runat="server" class="btn btn-primary btn-sm" Text="Set Date Range" OnClick="btnSetWH_Click"/>                                                                                     
                        <iframe id="frame2" class="col-lg-12 col-md-12 col-sm-12" src="MultipleDeviceTracker.aspx" height="300"></iframe>
                    </div>
                    <p>
                        <a class="btn btn-primary btn-sm" href="MultipleDeviceTracker.aspx" target="_blank">View Full Page</a>
                    </p>      
                </div>
                <div class="col-md-4">
                    <h2>Nothing Here</h2>
                    <div class="thumbnail">
                        <asp:Label runat="server" AssociatedControlID="txtStartDate7EH">Start Date</asp:Label>
                        <asp:TextBox runat="server" ID="txtStartDate7EH" CssClass="form-control" TextMode="Date" />                                                                  
                        <asp:Label runat="server" AssociatedControlID="txtEndDate7EH">End Date</asp:Label>
                        <asp:TextBox runat="server" ID="txtEndDate7EH" CssClass="form-control" TextMode="Date" />
                        <asp:Button ID="btnSet7EH" runat="server" class="btn btn-primary btn-sm" Text="Set Date Range" OnClick="btnSet7EH_Click"/>                        
                        <iframe id="frame3" class="col-lg-12 col-md-12 col-sm-12" src="WebForm1.aspx" height="300"></iframe>
                    </div>
                    <p>
                        <a class="btn btn-primary btn-sm" href="HKIALevel7_EastHall.aspx" target="_blank">View Full Page</a>
                    </p>      
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

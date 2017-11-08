<%@ Page Title="" Language="C#" MasterPageFile="~/Maps/main.Master" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="HeatMap.Maps.Main" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <h2><%: Title %></h2>
            <p class="text-danger">
                <asp:Label ID="Message" runat="server"></asp:Label>
            </p>
            <div class="row">
                <div class="col-md-4">                   
                    <h2>Level 6 East Hall</h2>
                    <div class="thumbnail">
                        <asp:Label runat="server" AssociatedControlID="txtStartDate6EH">Start Date</asp:Label>
                        <asp:TextBox runat="server" ID="txtStartDate6EH" CssClass="form-control" TextMode="Date" />                                                                  
                        <asp:Label runat="server" AssociatedControlID="txtEndDate6EH">End Date</asp:Label>
                        <asp:TextBox runat="server" ID="txtEndDate6EH" CssClass="form-control" TextMode="Date" />
                        <asp:Button ID="btnSet6EH" runat="server" class="btn btn-primary btn-sm" Text="Set Date Range" OnClick="btnSet6EH_Click" />                                                                  
                        <iframe id="frame1" class="col-lg-12 col-md-12 col-sm-12" src="HKIALevel6_EastHall.aspx" height="300"></iframe>
                    </div>
                    <p>
                        <a class="btn btn-primary btn-sm" href="HKIALevel6_EastHall.aspx" target="_blank">View Full Page</a>
                    </p>      
                </div>
                <div class="col-md-4">
                    <h2>Level 6 West Hall</h2>
                    <div class="thumbnail">     
                        <asp:Label runat="server" AssociatedControlID="txtStartDate6WH">Start Date</asp:Label>
                        <asp:TextBox runat="server" ID="txtStartDate6WH" CssClass="form-control" TextMode="Date" />                                                                  
                        <asp:Label runat="server" AssociatedControlID="txtEndDate6WH">End Date</asp:Label>
                        <asp:TextBox runat="server" ID="txtEndDate6WH" CssClass="form-control" TextMode="Date" />
                        <asp:Button ID="btnSetWH" runat="server" class="btn btn-primary btn-sm" Text="Set Date Range" OnClick="btnSetWH_Click"/>                                                                                     
                        <iframe id="frame2" class="col-lg-12 col-md-12 col-sm-12" src="HKIALevel6_WestHall.aspx" height="300"></iframe>
                    </div>
                    <p>
                        <a class="btn btn-primary btn-sm" href="HKIALevel6_WestHall.aspx" target="_blank">View Full Page</a>
                    </p>      
                </div>
                <div class="col-md-4">
                    <h2>Level 7 East Hall</h2>
                    <div class="thumbnail">
                        <asp:Label runat="server" AssociatedControlID="txtStartDate7EH">Start Date</asp:Label>
                        <asp:TextBox runat="server" ID="txtStartDate7EH" CssClass="form-control" TextMode="Date" />                                                                  
                        <asp:Label runat="server" AssociatedControlID="txtEndDate7EH">End Date</asp:Label>
                        <asp:TextBox runat="server" ID="txtEndDate7EH" CssClass="form-control" TextMode="Date" />
                        <asp:Button ID="btnSet7EH" runat="server" class="btn btn-primary btn-sm" Text="Set Date Range" OnClick="btnSet7EH_Click"/>                        
                        <iframe id="frame3" class="col-lg-12 col-md-12 col-sm-12" src="HKIALevel7_EastHall.aspx" height="300"></iframe>
                    </div>
                    <p>
                        <a class="btn btn-primary btn-sm" href="HKIALevel7_EastHall.aspx" target="_blank">View Full Page</a>
                    </p>      
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

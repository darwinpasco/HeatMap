<%@ Page Title="" Language="C#" MasterPageFile="~/Maps/main.Master" AutoEventWireup="true" CodeBehind="DeviceFinder.aspx.cs" Inherits="HeatMap.Maps.DeviceFinder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <h2><asp:Label ID="Label2"  runat="server" Font-Size="Larger" ForeColor="#009933"><%: Title %></asp:Label></h2>
            <p class="text-danger">
                <asp:Label ID="Message" runat="server"></asp:Label>
            </p>

            <div class="form-horizontal">
                <h2></h2>
                <hr />
                <div class="form-inline">
                    <asp:Label runat="server" AssociatedControlID="txtDeviceId" CssClass="col-md-3 control-label">Device ID:</asp:Label>
                    <div class="col-md-9">
                        <asp:TextBox runat="server" ID="txtDeviceId" CssClass="form-control" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtDeviceId"
                                CssClass="text-danger" ErrorMessage="Device Id is required." />
                    </div>                    
                </div>
                <div class="form-inline">
                    <div class="col-md-offset-3 col-md-9"  >
                        <p></p>
                        <asp:Button runat="server"  Text="Submit" CssClass="btn btn-primary btn-lg" ID="btnSubmit" OnClick="btnSubmit_Click" />                        
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
            <div class="modal1">
                <div class="center1">
                    <img alt="" src="../Images/Processing.gif" />
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Maps/main.Master" AutoEventWireup="true" CodeBehind="DeviceFound.aspx.cs" Inherits="HeatMap.Maps.DeviceFound" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script
src="http://maps.googleapis.com/maps/api/js">
</script>

<script>
    var strJSON;
    var latitude;
    var longitude;
    var venueid;
    var floorplanid;
    var floorid;
          
    GetLatLong();              
    function GetLatLong(){          
        strJSON =  <%=GetDeviceLastKnownLocation(Session["SearchDeviceID"].ToString())%>;   
        
    }      
    latitude = strJSON.Latitude;
    longitude = strJSON.Longitude;
    venueid = strJSON.VenueId;
    floorplanid = strJSON.FloorplanId;
    floorid = strJSON.FloorId;
</script>
<script>
    overlay.prototype = new google.maps.OverlayView(); 

    function overlay(bounds, image, map) {
        this.bounds_ = bounds;
        this.image_ = image;
        this.map_ = map;
        this.div_ = null;
        this.setMap(map); }

    overlay.prototype.onAdd = function() {
        var div = document.createElement("div");
        div.style.borderStyle = "none";
        div.style.borderWidth = "0px";
        div.style.position = "absolute";
        var img = document.createElement("img");
        img.src = this.image_;
        img.style.width = "100%";
        img.style.height = "100%";
        img.style.position = "absolute";
        div.appendChild(img);
        this.div_ = div;
        this.div_.style.opacity = 1;
        var panes = this.getPanes();
        panes.overlayLayer.appendChild(div);}

    overlay.prototype.draw = function() {
        var overlayProjection = this.getProjection();
        var sw = overlayProjection.fromLatLngToDivPixel(this.bounds_.getSouthWest());
        var ne = overlayProjection.fromLatLngToDivPixel(this.bounds_.getNorthEast());
        var div = this.div_;
        div.style.left = sw.x + "px";
        div.style.top = ne.y + "px";
        div.style.width = (ne.x - sw.x) + "px";
        div.style.height = (sw.y - ne.y) + "px";} 

    overlay.prototype.onRemove = function() { 
        this.div_.parentNode.removeChild(this.div_); 
        this.div_ = null; 
    } 

    overlay.prototype.hide = function() { if (this.div_) { this.div_.style.visibility = "hidden";} } 

    overlay.prototype.show = function() {if (this.div_) {  this.div_.style.visibility = "visible";}} 

    overlay.prototype.toggle = function() { 
        if (this.div_) { 
            if (this.div_.style.visibility == "hidden") {  
                this.show(); 
            } else { 
                this.hide(); } } }   

    overlay.prototype.toggleDOM = function() {
        if (this.getMap()) {
            this.setMap(null);
        } else {
            this.setMap(this.map_);}}


    var marker 
    var map 
    var overlay;       
    
    var myCenter= new google.maps.LatLng(latitude, longitude)//(14.5825643418301,121.062005463365);
 
function initialize()
{
var mapProp = {
  center:myCenter,
  zoom:19,
  mapTypeId:google.maps.MapTypeId.ROADMAP,
    disableDefaultUI: false  ,
    disableDoubleClickZoom: false  ,
    draggable: true  ,
    keyboardShortcuts:  true  ,
    mapTypeControlOptions: {style: google.maps.MapTypeControlStyle.DEFAULT}  ,
    navigationControl: true  ,
    navigationControlOptions: {style: google.maps.NavigationControlStyle.DEFAULT}  ,
    noClear: true  ,
    scaleControl: true  ,
    scaleControlOptions: {style: google.maps.ScaleControlStyle.STANDARD}  ,
    scrollwheel: true  ,
    streetViewControl: false } ;

 map=new google.maps.Map(document.getElementById("googleMap"),mapProp);

var bounds = new google.maps.LatLngBounds( 
                new google.maps.LatLng(14.58222374, 121.06187789),
                new google.maps.LatLng(14.58295833, 121.06235352));
map.fitBounds(bounds);
var srcImage = 'Figures\\5th_Floor_Image_Overlay1.png'; 
overlay = new overlay(bounds, srcImage, map); 

 marker=new google.maps.Marker({
    position:myCenter,
    //animation:google.maps.Animation.BOUNCE,  
    icon:'Figures/pinkball.png'
  });

 marker.setMap(map);

 var infowindow = new google.maps.InfoWindow({
     content: 'Floor ID: ' + floorid
 });

 infowindow.open(map,marker);
}



google.maps.event.addDomListener(window, 'load', initialize);
</script>
       <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>--%>
            <h2><%: Title %></h2>
            <p class="text-danger">
                <asp:Label ID="Message" runat="server"></asp:Label>
            </p>
            <div class="row">
                <div class="col-md-12">                   
                    <h2>Find Device</h2>                    
                    <div id="googleMap" style="width:900px;height:480px;"></div>
                </div>
                
            </div>
  <%--      </ContentTemplate>
    </asp:UpdatePanel>--%>

</asp:Content>

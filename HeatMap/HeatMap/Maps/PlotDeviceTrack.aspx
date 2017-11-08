<%@ Page Title="" Language="C#" MasterPageFile="~/Maps/main.Master" AutoEventWireup="true" CodeBehind="PlotDeviceTrack.aspx.cs" Inherits="HeatMap.Maps.PlotDeviceTrack" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<script>
    var strJSON;
    var objJSON = [];

    
          
    GetLatLong();              
    function GetLatLong(){          
        objJSON = <%=GetIALocationTrack("05e78e3934")%>;
    }    
 

</script>
<script>        overlay.prototype = new google.maps.OverlayView(); 

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

   

    function showR(R,boxname, map) {
        R.setMap(map);
        document.getElementById(boxname).checked = true; 
    }

    function hideR(R,boxname) {
        R.setMap(null);
        document.getElementById(boxname).checked = false; 
    }

    function showO(MLPArray,boxname, map ) { 
        for (var i = 0; i < MLPArray.length; i++) { 
            MLPArray[i].setMap(map); 
        } 
        document.getElementById(boxname).checked = true; 
    }

    function hideO(MLPArray,boxname) { 
        for (var i = 0; i < MLPArray.length; i++) { 
            MLPArray[i].setMap(null);
        } 
        document.getElementById(boxname).checked = false; 
    } 

    function boxclick(box,MLPArray,boxname, map) { 
        if (box.checked) { 
            showO(MLPArray,boxname, map); 
        } else {  
            hideO(MLPArray,boxname);
        } 
    }

    function showHeatmap(MLPArray,boxname,map) {
        MLPArray.setMap(map);
        document.getElementById(boxname).checked = true;
    }

    function hideHeatmap(MLPArray,boxname) {
        MLPArray.setMap(null);
        document.getElementById(boxname).checked = false;
    }

    function boxclickHeatmap(box,MLPArray,boxname, map) { 
        if (box.checked) { 
            showHeatmap(MLPArray,boxname, map); 
        } else {
            hideHeatmap(MLPArray,boxname);
        } 
    }

    function setOpac(MLPArray,textname) {
        opacity=0.01*parseInt(document.getElementById(textname).value) 
        for(var i = 0; i < MLPArray.length; i++) {
            MLPArray[i].setOptions({strokeOpacity: opacity, fillOpacity: opacity}); 
        }
    }

    function setOpacL(MLPArray,textname) {
        opacity=0.01*parseInt(document.getElementById(textname).value) 
        for (var i = 0; i < MLPArray.length; i++) {
            MLPArray[i].setOptions({strokeOpacity: opacity});
        }
    }

    function setOpacR(Raster,textname) {
        opac=0.01*parseInt(document.getElementById(textname).value)
        Raster.div_.style.opacity= opac 
    }

    function setLineWeight(MLPArray,textnameW) {
        weight=parseInt(document.getElementById(textnameW).value)
        for (var i = 0; i < MLPArray.length; i++) {
            MLPArray[i].setOptions({strokeWeight: weight}); 
        } 
    }

    function legendDisplay(box,divLegendImage) {
        element = document.getElementById(divLegendImage).style;
        if (box.checked) { 
            element.display='block';
        } else {  
            element.display='none';
        }
    }

    function boxclickR(box,R,boxname, map) {
        if (box.checked) {
            showR(R,boxname,map); 
        } else { 
            hideR(R,boxname);
        } 
    }

    function legendDisplay(box,divLegendImage) {
        element = document.getElementById(divLegendImage).style; 
        if (box.checked) { 
            element.display='block';
        } else {  
            element.display='none';
        }
    }  
         
    
    var myCenter=new google.maps.LatLng(14.5825643418301,121.062005463365);
 
//function initialize()
//{
//var mapProp = {
//  center:myCenter,
//  zoom:19,
//  mapTypeId:google.maps.MapTypeId.ROADMAP,
//    disableDefaultUI: false  ,
//    disableDoubleClickZoom: false  ,
//    draggable: true  ,
//    keyboardShortcuts:  true  ,
//    mapTypeControlOptions: {style: google.maps.MapTypeControlStyle.DEFAULT}  ,
//    navigationControl: true  ,
//    navigationControlOptions: {style: google.maps.NavigationControlStyle.DEFAULT}  ,
//    noClear: true  ,
//    scaleControl: true  ,
//    scaleControlOptions: {style: google.maps.ScaleControlStyle.STANDARD}  ,
//    scrollwheel: true  ,
//    streetViewControl: false } ;

// map=new google.maps.Map(document.getElementById("googleMap"),mapProp);

//var bounds = new google.maps.LatLngBounds( 
//                new google.maps.LatLng(14.58222374, 121.06187789),
//                new google.maps.LatLng(14.58295833, 121.06235352));
//map.fitBounds(bounds);
//var srcImage = 'Figures\\5th_Floor_Image_Overlay1.png'; 
//overlay = new overlay(bounds, srcImage, map); 

// marker=new google.maps.Marker({
//    position:myCenter,
//    //animation:google.maps.Animation.BOUNCE,  
//    icon:'Figures/pinkball.png'
//  });

// marker.setMap(map);

// var infowindow = new google.maps.InfoWindow({
//     content: 'Floor ID: ' + floorid
// });

// infowindow.open(map,marker);
//}
    jQuery(function($) {
            
        var script = document.createElement('script');
        script.src = "http://maps.googleapis.com/maps/api/js?sensor=false&callback=initialize";
        document.body.appendChild(script);
    });
   

    function initialize() {
        var latlng = new google.maps.LatLng(14.582534, 121.062080);
 
        var myOptions = { zoom:50 , 
            center: latlng , 
            mapTypeId: google.maps.MapTypeId.ROADMAP  ,
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
 
        map= new google.maps.Map(document.getElementById("map_canvas"),myOptions); 
        //map.fitBounds(new google.maps.LatLngBounds( 
        //                     new google.maps.LatLng(14.58217037, 121.06186508),
        //                     new google.maps.LatLng(14.582842, 121.061895)));
        var bounds = new google.maps.LatLngBounds( 
                              new google.maps.LatLng(14.58222374, 121.06187789),
            new google.maps.LatLng(14.58295833, 121.06235352));
        map.fitBounds(bounds);
        //var srcImage = 'Figures\\5th_Floor_Image_Overlay1.png'; 
       // overlay = new overlay(bounds, srcImage, map); 
 
        
 
        
      
        var infoWindowContent = [
            ['<div class="info_content">' +
            '<h3>London Eye</h3>' +
            '<p>The London Eye is a giant Ferris wheel situated on the banks of the River Thames. The entire structure is 135 metres (443 ft) tall and the wheel has a diameter of 120 metres (394 ft).</p>' + '</div>'],
            ['<div class="info_content">' +
            '<h3>Palace of Westminster</h3>' +
            '<p>The Palace of Westminster is the meeting place of the House of Commons and the House of Lords, the two houses of the Parliament of the United Kingdom. Commonly known as the Houses of Parliament after its tenants.</p>' +
            '</div>']
        ];

        // Display multiple markers on a map
        var infoWindow = new google.maps.InfoWindow(), marker, i;

        //// Loop through our array of markers & place each one on the map  
        for (i = 0; i < objJSON.length; i++) {
            var position =  new google.maps.LatLng(objJSON[i][1], objJSON[i][2]);
            bounds.extend(position);
            marker = new google.maps.Marker({
                position: position,
                map: map,
                title: objJSON[i][0]
            });
            marker.setMap(map);

             //Allow each marker to have an info window    
            google.maps.event.addListener(marker, 'click', (function (marker, i) {
                return function () {
                    infoWindow.setContent(objJSON[i][0]);
                    infoWindow.open(map, marker);
                }
            })(marker, i));

            // Automatically center the map fitting all markers on the screen
            
            map.fitBounds(new google.maps.LatLngBounds( 
                         new google.maps.LatLng(14.58222374, 121.06187789),
            new google.maps.LatLng(14.58295833, 121.06235352)));
        }

        // Override our map zoom level once our fitBounds function runs (Make sure it only runs once)
        var boundsListener = google.maps.event.addListener((map), 'bounds_changed', function (event) {
            this.setZoom(14);
            google.maps.event.removeListener(boundsListener);
        });

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
                    <div id="map_canvas" style="width:900px;height:480px;"></div>
                </div>
                
            </div>
  <%--      </ContentTemplate>
    </asp:UpdatePanel>--%>

</asp:Content>


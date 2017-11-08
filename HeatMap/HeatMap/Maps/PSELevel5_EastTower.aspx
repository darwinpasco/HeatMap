<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PSELevel5_EastTower.aspx.cs" Inherits="HeatMap.Maps.PSELevel5_EastTower" %>


<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
   <%-- <meta charset="utf-8" http-equiv="refresh" content="10">--%>
    <meta charset="utf-8">

    <link href="../Content/jquery.datetimepicker.css" rel="stylesheet" />
    <link href="../Content/custom.css" rel="stylesheet" />
    <style type="text/css">
        html {
            height: 100%;
            font-size: normal;
        }

        body {
            height: 100%;
            margin: 0px;
            padding: 0px;
        }

        #map_canvas {
            min-height: 100%;
            height: auto;
        }

        #cBoxes {
            position: absolute;
            right: 5px;
            top: 50px;
            background-color: rgba(255,255,255,0.5);
        }

        .custom-date-style {
            background-color: red !important;
        }

        #legend {
            position: absolute;
            left: 25px;
            top: 50px;
            background-color: rgba(255,255,255,0.5);
        }

        .custom-date-style {
            background-color: red !important;
        }

        .input {
        }

        .input-wide {
            width: 500px;
        }

    </style>

    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?libraries=visualization"> </script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3/jquery.min.js" type="text/javascript"></script>
    <script src="../Scripts/data.js"></script>
    
    <script src="../Scripts/jquery.js"></script>
    <script src="../Scripts/jquery.datetimepicker.full.js"></script>
   

</head>
<body onload="initialize()">

 <script>
        var heatmapData = [];

       GetDataTableFromCodeBehind();              
        function GetDataTableFromCodeBehind() {
          
            heatmapData = <%=GetIAHeatMapDataTable("5th Floor East Tower")%>;                        
        }        
           
    </script>

    <script language="javascript"> 
      

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

        var pointArray = new google.maps.MVCArray(heatmapData);
        var heatmapLayer = new google.maps.visualization.HeatmapLayer({ 
            data: pointArray, 
            dissipating: false,
            radius: 0.00001
        }); 
   

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
            var srcImage = 'Figures\\5th_Floor_Image_Overlay1.png'; 
            overlay = new overlay(bounds, srcImage, map); 
           
            showHeatmap(heatmapLayer,"markersHeatmap4870box",map); 

            
            google.maps.event.addListener(  map , 'rightclick', function(event) {
                var lat = event.latLng.lat();
                var lng = event.latLng.lng();
                alert('Lat=' + lat + '; Lng=' + lng);});
            

        }
                     
 
       <%-- function GetIANewHeatMapDataTable() {             
            var newheatmapdata = []   
            newheatmapdata = <%=GetIANewHeatMapDataTable("5th Floor East Tower")%>;               
         
            if (newheatmapdata.length > 0){
    
                for (i = 0; i < newheatmapdata.length; i++) {
                    pointArray.push.apply(pointArray, newheatmapdata);                    
                }
            }                        
         
 
        }--%>
        
        function fetchNewData() {    
                $.ajax({
                    type: "POST",
                    url: "PSELevel5_EastTower.aspx/GetIANewHeatMapDataTable",
                    data: JSON.stringify({ level: "5th Floor East Tower" }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: false,
                    success: function(data) {                     
                        var newheatmapdata = [] ;
                        newheatmapdata = eval('(' + data.d + ')');
        
                        if (newheatmapdata.length > 0){    
                            for (i = 0; i < newheatmapdata.length; i++) {                                
                                pointArray.push.apply(pointArray, newheatmapdata);                                    
                                heatmapLayer.setData(pointArray);
                            }
                        }                            
                    },
                });
               
            }
        setInterval(function() {fetchNewData();},1000);
 

    </script>         
    <div id="map_canvas"></div>
    
    <div id="cBoxes" class="div_hide">
        <table>
            <tr>
                <td>
                    <b>Time:
                        <p id="time"></p>
                    </b>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" id="markersHeatmap4870box" onclick='boxclickHeatmap(this,heatmapLayer,"markersHeatmap4870box",map);' />
                    <b>Heatmap</b>
                </td>
            </tr>
            <tr>
                <td>
                    <b>Speed</b><input type="range" id="speedSlider" value="5" min="1" max="10" onchange="changeSpeed(0);" />
                </td>
            </tr>
            <tr>
                <td>
                    <b>Start </b>
                    <input type="text" class="some_class" value="" id="DateTime_start" />
                </td>
            </tr>
            <tr>
                <td>
                    <b>End </b>
                    <input type="text" class="some_class" value="" id="DateTime_end" />
                </td>
            </tr>

            <tr>
                <td>
                    &nbsp;</td>
            </tr>

            <tr>
                <td>
                    <button onclick="reset();clearInterval(interval);changeSpeed(0);">Play</button>                    

                </td>
            </tr>
            <tr>
                <td>
                    <button onclick="clearInterval(interval)">Pause</button>
                </td>
            </tr>
            <tr>
                <td>
                    <button onclick="changeSpeed(0)">Continue</button>
                </td>
            </tr>
            <tr>
                <td>
                    <button onclick="reset()">Reset</button>
                </td>
            </tr>
        </table>

    </div>

    <div id="legend" class="div_hide">
        <table>
            <tr>
                <td>
                    <b>Legend:
                        <p id="Legend"></p>
                    </b>
                </td>
            </tr>
            <tr>

            <tr>
                <td>
                    <b><font color="Green"> Green <p id="Green"></p> </font></b>
                </td>
                <td>Low
                    <p id="Low"></p>
                </td>
            </tr>

            <tr>
                <td>
                    <b><font color="Yellow"> Yellow <p id="Yellow"></p> </font></b>
                </td>
                <td>Moderate
                    <p id="Moderate"></p>
                </td>
            </tr>

            <tr>
                <td>
                    <b><font color="Red"> Red <p id="Red"></p> </font></b>
                </td>
                <td>High
                    <p id="High"></p>
                </td>
            </tr>
        </table>
    </div>
    <script>
        $('.some_class').datetimepicker();
    </script>

</body>



</html>

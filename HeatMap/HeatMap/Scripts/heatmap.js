
var heatmapData = [];



GetSoapResponse();



//var myHeatMapData { 
//         level: "6EH", 
//         result: function(){ 
//                 var url = "http://localhost:51144/getHeatMapData.asmx"// document.location.href.replace("HTMLPage1.htm", );
//                 var pl = new SOAPClientParameters();
//                 pl.add("level", level);
//                 SOAPClient.invoke(url, "GetHeatMapData2", pl, true, GetSoapResponse_callBack)};
//         response: function(r, soapResponse) {
//                 if (soapResponse.xml)    // IE
//                     alert(soapResponse.xml);
//                 else                    // MOZ


//                     var x = new XMLSerializer();

//                 var xmlstring = x.serializeToString(soapResponse);
//                 xmlstring = xmlstring.replace("<soap:Envelope xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><GetHeatMapData2Response xmlns=\"http://tempuri.org/\"><GetHeatMapData2Result>", "");
//                 xmlstring = xmlstring.replace("</GetHeatMapData2Result></GetHeatMapData2Response></soap:Body></soap:Envelope>", "");

//                 heatmapData = xmlstring;
//                    }
//     }

     function GetSoapResponse() {
         var url = "http://localhost:51144/getHeatMapData.asmx"
        // var url = "http://172.16.192.59/iBeaconWebservice/getHeatMapData.asmx"
         var pl = new SOAPClientParameters();
         pl.add("level", "6EH");
         SOAPClient.invoke(url, "GetHeatMapData2", pl, false, GetSoapResponse_callBack);

     }
     function GetSoapResponse_callBack(r, soapResponse) {
         if (soapResponse.xml)    // IE
             alert(soapResponse.xml);
         else                    // MOZ


             var x = new XMLSerializer();

         var xmlstring = x.serializeToString(soapResponse);
         xmlstring = xmlstring.replace("<soap:Envelope xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><GetHeatMapData2Response xmlns=\"http://tempuri.org/\"><GetHeatMapData2Result>", "");
         xmlstring = xmlstring.replace("</GetHeatMapData2Result></GetHeatMapData2Response></soap:Body></soap:Envelope>", "");

         heatmapData = eval('(' + xmlstring + ')');
     }
    
     

    
    


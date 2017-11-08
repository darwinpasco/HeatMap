using HeatMap.Helper;
using iBeaconWebService.Action;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HeatMap.Maps
{
    public partial class DeviceFound : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnFindDevice_Click(object sender, EventArgs e)
        {

        }

        public string GetDeviceLastKnownLocation(string deviceid)
        {
            string jsonstring = "";

            GetHeatMapAction doAction = new GetHeatMapAction();
            JSONHelper helper = new JSONHelper();

            DataSet ds = doAction.GetDeviceLastKnownLocation(deviceid);

            jsonstring = helper.DataTableToJsonObj(ds.Tables[0]);
            jsonstring = jsonstring.Replace("[", "");
            jsonstring = jsonstring.Replace("]", "");
           // char c = Convert.ToChar(34);
           // jsonstring = jsonstring.Replace(c.ToString(), "");

            return jsonstring;

        }
    }
}

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
    public partial class PlotDeviceTrack : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string GetIALocationTrack(string deviceid)
        {
            DateTime startdate;
            DateTime enddate;

            string jsonstring = "";

            if (string.IsNullOrEmpty(Session["StartDate5ET"].ToString()))
            {
                startdate = DateTime.Parse(DateTime.Today.Date.ToString("yyyy-MM-dd"));
                enddate = DateTime.Parse(DateTime.Today.Date.AddDays(1).ToString("yyyy-MM-dd"));
            }
            else
            {
                startdate = DateTime.Parse(Session["StartDate5ET"].ToString());
                enddate = DateTime.Parse(Session["EndDate5ET"].ToString());
            }


            GetHeatMapAction doAction = new GetHeatMapAction();
            JSONHelper helper = new JSONHelper();

            DataSet ds = doAction.GetIALocationTrack(deviceid, startdate, enddate);

            jsonstring = helper.DataTableToJsonObj(ds.Tables[0]);
            //jsonstring = jsonstring.Replace("{", "[");
            //jsonstring = jsonstring.Replace("}", "]");
            //jsonstring = jsonstring.Replace("[[", "[");
            //jsonstring = jsonstring.Replace("]]", "]");
            char c = Convert.ToChar(34);
            jsonstring = jsonstring.Replace(c.ToString(), "");
           

            return jsonstring;





        }
    }
}
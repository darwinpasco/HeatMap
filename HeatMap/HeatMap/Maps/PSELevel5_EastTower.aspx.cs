using HeatMap.HeatMapDataWebService;
using HeatMap.Helper;
using iBeaconWebService.Action;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HeatMap.Maps
{
    public partial class PSELevel5_EastTower : System.Web.UI.Page
    {
        static int lastid;
        static DateTime startdate;
        static DateTime enddate;

        protected void Page_Load(object sender, EventArgs e)
        {           

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

        }

        public string GetIAHeatMapDataTable(string level)
        {
        

            string heatmaparray = "";
            string heatmaparray2 = "";

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

            DataSet ds = doAction.GetIAHeatMapData(level, startdate, enddate);

            DataTable dt = ds.Tables[0];
            lastid = GetLastID(dt);
            dt.Columns.Remove("Id");

            heatmaparray2 = heatmaparray2 + helper.DataTableToJsonObj(dt); 

            char c = Convert.ToChar(34);
            heatmaparray2 = heatmaparray2.Replace(c.ToString(), "");

            heatmaparray = heatmaparray + heatmaparray2;
    
            return heatmaparray;
        }
        [WebMethod]
        public static string GetIANewHeatMapDataTable(string level)
        {         

            string heatmaparray = "";
            string heatmaparray2 = "";
           
            GetHeatMapAction doAction = new GetHeatMapAction();
            JSONHelper helper = new JSONHelper();

            DataSet ds = doAction.GetIAHeatmapNewData(level, startdate, enddate, lastid );

            DataTable dt = ds.Tables[0];

            if (dt.Rows.Count > 0)
            { 
                lastid = GetLastID(dt);
                dt.Columns.Remove("Id");
            }

            heatmaparray2 = heatmaparray2 + helper.DataTableToJsonObj(dt);

            char c = Convert.ToChar(34);
            heatmaparray2 = heatmaparray2.Replace(c.ToString(), "");

            heatmaparray = heatmaparray + heatmaparray2;

            return heatmaparray;
        }

        private static int GetLastID(DataTable dt)
        {

            if (dt.Rows.Count > 0)
            {
                DataRow lastRow = dt.Rows[dt.Rows.Count - 1];

                lastid = int.Parse(lastRow["Id"].ToString());

                lastid = lastid - 1;
            }

            return lastid;

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
            char c = Convert.ToChar(34);
            jsonstring = jsonstring.Replace(c.ToString(), "");

            return jsonstring;

        }

    }
}

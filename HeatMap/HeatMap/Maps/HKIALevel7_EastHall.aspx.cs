using HeatMap.HeatMapDataWebService;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HeatMap.Maps
{
    public partial class HKIALevel7_EastHall : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string GetHeatMapDataTable(string level)
        {
            DateTime startdate;
            DateTime enddate;

            if(string.IsNullOrEmpty(Session["StartDate7EH"].ToString()))
            {
                startdate = DateTime.Parse(DateTime.Today.Date.ToString("yyyy-MM-dd"));
                enddate = DateTime.Parse(DateTime.Today.Date.AddDays(1).ToString("yyyy-MM-dd"));
            }
            else
            {
                startdate = DateTime.Parse(Session["StartDate7EH"].ToString());
                enddate = DateTime.Parse(Session["EndDate7EH"].ToString());
            }


            getHeatMapData h = new getHeatMapData();

            return h.GetHeatMapDataByDate(level, startdate, enddate);
        }

    }
}
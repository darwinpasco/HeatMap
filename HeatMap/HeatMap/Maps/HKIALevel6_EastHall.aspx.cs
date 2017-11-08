using HeatMap.HeatMapDataWebService;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HeatMap.Maps
{
    public partial class HKIALevel6_EastHall : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

           // this.TextBox1.Text = "04/04/2016";

        }

        public string GetHeatMapDataTable(string level)
        {
            DateTime startdate;
            DateTime enddate;

            if (string.IsNullOrEmpty(Session["StartDate6EH"].ToString()))
            {
                startdate = DateTime.Parse(DateTime.Today.Date.ToString("yyyy-MM-dd"));
                enddate = DateTime.Parse(DateTime.Today.Date.AddDays(1).ToString("yyyy-MM-dd"));
            }
            else
            {
                startdate = DateTime.Parse(Session["StartDate6EH"].ToString());
                enddate = DateTime.Parse(Session["EndDate6EH"].ToString());
            }

            getHeatMapData h = new getHeatMapData();

            return h.GetHeatMapDataByDate(level, startdate, enddate);
        }


        public string GetHeatMapDataTable(string level, string startdate, string enddate)
        {

            getHeatMapData h = new getHeatMapData();

            return h.GetHeatMapDataByDate(level, DateTime.Parse(startdate), DateTime.Parse(enddate));

        }
        
    }
}

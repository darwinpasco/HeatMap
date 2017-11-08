using HeatMap.HeatMapDataWebService;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace HeatMap.Maps
{
    public partial class HKIALevel6_WestHall : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        public string GetHeatMapDataTable(string level)
        {
            DateTime startdate;
            DateTime enddate;

            if (string.IsNullOrEmpty(Session["StartDate6WH"].ToString()))
            {
                startdate = DateTime.Parse(DateTime.Today.Date.ToString("yyyy-MM-dd"));
                enddate = DateTime.Parse(DateTime.Today.Date.AddDays(1).ToString("yyyy-MM-dd"));
            }
            else
            {
                startdate = DateTime.Parse(Session["StartDate6WH"].ToString());
                enddate = DateTime.Parse(Session["EndDate6WH"].ToString());
            }

            getHeatMapData h = new getHeatMapData();

            return h.GetHeatMapDataByDate(level, startdate, enddate);
        }

    }
}
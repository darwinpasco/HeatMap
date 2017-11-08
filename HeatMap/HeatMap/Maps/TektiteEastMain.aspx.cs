using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HeatMap.Maps
{
    public partial class TektiteEastMain : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {

                this.txtStartDate5ET.Text = DateTime.Today.Date.ToString("yyyy-MM-dd");
                this.txtEndDate5ET.Text = DateTime.Today.Date.AddDays(1).ToString("yyyy-MM-dd");

                Session["StartDate5ET"] = DateTime.Parse(this.txtStartDate5ET.Text);
                Session["EndDate5ET"] = DateTime.Parse(this.txtEndDate5ET.Text);
                
            }
        }

        protected void btnSet5ET_Click(object sender, EventArgs e)
        {
            Session["StartDate5ET"] = DateTime.Parse(this.txtStartDate5ET.Text);
            Session["EndDate5ET"] = DateTime.Parse(this.txtEndDate5ET.Text);
        }

        protected void btnSetWH_Click(object sender, EventArgs e)
        {

        }

        protected void btnSet7EH_Click(object sender, EventArgs e)
        {

        }
    }
}
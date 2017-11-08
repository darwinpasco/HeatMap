using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HeatMap.Maps
{
    public partial class Main : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {

                this.txtStartDate6EH.Text = DateTime.Today.Date.ToString("yyyy-MM-dd");
                this.txtEndDate6EH.Text = DateTime.Today.Date.AddDays(1).ToString("yyyy-MM-dd");
                
                Session["StartDate6EH"] = DateTime.Parse(this.txtStartDate6EH.Text);
                Session["EndDate6EH"] = DateTime.Parse(this.txtEndDate6EH.Text);

                this.txtStartDate6WH.Text = DateTime.Today.Date.ToString("yyyy-MM-dd");
                this.txtEndDate6WH.Text = DateTime.Today.Date.AddDays(1).ToString("yyyy-MM-dd");
                Session["StartDate6WH"] = DateTime.Parse(this.txtStartDate6WH.Text);
                Session["EndDate6WH"] = DateTime.Parse(this.txtEndDate6WH.Text);

                this.txtStartDate7EH.Text = DateTime.Today.Date.ToString("yyyy-MM-dd");
                this.txtEndDate7EH.Text = DateTime.Today.Date.AddDays(1).ToString("yyyy-MM-dd");
                Session["StartDate7EH"] = DateTime.Parse(this.txtStartDate7EH.Text);
                Session["EndDate7EH"] = DateTime.Parse(this.txtEndDate7EH.Text);
            }
        }

        protected void btnSet6EH_Click(object sender, EventArgs e)
        {
            Session["StartDate6EH"] = DateTime.Parse(this.txtStartDate6EH.Text);
            Session["EndDate6EH"] = DateTime.Parse(this.txtEndDate6EH.Text);
        }

        protected void btnSetWH_Click(object sender, EventArgs e)
        {
            Session["StartDate6WH"] = DateTime.Parse(this.txtStartDate6WH.Text);
            Session["EndDate6WH"] = DateTime.Parse(this.txtEndDate6WH.Text);
        }

        protected void btnSet7EH_Click(object sender, EventArgs e)
        {
            Session["StartDate7EH"] = DateTime.Parse(this.txtStartDate7EH.Text);
            Session["EndDate7EH"] = DateTime.Parse(this.txtEndDate7EH.Text);
        }
    }
}
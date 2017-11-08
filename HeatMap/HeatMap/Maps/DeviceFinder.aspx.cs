using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HeatMap.Maps
{
    public partial class DeviceFinder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                txtDeviceId.Text = "";
                Session["SearchDeviceID"] = "";
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Session["SearchDeviceID"] = txtDeviceId.Text;
            Response.Redirect("DeviceFound");
            
        }
    }
}
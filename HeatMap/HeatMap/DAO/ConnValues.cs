﻿using Microsoft.VisualBasic;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Configuration;
using System.Web;
using System.Text;

namespace iBeaconWebService.DAO
{

    public class ConnValues
    {

        public string conn()
        {

            string connstring = null;

            connstring = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            return connstring;

        }

    }
}

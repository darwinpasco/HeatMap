using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using DBDataProvider;
using System.Data.SqlClient;

namespace iBeaconWebService.DAO
{
    public class HeatMapDAO
    {
         public HeatMapDAO()
        {
        }

         public DataSet GetHeatMapData(string level)
         {
             ConnValues ConnStr = new ConnValues();
             SqlDatabase sqldb = new SqlDatabase(ConnStr.conn());
             SqlParameter[] @params = new SqlParameter[1];
                        
             try
             {
                 @params[0] = new SqlParameter("@level", SqlDbType.Char);
                 @params[0].Value = level;

                 DataSet ds = sqldb.FillDataset("generateHeatmapData2", CommandType.StoredProcedure, @params);

                 return ds;


             }
             catch (System.Exception ex)
             {
                 throw ex;
             }
         }

         public DataSet GetHeatMapData(string level, DateTime startdate, DateTime enddate) 
         {
             ConnValues ConnStr = new ConnValues();
             SqlDatabase sqldb = new SqlDatabase(ConnStr.conn());
             SqlParameter[] @params = new SqlParameter[3];

             try
             {
                 @params[0] = new SqlParameter("@level", SqlDbType.Char);
                 @params[0].Value = level;

                 @params[1] = new SqlParameter("@startdatetime", SqlDbType.Date);
                 @params[1].Value = startdate;

                 @params[2] = new SqlParameter("@enddatetime", SqlDbType.Date);
                 @params[2].Value = enddate;

                 DataSet ds = sqldb.FillDataset("generateHeatmapDataByDate", CommandType.StoredProcedure, @params);

                 return ds;


             }
             catch (System.Exception ex)
             {
                 throw ex;
             }
         }

        public DataSet GetIAHeatMapData(string level, DateTime startdate, DateTime enddate)
        {
            ConnValues ConnStr = new ConnValues();
            SqlDatabase sqldb = new SqlDatabase(ConnStr.conn());
            SqlParameter[] @params = new SqlParameter[3];

            try
            {
                @params[0] = new SqlParameter("@level", SqlDbType.VarChar);
                @params[0].Value = level;

                @params[1] = new SqlParameter("@startdatetime", SqlDbType.Date);
                @params[1].Value = startdate;

                @params[2] = new SqlParameter("@enddatetime", SqlDbType.Date);
                @params[2].Value = enddate;

                DataSet ds = sqldb.FillDataset("generateIAHeatmapDataByDate", CommandType.StoredProcedure, @params);

                return ds;


            }
            catch (System.Exception ex)
            {
                throw ex;
            }
        }

        public DataSet GetIAHeatMapDataMapBox(string level, DateTime startdate, DateTime enddate)
        {
            ConnValues ConnStr = new ConnValues();
            SqlDatabase sqldb = new SqlDatabase(ConnStr.conn());
            SqlParameter[] @params = new SqlParameter[3];

            try
            {
                @params[0] = new SqlParameter("@level", SqlDbType.VarChar);
                @params[0].Value = level;

                @params[1] = new SqlParameter("@startdatetime", SqlDbType.Date);
                @params[1].Value = startdate;

                @params[2] = new SqlParameter("@enddatetime", SqlDbType.Date);
                @params[2].Value = enddate;

                DataSet ds = sqldb.FillDataset("generateIAHeatmapDataByDate_MapBox", CommandType.StoredProcedure, @params);

                return ds;


            }
            catch (System.Exception ex)
            {
                throw ex;
            }
        }
        public DataSet GetIAHeatmapNewData(string level, DateTime startdate, DateTime enddate, int lastid)
        {
            ConnValues ConnStr = new ConnValues();
            SqlDatabase sqldb = new SqlDatabase(ConnStr.conn());
            SqlParameter[] @params = new SqlParameter[4];

            try
            {
                @params[0] = new SqlParameter("@level", SqlDbType.Char);
                @params[0].Value = level;

                @params[1] = new SqlParameter("@startdatetime", SqlDbType.Date);
                @params[1].Value = startdate;

                @params[2] = new SqlParameter("@enddatetime", SqlDbType.Date);
                @params[2].Value = enddate;

                @params[3] = new SqlParameter("@lastid", SqlDbType.Int);
                @params[3].Value = lastid;

                DataSet ds = sqldb.FillDataset("GetIAHeatmapNewData", CommandType.StoredProcedure, @params);

                return ds;


            }
            catch (System.Exception ex)
            {
                throw ex;
            }
        }

        public DataSet GetIALocationTrack(string deviceid, DateTime startdate, DateTime enddate)
        {
            ConnValues ConnStr = new ConnValues();
            SqlDatabase sqldb = new SqlDatabase(ConnStr.conn());
            SqlParameter[] @params = new SqlParameter[3];

            try
            {
                @params[0] = new SqlParameter("@deviceid", SqlDbType.Char);
                @params[0].Value = @deviceid;

                @params[1] = new SqlParameter("@startdatetime", SqlDbType.Date);
                @params[1].Value = startdate;

                @params[2] = new SqlParameter("@enddatetime", SqlDbType.Date);
                @params[2].Value = enddate;

                DataSet ds = sqldb.FillDataset("GetIALocationTrack", CommandType.StoredProcedure, @params);

                return ds;


            }
            catch (System.Exception ex)
            {
                throw ex;
            }
        }

        public DataSet GetLevels()
         {
             ConnValues ConnStr = new ConnValues();
             SqlDatabase sqldb = new SqlDatabase(ConnStr.conn());

             try
             {
                 DataSet ds = sqldb.FillDataset("getLevels", CommandType.StoredProcedure);

                 return ds;


             }
             catch (System.Exception ex)
             {
                 throw ex;
             }
         }

         public void SaveIALocationData(string deviceid, string tokenid, string longitude, string latitude,
                                        string venueid, string floorplanid, string floorid)
         {
             ConnValues ConnStr = new ConnValues();
             SqlDatabase sqldb = new SqlDatabase(ConnStr.conn());
             

             SqlParameter[] @params = new SqlParameter[7];

             @params[0] = new SqlParameter("@deviceid", SqlDbType.VarChar);
             @params[0].Value = deviceid;

             @params[1] = new SqlParameter("@tokenid", SqlDbType.VarChar);
             @params[1].Value = tokenid;

             @params[2] = new SqlParameter("@longitude", SqlDbType.VarChar);
             @params[2].Value = longitude;

             @params[3] = new SqlParameter("@latitude", SqlDbType.VarChar);
             @params[3].Value = latitude;

             @params[4] = new SqlParameter("@venueid", SqlDbType.VarChar);
             @params[4].Value = venueid;

             @params[5] = new SqlParameter("@floorplanid", SqlDbType.VarChar);
             @params[5].Value = floorplanid;

             @params[6] = new SqlParameter("@floorid", SqlDbType.VarChar);
             @params[6].Value = floorid;

             try
             {
                 sqldb.ExecuteReader("SaveIALocationData", CommandType.StoredProcedure, @params);

             }
             catch (System.Exception ex)
             {
                 throw ex;

             }
         }

        public DataSet GetDeviceLastKnownLocation(string deviceid)
        {
            ConnValues ConnStr = new ConnValues();
            SqlDatabase sqldb = new SqlDatabase(ConnStr.conn());


            SqlParameter[] @params = new SqlParameter[1];

            @params[0] = new SqlParameter("@deviceid", SqlDbType.VarChar);
            @params[0].Value = deviceid;
            try
            {

                DataSet ds = sqldb.FillDataset("GetDeviceLastKnownLocation", CommandType.StoredProcedure, @params);
                return ds;

            }
            catch (System.Exception ex)
            {
                throw ex;

            }
        }


    }
}
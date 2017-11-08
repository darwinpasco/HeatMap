using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using iBeaconWebService.DAO;

namespace iBeaconWebService.Action
{
    [Serializable()]
    public class GetHeatMapAction
    {

        public HeatMapDAO dao = new HeatMapDAO();
        public GetHeatMapAction()
        {
        }

         public DataSet GetHeatMapData(string level)
         {
             try
             {
                 return dao.GetHeatMapData(level);
             }
             catch (Exception ex)
             {
                 throw ex; //ExceptionHelper.ExceptionHandler(ex, ErrorType.ADD);
             }

         }

         public DataSet GetHeatMapData(string level, DateTime startdate, DateTime enddate)
         {
             try
             {
                 return dao.GetHeatMapData(level, startdate, enddate);
             }
             catch (Exception ex)
             {
                 throw ex; //ExceptionHelper.ExceptionHandler(ex, ErrorType.ADD);
             }

         }

        public DataSet GetIAHeatMapData(string level, DateTime startdate, DateTime enddate)
        {
            try
            {
                return dao.GetIAHeatMapData(level, startdate, enddate);
            }
            catch (Exception ex)
            {
                throw ex; //ExceptionHelper.ExceptionHandler(ex, ErrorType.ADD);
            }

        }

        public DataSet GetIAHeatMapDataMapBox(string level, DateTime startdate, DateTime enddate)
        {
            try
            {
                return dao.GetIAHeatMapDataMapBox(level, startdate, enddate);
            }
            catch (Exception ex)
            {
                throw ex; //ExceptionHelper.ExceptionHandler(ex, ErrorType.ADD);
            }

        }

        public DataSet GetIAHeatmapNewData(string level, DateTime startdate, DateTime enddate, int lastid)
        {
            try
            {
                return dao.GetIAHeatmapNewData(level, startdate, enddate, lastid);
            }
            catch (Exception ex)
            {
                throw ex; //ExceptionHelper.ExceptionHandler(ex, ErrorType.ADD);
            }

        }

        public DataSet GetIALocationTrack(string deviceid, DateTime startdate, DateTime enddate)
        {
            try
            {
                return dao.GetIALocationTrack(deviceid, startdate, enddate);
            }
            catch (Exception ex)
            {
                throw ex; //ExceptionHelper.ExceptionHandler(ex, ErrorType.ADD);
            }

        }


        public DataSet GetLevels()
         {
             try
             {
                 return dao.GetLevels();
             }
             catch (Exception ex)
             {
                 throw ex; //ExceptionHelper.ExceptionHandler(ex, ErrorType.ADD);
             }

         }

        public DataSet GetDeviceLastKnownLocation(string deviceid)
        {
            try
            {
                return dao.GetDeviceLastKnownLocation(deviceid);
            }
            catch (Exception ex)
            {
                throw ex; //ExceptionHelper.ExceptionHandler(ex, ErrorType.ADD);
            }

        }

        public void SaveIALocationData(string deviceid, string tokenid, string longitude, string latitude,
                                        string venueid, string floorplanid, string floorid)
         {
             try
             {
                 dao.SaveIALocationData(deviceid, tokenid, longitude, latitude, venueid, floorplanid, floorid);
             }
             catch (Exception ex)
             {
                 throw ex; //ExceptionHelper.ExceptionHandler(ex, ErrorType.ADD);
             }

         }
    }
}
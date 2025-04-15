using DocumentFormat.OpenXml.EMMA;
using DocumentFormat.OpenXml.Presentation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.Json;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace WebApplication2
{
    public partial class index : System.Web.UI.Page
    {
        //this variable will store all valrient according model
        //public List<Model> ModelList = new List<Model>();
        //public List<MODEL_DEATILS> VariantList = new List<MODEL_DEATILS>();

        public string SelectedModel = "";
        public static string CurrentError = "";

        protected void Page_Load(object sender, EventArgs e)
        { 
           // GET_MODEL();
            //if (Request.Params.Get("model") == null && ModelList.Count != 0)
            //{
            //   // SelectedModel = ModelList[0].ModelName;
            //}
            //if (SelectedModel != "")
            //{
            //    GET_VARIANT(SelectedModel);
            //}
        }

        //private void GET_VARIANT(string model)
        //{
        //    try
        //    {
        //        Entities1 mdbEntities1 = new Entities1();
        //        //var models = mdbEntities1.MODEL_DEATILS.Where(i => i.Model == model).ToList();
        //        //VariantList.AddRange(models);
        //    }
        //    catch (Exception ex)
        //    {
        //        CurrentError = ex.Message;
        //    }
        //}

        //private void GET_MODEL()
        //{
        //    try
        //    {
        //        Entities1 mdbEntities1 = new Entities1();
        //        //var models = mdbEntities1.MODELs.ToList();
        //        //ModelList.AddRange(models);
        //        //SelectedModel = Request.Params.Get("model");
        //    }
        //    catch (Exception ex)
        //    {
        //        CurrentError = ex.Message;
        //    }
        //}

        //[WebMethod]
        //public static bool ADD_MODEL(string model, string customer,string partnumber)
        //{
        //    try
        //    {
        //        using (Entities1 mdbEntities1 = new Entities1())
        //        {
        //            //MODEL md = new MODEL
        //            //{
        //            //    ModelName = model,
        //            //    PartNumber = partnumber,
        //            //    CustomerName = customer
        //            //};
        //            //mdbEntities1.MODELs.Add(md);
        //            mdbEntities1.SaveChanges();
        //            return true;
        //        }
        //    } catch (Exception ex)
        //    {
        //        CurrentError = ex.Message;
        //        return false;
        //    }               
        //}
        //[WebMethod]
        //public static string GET_MODEL_REPORT(string model)
        //{
        //    try
        //    {
        //        using (Entities1 db = new Entities1())
        //        {
        //            if (model == "YFG_PWR_RAIL")
        //            {
        //                var res = db.YFG_PowerLineData.SqlQuery("SELECT * FROM YFG_PowerLineData WHERE Model LIKE {0} AND Station = 100 ORDER BY BuiltTktDateTime DESC", "%" + model + "%").Take(50).ToList();

        //                if (res.Count > 0)
        //                {
        //                    return JsonSerializer.Serialize(res);
        //                }
        //            }
        //            else if (model == "SIDE_BKT")
        //            {
        //                var res = db.SideBraketLineDatas.SqlQuery("SELECT * FROM SideBraketLineData WHERE Model LIKE {0} AND Station = 100 ORDER BY FinalQRDateTime DESC", "%" + model + "%").Take(50).ToList();
        //                if (res.Count > 0)
        //                {
        //                    return JsonSerializer.Serialize(res);
        //                }
        //            }
        //            else if (model == "TILT_COM")
        //            {
        //                var res = db.TILTCOM_LineData.SqlQuery("SELECT * FROM TILTCOM_LineData WHERE Model LIKE {0} AND Station = 10 ORDER BY FinalQRDateTime DESC", "%" + model + "%").Take(50).ToList();


        //                if (res.Count > 0)
        //                {
        //                    return JsonSerializer.Serialize(res);
        //                }
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        Console.WriteLine(ex.Message);
        //        return "Error";
        //    }
        //    return "Error";
        //}


        //[WebMethod]
        //public static bool HandleDelete(int id)
        //{
        //    try
        //    {
        //        using (Entities1 mdbEntities1 = new Entities1())
        //        {
        //            //var res = mdbEntities1.MODEL_DEATILS.Where(i => i.ID == id).FirstOrDefault();
        //            //if (res != null)
        //            //{
        //            //    mdbEntities1.MODEL_DEATILS.Remove(res);
        //            //    mdbEntities1.SaveChanges();
        //            //    return true;
        //            //}
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        Console.WriteLine(ex.Message);
        //        return false;
        //    }
        //    return false;
        //}
    }
}
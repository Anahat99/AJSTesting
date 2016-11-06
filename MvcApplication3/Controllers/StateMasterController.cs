using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using MvcApplication3.Entity;
using System.Data;

namespace MvcApplication3.Controllers
{
    public class StateMasterController : ApiController
    {
        EmpContext objemp = new EmpContext();

        [HttpGet]
        public List<StateMaster> GetStateData()
        {
            var data = from d in objemp.StateMasterData.ToList()
                       orderby d.SMID
                       select d;
            return data.ToList<StateMaster>();
 
        }

        public StateMaster GetStateData(int ID)
        {
            var data = from d in objemp.StateMasterData
                       where d.SMID.Equals(ID)
                       select d;
            return data.SingleOrDefault();

        }

        [HttpGet]
        public StateMaster GetStateDataByID(int ID)
        {
            var data = GetStateData(ID);

            //var data = from d in objemp.StateMasterData
            //           where d.SMID.Equals(ID)
            //           select d;
            return data;

        }


        [AcceptVerbs("GET", "POST")]
        public bool SaveState([FromBody]StateMaster data)
        {

            //JavaScriptSerializer jss = new JavaScriptSerializer();
            //var emp = jss.Deserialize<EMPMaster>(data);
            try
            {
                objemp.StateMasterData.Add(data);
                objemp.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }



        [AcceptVerbs("GET", "POST")]
        public bool EditState([FromBody]StateMaster data)
        {

            //JavaScriptSerializer jss = new JavaScriptSerializer();
            //var emp = jss.Deserialize<EMPMaster>(data);
            try
            {
                objemp.Entry(data).State = EntityState.Modified;
                 //bool a =EditState(data);
                objemp.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }


        [AcceptVerbs("GET", "POST")]
        public bool DeleteState(int ID)
        {
            try
            {
                var data = GetStateData(ID);
                objemp.Entry(data).State = EntityState.Deleted;
                //bool a =EditState(data);
                objemp.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

    }
}

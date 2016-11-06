using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using MvcApplication3.Entity;
using System.Web.Script.Serialization;

namespace MvcApplication3.Controllers
{
    public class EmployeeController : ApiController
    {
        EmpContext objemp = new EmpContext();
       
        [HttpGet]
        public List<EMPMaster> GetEmp()
        {
            var data = from d in objemp.EmpMasterData.ToList()
                       select d;
            return data.ToList<EMPMaster>();
        }


        [HttpGet]
        public EMPMaster GetEmpByID(int empid)
        {
            var data1 = from d in objemp.EmpMasterData.ToList().Where(t => t.EmpId == empid)
                       select d;
            return data1.FirstOrDefault();
        }

        [HttpPost]
        public bool SaveEmp([FromBody]EMPMaster data) 
        {
           
            //JavaScriptSerializer jss = new JavaScriptSerializer();
            //var emp = jss.Deserialize<EMPMaster>(data);
            try
            {
                objemp.EmpMasterData.Add(data);
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

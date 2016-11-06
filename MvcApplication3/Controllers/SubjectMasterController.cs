using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using MvcApplication3.Entity;

namespace MvcApplication3.Controllers
{
    public class SubjectMasterController : ApiController
    {
        EmpContext objemp = new EmpContext();

        [HttpPost]
        public bool SaveSubject([FromBody]SubjectMaster data)
        {
            try
            {
                objemp.SubjectMasterData.Add(data);
                objemp.SaveChanges();
                return true;
            }
            catch
            { return false; }
        }


        [HttpGet]
        public List<SubjectMaster> GetSubjectData()
        {
            var data = from d in objemp.SubjectMasterData.ToList() 
                       select d;
            return data.ToList<SubjectMaster>();
 
        }
    }
}

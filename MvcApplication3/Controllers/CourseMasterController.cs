using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using MvcApplication3.Entity;

namespace MvcApplication3.Controllers
{
    public class CourseMasterController : ApiController
    {
        EmpContext objemp = new EmpContext();

        [HttpPost]
        public bool SaveCourse([FromBody] CourseMaster data)
        {
            try
            {
                objemp.CourseMasterData.Add(data);
                objemp.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        [HttpGet]
        public List<CourseMaster> GetCourseData()
        {
            var data = from d in objemp.CourseMasterData.ToList()
                       select d;
            return data.ToList<CourseMaster>();        
 
        }
    }
}

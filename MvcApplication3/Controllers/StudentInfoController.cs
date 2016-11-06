using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using MvcApplication3.Entity;

namespace MvcApplication3.Controllers
{
    public class StudentInfoController : ApiController
    {
        //https://www.exceptionnotfound.net/using-http-methods-correctly-in-asp-net-web-api/
        EmpContext objemp = new EmpContext();

        [HttpGet]
        public IQueryable<StateCity> GetCityDataByState(int SMID)
        {
            //IEnumerable<StateCity> SC;
            var smdata = (from d in objemp.CityMasterData
                        join S in objemp.StateMasterData on d.SMID equals S.SMID 
                        where  d.SMID.Equals(SMID)
                        select new StateCity { SName = S.SName, CID = d.CID, CName = d.CName });


            return smdata;

        }

        [HttpPost]
        public bool SaveStudentInfo([FromBody]StudentInfo data) {
            try
            {
                objemp.StudentInfoData.Add(data);
                objemp.SaveChanges();
                return true;
            }
            catch 
            {
                return false;
 
            }
        
        }

        [HttpGet]
        public IQueryable<GetStudentInfo> GetStudentInfo()
        {
            var data = from s in objemp.StudentInfoData
                       join d in objemp.StateMasterData on s.SMID equals d.SMID
                       join c in objemp.CityMasterData on s.CID equals c.CID
                       select new GetStudentInfo { SIID=s.SIID,SName=s.SName,SAge=s.SAge,SContactNo=s.SContactNo,StateName=d.SName,CityName=c.CName};
            return data;
        }
    }
}

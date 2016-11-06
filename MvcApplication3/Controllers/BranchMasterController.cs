using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using MvcApplication3.Entity;

namespace MvcApplication3.Controllers
{
    public class BranchMasterController : ApiController
    {
        EmpContext objemp = new EmpContext();

        [HttpPost]
        public bool SaveBranch(BranchMaster data)
        {
            try
            {
                objemp.BranchMasterData.Add(data);
                objemp.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
 
        }

        [HttpGet]
        public IQueryable<CourseBranch> GetBranch()
        {
            var data = (from d in objemp.BranchMasterData
                        join S in objemp.CourseMasterData on d.CID equals S.CID
                        select new CourseBranch { CourseName=S.CourseName,BranchName=d.BranchName});
            return data;
 
        }
    }
}

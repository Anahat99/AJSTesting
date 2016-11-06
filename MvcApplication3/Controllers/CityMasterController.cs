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
    public class CityMasterController : ApiController
    {
        EmpContext objemp = new EmpContext();

        //var dealercontacts = from contact in DealerContact
        //                     join dealer in Dealer on contact.DealerId equals dealer.ID
        //                     select contact;

        [HttpGet]
        public IQueryable<StateCity> GetCityData()
        {
            //IEnumerable<StateCity> SC;
            var data = (from d in objemp.CityMasterData
                        join S in objemp.StateMasterData on d.SMID equals S.SMID
                        select new StateCity { SName = S.SName, CID = d.CID, CName = d.CName });


            return data;

        }

        public StateCity GetCityDetailByID(int ID)
        {
            var data = (from d in objemp.CityMasterData
                        join S in objemp.StateMasterData on d.SMID equals S.SMID 
                        where d.CID.Equals(ID)
                        select new StateCity { SName = S.SName, CID = d.CID, CName = d.CName,SMID=d.SMID });


            return data.SingleOrDefault();
 
        }


        [HttpPost]
        public bool SaveCity([FromBody] CityMaster data)
        {
            try
            {
                objemp.CityMasterData.Add(data);
                objemp.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
 
        }



        [HttpPost]
        public bool EditCity([FromBody] CityMaster data)
        {
            try
            {
                objemp.Entry(data).State = EntityState.Modified;
                objemp.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }

        }
    }
}

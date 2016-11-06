using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace MvcApplication3.Entity
{
    public class CityMaster
    {
        [Key]
        public int CID { get; set; }
        public int SMID { get; set; }
        public string CName { get; set; }
    }
}
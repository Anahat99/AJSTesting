using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace MvcApplication3.Entity
{
    public class StateCity
    {
        public string SName { get; set; }
        [Key]
        public int CID { get; set; }
        public string CName { get; set; }
        public int SMID { get; set; }
    }
}
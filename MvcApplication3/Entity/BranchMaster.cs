using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace MvcApplication3.Entity
{
    public class BranchMaster
    {
        [Key]
        public int BMID { get; set; }
        public int CID { get; set; }
        public string BranchName { get; set; }
    }
}
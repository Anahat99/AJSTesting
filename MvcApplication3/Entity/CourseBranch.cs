using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace MvcApplication3.Entity
{
    public class CourseBranch
    {
        public string CourseName { get; set; }
        [Key]
        public int BMID { get; set; }
        public string BranchName { get; set; }
    }
}
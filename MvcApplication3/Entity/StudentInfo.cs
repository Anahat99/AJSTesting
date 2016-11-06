using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MvcApplication3.Entity
{
    public class StudentInfo
    {
        [Key]
        public int SIID { get; set; }
        public string SName { get; set; }
        public int SAge { get; set; }
        public string SContactNo { get; set; }
        public int SMID { get; set; }
        public int CID { get; set; }
    }
}
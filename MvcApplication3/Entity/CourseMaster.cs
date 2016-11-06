using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MvcApplication3.Entity
{
    public class CourseMaster
    {
        [Key]
        public int CID { get; set; }
        public string CourseName { get; set; }
    }
}
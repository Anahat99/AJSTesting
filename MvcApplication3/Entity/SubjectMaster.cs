using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MvcApplication3.Entity
{
    public class SubjectMaster
    {
        [Key]
        public int SubID { get; set; }
        public string SubjectName { get; set; }
    }
}
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MvcApplication3.Entity
{
    public class StateMaster
    {
        [Key]
        public int SMID { get; set; }
        public string SName { get; set; }

    }
}
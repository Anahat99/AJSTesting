using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcApplication3.Entity
{
    public class GetStudentInfo
    {
        public int SIID { get; set; }
        public string SName { get; set; }
        public int SAge { get; set; }
        public string SContactNo { get; set; }
        public string StateName { get; set; }
        public string CityName { get; set; }
    }
}
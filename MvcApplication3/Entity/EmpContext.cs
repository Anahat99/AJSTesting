using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;
using System.Data.Entity.Infrastructure;

namespace MvcApplication3.Entity
{
    public class EmpContext:DbContext
    {
        public EmpContext()
            : base("name=DefaultConnection")
        {
        
        }

        public DbSet<EMPMaster> EmpMasterData { get; set; }

        public DbSet<StateMaster> StateMasterData { get; set; }

        public DbSet<CourseMaster> CourseMasterData { get; set; }

        public DbSet<CityMaster> CityMasterData { get; set; }

        public DbSet<SubjectMaster> SubjectMasterData { get; set; }

        public DbSet<BranchMaster> BranchMasterData { get; set; }

        public DbSet<StudentInfo> StudentInfoData { get; set; }

        protected override void OnModelCreating(DbModelBuilder dbModelBuilder)
        {
            Database.SetInitializer<EmpContext>(null);
            dbModelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
            
        }
    }
}
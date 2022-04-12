using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;
using System.Linq;
using System.Web;

namespace LaptopStore.Models
{
    public class LaptopStoreContext : DbContext
    {
        public LaptopStoreContext() : base("LaptopStoreConnection")
        {

        }

        public DbSet<Category> categories { get; set; }
        public virtual DbSet<Product> products { get; set; }
        public virtual DbSet<User> users { get; set; }
        public virtual DbSet<User_Comment> User_Comment { get; set; }
        public DbSet<Bill> bills { get; set; }
        public DbSet<BillDetail> billDetails { get; set; }

        public DbSet<Blog> Blogs { get; set; }
        public virtual DbSet<Contact> contacts { get; set; }
    }
}

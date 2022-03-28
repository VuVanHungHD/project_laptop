using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;

namespace Model.Dao
{
    public class UserDao
    {
        LaptopStoreDbContext db = null;
        public UserDao()
        {
            db = new LaptopStoreDbContext();
        }
        public long Insert(User entity)
        {
            db.Users.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }
        public User GetById(string userName)
        {
            return db.Users.SingleOrDefault(x => x.UserName == userName);
        }

        public int Login(string userName, string passWord)
        {
            var result = db.Users.SingleOrDefault(x => x.UserName == userName);
            if (result == null)
            {
                return 0;
            }
            if (result.Status == false)
            {
                return -1;
            }
            else
            {
                if (result.Password == passWord)
                    return 1;
                else
                    return -2;
            }
        }

    }
}

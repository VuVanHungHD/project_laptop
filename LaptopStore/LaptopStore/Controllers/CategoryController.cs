using LaptopStore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;

namespace LaptopStore.Controllers
{
    public class CategoryController : Controller
    {
        private LaptopStoreContext db = new LaptopStoreContext();

        // GET: Category
        public ActionResult Index()
        {
            ViewBag.categories = db.categories.ToList();
            return View();
        }

        public ActionResult Details(int id)
        {
            ViewBag.category = db.categories.Find(id);
            ViewBag.categoriesChild = db.categories.Where(c => c.parentId == id).ToList();
            ViewBag.product = db.products.Where(p => p.categoryId == id).OrderByDescending(p=>p.promotionPrice).ToList();
            return View();
        }
    }
}
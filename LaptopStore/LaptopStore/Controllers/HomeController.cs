using LaptopStore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LaptopStore.Controllers
{
    public class HomeController : Controller
    {
        private LaptopStoreContext db = new LaptopStoreContext();
        public ActionResult Index()
        {
            
            ViewBag.top6Like = db.products.Where(p => p.status == "Còn hàng").OrderByDescending(p => p.likeCount).Take(6);
            ViewBag.top8New = db.products.Where(p => p.status == "Còn hàng").OrderByDescending(p => p.createDate).Take(8);
            ViewBag.top6InCate1 = db.products.Where(p => p.status == "Còn hàng" && p.categoryId == 1).OrderByDescending(p => p.id).Take(6).ToList();
            ViewBag.top6InCate2 = db.products.Where(p => p.status == "Còn hàng" && p.categoryId == 2).OrderByDescending(p => p.id).Take(6).ToList();
            ViewBag.top6InCate3 = db.products.Where(p => p.status == "Còn hàng" && p.categoryId == 1003).OrderByDescending(p => p.id).Take(6).ToList();
            return View();
        }
        public ActionResult test()
        {
            return View();
        }

    }
}

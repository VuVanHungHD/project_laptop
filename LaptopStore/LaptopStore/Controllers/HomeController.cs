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
            ViewBag.top6View = db.products.Where(p => p.status == "Còn hàng").OrderByDescending(p => p.viewCount).Take(6);
            ViewBag.top8New = db.products.Where(p => p.status == "Còn hàng").OrderByDescending(p => p.createDate).Take(8);
            ViewBag.top6NewDell = db.products.Where(p => p.status == "Còn hàng" && p.categoryId == 1007).OrderByDescending(p => p.id).Take(6).ToList();
            ViewBag.top6NewMsi = db.products.Where(p => p.status == "Còn hàng" && p.categoryId == 1008).OrderByDescending(p => p.id).Take(6).ToList();
            ViewBag.top6NewAsus = db.products.Where(p => p.status == "Còn hàng" && p.categoryId == 1011).OrderByDescending(p => p.id).Take(6).ToList();
            ViewBag.top6NewAcer = db.products.Where(p => p.status == "Còn hàng" && p.categoryId == 1012).OrderByDescending(p => p.id).Take(6).ToList();
            ViewBag.top6NewHp = db.products.Where(p => p.status == "Còn hàng" && p.categoryId == 1009).OrderByDescending(p => p.id).Take(6).ToList();
            return View();
        }

    }
}

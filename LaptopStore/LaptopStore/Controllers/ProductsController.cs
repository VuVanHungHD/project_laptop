using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using PagedList;
using LaptopStore.Models;

namespace LaptopStore.Controllers
{
    public class ProductsController : Controller
    {
        private LaptopStoreContext db = new LaptopStoreContext();

        // GET: Products
        public ActionResult Index(string search, int? page, int? size, string orderBy, string orderType)
        {
            var products = db.products.Include(p => p.category);
            if (!String.IsNullOrEmpty(search))
            {
                ViewBag.search = search;
                products = products.Where(p => p.name.Contains(search) || p.descript.Contains(search));
            }

            if(!String.IsNullOrEmpty(orderType) && orderType == "DESC")
            {
                ViewBag.orderType = "DESC";
                switch (orderBy)
                {
                    case "id":
                        products = products.OrderByDescending(p => p.id);
                        ViewBag.orderBy = "id";
                        break;
                    case "name":
                        products = products.OrderByDescending(p => p.name);
                        ViewBag.orderBy = "name";
                        break;
                    case "price":
                        products = products.OrderByDescending(p => p.price);
                        ViewBag.orderBy = "price";
                        break;
                    case "likeCount":
                        products = products.OrderByDescending(p => p.likeCount);
                        ViewBag.orderBy = "likeCount";
                        break;
                    default:
                        products = products.OrderByDescending(p => p.id);
                        ViewBag.orderBy = "id";
                        break;
                }
            }
            else
            {
                ViewBag.orderType = "ASC";
                switch (orderBy)
                {
                    case "id":
                        products = products.OrderBy(p => p.id);
                        ViewBag.orderBy = "id";
                        break;
                    case "name":
                        products = products.OrderBy(p => p.name);
                        ViewBag.orderBy = "name";
                        break;
                    case "price":
                        products = products.OrderBy(p => p.price);
                        ViewBag.orderBy = "price";
                        break;
                    case "likeCount":
                        products = products.OrderBy(p => p.likeCount);
                        ViewBag.orderBy = "likeCount";
                        break;
                    default:
                        products = products.OrderBy(p => p.id);
                        ViewBag.orderBy = "id";
                        break;
                }
            }    

            int pageNumber = (page ?? 1);
            int pageSize = (size ?? 12);
            ViewBag.size = pageSize;

            return View(products.ToPagedList(pageNumber, pageSize));
        }

        //GET: New Products


        // GET: Products/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.products.Include(p => p.category).Where(p => p.id == id).FirstOrDefault();
            if (product == null)
            {
                return HttpNotFound();
            }

            ViewBag.relatedProducts = db.products.Where(p => p.status == "Còn hàng" && p.category.id == product.category.id).Take(8).ToList();
            return View(product);
        }

        // GET: Products/Details/5
        public ActionResult Like(int id)
        {
            var userId = (int)Session["USER"];
            var pic = db.products.Find(id);
            pic.likeCount = pic.likeCount + 1;
            db.SaveChanges();

            return Json(new { status = "success" });
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}

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
                products = products.Where(p => p.name.Contains(search) || p.content.Contains(search));
            }

            if (!String.IsNullOrEmpty(orderType) && orderType == "DESC")
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
                        products = products.OrderByDescending(p => p.promotionPrice);
                        ViewBag.orderBy = "promotionPrice";
                        break;
                    case "likeCount":
                        products = products.OrderByDescending(p => p.viewCount);
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
                        products = products.OrderBy(p => p.promotionPrice);
                        ViewBag.orderBy = "promotionPrice";
                        break;
                    case "likeCount":
                        products = products.OrderBy(p => p.viewCount);
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
            var product = db.products.Find(id);

            if (product == null)
            {
                return HttpNotFound();
            }
            var users = db.users.Find(Session["USER"]);

           if(users!= null)
            {
                ViewBag.add = users.userType.ToString();
            }    
            var cmt = new User_Comment() { productId = product.id };
            var total= db.User_Comment.Where(c => c.productId == id).OrderByDescending(c => c.datePost).ToList().Count();
            ViewBag.total = total;
            var countComment = db.User_Comment.Where(c => c.productId == id).Sum(c => c.rating);
            float rateComment = (float)(countComment / total);
            ViewBag.rateComment = rateComment;
            var viw = product.viewCount + 1;
            ViewBag.product = product;
            return View("Details", cmt);
        }

        // GET: Products/Details/5
        public ActionResult View(int id)
        {
            var lap = db.products.Find(id);
            lap.viewCount = lap.viewCount + 1;
            db.SaveChanges();
            return Json(new { status = "succes" });
        }

        public ActionResult Watchlist(int? id)
        {

            return View();
        }

        [HttpPost]
        public ActionResult SendComment(User_Comment comment,int rating)
        {

            var userId = (int)Session["USER"];
            comment.datePost = DateTime.Now;
            comment.userId = db.users.Single(u => u.id.Equals(userId)).id;
            comment.rating = rating;
            db.User_Comment.Add(comment);
            db.SaveChanges();
            return RedirectToAction("Details", "Products", new
            {
                id = comment.productId
            });
        }
        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            User_Comment cmt = db.User_Comment.Find(id);
            db.User_Comment.Remove(cmt);
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

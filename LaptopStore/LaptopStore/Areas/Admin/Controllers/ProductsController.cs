using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using PagedList;
using LaptopStore.Models;

namespace LaptopStore.Areas.Admin.Controllers
{
    public class productsController : Controller
    {
        private LaptopStoreContext db = new LaptopStoreContext();

        // GET: Admin/products
        public ActionResult Index(string search, int? page, int? size)
        {
            var products = db.products.Include(p => p.category);
            if (!String.IsNullOrEmpty(search))
            {
                ViewBag.search = search;
                products = products.Where(p => p.name.Contains(search) || p.content.Contains(search));
            }
            products = products.OrderBy(p => p.id);
            int pageNumber = (page ?? 1);
            int pageSize = (size ?? 5);
            ViewBag.size = pageSize;

            return View(products.ToPagedList(pageNumber, pageSize));
        }

        // GET: Admin/products/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.products.Include(p => p.category).Where(p => p.id == id).First();
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // GET: Admin/products/Create
        public ActionResult Create()
        {
            ViewBag.categoryId = new SelectList(db.categories, "id", "name");
            var model = new Product() { status = "Còn hàng", viewCount = 0 };
            return View(model);
        }

        // POST: Admin/products/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,name,categoryId,shortDescript,content,price,percentSale,promotionPrice,cpu,ram," +
            "hardDrive,cardVGA,screenMonitor,camera,connector,weight,battery,operatingSystem,viewCount,imageUrl,status")] Product product, HttpPostedFileBase image)
        {
            if (image == null)
            {
                ModelState.AddModelError("imageUrl", "Ảnh không được trống");
            }

            if (ModelState.IsValid)
            {
                string path = Path.Combine(Server.MapPath("~/images/pictures/"), Path.GetFileName(image.FileName));
                image.SaveAs(path);
                product.imageUrl = ("/images/pictures/" + image.FileName);
                product.createDate = DateTime.Now;
                product.promotionPrice = (product.price - (product.price * product.percentSale)/100);
                db.products.Add(product);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.categoryId = new SelectList(db.categories, "id", "name", product.categoryId);
            return View(product);
        }

        // GET: Admin/products/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            ViewBag.categoryId = new SelectList(db.categories, "id", "name", product.categoryId);
            return View(product);
        }

        // POST: Admin/products/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,name,categoryId,price,descript,material,size,author,viewCount,imageUrl,status")] Product product, HttpPostedFileBase image, string imageOld)
        {
            if (ModelState.IsValid)
            {
                if (image != null)
                {
                    string path = Path.Combine(Server.MapPath("~/images/pictures/"), Path.GetFileName(image.FileName));
                    image.SaveAs(path);
                    product.imageUrl = ("/images/pictures/" + image.FileName);
                }
                else
                {
                    product.imageUrl = imageOld;
                }
                product.promotionPrice = (product.price - (product.price * product.percentSale) / 100);
                db.Entry(product).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.categoryId = new SelectList(db.categories, "id", "name", product.categoryId);
            return View(product);
        }

        // GET: Admin/products/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.products.Include(p => p.category).Where(p => p.id == id).First();
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // POST: Admin/products/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Product product = db.products.Find(id);
            db.products.Remove(product);
            db.SaveChanges();
            return RedirectToAction("Index");
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

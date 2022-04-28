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

namespace LaptopStore.Areas.Admin.Controllers
{
    public class User_CommentController : Controller
    {
        private LaptopStoreContext db = new LaptopStoreContext();

        // GET: Admin/User_Comment
        public ActionResult Index(string search, int? page, int? size)
        {
            var user_Comment = db.User_Comment.Include(u => u.Product).Include(u => u.User);
            if (!String.IsNullOrEmpty(search))
            {
                ViewBag.search = search;
                user_Comment = user_Comment.Where(c => c.Product.name.Contains(search) || c.Product.content.Contains(search) || c.User.username.Contains(search));
            }
            user_Comment = user_Comment.OrderByDescending(c=>c.datePost);
            int pageNumber = (page ?? 1);
            int pageSize = (size ?? 5);
            ViewBag.size = pageSize;

            return View(user_Comment.ToPagedList(pageNumber, pageSize));
        }


        // GET: Admin/User_Comment/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User_Comment user_Comment = db.User_Comment.Find(id);
            if (user_Comment == null)
            {
                return HttpNotFound();
            }
            return View(user_Comment);
        }

        // GET: Admin/User_Comment/Create
        public ActionResult Create()
        {
            ViewBag.productId = new SelectList(db.products, "id", "name");
            ViewBag.userId = new SelectList(db.users, "id", "username");
            return View();
        }

        // POST: Admin/User_Comment/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,rating,content,datePost,productId,userId")] User_Comment user_Comment)
        {
            if (ModelState.IsValid)
            {
                db.User_Comment.Add(user_Comment);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.productId = new SelectList(db.products, "id", "name", user_Comment.productId);
            ViewBag.userId = new SelectList(db.users, "id", "username", user_Comment.userId);
            return View(user_Comment);
        }

        // GET: Admin/User_Comment/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User_Comment user_Comment = db.User_Comment.Find(id);
            if (user_Comment == null)
            {
                return HttpNotFound();
            }
            ViewBag.productId = new SelectList(db.products, "id", "name", user_Comment.productId);
            ViewBag.userId = new SelectList(db.users, "id", "username", user_Comment.userId);
            return View(user_Comment);
        }

        // POST: Admin/User_Comment/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,rating,content,datePost,productId,userId")] User_Comment user_Comment)
        {
            if (ModelState.IsValid)
            {
                db.Entry(user_Comment).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.productId = new SelectList(db.products, "id", "name", user_Comment.productId);
            ViewBag.userId = new SelectList(db.users, "id", "username", user_Comment.userId);
            return View(user_Comment);
        }


        // POST: Admin/User_Comment/Delete/5
        [HttpPost]
        public ActionResult DeleteConfirmed(int id)
        {
            User_Comment userComment = db.User_Comment.Find(id);
            db.User_Comment.Remove(userComment);
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

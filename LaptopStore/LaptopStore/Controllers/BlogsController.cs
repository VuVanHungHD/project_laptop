﻿using PagedList;
using LaptopStore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LaptopStore.Controllers
{
    public class BlogsController : Controller
    {
        private LaptopStoreContext db = new LaptopStoreContext();
        // GET: Blogs
        public ActionResult Index(int? page, int? size)
        {
            var blogs = db.Blogs.Select(b => b);
            blogs = blogs.OrderBy(b => b.id);
            int pageNumber = (page ?? 1);
            int pageSize = (size ?? 12);
            ViewBag.size = pageSize;

            return View(blogs.ToPagedList(pageNumber, pageSize));
        }

        public ActionResult Details(int id)
        {
            return View(db.Blogs.Find(id));
        }
    }
}
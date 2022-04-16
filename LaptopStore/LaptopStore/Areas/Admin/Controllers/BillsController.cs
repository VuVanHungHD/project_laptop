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
    public class BillsController : Controller
    {
        private LaptopStoreContext db = new LaptopStoreContext();

        // GET: Admin/Bills
        public ActionResult Index(int? page, int? size)
        {
            var bills = db.bills.Include(b => b.user);
            bills = bills.OrderBy(p => p.id);
            int pageNumber = (page ?? 1);
            int pageSize = (size ?? 5);
            ViewBag.size = pageSize;

            return View(bills.ToPagedList(pageNumber, pageSize));
        }

        public ActionResult Details(int id)
        {
            ViewBag.bill = db.bills.Find(id);
            var billDetails = new Dictionary<Product, int>();
            ViewBag.billDetail = db.billDetails.SingleOrDefault(b => b.billId == id);
            decimal total = 0;
            var details = db.billDetails.Where(bdt => bdt.billId == id).ToList();
            foreach (var dt in details)
            {
                var productId = dt.productId;
                var product = db.products.Find(productId);
                billDetails.Add(product, dt.count);
                total += product.price * dt.count;
            }
            ViewBag.billDetails = billDetails;
            ViewBag.total = total;
            return View();
        }
        public ActionResult Done(int id, string stat)
        {
            var bill = db.bills.Find(id);
            if (stat.Equals("Chờ xác nhận"))
            {
                bill.status = "Chờ lấy hàng";
            }
            else if (stat.Equals("Chờ lấy hàng"))
            {
                bill.status = "Đang giao";
            }
            else
            {
                bill.status = "Đã giao";
            }

            db.SaveChanges();
            return Redirect("/Admin/Bills/Index");
        }

        public ActionResult Delete(int id)
        {
            var bill = db.bills.Find(id);
            bill.note = Request.Form["note"];
            ViewBag.billId = bill;
            if (bill.note == null)
            {
                return View();
            }
            bill.status = "Đã hủy";
            db.SaveChanges();
            return Redirect("/Admin/Bills/Index");
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

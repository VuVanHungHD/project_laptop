using PagedList;
using LaptopStore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LaptopStore.Controllers
{
    public class BillController : Controller
    {
        private LaptopStoreContext db = new LaptopStoreContext();
        // GET: Bill
        public ActionResult Index(int? page, int? size)
        {
            var userId = (int)Session["USER"];
            var bills = db.bills.Where(b => b.userId == userId);
            bills = bills.OrderBy(p => p.id);
            int pageNumber = (page ?? 1);
            int pageSize = (size ?? 5);
            ViewBag.size = pageSize;

            return View(bills.ToPagedList(pageNumber, pageSize));
        }

        public ActionResult AddBill()
        {
            ViewBag.user = db.users.Find(Session["USER"]);
            var cart = new Dictionary<Product, int>();
            decimal total = 0;
            if (Session["CART"] != null)
            {
                foreach (var c in (Dictionary<int, int>)Session["CART"])
                {
                    var product = db.products.Where(p => p.id == c.Key).First();
                    cart.Add(product, c.Value);
                    total += product.promotionPrice * c.Value;
                }
            }
            ViewBag.cart = cart;
            ViewBag.total = total;
            return View();
        }

        public ActionResult SaveBill()
        {
            var bill = new Bill();
            bill.userId = (int)Session["USER"];
            decimal total = 0;
            foreach (var c in (Dictionary<int, int>)Session["CART"])
            {
                var product = db.products.Where(p => p.id == c.Key).First();
                db.billDetails.Add(new BillDetail()
                {
                    product = product,
                    bill = bill,
                    count = c.Value
                });
                total += product.promotionPrice * c.Value;
            }
            bill.total = total;
            bill.dateCreate = DateTime.Now;
            bill.status = "Đang giao";
            db.SaveChanges();

            Session["CART"] = null;

            return Redirect("/Bill/Index");
        }

        public ActionResult Details(int id)
        {
            ViewBag.bill = db.bills.Find(id);
            var billDetails = new Dictionary<Product, int>();
            decimal total = 0;
            var details = db.billDetails.Where(bdt => bdt.billId == id).ToList();
            foreach (var dt in details)
            {
                var productId = dt.productId;
                var product = db.products.Find(productId);
                billDetails.Add(product, dt.count);
                total += product.promotionPrice * dt.count;
            }
            ViewBag.billDetails = billDetails;
            ViewBag.total = total;
            return View();
        }

        public ActionResult Done(int id)
        {
            var bill = db.bills.Find(id);
            bill.status = "Đã giao";
            db.SaveChanges();
            return Redirect("/Bill/Index");
        }

        public ActionResult Delete(int id)
        {
            var bill = db.bills.Find(id);
            bill.status = "Đã hủy";
            db.SaveChanges();
            return Redirect("/Bill/Index");
        }
    }
}

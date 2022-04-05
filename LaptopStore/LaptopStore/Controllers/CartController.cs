using Newtonsoft.Json;
using LaptopStore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LaptopStore.Controllers
{
    public class CartController : Controller
    {
        private LaptopStoreContext db = new LaptopStoreContext();
        public ActionResult Index()
        {
            var cart = new Dictionary<Product, int>();
            decimal total = 0;
            if (Session["CART"] != null)
            {
                foreach (var c in (Dictionary<int, int>)Session["CART"])
                {
                    var product = db.products.Where(p => p.id == c.Key).First();
                    cart.Add(product, c.Value);
                    total += product.price * c.Value;
                }

            }

            ViewBag.cart = cart;
            ViewBag.total = total;

            return View();
        }

        [HttpPost]
        public ActionResult AddToCart(int idProduct, int? countProduct)
        {

            if (Session["CART"] == null)
            {
                var cart = new Dictionary<int, int>();//id sp - so luong
                int count = (countProduct ?? 1);
                cart.Add(idProduct, count);
                Session["CART"] = cart;
            }
            else
            {
                var cart = (Dictionary<int, int>)Session["CART"];
                if (cart.ContainsKey(idProduct))
                {
                    if (countProduct == null)
                    {
                        cart[idProduct] = cart[idProduct]++;
                    }
                    else
                    {
                        cart[idProduct] = (int)countProduct;
                    }    
                }
                else
                {
                    int count = (countProduct ?? 1);
                    cart.Add(idProduct, count);
                }
            }

            return Json(new { status = "success" });
        }

        [HttpPost]
        public ActionResult DeleteItemInCart(int idProduct)
        {
            var cart = (Dictionary<int, int>)Session["CART"];
            cart.Remove(idProduct);
            return Redirect("/Cart");
        }

        public ActionResult UpdateCart(string jsonCart)
        {
            var cart = (Dictionary<int, int>)Session["CART"];
            var cartUpdate = JsonConvert.DeserializeObject<Dictionary<int, int>>(jsonCart);
            if (cartUpdate != null)
            {
                foreach (var c in cartUpdate)
                {
                    cart[c.Key] = c.Value;
                }
            }

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
﻿using LaptopStore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LaptopStore.filters
{
    public class MenuFilter : IActionFilter
    {
        private LaptopStoreContext db = new LaptopStoreContext();
        public void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var url = filterContext.HttpContext.Request.Url.ToString();
            //nếu url không chứa Admin thì tức là trang user truy cập ==> lấy category gán vào menu
            
            if (!url.Contains("Admin") && !url.Contains("Login") && !url.Contains("Register")) 
            {  
                if (filterContext.Controller is Controller controller)
                    controller.ViewBag.categoriesInMenu = db.categories.ToList();
            }

            
        }
        public void OnActionExecuted(ActionExecutedContext filterContext)
        {
            
        }

    }
}

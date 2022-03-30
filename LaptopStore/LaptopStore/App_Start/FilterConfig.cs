using System.Web;
using System.Web.Mvc;
using LaptopStore.filters;

namespace LaptopStore
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
            filters.Add(new AuthorizationFilter());
            filters.Add(new MenuFilter());
        }
    }
}

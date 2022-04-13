namespace LaptopStore.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class User_Comment
    {
        public int id { get; set; }
        [Required(ErrorMessage ="Chon sao")]
        [DefaultValue(1)]
        public int rating { get; set; }
        public string content { get; set; }

        public DateTime? datePost { get; set; }

        public int productId { get; set; }

        public int userId { get; set; }

        public virtual Product Product { get; set; }

        public virtual User User { get; set; }
    }
}

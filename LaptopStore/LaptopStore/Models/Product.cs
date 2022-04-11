using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace LaptopStore.Models
{
    [Table("Product")]
    public partial class Product
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key]
        [DisplayName("Mã sản phẩm")]
        public int id { get; set; }

        [Required(ErrorMessage = "Tên sản phẩm không được trống!")]
        [StringLength(50)]
        [DisplayName("Tên sản phẩm")]
        public string name { get; set; }

        [StringLength(250)]
        public Category category { get; set; }

        [Required(ErrorMessage = "Loại sản phẩm không được để trống!")]
        [DisplayName("Loại sản phẩm")]
        public int categoryId { get; set; }
        [StringLength(250)]

        [DisplayName("Tiêu đề sản phẩm")]
        public string shortDescript { get; set; }

        [DefaultValue(0)]
        [Column(TypeName = "money")]
        [DisplayName("Giá")]
        public decimal price { get; set; }

        [DefaultValue(0)]
        [DisplayName("% khuyến mãi")]
        public int percentSale { get; set; }
        [DefaultValue(0)]
        [Column(TypeName = "money")]
        [DisplayName("Giá khuyến mãi")]
        public decimal promotionPrice { get; set; }

        [DisplayName("Mô tả")]
        public string content { get; set; }
        [DisplayName("CPU")]

        public string cpu { get; set; }
        [DisplayName("RAM")]

        public string ram { get; set; }
        [DisplayName("Ổ cứng")]
        public string hardDrive { get; set; }
        [DisplayName("Card VGA")]

        public string cardVGA { get; set; }
        [DisplayName("Màn hình")]

        [StringLength(250)]
        public string screenMonitor { get; set; }
        [DisplayName("Camera")]

        public string camera { get; set; }
        [DisplayName("Cổng kết nối")]

        public string connector { get; set; }
        [DisplayName("Trọng lượng")]

        public string weight { get; set; }
        [DisplayName("Pin")]

        public string battery { get; set; }
        [DisplayName("Hệ điều hành")]

        public string operatingSystem { get; set; }

        [DefaultValue(0)]
        [DisplayName("Lượt xem")]
        public int viewCount { get; set; }
        [DisplayName("")]

        public string imageUrl { get; set; }
        [DisplayName("Ngày nhập")]
        [DefaultValue("DateTime.Now")]
        public DateTime? createDate { get; set; }

        [DefaultValue("Còn hàng")]
        [DisplayName("Trạng thái")]
        public string status { get; set; }
        [StringLength(100)]
        [DisplayName("Bảo hành")]
        public string warranty { get; set; }
    }
}

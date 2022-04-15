using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace LaptopStore.Models
{
    [Table("BillDetail")]
    public class BillDetail
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key]
        public int id { get; set; }
        public Product product { get; set; }
        [Required(ErrorMessage = "Sản phẩm mua không được trống")]
        [DisplayName("Sản phẩm mua")]
        public int productId { get; set; }
        public Bill bill { get; set; }
        [Required(ErrorMessage = "Đơn hàng không được trống")]
        [DisplayName("Đơn hàng")]
        public int billId { get; set; }

        [DefaultValue(0)]
        public int count { get; set; }
        [StringLength(300)]
        [Required(ErrorMessage = "Địa chỉ không được để trống!")]
        public string address { get; set; }
        [Required(ErrorMessage = "Số điện thoại không được trống!")]
        [StringLength(15)]
        [DisplayName("Số điện thoại")]
        public string phoneNumber { get; set; }
    }
}
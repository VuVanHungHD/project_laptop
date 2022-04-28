using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace LaptopStore.Models
{
    [Table("Bill")]
    public class Bill
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key]
        [DisplayName("Mã đơn hàng")]
        public int id { get; set; }

        public virtual User user { get; set; }
        [Required(ErrorMessage = "Người đặt hàng không được trống")]
        [DisplayName("Người đặt hàng")]
        public int userId { get; set; }

        [DefaultValue(0)]
        [DisplayName("Tổng tiền")]
        public decimal total { get; set; }

        [DisplayName("Ngày đặt")]
        public DateTime dateCreate { get; set; }

        [DisplayName("Trạng thái")]
        public string status { get; set; } //Chờ xác nhận , chờ lấy hàng, đang giao, đã giao, đã hủy
        [DisplayName("Ghi chú")]
        public string note { get; set; } //Ghi chú tại sao hủy
    }
}
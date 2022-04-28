using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.Spatial;

namespace LaptopStore.Models
{
    [Table("Contact")]
    public partial class Contact
    {
        public int id { get; set; }
        [DisplayName("Nội dung giới thiệu")]
        [Required(ErrorMessage = "Nội dung giới thiệu không được để trống!")]
        [Column(TypeName = "ntext")]
        public string content { get; set; }
        [Required(ErrorMessage = "Email người dùng không được trống!")]
        [StringLength(50)]
        [DisplayName("Email")]
        public string email { get; set; }

        [Required(ErrorMessage = "Số điện thoại không được trống!")]
        [StringLength(15)]
        [DisplayName("Số điện thoại")]
        public string phonenumber { get; set; }

        [Required(ErrorMessage = "Địa chỉ không được trống!")]
        [StringLength(200)]
        [DisplayName("Địa chỉ")]
        public string address { get; set; }
    }
}

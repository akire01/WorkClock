using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Evidencija_Radnih_Sati.Models.vm
{
    public class DjelatnikVM
    {
        [Key]
        public int IDDjelatnik { get; set; }
        
        public string TipDjelatnika { get; set; }

        [Required(ErrorMessage = "Morate unijeti ime")]
        public string Ime { get; set; }

        [Required(ErrorMessage = "Morate unijeti prezime")]
        public string Prezime { get; set; }

        [Required(ErrorMessage = "Morate unijeti email adresu")]
        [RegularExpression(@"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*", 
            ErrorMessage = "Email adresa nije valjana")]
        public string Email { get; set; }

        public List<EvidencijaZaposlenika> ev { get; set; }

        public System.DateTime DatumZaposlenja { get; set; }
        public string TimDjelatnika { get; set; }
        public Nullable<bool> Aktivnost { get; set; }
        public override string ToString()
        {
            return $"{Ime} {Prezime}";
        }

        [Required(ErrorMessage = "Morate unijeti username")]
        
        public string Username { get; set; }
        [Required(ErrorMessage = "Morate unijeti password")]
        public string Password { get; set; }
        
        public List<string> Projekti { get; set; }

    }
}
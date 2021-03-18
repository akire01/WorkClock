using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IzvještavanjeAdministracija.Models
{
    public class Projekt
    {
        public string Naziv { get; set; }
        public string DatumOtvaranja { get; set; }
        public string Voditelj { get; set; }
        public string Klijent{ get; set; }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IzvještavanjeAdministracija.Models
{
    [Serializable]
    public class Tim
    {
        public string IDTim { get; set; }
        public string Naziv { get; set; }
        public string DatumKreiranja { get; set; }
        public int Aktivnost { get; set; }
        public string VoditeljID { get; set; }

       
    }
}
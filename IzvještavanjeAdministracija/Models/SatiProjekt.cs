using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IzvještavanjeAdministracija.Models
{
    [Serializable]
    public class SatiProjekt
    {
        public int DjelatnikID { get; set; }
        public int ProjektID { get; set; }
        public string Datum { get; set; }
        public int PrekovremeniSati { get; set; }
        public int RadniSati { get; set; }
        public int Predano{ get; set; }
    }
}
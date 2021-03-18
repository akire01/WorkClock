using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Evidencija_Radnih_Sati.Models
{
    public class EvidencijaZaposlenika
    {
        public int ProjektID { get; set; }
        public string Projekt { get; set; }
        public DateTime Datum { get; set; }
        public int RedovniSati { get; set; }
        public int PrekovremeniSati { get; set; }
        public bool Predano { get; set; }

    }
}
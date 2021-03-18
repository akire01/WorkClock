using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Evidencija_Radnih_Sati.Models.vm
{
    public class SatiProjektVM
    {
        public int IDSatiProjekt { get; set; }
        public int DjelatnikID { get; set; }
        public int ProjektID { get; set; }
        public System.DateTime Datum { get; set; }
        public Nullable<int> SatiPrekovremeni { get; set; }
        public Nullable<int> SatiRadni { get; set; }
        public Nullable<bool> Predano { get; set; }

        public virtual Djelatnik Djelatnik { get; set; }
        public virtual Projekt Projekt { get; set; }
    }
}
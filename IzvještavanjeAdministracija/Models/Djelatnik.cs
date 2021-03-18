using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IzvještavanjeAdministracija.Models
{
    [Serializable]
    public class Djelatnik
    {
        public string IDDJelatnik { get; set; }
        public string Ime { get; set; }
        public string Prezime { get; set; }
        public string Email { get; set; }
        public string DatumZaposlenja { get; set; }
        public string TipDjelatnika { get; set; }
        public string Tim { get; set; }
        public string Aktivnost { get; set; }
        public string PunoIme {
            get => Ime + " " + Prezime;
        }

        public override string ToString() => $"{Ime} + {Prezime} + {TipDjelatnika}";

        

    }
}
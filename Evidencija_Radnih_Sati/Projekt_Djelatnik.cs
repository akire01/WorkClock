//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Evidencija_Radnih_Sati
{
    using System;
    using System.Collections.Generic;
    
    public partial class Projekt_Djelatnik
    {
        public int IDProjekt_Djelatnik { get; set; }
        public int ProjektID { get; set; }
        public int DjelatnikID { get; set; }
    
        public virtual Djelatnik Djelatnik { get; set; }
        public virtual Projekt Projekt { get; set; }
    }
}

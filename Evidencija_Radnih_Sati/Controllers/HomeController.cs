using Evidencija_Radnih_Sati.App_Start;
using Evidencija_Radnih_Sati.Models;
using Evidencija_Radnih_Sati.Models.vm;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Services.Description;
using System.Web.UI.WebControls;

namespace Evidencija_Radnih_Sati.Controllers
{
    public class HomeController : Controller
    {
        BazaPRA db = new BazaPRA();

        public ActionResult RedirectToAspx()
        {
            return Redirect("http://localhost:56126/Login.aspx");
        }


        [HttpGet]
        public ActionResult Edit()
        {

            HttpCookie cookie = Request.Cookies["idKorisnik"];
            if (cookie == null) {
                return Redirect("http://localhost:56126/Login.aspx");
            }

            var djelatnik = db.GetDjelatnik(int.Parse(cookie.Value.ToString())).FirstOrDefault();

            var viewModel = AutoMapperConfig.Mapper.Map<DjelatnikVM>(djelatnik);
            viewModel.TipDjelatnika = db.TipDjelatnikas.Find(djelatnik.TipID).Naziv;
            viewModel.TimDjelatnika = db.Tims.Find(djelatnik.TimID).Naziv;

            var userId = db.LoginDjelatniks.ToList().Find(login => login.DjelatnikID == int.Parse(cookie.Value.ToString())).UserID;

            viewModel.Username = db.LoginDjelatniks.Find(userId).Username;
            viewModel.Password = db.LoginDjelatniks.Find(userId).Password;

            return View(viewModel);
        }

        [HttpPost]
        public ActionResult Edit(DjelatnikVM d)
        {

            HttpCookie cookie = Request.Cookies["idKorisnik"];
            var userId = db.LoginDjelatniks.ToList().Find(login => login.DjelatnikID == int.Parse(cookie.Value.ToString())).UserID;

            var djelatnik = db.Djelatniks.Find(d.IDDjelatnik);
            var korisnik = db.LoginDjelatniks.Find(userId);
            djelatnik.Ime = d.Ime;
            djelatnik.Prezime = d.Prezime;
            djelatnik.Email = d.Email;
            d.TimDjelatnika = db.Tims.Find(djelatnik.TimID).Naziv;
            d.TipDjelatnika = db.TipDjelatnikas.Find(djelatnik.TipID).Naziv;
       
            korisnik.Username = d.Username;
            korisnik.Password = d.Password;

            try
            {
                if (ModelState.IsValid)
                {
                    db.SaveChanges();
                    ViewBag.Message = String.Format("Profil je uspješno ažuriran");
                }
                
            }
            catch (System.Data.Entity.Validation.DbEntityValidationException dbEx)
            {
                Exception raise = dbEx;
                foreach (var validationErrors in dbEx.EntityValidationErrors)
                {
                    foreach (var validationError in validationErrors.ValidationErrors)
                    {
                        string message = string.Format("{0}:{1}",
                            validationErrors.Entry.Entity.ToString(),
                            validationError.ErrorMessage);
                        
                        raise = new InvalidOperationException(message, raise);
                    }
                }
                throw raise;
            }
            
            return View(d);

        }

        [HttpGet]
        public ActionResult Table()
        {

            HttpCookie cookie = Request.Cookies["idKorisnik"];
            if (cookie == null)
            {
                return Redirect("http://localhost:56126/Login.aspx");
            }

            var djelatnik = db.GetDjelatnik(int.Parse(cookie.Value.ToString())).FirstOrDefault();

            var viewModel = AutoMapperConfig.Mapper.Map<DjelatnikVM>(djelatnik);


            List<int> projektiId = new List<int>();

            List<Projekt_Djelatnik> projektiDjelatnika = db.Projekt_Djelatnik.ToList();

            foreach (var projektDjel in projektiDjelatnika)
            {
                if (projektDjel.DjelatnikID == djelatnik.IDDjelatnik)
                {
                    projektiId.Add(projektDjel.ProjektID);
                }
            }
            List<string> projekti = new List<string>();
            foreach (var p in db.Projekts)
            {
                foreach (var pId in projektiId)
                {
                    if (p.IDProjekt == pId)
                    {
                        projekti.Add(p.Naziv);
                    }
                }
               
            }
            projekti.Add("Pauza");
            projekti.Add("Bolovanje");
            projekti.Add("Godišnji odmor");
            projekti.Add("Putovanje");
            List<EvidencijaZaposlenika> evidencije = new List<EvidencijaZaposlenika>();
            foreach (var p in db.Projekts)
            {
                foreach (var pId in projektiId)
                {
                    if (p.IDProjekt == pId || p.Naziv == "Pauza" || p.Naziv=="Bolovanje" || p.Naziv=="Godišnji odmor" || p.Naziv=="Putovanje")
                    {
                        EvidencijaZaposlenika ev = new EvidencijaZaposlenika
                        {
                            ProjektID = p.IDProjekt,
                            Projekt = p.Naziv,
                            Datum = DateTime.Now.Date,
                            RedovniSati = 0,
                            PrekovremeniSati = 0
                        };
                        
                        evidencije.Add(ev);
                        break;
                    }

                }
               
            }
            viewModel.ev = evidencije;
            viewModel.Projekti = projekti;

            return View(viewModel);
        }

        [HttpPost]
        public ActionResult Table(DjelatnikVM d)
        {
            
            var viewModel = d;
            foreach (var ev in d.ev)
            {
                SatiProjekt sp = new SatiProjekt
                {
                    DjelatnikID = d.IDDjelatnik,
                    ProjektID = ev.ProjektID,
                    Datum = DateTime.Now.Date,
                    SatiRadni = ev.RedovniSati,
                    SatiPrekovremeni = ev.PrekovremeniSati,
                    Predano = ev.Predano
              
                };
              
                db.SatiProjekts.Add(sp);
            }
            db.SaveChanges();

            return View(viewModel);

        }
    }
}


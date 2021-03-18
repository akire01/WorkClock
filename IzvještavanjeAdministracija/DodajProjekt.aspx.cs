using IzvještavanjeAdministracija.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IzvještavanjeAdministracija
{
    public partial class DodajProjekt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                NapuniListuVoditelja();
                NapuniListuKlijenata();
            }
        }
        private void NapuniListuVoditelja()
        {
            
            ddlVoditelj.DataSource = Repo.GetVoditelji();
            ddlVoditelj.DataTextField = "PunoIme";
            ddlVoditelj.DataValueField = "IDDjelatnik";
            ddlVoditelj.DataBind();
        }

        private void NapuniListuKlijenata()
        {
            ddlKlijent.DataSource = Repo.GetKlijenti();
            ddlKlijent.DataTextField = "Ime";
            ddlKlijent.DataValueField = "IDKlijent";
            ddlKlijent.DataBind();

        }

        protected void btnDjelatnici_Click(object sender, EventArgs e)
        {
            cbDjelatnici.Items.Clear();
            List<Djelatnik> djelatnici = Repo.GetDjelatnici();
           
            djelatnici.Sort((x, y) => x.Ime.CompareTo(y.Ime));
            foreach (var d in djelatnici)
            {
                cbDjelatnici.Items.Add(new ListItem(d.Ime + " " + d.Prezime,d.IDDJelatnik.ToString()));
            }

            ScriptManager.RegisterStartupScript(this, this.GetType(), "modalDjelatniciProjekta", "$('#modalDjelatniciProjekta').modal('show');", true);
        }

        protected void btnDodajDjelatnike_Click(object sender, EventArgs e)
        {
            List<int> idevi = new List<int>();
            foreach (ListItem item in cbDjelatnici.Items)
            {
                if (item.Selected)
                    idevi.Add(int.Parse(item.Value.ToString()));
            }

            ViewState["odabraniDjelatnici"] = idevi;
           
        }
        protected void btnTimovi_Click(object sender, EventArgs e)
        {
            cbTimovi.Items.Clear();
            List<Tim> timovi = Repo.GetTimovi();

            timovi.Sort((x, y) => x.Naziv.CompareTo(y.Naziv));
            foreach (var t in timovi)
            {
                
                cbTimovi.Items.Add(new ListItem(t.Naziv,t.IDTim.ToString()));
            }

            ScriptManager.RegisterStartupScript(this, this.GetType(), "modalTimoviProjekta", "$('#modalTimoviProjekta').modal('show');", true);
        }

        protected void btnDodajTimove_Click(object sender, EventArgs e)
        {
            List<int> idtimova = new List<int>();
            foreach (ListItem item in cbTimovi.Items)
            {
                if (item.Selected)
                    idtimova.Add(int.Parse(item.Value.ToString()));
            }
            ViewState["odabraniTimovi"] = idtimova;
        }

        protected void btnAddProject_Click(object sender, EventArgs e)
        {
            string naziv = txtNaziv.Text;
            string datumOtvaranja = txtDate.Text;
            int idVoditelj = int.Parse(ddlVoditelj.SelectedItem.Value);
            int idKlijent = int.Parse(ddlKlijent.SelectedItem.Value);

            Repo.InsertProject(naziv,datumOtvaranja,idVoditelj,idKlijent);

            int id = Repo.GetProjectId(naziv);

            foreach (var item in ViewState["odabraniDjelatnici"] as List<int>)
            {
                Repo.InsertDjelatnikNaProjekt(item, id);
            }
            foreach (var item in ViewState["odabraniTimovi"] as List<int>)
            {
                Repo.InsertTimNaProjekt(item, id);
            }
            

            ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#exampleModal').modal('show');", true);
        }
    }
}
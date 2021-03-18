using IzvještavanjeAdministracija.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IzvještavanjeAdministracija
{
    public partial class UrediProjekt : System.Web.UI.Page
    {
        string value;
        int id;
        List<Djelatnik> djelatniciNaProjektu = new List<Djelatnik>();
        List<Tim> timoviNaProjektu = new List<Tim>();
        protected void Page_Load(object sender, EventArgs e)
        {
            value = Request.QueryString["x"];
            id = int.Parse(value.ToString());
            ViewState["id"] = id;
            if (!IsPostBack)
            {
                NapuniListuVoditelja();
                NapuniListuKlijenata();
                NapuniPolja(id);
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

        private void NapuniPolja(int id)
        {
            Projekt p = Repo.GetProjekt(id);
            txtNaziv.Text = p.Naziv;
            txtDate.Text = Convert.ToDateTime(p.DatumOtvaranja).ToString("yyyy-MM-dd");
            ddlVoditelj.SelectedValue = p.Voditelj;
            ddlKlijent.SelectedValue = p.Klijent;
            djelatniciNaProjektu = Repo.GetDjelatnikeNaProjektu(id);
            timoviNaProjektu = Repo.GetTimoveNaProjektu(id);
            ViewState["djelatniciNaProjektu"] = djelatniciNaProjektu;
            ViewState["timoviNaProjektu"] = timoviNaProjektu;
            ViewState["odabraniDjelatnici"] = null;
            ViewState["odabraniTimovi"] = null;
        }

        protected void btnDjelatnici_Click(object sender, EventArgs e)
        {
            cbDjelatnici.Items.Clear();
            List<Djelatnik> djelatnici = Repo.GetDjelatnici();

            djelatnici.Sort((x, y) => x.Ime.CompareTo(y.Ime));
            foreach (var d in djelatnici)
            {
                cbDjelatnici.Items.Add(new ListItem(d.Ime + " " + d.Prezime, d.IDDJelatnik.ToString()));
            }
            foreach (var item in ViewState["djelatniciNaProjektu"] as List<Djelatnik>)
            {
                for (int i = 0; i < cbDjelatnici.Items.Count; i++)
                {
                    if (item.IDDJelatnik.Equals(cbDjelatnici.Items[i].Value))
                    {
                        cbDjelatnici.Items[i].Selected = true;
                    }
                }
            } 
            
            ScriptManager.RegisterStartupScript(this, this.GetType(), "modalDjelatniciProjekta", "$('#modalDjelatniciProjekta').modal('show');", true);
        }

        protected void btnTimovi_Click(object sender, EventArgs e)
        {
            cbTimovi.Items.Clear();
            List<Tim> timovi = Repo.GetTimovi();

            timovi.Sort((x, y) => x.Naziv.CompareTo(y.Naziv));
            foreach (var t in timovi)
            {
                cbTimovi.Items.Add(new ListItem(t.Naziv, t.IDTim.ToString()));
            }
            foreach (var item in ViewState["timoviNaProjektu"] as List<Tim>)
            {
                for (int i = 0; i < cbTimovi.Items.Count; i++)
                {
                    if (item.IDTim.Equals(cbTimovi.Items[i].Value))
                    {
                        cbTimovi.Items[i].Selected = true;
                    }
                }
            }

            ScriptManager.RegisterStartupScript(this, this.GetType(), "modalTimoviProjekta", "$('#modalTimoviProjekta').modal('show');", true);
        }

        protected void btnDodajDjelatnike_Click(object sender, EventArgs e)
        {
            List<int> odabraniDjelatnici = new List<int>();
            foreach (ListItem item in cbDjelatnici.Items)
            {
                if (item.Selected)
                    odabraniDjelatnici.Add(int.Parse(item.Value.ToString()));
            }

            ViewState["odabraniDjelatnici"] = odabraniDjelatnici;
        }

        protected void btnDodajTimove_Click(object sender, EventArgs e)
        {
            List<int> odabraniTimovi = new List<int>();
            foreach (ListItem item in cbTimovi.Items)
            {
                if (item.Selected)
                    odabraniTimovi.Add(int.Parse(item.Value.ToString()));
            }

            ViewState["odabraniTimovi"] = odabraniTimovi;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string naziv = txtNaziv.Text;
            string datumOtvaranja = txtDate.Text;
            int idVoditelj = int.Parse(ddlVoditelj.SelectedItem.Value);
            int idKlijent = int.Parse(ddlKlijent.SelectedItem.Value);
            int idProjekta = int.Parse(ViewState["id"].ToString());

            Repo.UpdateProjekt(idProjekta, naziv, datumOtvaranja, idVoditelj, idKlijent);


            List<int> trenutniDjelatnici = (ViewState["djelatniciNaProjektu"] as List<Djelatnik>).
                ConvertAll<int>(djelatnik => int.Parse(djelatnik.IDDJelatnik)); ;
            List<int> izmjenjeniDjelatnici = ViewState["odabraniDjelatnici"] as List<int>;
            if (izmjenjeniDjelatnici != null)
            {
                // Izbaciti one koji si bili zaselektirani, a vise nisu
                foreach (var djelatnik in trenutniDjelatnici)
                {
                    if (!izmjenjeniDjelatnici.Contains(djelatnik))
                    {
                        Repo.IzbaciDjelatnikaSProjekta(idProjekta, djelatnik);
                    }
                }
                //Iz izmjenjenih djelatnika maknuti one koji su vec bili zaselektirani, ne treba ih dodavati ponovno
                foreach (var djelatnik in trenutniDjelatnici.Intersect(izmjenjeniDjelatnici))
                {
                    izmjenjeniDjelatnici.Remove(djelatnik);
                }
                //dodati novoselektirane
                foreach (var djelatnik in izmjenjeniDjelatnici)
                {
                    Repo.InsertDjelatnikNaProjekt(djelatnik, idProjekta);
                }

            }

            List<int> trenutniTimovi = (ViewState["timoviNaProjektu"] as List<Tim>).
                 ConvertAll<int>(tim => int.Parse(tim.IDTim)); ;
            List<int> izmjenjeniTimovi = ViewState["odabraniTimovi"] as List<int>;

            if (izmjenjeniTimovi != null)
            {
                foreach (var tim in trenutniTimovi)
                {
                    if (!izmjenjeniTimovi.Contains(tim))
                    {
                        Repo.IzbaciTimSProjekta(id, tim);
                    }
                }

                foreach (var tim in trenutniTimovi.Intersect(izmjenjeniTimovi))
                {
                    izmjenjeniTimovi.Remove(tim);
                }

                foreach (var tim in izmjenjeniTimovi)
                {
                    Repo.InsertTimNaProjekt(tim, idProjekta);
                }

            }

            ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#exampleModal').modal('show');", true);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Projekti.aspx");
        }
    }
}
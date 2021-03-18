using IzvještavanjeAdministracija.Models;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IzvještavanjeAdministracija
{
    public partial class Projekti : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }
        protected string GetDatum(string datum)
        {
            return Convert.ToDateTime(datum).ToString("dd.MM.yyyy");
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("DodajProjekt.aspx");
        }
        protected string ImeOsobe(int id)
        {
            if (id.ToString() == null) return "";
            Djelatnik djelatnik = Repo.GetDjelatnik(id);

           return djelatnik.Ime + " " + djelatnik.Prezime;
        }

        protected string ImeKlijenta(string id)
        {
            if (id.ToString() == "") return "";
           
            return Repo.GetKlijent(int.Parse(id.ToString())).Ime;
        }


        protected void btnUredi_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int id = int.Parse(btn.CommandArgument.ToString());

            Response.Redirect(String.Format("~/UrediProjekt.aspx?x={0}", id));
        }
        protected string Aktivnost(string status) => status == "True" ? "Aktivan" : "Neaktivan";
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label label = (Label)e.Row.Cells[6].FindControl("lblStatus");

                string status = label.Text;

                if (status == "Neaktivan") e.Row.BackColor = Color.LightGray;
                else e.Row.BackColor = Color.White;

            }
        }
        protected void btnDeakt_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            Session["CurrentId"] = int.Parse(btn.CommandArgument.ToString());

            ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#mojModal').modal('show');", true);
        }

        protected void btnAktivnost_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string vrijednost = btn.Text;
            int id = int.Parse(Session["CurrentId"].ToString());

            if (vrijednost == "Aktivan" && id == 1 || vrijednost == "Neaktivan" && id == 0) return;
            else if (btn.CommandName == "Aktiviraj") Repo.ActivityChange("projekt", id, 1);
            else Repo.ActivityChange("projekt", id, 0);
            GridView1.DataBind();

            ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#mojModal').modal('hide');", true);
        }

        protected void btnDjelatnici_Click(object sender, EventArgs e)
        {
            bl.Items.Clear();
            Button btn = (Button)sender;
            int id = int.Parse(btn.CommandArgument.ToString());

            List<Djelatnik> djelatnici = Repo.GetDjelatnikeNaProjektu(id);
            if (djelatnici.Count > 0)
            {
                lbbulleted.Text = $"Djelatnici ({djelatnici.Count()}):";
                foreach (var p in djelatnici)
                {
                   bl.Items.Add(new ListItem(p.Ime.ToString() + " " + p.Prezime.ToString()));
                }

            }
            else { lbbulleted.Text = "Na projektu trenutno nema djelatnika"; }

            ScriptManager.RegisterStartupScript(this, this.GetType(), "projectsModal", "$('#projectsModal').modal('show');", true);
        }

        protected void btnTimovi_Click(object sender, EventArgs e)
        {
            bl.Items.Clear();
            Button btn = (Button)sender;
            int id = int.Parse(btn.CommandArgument.ToString());

            List<Tim> timovi = Repo.GetTimoveNaProjektu(id);
            if (timovi.Count > 0)
            {
                lbbulleted.Text = $"Timovi ({timovi.Count}):";
                foreach (var t in timovi)
                {
                    bl.Items.Add(new ListItem(t.Naziv));
                }

            }
            else { lbbulleted.Text = "Na projektu trenutno nema timova"; }

            ScriptManager.RegisterStartupScript(this, this.GetType(), "projectsModal", "$('#projectsModal').modal('show');", true);
        }

        
    }
}


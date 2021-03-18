using IzvještavanjeAdministracija.Models;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IzvještavanjeAdministracija
{
    public partial class Timovi : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

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
        protected string GetDatum(string datum)
        {
            if (datum == "") return "";
            
            return Convert.ToDateTime(datum).ToString("dd.MM.yyyy");
        }
        protected string ImeOsobe(string id)
        {
            if (id.ToString() == "") return "";
            Djelatnik djelatnik = Repo.GetDjelatnik(int.Parse(id));

            return djelatnik.Ime + " " + djelatnik.Prezime;
        }

        protected string Aktivnost(string status) => status == "True" ? "Aktivan" : "Neaktivan";

        protected void btnDjelatnici_Click(object sender, EventArgs e)
        {
            bl.Items.Clear();
            Button btn = (Button)sender;
            int id = int.Parse(btn.CommandArgument.ToString());

            List<Djelatnik> djelatnici = Repo.GetDjelatnici();
            List<Djelatnik> djelatniciTima = new List<Djelatnik>();
            foreach (var d in djelatnici)
            {
                if (int.Parse(d.Tim.ToString()) == id)
                {
                    djelatniciTima.Add(d);
                }
            }
            if (djelatniciTima.Count > 0)
            {
                lbbulleted.Text = $"Djelatnici ({djelatniciTima.Count}):";
                foreach (var t in djelatniciTima)
                {
                    bl.Items.Add(new ListItem(t.PunoIme));
                }

            }
            else { lbbulleted.Text = "Trenutno nema djelatnika u timu"; }

            ScriptManager.RegisterStartupScript(this, this.GetType(), "djelatniciModal", "$('#djelatniciModal').modal('show');", true);
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string username = Session["username"].ToString();
            int idDjel = Repo.GetIDUsera(username);

            Djelatnik d = Repo.GetDjelatnik(idDjel);
            if (d.TipDjelatnika != "1")
            {
                Response.Redirect(String.Format("~/Timovi.aspx"));
            }
            Response.Redirect("DodajTim.aspx");
        }

        protected void btnDeakt_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            Session["CurrentId"] = int.Parse(btn.CommandArgument.ToString());

            ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#mojModal').modal('show');", true);
        }

        protected void Aktivnost_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string vrijednost = btn.Text;
            int id = int.Parse(Session["CurrentId"].ToString());
            Tim tim = Repo.GetTim(id);

            if (vrijednost == "Aktivan" && tim.Aktivnost == 1 || vrijednost == "Neaktivan" && tim.Aktivnost == 0) return;
            else if (btn.CommandName == "Aktiviraj") Repo.ActivityChange("tim", id, 1);
            else Repo.ActivityChange("tim", id, 0);
            GridView1.DataBind();

            ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#mojModal').modal('hide');", true);
        }

        protected void btnUredi_Click(object sender, EventArgs e)
        {
            string username = Session["username"].ToString();
            int idDjel = Repo.GetIDUsera(username);

            Djelatnik d = Repo.GetDjelatnik(idDjel);
            if (d.TipDjelatnika != "1")
            {
                Response.Redirect(String.Format("~/Timovi.aspx"));
            }
            LinkButton btn = (LinkButton)sender;
            int id = int.Parse(btn.CommandArgument.ToString());

            Response.Redirect(String.Format("~/UrediTim.aspx?x={0}", id));
        }
    }
}
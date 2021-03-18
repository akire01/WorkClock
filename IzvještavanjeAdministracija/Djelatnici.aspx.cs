using IzvještavanjeAdministracija.Models;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace IzvještavanjeAdministracija
{
    public partial class Djelatnici : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
           if(Session["username"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

      
        protected string GetDatum(string datum) => Convert.ToDateTime(datum).ToString("dd.MM.yyyy");

        protected void btnAdd_Click(object sender, EventArgs e)
        {
             Response.Redirect("DodajDjelatnika.aspx");
        }

        protected string Aktivnost(string status) => status == "True" ? "Aktivan" : "Neaktivan";

        protected string NazivTipa(int id) => Repo.GetTypes().ToList().Where(el => el.IDTip == id).FirstOrDefault().Naziv;
        protected string NazivTima(int id) => Repo.GetTeams().ToList().Where(el => el.IDTim == id.ToString()).FirstOrDefault().Naziv;
     
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label label = (Label)e.Row.Cells[8].FindControl("lblStatus");

                string status = label.Text;


                if (status == "Neaktivan") e.Row.BackColor = Color.LightGray;

            }

        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int id = int.Parse(btn.CommandArgument.ToString());
            Djelatnik objekt = Repo.GetDjelatnik(id);

            string username = Session["username"].ToString();
            int idDjel = Repo.GetIDUsera(username);

            Djelatnik d = Repo.GetDjelatnik(idDjel);
            if (d.TipDjelatnika != "1" && objekt.TipDjelatnika =="1" || objekt.TipDjelatnika=="2")
            {
                Response.Redirect(String.Format("~/Djelatnici.aspx"));
            }

            Response.Redirect(String.Format("~/UrediDjelatnika.aspx?x={0}", id));
        }

        protected void btnDeact_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            Session["CurrentId"] = int.Parse(btn.CommandArgument.ToString());
            int id = int.Parse(Session["CurrentId"].ToString());

            Djelatnik objekt = Repo.GetDjelatnik(id);

            string username = Session["username"].ToString();
            int idDjel = Repo.GetIDUsera(username);

            Djelatnik d = Repo.GetDjelatnik(idDjel);
            if (d.TipDjelatnika != "1" && objekt.TipDjelatnika == "1" || objekt.TipDjelatnika == "2")
            {
                Response.Redirect(String.Format("~/Djelatnici.aspx"));
            }

            ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#mojModal').modal('show');", true);
            
        }

        protected void btnAktivnost_Click(object sender, EventArgs e)
        {
           
            Button btn = (Button)sender;
            string vrijednost = btn.Text;
            int id = int.Parse(Session["CurrentId"].ToString());

            if (vrijednost == "Aktivan" && id == 1 || vrijednost == "Neaktivan" && id == 0) return;
            else if (btn.CommandName == "Aktiviraj") Repo.ActivityChange("djelatnik", id, 1);
            else Repo.ActivityChange("djelatnik", id, 0);
            GridView1.DataBind();

            ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#mojModal').modal('hide');", true);
        }

        protected void btnProjekti_Click(object sender, EventArgs e)
        {
            blProjekti.Items.Clear();
            Button btn = (Button)sender;
            int id = int.Parse(btn.CommandArgument.ToString());

            List<string> projekti = Repo.GetProjekteDjelatnika(id);
            if (projekti.Count > 0)
            {
                lbProjekti.Text = $"Dodijeljeni projekti ({projekti.Count()}):";
                foreach (var p in projekti)
                {
                    blProjekti.Items.Add(new ListItem(p));
                }

            }
            else { lbProjekti.Text = "Djelatnik trenutno nema dodijeljenih projekata"; }

            ScriptManager.RegisterStartupScript(this, this.GetType(), "djelatniciModal", "$('#djelatniciModal').modal('show');", true);
        }

       


    }
    
}
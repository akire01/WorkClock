using IzvještavanjeAdministracija.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IzvještavanjeAdministracija
{
    public partial class UrediDjelatnika : System.Web.UI.Page
    {
        string value;
        int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            value = Request.QueryString["x"];
            id = int.Parse(value.ToString());
            if (!IsPostBack)
            {
                NapuniListuTipovaDjelatnika();
                NapuniListuTimova();
                NapuniPolja(id);
            }
               
        }

        private void NapuniPolja(int id)
        {
            Djelatnik d = Repo.GetDjelatnik(id);
            txtIme.Text = d.Ime;
            txtPrezime.Text = d.Prezime;
            txtEmail.Text = d.Email;
            ddListTypes.SelectedValue = d.TipDjelatnika;
            ddListTeams.SelectedValue = d.Tim;
            txtDate.Text = Convert.ToDateTime(d.DatumZaposlenja).ToString("yyyy-MM-dd");

        }

        private void NapuniListuTipovaDjelatnika()
            {
                ddListTypes.DataSource = Repo.GetTypes();
                ddListTypes.DataTextField = "naziv";
                ddListTypes.DataValueField = "IDTip";
                ddListTypes.DataBind();

            }

            private void NapuniListuTimova()
            {

                ddListTeams.DataSource = Repo.GetTeams();
                ddListTeams.DataTextField = "naziv";
                ddListTeams.DataValueField = "IDTim";
                ddListTeams.DataBind();
            }

            protected void btnAdd_Click(object sender, EventArgs e)
            {
            
                string ime = txtIme.Text;
                string prezime = txtPrezime.Text.ToString();
                string email = txtEmail.Text;
                string datumZaposlenja = txtDate.Text;

                int tipDjelatnika = int.Parse(ddListTypes.SelectedItem.Value);
                int tim = int.Parse(ddListTeams.SelectedItem.Value);


                Repo.UpdateDjelatnik(id, ime, prezime, email, datumZaposlenja, tipDjelatnika, tim);

                ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#exampleModal').modal('show');", true);
            
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Djelatnici.aspx");
        }
    }
}
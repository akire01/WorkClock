using IzvještavanjeAdministracija.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IzvještavanjeAdministracija
{
    public partial class DodajDjelatnika : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                NapuniListuTipovaDjelatnika();
                NapuniListuTimova();
            }
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
            string ime = txtFirstName.Text;
            string prezime = txtPrezime.Text;
            string email = txtEmail.Text;
            string datumZaposlenja = txtDate.Text;
            int tipDjelatnika = int.Parse(ddListTypes.SelectedItem.Value);
            int tim = int.Parse(ddListTeams.SelectedItem.Value);

            Repo.InsertEmployee(ime, prezime, email, datumZaposlenja, tipDjelatnika, tim);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#exampleModal').modal('show');", true);
        }


    }
}
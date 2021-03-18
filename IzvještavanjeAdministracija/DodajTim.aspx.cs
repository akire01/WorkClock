using IzvještavanjeAdministracija.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IzvještavanjeAdministracija
{
    public partial class DodajTim : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                NapuniListuVoditelja();
                
            }
        }

        private void NapuniListuVoditelja()
        {
            ddlVoditelj.DataSource = Repo.GetVoditelji();
            ddlVoditelj.DataTextField = "PunoIme";
            ddlVoditelj.DataValueField = "IDDjelatnik";
            ddlVoditelj.DataBind();
        }

        protected void btnAddTeam_Click(object sender, EventArgs e)
        {
            string naziv = txtNaziv.Text;
            string datumKreiranja = txtDate.Text;
            int idVoditelj = int.Parse(ddlVoditelj.SelectedItem.Value);

            Repo.InsertTeam(naziv, datumKreiranja, idVoditelj);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#exampleModal').modal('show');", true);
        }
    }
}
using IzvještavanjeAdministracija.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IzvještavanjeAdministracija
{
    public partial class UrediTim : System.Web.UI.Page
    {
        string value;
        int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            value = Request.QueryString["x"];
            id = int.Parse(value.ToString());
            ViewState["id"] = id;
            if (!IsPostBack)
            {
                NapuniListuVoditelja();
                NapuniPolja();
            }
        }

        
        private void NapuniListuVoditelja()
        {
            ddlVoditelj.DataSource = Repo.GetVoditelji();
            ddlVoditelj.DataTextField = "PunoIme";
            ddlVoditelj.DataValueField = "IDDjelatnik";
            ddlVoditelj.DataBind();
        }

        private void NapuniPolja()
        {
            Tim t = Repo.GetTim(id);
            txtNaziv.Text = t.Naziv;
            if (t.DatumKreiranja== "") txtDate.Text = "";
            else txtDate.Text = Convert.ToDateTime(t.DatumKreiranja).ToString("yyyy-MM-dd");
            ddlVoditelj.SelectedValue = t.VoditeljID;
          
        }


        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string naziv = txtNaziv.Text;
            string datumOtvaranja = txtDate.Text;
            int voditeljId = int.Parse(ddlVoditelj.SelectedItem.Value);
            int idTim = int.Parse(ViewState["id"].ToString());

            Repo.UpdateTim(idTim, naziv, voditeljId, datumOtvaranja);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#exampleModal').modal('show');", true);

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Timovi.aspx");
        }
    }
}
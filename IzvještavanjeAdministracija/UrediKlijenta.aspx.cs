using IzvještavanjeAdministracija.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IzvještavanjeAdministracija
{
    public partial class UrediKlijenta : System.Web.UI.Page
    {
        string value;
        int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            value = Request.QueryString["x"];
            id = int.Parse(value.ToString());
            if (!IsPostBack)
            {
                NapuniPolja(id);
            }
           
        }

        private void NapuniPolja(int id)
        {
           Klijent k = Repo.GetKlijent(id);
            txtFirstName.Text = k.Ime;
            txtEmail.Text = k.Email;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Klijenti.aspx");
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            
            string ime = txtFirstName.Text;
            string email = txtEmail.Text;

            Repo.UpdateKlijent(id, ime, email);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#exampleModal').modal('show');", true);
        }
    }
}
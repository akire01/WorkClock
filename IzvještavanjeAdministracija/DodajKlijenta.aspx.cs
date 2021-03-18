using IzvještavanjeAdministracija.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IzvještavanjeAdministracija
{
    public partial class DodajKlijenta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddTeam_Click(object sender, EventArgs e)
        {
            string ime = txtFirstName.Text;
            string email = txtEmail.Text;

            Repo.InsertKlijent(ime, email);
            
            ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#exampleModal').modal('show');", true);
            
        }
    }
}
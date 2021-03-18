using IzvještavanjeAdministracija.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IzvještavanjeAdministracija
{
    public partial class Izvjestaji : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            ScriptManager.RegisterStartupScript(this, this.GetType(), "mojModal", "$('#mojModal').modal('show');", true);
        }


        protected void btnKlijenti_Click(object sender, EventArgs e)
        {
            Response.Redirect("IzvjestajKlijent.aspx");
        }

        protected void btnTimovi_Click(object sender, EventArgs e)
        {
            Response.Redirect("IzvjestajTim.aspx");
        }
    }
    
}
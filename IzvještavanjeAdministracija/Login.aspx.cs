using IzvještavanjeAdministracija.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IzvještavanjeAdministracija
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblInfo.Visible = false;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //otkrit ID djelatnika, po id-u otkrit tip,
            //ako je radnik ->evidencija
            //ako je dir/voditelj ->admin

           

            int result = Repo.LoginDjleatnika(txtUsername.Text.Trim(), txtPassword.Text.Trim());
            if (result == 1)
            {
                int idDjelatnik = Repo.GetDjelatnikIDLogin(txtUsername.Text.Trim(), txtPassword.Text.Trim());
                Djelatnik d = Repo.GetDjelatnik(idDjelatnik);
               
                HttpCookie cookie = new HttpCookie("idKorisnik");
                cookie.Value = idDjelatnik.ToString();
                Response.Cookies.Add(cookie);

                string tip = null;
                foreach (var t in Repo.GetTypes())
                {
                    if (t.IDTip == int.Parse(d.TipDjelatnika))
                    {
                        tip = t.Naziv;
                        break;
                    }
                }
                Session["username"] = txtUsername.Text.Trim();
                if (tip == "Stalni zaposlenik" || tip == "Honorarni zaposlenik" || tip == "Student")
                {
                    Response.Redirect("https://localhost:44370//Home/Edit");
                }
                else if (tip == "Direktor" || tip == "Voditelj tima")
                {
                    Response.Redirect("Djelatnici.aspx");
                }
            }
            else
                lblInfo.Visible = true;

        }
    }
}
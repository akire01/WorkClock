using IzvještavanjeAdministracija.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IzvještavanjeAdministracija
{
    public partial class IzvjestajKlijent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "modalKlijent", "$('#modalKlijent').modal('show');", true);
                NapuniImena();
            }
            
        }

        private void NapuniImena()
        {
            ddlKlijent.DataSource = Repo.GetKlijenti();
            ddlKlijent.DataTextField = "Ime";
            ddlKlijent.DataValueField = "IDKlijent";
            ddlKlijent.DataBind();
        }


        protected void btnTrazi_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "modalKlijent", "$('#modalKlijent').modal('hide');", true);
            int klijentId = int.Parse(ddlKlijent.SelectedItem.Value);
            string datePocetak = txtPocetak.Text;
            string dateKraj = txtKraj.Text;
            Klijent k = Repo.GetKlijent(klijentId);

            List<SatiProjekt> satiProjekti = Repo.GetPodatciZaKlijenta(klijentId, datePocetak, dateKraj);

            if (satiProjekti.Count == 0)
            {
                lblImeKlijenta.Text = $"Nema izvještaja za klijenta &nbsp{k.Ime}&nbsp  u periodu";
                lblImeKlijenta.ForeColor = Color.Red;
                lbl1.Text = Convert.ToDateTime(datePocetak).ToString("dd.MM.yyyy");
                lbl1.ForeColor = Color.Red;
                lbl2.Text = Convert.ToDateTime(dateKraj).ToString("dd.MM.yyyy");
                lbl2.ForeColor = Color.Red;
                return;
            }

            lblImeKlijenta.Text = k.Ime;
            
            lbl1.Text = Convert.ToDateTime(datePocetak).ToString("dd.MM.yyyy");
            lbl2.Text = Convert.ToDateTime(dateKraj).ToString("dd.MM.yyyy");

            int ukupno = 0;

            ViewState["izvoz"] = satiProjekti;
            foreach (var item in satiProjekti)
            {
                
                Projekt p = Repo.GetProjekt(item.ProjektID);
                TableRow row = new TableRow();
                TableCell cell1 = new TableCell();
                cell1.Text = $"{p.Naziv}";
                TableCell cell2 = new TableCell();
                cell2.Text = $"{(item.RadniSati + item.PrekovremeniSati).ToString()}";
                ukupno += (item.RadniSati + item.PrekovremeniSati);
                row.Cells.Add(cell1);
                row.Cells.Add(cell2);
                myTable.Rows.Add(row);

            }

            TableRow rowfooter = new TableRow();
            TableCell cell3 = new TableCell();

            cell3.Text = $"Ukupno sati: {ukupno.ToString()}";
            cell3.Font.Underline = true;
            rowfooter.Cells.Add(cell3);
            myTable.Rows.Add(rowfooter);

            btnExport.Visible = true;

        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();

            sb.Append(lblImeKlijenta.Text);
            sb.Append(System.Environment.NewLine);
            sb.Append(lbl1.Text + ",");
            sb.Append(lbl2.Text + ",");
            sb.Append(System.Environment.NewLine);

            string polje;
            //Zbog renderiranja ipak uzme samo prvi redak
            foreach (TableRow row in myTable.Rows)
            {
                for (int i = 0; i < row.Cells.Count; i++)
                {
                    if ( i == row.Cells.Count - 1)
                    {
                        polje = row.Cells[i].Text.ToString();
                        sb.Append(polje);
                    }
                    else
                    {
                        polje = row.Cells[i].Text.ToString() + ",";
                        sb.Append(polje);
                    }
                    
                }
                sb.Append(System.Environment.NewLine);
            }

            //Preostali retci
            List<SatiProjekt> lista = ViewState["izvoz"] as List<SatiProjekt>;
            int ukupno = 0;
            foreach (var item in lista)
            {
                Projekt p = Repo.GetProjekt(item.ProjektID);
                sb.Append(p.Naziv + ",");
                sb.Append($"{(item.RadniSati + item.PrekovremeniSati).ToString()}");
                
                ukupno += (item.RadniSati + item.PrekovremeniSati);

                sb.Append(System.Environment.NewLine);

            }

            sb.Append("ukupno" + ",");
            sb.Append($"{ukupno.ToString()}");

            var path = Environment.GetFolderPath(Environment.SpecialFolder.DesktopDirectory);
            var filePath = Path.Combine(path, "klijentIzvjestaj.csv");
            File.WriteAllText(filePath, sb.ToString());
        }
    }
}
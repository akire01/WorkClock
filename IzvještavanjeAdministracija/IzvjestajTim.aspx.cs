using IzvještavanjeAdministracija.Models;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IzvještavanjeAdministracija
{
    public partial class IzvjestajTim : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "modalTim", "$('#modalTim').modal('show');", true);
                NapuniTimove();
            }
            
        }

        private void NapuniTimove()
        {
            ddlTim.DataSource = Repo.GetTeams();
            ddlTim.DataTextField = "Naziv";
            ddlTim.DataValueField = "IDTim";
            ddlTim.DataBind();
        }

        protected void btnTrazi_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "modalTim", "$('#modalTim').modal('hide');", true);

            int timId = int.Parse(ddlTim.SelectedItem.Value);
            string datePocetak = txtPocetak.Text;
            string dateKraj = txtKraj.Text;
            Tim t = Repo.GetTim(timId);

            List<SatiProjekt> satiProjekti = Repo.GetPodatciPoTimu(timId, datePocetak, dateKraj);

            if (satiProjekti.Count == 0)
            {
                lblNazivTima.Text = $"Nema izvještaja za tim &nbsp{t.Naziv}&nbsp  u periodu";
                lblNazivTima.ForeColor = Color.Red;
                lbl1.Text = Convert.ToDateTime(datePocetak).ToString("dd.MM.yyyy");
                lbl1.ForeColor = Color.Red;
                lbl2.Text = Convert.ToDateTime(dateKraj).ToString("dd.MM.yyyy");
                lbl2.ForeColor = Color.Red;
                return;
            }

            lblNazivTima.Text = t.Naziv;
            lbl1.Text = Convert.ToDateTime(datePocetak).ToString("dd.MM.yyyy");
            lbl2.Text = Convert.ToDateTime(dateKraj).ToString("dd.MM.yyyy");

            Dictionary<int, List<SatiProjekt>> mapa = new Dictionary<int, List<SatiProjekt>>();

            int ukupno = 0;
            foreach (var item in satiProjekti)
            {
                if(!mapa.ContainsKey(item.DjelatnikID))
                {
                    mapa[item.DjelatnikID] = new List<SatiProjekt>();
                    mapa[item.DjelatnikID].Add(item);
                }
                else
                mapa[item.DjelatnikID].Add(item);

            }

            foreach (var item in mapa)
            {
                Djelatnik d = Repo.GetDjelatnik(item.Key);
                TableRow row = new TableRow();
                TableCell cell1 = new TableCell();
                cell1.Text = $"{d.Ime}";
                TableCell cell2 = new TableCell();
                cell2.Text = $"{d.Prezime}";
                TableCell cell3 = new TableCell();
                List<Tim> timovi = Repo.GetTypes() as List<Tim>;
                cell3.Text = Repo.GetTypes().ToList().Where(el =>
                el.IDTip == int.Parse(d.TipDjelatnika.ToString())).FirstOrDefault().Naziv;
                TableCell cell4 = new TableCell();

                var ukupniSati = 0;
                var ukupniPreko = 0;
                foreach(var sati in item.Value)
                {
                    ukupniSati += sati.RadniSati;
                    ukupniPreko += sati.PrekovremeniSati;
                }

                cell4.Text = $"{ukupniSati}";
                ukupno += ukupniSati;
                TableCell cell5 = new TableCell();
                cell5.Text = $"{ukupniPreko}";
                ukupno += ukupniPreko;
                row.Cells.Add(cell1);
                row.Cells.Add(cell2);
                row.Cells.Add(cell3);
                row.Cells.Add(cell4);
                row.Cells.Add(cell5);
                myTable.Rows.Add(row);
            }
            TableRow rowfooter = new TableRow();
            TableCell cell6 = new TableCell();

            cell6.Text = $"Ukupno sati: {ukupno.ToString()}";
            cell6.Font.Underline = true;
            rowfooter.Cells.Add(cell6);
            myTable.Rows.Add(rowfooter);
            ViewState["izvezi"] = mapa;

            btnExport.Visible = true;
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();

            sb.Append(lblNazivTima.Text);
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
                    if (i == row.Cells.Count - 1)
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
            int ukupno = 0;
            Dictionary<int, List<SatiProjekt>> mapa = ViewState["izvezi"] as Dictionary<int, List<SatiProjekt>>;

            foreach (var item in mapa)
            {
                var ukupniSati = 0;
                var ukupniPreko = 0;
                Djelatnik d = Repo.GetDjelatnik(item.Key);
                sb.Append(d.Ime + ",");
                sb.Append(d.Prezime + ",");
                sb.Append(Repo.GetTypes().ToList().Where(el =>
                el.IDTip == int.Parse(d.TipDjelatnika.ToString())).FirstOrDefault().Naziv + ",");

                foreach (var sati in item.Value)
                {
                    ukupniSati += sati.RadniSati;
                    ukupniPreko += sati.PrekovremeniSati;
                }
                sb.Append($"{ukupniSati + ukupniPreko}" + ",");
                ukupno += (ukupniSati + ukupniPreko);

                sb.Append(System.Environment.NewLine);
            }
            sb.Append("ukupno" + ",");
            sb.Append($"{ukupno.ToString()}");

            var path = Environment.GetFolderPath(Environment.SpecialFolder.DesktopDirectory);
            var filePath = Path.Combine(path, "TimIzvjestaj.csv");
            File.WriteAllText(filePath, sb.ToString());
        
        }
    }
}
using Microsoft.ApplicationBlocks.Data;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Caching;

namespace IzvještavanjeAdministracija.Models
{
    public class Repo
    {
        private static string cs = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;


        public static int LoginDjleatnika(string username, string password)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();

            sqlParameters.Add(new SqlParameter("username", username));
            sqlParameters.Add(new SqlParameter("password", password));

            using (SqlConnection cn = new SqlConnection(cs))
            {
                int count = Convert.ToInt32(SqlHelper.ExecuteScalar(cn, "LoginUser", sqlParameters.ToArray()));

                if (count == 1)
                {
                    return 1;
                }
                else return 0;
            }
        }

        public static int GetIDUsera(string username)
        {
            //List<SqlParameter> sqlParameters = new List<SqlParameter>();

            //sqlParameters.Add(new SqlParameter("username", username));

            using (SqlConnection cn = new SqlConnection(cs))
            {
                SqlDataReader r = SqlHelper.ExecuteReader(cn, "VratiIDpoUsernameu", username);

                int id = 0;
                if(r.Read())
                {
                    id = int.Parse(r["DjelatnikID"].ToString());
                };
                return id;
             
            }
        }


        public static IEnumerable<Tim> GetTeams()
        {
            using (SqlConnection cn = new SqlConnection(cs))
            {
                SqlDataReader r = SqlHelper.ExecuteReader(cn, "GetTeams");
                while (r.Read())
                {
                    yield return new Tim
                    {
                        Naziv = r["Naziv"].ToString(),
                        IDTim = r["IDTim"].ToString()
                    };
                }
            }

        }

        public static IEnumerable<Tip> GetTypes()
        {
            using (SqlConnection cn = new SqlConnection(cs))
            {
                SqlDataReader r = SqlHelper.ExecuteReader(cn, "GetTypes");

                while (r.Read())
                {
                    yield return new Tip
                    {
                        Naziv = r["Naziv"].ToString(),
                        IDTip = int.Parse(r["IDTip"].ToString())
                    };
                }
            }
        }

        public static Djelatnik GetDjelatnik(int id)
        {
            using (SqlConnection cn = new SqlConnection(cs))
            {
                SqlDataReader r = SqlHelper.ExecuteReader(cn, "GetDjelatnik", id);


                r.Read();

                return new Djelatnik
                {
                    Ime = r["Ime"].ToString(),
                    Prezime = r["Prezime"].ToString(),
                    Email = r["Email"].ToString(),
                    DatumZaposlenja = r["DatumZaposlenja"].ToString(),
                    TipDjelatnika = r["TipID"].ToString(),
                    Tim = r["TimID"].ToString(),
                    Aktivnost = r["Aktivnost"].ToString()

                };

            }
        }
        public static IEnumerable<Klijent> GetKlijenti()
        {
            using (SqlConnection cn = new SqlConnection(cs))
            {
                SqlDataReader r = SqlHelper.ExecuteReader(cn, "GetKlijenti");

                while (r.Read())
                {
                    yield return new Klijent
                    {
                        IDKlijent = r["IDKlijent"].ToString(),
                        Ime = r["Ime"].ToString(),
                        Email = r["Email"].ToString()
                    };
                }

            }
        }

        public static Projekt GetProjekt(int id)
        {
            using (SqlConnection cn = new SqlConnection(cs))
            {
                SqlDataReader r = SqlHelper.ExecuteReader(cn, "GetProjekt", id);

                r.Read();

                return new Projekt
                {
                    Naziv = r["naziv"].ToString(),
                    DatumOtvaranja = r["datumOtvaranja"].ToString(),
                    Voditelj = r["VoditeljID"].ToString(),
                    Klijent = r["KlijentID"].ToString()

                };
            }
        }


        public static Klijent GetKlijent(int id)
        {
            using (SqlConnection cn = new SqlConnection(cs))
            {
                SqlDataReader r = SqlHelper.ExecuteReader(cn, "GetKlijent", id);

                r.Read();

                return new Klijent
                {
                    IDKlijent = r["IDKlijent"].ToString(),
                    Ime = r["Ime"].ToString(),
                    Email = r["Email"].ToString()
                };

            }
        }
        public static Tim GetTim(int id)
        {
            using (SqlConnection cn = new SqlConnection(cs))
            {
                SqlDataReader r = SqlHelper.ExecuteReader(cn, "GetTim", id);

                r.Read();


                return new Tim
                {
                    Aktivnost = Convert.ToBoolean(r["Aktivnost"].ToString()) ? 1 : 0,
                    Naziv = r["naziv"].ToString(),
                    VoditeljID = r["VoditeljID"].ToString(),
                    DatumKreiranja = r["datumKreiranja"].ToString()
                };

            }
        }



        public static IEnumerable<Djelatnik> GetVoditelji()
        {
            using (SqlConnection cn = new SqlConnection(cs))
            {
                SqlDataReader r = SqlHelper.ExecuteReader(cn, "GetVoditelji");

                while (r.Read())
                {
                    yield return new Djelatnik
                    {
                        IDDJelatnik = r["IDDjelatnik"].ToString(),
                        Ime = r["Ime"].ToString(),
                        Prezime = r["Prezime"].ToString(),
                        Email = r["Email"].ToString(),
                        DatumZaposlenja = r["DatumZaposlenja"].ToString(),
                        TipDjelatnika = r["TipID"].ToString(),
                        Tim = r["TimID"].ToString(),
                        Aktivnost = r["Aktivnost"].ToString()

                    };
                }

            }
        }

        public static List<Tim> GetTimovi()
        {
            using (SqlConnection cn = new SqlConnection(cs))
            {
                SqlDataReader r = SqlHelper.ExecuteReader(cn, "GetTimovi");
                List<Tim> timovi = new List<Tim>();

                while (r.Read())
                {
                    Tim t = new Tim
                    {
                        IDTim = r["IDTim"].ToString(),
                        Naziv = r["Naziv"].ToString(),

                    };
                    timovi.Add(t);
                }
                return timovi;
            }

        }

        public static void InsertProject(string naziv, string datum, int voditelj, int klijent)
        {

            List<SqlParameter> sqlParameters = new List<SqlParameter>();

            sqlParameters.Add(new SqlParameter("naziv", naziv));
            sqlParameters.Add(new SqlParameter("datumOtvaranja", datum));
            sqlParameters.Add(new SqlParameter("idVoditelj", voditelj));
            sqlParameters.Add(new SqlParameter("idKlijent", klijent));


            SqlHelper.ExecuteNonQuery(cs, "InsertProject", sqlParameters.ToArray());

        }
        public static void InsertKlijent(string ime, string email)
        {

            List<SqlParameter> sqlParameters = new List<SqlParameter>();

            sqlParameters.Add(new SqlParameter("ime", ime));
            sqlParameters.Add(new SqlParameter("email", email));

            SqlHelper.ExecuteNonQuery(cs, "InsertKlijent", sqlParameters.ToArray());

        }

        public static void InsertTeam(string naziv, string datum, int voditelj)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>();

            sqlParameters.Add(new SqlParameter("naziv", naziv));
            sqlParameters.Add(new SqlParameter("idVoditelj", voditelj));
            sqlParameters.Add(new SqlParameter("datumKreiranja", datum));

            SqlHelper.ExecuteNonQuery(cs, "InsertTeam", sqlParameters.ToArray());

        }

        public static void InsertDjelatnikNaProjekt(int idDjelatnik, int idProjekt)
        {

            List<SqlParameter> sqlParameters = new List<SqlParameter>();

            sqlParameters.Add(new SqlParameter("idDjelatnik", idDjelatnik));
            sqlParameters.Add(new SqlParameter("idProjekt", idProjekt));

            SqlHelper.ExecuteNonQuery(cs, "InsertDjelatnikNaProjekt", sqlParameters.ToArray());

        }
        public static void InsertEmployee(string ime, string prezime, string email, string datumZaposlenja, int tip, int tim)
        {

            List<SqlParameter> sqlParameters = new List<SqlParameter>();

            sqlParameters.Add(new SqlParameter("ime", ime));
            sqlParameters.Add(new SqlParameter("prezime", prezime));
            sqlParameters.Add(new SqlParameter("Email", email));
            sqlParameters.Add(new SqlParameter("datumZaposlenja", datumZaposlenja));

            sqlParameters.Add(new SqlParameter("TipID", tip));
            sqlParameters.Add(new SqlParameter("TimID", tim));

            SqlHelper.ExecuteNonQuery(cs, "InsertEmployee", sqlParameters.ToArray());

        }

        public static void InsertTimNaProjekt(int tim, int projekt)
        {

            List<SqlParameter> sqlParameters = new List<SqlParameter>();


            sqlParameters.Add(new SqlParameter("idTim", tim));
            sqlParameters.Add(new SqlParameter("idProjekt", projekt));
            SqlHelper.ExecuteNonQuery(cs, "InsertTimNaProjekt", sqlParameters.ToArray());


        }


        public static void UpdateDjelatnik(int id, string ime, string prezime, string email, string datumZaposlenja, int tip, int tim)
        {
            using (SqlConnection cn = new SqlConnection(cs))
            {

                List<SqlParameter> sqlParameters = new List<SqlParameter>();

                sqlParameters.Add(new SqlParameter("IDDjelatnik", id));
                sqlParameters.Add(new SqlParameter("TipID", tip));
                sqlParameters.Add(new SqlParameter("Ime", ime));
                sqlParameters.Add(new SqlParameter("Prezime", prezime));
                sqlParameters.Add(new SqlParameter("Email", email));
                sqlParameters.Add(new SqlParameter("DatumZaposlenja", datumZaposlenja));
                sqlParameters.Add(new SqlParameter("TimID", tim));

                SqlHelper.ExecuteNonQuery(cn, "UpdateDjelatnik", sqlParameters.ToArray());

            }
        }

        public static void UpdateKlijent(int id, string ime, string email)
        {
            using (SqlConnection cn = new SqlConnection(cs))
            {

                List<SqlParameter> sqlParameters = new List<SqlParameter>();

                sqlParameters.Add(new SqlParameter("IDKlijent", id));
                sqlParameters.Add(new SqlParameter("Ime", ime));
                sqlParameters.Add(new SqlParameter("Prezime", email));

                SqlHelper.ExecuteNonQuery(cn, "UpdateKlijent", sqlParameters.ToArray());

            }
        }


        public static void UpdateTim(int id, string naziv, int voditeljID, string date)
        {
            using (SqlConnection cn = new SqlConnection(cs))
            {
                List<SqlParameter> sqlParameters = new List<SqlParameter>();

                sqlParameters.Add(new SqlParameter("id", id));
                sqlParameters.Add(new SqlParameter("naziv", naziv));
                sqlParameters.Add(new SqlParameter("voditeljID", voditeljID));
                sqlParameters.Add(new SqlParameter("DatumKreiranja", date));

                SqlHelper.ExecuteNonQuery(cn, "UpdateTim", sqlParameters.ToArray());
            }
        }


        public static void UpdateProjekt(int id, string naziv, string datum, int voditelj, int klijent)
        {
            using (SqlConnection cn = new SqlConnection(cs))
            {

                List<SqlParameter> sqlParameters = new List<SqlParameter>();

                sqlParameters.Add(new SqlParameter("id", id));
                sqlParameters.Add(new SqlParameter("naziv", naziv));
                sqlParameters.Add(new SqlParameter("datumOtvaranja", datum));
                sqlParameters.Add(new SqlParameter("idVoditelj", voditelj));
                sqlParameters.Add(new SqlParameter("idKlijent", klijent));

                SqlHelper.ExecuteNonQuery(cn, "UpdateProject", sqlParameters.ToArray());

            }
        }

        public static void IzbaciDjelatnikaSProjekta(int projektID, int djelatnikID)
        {
            using (SqlConnection cn = new SqlConnection(cs))
            {
                List<SqlParameter> sqlParameters = new List<SqlParameter>();

                sqlParameters.Add(new SqlParameter("projektID", projektID));
                sqlParameters.Add(new SqlParameter("djelatnikID", djelatnikID));

                SqlHelper.ExecuteNonQuery(cn, "IzbaciDjelatnikaSProjekta", sqlParameters.ToArray());
            }
        }
        public static void IzbaciTimSProjekta(int projektID, int timID)
        {
            using (SqlConnection cn = new SqlConnection(cs))
            {
                List<SqlParameter> sqlParameters = new List<SqlParameter>();

                sqlParameters.Add(new SqlParameter("projektID", projektID));
                sqlParameters.Add(new SqlParameter("djelatnikID", timID));

                SqlHelper.ExecuteNonQuery(cn, "IzbaciTimSProjekta", sqlParameters.ToArray());
            }
        }


        public static void ActivityChange(string objekt, int id, int par)
        {
            using (SqlConnection cn = new SqlConnection(cs))
            {
                List<SqlParameter> sqlParameters = new List<SqlParameter>();
                sqlParameters.Add(new SqlParameter("objekt", objekt));
                sqlParameters.Add(new SqlParameter("id", id));
                sqlParameters.Add(new SqlParameter("aktivnost", par));


                SqlHelper.ExecuteNonQuery(cn, "ActivityChange", sqlParameters.ToArray());

            }
        }

        public static List<String> GetProjekteDjelatnika(int id)
        {
            using (SqlConnection cn = new SqlConnection(cs))
            {
                List<String> projekti = new List<String>();


                SqlDataReader r = SqlHelper.ExecuteReader(cn, "GetProjekteDjelatnika", id);


                while (r.Read())
                {
                    Projekt p = new Projekt { Naziv = r["Naziv"].ToString() };
                    string nazivProjekta = p.Naziv;
                    projekti.Add(nazivProjekta);
                }
                return projekti;
            }
        }
        public static List<SatiProjekt> GetPodatciZaKlijenta(int klijentID, string pocetak, string zavrsetak)
        {
            using (SqlConnection cn = new SqlConnection(cs))
            {
                List<SatiProjekt> satiProjekti = new List<SatiProjekt>();
                List<SqlParameter> sqlParameters = new List<SqlParameter>();
                sqlParameters.Add(new SqlParameter("KlijentID", klijentID));
                sqlParameters.Add(new SqlParameter("DatumPocetak", pocetak));
                sqlParameters.Add(new SqlParameter("DatumKraj", zavrsetak));

                SqlDataReader r = SqlHelper.ExecuteReader(cn, "GetIzvjestajZaKlijenta", sqlParameters.ToArray());


                while (r.Read())
                {
                    SatiProjekt sp = new SatiProjekt
                    {
                        DjelatnikID = int.Parse(r["DjelatnikID"].ToString()),
                        ProjektID = int.Parse(r["ProjektID"].ToString()),
                        Datum = r["Datum"].ToString(),
                        RadniSati = int.Parse(r["SatiRadni"].ToString()),
                        PrekovremeniSati = int.Parse(r["SatiPrekovremeni"].ToString()),
                        Predano = Convert.ToBoolean(r["Predano"].ToString()) ? 1 : 0

                    };
                    if (sp.Predano == 1)
                    {
                        satiProjekti.Add(sp);
                    }
                   
                }
                return satiProjekti;
            }
        }

        public static List<SatiProjekt> GetPodatciPoTimu(int timID, string pocetak, string zavrsetak)
        {
            using (SqlConnection cn = new SqlConnection(cs))
            {
                List<SatiProjekt> satiProjekti = new List<SatiProjekt>();
                List<SqlParameter> sqlParameters = new List<SqlParameter>();
                sqlParameters.Add(new SqlParameter("timID", timID));
                sqlParameters.Add(new SqlParameter("DatumPocetak", pocetak));
                sqlParameters.Add(new SqlParameter("DatumKraj", zavrsetak));

                SqlDataReader r = SqlHelper.ExecuteReader(cn, "GetIzvjestajPoTimu", sqlParameters.ToArray());


                while (r.Read())
                {
                    SatiProjekt sp = new SatiProjekt
                    {
                        DjelatnikID = int.Parse(r["DjelatnikID"].ToString()),
                        ProjektID = int.Parse(r["ProjektID"].ToString()),
                        Datum = r["Datum"].ToString(),
                        RadniSati = int.Parse(r["SatiRadni"].ToString()),
                        PrekovremeniSati = int.Parse(r["SatiPrekovremeni"].ToString()),
                        Predano = Convert.ToBoolean(r["Predano"].ToString()) ? 1 : 0

                    };
                    if (sp.Predano == 1)
                    {
                        satiProjekti.Add(sp);
                    }

                }
                return satiProjekti;
            }
        }





        public static List<Djelatnik> GetDjelatnikeNaProjektu(int id)
        {
            using (SqlConnection cn = new SqlConnection(cs))
            {
                List<Djelatnik> djelatnici = new List<Djelatnik>();

                SqlDataReader r = SqlHelper.ExecuteReader(cn, "GetDjelatnikeNaProjektu", id);


                while (r.Read())
                {
                    Djelatnik d = new Djelatnik
                    {
                        IDDJelatnik = r["IDDjelatnik"].ToString(),
                        Ime = r["Ime"].ToString(),
                        Prezime = r["Prezime"].ToString(),
                        TipDjelatnika = r["TipID"].ToString()
                    };

                    djelatnici.Add(d);
                }
                return djelatnici;
            }
        }

        public static List<Djelatnik> GetDjelatnici()
        {
            using (SqlConnection cn = new SqlConnection(cs))
            {
                List<Djelatnik> djelatnici = new List<Djelatnik>();

                SqlDataReader r = SqlHelper.ExecuteReader(cn, "GetDjelatnici");


                while (r.Read())
                {
                    Djelatnik d = new Djelatnik
                    {
                        IDDJelatnik = r["IDDjelatnik"].ToString(),
                        Ime = r["Ime"].ToString(),
                        Prezime = r["Prezime"].ToString(),
                        Tim = r["TimID"].ToString(),
                        TipDjelatnika = r["TipID"].ToString()
                    };

                    djelatnici.Add(d);
                }
                return djelatnici;
            }
        }

        public static List<Tim> GetTimoveNaProjektu(int id)
        {
            using (SqlConnection cn = new SqlConnection(cs))
            {
                List<Tim> timovi = new List<Tim>();

                SqlDataReader r = SqlHelper.ExecuteReader(cn, "GetTimoveNaProjektu", id);


                while (r.Read())
                {
                    Tim t = new Tim
                    {
                        IDTim = r["IDTim"].ToString(),
                        Naziv = r["naziv"].ToString()
                    };

                    timovi.Add(t);
                }
                return timovi;
            }
        }

        public static int GetProjectId(string naziv)
        {
            using (SqlConnection cn = new SqlConnection(cs))
            {
                int id = 0;
                SqlDataReader r = SqlHelper.ExecuteReader(cn, "GetProjectId", naziv);


                if (r.Read())
                {
                    id = int.Parse(r["IDProjekt"].ToString());

                }
                return id;
            }
        }

        public static int GetDjelatnikIDLogin(string username, string pass)
        {
            using (SqlConnection cn = new SqlConnection(cs))
            {
                List<SqlParameter> sqlParameters = new List<SqlParameter>();
                sqlParameters.Add(new SqlParameter("username", username));
                sqlParameters.Add(new SqlParameter("password", pass));
              
                SqlDataReader r = SqlHelper.ExecuteReader(cn, "DjelatnikIDLogin", sqlParameters.ToArray());

                int id = 0;

                r.Read();
                id = int.Parse(r["DjelatnikID"].ToString());
                     
                return id;
            }
        }
    }
}
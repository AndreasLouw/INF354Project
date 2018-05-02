using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.Linq;

namespace INF354Project
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            /* SqlConnection con = new SqlConnection("Data Source =.; Initial Catalog = INF354; Integrated Security = True");
             con.Open();*/

            string email = txtEmail.Text;            
            string name = txtName.Text;
            string ln = txtLastname.Text;
            int title = Convert.ToInt32(ddTitle.SelectedItem.Value);
            var db = new DataClasses1DataContext();

            var clientEmailquerry = from client in db.tblClients where client.email == email select client.email;


            if (clientEmailquerry == null)
                lblError.Text = "Client already exsiists";
            else
            {
               // lblError.Text = cli;
                tblClient cl = new tblClient();
                cl.Name = name;
                cl.email = email;
                cl.Lastname = ln;
                cl.titleID = title;

                db.tblClients.InsertOnSubmit(cl);
                db.SubmitChanges();
                Client.DataSource = addclient;
            }

                

           // from a in db.tblClients select

            // string[] emails = new string

        }

        protected void clientReg_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {

        }
    }
}
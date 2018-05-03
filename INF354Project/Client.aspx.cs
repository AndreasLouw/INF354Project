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
        


        protected void Page_Load(object sender, EventArgs e){}

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;            
            string name = txtName.Text;
            string ln = txtLastname.Text;
            int title = Convert.ToInt32(ddTitle.SelectedItem.Value);

            var db = new DataClasses1DataContext();

            var clientEmailquerry = from client in db.tblClients where client.email == email select client.email;
            

            if (clientEmailquerry.Any())
                lblError.Text = "Client already exsiists";
            else
            {
                tblClient cl = new tblClient();
                cl.Name = name;
                cl.email = email;
                cl.Lastname = ln;
                cl.titleID = title;

                db.tblClients.InsertOnSubmit(cl); // basically the query and where it souuld execute
                db.SubmitChanges(); // execute the query on the table
                Client.DataBind(); // to refresh table
            }
        }

        protected void clientReg_PageIndexChanging(object sender, FormViewPageEventArgs e){}

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(txtId.Text);

            var db = new DataClasses1DataContext();

            var deleteClient = from client in db.tblClients where client.id == id select client;

            if(deleteClient.Any())
            {
                db.tblClients.DeleteOnSubmit(deleteClient.First());
                db.SubmitChanges();
                Client.DataBind();
            }
            else
                lblError.Text ="client not deleted";
            
        }

        protected void txtId_TextChanged(object sender, EventArgs e){}

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            string email = txtEmailEd.Text;
            string name = txtNameEd.Text;
            string ln = txtLnEd.Text;
            int title = Convert.ToInt32(ddTitleEd.SelectedItem.Value);

            var db = new DataClasses1DataContext();

            var clientUpdatequerry = from client in db.tblClients where client.email.Contains(txtOldEmail.Text) select client;


            if (!clientUpdatequerry.Any())
                lblError.Text = "Client does not exsists";
            else
            {
               foreach(var cl in clientUpdatequerry)
                {
                    cl.Name = name;
                    cl.email = email;
                    cl.Lastname = ln;
                    cl.titleID = title;
                }
               
                db.SubmitChanges(); // execute the query on the table
                Client.DataBind(); // to refresh table
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace INF354Project
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int Cid = Convert.ToInt32(txtCId.Text);
            int fID = Convert.ToInt32(txtfId.Text);

            var db = new DataClasses1DataContext();

            var deleteClFur = from clfur in db.tblClientFurnitures where clfur.clientId == Cid && clfur.furnitureId == fID select clfur;

            if (deleteClFur.Any())
            {
                db.tblClientFurnitures.DeleteOnSubmit(deleteClFur.First());
                db.SubmitChanges();
                ClFur.DataBind();
            }
            else
                lblError.Text = "furnituresystem not deleted";
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            int clientID = Convert.ToInt32(ddCName.SelectedItem);
            int furnID = Convert.ToInt32(ddFName.SelectedItem);

            var db = new DataClasses1DataContext();

            tblClientFurniture cf = new tblClientFurniture();
            cf.clientId = clientID;
            cf.furnitureId = furnID;
            cf.date = DateTime.Now;

            db.tblClientFurnitures.InsertOnSubmit(cf); // basically the query and where it souuld execute
            db.SubmitChanges(); // execute the query on the table
            ClFur.DataBind(); // to refresh table
        }

        protected void btnEdit_Click(object sender, EventArgs e) // this wount work if there are more than one client renting form same clint
        {
            int newcID = Convert.ToInt32(ddCINew.Text);
            int newfID = Convert.ToInt32(ddFidNew.Text);
            int cID = Convert.ToInt32(ddCIDEd.Text);
            int fID = Convert.ToInt32(ddFIDEd.Text);


            var db = new DataClasses1DataContext();

            var clFurUpdatequerry = from cf in db.tblClientFurnitures where cf.clientId == cID && cf.furnitureId == fID select cf;


            if (!clFurUpdatequerry.Any())
                lblError.Text = "Combo does not exsist";
            else
            {
                foreach (var cfur in clFurUpdatequerry)
                {
                    cfur.clientId = newcID;
                    cfur.furnitureId = newfID;
                }

                db.SubmitChanges(); // execute the query on the table
                ClFur.DataBind(); // to refresh table
            }
        }

        protected void txtId_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
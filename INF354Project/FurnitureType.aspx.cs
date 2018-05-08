using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace INF354Project
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(txtId.Text);

            var db = new DataClasses1DataContext();

            var deleteType = from type in db.tblFurnitureTypes where type.id == id select type;

            if (deleteType.Any())
            {
                db.tblFurnitureTypes.DeleteOnSubmit(deleteType.First());
                db.SubmitChanges();
                Type.DataBind();
            }
            else
                lblError.Text = "furniture type not deleted";
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string type = txtType.Text;

            var db = new DataClasses1DataContext();

            tblFurnitureType ty = new tblFurnitureType();
            ty.Type = type;

            db.tblFurnitureTypes.InsertOnSubmit(ty); // basically the query and where it souuld execute
            db.SubmitChanges(); // execute the query on the table
            Type.DataBind(); // to refresh table
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            string newType = txtTypeEd.Text;
            int id = Convert.ToInt32(txtIDEd.Text);

            var db = new DataClasses1DataContext();

            var typeUpdatequerry = from type in db.tblFurnitureTypes where type.id == id select type;


            if (!typeUpdatequerry.Any())
                lblError.Text = "Type does not exsists";
            else
            {
                foreach (var ty in typeUpdatequerry)
                {
                    ty.Type = newType;
                }

                db.SubmitChanges(); // execute the query on the table
                Type.DataBind(); // to refresh table
            }
        }
    }
}
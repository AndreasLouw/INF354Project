using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace INF354Project
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(txtId.Text);

            var db = new DataClasses1DataContext();

            var deleteFurniture= from furniture in db.tblFurnitures where furniture.id == id select furniture;

            if (deleteFurniture.Any())
            {
                db.tblFurnitures.DeleteOnSubmit(deleteFurniture.First());
                db.SubmitChanges();
                Furniture.DataBind();
            }
            else
                lblError.Text = "furnituresystem not deleted";
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {           
            string name = txtName.Text;            
            int type = Convert.ToInt32(ddType.SelectedItem.Value);

            var db = new DataClasses1DataContext();       
          
            tblFurniture fur = new tblFurniture();
            fur.Name = name;
            fur.typeID = type;
            db.tblFurnitures.InsertOnSubmit(fur); // basically the query and where it souuld execute
            db.SubmitChanges(); // execute the query on the table
            Furniture.DataBind(); // to refresh table
           
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {           
            string name = txtIDEd.Text;
            int type = Convert.ToInt32(ddTypeEd.SelectedItem.Value);
            int id = Convert.ToInt32(txtIDEd.Text);

            var db = new DataClasses1DataContext();

            var furnitureUpdatequerry = from furniture in db.tblFurnitures where furniture.id == id select furniture;


            if (!furnitureUpdatequerry.Any())
                lblError.Text = "Furniture does not exsists";
            else
            {
                foreach (var fur in furnitureUpdatequerry)
                {
                    fur.Name = name;
                    fur.typeID = type;
                }

                db.SubmitChanges(); // execute the query on the table
                Furniture.DataBind(); // to refresh table
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string search = txtNameSearch.Text;
            var db = new DataClasses1DataContext();

            //var obj = from fur in db.tblFurnitures where search.All(f => fur.Name.Contains(f)) select fur;
            var obj2 = db.tblFurnitures.Where(s => db.tblFurnitures.Select(so => so.Name).Contains(search));

            Furniture.DataSourceID = null;
            Furniture.DataSource = obj2;

            Furniture.DataBind();
        }

        protected void txtId_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Northwind_testing
{
    public partial class About : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }

        protected void DetailsView1_ItemInserted(Object sender, System.Web.UI.WebControls.DetailsViewInsertedEventArgs e)
        {
            if (e.Exception != null)
            {
                ErrorMessageLabel.Text = "An error occured while entering this record.  Please verify you have entered data in the correct format.";
                e.ExceptionHandled = true;
            }
            GridView1.DataBind();
        }

        protected void DetailsView1_ItemUpdated(Object sender, System.Web.UI.WebControls.DetailsViewUpdatedEventArgs e)
        {
            GridView1.DataBind();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DetailsView1.ChangeMode(DetailsViewMode.ReadOnly);
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DetailsView1.ChangeMode(DetailsViewMode.ReadOnly);
        }

        protected void GridView1_PageIndexChanged(object sender, EventArgs e)
        {
            DetailsView1.ChangeMode(DetailsViewMode.ReadOnly);
        }

        protected void GridView1_Sorted(object sender, EventArgs e)
        {
            DetailsView1.ChangeMode(DetailsViewMode.ReadOnly);
        }

        protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            if (e.Exception != null)
            {
                ErrorMessageLabel.Text = "Failed to DELETE due to foreign key contstraint on the table.  You may only delete rows which have no related records.";
                e.ExceptionHandled = true;
            }
        }

        protected void DetailsView1_DataBound(object sender, EventArgs e)
        {
            if (DetailsView1.CurrentMode == DetailsViewMode.Insert)
            {
                TextBox stateTextBox = (TextBox)DetailsView1.Rows[7].Cells[1].Controls[0];
                stateTextBox.Text = DropDownList1.SelectedValue;
                stateTextBox.Enabled = false;
            }
        }


        

    }
}

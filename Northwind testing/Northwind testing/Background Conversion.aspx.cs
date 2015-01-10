using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Northwind_testing
{
    public partial class Background_Conversion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String NorthConnection = System.Configuration.ConfigurationManager.ConnectionStrings["North"].ConnectionString;

            SqlConnection allCities = new SqlConnection(NorthConnection);
            SqlConnection allTitles = new SqlConnection(NorthConnection);
            SqlConnection allDetails = new SqlConnection(NorthConnection);

            FilteredGrid.RowStyle.Height = 75;
            FilteredGrid.RowStyle.Width = 200;
            
            try
            {
                allCities.Open();
                allTitles.Open();
                allDetails.Open();
                
                SqlCommand getCities = new SqlCommand("GetUniqueCities", allCities);
                getCities.CommandType.Equals(SqlDataSourceCommandType.StoredProcedure);
                
                SqlCommand getTitles = new SqlCommand("GetTitles", allTitles);
                getTitles.CommandType.Equals(SqlDataSourceCommandType.StoredProcedure);

                SqlCommand getDetails = new SqlCommand("GetDetails", allDetails);
                getDetails.CommandType.Equals(SqlDataSourceCommandType.StoredProcedure);

                if (!Page.IsPostBack)
                {
                    SqlDataReader rdr1 = getCities.ExecuteReader();
                    CityFilter.DataSource = rdr1;
                    CityFilter.DataTextField = "City";
                    CityFilter.DataValueField = "City";
                    CityFilter.DataBind();
                    EmployeeDetails.FindControl("TitleDropDown");
               
                }
                FilteredGrid.DataBind();
            }

            finally
            {
                allCities.Close();
                allTitles.Close();
                allDetails.Close();
            }
        }

        protected void FilteredGrid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton nameSelect = new LinkButton()
                {
                    CommandName = "Select",
                    Text = e.Row.Cells[2].Text.ToString()
                };
                nameSelect.ToolTip = "Click to select this row";
                e.Row.Cells[2].Controls.Add(nameSelect);

                e.Row.Attributes["OnClick"] = Page.ClientScript.GetPostBackClientHyperlink(nameSelect, "");
            }
        }
        protected void FilteredGrid_OnSelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void EmployeeDetails_OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DropDownList TitleDropDown = (e.Row.FindControl("TitleDropDown") as DropDownList);
                TitleDropDown.DataSource = GetTitles;
                TitleDropDown.DataTextField = "Title";
                TitleDropDown.DataValueField = "Title";
                TitleDropDown.DataBind();

            }
        }

        protected void EmployeeDetails_OnItemInserted(object sender, EventArgs e)
        {

        }

        protected void EmployeeDetails_OnItemUpdated(object sender, EventArgs e)
        {
            
        }

        protected void EmployeeDetails_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
        {

        }
    }
}
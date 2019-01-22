using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cts.HRS.BAL;
using Cts.HRS.DAL;
using Cts.HRS.DTO;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;

public partial class Search_Hotel : System.Web.UI.Page
{
    AdminNew_BAL adminNew_BAL = new AdminNew_BAL();
    CustomerNew_BAL customerNew_BAL = new CustomerNew_BAL();
    DataSet dsHotelSearch;
    int loginStatus;

    string Hotel_Id, Rate_Adult_Ac1, Rate_Child_Ac1, Rate_Adult_Non_Ac1, Rate_Child_Non_Ac1;

    protected void Page_Load(object sender, EventArgs e)
    {
        
        try
        {
            Master.FindControl("Div1").Visible = false;
            Master.FindControl("Div2").Visible = true;

            if (!IsPostBack)
            {
                ddlCountry.Items.Add("Select Country");
                DataSet ds = adminNew_BAL.GetData("spGetCountry", null);
                ddlCountry.DataTextField = "Country_Name";
                ddlCountry.DataValueField = "Country_Id";
                ddlCountry.DataSource = ds.Tables[0];
                ddlCountry.DataBind();
                ddlCity.Enabled = false;

                ddlRoomType.SelectedIndex = 0;

            }
        }
        catch (Exception ex)
        {
            
            using (StreamWriter streamwriter = new StreamWriter(ConfigurationManager.AppSettings["Logpath"].ToString(), true))
            {
                streamwriter.WriteLine(DateTime.Now + " " + ex.Message);
            }
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "StateSelectionError", "alert('" + ex.Message + "');", true);
        }
    }

   





    private void txtHotelName_TextChanged(object sender, EventArgs e)
    {
       
    }


    protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {

            ddlCity.Enabled = true;
            string sp = "spGetCityByCountryId";
            SqlParameter parameter = new SqlParameter("@Country_Id", ddlCountry.SelectedValue);
            DataSet ds = adminNew_BAL.GetData(sp, parameter);
            ddlCity.DataSource = ds.Tables[0];
            ddlCity.DataTextField = "City_Name";
            ddlCity.DataValueField = "City_Id";
            ddlCity.DataBind();
            txtHotelName.Text = "";
        }
        catch (Exception ex)
        {
            
            using (StreamWriter streamwriter = new StreamWriter(ConfigurationManager.AppSettings["Logpath"].ToString(), true))
            {
                streamwriter.WriteLine(DateTime.Now + " " + ex.Message);
            }
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "StateSelectionError", "alert('" + ex.Message + "');", true);
        }
    }
    protected void ddlCity_SelectedIndexChanged(object sender, EventArgs e)
    {
        ObjectDataSource1.DataBind();
      
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "Select")
            {

                GridViewRow gridViewRow = (GridViewRow)((Control)e.CommandSource).NamingContainer;

                int rowIndex = gridViewRow.RowIndex;

                txtHotelName.Text = e.CommandArgument.ToString();

                PassingValues.HotelId = ((TableCell)GridView1.Rows[rowIndex].Cells[1]).Text;
                Hotel_Id = PassingValues.HotelId;
             
                
                ViewState["HotelId"] = Hotel_Id;
                Session["Hotel_Id"] = Hotel_Id;
                PassingValues.HotelName = ((TableCell)GridView1.Rows[rowIndex].Cells[2]).Text;
                Rate_Adult_Ac1 = ((TableCell)GridView1.Rows[rowIndex].Cells[4]).Text;
                Rate_Adult_Non_Ac1 = ((TableCell)GridView1.Rows[rowIndex].Cells[6]).Text;
                Rate_Child_Ac1 = ((TableCell)GridView1.Rows[rowIndex].Cells[5]).Text;
                Rate_Child_Non_Ac1 = ((TableCell)GridView1.Rows[rowIndex].Cells[7]).Text;



            }
        }
        catch (Exception ex)
        {
            
           using (StreamWriter streamwriter = new StreamWriter(ConfigurationManager.AppSettings["Logpath"].ToString(), true))
            {
                streamwriter.WriteLine(DateTime.Now + " " + ex.Message);
            }
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "StateSelectionError", "alert('" + ex.Message + "');", true);
        }
        
      
            
    }
    protected void btnBook_Click(object sender, EventArgs e)
    {
        
       try 
	{
        if (!Request.IsAuthenticated)
        {
            Response.Redirect("~/Login.aspx");
        }
        else
        {


          
            PassingValues.HotelId = GridView1.SelectedRow.Cells[1].Text;
            Session["Hotel_Id"] = PassingValues.HotelId;

            

           
            PassingValues.HotelName = txtHotelName.Text.Trim();
            Session["Room_Type"] = ddlRoomType.SelectedItem.ToString();
            PassingValues.RoomType = Session["Room_Type"].ToString();
           
            PassingValues.FromDate = txtFromDate.Text;
            PassingValues.ToDate = txtToDate.Text;

            if (ddlRoomType.SelectedItem.ToString().Equals("AC"))
            {
               
                PassingValues.RateAdult = GridView1.SelectedRow.Cells[4].Text;
                Session["Rate_Adult"] = PassingValues.RateAdult;
                
                PassingValues.RateChild = GridView1.SelectedRow.Cells[5].Text;
                Session["Rate_Child"] = PassingValues.RateChild;
            }
            else
            {
                
                PassingValues.RateAdult = GridView1.SelectedRow.Cells[6].Text;
                Session["Rate_Adult"] = Rate_Adult_Ac1;
               
                PassingValues.RateChild = GridView1.SelectedRow.Cells[7].Text;
                Session["Rate_Child"] = Rate_Child_Ac1;
            }


            Response.Redirect("~/UserForms/Book_Hotel.aspx?Key1="+PassingValues.HotelId+"&Key2="+PassingValues.RateAdult+"&Key3="+PassingValues.RateChild);
        }
	}
	catch (Exception ex)
	{
		
		using (StreamWriter streamwriter = new StreamWriter(ConfigurationManager.AppSettings["Logpath"].ToString(), true))
            {
                streamwriter.WriteLine(DateTime.Now + " " + ex.Message);
            }
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "StateSelectionError", "alert('" + ex.Message + "');", true);
	

        }
    }
    
    
}
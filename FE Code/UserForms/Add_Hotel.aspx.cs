using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cts.HRS.BAL;
using Cts.HRS.DTO;
using System.IO;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Add_Hotel : System.Web.UI.Page
{
    AdminNew_BAL adminNew_BAL=new AdminNew_BAL();
   

    protected void Page_Load(object sender, EventArgs e)
    {

        try
        {
            Master.FindControl("Div1").Visible = true;
            Master.FindControl("Div2").Visible = false;
            ddlCountry.Items.Add("Select Country");

            if (!IsPostBack)
            {

                DataSet ds = adminNew_BAL.GetData("spGetCountry", null);
                ddlCountry.DataTextField = "Country_Name";
                ddlCountry.DataValueField = "Country_Id";
                ddlCountry.DataSource = ds.Tables[0];
                ddlCountry.DataBind();

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

    //**************************************  ADMIN ADD HOTEL   ********************************//
    protected void btnaddHotel_Click(object sender, EventArgs e)
    {

        try
        {
            int i = adminNew_BAL.addHotel(txthotelname.Text, ddlCountry.SelectedValue.ToString(), ddlcity.SelectedValue.ToString(), txthoteldescription.Text, Convert.ToInt32(txtno_of_ac_rooms.Text), Convert.ToInt32(txtno_of_nonac_rooms.Text), Convert.ToInt32(txtrate_per_night_for_adult_ac.Text), Convert.ToInt32(txtrate_per_night_for_adult_nonac.Text), Convert.ToInt32(txtrate_per_night_for_child_ac.Text), Convert.ToInt32(txtrate_per_night_for_child_nonac.Text));
            if (i == 1)
            {
                Response.Redirect("~/UserForms/Message.aspx");

            }
            else
                Response.Redirect("~/UserForms/Message1.aspx");
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

    //**************************************  SELECT COUNTRY   ********************************//
    protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
    {

        try
        {

            ddlcity.Enabled = true;
            string sp = "spGetCityByCountryId";
            SqlParameter parameter = new SqlParameter("@Country_Id", ddlCountry.SelectedValue);
            DataSet ds = adminNew_BAL.GetData(sp, parameter);
            ddlcity.DataSource = ds.Tables[0];
            ddlcity.DataTextField = "City_Name";
            ddlcity.DataValueField = "City_Id";
            ddlcity.DataBind();

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


    protected void ddlcity_SelectedIndexChanged(object sender, EventArgs e)
    {
       
        
         
        
    }
   

            
    
}
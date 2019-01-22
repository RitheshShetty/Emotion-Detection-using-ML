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

public partial class Registration : System.Web.UI.Page
{
    AdminNew_BAL adminNew_BAL = new AdminNew_BAL();

    protected void Page_Load(object sender, EventArgs e)
    {


        if (!IsPostBack)
        {
            Master.FindControl("Div1").Visible = false;
            Master.FindControl("Div2").Visible = false;
            try
            {
                ddlCountry.Items.Add("Select Country");
                DataSet ds = adminNew_BAL.GetData("spGetCountry", null);
                ddlCountry.DataTextField = "Country_Name";
                ddlCountry.DataValueField = "Country_Id";
                ddlCountry.DataSource = ds.Tables[0];
                ddlCountry.DataBind();
                ddlCity.Enabled = false;



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
   

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("~/Login.aspx");
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
    protected void btnRegister_Click(object sender, EventArgs e)
    {

        try
        {
            UserAuthenticationNew_BAL userAuthenticationNew_BAL = new UserAuthenticationNew_BAL();
            string ut = "";
            if (PassingValues.uType == 1)
            {
                ut = "A";
            }
            else
            {
                ut = "U";
            }
            int x = userAuthenticationNew_BAL.registerCustomer(txtName.Text, txtPassword.Text, txtDOB.Text, txtEmail.Text, txtPhoneNo.Text, ddlCountry.SelectedValue.ToString(), ddlCity.SelectedValue.ToString(), txtPinCode.Text, ut);
            if (x == 1)
            {
                string reg_cust_id = PassingValues.Reg_Cust_Id;
                Response.Write("Registration Successful...Your UserId : " + reg_cust_id);
               
            }
            else
            {
                Response.Write("Please Enter Correct Credentials");
            }
            PassingValues.uType = 0;
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
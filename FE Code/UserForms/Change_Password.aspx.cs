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
using System.Configuration;
using System.IO;

public partial class Change_Password : System.Web.UI.Page
{
    UserAuthenticationNew_BAL userAuthenticationNew_BAL = new UserAuthenticationNew_BAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            Master.FindControl("Div1").Visible = false;
            Master.FindControl("Div2").Visible = true;
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
    
    protected void btnchangepassword_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtnewpwd.Text == txtnewcnfrmpwd.Text)
            {
               

                int i = userAuthenticationNew_BAL.changePassword(Session["UserId"].ToString(), txtnewpwd.Text);
                if (i == 1)
                {
                    Response.Write("<script>alert('Password changed Successfully')</script>");

                }
                else
                    Response.Write("Password is not changed");

            }
            else
            {
                Response.Write("New password and Confirm password do not match");
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
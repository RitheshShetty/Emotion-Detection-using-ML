using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class UserForms_Message : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            Master.FindControl("Div1").Visible = true;
            Master.FindControl("Div2").Visible = false;
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
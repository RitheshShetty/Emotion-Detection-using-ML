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

public partial class Cancel_Booking : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Master.FindControl("Div1").Visible = false;
        Master.FindControl("Div2").Visible = true;
    }
   
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            ObjectDataSource1.DeleteParameters["Booking_Id"].DefaultValue = e.Keys["Booking_Id"].ToString();
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
   
   
    protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        try
        {
            if (e.AffectedRows > 0)
            {
                Response.Write("details updated");
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
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            ObjectDataSource1.UpdateParameters["Booking_Id"].DefaultValue = e.Keys["Booking_Id"].ToString();
            ObjectDataSource1.UpdateParameters["Hotel_Id"].DefaultValue = e.NewValues["Hotel_Id"].ToString();
            ObjectDataSource1.UpdateParameters["Customer_Id"].DefaultValue = e.NewValues["Customer_Id"].ToString();
            ObjectDataSource1.UpdateParameters["Transaction_Id"].DefaultValue = e.NewValues["Transaction_Id"].ToString();
            ObjectDataSource1.UpdateParameters["Bill_Amount"].DefaultValue = e.NewValues["Bill_Amount"].ToString();
            ObjectDataSource1.UpdateParameters["Discounted_Price"].DefaultValue = e.NewValues["Discounted_Price"].ToString();
            ObjectDataSource1.UpdateParameters["Final_Price"].DefaultValue = e.NewValues["Final_Price"].ToString();

        }
        catch (Exception ex )
        {

            using (StreamWriter streamwriter = new StreamWriter(ConfigurationManager.AppSettings["Logpath"].ToString(), true))
            {
                streamwriter.WriteLine(DateTime.Now + " " + ex.Message);
            }
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "StateSelectionError", "alert('" + ex.Message + "');", true);
        }

    }
}
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

public partial class Delete_Hotel : System.Web.UI.Page
{
    public Delete_Hotel()
      {
       

        }
    

     

    private void Admin_DeleteHotel_Load(object sender, EventArgs e)
       {
           
        
       }

    


    protected void Page_Load(object sender, EventArgs e)
    {

        try
        {
            Master.FindControl("Div1").Visible = true;
            Master.FindControl("Div2").Visible = false;
            if (!IsPostBack)
            {
                AdminNew_BAL adminNew_BAL = new AdminNew_BAL();
                DataSet dataSet = adminNew_BAL.GetData("spGetAllHotelId", null);
                ddlHotelId.DataTextField = "Hotel_Id";

                ddlHotelId.DataSource = dataSet.Tables[0];
                ddlHotelId.DataBind();
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

    
    protected void ddlHotelId_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
       {
            ObjectDataSource1.SelectParameters["Hotel_Id"].DefaultValue = ddlHotelId.SelectedValue;
            ObjectDataSource1.DataBind();
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
            ObjectDataSource1.UpdateParameters["Hotel_Id"].DefaultValue = ddlHotelId.SelectedValue;
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
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            ObjectDataSource1.DeleteParameters["Hotel_Id"].DefaultValue = ddlHotelId.SelectedValue;
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
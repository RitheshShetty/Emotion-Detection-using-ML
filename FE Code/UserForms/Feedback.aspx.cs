using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cts.HRS.DTO;
using Cts.HRS.DAL;
using Cts.HRS.BAL;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class Feedback : System.Web.UI.Page
{


  protected void Page_Load(object sender, EventArgs e)
  {
      try
      {
          Master.FindControl("Div1").Visible = false;
          Master.FindControl("Div2").Visible = true;
          lblName.Text = PassingValues.CustomerName;
          lblHotel.Text = PassingValues.HotelName;
          lblCheck_In.Text = PassingValues.FromDate;
          lblCheck_Out.Text = PassingValues.ToDate;
          lblRoomType.Text = PassingValues.RoomType;
          lblRooms.Text = PassingValues.NumberOfRooms;
          lblAdults.Text = PassingValues.NumberOfAdults;
          lblChildren.Text = PassingValues.NumberOfChildren;
          lblAmount.Text = PassingValues.Total_Price.ToString();
          lblBookingDate.Text = DateTime.Now.ToShortDateString();
          lblBookingTime.Text = DateTime.Now.ToShortTimeString();
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
protected void  btnOk_Click(object sender, EventArgs e)
{
    try
    {
        Response.Redirect("~/Search_Hotel.aspx");
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
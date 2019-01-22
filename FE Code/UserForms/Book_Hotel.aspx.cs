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


public partial class Book_Hotel : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
   {
       try
       {
           if (!IsPostBack)
           {
               Master.FindControl("Div1").Visible = false;
               Master.FindControl("Div2").Visible = true;
               txtHotelId.Text = Session["Hotel_Id"].ToString();
              
               txthotelname.Text = PassingValues.HotelName;
               txtHotelId.Text = Request.QueryString["Key1"];
               if (PassingValues.RoomType.Equals("AC"))
                   ddlRoomType.SelectedIndex = 0;
               else
                   ddlRoomType.SelectedIndex = 1;
               txtArrivalDate.Text = PassingValues.FromDate;
               txtDepartureDate.Text = PassingValues.ToDate;
               PassingValues.RateAdult = Session["Rate_Adult"].ToString();
               lblRateAdult.Text = PassingValues.RateAdult;

               txtNoOfAdults.Text = PassingValues.NumberOfAdults;
               txtNoOfChildren.Text = PassingValues.NumberOfChildren;
               txtNoOfRooms.Text = PassingValues.NumberOfRooms;
               PassingValues.RateChild = Session["Rate_Child"].ToString();
               lblRateChild.Text = PassingValues.RateChild;
               lblTotalCost.Text = (int.Parse(PassingValues.RateAdult).ToString()) ;
           }
          

           txtNoOfNights.Text = Convert.ToString((Convert.ToDateTime(txtDepartureDate.Text) - Convert.ToDateTime(txtArrivalDate.Text)).TotalDays);
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

   int AdultCost = 0, ChildCost = 0;

   //**************************   CONTINUE TO PAY BUTTON CLICK EVENT   *********************************//
    
    protected void btnContinueToPay_Click(object sender, EventArgs e)
    {
        try
        {
            PassingValues.NumberOfNights = txtNoOfNights.Text;
            Session["noofnights"] = PassingValues.NumberOfNights;
            PassingValues.NumberOfAdults = txtNoOfAdults.Text;
            Session["noofadults"] = PassingValues.NumberOfAdults;
            PassingValues.NumberOfChildren = txtNoOfChildren.Text;
            Session["noofchild"] = PassingValues.NumberOfChildren;
            PassingValues.NumberOfRooms = txtNoOfRooms.Text;
            Session["noofrooms"] = PassingValues.NumberOfRooms;
            lblTotalCost.Text = (Convert.ToInt16(PassingValues.RateAdult) * (Convert.ToInt16(txtNoOfAdults.Text))).ToString();
            PassingValues.TotalAmount = lblTotalCost.Text;
            Session["Total_Amount"] = PassingValues.TotalAmount;
            PassingValues.CustomerAge = (int)Session["CustomerAge"];

            if (PassingValues.CustomerAge >= 60 && Convert.ToInt16(PassingValues.NumberOfRooms) > 5)
            {
                PassingValues.Total_Discount = (Convert.ToDouble(PassingValues.TotalAmount) * (7.5)) / 100;
                Session["totalDiscount"] = PassingValues.Total_Discount;
                PassingValues.Total_Price = Convert.ToDouble(PassingValues.TotalAmount) - PassingValues.Total_Discount;
                Session["totalPrice"] = PassingValues.Total_Price;
                PassingValues.Discount_Per = "(5+2.5) %";
               
            }
            else if (PassingValues.CustomerAge >= 60 && Convert.ToInt16(PassingValues.NumberOfRooms) <= 5)
            {
                PassingValues.Total_Discount = (Convert.ToDouble(PassingValues.TotalAmount) * (5)) / 100;
                Session["totalDiscount"] = PassingValues.Total_Discount;
                PassingValues.Total_Price = Convert.ToDouble(PassingValues.TotalAmount) - PassingValues.Total_Discount;
                Session["totalPrice"] = PassingValues.Total_Price;
                PassingValues.Discount_Per = "5.0 %";
            }
            else if (PassingValues.CustomerAge < 60 && Convert.ToInt16(PassingValues.NumberOfRooms) > 5)
            {
                PassingValues.Total_Discount = (Convert.ToDouble(PassingValues.TotalAmount) * (2.5)) / 100;
                Session["totalDiscount"] = PassingValues.Total_Discount;
                PassingValues.Total_Price = Convert.ToDouble(PassingValues.TotalAmount) - PassingValues.Total_Discount;
                Session["totalPrice"] = PassingValues.Total_Price;
                PassingValues.Discount_Per = "2.5 %";
            }
            else
            {
                PassingValues.Total_Discount = 0;
                Session["totalDiscount"] = PassingValues.Total_Discount;
                PassingValues.Total_Price = Convert.ToDouble(PassingValues.TotalAmount);
                Session["totalPrice"] = PassingValues.Total_Price;
                PassingValues.Discount_Per = "0.0";
            }

            PassingValues.from_Page = "book";
            Session["from_page"] = PassingValues.from_Page;

            Response.Redirect("~/UserForms/Payment.aspx");


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

  


		 
	
    protected void txtNoOfRooms_TextChanged(object sender, EventArgs e)
    {
        try
        {
            if (txtNoOfAdults.Text != "" && txtNoOfChildren.Text != "" && txtNoOfRooms.Text != "")
            {


                AdultCost = Convert.ToInt16(txtNoOfAdults.Text) * Convert.ToInt16(PassingValues.RateAdult);
                ChildCost = Convert.ToInt16(txtNoOfChildren.Text) * Convert.ToInt16(PassingValues.RateChild);
                lblTotalCost.Text = Convert.ToString((AdultCost + ChildCost) * Convert.ToInt16(txtNoOfRooms.Text) * Convert.ToInt16(txtNoOfNights.Text));
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
  
    protected void txtNoOfChildren_TextChanged(object sender, EventArgs e)
    {
        try
        {
            if (txtNoOfAdults.Text != "" && txtNoOfChildren.Text != "" && txtNoOfRooms.Text != "")
            {

                AdultCost = Convert.ToInt16(txtNoOfAdults.Text) * Convert.ToInt16(PassingValues.RateAdult);
                ChildCost = Convert.ToInt16(txtNoOfChildren.Text) * Convert.ToInt16(PassingValues.RateChild);
                lblTotalCost.Text = Convert.ToString((AdultCost + ChildCost) * Convert.ToInt16(txtNoOfRooms.Text) * Convert.ToInt16(txtNoOfNights.Text));
                double d = (Convert.ToDouble(txtNoOfAdults.Text) + Convert.ToDouble(txtNoOfChildren.Text)) / 4;
               
                txtNoOfRooms.Text = Math.Ceiling(d).ToString();
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
    protected void txtNoOfAdults_TextChanged(object sender, EventArgs e)
    {
        try
        {
            if (txtNoOfAdults.Text != "" && txtNoOfChildren.Text != "" && txtNoOfRooms.Text != "")
            {

                AdultCost = Convert.ToInt16(txtNoOfAdults.Text) * Convert.ToInt16(PassingValues.RateAdult);
                ChildCost = Convert.ToInt16(txtNoOfChildren.Text) * Convert.ToInt16(PassingValues.RateChild);

                lblTotalCost.Text = Convert.ToString((AdultCost + ChildCost) * Convert.ToInt16(txtNoOfRooms.Text) * Convert.ToInt16(txtNoOfNights.Text));
                double d = (Convert.ToDouble(txtNoOfAdults.Text) + Convert.ToDouble(txtNoOfChildren.Text)) / 4;

                txtNoOfRooms.Text = Math.Ceiling(d).ToString();
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
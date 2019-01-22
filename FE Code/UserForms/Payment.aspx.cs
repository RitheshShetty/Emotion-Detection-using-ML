using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cts.HRS.DAL;
using Cts.HRS.BAL;
using Cts.HRS.DTO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class Payment : System.Web.UI.Page

{
    CustomerNew_BAL customerNew_BAL = new CustomerNew_BAL();
    public Payment()
        {
           

           
        }

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
    protected void txtExpiryMonth_TextChanged(object sender, EventArgs e)
    {

    }
    protected void rbVerifyBy_CheckedChanged(object sender, EventArgs e)
    {

        try
        {
            if (rbVerifyBy.Checked == false)
            {
                foreach (Control c in this.Controls)
                    if (c is TextBox)
                        c.EnableViewState = false;
            }
            else
            {
                foreach (Control c in this.Controls)
                    if (c is TextBox)
                        c.EnableViewState = true;
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
    /**********************pay button click event*********************/
    protected void btnPay_Click(object sender, EventArgs e)
    {

        try
        {
            int x = customerNew_BAL.CustomerPayAndBook(txtCardNumber.Text, txtName.Text, (ddlExpiryMonth.SelectedItem.ToString() + "/" + ddlExpiryYear.SelectedItem.ToString()), txtCvv.Text, Session["from_page"].ToString(), Session["UserId"].ToString(), Session["noofnights"].ToString(), Session["noofadults"].ToString(), Session["noofchild"].ToString(), Session["noofrooms"].ToString(), Session["Total_Amount"].ToString(), Session["totalDiscount"].ToString(), Session["totalPrice"].ToString());
            
                Response.Redirect("~/UserForms/Feedback.aspx");
            
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
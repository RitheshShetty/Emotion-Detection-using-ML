using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cts.HRS.BAL;
using Cts.HRS.DTO;
using System.Web.Security;

public partial class Login : System.Web.UI.Page
{
    int loginStatus = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        Master.FindControl("Div1").Visible = false;
        Master.FindControl("Div2").Visible = false;

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        UserAuthenticationNew_BAL userAuthenticationNew_BAL = new UserAuthenticationNew_BAL();


         int x = userAuthenticationNew_BAL.authenticateCustomer(txtUserId.Text, txtContact.Text, txtPassword.Text);
         if (x == 1)
         {
             loginStatus = 1;

             CustomerNew_BAL customerNew_BAL = new CustomerNew_BAL();




             FormsAuthentication.SetAuthCookie(txtUserId.Text, chkRememberMe.Checked);
             HttpCookie httpCookie = new HttpCookie("UserId", txtUserId.Text);
             string[] s = new string[3];
             string ct;
             s = customerNew_BAL.getCustomerNameAndUserTypeByCustomerId(txtUserId.Text);
             Session["UserId"] = txtUserId.Text;
             PassingValues.CustomerName = s[0];

             PassingValues.CustomerAge = Convert.ToInt16(s[2]);


             Session["CustomerAge"] = PassingValues.CustomerAge;
             ct = s[1];
             if (ct == "A")
             {

                 Response.Redirect("~/UserForms/Add_Hotel.aspx");

             }
             else if (ct == "U")
             {

                 Response.Redirect("~/Search_Hotel.aspx");
             }
             PassingValues.CustomerId = txtUserId.Text;

         }
         else
         {
             Response.Write("<script>alert('Enter valid credential');</script>");
         }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
      
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
     
    }
}
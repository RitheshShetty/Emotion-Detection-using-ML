<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.master" AutoEventWireup="true" CodeFile="Change_Password.aspx.cs" Inherits="Change_Password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style3
        {
            width: 100%;
        }
        .style4
        {
            width: 213px;
        }
       
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <div class="content_left_section">
        <div class="content_title_01">
            Change Password</div>
        <div class="form_row">
            &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;
            <%--  </div>--%>
            <table class="style3">
                <tr>
                    <td class="style4">
                        <label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Old Password</label>&nbsp;&nbsp;&nbsp;
                    </td>
                    <td>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox 
                            ID="txtoldpwd" runat="server" TextMode="Password">*</asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvoldpwd" runat="server" 
                            ControlToValidate="txtoldpwd" ErrorMessage="Enter Correct Password">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="txtoldpwd" 
                            ErrorMessage="Wrong Password!!! Password must contain Alphanumeric with a special Character" 
                            ForeColor="Red" 
                            ValidationExpression="(?=.{4,25})(?=.*[a-z])(?=.*[A-Z])(?=.*[\d])(?=.*[\W]).*"></asp:RegularExpressionValidator>


                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        <label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;New Password</label></td>
                    <td>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtnewpwd" runat="server" TextMode="Password">*</asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvnewpwd" runat="server" 
                            ControlToValidate="txtnewpwd" ErrorMessage="Enter Valid Password">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revPassword" runat="server" 
                            ControlToValidate="txtnewpwd" 
                            ErrorMessage="Password must contain Alphanumeric with a special Character" 
                            ForeColor="Red" 
                            ValidationExpression="(?=.{4,25})(?=.*[a-z])(?=.*[A-Z])(?=.*[\d])(?=.*[\W]).*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        <label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Retype New Password</label></td>
                    <td>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtnewcnfrmpwd" runat="server" TextMode="Password">*</asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvnewcnfrmpwd" runat="server" 
                            ControlToValidate="txtnewcnfrmpwd" 
                            ErrorMessage="Entered Password Doenot Match">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>
        </div>
        <div class="form_row">
            &nbsp;&nbsp;&nbsp;
        </div>
        <div class="form_row">
          
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                        <asp:Button ID="btnchangepassword" Text="Change Password" 
                runat="server" onclick="btnchangepassword_Click"  />
        </div>
    </div>
<%--  </div>--%>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>
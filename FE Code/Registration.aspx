<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>


<asp:Content ID="Content4" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        function checkDate(sender, args) {
            if (sender._selectedDate > new Date()) {
                alert("You cannot select a day earlier than today!");
                sender._selectedDate = new Date();
                // set the date back to the current date
                sender._textbox.set_Value(sender._selectedDate.format(sender._format))
            }
        }
    </script>

    <style type="text/css">
        .style3
        {
            width: 100%;
        }
        .style4
        {
        }
        .MyCalendar .ajax__calendar_other .ajax__calendar_day,
.MyCalendar .ajax__calendar_other .ajax__calendar_year {
    color: black;
}
.MyCalendar .ajax__calendar_hover .ajax__calendar_day,
.MyCalendar .ajax__calendar_hover .ajax__calendar_month,
.MyCalendar .ajax__calendar_hover .ajax__calendar_year {
    color: black;
}
.MyCalendar .ajax__calendar_active .ajax__calendar_day,
.MyCalendar .ajax__calendar_active .ajax__calendar_month,
.MyCalendar .ajax__calendar_active .ajax__calendar_year {
    color: black;
    font-weight:bold;
}
      
    .style7
    {
            width: 189px;
            height: 28px;
        }
    .style8
    {
        width: 65%;
    }
      
        .style9
        {
            width: 189px;
            height: 28px;
        }
        .style10
        {
            width: 65%;
            height: 28px;
        }
      
    </style>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content_left_section">
        <div class="content_title_01">
            Registration</div>
        <div class="form_row">
            &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;
          
            <table class="style3">
                <tr>
                    <td class="style7">
                    <label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Name</label>&nbsp;</td>
                    <td class="style8">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtName" runat="server" Width="110px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvName" runat="server"
                            ControlToValidate="txtName" ErrorMessage="Please enter Username."
                            ForeColor="#FF3300">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"
                            ControlToValidate="txtName" ErrorMessage="Please enter valid Name ex:Srivalli"
                            ForeColor="Red" ValidationExpression="([A-Z][a-z]*)"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style7">
                        <label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            Password</label>&nbsp;&nbsp;&nbsp;
                    </td>
                    <td class="style8">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtPassword" runat="server" Width="110px" TextMode="Password">*</asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                            ControlToValidate="txtPassword" ErrorMessage="Please enter Password."
                            ForeColor="#FF3300">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revPassword" runat="server"
                            ControlToValidate="txtPassword"
                            ErrorMessage="Password must contain Alphanumeric with a special Character"
                            ForeColor="Red"
                            ValidationExpression="(?=.{4,25})(?=.*[a-z])(?=.*[A-Z])(?=.*[\d])(?=.*[\W]).*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style9">
                        <label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Confirm
                        Password</label></td>
                    <td class="style10">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtCnfmPassword" runat="server" Width="110px"
                            TextMode="Password">*</asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvcrfmPassword" runat="server"
                            ControlToValidate="txtCnfmPassword"
                            ErrorMessage="Please Confirm the Password." ForeColor="#FF3300">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server"
                            ControlToCompare="txtPassword" ControlToValidate="txtCnfmPassword"
                            ErrorMessage="Password should match." ForeColor="Red"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style7">
                        <label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Date Of Birth</label>&nbsp;
                    </td>
                    <td class="style8">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox runat="server" ID="txtDOB" />
                        <asp:ImageButton runat="server" ID="Image1" ImageUrl="~/images/Calendar_scheduleHS.png"
                            AlternateText="Click to show calendar" />
                        <asp:RequiredFieldValidator ID="rfvDateOfBirth" runat="server"
                            ControlToValidate="txtDOB" ErrorMessage="Please enter Date of Birth."
                            ForeColor="#FF3300">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator2" runat="server"
                            ControlToValidate="txtDOB" ErrorMessage="Enter valid Date." ForeColor="Red"
                            Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                        <asp:CustomValidator ID="CustomValidator1" runat="server"
                            ClientValidationFunction="validateDOB" ErrorMessage="DOB error"
                            ></asp:CustomValidator>
                        <br />
                        <ajaxtoolkit:calendarextender id="cbeFromDate" runat="server"
                        OnClientDateSelectionChanged="checkDate" targetcontrolid="txtDOB"
                            popupbuttonid="Image1" />
                        </td>
                </tr>
                <tr>
                    <td class="style7">
                        <label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            Email</label>&nbsp;&nbsp;
                    </td>
                    <td class="style8">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtEmail" runat="server" Width="110px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                            ControlToValidate="txtEmail" ErrorMessage="Please enter Email."
                            ForeColor="#FF3300">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                            ControlToValidate="txtEmail" 
                            ErrorMessage="Enter Valid Email ex:abc@xyz.com" ForeColor="Red"
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style7">
                        <label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phone Number</label>&nbsp;&nbsp;
                    </td>
                    <td class="style8">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtPhoneNo" runat="server" Width="110px"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="rfvphoneno" runat="server"
                            ControlToValidate="txtPhoneNo" ErrorMessage="Enter Phone Number."
                            ForeColor="#FF3300">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                            ControlToValidate="txtPhoneNo" ErrorMessage="Enter 10 digit number"
                            ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                        &nbsp;&nbsp;&nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style7">
                        <label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Country</label>&nbsp;
                    </td>
                    <td class="style8">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList 
                            ID="ddlCountry" runat="server" Width="110px" AutoPostBack="True" 
                            onselectedindexchanged="ddlCountry_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvcountry" runat="server"
                            ControlToValidate="ddlCountry" ErrorMessage="Please select a Country."
                            ForeColor="#FF3300">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style7">
                        <label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;City</label>&nbsp;&nbsp;
                    </td>
                    <td class="style8">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="ddlCity" runat="server" Width="109px" AutoPostBack="True">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvcity" runat="server"
                            ControlToValidate="ddlcity" ErrorMessage="Please select a City."
                            ForeColor="#FF3300">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style7">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pin Code&nbsp;</td>
                    <td class="style8">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtPinCode" runat="server" Width="110px"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="rfvpincode" runat="server"
                            ControlToValidate="txtPinCode" ErrorMessage="Please enter Pincode."
                            ForeColor="#FF3300">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                            ControlToValidate="txtPinCode" ErrorMessage="Enter a Valid Pincode of 6 digit"
                            ForeColor="Red" ValidationExpression="[1-9]{1}[0-9]{5}"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <%--<tr>
                    <td class="style4" colspan="2">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red"
                            HeaderText="Please enter the following values in the form:" />
                    </td>
                </tr>--%>
                <tr>
                    <td class="style4" colspan="2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style4" colspan="2">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnLogin" Text="Login" runat="server"
                            Width="80px" Height="25px" onclick="btnLogin_Click" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnRegister" Text="Register" runat="server"
                            Width="80px" Height="25px" onclick="btnRegister_Click" />
                        </td>
                </tr>
            </table>
        </div>
       
        </div>

</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>
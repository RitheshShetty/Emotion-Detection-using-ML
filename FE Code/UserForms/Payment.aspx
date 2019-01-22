<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.master" AutoEventWireup="true" CodeFile="Payment.aspx.cs" Inherits="Payment" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
    function validateLength(sender, args) {

        if (args.Value.length < 30)
            return args.IsValid = true;
        else
            return args.IsValid = false;
    }
    </script>
    <style type="text/css">
        .style3
        {
            width: 100%;
        }
        .MyCalendar .ajax__calendar_container {
    border:1px solid #646464;
    background-color: lemonchiffon;
    color: red;
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
     .style5
     {
        width: 200px;
    }
     .style8
     {
     }
     .style9
     {
     }
     .style10
     {
    }
     .style11
    {
        height: 15px;
    }
    .style12
    {
            width: 137px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content_left_section">
        <div class="content_title_01">
            Payment</div>
        <div class="form_row">
            &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;
            <%--<input class="inputfield" name="person" type="text" style="width: 30px; margin-right: 20px;" />--%>
            <table class="style3">
                <tr>
                    <td class="style11" colspan="2">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<asp:RadioButton 
                            ID="rbVerifyBy" runat="server" Text=" Verify By" 
                            oncheckedchanged="rbVerifyBy_CheckedChanged" CausesValidation="True" 
                            TabIndex="1" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Image ID="Image1" runat="server" Height="83px" 
                            ImageUrl="~/images/Visa.jpg" Width="159px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                </tr>
                <tr>
                    <td class="style10" colspan="2">
                        &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;</td>
                    
                </tr>
                <tr>
                    <td class="style12">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Card Number</td>
                    <td class="style5">
                        &nbsp;&nbsp;<asp:TextBox ID="txtCardNumber" runat="server"></asp:TextBox>
                        &nbsp;&nbsp;<asp:RegularExpressionValidator ID="revcard_no" runat="server" 
                            ControlToValidate="txtCardNumber" ErrorMessage="Enter Valid Number" 
                            ValidationExpression="[0-9]{10}" ForeColor="Red"></asp:RegularExpressionValidator>
                        &nbsp;.<asp:RequiredFieldValidator ID="rfvcard_no" runat="server" 
                            ControlToValidate="txtCardNumber" 
                            ErrorMessage="Enter 16 digit Card Number" ForeColor="Red"></asp:RequiredFieldValidator>

                        <br />
&nbsp;&nbsp;</td>
                </tr>
                <tr>
                    <td class="style10" colspan="2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style12">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Name&nbsp;</td>
                    <td class="style5">
                        &nbsp;<label>
                            <asp:TextBox ID="txtName" runat="server" Width="130px" 
                            Height="18px"></asp:TextBox>
                        &nbsp;</label>
                        &nbsp;<asp:RegularExpressionValidator ID="revname" runat="server" 
                            ControlToValidate="txtName" ErrorMessage="Enter Alphabets only" 
                            ValidationExpression="[a-z|A-Z]+" ForeColor="Red"></asp:RegularExpressionValidator>
                        &nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator ID="rfvname" runat="server" 
                            ControlToValidate="txtName" ErrorMessage="Enter Valid Name" 
                            ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
&nbsp;<asp:CustomValidator ID="cvname" runat="server" ControlToValidate="txtName" 
                            clientvalidationfunction="validateLength" 
                            ErrorMessage="Max 30 Characters Long" ForeColor="Red" />
                        </td>
                </tr>
                <tr>
                    <td class="style10" colspan="2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style12">
                        <label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Expiry Date</label>
                    </td>
                    <td class="style5">
                        &nbsp;&nbsp;<asp:DropDownList 
                            ID="ddlExpiryMonth" runat="server">
                            <asp:ListItem>01</asp:ListItem>
                            <asp:ListItem>02</asp:ListItem>
                            <asp:ListItem>03</asp:ListItem>
                            <asp:ListItem>04</asp:ListItem>
                            <asp:ListItem>05</asp:ListItem>
                            <asp:ListItem>06</asp:ListItem>
                            <asp:ListItem>07</asp:ListItem>
                            <asp:ListItem>08</asp:ListItem>
                            <asp:ListItem>08</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>11</asp:ListItem>
                            <asp:ListItem>12</asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;&nbsp; /&nbsp; <asp:DropDownList ID="ddlExpiryYear" runat="server">
                            <asp:ListItem>2020</asp:ListItem>
                            <asp:ListItem>2021</asp:ListItem>
                            <asp:ListItem>2022</asp:ListItem>
                            <asp:ListItem>2023</asp:ListItem>
                            <asp:ListItem>2024</asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;&nbsp;
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="style10" colspan="2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style12">
                        <label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            CVV&nbsp; </label>
&nbsp;</td>
                    <td class="style5">
                        &nbsp;
                        <label>
                            <asp:TextBox ID="txtCvv" runat="server" Width="130px" 
                            Height="18px"></asp:TextBox>
                        </label>
                        <asp:RegularExpressionValidator ID="revcvv" runat="server" 
                            ControlToValidate="txtCvv" ErrorMessage="Enter 3 digit CVV Number " 
                            ValidationExpression="[0-9]{3}" ForeColor="Red"></asp:RegularExpressionValidator>&nbsp;&nbsp;&nbsp;<br />
&nbsp;<asp:RequiredFieldValidator ID="rfvcvv" runat="server" 
                            ControlToValidate="txtCvv" ErrorMessage="Enter Valid CVV Number" 
                            ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="style9" colspan="2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style8" colspan="2">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                        <label>
                        <asp:Button ID="btnPay" Text="Pay" runat="server" Width="100px" 
                            onclick="btnPay_Click" />
                        </label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                </tr>
            </table>
    
    </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>
<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.master" AutoEventWireup="true"
    CodeFile="Add_Hotel.aspx.cs" Inherits="Add_Hotel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<script type="text/javascript">
    function validateLength_name(sender, args) {

        if (args.Value.length < 20)
            return args.IsValid = true;
        else
            return args.IsValid = false;
    }
    function validateLength_description(sender, args) {

        if (args.Value.length < 20)
            return args.IsValid = true;
        else
            return args.IsValid = false;
    }
    function validate_ac(sender, args) {

        if (args.Value > 1 && args.Value < 300)
            return args.IsValid = true;
        else
            return args.IsValid = false;
    }
    function validate_nonac(sender, args) {

        if (args.Value > 1 && args.Value < 300)
            return args.IsValid = true;
        else
            return args.IsValid = false;
    }
    function validaterate_childac(sender, args) {

        if (args.Value > 2000 && args.Value < 3000)
            return args.IsValid = true;
        else
            return args.IsValid = false;
    }
    function validaterate_childnonac(sender, args) {

        if (args.Value > 1000 && args.Value < 2000)
            return args.IsValid = true;
        else
            return args.IsValid = false;
    }
    function validaterate_adultac(sender, args) {

        if (args.Value > 2500 && args.Value < 4000)
            return args.IsValid = true;
        else
            return args.IsValid = false;
    }
    function validaterate_adultnonac(sender, args) {

        if (args.Value > 2000 && args.Value < 2500)
            return args.IsValid = true;
        else
            return args.IsValid = false;
    }
    </script>
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
       
        .style7
        {
            width: 263px;
        }
       
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--<div id="content_left">--%>
    <div class="content_left_section">
        <div class="content_title_01">
            Add Hotel</div>
        <div class="form_row">
            &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;
            <%--<input class="inputfield" name="person" type="text" style="width: 30px; margin-right: 20px;" />--%>
            <table class="style3">
                <tr>
                    <td class="style4">
                        <label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            Hotel Name</label>&nbsp;&nbsp;&nbsp;
                    </td>
                    <td>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox 
                            ID="txthotelname" runat="server" AutoPostBack="True"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvhotelname" runat="server" 
                            ControlToValidate="txthotelname" ErrorMessage="Enter Valid Name">*</asp:RequiredFieldValidator>
                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RegularExpressionValidator ID="revhotelname" runat="server" 
                            ControlToValidate="txthotelname" 
                            ErrorMessage="Hotel Name should Contain Alphabets" 
                            ValidationExpression="[a-z|A-Z]+"></asp:RegularExpressionValidator>
                        <br />
                        <asp:CustomValidator ID="cvhotel_name" runat="server" 
                            ControlToValidate="txthotelname" clientvalidationfunction="validateLength_name" 
                            ErrorMessage="Hotel Name should be less than 20 Characters"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        <label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            Country</label>
                    </td>
                    <td>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="ddlCountry" runat="server" 
                            onselectedindexchanged="ddlCountry_SelectedIndexChanged" 
                            AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        <label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            City</label>&nbsp;&nbsp;&nbsp;
                    </td>
                    <td>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="ddlcity" runat="server" Style="height: 22px; width: 77px" 
                            onselectedindexchanged="ddlcity_SelectedIndexChanged" Enabled="False">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        <label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            Hotel Description</label>&nbsp;&nbsp;
                    </td>
                    <td>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txthoteldescription" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvhoteldescription" runat="server" 
                            ControlToValidate="txthoteldescription" 
                            ErrorMessage="Enter Valid Description">*</asp:RequiredFieldValidator>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        
                       
                        <asp:CustomValidator ID="cvhotel_description" runat="server" 
                            ControlToValidate="txthoteldescription" clientvalidationfunction="validateLength_description" 
                            ErrorMessage="Description should not exceed 150 Characters"></asp:CustomValidator>
                             <br />
                    </td>
                </tr>
            </table>
        </div>
        <div class="form_row">
            &nbsp;&nbsp;&nbsp;
        </div>
        <div class="form_row">
            <table class="style1">
                <tr>
                    <td class="style7">
                        <label>
                            AC ROOMS
                        </label>
                    </td>
                    <td class="style5">
                        <label>
                            NON-AC ROOMS</label>
                    </td>
                </tr>
                <tr>
                    <td class="style7">
                        <label>
                            Number of AC Rooms&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                        </label>
                        <asp:TextBox ID="txtno_of_ac_rooms" runat="server" Width="98px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvno_ac_rooms" runat="server" 
                            ControlToValidate="txtno_of_ac_rooms" ErrorMessage="Enter Valid Number">*</asp:RequiredFieldValidator>
                            <asp:CustomValidator ID="cvrooms_ac" runat="server" 
                            ControlToValidate="txtno_of_ac_rooms" clientvalidationfunction="validate_ac" 
                            ErrorMessage="Rooms should be between 1 and 300"></asp:CustomValidator>
                    </td>
                    <td class="style5">
                        <label>
                            Number of NON-AC Rooms</label>&nbsp;&nbsp;
                        <asp:TextBox ID="txtno_of_nonac_rooms" runat="server" Width="98px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_no_nonac_rooms" runat="server" 
                            ControlToValidate="txtno_of_nonac_rooms" ErrorMessage="Enter Valid Number">*</asp:RequiredFieldValidator>
                            <asp:CustomValidator ID="cvrooms_nonac" runat="server" 
                            ControlToValidate="txtno_of_nonac_rooms" clientvalidationfunction="validate_nonac" 
                            ErrorMessage="Rooms should be between 1 and 300"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style7">
                        <label>
                            Rate Per Night for Adult&nbsp;&nbsp;
                        </label>
                        <asp:TextBox ID="txtrate_per_night_for_adult_ac" runat="server" Width="98px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvrate_ac_adult" runat="server" 
                            ControlToValidate="txtrate_per_night_for_adult_ac" 
                            ErrorMessage="Enter Valid Rate" Visible="False">*</asp:RequiredFieldValidator>
                            <asp:CustomValidator ID="cvrate_adultac" runat="server" 
                            ControlToValidate="txtrate_per_night_for_adult_ac" clientvalidationfunction="validaterate_adultac" 
                            ErrorMessage="Rate should be between 2500 and 4000"></asp:CustomValidator>
                    </td>
                    <td class="style5">
                        <label>
                            Rate Per Night for Adult</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtrate_per_night_for_adult_nonac" runat="server" Width="98px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvrate_nonac_adult" runat="server" 
                            ControlToValidate="txtrate_per_night_for_adult_nonac" 
                            ErrorMessage="Enter Valid Rate">*</asp:RequiredFieldValidator>
                            <asp:CustomValidator ID="cvrate_adultnonac" runat="server" 
                            ControlToValidate="txtrate_per_night_for_adult_nonac" clientvalidationfunction="validaterate_adultnonac" 
                            ErrorMessage="Rate should be between 2000 and 2500"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style7">
                        <label>
                            Rate Per Night for Child</label>&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtrate_per_night_for_child_ac"
                                runat="server" Width="98px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvrate_ac_child" runat="server" 
                            ControlToValidate="txtrate_per_night_for_child_ac" 
                            ErrorMessage="Enter Valid Rate">*</asp:RequiredFieldValidator>
                            <asp:CustomValidator ID="cvrate_childac" runat="server" 
                            ControlToValidate="txtrate_per_night_for_child_ac" clientvalidationfunction="validaterate_childac" 
                            ErrorMessage="Rate should be between 2000 and 3000"></asp:CustomValidator>


                    </td>
                    <td class="style5">
                        <label>
                            Rate Per Night for Child</label>&nbsp;&nbsp; &nbsp; &nbsp;
                        <asp:TextBox ID="txtrate_per_night_for_child_nonac" runat="server" Width="98px"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="rfvrate_nonac_child" runat="server" 
                            ControlToValidate="txtrate_per_night_for_child_nonac" 
                            ErrorMessage="Enter Valid Rate">*</asp:RequiredFieldValidator>
                            <asp:CustomValidator ID="cvrate_childnonac" runat="server" 
                            ControlToValidate="txtrate_per_night_for_child_nonac" clientvalidationfunction="validaterate_childnonac" 
                            ErrorMessage="Rate should be between 1000 and 2000"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                        <asp:Button ID="btnaddHotel" Text="Add Hotel" runat="server" 
                            onclick="btnaddHotel_Click" />
                        &nbsp;</td>
                </tr>
            </table>
        </div>
    </div>
<%--  </div>--%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>
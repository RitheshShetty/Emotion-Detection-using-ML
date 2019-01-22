<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.master" AutoEventWireup="true" CodeFile="Cancel_Booking.aspx.cs" Inherits="Cancel_Booking" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .MyCalendar .ajax__calendar_container {
    border:1px solid #646464;
    background-color: red;
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
     </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content_left_section">
        <div class="content_title_01">
            &nbsp;Cancel Booking</div>
        <div class="form_row">
            &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;
            <%--<input class="inputfield" name="person" type="text" style="width: 30px; margin-right: 20px;" />--%>
            <%--<table class="style3">
                <tr>
                    <td class="style10">
                        <label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; From Date</label>
                    </td>
                    <td class="style5" colspan="2">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox runat="server" ID="txtFromDate" />
                        <asp:ImageButton runat="server" ID="Image1" ImageUrl="~/images/Calendar_scheduleHS.png"
                            AlternateText="Click to show calendar" /><br />
                        <ajaxtoolkit:calendarextender id="cbeFromDate" runat="server" targetcontrolid="txtFromDate"
                            popupbuttonid="Image1" />
                    </td>
                </tr>
                <tr>
                    <td class="style10">
                        <label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            To Date</label>&nbsp;
                    </td>
                    <td class="style6" colspan="2">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox runat="server" ID="txtToDate" />
                        <asp:ImageButton runat="server" ID="ImageButton1" ImageUrl="~/images/Calendar_scheduleHS.png"
                            AlternateText="Click to show calendar" /><br />
                        <ajaxtoolkit:calendarextender id="cbeToDate" runat="server" targetcontrolid="txtToDate"
                            popupbuttonid="ImageButton1" />
                    </td>
                </tr>
                <tr>
                    <td class="style9" colspan="3">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style10">
                        <label>
                            Adults &nbsp;&nbsp;<asp:Button ID="btnDecAdult" Text=" -  " runat="server" 
                            Width="30px" />
                        &nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtAdults" runat="server" Width="29px" 
                            Height="18px"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;<asp:Button ID="btnIncAdult" Text=" +  " runat="server" Width="30px" />
                        &nbsp; </label>
                        &nbsp;
                    </td>
                    <td class="style11">
                        Children<label>
                            &nbsp;&nbsp;<asp:Button ID="btnDecChildren" Text=" -  " runat="server" 
                            Width="30px" />
                        &nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtChildren" runat="server" Width="28px" 
                            Height="17px"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;<asp:Button ID="btnIncChildren" Text=" +  " runat="server" Width="30px" />
                        </label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                    <td>
                        Rooms<label>&nbsp;<asp:Button ID="btnDecRooms" Text=" -  " runat="server" 
                            Width="30px" />
                        &nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtRooms" runat="server" Width="28px" 
                            Height="17px"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;<asp:Button ID="btnIncRooms" Text=" +  " runat="server" Width="30px" />
                        </label>
                    </td>
                </tr>
                <tr>
                    <td class="style8" colspan="3">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style8" colspan="3">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <label>
                        <asp:Button ID="btnCheck" Text="Check" runat="server" Width="100px" />
                        </label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <label>
                        <asp:Button ID="btnUpdate" Text="Update" runat="server" Width="100px" />
                        </label>
                    </td>
                </tr>
            </table>--%>



            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                DeleteMethod="cancelEntireBooking" SelectMethod="GetBookingDetails" 
                TypeName="Cts.HRS.BAL.CustomerNew_BAL" UpdateMethod="EditBooking">
                <DeleteParameters>
                    <asp:Parameter Name="Booking_Id" Type="String" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="-1" Name="Customer_Id" 
                        SessionField="UserId" Type="String" />
                </SelectParameters>
               
                <UpdateParameters>
                    <asp:Parameter Name="Customer_Id" Type="String" />
                    <asp:Parameter Name="Booking_Id" Type="String" />
                    <asp:Parameter Name="Hotel_Id" Type="String" />
                    <asp:Parameter Name="Room_Type" Type="String" />
                    <asp:Parameter Name="Rooms" Type="String" />
                    <asp:Parameter Name="Checkin" Type="String" />
                    <asp:Parameter Name="Checkout" Type="String" />
                    <asp:Parameter Name="Adults" Type="String" />
                    <asp:Parameter Name="Children" Type="String" />
                    <asp:Parameter Name="Bill_Amount" Type="String" />
                    <asp:Parameter Name="Discounted_Price" Type="String" />
                    <asp:Parameter Name="Final_Price" Type="String" />
                    <asp:Parameter Name="Transaction_Id" Type="String" />
                </UpdateParameters>
               
            </asp:ObjectDataSource>
            <asp:GridView ID="GridView1" runat="server" DataSourceID="ObjectDataSource1" 
                onrowdeleting="GridView1_RowDeleting" DataKeyNames="Booking_Id" 
                AutoGenerateColumns="False" onrowupdated="GridView1_RowUpdated" 
                onrowupdating="GridView1_RowUpdating" >
                <Columns>
                    <asp:BoundField  HeaderText="Room_Type" DataField="Room_Type"/>
                 <asp:BoundField  HeaderText="Arrival_Date" DataField="CHECKIN"/>
                <asp:BoundField  HeaderText="Departure_Date" DataField="CHECKOUT"/>
                <asp:BoundField  HeaderText="No_Of_Adult" DataField="ADULTS"/>
                <asp:BoundField  HeaderText="No_Of_Children" DataField="CHILDREN"/>
                <asp:BoundField  HeaderText="Total_Room" DataField="ROOMS"/>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="Hotel_Id" />
                    <asp:BoundField DataField="Customer_Id" />
                    <asp:BoundField DataField="Bill_Amount" />
                    <asp:BoundField DataField="Discounted_Price" />
                    <asp:BoundField DataField="Final_Price" />
                    <asp:BoundField DataField="Transaction_Id" />
                </Columns>
            </asp:GridView>
            <br />



     </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>
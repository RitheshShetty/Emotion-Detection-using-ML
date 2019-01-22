<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.master" AutoEventWireup="true" CodeFile="Delete_Edit_Hotel.aspx.cs" Inherits="Delete_Hotel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center> HotelId
&nbsp;<asp:DropDownList ID="ddlHotelId" runat="server" 
           onselectedindexchanged="ddlHotelId_SelectedIndexChanged" 
           AutoPostBack="True">
    </asp:DropDownList>
&nbsp;
       <br />
       <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
           DeleteMethod="deleteHotel" SelectMethod="getHotelDetailByHotelId" 
           TypeName="Cts.HRS.BAL.AdminNew_BAL" UpdateMethod="updateHotelDetail">
           <DeleteParameters>
               <asp:Parameter Name="Hotel_Id" Type="String" />
           </DeleteParameters>
           <SelectParameters>
               <asp:ControlParameter ControlID="ddlHotelId" DefaultValue="-1" Name="Hotel_Id" 
                   PropertyName="Text" Type="String" />
           </SelectParameters>
           <UpdateParameters>
               <asp:Parameter Name="Hotel_Id" Type="String" />
               <asp:Parameter Name="Hotel_Name" Type="String" />
               <asp:Parameter Name="Country_Id" Type="String" />
               <asp:Parameter Name="City_Id" Type="String" />
               <asp:Parameter Name="Hotel_Description" Type="String" />
               <asp:Parameter Name="No_Of_Ac_Room" Type="Int32" />
               <asp:Parameter Name="No_Of_Non_Ac_Room" Type="Int32" />
               <asp:Parameter Name="Rate_Adult_Ac" Type="Int32" />
               <asp:Parameter Name="Rate_Adult_Non_Ac" Type="Int32" />
               <asp:Parameter Name="Rate_Child_Ac" Type="Int32" />
               <asp:Parameter Name="Rate_Child_Non_Ac" Type="Int32" />
           </UpdateParameters>
       </asp:ObjectDataSource>
       <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="false"
           DataSourceID="ObjectDataSource1" onrowupdated="GridView1_RowUpdated" 
            onrowdeleting="GridView1_RowDeleting" onrowupdating="GridView1_RowUpdating">
           <Columns>
                <asp:BoundField  HeaderText="Hotel_Name" DataField="Hotel_Name"/>
                <asp:BoundField  HeaderText="Hotel_Description" DataField="Hotel_Description"/>
                <asp:BoundField  HeaderText="No_Of_Ac_Room" DataField="No_Of_Ac_Room"/>
                <asp:BoundField  HeaderText="No_Of_Non_Ac_Room" DataField="No_Of_Non_Ac_Room"/>
                <asp:BoundField  HeaderText="Rate_Child_Ac" DataField="Rate_Child_Ac"/>
                <asp:BoundField  HeaderText="Rate_Child_Non_Ac" DataField="Rate_Child_Non_Ac"/>
                <asp:BoundField  HeaderText="Rate_Adult_Ac" DataField="Rate_Adult_Ac"/>
                <asp:BoundField  HeaderText="Rate_Adult_Non_Ac" DataField="Rate_Adult_Non_Ac"/>
               <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
           </Columns>
       </asp:GridView>
       <br />
    </center>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>

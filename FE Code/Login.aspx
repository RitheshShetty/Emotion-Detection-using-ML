<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
    function validateLength(sender, args) {

        if (args.Value.length == 5)
            return args.IsValid = true;
        else
            return args.IsValid = false;
    }
    function validateLength_contact(sender, args) {

        if (args.Value.length == 10)
            return args.IsValid = true;
        else
            return args.IsValid = false;
    }
    </script>


    <style type="text/css">
        .style1
        {
            width: 100%;
            margin-right: 0px;
        }
        .style4
        {
        }
       
        .style5
        {
            width: 56px;
            height: 22px;
        }
               
        .style7
        {
            height: 28px;
        }
       
        .style8
        {
            height: 40px;
        }
        .style9
        {
            height: 22px;
        }
       
    </style>
     <script type="text/javascript" >
         function UserId() {
             if (txtUserId.length != 5) {
                 window.alert("UserId should contain 5 characters");
             }
         }
         function Contact() {
             if (txtContact.length != 10) {
                 window.alert("Please enter a valid 10 digit number ");
             }
         }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content_right_section">
                 <div class="content_title_01">
                     Welcome to  hotel &amp; travel</div>
                 <img src="images/templatemo_image_01.jpg" alt="image" />
                 <p>
                     This is a free website template provided by <a href="#">TemplateMo</a>. You may download, modify and apply this layout for your personal or business websites. Credit goes to
                     <a href="http://www.photovaco.com" target="_blank">Free Photos</a> for photos.</p>
                 <p>
                     Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dictum, urna eu feugiat ultricies, turpis leo tempor lacus, in vestibulum diam nisl sed lorem.
                 </p>
                 <p>
                     Mauris at tortor non mauris rhoncu vesti bulum. Praesent  purus nuncn com modo metus. Mae cen astin cidu tellus et risus com modo lobor tiSed alique.</p>
             </div>
             <div class="cleaner_h40">
                 &nbsp;</div>
             <div class="content_right_2column_box">
                 <div class="content_title_01">
                     Tour Guides</div>
                 <p>
                     Curabitur tempor mattis placerat. Duis malesuada posuere magna at fermentum.</p>
                 <ul>
                     <li>Quisque facilisis suscipit elit</li>
                     <li>Lacus et dictum tristique</li>
                     <li>Eeros ac tincidunt aliquam</li>
                     <li>Nullam commodo arcu non facilisis</li>
                     <li>Duis commodo erat</li>
                 </ul>
                 <div class="cleaner_h10">
                     &nbsp;</div>
                 <div class="rc_btn_02">
                     <a href="#">View All</a></div>
             </div>
             <div class="content_right_2column_box">
                 <div class="content_title_01">
                     Services</div>
                 <p>
                     Donec eget ligula metus. In sapien nibh, tincidunt non ultricies vel, molestie quis massa.
                 </p>
                 <ul>
                     <li>Cras metus lectus</li>
                     <li>Mauris vitae lacinia tortor</li>
                     <li>Suspendisse potenti</li>
                     <li>Pellentesque tincidunt magna</li>
                 </ul>
                 <div class="cleaner_h10">
                     &nbsp;</div>
                 <div class="rc_btn_02">
                     <a href="#">View All</a></div>
             </div>
             <div class="cleaner_h40">
                 &nbsp;</div>
              

            
</asp:Content>
  <asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
        
        	
            <div id="Div1" class="content_left_section" runat="server">
            	<div class="content_title_01">
                    <br />
                    Login</div>
                   
                     <div class="form_row">
                        <table class="style1">
                            <tr>
                                <td class="style4">
                                    <label>UserId</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtUserId" runat="server"></asp:TextBox>
                                    <br />
                                    &nbsp;<asp:RequiredFieldValidator ID="RfvUserId" runat="server" ControlToValidate="txtUserId"
                                        ErrorMessage="Please enter valid Id" ForeColor="Red"></asp:RequiredFieldValidator>
                                        &nbsp;&nbsp;&nbsp;<br />
&nbsp;<asp:CustomValidator ID="cvUserId" runat="server" 
                                        ErrorMessage="Enter 5 digit UserId"  clientvalidationfunction="validateLength" 
                                        ControlToValidate="txtUserId" ForeColor="Red"></asp:CustomValidator>




                                </td>
                            </tr>
                            <tr>
                                <td class="style4">
                                    &nbsp;<label>Contact</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtContact" runat="server"></asp:TextBox>
                                    &nbsp;
                                    <asp:RequiredFieldValidator ID="RfvContact" runat="server" ControlToValidate="txtContact"
                                        ErrorMessage="Enter contact number" ForeColor="Red"></asp:RequiredFieldValidator>
                                        &nbsp;&nbsp;<br />
&nbsp;<asp:CustomValidator ID="cvContact" runat="server" 
                                        ErrorMessage="Enter 10 digit number" 
                                         ControlToValidate="txtContact" clientvalidationfunction="validateLength_contact" 
                                        ForeColor="Red"></asp:CustomValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style7">
                                    <label>
                                        Password</label>
                                </td>
                                <td class="style7">
                                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password">*</asp:TextBox>
                                   
                                    <asp:RequiredFieldValidator ID="RfvPassword" runat="server" ControlToValidate="txtpassword"
                                        ErrorMessage="Enter valid password" ForeColor="Red">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style5">
                                </td>
                                <td class="style9">
                                    &nbsp;
                                    <asp:ValidationSummary ID="ValidationSummary2" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style8">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnLogin" runat="server" 
                                        Text="Login" BackColor="#CCCC66" BorderStyle="None"
                                        Height="20px" Width="110px" onclick="btnLogin_Click" 
                                        style="margin-top: 0px" />
                                    &nbsp;&nbsp;
                                </td>
                                <td class="style8">
                                    &nbsp;
                                    <asp:CheckBox ID="chkRememberMe" runat="server" Text="Remember Me" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style4" colspan="2">
                                    &nbsp;
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <table width="100%">
                                        <tr>
                                            <td>
                                                <asp:LinkButton ID="LinkButton1" runat="server" 
                                                    PostBackUrl="~/Registration.aspx" CausesValidation="False">Register</asp:LinkButton>
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="LinkButton2" runat="server" 
                                                    PostBackUrl="~/Search_Hotel.aspx" CausesValidation="False">Search Hotel</asp:LinkButton>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>   
                        </div>                   
                   
                <div class="cleaner">&nbsp;</div>
            </div> 
            
        </asp:Content>

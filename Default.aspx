  <%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href='https://fonts.googleapis.com/css?family=Poppins:300,400,500' rel='stylesheet' type='text/css'>
    <link href="style/style.css" rel="stylesheet" />

  
</head>
<body>
     <div class="container-fluid">
        <div class="row">
            <div class="col-lg-6 bg-left">
                <div class="offset-1 logo-easy-parish"><span class="easy-parish">easy</span><span class="italic-parish">parish</span><div class="dot"></div></div>
                <div class="offset-1 welcome-parent">
                    <div class="welcome-login">Welcome to</div>
                    <div class="parish-text">EASY PARISH CHURCH ACCOUNTING</div>
                    <div class="line-login"></div>
                </div> 
                
                <div class="offset-1 copyright-parish">Copyright &copy; 2020 Easy Parish Church Accounting</div>
            </div>
            <div class="col-lg-6 bg-right">
                <div class="row" style="height: 100vh;">
                    <div class="col-sm-10 offset-1 align-self-center">
                            <form id="form1" runat="server">
                                
                            <asp:Login ID="Login1" runat="server" DestinationPageUrl="~/FirstPage.aspx" >
                                   <LayoutTemplate>
                             <div class="login-text">
                                <div>Log In</div>
                                <div class="line-login-text"></div>
                            </div>
                            <div class="label">USERNAME</div>
                            <asp:TextBox ID="UserName" runat="server" class="col-md-9 col-lg-12 input-label" placeholder="Enter your username"/>
                 
                            <div class="label">PASSWORD</div>
                            <asp:TextBox ID="Password" runat="server" type="password" class="col-md-9 col-lg-12 input-label" placeholder="Enter your password"/>
                           
                            <div class="col-sm-6 offset-sm-6 invalid-text">
                            
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="Please enter your credentials" ValidationGroup="Login1"></asp:RequiredFieldValidator>
                                
                            </div>
                            <div class="row mt-3">
                                <div class="col-1"><asp:CheckBox runat="server" type="checkbox" ID="RememberMe"/></div>
                                <div class="col-5">Remember me</div>

                                    <asp:LinkButton ID="forgotpassword" runat="server" onclick="LinkButton1_Click" xmlns:asp="#unknown" class="forgot-password">I Forgot My Password</asp:LinkButton> 

                           </div>
                            </div>
                                      
                            <asp:Button CssClass="btn login-btn mt-4" runat="server" ID="LoginButton" CommandName="Login" Text="Log In" ValidationGroup="Login1"  />
                          </LayoutTemplate>
                      </asp:Login>
                     <asp:PasswordRecovery ID="PasswordRecovery1" runat="server" 
                            OnSendingMail="Changepassword1_SendingMail" Visible="false" Font-Bold="true" Font-Size="Large"
                            
                            SuccessText='A new password has been successfully sent to your registered mail address and Phone Number <a href="Default.aspx">LOG IN</a>' 
                            onverifyinguser="PasswordRecovery1_VerifyingUser">
                                
                            <MailDefinition  IsBodyHtml="false" Priority="High" Subject="PASSWORD RECOVERY REQUEST">

                            </MailDefinition>
                            <SuccessTemplate>
                              
                                    A new password has been successfully sent to your registered mail address
                                    <a href="Default.aspx" style="color:White;">LOG IN</a></td>
                                             
                            </SuccessTemplate>

                        <UserNameTemplate>
               
                            <div class="forgot-password-text">FORGOT YOUR PASSWORD</div>
                            <div class="label">USERNAME</div>

                           <asp:TextBox  ID="UserName" runat="server" class="col-sm-12 input-label" placeholder="Enter your username"/> 
                            <div class="col-sm-6 offset-sm-6 invalid-text">
                            
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="Username is required" ValidationGroup="Login1"></asp:RequiredFieldValidator>
                                
                            </div>
                            <div class="d-flex justify-content-between mt-4 col-sm-12 pl-0 pr-0">
                                <div class="update-btn col-sm-4">
                                 <asp:LinkButton ID="login" runat="server" xmlns:asp="#unknown" OnClick="login_Click">Login</asp:LinkButton>
                                 </div>
                                <a  class="offset-sm-2">
                                     <asp:Button ID="SubmitButton" runat="server" CommandName="Submit" 
                                    Text="Send Me My Password" ValidationGroup="PasswordRecovery1" class="btn login-btn"/>
                                 </a>
                            </div>
              

                          </UserNameTemplate>
                     </asp:PasswordRecovery>
             </form>
                                  
                      
                    </div>
                    <div class="offset-1 copyright-parish2">Copyright &copy; 2020 Easy Parish Church Accounting</div>
                </div>
            </div>
        </div>
    </div>
   
         <!--END  -->
</body>
      <script type = "text/javascript" >
          function preventBack() { window.history.forward(); }
          setTimeout("preventBack()", 0);
          window.onunload = function () { null };

          function openTab(th) {
              window.open(th.name, '_blank');
          }
      </script>

    <script src="scripts/app.js"></script>
</html>

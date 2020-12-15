             <%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

  <%--  <link id="Link1" runat="server" rel="shortcut icon" href="~/images/favicon.ico" type="image/x-icon"/>
<link id="Link2" runat="server" rel="icon" href="~/images/favicon.ico" type="image/ico"/>--%>
   

    <%--<script src="http://code.jquery.com/jquery-1.8.2.js"></script>
    <script src="http://www.google.com/jsapi" type="text/javascript"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>--%>

            <link href="style/styles.css" rel="stylesheet" type="text/css" />
        <link href="style/Styles_MasterPage.css" rel="stylesheet" type="text/css" />
        <link rel="Stylesheet" type="text/css" href="style/user_permissions.css" />
  
    <link href="style/jquery-ui.css" rel="stylesheet" />
    <link href="style/styles.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style5 {
            width: 431px;
        }
        .auto-style10 {
            width: 249px;
        }
        .auto-style12 {
            width: 49px;
        }
         .auto-style13 {
            width: 206px;
        }
        .auto-style14 {
            width: 296px;
        }
        .auto-style15 {
            width: 133px;
        }
        						
        #chart {
            width: 439px;
        }

       /*#chartdiv {
         width:500px !important;
         height: 350px !important; 
       }*/
        						
        #chartdiv {
            height: 350px;
            width: 500px;
            margin-left: 0px;
        }
        .auto-style16 {
            font-weight: bold;
            padding: 5px;
            font-size: 0.8em;
            width: 374px;
        }
        .auto-style17 {
            width: 374px;
        }
        						
        .auto-style18 {
            font-weight: bold;
            padding: 5px;
            font-size: 0.8em;
            width: 332px;
        }
        .auto-style19 {
            width: 332px;
        }
        						
        .style1
        {
            font-weight: bold;
            padding: 5px;
            font-size: 0.8em;
            width: 351px;
        }
        .style2
        {
            width: 351px;
        }
        .style3
        {
            width: 457px;
        }
        
    .createUserTextBox25{
    padding: 5px;
    color:green;
    font-size: 15px;
    font-weight: bold;
    border: 1px solid green;
    border-radius: 4px;
    margin-bottom: 3px;
    width:320px;
}

   .createUserTextBox27{
    padding: 5px;
    color:Black;
    font-size: 15px;
    font-weight: bold;
    margin-bottom: 3px;
    width:320px;
}      						
    </style>

    <script type = "text/javascript" >
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };

     function openTab(th) {
         window.open(th.name, '_blank');
     }
        </script>
</head>

<%--<body class="defaultBody" style="background-image: url(background/8teitz-opener.jpg);background-repeat: no-repeat;">--%>
<body class="defaultBody">
    <form id="form1" runat="server">

        <table class="container">
             <tr>
                 <td class="">
                      <asp:Image ID="Image1" runat="server" ImageUrl="~/images/lagos_logo.jpg"/>
                 </td>
                 
                 <td>
                     <%--<h2>&nbsp;&nbsp;&nbsp;&nbsp; LAGOS STATE DIRECTORATE OF COOPERATIVES' PORTAL</h2>--%>
                    <%-- <h2  style="font-weight:bolder; height: 40px; width: 850px;font-size:xx-large;color:#adadad"> </h2>--%>
                     <h1  style="font-weight:bolder; height: 40px; width: 850px;font-size:xx-large;color:red;text-align:center;">'easy' PARISH CHURCH ACCOUNTING </h1>
                 </td>
                 
                <%-- <td class="auto-style15">
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <asp:Image ID="Image2" runat="server" ImageUrl="~/images/facebook_16.png"/>
                     <asp:Image ID="Image3" runat="server" ImageUrl="~/images/twitter_16.png"/>
                     <asp:Image ID="Image4" runat="server" ImageUrl="~/images/linkedin_16.png"/>
                     <asp:Image ID="Image5" runat="server" ImageUrl="~/images/rss_16.png"/>
                     <asp:Image ID="Image11" runat="server" ImageUrl="~/images/youtube_16.png"/>
                 </td>--%>

             </tr>          
        </table>

    <div class="bg">
        <div class="login">
            <table class="auto-style1">
                <tr>
                    <td class="style3">
                        <asp:Login ID="Login1" runat="server" DestinationPageUrl="~/FirstPage.aspx" >
                            <LayoutTemplate>
                                 <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                                     <tr>
                                         <td>
                                             <table cellpadding="0">
                                                 <tr>
                                                     <td align="left" class="createUserTextBox27">USER NAME: </td>
                                                 </tr>
                                                 
                                                 <tr>
                                                     
                                                     <td class="style2">
                                                         <asp:TextBox ID="UserName" runat="server" CssClass="createUserTextBox25"></asp:TextBox></td>
                                                       <td>  <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="<img src='images/Warning.png'/>" ToolTip="User Name is required." ValidationGroup="Login1"><img src='images/Warning.png'/></asp:RequiredFieldValidator>
                                                     </td>
                                                 </tr>
                                                 
                                                 <tr>
                                                     <td align="left" class="createUserTextBox27">PASSWORD: </td>
                                                 </tr>

                                                 <tr>
                                                     
                                                     <td class="style2">
                                                         <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="createUserTextBox25"></asp:TextBox></td>
                                                        <td> <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="<img src='images/Warning.png'/>" ToolTip="Password is required." ValidationGroup="Login1"><img src='images/Warning.png'/></asp:RequiredFieldValidator>
                                                     </td>
                                                 </tr>
                                                 
                                                 <tr>
                                                     <td class="style2">
                                                         <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." CssClass="createUserTextBox27"/>
                                                     </td>
                                                 </tr>
                                                 
                                                 <%--<tr>
                                                     <td align="center" style="color:Red;background-color:White;font-weight:bold;" class="style2">
                                                         <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                                         &nbsp;&nbsp;
                                                         <asp:Label ID="Label1" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
                                                     </td>
                                                 </tr>--%>
                                                 
                                                 <tr>
                                                     <td align="" class="style2">
                                                         
                                                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                         <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" 
                                                             ValidationGroup="Login1"  CssClass="loginBtn" onclick="LoginButton_Click"/>
                                                     </td>
                                                 </tr>

                                                 <tr>
                                                     <td align="" class="style2">
                                                        <%--<asp:HyperLink ID="forgotpassword" runat="server" CssClass="forgotpassword" NavigateUrl="#" ToolTip="Retrieve Password" onclick="onclickHyperLink(this)">I Forgot My Password</asp:HyperLink>--%>
                                                         <asp:LinkButton ID="forgotpassword" runat="server" onclick="LinkButton1_Click" xmlns:asp="#unknown" CssClass="forgotpassword">I Forgot My Password</asp:LinkButton> 
                                                     </td>
                                                 </tr>
                                             </table>
                                         </td>
                                     </tr>
                                 </table>
                            </LayoutTemplate>
                        </asp:Login>


                        <asp:PasswordRecovery ID="PasswordRecovery1" runat="server" 
                            OnSendingMail="Changepassword1_SendingMail" Visible="false" Font-Bold="true" Font-Size="Large"
                            
                            SuccessText='A new password has been successfully sent to your registered mail address and Phone Number <a href="Default.aspx">LOG IN</a>' 
                            onverifyinguser="PasswordRecovery1_VerifyingUser">
           

                        <%--<asp:PasswordRecovery ID="PasswordRecovery1" runat="server" Visible="false">--%>

                            <MailDefinition BodyFileName="~/App_Data/PasswordRecovery.txt" IsBodyHtml="false" Priority="High" Subject="PASSWORD RECOVERY REQUEST">

                            </MailDefinition>
                            <SuccessTemplate>
                                <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                                    <tr>
                                        <td>
                                            <table cellpadding="0">
                                                <tr>
                                                    <td>
                                                        A new password has been successfully sent to your registered mail address
                                                        <a href="Default.aspx" style="color:White;">LOG IN</a></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </SuccessTemplate>
                            <UserNameTemplate>
                                <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                                    <tr>
                                        <td>
                                            <table cellpadding="0">
                                                <tr>
                                                    <td align="left" class="auto-style16"> 
                                                        <asp:Label ID="Label5" runat="server" Text="USER NAME:" CssClass="createUserTextBox27"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style17">
                                                        <asp:TextBox ID="UserName" runat="server" CssClass="createUserTextBox25"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="<img src='images/Warning.png'/>" ToolTip="User Name is required." ValidationGroup="PasswordRecovery1"><img src='images/Warning.png'/></asp:RequiredFieldValidator>
                                                        &nbsp;</td>
                                                </tr>
                                               <%-- <tr>
                                                    <td align="center" style="color:Red;background-color:White;font-weight:bold;" class="auto-style17">
                                                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                                    </td>
                                                </tr>--%>
                                                <tr>
                                                    <td align="" class="auto-style16">
                                                    <asp:LinkButton ID="login" runat="server" xmlns:asp="#unknown" CssClass="createUserTextBox27" OnClick="login_Click">Login</asp:LinkButton>
                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        <asp:Button ID="SubmitButton" runat="server" CommandName="Submit" 
                                                            Text="Send Me My Password" ValidationGroup="PasswordRecovery1" 
                                                            CssClass="ForgotBtn"/>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td class="auto-style17">
                                                        <%--<asp:linkbutton ID="login" runat="server" xmlns:asp="#unknown" CssClass="forgotpassword" OnClick="login_Click">Login</asp:linkbutton>--%> 
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>       
                                </table>
                            </UserNameTemplate>
                        </asp:PasswordRecovery>


                    </td>
                    
                    <td>
                        <%--<h2 class="h2rightfloat" style="float:right; height: 100px; margin-top: 0px;"><asp:LinkButton ID="LinkButton4" runat="server" PostBackUrl="~/Directory/Default_.aspx"><asp:Image ID="Image3" runat="server" ImageUrl="~/images/Search.png" ToolTip="Click to serach for co-operative societies around Lagos"/></asp:LinkButton>FIND <br /> CO-OPERATIVES AROUND LAGOS TODAY.</h2>--%>
                        
                        
                        <%--<div id="chartdiv" runat="server" class="chartPanel" style="width:500px; height:350px">
                                                   
                        </div>
                        <div style="float:right">
                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/Stats3.png" OnClick="ImageButton1_Click"/>  
                        </div>--%>

                        &nbsp;<br />
                    </td>
                </tr>
            </table>

          
        </div>          
    </div>

    
    </form>
</body>
</html>


  <%--  <script type="text/javascript">
        // Global variable to hold data
        google.load('visualization', '1', { packages: ['corechart'] });
</script>--%>
<%--<script type="text/javascript">
    window.onresize = function () {
        drawchart();
    },
    $(function () {
        $.ajax({
            type: 'POST',
            dataType: 'json',
            contentType: 'application/json',
            url: 'Default.aspx/GetChartData',
            data: '{}',
            legend: {position: 'none'},
            success:
            function (response) {
                drawchart(response.d).onclick();
            },

            error: function () {
                alert("Error loading data! Please try again.");
            }
        });
    })

    function drawchart(dataValues) {
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Column Name');
        data.addColumn('number', 'Column Value');
        for (var i = 0; i < dataValues.length; i++) {
            data.addRow([dataValues[i].Coopname, dataValues[i].Total]);
        }
        new google.visualization.PieChart(document.getElementById('chartdiv')).
        draw(data, { }, { title: "" });

    } Int
</script>--%>

   <%-- <script type="text/javascript">
        function OpenDialog() {
            $(".chartPanel").dialog({  //Ensure you have a div element with class as chartPanel 
                autoOpen: false,
                open: function () {
                   
                    //Your ajax call here to load the chart
                }
            });
        }

        function CloseDialog() {
            $(".chartPanel").dialog("close");
        }
    </script>--%>

 <%--   <script type="text/javascript">
        $("[id*=]").live("click", function () {
            $(".chartPanel").dialog({
                title: "Area Offices",
                buttons: {
                    Close: function () {
                        $(this).dialog("close");
                    }
                }
            });
            return false;
        });

        $("#ImageButton1").onclick(function () {
            $('.chartPanel').show();
        }, function () {
            $('.chartPanel').hide();
        });
    
</script>--%>

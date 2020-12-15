using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;
using System.Data.Odbc;



public partial class _Default  : System.Web.UI.Page
{
    private SqlConnection conCh;
    private SqlCommand com;
    private string constr;
    private void connection()
    {
        constr = ConfigurationManager.ConnectionStrings["Lagos.coopdb"].ToString();
        conCh = new SqlConnection(constr);
        conCh.Open();
    }  

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //Bindchart();
           //Chart1.Visible = true;   
        }

        //lblyr.Text = DateTime.Now.Year.ToString();
        ////Bindchart();

        //HttpContext.Current.Session["sms"] = app.loadcredit();
        //string jj = HttpContext.Current.Session["sms"].ToString();
        //if (HttpContext.Current.Session["sms"].ToString() != "0.00") { string hh = "hello"; }
     }

    //[WebMethod]
    //public static List<coopdetails> GetChartData()
    //{
    //    DataTable dtch = new DataTable();
    //    using (SqlConnection conCh = new SqlConnection(ConfigurationManager.ConnectionStrings["Lagos.coopdb"].ToString()))
    //    {
    //        conCh.Open();

    //        SqlCommand cmd = new SqlCommand("SELECT dbo.AreaOffice.AreaOffices, COUNT(dbo.CoopList.AreaOffice) AS Total FROM dbo.AreaOffice INNER JOIN dbo.CoopList ON dbo.AreaOffice.ID = dbo.CoopList.AreaOffice GROUP BY dbo.AreaOffice.AreaOffices", conCh);
    //        SqlDataAdapter da = new SqlDataAdapter(cmd);
    //        da.Fill(dtch);
    //        conCh.Close();
    //    }
    //    List<coopdetails> dataList = new List<coopdetails>();
    //    foreach (DataRow dtrow in dtch.Rows)
    //    {
    //        coopdetails details = new coopdetails();
    //        details.Coopname = dtrow[0].ToString();
    //        details.Total = Convert.ToInt32(dtrow[1]);
    //        dataList.Add(details);
    //    }
    //    return dataList;
    //}
       
    private void onclickHyperLink() {
        Login1.Visible = false;
        PasswordRecovery1.Visible = true;
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        onclickHyperLink();
        //Chart1.Visible = false;
    }
    
    protected void login_Click(object sender, EventArgs e)
    {
        PasswordRecovery1.Visible = false;
        Login1.Visible = true;
        //Chart1.Visible = false;
    }

    protected void showPieChart(object sender, ImageClickEventArgs e)
    {
            //Chart1.Visible = true;
            //Bindchart();  
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {

    }

    protected void Changepassword1_SendingMail(object sender, MailMessageEventArgs e)
    {
        //MembershipProvider mp = Membership.Providers["AspNetSqlMembershipProvider"];
        //MembershipUser mbrUser = mp.GetUser(PasswordRecovery1.UserName, true);
        ////Guid usernt = (Guid)mbrUser.ProviderUserKey;

        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString))
        {
            con.Open();
            using (SqlCommand command = new SqlCommand("SELECT dbo.aspnet_Users.UserName, dbo.aspnet_Membership.LoweredEmail, dbo.aspnet_Users.telnos FROM dbo.aspnet_Membership INNER JOIN dbo.aspnet_Users ON dbo.aspnet_Membership.UserId = dbo.aspnet_Users.UserId WHERE (dbo.aspnet_Users.UserName ='" + PasswordRecovery1.UserName + "')", con))

            using (SqlDataReader rd = command.ExecuteReader())
            {
                while (rd.Read())
                {
                    HttpContext.Current.Session.Add("telnos", rd["telnos"].ToString());
                    HttpContext.Current.Session.Add("User_mail", rd["LoweredEmail"].ToString());
                }
                rd.Close();
            }
            con.Close();
        }

  
        e.Message.Body = e.Message.Body.Replace("<% Mail %>", HttpContext.Current.Session["User_mail"].ToString());


        HttpContext.Current.Session["sms"] = app.loadcredit();
        //string ss = HttpContext.Current.Session["sms"].ToString();
        if (HttpContext.Current.Session["sms"].ToString() != "0.00")
        {
            HttpContext.Current.Session["message"] = e.Message.Body;

            //string tt = HttpContext.Current.Session["telnos"].ToString();
            HttpContext.Current.Session["recipients"] = HttpContext.Current.Session["telnos"].ToString();
            HttpContext.Current.Session.Timeout = 24 * 60;
            HttpContext.Current.Session["result_sms"] = app.sendsms();
            //string gg = HttpContext.Current.Session["result_sms"].ToString();
        }
    }

    protected void LoginButton_Click(object sender, EventArgs e)
    {

        HttpContext.Current.Session["userid"] = null;
        HttpContext.Current.Session["Username_N"] = null;
        HttpContext.Current.Session["stat"]=null;
        HttpContext.Current.Session["stat_name"] = null;
        HttpContext.Current.Session["Log_id"] = null;
        HttpContext.Current.Session["admin"] = null;
        HttpContext.Current.Session["acc"] = null;
        HttpContext.Current.Session["permissions"] = null;
        HttpContext.Current.Session["UserType"] = null;
        HttpContext.Current.Session["Area"] = 0;
        HttpContext.Current.Session["Area_Name"] = "NOT SPECIFIED";
        HttpContext.Current.Session["User_mail"] = null;
        HttpContext.Current.Session["telnos"] = null;
        HttpContext.Current.Session["church_id"] = null;
          

        if (Login1.UserName.Contains("@") && Membership.GetUser(Login1.UserName) == null)
        {
            HttpContext.Current.Session["Username_N"] = Membership.GetUserNameByEmail(Login1.UserName);


            if ((Membership.GetUser(HttpContext.Current.Session["Username_N"].ToString()) != null))
            {
                if (Membership.ValidateUser(HttpContext.Current.Session["Username_N"].ToString(), Login1.Password))
                {
                    FormsAuthentication.SetAuthCookie(HttpContext.Current.Session["Username_N"].ToString(), true);
                    FormsAuthentication.RedirectFromLoginPage(HttpContext.Current.Session["Username_N"].ToString(), true);

                    MembershipUser nuser = Membership.GetUser((HttpContext.Current.Session["Username_N"].ToString()), true);

                    Guid userid = (Guid)nuser.ProviderUserKey;

                    HttpContext.Current.Session.Add("userid", userid);

                   

                    /////////////////////////////////////////////////////////////////////////////

                    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString))
                    {

                        con.Open();
                        using (SqlCommand command = new SqlCommand("select admin,acc,lvl,permissions,phonenum,church_id from aspnet_Users where UserId='" + HttpContext.Current.Session["UserId"].ToString() + "'", con))

                        using (SqlDataReader rd = command.ExecuteReader())
                        {
                            while (rd.Read())
                            {

                                HttpContext.Current.Session.Add("admin", rd["admin"].ToString());
                                HttpContext.Current.Session.Add("acc", rd["acc"].ToString());
                                HttpContext.Current.Session.Add("permissions", rd["permissions"].ToString());
                               // HttpContext.Current.Session.Add("UserType", rd["UserType"].ToString());
                                //HttpContext.Current.Session.Add("Area", rd["Area"].ToString());
                                HttpContext.Current.Session.Add("telnos", rd["phonenum"].ToString());
                                HttpContext.Current.Session.Add("church_id", rd["church_id"].ToString());
                            }
                            rd.Close();  
                        }

                        using (SqlCommand command = new SqlCommand("select LoweredEmail from aspnet_Membership where UserId='" + HttpContext.Current.Session["UserId"].ToString() + "'", con))

                        using (SqlDataReader rd = command.ExecuteReader())
                        {
                            while (rd.Read())
                            {
                                //HttpContext.Current.Session.Add("Log_id", rd["id"].ToString());
                                HttpContext.Current.Session.Add("User_mail", rd["LoweredEmail"].ToString());
                            }
                            rd.Close();
                        }
                        con.Close();
                    }

                    //using (OdbcConnection con = new OdbcConnection(ConfigurationManager.ConnectionStrings["Lagos.coopdb"].ConnectionString))
                    //{

                    //    con.Open();
                    //    using (OdbcCommand command_q = new OdbcCommand("select AreaOffices from AreaOffice where ID=" + HttpContext.Current.Session["Area"] + "", con))

                    //    using (OdbcDataReader rd_q = command_q.ExecuteReader())
                    //    {
                    //        while (rd_q.Read())
                    //        {
                    //            HttpContext.Current.Session.Add("Area_Name", rd_q["AreaOffices"].ToString());

                    //        }
                    //        rd_q.Close();
                    //    }

                    //    //------

                    //    using (OdbcCommand command_j = new OdbcCommand("select stat,types from UserTypes where sno=" + HttpContext.Current.Session["UserType"] + "", con))

                    //    using (OdbcDataReader rd_j = command_j.ExecuteReader())
                    //    {
                    //        while (rd_j.Read())
                    //        {

                    //            HttpContext.Current.Session.Add("stat", rd_j["stat"].ToString());
                    //            HttpContext.Current.Session.Add("stat_name", rd_j["types"].ToString());

                    //        }
                    //        rd_j.Close();
                    //    }
                    //    con.Close();
                    //}


                    HttpContext.Current.Session.Timeout = 24 * 60;
                
                }
                else
                {
                    LoginError();
                    //Login1.FailureText = "Your login attempt was not successful. Please check your PASSWORD and try again.";
                }
            }

            else
            {
                LoginError();
                //Login1.FailureText = "Your login attempt was not successful. Please check your PASSWORD and try again.";
            }
            //validate church ID: for User
           
            //if (  Convert.ToInt16(HttpContext.Current.Session["church_id"])== 0 ){
            ////Message Convert.ToInt16()
            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "There is no Church ID for this Username " + HttpContext.Current.Session["Username_N"].ToString(), "alert('This is no Church ID for this Username '" + HttpContext.Current.Session["Username_N"].ToString() + ")", true);
                    
            //    return;
            //}
        }
        else
        { //Use UserName to Login:

            HttpContext.Current.Session["Username_N"] = Login1.UserName;

            //HttpContext.Current.Session["Username_N"] = Login1.UserName;

            if ((Membership.GetUser(HttpContext.Current.Session["Username_N"].ToString()) != null))
            {
                if (Membership.ValidateUser(HttpContext.Current.Session["Username_N"].ToString(), Login1.Password))
                {
                    FormsAuthentication.SetAuthCookie(HttpContext.Current.Session["Username_N"].ToString(), true);
                    FormsAuthentication.RedirectFromLoginPage(HttpContext.Current.Session["Username_N"].ToString(), true);

                    MembershipUser nuser = Membership.GetUser((HttpContext.Current.Session["Username_N"].ToString()), true);

                  
                    Guid userid = (Guid)nuser.ProviderUserKey;

                    HttpContext.Current.Session.Add("userid", userid);

                   

                    //////////////////////////////////////////////////////////////
                    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString))
                    {
                            con.Open();

                            using (SqlCommand command = new SqlCommand("select admin,acc,lvl,permissions,phonenum,church_id from aspnet_Users where UserId='" + HttpContext.Current.Session["UserId"].ToString() + "'", con))

                            using (SqlDataReader rd = command.ExecuteReader())
                            {
                                while (rd.Read())
                                {

                                    HttpContext.Current.Session.Add("admin", rd["admin"].ToString());
                                    HttpContext.Current.Session.Add("acc", rd["acc"].ToString());
                                    HttpContext.Current.Session.Add("permissions", rd["permissions"].ToString());
                                  //  HttpContext.Current.Session.Add("UserType", rd["UserType"].ToString());
                                    //HttpContext.Current.Session.Add("Area", rd["Area"].ToString());
                                   // HttpContext.Current.Session.Add("telnos", rd["telnos"].ToString());
                                    HttpContext.Current.Session.Add("telnos", rd["phonenum"].ToString());
                                    HttpContext.Current.Session.Add("church_id", rd["church_id"].ToString());
                                }
                                rd.Close();
                            }

                            using (SqlCommand command = new SqlCommand("select LoweredEmail from aspnet_Membership where UserId='" + HttpContext.Current.Session["UserId"].ToString() + "'", con))

                            using (SqlDataReader rd = command.ExecuteReader())
                            {
                                while (rd.Read())
                                {
                                 //   HttpContext.Current.Session.Add("Log_id", rd["id"].ToString());
                                    HttpContext.Current.Session.Add("User_mail", rd["LoweredEmail"].ToString());
                                }
                                rd.Close();
                            }
                            con.Close();
                    }

                    //using (OdbcConnection con = new OdbcConnection(ConfigurationManager.ConnectionStrings["Lagos.coopdb"].ConnectionString))
                    //{

                    //    con.Open();
                    //    using (OdbcCommand command_q = new OdbcCommand("select AreaOffices from AreaOffice where ID=" + HttpContext.Current.Session["Area"] + "", con))

                    //    using (OdbcDataReader rd_q = command_q.ExecuteReader())
                    //    {
                    //        while (rd_q.Read())
                    //        {
                    //            HttpContext.Current.Session.Add("Area_Name", rd_q["AreaOffices"].ToString());

                    //        }
                    //        rd_q.Close();
                    //    }

                    //    //------

                    //    using (OdbcCommand command_j = new OdbcCommand("select stat,types from UserTypes where sno=" + HttpContext.Current.Session["UserType"] + "", con))

                    //    using (OdbcDataReader rd_j = command_j.ExecuteReader())
                    //    {
                    //        while (rd_j.Read())
                    //        {

                    //            HttpContext.Current.Session.Add("stat", rd_j["stat"].ToString());
                    //            HttpContext.Current.Session.Add("stat_name", rd_j["types"].ToString());

                    //        }
                    //        rd_j.Close();
                    //    }
                    //    con.Close();
                    //}
                    // validate
                    //if (Convert.ToInt16(HttpContext.Current.Session["church_id"]) == 0)
                    //{
                    //    //Message Convert.ToInt16()
                    //    ScriptManager.RegisterStartupScript(this, this.GetType(), "There is no Church ID for this Username " + HttpContext.Current.Session["Username_N"].ToString(), "alert('This is no Church ID for this Username '" + HttpContext.Current.Session["Username_N"].ToString() + ")", true);

                    //    return;
                    //}
                    HttpContext.Current.Session.Timeout = 24 * 60;
                }
                else
                {
                    LoginError();
                    //Login1.FailureText = "Your login attempt was not successful. Please check your PASSWORD and try again.";
                }
            }

            else
            {
                LoginError();
                //Login1.FailureText = "Your login attempt was not successful. Please check your PASSWORD and try again.";
            }
        }
       
        
    }

    private void LoginError()
    {
        if (HttpContext.Current.Session["Username_N"] == null)
        {
            //Login1.FailureText = "There is no user in the database with the username " + Login1.UserName.ToString();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "There is no user in the database with the username " + HttpContext.Current.Session["Username_N"].ToString(), "alert('There is no user in the database with the username '" + HttpContext.Current.Session["Username_N"].ToString() + ")", true);
            return;
        }

        //See if this user exists in the database 
        MembershipUser userInfo = Membership.GetUser(HttpContext.Current.Session["Username_N"].ToString());


        if (userInfo == null)
        {
            //The user entered an invalid username... 
            //Login1.FailureText = "There is no user in the database with the username " + HttpContext.Current.Session["Username_N"].ToString();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "There is no user in the database with the username " + HttpContext.Current.Session["Username_N"].ToString(), "alert('There is no user in the database with the username '" + HttpContext.Current.Session["Username_N"].ToString() + ")", true);
            return;
        }
        else
        {
            //See if the user is locked out or not approved 

            if (userInfo.IsApproved == false)
            {
                //Login1.FailureText = "Your account has not yet been approved by the site's administrators. Please try again later...";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Your account has been suspended by the site's administrator. Please contact a site administrator through admin@coopdb.org", "alert('Your account has been suspended by the site's administrator. Please contact a site administrator through admin@coopdb.org')", true);
                return;
            }
            else if (userInfo.IsLockedOut)
            {
                //Login1.FailureText = "Your account has been locked out because of a <br/>maximum number of incorrect login attempts.<br/> You will NOT be able to login until you contact a site <br/>administrator and have your account unlocked.";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Your account has been locked out because of a maximum number of incorrect login attempts.You will NOT be able to login until you contact a site administrator through admin@coopdb.org, and have your account unlocked.", "alert('Your account has been locked out because of a maximum number of incorrect login attempts.You will NOT be able to login until you contact a site administrator through admin@coopdb.org, and have your account unlocked.')", true);
                return;
            }
            else
            {
                //The password was incorrect (don't show anything, the Login control already describes the problem) 
                //Login1.FailureText = string.Empty;
                //Login1.FailureText = "Your login attempt was not successful. Please check your PASSWORD and try again.";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Your login attempt was not successful. Please check your PASSWORD and try again.", "alert('Your login attempt was not successful. Please check your PASSWORD and try again.')", true);
                return;
            }
        }
    }
    private void LoginError2()
    {
        if (HttpContext.Current.Session["Username_N"] == null)
        {
            //Login1.FailureText = "There is no user in the database with the username " + Login1.UserName.ToString();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "There is no user in the database with the username " + HttpContext.Current.Session["Username_N"].ToString(), "alert('There is no user in the database with the username '" + HttpContext.Current.Session["Username_N"].ToString() + ")", true);
            return;
        }

        //See if this user exists in the database 
        MembershipUser userInfo = Membership.GetUser(HttpContext.Current.Session["Username_N"].ToString());


        if (userInfo == null)
        {
            //The user entered an invalid username... 
            //Login1.FailureText = "There is no user in the database with the username " + HttpContext.Current.Session["Username_N"].ToString();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "There is no user in the database with the username " + HttpContext.Current.Session["Username_N"].ToString(), "alert('There is no user in the database with the username '" + HttpContext.Current.Session["Username_N"].ToString() + ")", true);
            return;
        }
        else
        {
            //See if the user is locked out or not approved 

            if (userInfo.IsApproved==false)
            {
                //Login1.FailureText = "Your account has not yet been approved by the site's administrators. Please try again later...";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Your account has been suspended by the site's administrator. Please contact a site administrator through admin@coopdb.org", "alert('Your account has been suspended by the site's administrator. Please contact a site administrator through admin@coopdb.org')", true);
                return;
            }
            else if (userInfo.IsLockedOut)
            {
                //Login1.FailureText = "Your account has been locked out because of a <br/>maximum number of incorrect login attempts.<br/> You will NOT be able to login until you contact a site <br/>administrator and have your account unlocked.";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Your account has been locked out because of a maximum number of incorrect login attempts.You will NOT be able to login until you contact a site administrator through admin@coopdb.org, and have your account unlocked.", "alert('Your account has been locked out because of a maximum number of incorrect login attempts.You will NOT be able to login until you contact a site administrator through admin@coopdb.org, and have your account unlocked.')", true);
                return;
            }
            else
            {
                //The password was incorrect (don't show anything, the Login control already describes the problem) 
                //Login1.FailureText = string.Empty;
                //Login1.FailureText = "Your login attempt was not successful. Please check your PASSWORD and try again.";
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "Your login attempt was not successful. Please check your PASSWORD and try again.", "alert('Your login attempt was not successful. Please check your PASSWORD and try again.')", true);
                //return;
            }
        }
    }

    protected void PasswordRecovery1_VerifyingUser(object sender, LoginCancelEventArgs e)
    {
        HttpContext.Current.Session["Username_N"] = PasswordRecovery1.UserName;
        LoginError2();
    }

}

public class coopdetails
{
    public string Coopname { get; set; }
    public int Total { get; set; }
}
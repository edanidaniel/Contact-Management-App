using System;
using ContactManagerApp.AppData;
using System.Data;

namespace ContactManagerApp
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                Session.Clear();
            }
        }
        public void ClearTextBox()
        {
            this.TextBoxEmail.Text = "";
            this.TextBoxPassword.Text = "";
        }
        protected void signin_Click(object sender, EventArgs e)
        {
            string email = this.TextBoxEmail.Text.Trim();
            string password = this.TextBoxPassword.Text.Trim();
            DataTable userlogin = new DataTable();
            userlogin = Utility.CheckUserLogin(email, password);
            try
            {
                if (userlogin.Rows.Count > 0)
                {
                    int userid = Convert.ToInt32(userlogin.Rows[0].ItemArray[0]);
                    Session["Email"] = email;
                    Session["Pwd"] = password;
                    Session["Userid"] = userid;
                    //Response.Write("<script>alert('Login successfully!')</script>");
                    this.ClearTextBox();
                    Response.Redirect("/AddContact.aspx", false);
                }
                else
                {
                    this.ClearTextBox();
                    Response.Write("<script>alert('Please check email and password')</script>");
                }
            }
            catch (Exception ex)
            {

            }
        }
    }
}
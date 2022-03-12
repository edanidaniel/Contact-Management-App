using System;
using ContactManagerApp.Model;
using System.Data;
using ContactManagerApp.AppData;

namespace ContactManagerApp
{
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        //Clear all textbox
        public void ClearTextBox()
        {
            this.TextBoxEmail.Text = "";
            this.TextBoxPassword.Text = "";
            this.TextBoxSecret.Text = "";
        }
        //Sign Up Button
        protected void signup_Click(object sender, EventArgs e)
        {
            try
            {
                bool email = false;
                bool secret = false;
                bool result;
                User user = new User();
                user.User_EmailID = this.TextBoxEmail.Text.Trim();
                user.User_Password = this.TextBoxPassword.Text.Trim();
                user.User_Secret = this.TextBoxSecret.Text.Trim();
                DataTable emailcheck = Utility.CheckEmailExists(user.User_EmailID);
                DataTable secretcheck = Utility.CheckSecretExists(user.User_Secret);
                if (emailcheck.Rows.Count > 0)
                {
                    email = true;
                    Response.Write("<script>alert('Email is already Exists')</script>");
                }
                else
                {
                    email = false;
                }
                if (secretcheck.Rows.Count > 0)
                {
                    secret = true;
                    Response.Write("<script>alert('Secret is already Exists!')</script>");
                }
                else
                {
                    secret = false;
                }
                if (!email && !secret)
                {
                    result = Utility.CreateUserRegisters(user);
                    if (result)
                    {
                        this.ClearTextBox();
                        Response.Write("<script>alert('SignUp Successfully!')</script>");
                        Response.Redirect("/Login.aspx", false);
                    }
                    else
                    {
                        this.ClearTextBox();
                        Response.Write("<script>alert('SignUp Failed')</script>");
                    }
                }
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('Error')</script>");
            }
        }
    }
}
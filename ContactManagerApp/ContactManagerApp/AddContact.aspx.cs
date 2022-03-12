using System;
using System.Configuration;
using ContactManagerApp.Model;
using ContactManagerApp.AppData;
using System.Data;

namespace ContactManagerApp
{
    public partial class AddContact : System.Web.UI.Page
    {
        public string constr = ConfigurationManager.ConnectionStrings["ConnectionStr"].ConnectionString;
        public int userid = 0;
        public string email = "";
        public string pwd = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                if (Session["Userid"] != null && Session["email"] != null)
                {
                    userid = Convert.ToInt32(Session["Userid"]);
                    this.HiddenFieldUserID.Value = userid.ToString();
                    email = Session["email"].ToString();
                    this.emailtext.Text = email;
                    this.BindGrid_Contact();
                }
                else
                {
                    Response.Redirect("/Login.aspx");
                }
                   
            }
        }
        private void BindGrid_Contact()
        {
            int userid = Convert.ToInt32(this.HiddenFieldUserID.Value);
            DataTable datatable = new DataTable();
            datatable = Utility.GetUserContact(userid);
            this.GridView_Contact.DataSource = datatable;
            this.GridView_Contact.DataBind();
        }

        protected void LinkButtonLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            //Response.Write("<script>alert('Logout Successfully!')</script>");
            Response.Redirect("/Login.aspx",false);
        }
        public void ClearData()
        {
            this.TextBoxName.Text = "";
            this.TextBoxPhNo.Text = "";
            this.TextBoxEmail.Text = "";
        }
        protected void savecontact_Click(object sender, EventArgs e)
        {
            bool addemailcheck;
            bool addphnocheck;
            bool result;
            Contact contact = new Contact();
            contact.UserID = Convert.ToInt32(Session["Userid"]);
            contact.ContactName = this.TextBoxName.Text.Trim();
            contact.ContactPhNo = this.TextBoxPhNo.Text.Trim();
            contact.ContactEmail = this.TextBoxEmail.Text.Trim();
            if(contact.UserID!=0)
            {
                DataTable emailcheck = Utility.AddEmailExists(contact.ContactEmail, contact.UserID);
                DataTable phnocheck = Utility.AddPhnoExists(contact.ContactPhNo, contact.UserID);
                if (emailcheck.Rows.Count > 0)
                {
                    addemailcheck = true;
                    Response.Write("<script>alert('Email is already Exists in Contact')</script>");
                }
                else
                {
                    addemailcheck = false;
                }
                if (phnocheck.Rows.Count > 0)
                {
                    addphnocheck = true;
                    Response.Write("<script>alert('Ph no is already Exists in Contact')</script>");
                }
                else
                {
                    addphnocheck = false;
                }
                if (!addemailcheck && !addphnocheck)
                {
                    result = Utility.CreateUserContact(contact);
                    if (result)
                    {
                        this.ClearData();
                        this.BindGrid_Contact();
                        Response.Write("<script>alert('Save Successfully!')</script>");
                    }
                    else
                    {
                        this.ClearData();
                        this.BindGrid_Contact();
                        Response.Write("<script>alert('Save Failed')</script>");
                    }
                }
            }
            else
            {
                Response.Redirect("/Login.aspx", false);
                Response.Write("<script>alert('Login')</script>");
            }
        }
    }
}
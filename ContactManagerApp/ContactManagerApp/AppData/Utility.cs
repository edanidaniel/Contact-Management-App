using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using ContactManagerApp.Model;

namespace ContactManagerApp.AppData
{
    public class Utility
    {
        private static string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionStr"].ConnectionString;
        public static DataSet GetData(string cmdstring)
        {
            string str1 = string.Empty;
            string str2 = string.Empty;
            DataSet dataSet = new DataSet();
            try
            {
                SqlConnection selectConnection = new SqlConnection(Utility.ConnectionString);
                selectConnection.Open();
                SqlCommand cmd = new SqlCommand(cmdstring, selectConnection);
                cmd.CommandTimeout = 0;
                ((DataAdapter)new SqlDataAdapter(cmd)).Fill(dataSet);
                selectConnection.Close();

            }
            catch (Exception ex)
            {
                throw;
            }
            return dataSet;
        }
        public static DataTable GetUserContact(int userid)
        {
            return Utility.GetData("select * from ContactForm where Archived=0 and Contact_UserID = " + userid + "").Tables[0];
        }
        public static DataTable CheckUserLogin(string email,string password)
        {
            return Utility.GetData("select * from UserRegisters where Archived=0 and User_EmailID = '" + email + "' and User_Password = '" + password + "'").Tables[0];
        }
        public static DataTable CheckEmailExists(string email)
        {
            return Utility.GetData("select * from UserRegisters where Archived=0 and User_EmailID = '" + email + "'").Tables[0];
        }
        public static DataTable CheckSecretExists(string secret)
        {
            return Utility.GetData("select * from UserRegisters where Archived=0 and User_Secret = '" + secret + "'").Tables[0];
        }
        public static bool CreateUserRegisters(User user)
        {
            bool result1 = false;
            string query = ("insert into UserRegisters (User_EmailID,User_Password,User_Secret) values (@Email,@Password,@Secret)");
            SqlCommand selectCommand = new SqlCommand(query, new SqlConnection(Utility.ConnectionString));
            selectCommand.Parameters.AddWithValue("@Email", user.User_EmailID);
            selectCommand.Parameters.AddWithValue("@Password", user.User_Password);
            selectCommand.Parameters.AddWithValue("@Secret", user.User_Secret);
            selectCommand.Connection.Open();
            int result = selectCommand.ExecuteNonQuery();
            if (result < 0)
                result1 = false;
            else
                result1 = true;
            selectCommand.Connection.Close();
            selectCommand.CommandTimeout = 0;
            return result1;
        }
        public static DataTable AddEmailExists(string email, int userid)
        {
            return Utility.GetData("select * from ContactForm where Archived=0 and Contact_UserID = " + userid + " and Contact_Email = '" + email + "'").Tables[0];
        }
        public static DataTable AddPhnoExists(string Phno, int userid)
        {
            return Utility.GetData("select * from ContactForm where Archived=0 and Contact_UserID = " + userid + " and Contact_Phno = '" + Phno + "'").Tables[0];
        }
        public static bool CreateUserContact(Contact contact)
        {
            bool result1 = false;
            string query = ("insert into ContactForm (Contact_Name,Contact_Phno,Contact_Email,Contact_UserID) values (@Name,@Phno,@Email,@UserID)");
            SqlCommand selectCommand = new SqlCommand(query, new SqlConnection(Utility.ConnectionString));
            selectCommand.Parameters.AddWithValue("@Name", contact.ContactName);
            selectCommand.Parameters.AddWithValue("@Phno", contact.ContactPhNo);
            selectCommand.Parameters.AddWithValue("@Email", contact.ContactEmail);
            selectCommand.Parameters.AddWithValue("@UserID", contact.UserID);
            selectCommand.Connection.Open();
            int result = selectCommand.ExecuteNonQuery();
            if (result < 0)
                result1 = false;
            else
                result1 = true;
            selectCommand.Connection.Close();
            selectCommand.CommandTimeout = 0;
            return result1;
        }
    }
}   
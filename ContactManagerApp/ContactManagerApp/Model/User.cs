using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ContactManagerApp.Model
{
    public class User
    {
        public int? User_ID { get; set; }

        public string User_EmailID { get; set; }

        public string User_Password { get; set; }

        public string User_Secret { get; set; }
    }
}
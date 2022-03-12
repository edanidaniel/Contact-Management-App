using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ContactManagerApp.Model
{
    public class Contact
    {
        public int? ContactID { get; set; }

        public string ContactName { get; set; }

        public string ContactPhNo { get; set; }

        public string ContactEmail { get; set; }

        public int UserID { get; set; }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        [WebMethod]
        public static bool LoginMe(string username, string password)
        {
            try
            {
            using (PmalGatepass db = new PmalGatepass())
            {
                var admin = db.User.Where(i => i.UserName == username && i.UserNamePassword == password).FirstOrDefault();
                if (admin != null)
                {
                    return true;
                }
                return false;
            }
            } catch (Exception ex) {
                Console.WriteLine(ex.Message); 
                return false;
            }
        }
    }
}
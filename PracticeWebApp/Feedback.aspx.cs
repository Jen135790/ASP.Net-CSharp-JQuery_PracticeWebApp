using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace PracticeWebApp
{
    public partial class Feedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnPost_Click(object sender, EventArgs e)
        {
            string file = MapPath("~/js/feedback.xml");
            XDocument doc = XDocument.Load(file);

            XElement post = new XElement("POST");
            XElement name = new XElement("NAME", txtName.Text);
            XElement comment = new XElement("COMMENT", txtComments.Value);

            post.Add(name);
            post.Add(comment);

            doc.Root.Add(post);
            
            
            doc.Save(file);

            Response.Redirect("Feedback.aspx");
        }
    }
}
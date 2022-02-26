using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] != null) 
        {
            linklogin.Visible = false;
            linkLogout.Visible = true;
            linkJoin.Visible = false;
            lblHello.Text = "שלום, " + Session["username"];
            lbljoined.Visible = true;
        }
        else
        {
            string returnURL = Request.Url.PathAndQuery;
            if (returnURL.ToLower().StartsWith("/newlogin.aspx"))
                returnURL = Request.QueryString["returnURL"] ?? ".";
            linklogin.NavigateUrl = "~/newlogin.aspx?returnURL=" + Server.UrlEncode(returnURL);
            lbltoreadyriddles.Visible = true;
            linkreadyquestions.Visible = false;
        }
        HttpCookie cookie = Request.Cookies["contrast"];
        if (null != cookie && "high" == cookie.Value)
            elBody.Attributes.Add("class", "high-contrast");
    }

    protected void linkLogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect(".");
    }

    protected void linkJoin_Click(object sender, EventArgs e)
    {
        Response.Redirect("newJoin.aspx");
    }

    protected void linkquestion_Click(object sender, EventArgs e)
    {
        Response.Redirect("Questions.aspx");
    }

    protected void linkquestions_Click(object sender, EventArgs e)
    {
        Response.Redirect("Question.aspx?id=1");
    }
    protected void BtnHighContrast_Click(object s, EventArgs e)
    // פעולה המשנה את החדות לגבוהה ושומרת את ההעדפה בדפדפן
    {
        elBody.Attributes.Add("class", "high-contrast");
        HttpCookie cookie = new HttpCookie("contrast");
        cookie.Value = "high";
        cookie.Expires = DateTime.Now.AddYears(1); // שמור לשנה
        Response.Cookies.Add(cookie);
    }

    protected void BtnNormContrast_Click(object sender, EventArgs e)
    {
        HttpCookie cookie = Request.Cookies["contrast"];
        if (cookie != null)
        {
            cookie.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Add(cookie);
            Response.Redirect(Request.Url.AbsoluteUri);
        }
    }

    protected void linkreadyquestions_Click(object sender, EventArgs e)
    {
        Response.Redirect("ReadyRiddles.aspx");
    }

    protected void linklogin_Click(object sender, EventArgs e)
    {

    }
}

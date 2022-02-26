using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ReadyRiddles : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Littlekids_Click(object sender, EventArgs e)
    {
        Response.Redirect("littlekids.aspx");
    }

    protected void Middleschool_Click(object sender, EventArgs e)
    {
        Response.Redirect("Middleschoolriddles.aspx");
    }

    protected void Highschool_Click(object sender, EventArgs e)
    {
        Response.Redirect("Highschoolriddles.aspx");
    }

    protected void Adualts_Click(object sender, EventArgs e)
    {
        Response.Redirect("Adualtsriddles.aspx");
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class newlogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_Click1(object sender, EventArgs e)
    {
		using (MyDB db = new MyDB())
		{
			string sql = @"SELECT [user_id], [hash], [salt], [user_role]
				FROM [Users]
				WHERE [username]={0}";
			var command = db.Command(sql, txtuser.Text);
			var row = command.GetFirstRow();
			if (row != null)
			{
				// נשחזר את הגיבוב עם הסיסמה שהוזנה כעת
				string hash = Password.Hash(txtpass.Text, (string)row["salt"]);
				// נבדוק אם קיבלנו גיבוב זהה לזה מהמסד
				if (hash == (string)row["hash"])
				{
					Session["user_id"] = row["user_id"];
					Session["username"] = txtuser.Text;
					Session["user_role"] = row["user_role"];
					// ... וכל שאר הנתונים שאנחנו מעוניינים לשמור ...
					Response.Redirect(Request.QueryString["returnURL"] ?? ".");
				}
			}
			// לא נמצא משתמש או הסיסמה לא מתאימה
			lblmass.Text = "שם המשתמש או הסיסמה שגויים.";
		}
	}

    protected void btnJoin_Click(object sender, EventArgs e)
    {
		Response.Redirect("newJoin.aspx");
    }

    protected void btnfree_Click(object sender, EventArgs e)
    {
		Response.Redirect(".");
	}
}
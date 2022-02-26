using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class newJoin : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}

	protected void btnJoin_Click(object sender, EventArgs e)
	{
		string name = txtuser.Text, pass = txtpass.Text;
		string sql_taken = "SELECT COUNT(1) FROM [Users] WHERE [username]={0}";
		string sql_add = @"INSERT INTO [Users] ([username], [hash], [salt])
			VALUES ({0}, {1}, {2})";
		using (MyDB db = new MyDB()) 
		{
			// ?האם שם המשתמש תפוס
			var cmd_taken = db.Command(sql_taken, name);
			if ((int)cmd_taken.ExecuteScalar() > 0)
				lblmass.Text = "שם המשתמש " + name + " תפוס.";
			else
			{
				// המלחה וגיבוב
				string salt = Password.Salt();
				string hash = Password.Hash(pass, salt);

				// הוספת המשתמש
				if (txtpass.Text == txtverifypass.Text)
				{
					var cmd_add = db.Command(sql_add, name, hash, salt);
					cmd_add.ExecuteNonQuery();
					Response.Redirect("welcome.html");
				}
				else
				{
					lblmass.Text = "הסיסמאות אינן תואמות";
				}


			}
			var cmd_out = db.Command("SELECT @@IDENTITY");
			Session["user_id"] = cmd_out.ExecuteScalar();
		}
	}

    protected void btnlogin_Click(object sender, EventArgs e)
    {
		Response.Redirect("newlogin.aspx");
    }

    protected void btnfree_Click(object sender, EventArgs e)
    {
		Response.Redirect(".");
    }
}

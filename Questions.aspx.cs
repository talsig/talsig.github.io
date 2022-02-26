using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Questions : System.Web.UI.Page
{
	public bool IsAdmin;
	protected void Page_PreRender(object sender, EventArgs e)
	{
		string sql = "SELECT [question_id], [title], [username]" +
			" FROM [Questions] AS Q" +
			" INNER JOIN [Users] AS U ON Q.[by_user]=U.[user_id]" +
			" ORDER BY [creation_time] DESC";
		string html = "";
		using (MyDB db = new MyDB())
		{
			var questions = db.Command(sql).GetTable();
			for (int i = 0; i < questions.Rows.Count; i++)
			{
				var row = questions.Rows[i];
				html += "<li><a href='Question.aspx?id=" + row["question_id"] +
					"'>" + row["title"] + "</a> מאת " + row["username"] +
					"</li>";
			}
		}
		ulSubjects.InnerHtml = html;
	}
	protected void Page_Load(object sender, EventArgs e)
	{
		IsAdmin = "Admin".Equals(Session["user_role"]);
		PnlPostNewRiddle.Visible = Session["user_id"] != null; // הגולש מחובר
		LnkLoginToPost.Visible = Session["user_id"] == null; // הגולש אינו מחובר
		if(Session["username"] != null)
        {
			ulSubjects.Visible = true;
			seeRiddles.Visible = false;
        }
	}
	protected void AddNewRiddle_Click(object sender, EventArgs e)
	{
		if (Session["user_id"] == null) // הגולש אינו מחובר
        {
			Response.Redirect("newlogin.aspx");
		}

		else
		{
			string sql = "INSERT INTO [Questions] ([title], [content], [by_user])" +
				" VALUES ({0}, {1}, {2})";
			using (MyDB db = new MyDB())
			{
				var cmd = db.Command(sql, TxtTitle.Text, TxtContent.Text, Session["user_id"]);
				cmd.ExecuteNonQuery();
			}
			SuccessfulRiddle.Visible = true;
		}
	}
}
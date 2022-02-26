using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Question : System.Web.UI.Page
{
	public bool IsAdmin;
	public int RiddleId;

	protected void Page_Load(object sender, EventArgs e)
	{
		string id = Request.QueryString["id"];
		if (int.TryParse(id, out RiddleId) == false)
			Response.Redirect("Questions.aspx");
		IsAdmin = "Admin".Equals(Session["user_role"]);
	}
	protected void Page_PreRender(object sender, EventArgs e)
	{
		string sql_riddle = @"SELECT *
			FROM [Questions] AS Q
			INNER JOIN [Users] AS U ON Q.[by_user]=U.[user_id]
			WHERE [question_id]={0} AND [is_visible]";
		using (MyDB db = new MyDB())
		{
			var cmd_riddle = db.Command(sql_riddle, RiddleId);
			var riddle = cmd_riddle.GetFirstRow();
			if (riddle == null)
				Response.Redirect("Questions.aspx");
			Page.Title = riddle["title"].ToString();
			Lbltitle.Text = riddle["title"].ToString();
			LblContent.Text = riddle["content"].ToString();
			LblPostedBy.Text = riddle["username"].ToString();
			LblCreationTime.Text = riddle["creation_time"].ToString();
			string sql_replies = @"SELECT *
				FROM [replies] AS A
				INNER JOIN [Users] AS U ON A.[by_user]=U.[user_id]
				WHERE [to_question]={0} AND [is_visible]
				ORDER BY [creation_time]";
			var cmd_replies = db.Command(sql_replies, RiddleId);
			LVReplies.DataSource = cmd_replies.GetTable();
			LVReplies.DataBind();
		}

	}
	protected void replyadd_Click(object sender, EventArgs e)
	{
		if (Session["user_id"] == null) // הגולש אינו מחובר
			Response.Redirect("newlogin.aspx");
		else
		{
			string sql = "INSERT INTO [replies] ([title], [content], [by_user], [to_question])" +
				" VALUES ({0}, {1}, {2}, {3})";

			using (MyDB db = new MyDB())
			{
				var cmd = db.Command(sql, TxtTitle.Text, TxtContent.Text, Session["user_id"], RiddleId);
				cmd.ExecuteNonQuery();
			}
		}
		Application.Lock();
		Application["latestRiddleId"] = RiddleId;
		Application["latestRiddleTitle"] = Page.Title;
		Application.UnLock();
	}
	protected void LVReplies_ItemCommand(object sender, ListViewCommandEventArgs e)
	{
		if ("DeleteReply" == e.CommandName) // כפתור מחיקה
		{
			int msg_id = int.Parse((string)e.CommandArgument);
			string sql = @"UPDATE [replies] SET [is_visible]=0
				WHERE [reply_id]={0}";
			using (MyDB db = new MyDB())
				db.Command(sql, msg_id).ExecuteNonQuery();
		}
		else if ("Vote" == e.CommandName) // כפתור דירוג
		{
			int msg_id = int.Parse((string)e.CommandArgument);
			string tool_tip = ((Button)sender).ToolTip;
			int rate = int.Parse(tool_tip);
			string sql = @"UPDATE [replies]
				SET [reply_count]=[reply_count]+1, [reply_sum]=[reply_sum]+{0}
				WHERE [reply_id]={1}";
			using (MyDB db = new MyDB())
				db.Command(sql, rate, msg_id).ExecuteNonQuery();
		}
	}

    protected void DeleteQuestion_Click(object sender, CommandEventArgs e)
    {
		int msg_id = int.Parse((string)e.CommandArgument);
		string sql = @"UPDATE [Questions] SET [is_visible] =0
				WHERE [question_id]={0}";
		using (MyDB db = new MyDB())
			db.Command(sql, msg_id).ExecuteNonQuery();
	}
}

using System.Web.Script.Services;
using System.Web.Services;
using System.Data; // for DataTable

[ScriptService]
public class MyWebService : WebService
{
	/// <summary>
	/// פעולת רשת המקבלת שם משתמש ומחזירה אמת אם השם תפוס או שקר אם לא
	/// </summary>
	[WebMethod]
	[ScriptMethod]
	public bool IsUserNameTaken(string username)
	{
		string sql = "SELECT COUNT(1) FROM [Users] WHERE [username]={0}";
		using (MyDB db = new MyDB())
		{
			var cmd = db.Command(sql, username);
			return (int)cmd.ExecuteScalar() > 0;
		}
	}
	/// <summary>
	/// פעולת רשת המקבלת מספר חידה ודירוג בין 1 ל־5,
	/// מעדכנת ומחזירה את הדירוג הממוצע
	/// </summary>
	[WebMethod(EnableSession = true)]
	[ScriptMethod]
	public double Vote(int riddle, int rate)
	{
		if (Session["user_id"] != null)
		{
			int user = (int)Session["user_id"];
			string sql_vote = @"UPDATE [Questions]
				SET [vote_count]=[vote_count]+1, [vote_sum]=[vote_sum]+{0}
				WHERE [question_id]={1}";
			using (MyDB db = new MyDB())
				db.Command(sql_vote, rate, riddle).ExecuteNonQuery();
			string sql_rate = "SELECT [vote_sum] / [vote_count]" +
				"FROM [Questions]";
			using (MyDB db = new MyDB())
				return (double)db.Command(sql_rate, riddle).ExecuteScalar();
		}
		else
        {
			return 0;
        }
	}
	/// <summary>
	/// פעולת רשת המקבלת מספר חידה, ומחזירה את פרטיה
	/// </summary>
	[WebMethod]
	[ScriptMethod]
	public object[] GetRiddle(int id)
	{
		string sql = "SELECT * FROM [Questions] WHERE [question_id]={0}";
		using (MyDB db = new MyDB())
		{
			var cmd = db.Command(sql, id);
			return cmd.GetFirstRow().ItemArray;
		}
	}

	/// <summary>
	/// פעולת רשת המקבלת מספר חידה, ומחזירה את פרטיה
	/// </summary>
	/// <summary>
	/// פעולת עזר המקבלת טבלה ומחזירה את הערכים שלה כמטריצה
	/// </summary>
	private object[][] GetMatrix(DataTable table)
	{
		object[][] matrix = new object[table.Rows.Count][];
		for (int i = 0; i < table.Rows.Count; i++)
		{
			matrix[i] = table.Rows[i].ItemArray;
		}
		return matrix;
	}

	/// <summary>
	/// פעולת רשת המקבלת מילה ומחזירה את פרטי החידות המכילות את המילה
	/// </summary>
	/// <summary> פעולה המחזירה מטריצה של כל החידות </summary>
	[WebMethod]
	[ScriptMethod]
	public object[][] FindRiddles(string word)
	{
		string sql = "SELECT * FROM [Questions] WHERE [content] LIKE {0}";
		using (MyDB db = new MyDB())
		{
			var cmd = db.Command(sql, "%" + word + "%");
			return GetMatrix(cmd.GetTable());
		}
	}
}

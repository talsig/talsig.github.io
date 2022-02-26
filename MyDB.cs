using System;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.OleDb;
using System.Linq;

public class MyDB : IDisposable
{
	private readonly OleDbConnection con; // החיבור למסד

	/// <summary> פעולה בונה הפותחת חיבור למסד </summary>
	public MyDB()
	{
		string cs = ConfigurationManager.ConnectionStrings["MyDataBase"].ConnectionString;
		con = new OleDbConnection(cs);
		con.Open();
	}

	/// <summary> פעולת עזר להכנת משפט לביצוע </summary>
	/// <param name="sql"> משפט לביצוע. מקום להצבת ערכים מסומן ב־{0}, {1} וכו׳ </param>
	/// <param name="values"> אפס או יותר ערכים להצבה במשפט </param>
	public DbCommand Command(string sql, params object[] values)
	{
		if (values.Length > 0)
			sql = string.Format(sql, values.Select(_ => " ? ").ToArray());
		OleDbCommand cmd = new OleDbCommand(sql, con);
		for (int i = 0; i < values.Length; i++)
			cmd.Parameters.AddWithValue("", values[i]);
		return cmd;
	}

	/// <summary> פעולה המנתקת את החיבור למסד ומשחררת את המשאב </summary>
	public void Dispose()
	{
		con.Dispose();
	}
}

public static class ExtraCommands
{
	/// <summary> פעולה השולפת נתונים מהמסד ומחזירה אותם בטבלה </summary>
	public static DataTable GetTable(this DbCommand cmd)
	{
		DataTable table = new DataTable();
		using (DbDataReader data = cmd.ExecuteReader())
			table.Load(data);
		return table;
	}

	/// <summary> פעולה השולפת נתונים מהמסד ומחזירה את השורה הראשונה שנשלפה </summary>
	public static DataRow GetFirstRow(this DbCommand cmd)
	{
		DataTable table = cmd.GetTable();
		if (table.Rows.Count > 0)
			return table.Rows[0];
		return null;
	}
}
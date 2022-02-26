using System;
using System.Security.Cryptography; // מחלקות אבטחת מידע תקניות

public class Password
{
	const int SALT_LENGTH = 24;   // אורך המלח × 3/4
	const int HASH_LENGTH = 24;   // אורך הגיבוב × 3/4
	const int HASH_REPEAT = 731; // מספר החזרות על הגיבוב

	/// <summary> פעולה המחזירה מחרוזת אקראית (״מלח״) חדשה </summary>
	public static string Salt()
	{
		byte[] salt = new byte[SALT_LENGTH];
		using (var random = new RNGCryptoServiceProvider())
			random.GetNonZeroBytes(salt);
		return Convert.ToBase64String(salt);
	}

	/// <summary>
	/// פעולה המקבלת סיסמה ומלח ומחזירה גיבוב שלהם יחד
	/// </summary>
	public static string Hash(string password, string salt)
	{
		byte[] bytes = Convert.FromBase64String(salt);
		using (var hasher = new Rfc2898DeriveBytes(password, bytes, HASH_REPEAT))
			bytes = hasher.GetBytes(HASH_LENGTH);
		return Convert.ToBase64String(bytes);
	}
}
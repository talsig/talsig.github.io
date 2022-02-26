<%@ Page Language="C#" AutoEventWireup="true" CodeFile="newJoin.aspx.cs" Inherits="newJoin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="he" dir="rtl" >
<head runat="server">
    <title>הרשמה</title>
    <link href="../Styles/login.css" rel="stylesheet" />
</head>
<body>
    <div class="loginbox2">
        <img src="images/avatar.png" alt="Alternate Text" class="user" />
        <h2>הרשמה</h2>
        <form runat="server">
            <asp:Label Text="שם משתמש" CssClass="lblUser" runat="server" />
            <asp:TextBox ID="txtuser" runat="server" CssClass="txtUser" placeholder="הכנס שם משתמש"/> 
            <asp:Label Text="סיסמא" CssClass="lblPass" runat="server" />
            <asp:TextBox ID="txtpass" runat="server" CssClass="txtPass" placeholder="*******" TextMode="Password" />
            <asp:Label Text="אימות סיסמא" CssClass="lblPass" runat="server" />
            <asp:TextBox ID="txtverifypass" runat="server" CssClass="txtPass" placeholder="*******" TextMode="Password" />
            <asp:Label  ID="lblmass" runat="server" CssClass="lblmass" />
            <asp:Button ID="btnJoin" runat="server" CssClass="btnSubmit" Text="הירשם" OnClick="btnJoin_Click" />
            <asp:Label ID="termsandprivacy" runat="server" CssClass="privacyandpolicy" Text="על ידי לחיצה על כפתור ההרשמה את\ה מסכים\ה" /> <a href="privacyandpolicy.html">לתנאי הפרטיות</a>
            <asp:Button ID="btnlogin" runat="server" CssClass="btnSubmit" Text="כבר רשום? היכנס" OnClick="btnlogin_Click" />
            <asp:Button ID="btnfree" runat="server" CssClass="btnSubmit" Text="לתוכן ללא הרשמה" OnClick="btnfree_Click" />
        </form>
    </div>
</body>
</html>

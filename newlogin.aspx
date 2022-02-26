<%@ Page Language="C#" AutoEventWireup="true" CodeFile="newlogin.aspx.cs" Inherits="newlogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="he" dir="rtl" >
<head runat="server">
    <title>כניסת משתמשים</title>
    <link href="../Styles/login.css" rel="stylesheet" />
</head>
<body>
    <div class="loginbox">
        <img src="images/avatar.png" alt="Alternate Text" class="user" />
        <h2>התחברות</h2>
        <form runat="server">
            <asp:Label Text="שם משתמש" CssClass="lblUser" runat="server" />
            <asp:TextBox ID="txtuser" runat="server" CssClass="txtUser" placeholder="הכנס שם משתמש"/> 
            <asp:Label Text="סיסמא" CssClass="lblPass" runat="server" />
            <asp:TextBox ID="txtpass" runat="server" CssClass="txtPass" placeholder="*******" TextMode="Password" />
            <asp:Label  ID="lblmass" runat="server" CssClass="lblmass" />
            <asp:Button  ID="btnLogin" Text="התחברות" CssClass="btnSubmit" runat="server" OnClick="btnLogin_Click1" />
            <asp:HyperLink ID="forgotPass" Text="שכחת סיסמא?" CssClass="forgotPass" runat="server" NavigateUrl="~/forgotpassword.html" /> 
            <asp:Button ID="btnJoin" runat="server" CssClass="btnSubmit" Text="עדיין לא רשום? הצטרף!" OnClick="btnJoin_Click" />
            <asp:Button ID="btnfree" runat="server" CssClass="btnSubmit" Text="לתוכן ללא הרשמה" OnClick="btnfree_Click" />
        </form>
    </div>
</body>
</html>

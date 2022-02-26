<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Questions.aspx.cs" Inherits="Questions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" Runat="Server">
	<h1>פרסום חידה</h1>
	<p>
		שלום, הגעתם לעמוד עם כל החידות, תוכלו ללכת לחידות שפורסמו ובנוסף, לפרסם חידה משלכם.
		<br />
		תהנו!
	</p>
	<h2>חידות שפורסמו</h2>
		<asp:Label ID="seeRiddles" runat="server" Visible="true" Text="רוצה לראות את החידות שפורסמו? התחבר" />
	<ul id="ulSubjects" runat="server" visible="false">
		
	</ul>
    <h2>חידה חדשה</h2>
	<asp:Panel runat="server" ID="PnlPostNewRiddle">
	<asp:Label runat="server" Text="כותרת:" /><br />
	<asp:TextBox ID="TxtTitle" runat="server" /><br />
	<asp:Label runat="server" Text="תוכן:" /><br />
	<asp:TextBox ID="TxtContent" TextMode="MultiLine" runat="server" /><br />
	<asp:Button runat="server" Text="פרסם חידה" OnClick="AddNewRiddle_Click" Visible="true" />
	<asp:Label runat="server" ID="SuccessfulRiddle" Text="החידה פורסמה בהצלחה!" Visible="false" />
	</asp:Panel>
	<asp:HyperLink ID="LnkLoginToPost" runat="server" Text="עליך להתחבר כדי לפרסם חידה" NavigateUrl="~/newlogin.aspx?returnURL=Riddles.aspx" />
</asp:Content>


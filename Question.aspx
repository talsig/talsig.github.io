<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Question.aspx.cs" Inherits="Question" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" Runat="Server">
	<article>
		<h3>
			<asp:Label runat="server" ID="Lbltitle" />
			<br />
		</h3>
		<p>
			<asp:Label runat="server" ID="LblContent" CssClass="questioncontent" />
		</p>
		<footer>
			פורסם על־ידי <asp:Label runat="server" ID="LblPostedBy" />
			ב־<asp:Label runat="server" ID="LblCreationTime" />
			
		</footer>
	</article>
	<h3>תגובות</h3>
	<asp:ListView ID="LVReplies" runat="server" OnItemCommand="LVReplies_ItemCommand">
		<ItemTemplate>
			<article>
				<p class="title" dir="rtl"> 	
					<%#: Eval("title") %>
				</p>
				<p>
					<%#: Eval("content") %>
				<footer>
					פורסם על־ידי <%#: Eval("username") %>
					ב־<%# Eval("creation_time") %>
					<br />
					<asp:LinkButton Text="מחק תגובה" runat="server" Visible="<%# IsAdmin %>"
					CommandName="DeleteReply" CommandArgument='<%# Eval("reply_id") %>' />
				</footer>
				</p>
			</article>
		</ItemTemplate>
		<EmptyDataTemplate>
			<p>עדיין אין תגובות.</p>
		</EmptyDataTemplate>
	</asp:ListView>
	<asp:Panel runat="server" ID="PnlPostNewReply">
				<asp:Label runat="server" Text="כותרת:" /><br />
				<asp:TextBox ID="TxtTitle" runat="server" /><br />
				<asp:Label runat="server" Text="תוכן:" /><br />
				<asp:TextBox ID="TxtContent" TextMode="MultiLine" runat="server" /><br />
				<asp:Button ID="replyadd" Text="להוספת תגובה לחץ כאן" runat="server" Visible="true" OnClick="replyadd_Click" />
			</asp:Panel>
</asp:Content>


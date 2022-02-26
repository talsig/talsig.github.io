<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ReadyRiddles.aspx.cs" Inherits="ReadyRiddles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" Runat="Server">
    <nav>
         <ul class="allriddles">
             <li>
                  <asp:LinkButton ID="Littlekids" Text="חידות לילדים קטנים" runat="server" CssClass="riddles-button" OnClick="Littlekids_Click" />
             </li>
             <li>
                 <asp:LinkButton ID="Middleschool" runat="server" Text="חידות לילדים בחטיבת ביניים" CssClass="riddles-button" OnClick="Middleschool_Click" />
             </li>
             <li>
                 <asp:LinkButton ID="Highschool" runat="server" Text="חידות לילדים בתיכון" CssClass="riddles-button" OnClick="Highschool_Click" />
             </li>
             <li>
                 <asp:LinkButton ID="Adualts" runat="server" Text="חידות לאנשים בוגרים" CssClass="riddles-button" OnClick="Adualts_Click" />
             </li>
         </ul>
    </nav> 
    <br />
    <p class="normal-text">
        שלום!
        <br />
        הגעתם לעמוד של חידות מוכנות מראש.
        <br />
        מעל הפסקה הזו תוכלו למצוא תפריט ניווט.
        <br />
        בתפריט הניווט תוכלו למצוא אפשרות ניווט למגוון עמודים:
        <br />
        -חידות לילדים קטנים
        <br />
        -חידות לילדים בחטיבת ביניים
        <br />
        -חידות לילדים בתיכון
        <br />
        -וחידות לאנשים מבוגרים
        <br />
        כל עמוד שונה בדרגת הקושי שלו, כשהחידות למבוגרים נחשבות להכי קשום וחידות לילדים קטנים הכי קלות
        <br />
        בהצלחה לכם, תהנו!
    </p>
</asp:Content>


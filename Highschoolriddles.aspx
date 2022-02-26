<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Highschoolriddles.aspx.cs" Inherits="Highschoolriddles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" Runat="Server">    
    <link href="Styles/flippingcard.css" rel="stylesheet" />
    <h1 class="normal-text">
        חידות לילדים בתיכון
    </h1>
    <p class="normal-text">
        שלום
        <br />
        הגעתם לעמוד לחידות לילדים בתיכון, בעמוד זה החידות כבר יהפכו לקשות ומאתגרות ויהיו לפי נושאים.  
        בהצלחה!
    </p> 
    <div class="scrollable">
        <h2>מתמטיקה</h2>
    <nav class ="navigation">
        <ul>
            <li>
                <div class="flip-card">
  <div class="flip-card-inner">
    <div class="flip-card-front">
        <br />
        <br />
        <br />
      <p>X^2 + 4X + 3 = 0
          <br />
          מצא את X
      </p>
    </div>
    <div class="flip-card-back">
        <br />
        <br />
        <br />
      <p>X1 = -1
          <br />
          x2 = -3
      </p>
    </div>
  </div>
</div>
            </li>
            <li>
                <div class="flip-card">
                <div class="flip-card-inner">
    <div class="flip-card-front">
        <br />
        <br />
        <br />
      <p>גזור את הפונקציה הבאה:
          <br />
          Y=x^6 + x^5 + 3x^4 + 12
      </p>
    </div>
    <div class="flip-card-back">
        <br />
        <br />
        <br />
        <br />
      <p>y' = 6x^5 + 5x^4 + 12x^3
      </p>
    </div>
  </div>
</div>
            </li>
            <li>
                <div class="flip-card">
                <div class="flip-card-inner">
    <div class="flip-card-front">
        <br />
        <br />
        <br />
      <p>עבור איזה X הפונקציה הבאה תתאפס?:
          <br />
          Y= 2X + 15 + X^2
      </p>
    </div>
    <div class="flip-card-back">
        <br />
        <br />
        <br />
        <br />
      <p>X = 3
      </p>
    </div>
  </div>
</div>
            </li>
            <li>
                <div class="flip-card">
                <div class="flip-card-inner">
    <div class="flip-card-front">
        <br />
        <br />
        <br />
      <p>מצא את הפונקציה אם זאת הנגזרת:
          <br />
          y' = 3X^2 + 12X + 12
      </p>
    </div>
    <div class="flip-card-back">
        <br />
        <br />
        <br />
        <br />
      <p>y = X^3 + 6X^2 + 12X + C
      </p>
    </div>
  </div>
</div>
            </li>
        </ul>
    </nav>
    <h2>מדעי המחשב</h2>
    <nav class="navigation">
        <ul>
            <li>
                <div class="flip-card">
                <div class="flip-card-inner">
    <div class="flip-card-front">
        <br />
        <br />
      <p>
          int b = 3
          <br />
          int c = b+2
          <br />
          int d = c
          <br />
          int a = d
          <br />
          מה יהיה הערך של a?
      </p>
    </div>
    <div class="flip-card-back">
        <br />
        <br />
        <br />
        <br />
      <p>
          5
      </p>
    </div>
  </div>
</div>
            </li>
            <li>
                <div class="flip-card">
                <div class="flip-card-inner">
    <div class="flip-card-front">
      <p>
          מה תחזיר הפעולה הבאה?
          <br />
          public static bool Found(int a, int b) <br />
{ <br />
a = 8 <br />
b = 4 <br />
if(a % b == 2) <br />
return true <br />
else <br />
return false 
}
      </p>
    </div>
    <div class="flip-card-back">
        <br />
        <br />
        <br />
        <br />
      <p>
          false כמובן, 8 % 4 זה אפס
      </p>
    </div>
  </div>
</div>
            </li>
            <li>
                <div class="flip-card">
                <div class="flip-card-inner">
    <div class="flip-card-front">
        <br />
        <br />
      <p>
          האם הקוד הבא תקין?
          <br />
int a = 0;
          <br />
int b = 5;
          <br />
a == b
          <br />
Console.WriteLine(a);
      </p>
    </div>
    <div class="flip-card-back">
        <br />
        <br />
        <br />
        <br />
      <p>
          לא, יש שני סימני שווה במקום אחד
      </p>
    </div>
  </div>
</div>
            </li>
        <li>
            <div class="flip-card">
                <div class="flip-card-inner">
    <div class="flip-card-front">
        <br />
        <br />
        <br />
      <p>
          מאיזה סוג הפעולה הבאה:
          <br />
          public static --- Name(ina a, int b)
          <br />
          return a/b
      </p>
    </div>
    <div class="flip-card-back">
        <br />
        <br />
      <p>
          יש שתי אופציות:
          <br />
          Int
          <br />
          Double
          <br />
          תלוי בערכים.
      </p>
    </div>
  </div>
</div>
        </li>
        </ul>
    </nav>
    <h2>כימיה</h2>
    <nav class="navigation">
        <ul>
            <li>
                <div class="flip-card">
                <div class="flip-card-inner">
    <div class="flip-card-front">
        <br />
        <br />
        <br />
      <p>
          מאיזה סוג יהיה החומר הבא:
          <br />
לא מוליך חשמל במצב מוצק אבל כן מוליך במצב נוזל
      </p>
    </div>
    <div class="flip-card-back">
        <br />
        <br />
        <br />
        <br />
      <p>
          יוני
      </p>
    </div>
  </div>
</div>
            </li>
            <li>
                <div class="flip-card">
                <div class="flip-card-inner">
    <div class="flip-card-front">
        <br />
        <br />
        <br />
      <p>
          מה יהיה החומר הבא (שם החומר)?
          <br />
          מוליך חשמל תמיד, לא מתכת, כמעט כמו יהלום אבל לא כמוהו בדיוק
      </p>
    </div>
    <div class="flip-card-back">
        <br />
        <br />
        <br />
        <br />
      <p>
          גרפיט
      </p>
    </div>
  </div>
</div>
            </li>
            <li>
                <div class="flip-card">
                <div class="flip-card-inner">
    <div class="flip-card-front">
        <br />
        <br />
        <br />
      <p>
          נסח תגובת המסה במים של החומר הבא:
          <br />
          NaI(S)
      </p>
    </div>
    <div class="flip-card-back">
        <br />
        <br />
        <br />
        <br />
      <p>
          Na+(aq) + I-(aq)
      </p>
    </div>
  </div>
</div>
            </li>
            <li>
                <div class="flip-card">
                <div class="flip-card-inner">
    <div class="flip-card-front">
        <br />
        <br />
        <br />
      <p>
          כאשר אני מגיב עם מים אני משחרר גז רעיל, אני בנוי מיסוד אחד ואני נמצא בטור הראשון, מי אני?
      </p>
    </div>
    <div class="flip-card-back">
        <br />
        <br />
        <br />
        <br />
      <p>
          Br
      </p>
    </div>
  </div>
</div>
            </li>
        </ul>
    </nav>
    <h2>אנגלית</h2>
    <nav class="navigation">
        <ul>
            <li>
                <div class="flip-card">
                <div class="flip-card-inner">
    <div class="flip-card-front">
        <br />
        <br />
        <br />
      <p>
         I speak without a mouth and hear without ears. I have no body, but I come alive with wind. What am I? 
      </p>
    </div>
    <div class="flip-card-back">
        <br />
        <br />
        <br />
        <br />
      <p>
          An echo
      </p>
    </div>
  </div>
</div>
            </li>
            <li>
                <div class="flip-card">
                <div class="flip-card-inner">
    <div class="flip-card-front">
        <br />
        <br />
        <br />
      <p>
          You measure my life in hours and I serve you by expiring. I'm quick when I'm thin and slow when I'm fat. The wind is my enemy.
      </p>
    </div>
    <div class="flip-card-back">
        <br />
        <br />
        <br />
        <br />
      <p>
          A candle
      </p>
    </div>
  </div>
</div>
            </li>
            <li>
                <div class="flip-card">
                <div class="flip-card-inner">
    <div class="flip-card-front">
        <br />
        <br />
        <br />
      <p>
          I have cities, but no houses. I have mountains, but no trees. I have water, but no fish. What am I?
      </p>
    </div>
    <div class="flip-card-back">
        <br />
        <br />
        <br />
        <br />
      <p>
          A map
      </p>
    </div>
  </div>
</div>
            </li>
            <li>
                <div class="flip-card">
                <div class="flip-card-inner">
    <div class="flip-card-front">
        <br />
        <br />
        <br />
      <p>
          What is seen in the middle of March and April that can't be seen at the beginning or end of either month?
      </p>
    </div>
    <div class="flip-card-back">
        <br />
        <br />
        <br />
        <br />
      <p>
          The letter "R."
      </p>
    </div>
  </div>
</div>
            </li>
            <li>
                <div class="flip-card">
                <div class="flip-card-inner">
    <div class="flip-card-front">
        <br />
        <br />
        <br />
      <p>
          You see a boat filled with people. It has not sunk, but when you look again you don't see a single person on the boat. Why?
      </p>
    </div>
    <div class="flip-card-back">
        <br />
        <br />
        <br />
        <br />
      <p>
          All the people were married.
      </p>
    </div>
  </div>
</div>
            </li>
        </ul>
    </nav>
        </div>
</asp:Content>


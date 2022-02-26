function arePasswordsEqual() {
	// פעולה הבודקת אם הסיסמאות זהות, מציגה הודעה אם לא
	// ומחזירה אמת אם כן ושקר אם לא
	var pass1 = document.querySelector("[id$=TxtPassword]");
	var pass2 = document.querySelector("[id$=TxtValidatePassword]");
	var error = document.querySelector("[id$=lblMessage]");
	if (pass1.value == pass2.value) {
		error.innerHTML = "";
		return true;
	} else {
		error.innerHTML = "הסיסמאות אינן תואמות";
		return false;
	}
}
function writeRandomQuote () {
	var quotes = new Array();
	quotes[0] = "Action is the real measure of intelligence.";
	quotes[1] = "Baseball has the great advantage over cricket of being sooner ended.";
	quotes[2] = "Every goal, every action, every thought, every feeling one experiences, whether it be consciously or unconsciously known, is an attempt to increase one's level of peace of mind.";
	quotes[3] = "A good head and a good heart are always a formidable combination.";
	quotes[4] = "When you love someone, tell them, no matter what happens";
	quotes[5] = "Stop saying, start acting!";
	var rand = Math.floor(Math.random()*quotes.length);
	return rand;
}


window.onload = function () {
	this.document.forms[0].onsubmit = arePasswordsEqual;
	this.document.all.onload = writeRandomQuote;
}
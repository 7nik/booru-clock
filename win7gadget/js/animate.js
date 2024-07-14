var gadget 		= ~navigator.userAgent.toLowerCase().indexOf('msie 7.0');
var oldhour     = 0;
var oldminute   = 0;
var oldseconds  = 0;
var serverdate  = 0;
var showSeconds = true;
var size		= 4;

function Changebacknumber(time, part, direction, updateTens) {
	if (updateTens){
		    $("#" + part + direction + "LeftBack").attr("src", direction + "/" + Math.floor(time / 10) + ".png");
		    $("#" + part + direction + "RightBack").attr("src", direction + "/" + (time % 10) + ".png");
	} else {
		    $("#" + part + direction + "RightBack").attr("src", direction + "/" + (time % 10) + ".png");
	}
}

function Changefrontnumber(time, part, direction, updateTens) {
	if (updateTens){
		    $("#" + part + direction + "Left").attr("src", direction + "/" + Math.floor(time / 10) + ".png");
		    $("#" + part + direction + "Right").attr("src", direction + "/" + (time % 10) + ".png");
	} else {
		    $("#" + part + direction + "Right").attr("src", direction + "/" + (time % 10) + ".png");
	}
}

function Animateclock(oldtime, time, part) {
	var tensChanged = Math.floor(time / 10) !== Math.floor(oldtime / 10);
	var currSize = 16 * size + "px";

	$("#" + part + "UpperLeft,#" + part + "UpperRight,#" + part + "LowerLeft,#" + part + "LowerRight,#" + part + "LLB,#" + part + "LRB").stop(true, true);
	if (tensChanged) {
		$("#" + part + "UpperLeft,#" + part + "LowerLeftBack").removeAttr("src").css("height", currSize);
		$("#" + part + "UpperLeft").attr("src", $("#" + part + "UpperLeftBack").attr("src"));  
		$("#" + part + "LowerLeftBack").attr("src", $("#" + part + "LowerLeft").attr("src"));
	}
	$("#" + part + "UpperRight,#" + part + "LowerRightBack").removeAttr("src").css("height", currSize)
	$("#" + part + "UpperRight").attr("src", $("#" + part + "UpperRightBack").attr("src"));
	$("#" + part + "LowerRightBack").attr("src", $("#" + part + "LowerRight").attr("src")); 
	Changebacknumber(time, part, "Upper", tensChanged);
	Changefrontnumber(time, part, "Lower", tensChanged);
	if (tensChanged) {
		$("#" + part + "LLB, #" + part + "LRB").css("height", currSize);
		$("#" + part + "ULB, #" + part + "URB, #" + part + "LowerLeft, #" + part + "LowerRight").css("height", "0px");
		$("#" + part + "ULB, #" + part + "URB").animate({height: currSize}, 250);
		$("#" + part + "UpperLeft, #" + part + "UpperRight").animate({height: "-=" + currSize}, 250, function(){
			$("#" + part + "LowerLeft, #" + part + "LowerRight").animate({height: currSize}, 200);
			$("#" + part + "LLB, #" + part + "LRB").animate({height: "0px"}, 200);
		});
	} else {
		$("#" + part + "LRB").css("height", currSize);
		$("#" + part + "URB, #" + part + "LowerRight").css("height", "0px");
		$("#" + part + "URB").animate({height: currSize}, 275);
		$("#" + part + "UpperRight").animate({height: "-=" + currSize}, 275, function(){
			$("#" + part + "LowerRight").animate({height: currSize}, 200);
			$("#" + part + "LRB").animate({height: "0px"}, 200);
		});
	}
}

function displaytime() {
	serverdate  = new Date();
	var hour    = serverdate.getHours();
	var minute  = serverdate.getMinutes();
	var seconds = serverdate.getSeconds();
	if (oldseconds != seconds) {
		if (showSeconds) {
			Animateclock(oldseconds, seconds, "Second");
		}
		oldseconds = seconds;
		if (oldminute != minute) {
			Animateclock(oldminute, minute, "Minute");
			oldminute = minute;
		}
		if (oldhour != hour) {
			Animateclock(oldhour, hour, "Hour");
			oldhour = hour;
		}
	}
}

function setSettings() {
	if (gadget) {
    showSeconds = (System.Gadget.Settings.readString("showSeconds") == "yes");
	size = eval(System.Gadget.Settings.readString("size"));
	}
	$(document.body).css({"width" : ((showSeconds ? 103 : 68) * size) + "px", "height" : (33 * size + 1) + "px"});
	$("#bg").attr("src",(showSeconds ? "back1.png" : "back2.png"));
	$("#bg").css({"width" : ((showSeconds ? 103 : 68) * size) + "px", "height" : (33 * size + 1) + "px"});
	$("#Hour, HourBack").css("left", "0px");
	$("#Minute, #MinuteBack").css("left", (36 * size - 1) + "px");
	$("#Second, #SecondBack").css("left", (71 * size - 1) + "px");
	$("#Hour, #Minute, #Second, #HourBack, #MinuteBack, #SecondBack").css({"width" : (32 * size) + "px", "height" : (32 * size) + "px"});
	$("#HourULB, #HourURB, #MinuteULB, #MinuteURB, #SecondULB, #SecondURB, #HourLLB, #HourLRB, #MinuteLLB, #MinuteLRB, #SecondLLB, #SecondLRB").css({"width" : (16 * size) + "px", "height" : (16 * size) + "px"});
	$("#HourUpperLeft, #HourUpperRight, #MinuteUpperLeft, #MinuteUpperRight, #SecondUpperLeft, #SecondUpperRight").css("bottom", (16 * size) + "px");
	$("#HourLowerLeft, #HourLowerRight, #MinuteLowerLeft, #MinuteLowerRight, #SecondLowerLeft, #SecondLowerRight").css("top", (16 * size) + "px");
	$(	"#HourUpperLeft, #HourUpperLeftBack, #HourLowerLeft, #HourLowerLeftBack, #MinuteUpperLeft, #MinuteUpperLeftBack, #MinuteLowerLeft, #MinuteLowerLeftBack," +
		"#SecondUpperLeft, #SecondUpperLeftBack, #SecondLowerLeft, #SecondLowerLeftBack, #HourUpperRight, #HourUpperRightBack,  #HourLowerRight, #HourLowerRightBack," +
		"#MinuteUpperRight, #MinuteUpperRightBack, #MinuteLowerRight, #MinuteLowerRightBack, #SecondUpperRight, #SecondUpperRightBack, #SecondLowerRight, #SecondLowerRightBack")
		.css({"width" : (16 * size) + "px", "height" : (16 * size) + "px"});
	$("#HourUpperLeft, #HourUpperRight, #HourLowerLeftBack, #HourLowerRightBack, #MinuteUpperLeft, #MinuteUpperRight, #MinuteLowerLeftBack, #MinuteLowerRightBack, #SecondUpperLeft, #SecondUpperRight, #SecondLowerLeftBack, #SecondLowerRightBack")
		.css("height","0px");
}

function onSettingsClosed(e) {
	if (e.closeAction == e.Action.commit) {
		setSettings();
    }
}

$(document).ready(function (){
	if (gadget) {
		System.Gadget.settingsUI = "settings.html";
		System.Gadget.onSettingsClosed = onSettingsClosed;
		if (System.Gadget.Settings.readString("showSeconds") == ""){
			System.Gadget.Settings.writeString("showSeconds", "yes");
			System.Gadget.Settings.writeString("size", "4");
		}
	}
	setSettings();
	serverdate = new Date();
	oldhour    = serverdate.getHours();
	oldminute  = serverdate.getMinutes();
	oldseconds = serverdate.getSeconds();
	Changebacknumber (oldhour, "Hour", "Upper", true);
	Changefrontnumber(oldhour, "Hour", "Lower", true);
	Changebacknumber (oldminute, "Minute", "Upper", true);
	Changefrontnumber(oldminute, "Minute", "Lower", true);
	Changebacknumber (oldseconds, "Second", "Upper", true);
	Changefrontnumber(oldseconds, "Second", "Lower", true);
	setInterval(displaytime, 300);
});

//      written by Tan Ling     Wee     on 2 Dec 2001
//      last updated 28 Jul 2003
//      email : fuushikaden@yahoo.com
//      website : www.pengz.com
//      TabSize: 4
//
//      modified by ALQUANTO 30 July 2003 - german language included.
//                                                                        - modified languageLogic with the ISO-2letter-strings
//                                                                        - changes in in showCalendar: defaultLanguage is already set...
//                                                                        - js and html corrected... more xhtml-compliant... simplier css
//      email: popcalendar@alquanto.de
//
//      modified by PinoToy 25 July 2003  - new logic for multiple languages (English, Spanish and ready for more).
//                                                                        - changes in popUpMonth & popDownMonth methods for hidding    popup.
//                                                                        - changes in popDownYear & popDownYear methods for hidding    popup.
//                                                                        - new logic for disabling dates in    the past.
//                                                                        - new method showCalendar, dynamic    configuration of language, enabling     past & position.
//                                                                        - changes in the styles.
//      email  : pinotoy@yahoo.com
var language = 'ru';    	// Default Language: en - english ; es - spanish; de - german
var enablePast = 1;             // 0 - disabled ; 1 - enabled
var fixedX = -1;                // x position (-1 if to appear below control)
var fixedY = -1;                // y position (-1 if to appear below control)
var startAt = 1;                // 0 - sunday ; 1 - monday
var showWeekNumber = 0; 	// 0 - don't show; 1 - show
var showToday = 0;              // 0 - don't show; 1 - show
var imgDir = "/js/popcalendar/calendar/";          // directory for images ... e.g. var imgDir="/img/"
var dayName = '';

var gotoString = {
	en : 'Go To Current Month',
	es : 'Ir al Mes Actual',
	de : 'Gehe zu aktuellem Monat',
	ru: '????????????????????? ??? ????????????????????? ???????????????'
};
var todayString = {
	en : 'Today is',
	es : 'Hoy es',
	de : 'Heute ist',
	ru : '??????????????'
};
var weekString = {
	en : 'Wk',
	ru : 'Wk',
	es : 'Sem',
	de : 'KW'
};
var scrollLeftMessage = {
	en : 'Click to scroll to previous month. Hold mouse button to scroll automatically.',
	ru : 'Click to scroll to previous month. Hold mouse button to scroll automatically.',
	es : 'Presione para pasar al mes anterior. Deje presionado para pasar varios meses.',
	de : 'Klicken um zum vorigen Monat zu gelangen. Gedrckt halten, um automatisch weiter zu scrollen.'
};
var scrollRightMessage = {
	en : 'Click to scroll to next month. Hold mouse button to scroll automatically.',
	ru : 'Click to scroll to next month. Hold mouse button to scroll automatically.',
	es : 'Presione para pasar al siguiente mes. Deje presionado para pasar varios meses.',
	de : 'Klicken um zum nchsten Monat zu gelangen. Gedrckt halten, um automatisch weiter zu scrollen.'
};
var selectMonthMessage = {
	en : 'Click to select a month.',
	ru : 'Click to select a month.',
	es : 'Presione para seleccionar un mes',
	de : 'Klicken um Monat auszuwhlen'
};
var selectYearMessage = {
	en : 'Click to select a year.',
	ru : 'Click to select a year.',
	es : 'Presione para seleccionar un ao',
	de : 'Klicken um Jahr auszuwhlen'
};
var selectDateMessage = {               // do not replace [date], it will be replaced by date.
	en : 'Select [date] as date.',
	ru : 'Select [date] as date.',
	es : 'Seleccione [date] como fecha',
	de : 'Whle [date] als Datum.'
};
var     monthName = {
	en : new Array('January','February','March','April','May','June','July','August','September','October','November','December'),
	ru : new Array('????????????','??????????????','????????','????????????','??????','????????','????????','????????????','????????????????','??????????????','????????????','??????????????'),
	es : new Array('Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'),
	de : new Array('Januar','Februar','Mrz','April','Mai','Juni','Juli','August','September','Oktober','November','Dezember')

};
var     monthName2 = {
	en : new Array('JAN','FEB','MAR','APR','MAY','JUN','JUL','AUG','SEP','OCT','NOV','DEC'),
	ru : new Array('??????','??????','????????','??????','??????','??????','??????','??????','??????','??????','??????','??????'),
	es : new Array('ENE','FEB','MAR','ABR','MAY','JUN','JUL','AGO','SEP','OCT','NOV','DIC'),
	de : new Array('JAN','FEB','MRZ','APR','MAI','JUN','JUL','AUG','SEP','OKT','NOV','DEZ')
};

if (startAt==0) {
	dayName = {
		en : new Array('Sun','Mon','Tue','Wed','Thu','Fri','Sat'),
		ru : new Array('????','????','????','????','????','????','????'),
		es : new Array('Dom','Lun','Mar','Mie','Jue','Vie','Sab'),
		de : new Array('So','Mo','Di','Mi','Do','Fr','Sa')
	};
} else {
	dayName = {
		en : new Array('Mon','Tue','Wed','Thu','Fri','Sat','Sun'),
		ru : new Array('????','????','????','????','????','????','????'),
		es : new Array('Lun','Mar','Mie','Jue','Vie','Sab','Dom'),
		de : new Array('Mo','Di','Mi','Do','Fr','Sa','So')
	};
}

var crossobj, crossMonthObj, crossYearObj, monthSelected, yearSelected, dateSelected, omonthSelected, oyearSelected, odateSelected, monthConstructed, yearConstructed, intervalID1, intervalID2, timeoutID1, timeoutID2, ctlToPlaceValue, ctlNow, dateFormat, nStartingYear, selDayAction, isPast;
var visYear  = 0;
var visMonth = 0;
var bPageLoaded = false;
var ie  = document.all;
var dom = document.getElementById;
var ns4 = document.layers;
var today    = new Date();
var dateNow  = today.getDate();
var monthNow = today.getMonth();
var yearNow  = today.getYear();
var imgsrc   = new Array('drop1.png','drop2.gif','left1.png','left2.gif','right1.png','right2.gif');
var img      = new Array();
var bShow    = false;

/* hides <select> and <applet> objects (for IE only) */
function hideElement( elmID, overDiv ) {
	if(ie) {
		for(i = 0; i < document.all.tags( elmID ).length; i++) {
			obj = document.all.tags( elmID )[i];
			if(!obj || !obj.offsetParent) continue;

			// Find the element's offsetTop and offsetLeft relative to the BODY tag.
			objLeft   = obj.offsetLeft;
			objTop    = obj.offsetTop;
			objParent = obj.offsetParent;

			while(objParent.tagName.toUpperCase() != 'BODY') {
				objLeft  += objParent.offsetLeft;
				objTop   += objParent.offsetTop;
				objParent = objParent.offsetParent;
			}

			objHeight = obj.offsetHeight;
			objWidth  = obj.offsetWidth;

			if((overDiv.offsetLeft + overDiv.offsetWidth) <= objLeft);
			else if((overDiv.offsetTop + overDiv.offsetHeight) <= objTop);
			/* CHANGE by Charlie Roche for nested TDs*/
			else if(overDiv.offsetTop >= (objTop + objHeight + obj.height));
			/* END CHANGE */
			else if(overDiv.offsetLeft >= (objLeft + objWidth));
			else {
				obj.style.visibility = 'hidden';
			}
		}
	}
}

/*
* unhides <select> and <applet> objects (for IE only)
*/
function showElement(elmID) {
	if(ie) {
		for(i = 0; i < document.all.tags( elmID ).length; i++) {
			obj = document.all.tags(elmID)[i];
			if(!obj || !obj.offsetParent) continue;
			obj.style.visibility = '';
		}
	}
}

function HolidayRec (d, m, y, desc) {
	this.d = d;
	this.m = m;
	this.y = y;
	this.desc = desc;
}

var HolidaysCounter = 0;
var Holidays = new Array();

function addHoliday (d, m, y, desc) {
	Holidays[HolidaysCounter++] = new HolidayRec (d, m, y, desc);
}

if (dom) {
	for     (i=0;i<imgsrc.length;i++) {
		img[i] = new Image;
		img[i].src = imgDir + imgsrc[i];
	}
	document.write ('<div onclick="bShow=true" id="calendar" style="z-index:+999;position:absolute;visibility:hidden;"><table width="'+((showWeekNumber==1)?250:220)+'" style="font-family:Arial;font-size:11px;border: 1px solid #d6d6d6; border-radius: 4px;" bgcolor="#ffffff"><tr><td><table width="'+((showWeekNumber==1)?248:218)+'"><tr><td style="padding:2px;font-family:Arial;font-size:11px; text-align: center;"><font color="#999999' + '' /*C9D3E9*/ +'"><b><span id="caption"></span></b></font></td><td align="right"><a href="javascript:hideCalendar()"><img src="'+imgDir+'close.png" width="13" height="13" border="0" /></a></td></tr></table></td></tr><tr><td style="padding:5px" bgcolor="#ffffff"><span id="content"></span></td></tr>');
	// document.write ('<div onclick="bShow=true" id="calendar" style="z-index:+999;position:absolute;visibility:hidden;"><table width="'+((showWeekNumber==1)?250:220)+'" style="font-family:Arial;font-size:11px;border: 1px solid #A0A0A0;" bgcolor="#ffffff"><tr bgcolor="#000066"><td><table width="'+((showWeekNumber==1)?248:218)+'"><tr><td style="padding:2px;font-family:Arial;font-size:11px;"><font color="#ffffff' + '' /*C9D3E9*/ +'"><b><span id="caption"></span></b></font></td><td align="right"><a href="javascript:hideCalendar()"><img src="../../../jscript/close.gif" width="15" height="13" border="0" /></a></td></tr></table></td></tr><tr><td style="padding:5px" bgcolor="#ffffff"><span id="content"></span></td></tr>');
	if (showToday == 1) {
		document.write ('<tr bgcolor="#f0f0f0"><td style="padding:5px" align="center"><span id="lblToday"></span></td></tr>');
	}

	document.write ('</table></div><div id="selectMonth" style="z-index:+999;position:absolute;visibility:hidden;"></div><div id="selectYear" style="z-index:+999;position:absolute;visibility:hidden;"></div>');
}

var     styleAnchor = 'text-decoration:none;color:black;';
var     styleLightBorder = 'border: 1px solid #2f86c2; border-radius: 4px;';

function swapImage(srcImg, destImg) {
	if (ie) document.getElementById(srcImg).setAttribute('src',imgDir + destImg);
}

function init() {
	if (!ns4)
	{
		if (!ie) yearNow += 1900;

		crossobj=(dom)?document.getElementById('calendar').style : ie? document.all.calendar : document.calendar;
		hideCalendar();

		crossMonthObj = (dom) ? document.getElementById('selectMonth').style : ie ? document.all.selectMonth : document.selectMonth;

		crossYearObj = (dom) ? document.getElementById('selectYear').style : ie ? document.all.selectYear : document.selectYear;

		monthConstructed = false;
		yearConstructed = false;

		if (showToday == 1) {
			document.getElementById('lblToday').innerHTML = '<font color="#000066">' + todayString[language] + ' <a onmousemove="window.status=\''+gotoString[language]+'\'" onmouseout="window.status=\'\'" title="'+gotoString[language]+'" style="'+styleAnchor+'" href="javascript:monthSelected=monthNow;yearSelected=yearNow;constructCalendar();">'+dayName[language][(today.getDay()-startAt==-1)?6:(today.getDay()-startAt)]+', ' + dateNow + ' ' + monthName[language][monthNow].substring(0,3) + ' ' + yearNow + '</a></font>';
		}

		sHTML1 = '<div style="float: left;"><span id="spanLeft" style="font-size: 13px; padding: 3px 0 0 0;cursor:pointer" onmouseover="swapImage(\'changeLeft\',\'left2.gif\');this.style.borderColor=\'#8af\';window.status=\''+scrollLeftMessage[language]+'\'" onclick="decMonth()" onmouseout="clearInterval(intervalID1);swapImage(\'changeLeft\',\'left1.png\');this.style.borderColor=\'#36f\';window.status=\'\'" onmousedown="clearTimeout(timeoutID1);timeoutID1=setTimeout(\'StartDecMonth()\',500)" onmouseup="clearTimeout(timeoutID1);clearInterval(intervalID1)">&nbsp<img id="changeLeft" src="'+imgDir+'left1.png" width="5" height="11" border="0">&nbsp</span>&nbsp;';
		sHTML1 += '<span id="spanMonth" style="font-size: 15px; padding: 3px 3px 2px 0; border-radius: 4px; border: 1px solid #2f86c2;cursor:pointer" onmouseover="swapImage(\'changeMonth\',\'drop2.gif\');this.style.borderColor=\'#8af\';window.status=\''+selectMonthMessage[language]+'\'" onmouseout="swapImage(\'changeMonth\',\'drop1.png\');this.style.borderColor=\'#2f86c2\';window.status=\'\'" onclick="popUpMonth()"></span></div>';
		sHTML1 += '<div style="float: right;"><span id="spanYear" style="font-size: 15px; padding: 3px 3px 2px 0; border-radius: 4px; border: 1px solid #2f86c2;;cursor:pointer" onmouseover="swapImage(\'changeYear\',\'drop2.gif\');this.style.borderColor=\'#8af\';window.status=\''+selectYearMessage[language]+'\'" onmouseout="swapImage(\'changeYear\',\'drop1.png\');this.style.borderColor=\'#2f86c2\';window.status=\'\'" onclick="popUpYear()"></span>&nbsp;';
		sHTML1 += '<span id="spanRight" style="font-size: 13px; padding: 3px 0 0 0;cursor:pointer" onmouseover="swapImage(\'changeRight\',\'right2.gif\');this.style.borderColor=\'#8af\';window.status=\''+scrollRightMessage[language]+'\'" onmouseout="clearInterval(intervalID1);swapImage(\'changeRight\',\'right1.png\');this.style.borderColor=\'#36f\';window.status=\'\'" onclick="incMonth()" onmousedown="clearTimeout(timeoutID1);timeoutID1=setTimeout(\'StartIncMonth()\',500)" onmouseup="clearTimeout(timeoutID1);clearInterval(intervalID1)">&nbsp<img id="changeRight" src="'+imgDir+'right1.png" width="5" height="11" border="0">&nbsp</span></div>';
		
		document.getElementById('caption').innerHTML = sHTML1;

		bPageLoaded=true;
	}
}

function hideCalendar() {
	if (crossobj != undefined) {
	crossobj.visibility = 'hidden';
	if (crossMonthObj != null) crossMonthObj.visibility = 'hidden';
	if (crossYearObj  != null) crossYearObj.visibility = 'hidden';
	showElement('SELECT');
	showElement('APPLET');
	}
}

function padZero(num) {
	return (num     < 10) ? '0' + num : num;
}

function constructDate(d,m,y) {
	sTmp = dateFormat;
	sTmp = sTmp.replace ('dd','<e>');
	sTmp = sTmp.replace ('d','<d>');
	sTmp = sTmp.replace ('<e>',padZero(d));
	sTmp = sTmp.replace ('<d>',d);
	sTmp = sTmp.replace ('mmmm','<p>');
	sTmp = sTmp.replace ('mmm','<o>');
	sTmp = sTmp.replace ('mm','<n>');
	sTmp = sTmp.replace ('m','<m>');
	sTmp = sTmp.replace ('<m>',m+1);
	sTmp = sTmp.replace ('<n>',padZero(m+1));
	sTmp = sTmp.replace ('<o>',monthName[language][m]);
	sTmp = sTmp.replace ('<p>',monthName2[language][m]);
	sTmp = sTmp.replace ('yyyy',y);
	return sTmp.replace ('yy',padZero(y%100));
}

function closeCalendar() {
	hideCalendar();
	ctlToPlaceValue.value = constructDate(dateSelected,monthSelected,yearSelected);

	var d = new Date(yearSelected, monthSelected, dateSelected);
	var addmon = 0;
	var addsun = 0;
	var addfri = 0;
	var day = d.getDay();
	if (day == 0)
	{
		addmon = 6;
		addfri = 2;
	}
	else
	{
		addmon = day - 1;
		addsun = 7 - day;
		addfri = day - 5;
	}

	var date = d.getDate();
	var month = d.getMonth()
	var year = d.getFullYear()

	var datemon = date - addmon;
	var datesun = date + addsun;
	var datefri = date - addfri;

	var my_datemon = new Date(year, month, datemon )
	var my_datesun = new Date(year, month, datesun )
	var my_datefri = new Date(year, month, datefri )

	dateSelectedmon = my_datemon.getDate();
	monthSelectedmon = my_datemon.getMonth();
	yearSelectedmon = my_datemon.getFullYear();

	dateSelectedsun = my_datesun.getDate();
	monthSelectedsun = my_datesun.getMonth();
	yearSelectedsun = my_datesun.getFullYear();

	dateSelectedfri = my_datefri.getDate();
	monthSelectedfri = my_datefri.getMonth();
	yearSelectedfri = my_datefri.getFullYear();

	//      document.mainform.datevaluemon.value = constructDate(dateSelectedmon,monthSelectedmon,yearSelectedmon);
	//      document.mainform.datevaluesun.value = constructDate(dateSelectedsun,monthSelectedsun,yearSelectedsun);
	//      document.mainform.datevaluefri.value = constructDate(dateSelectedfri,monthSelectedfri,yearSelectedfri);
}

/*** Month Pulldown     ***/
function StartDecMonth() {
	intervalID1 = setInterval("decMonth()",80);
}

function StartIncMonth() {
	intervalID1 = setInterval("incMonth()",80);
}

function incMonth () {
	monthSelected++;
	if (monthSelected > 11) {
		monthSelected = 0;
		yearSelected++;
	}
	constructCalendar();
}

function decMonth () {
	monthSelected--;
	if (monthSelected < 0) {
		monthSelected = 11;
		yearSelected--;
	}
	constructCalendar();
}

function constructMonth() {
	popDownYear()
	if (!monthConstructed) {
		sHTML = "";
		for (i=0; i<12; i++) {
			sName = monthName[language][i];
			if (i == monthSelected){
				sName = '<b>' + sName + '</b>';
			}
			sHTML += '<tr><td id="m' + i + '" onmouseover="this.style.backgroundColor=\'#909090\'" onmouseout="this.style.backgroundColor=\'\'" style="cursor:pointer" onclick="monthConstructed=false;monthSelected=' + i + ';constructCalendar();popDownMonth();event.cancelBubble=true"><font color="#000066">&nbsp;' + sName + '&nbsp;</font></td></tr>';
		}

		document.getElementById('selectMonth').innerHTML = '<table width="70" style="font-family:Arial;font-size:11px;border:1px solid #d6d6d6;" bgcolor="#f6f9fc" cellspacing="0" onmouseover="clearTimeout(timeoutID1)" onmouseout="clearTimeout(timeoutID1);timeoutID1=setTimeout(\'popDownMonth()\',100);event.cancelBubble=true">' + sHTML + '</table>';

		monthConstructed = true;
	}
}

function popUpMonth() {
	if (visMonth == 1) {
		popDownMonth();
		visMonth--;
	} else {
		constructMonth();
		crossMonthObj.visibility = (dom||ie) ? 'visible' : 'show';
		crossMonthObj.left = parseInt(crossobj.left) + 24 + 'px';
		crossMonthObj.top =     parseInt(crossobj.top) + 29 + 'px';
		hideElement('SELECT', document.getElementById('selectMonth'));
		hideElement('APPLET', document.getElementById('selectMonth'));
		visMonth++;
	}
}

function popDownMonth() {
	crossMonthObj.visibility = 'hidden';
	visMonth = 0;
}

/*** Year Pulldown ***/
function incYear() {
	for     (i=0; i<7; i++) {
		newYear = (i + nStartingYear) + 1;
		if (newYear == yearSelected)
		txtYear = '<span style="color:#006;font-weight:bold;">&nbsp;' + newYear + '&nbsp;</span>';
		else
		txtYear = '<span style="color:#006;">&nbsp;' + newYear + '&nbsp;</span>';
		document.getElementById('y'+i).innerHTML = txtYear;
	}
	nStartingYear++;
	bShow=true;
}

function decYear() {
	for     (i=0; i<7; i++) {
		newYear = (i + nStartingYear) - 1;
		if (newYear == yearSelected)
		txtYear = '<span style="color:#006;font-weight:bold">&nbsp;' + newYear + '&nbsp;</span>';
		else
		txtYear = '<span style="color:#006;">&nbsp;' + newYear + '&nbsp;</span>';
		document.getElementById('y'+i).innerHTML = txtYear;
	}
	nStartingYear--;
	bShow=true;
}

function selectYear(nYear) {
	yearSelected = parseInt(nYear + nStartingYear);
	yearConstructed = false;
	constructCalendar();
	popDownYear();
}

function constructYear() {
	popDownMonth();
	sHTML = '';
	if (!yearConstructed) {
		sHTML = '<tr><td align="center" onmouseover="this.style.backgroundColor=\'#909090\'" onmouseout="clearInterval(intervalID1);this.style.backgroundColor=\'\'" style="cursor:pointer" onmousedown="clearInterval(intervalID1);intervalID1=setInterval(\'decYear()\',30)" onmouseup="clearInterval(intervalID1)"><font color="#000066">-</font></td></tr>';

		j = 0;
		nStartingYear = yearSelected - 3;
		for ( i = (yearSelected-3); i <= (yearSelected+3); i++ ) {
			sName = i;
			if (i == yearSelected) sName = '<b>' + sName + '</b>';
			sHTML += '<tr><td id="y' + j + '" onmouseover="this.style.backgroundColor=\'#909090\'" onmouseout="this.style.backgroundColor=\'\'" style="cursor:pointer" onclick="selectYear('+j+');event.cancelBubble=true"><font color="#000066">&nbsp;' + sName + '&nbsp;</font></td></tr>';
			j++;
		}

		sHTML += '<tr><td align="center" onmouseover="this.style.backgroundColor=\'#909090\'" onmouseout="clearInterval(intervalID2);this.style.backgroundColor=\'\'" style="cursor:pointer" onmousedown="clearInterval(intervalID2);intervalID2=setInterval(\'incYear()\',30)" onmouseup="clearInterval(intervalID2)"><font color="#000066">+</font></td></tr>';

		document.getElementById('selectYear').innerHTML = '<table width="48" cellspacing="0" bgcolor="#f6f9fc" style="font-family:Arial;font-size:11px;border:1px solid #d6d6d6;" onmouseover="clearTimeout(timeoutID2)" onmouseout="clearTimeout(timeoutID2);timeoutID2=setTimeout(\'popDownYear()\',100)">' + sHTML + '</table>';

		yearConstructed = true;
	}
}

function popDownYear() {
	clearInterval(intervalID1);
	clearTimeout(timeoutID1);
	clearInterval(intervalID2);
	clearTimeout(timeoutID2);
	crossYearObj.visibility= 'hidden';
	visYear = 0;
}

function popUpYear() {
	var leftOffset
	if (visYear==1) {
		popDownYear();
		visYear--;
	} else {
		constructYear();
		crossYearObj.visibility = (dom||ie) ? 'visible' : 'show';
		leftOffset = parseInt(crossobj.left) + document.getElementById('spanYear').offsetLeft;
		if (ie) leftOffset += 6;
		crossYearObj.left = leftOffset + 10 + 'px';
		crossYearObj.top = parseInt(crossobj.top) + 29 + 'px';
		visYear++;
	}
}

/*** calendar ***/
function WeekNbr(n) {
	// Algorithm used:
	// From Klaus Tondering's Calendar document (The Authority/Guru)
	// http://www.tondering.dk/claus/calendar.html
	// a = (14-month) / 12
	// y = year + 4800 - a
	// m = month + 12a - 3
	// J = day + (153m + 2) / 5 + 365y + y / 4 - y / 100 + y / 400 - 32045
	// d4 = (J + 31741 - (J mod 7)) mod 146097 mod 36524 mod 1461
	// L = d4 / 1460
	// d1 = ((d4 - L) mod 365) + L
	// WeekNumber = d1 / 7 + 1
	year = n.getFullYear();
	month = n.getMonth() + 1;
	if (startAt == 0) {
		day = n.getDate() + 1;
	} else {
		day = n.getDate();
	}

	a = Math.floor((14-month) / 12);
	y = year + 4800 - a;
	m = month + 12 * a - 3;
	b = Math.floor(y/4) - Math.floor(y/100) + Math.floor(y/400);
	J = day + Math.floor((153 * m + 2) / 5) + 365 * y + b - 32045;
	d4 = (((J + 31741 - (J % 7)) % 146097) % 36524) % 1461;
	L = Math.floor(d4 / 1460);
	d1 = ((d4 - L) % 365) + L;
	week = Math.floor(d1/7) + 1;

	return week;
}

function constructCalendar () {
	var aNumDays = Array (31,0,31,30,31,30,31,31,30,31,30,31);
	var dateMessage;
	var startDate = new Date (yearSelected,monthSelected,1);
	var endDate;

	if (monthSelected==1) {
		endDate = new Date (yearSelected,monthSelected+1,1);
		endDate = new Date (endDate - (24*60*60*1000));
		numDaysInMonth = endDate.getDate();
	} else {
		numDaysInMonth = aNumDays[monthSelected];
	}

	datePointer = 0;
	dayPointer = startDate.getDay() - startAt;

	if (dayPointer<0) dayPointer = 6;

	sHTML = '<table border="0" style="font-family:verdana;font-size:10px;"><tr>';

	if (showWeekNumber == 1) {
		sHTML += '<td width="27"><b>' + weekString[language] + '</b></td><td width="1" rowspan="7" bgcolor="#d0d0d0" style="padding:0px"><img src="'+imgDir+'divider.gif" width="1"></td>';
	}

	for (i = 0; i<7; i++) {
		sHTML += '<td width="27" align="right"><b><font color="#666666">' + dayName[language][i] + '</font></b></td>';
	}

	sHTML += '</tr><tr>';

	if (showWeekNumber == 1) {
		sHTML += '<td align="right">' + WeekNbr(startDate) + '&nbsp;</td>';
	}

	for     ( var i=1; i<=dayPointer;i++ ) {
		sHTML += '<td>&nbsp;</td>';
	}

	for     ( datePointer=1; datePointer <= numDaysInMonth; datePointer++ ) {
		dayPointer++;
		sHTML += '<td align="right">';
		sStyle=styleAnchor;
		if ((datePointer == odateSelected) && (monthSelected == omonthSelected) && (yearSelected == oyearSelected))
		{ sStyle+=styleLightBorder }

		sHint = '';
		for (k = 0;k < HolidaysCounter; k++) {
			if ((parseInt(Holidays[k].d) == datePointer)&&(parseInt(Holidays[k].m) == (monthSelected+1))) {
				if ((parseInt(Holidays[k].y)==0)||((parseInt(Holidays[k].y)==yearSelected)&&(parseInt(Holidays[k].y)!=0))) {
					sStyle+= 'background-color:#fdd;';
					sHint += sHint=="" ? Holidays[k].desc : "\n"+Holidays[k].desc;
				}
			}
		}

		sHint = sHint.replace('/\"/g', '&quot;');

		dateMessage = 'onmousemove="window.status=\''+selectDateMessage[language].replace('[date]',constructDate(datePointer,monthSelected,yearSelected))+'\'" onmouseout="window.status=\'\'" ';


		//////////////////////////////////////////////
		//////////  Modifications PinoToy  //////////
		//////////////////////////////////////////////
		if (enablePast == 0 && ((yearSelected < yearNow) || (monthSelected < monthNow) && (yearSelected == yearNow) || (datePointer < dateNow) && (monthSelected == monthNow) && (yearSelected == yearNow))) {
			selDayAction = '';
			isPast = 1;
		} else {
			selDayAction = 'href="javascript:dateSelected=' + datePointer + ';closeCalendar();"';
			isPast = 0;
		}

		if ((datePointer == dateNow) && (monthSelected == monthNow) && (yearSelected == yearNow)) {     ///// today
			sHTML += "<b><a "+dateMessage+" title=\"" + sHint + "\" style='"+sStyle+"' "+selDayAction+"><font color=#ff0000>&nbsp;" + datePointer + "</font>&nbsp;</a></b>";
		} else if (dayPointer % 7 == (startAt * -1)+1) {                                                                        ///// SI ES DOMINGO
			if (isPast==1)
			sHTML += "<a "+dateMessage+" title=\"" + sHint + "\" style='"+sStyle+"' "+selDayAction+">&nbsp;<font color=#909090>" + datePointer + "</font>&nbsp;</a>";
			else
			sHTML += "<a "+dateMessage+" title=\"" + sHint + "\" style='"+sStyle+"' "+selDayAction+">&nbsp;<font color=#999999>" + datePointer + "</font>&nbsp;</a>";
		} else if ((dayPointer % 7 == (startAt * -1)+7 && startAt==1) || (dayPointer % 7 == startAt && startAt==0)) {   ///// SI ES SABADO
			if (isPast==1)
			sHTML += "<a "+dateMessage+" title=\"" + sHint + "\" style='"+sStyle+"' "+selDayAction+">&nbsp;<font color=#909090>" + datePointer + "</font>&nbsp;</a>";
			else
			sHTML += "<a "+dateMessage+" title=\"" + sHint + "\" style='"+sStyle+"' "+selDayAction+">&nbsp;<font color=#999999>" + datePointer + "</font>&nbsp;</a>";
		} else {                                                                                                                                                        ///// CUALQUIER OTRO DIA
			if (isPast==1)
			sHTML += "<a "+dateMessage+" title=\"" + sHint + "\" style='"+sStyle+"' "+selDayAction+">&nbsp;<font color=#909090>" + datePointer + "</font>&nbsp;</a>";
			else
			sHTML += "<a "+dateMessage+" title=\"" + sHint + "\" style='"+sStyle+"' "+selDayAction+">&nbsp;<font color=#2f86c2>" + datePointer + "</font>&nbsp;</a>";
		}

		sHTML += '';
		if ((dayPointer+startAt) % 7 == startAt) {
			sHTML += '</tr><tr>';
			if ((showWeekNumber == 1) && (datePointer < numDaysInMonth)) {
				sHTML += '<td align="right">' + (WeekNbr(new Date(yearSelected,monthSelected,datePointer+1))) + '&nbsp;</td>';
			}
		}
	}

	document.getElementById('content').innerHTML   = sHTML
	document.getElementById('spanMonth').innerHTML = '&nbsp;' +     monthName[language][monthSelected] + '&nbsp;<img id="changeMonth" src="'+imgDir+'drop1.png" width="12" height="7" border="0">'
	document.getElementById('spanYear').innerHTML  = '&nbsp;' + yearSelected        + '&nbsp;<img id="changeYear" src="'+imgDir+'drop1.png" width="12" height="7" border="0">';
}

function showCalendar(ctl, ctl2, format, lang, past, fx, fy) {
	if (lang != null && lang != '') language = lang;
	if (past != null) enablePast = past;
	else enablePast = 0;
	if (fx != null) fixedX = fx;
	else fixedX = -1;
	if (fy != null) fixedY = fy;
	else fixedY = -1;

	if (showToday == 1) {
		document.getElementById('lblToday').innerHTML = '<font color="#000066">' + todayString[language] + ' <a onmousemove="window.status=\''+gotoString[language]+'\'" onmouseout="window.status=\'\'" title="'+gotoString[language]+'" style="'+styleAnchor+'" href="javascript:monthSelected=monthNow;yearSelected=yearNow;constructCalendar();">'+dayName[language][(today.getDay()-startAt==-1)?6:(today.getDay()-startAt)]+', ' + dateNow + ' ' + monthName[language][monthNow].substring(0,3) + ' ' + yearNow + '</a></font>';
	}
	popUpCalendar(ctl, ctl2, format);
}

function popUpCalendar(ctl, ctl2, format, lang) {
	var leftpos = 0;
	var toppos  = 0;
	if (lang != null && lang != '') language = lang;

	if (bPageLoaded) {

		if (crossobj.visibility == 'hidden') {
			ctlToPlaceValue = ctl2;
			dateFormat = format;
			formatChar = ' ';
			aFormat = dateFormat.split(formatChar);
			if (aFormat.length < 3) {
				formatChar = '/';
				aFormat = dateFormat.split(formatChar);
				if (aFormat.length < 3) {
					formatChar = '.';
					aFormat = dateFormat.split(formatChar);
					if (aFormat.length < 3) {
						formatChar = '-';
						aFormat = dateFormat.split(formatChar);
						if (aFormat.length < 3) {
							formatChar = '';                                        // invalid date format
						}
					}
				}
			}

			tokensChanged = 0;
			if (formatChar != "") {
				aData = ctl2.value.split(formatChar);                   // use user's date
				for (i=0; i<3; i++) {
					if ((aFormat[i] == "d") || (aFormat[i] == "dd")) {
						dateSelected = parseInt(aData[i], 10);
						tokensChanged++;
					} else if ((aFormat[i] == "m") || (aFormat[i] == "mm")) {
						monthSelected = parseInt(aData[i], 10) - 1;
						tokensChanged++;
					} else if (aFormat[i] == "yyyy") {
						yearSelected = parseInt(aData[i], 10);
						tokensChanged++;
					} else if (aFormat[i] == "mmm") {
						for (j=0; j<12; j++) {
							if (aData[i] == monthName[language][j]) {
								monthSelected=j;
								tokensChanged++;
							}
						}
					} else if (aFormat[i] == "mmmm") {
						for (j=0; j<12; j++) {
							if (aData[i] == monthName2[language][j]) {
								monthSelected = j;
								tokensChanged++;
							}
						}
					}
				}
			}

			if ((tokensChanged != 3) || isNaN(dateSelected) || isNaN(monthSelected) || isNaN(yearSelected)) {
				dateSelected  = dateNow;
				monthSelected = monthNow;
				yearSelected  = yearNow;
			}

			odateSelected  = dateSelected;
			omonthSelected = monthSelected;
			oyearSelected  = yearSelected;

			aTag = ctl;
			do {
				aTag     = aTag.offsetParent;
				if(aTag != null) {
				    leftpos += aTag.offsetLeft;
				    toppos  += aTag.offsetTop;
				}
			} while (aTag != null && aTag.tagName != 'BODY');
			//			crossobj.left = (fixedX == -1) ? ctl.offsetLeft + leftpos + ctl.offsetWidth + 2: fixedX;
			//			crossobj.top = (fixedY == -1) ? ctl.offsetTop + toppos + ctl.offsetHeight + 2 : fixedY;
			crossobj.left = (fixedX == -1) ? ctl.offsetLeft + leftpos + ctl.offsetWidth - 100 + 'px': fixedX;
			crossobj.top = (fixedY == -1) ? ctl.offsetTop + toppos + ctl.offsetHeight + 2 + 'px': fixedY;

			constructCalendar (1, monthSelected, yearSelected);
			crossobj.visibility = (dom||ie) ? "visible" : "show";

			//commented becasue of fixind bug for IE
			//hideElement('SELECT', document.getElementById('calendar'));
			hideElement('APPLET', document.getElementById('calendar'));

			bShow = true;
		} else {
			hideCalendar();
			if (ctlNow!=ctl) popUpCalendar(ctl, ctl2, format, language);
		}
		ctlNow = ctl;
	}
}

document.onkeypress = function hidecal1 () {
	//if (event.keyCode == 27) hideCalendar();//error for FF
}
document.onclick = function hidecal2 () {
	if (!bShow) hideCalendar();
	bShow = false;
}

if(ie) {
	init();
} else {
	window.onload = init;
}
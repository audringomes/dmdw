/*! Help & Manual WebHelp 3 Script functions
Copyright (c) 2015-2018 by Tim Green. All rights reserved. Contact tg@it-authoring.com
*/
hmWebHelp.funcs.tapImage=function(c){var h=new Date().getTime();var f,b;function i(j){document.querySelector('meta[name="viewport"]').content="user-scalable=yes, initial-scale=1.0, maximum-scale=5.0, minimum-scale=0.5, width=device-width";b=$("div#hmpagebody_scroller").scrollTop();hmWebHelp.funcs.doPagePos.getPos();f=0;$("div#tapImageWrapper").fadeIn(j,function(){});$("div#pagewrapper").fadeOut(j)}function e(j){document.querySelector('meta[name="viewport"]').content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimum-scale=1";$("div#pagewrapper").fadeIn(j,function(){hmWebHelp.funcs.doPagePos.setPos()});$("div#tapImageWrapper").fadeOut(j)}function a(){var j=new Date().getTime();var k=j-h;if(k>120&&k<500){e(300)}h=j}var d=$("div#tapImageWrapper");if(d.length>0){$("img#tapImage").attr("src",$(c).attr("src")).attr("width",$(c).attr("width"));i(300)}else{var g='<div id="tapImageWrapper" style="position: absolute; top: 0; left: 0; background-color: #ffffff; z-index: 10000"><img src="./images/ZoomClose.png" id="closeTapImage" width="32" height="32" border="0" style="position: absolute; top: 5px; left: 5px;" /><img id="tapImage" src="'+$(c).attr("src")+'" width="'+$(c).attr("width")+'" height="auto" style="max-width: 100%" /></div>';$("body").append(g);i(300);$("img#closeTapImage").on(hmBrowser.touchstart,function(k){var j=k.originalEvent;e(300)});$("div#tapImageWrapper").on(hmBrowser.touchstart,function(k){var j=k.originalEvent;a(j)})}};

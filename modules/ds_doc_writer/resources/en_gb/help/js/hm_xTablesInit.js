/*! Help & Manual WebHelp 3 Script functions
Copyright (c) 2015-2018 by Tim Green. All rights reserved. Contact tg@it-authoring.com
*/
function xTableConstructor(p){var g=p.attr("id"),d=parseFloat($("body").css("font-size")),z=c(p.parent("div").attr("style")),j=false,n=20,s=$(p.find("tr")[0]).children("th").length,m=$(window).width(),l=$(window).width(),v=false,i=0,h,a="Hide row data display",e="Show hidden row data";function c(G){var H=0,C="",F=/width:\s{0,2}(\d+?)(px|em)/i,E=F.exec(G),D=0;if(E!==null){H=E[1];C=E[2];if(C=="rem"){D=parseInt(H,10)}else{D=Math.round(parseInt(H,10)/d)}}return D}function t(I){var F=$(p.find("tr")[0]).children("th:visible"),D=F.length,G=Math.round(($(window).width()/d)),H=0;for(var C=0;C<D;C++){var E=c($(F[C]).attr("style"));if(E===0){E=Math.round($(F[C]).width()/d);if(I){E=E>=n?E-8:E}else{E=E>=n?E:n}}H+=E}return(G-H)}function u(){var E=$(p.find("tr")[0]).children("th:visible");var D=E.length;var C=0;E.each(function(){C+=$(this).width()});C=Math.round(C/d);return C}function B(){var C=$(p.find("tr")[0]).children("th:visible");return C.length}function b(){var F=B(),G=s-F,E=$("tr."+g+".datarows"),D=$("div."+g+".xtable_dataiconwrapper");E.children("td:first-child").attr("colspan",F);if(F==s){E.hide();D.hide()}else{D.show();for(x=s;x>1&&x>s-G;x--){$("div."+g+".xtable_datablock.column"+x).show()}for(x=2;x<=F;x++){$("div."+g+".xtable_datablock.column"+x).hide()}var C=$("img[id^='"+g+"_'][src='images/close_data\\.png']").parents("tr:first-of-type").next("tr");if(C.length>0&&$(C[0]).is(":hidden")){C.show()}}}function y(D){l=$(window).width();v=m<l;m=l;var C=B();if(!v){while((t(v)<-8)&&(C>1)){C=B();p.find("th:nth-child("+C+"),td:nth-child("+C+")").hide()}}else{if(C<s){while(t(v)>8&&C+1<=s){C=B();p.find("th:nth-child("+(C+1)+"),td:nth-child("+(C+1)+")").show()}}}b()}$(window).on(hmBrowser.orientationevent+".xTables",function(){if(hmBrowser.orientationevent=="orientationchange"){setTimeout(function(){if(z>0&&Math.round($(window).width()/d)>z){return}y(false)},300)}else{i++;if(i<10){return}i=0;if(z>0&&Math.round($(window).width()/d)>z){return}y(false)}});if(!j&&(z===0||(z>0&&Math.round($(window).width()/d)>z))){y(true)}var f=p.find("td,th"),k=p.find("tbody tr"),w,o,A=1,r=1,q=1;f.each(function(){var C=$(this),D=C.index();if(D+1>r){f.filter(":nth-child("+(D+1)+")").addClass("data")}if(D==A){f.filter("td:nth-child("+(D)+")").addClass("switch")}});w=p.find("td.switch");o=p.find("th.data");k.each(function(){$(this).attr("id",g+"_row"+(q++));$(this).addClass("dataoff")});w.each(function(){var E=$(this).parent().attr("id")+"_icon",C=$(this).html(),D=$(this);$(this).html("<div class='"+g+" xtable_dataiconwrapper'><img class='xtable_dataicon' id=\""+E+'"src="images/open_data.png" title="'+e+"\"/></div><div class='xtable_switchwrapper'>"+C+"</div>");$("img#"+E).on("click",function(F){hmWebHelp.funcs.xTables[g](F,D)})});o.each(function(){if(typeof h=="undefined"){h=[]}h.push($(this).text())});if(s==B()&&!j){$("div."+g+".xtable_dataiconwrapper").hide()}j=true;return function(D,C){C.parent("tr").toggleClass("dataon dataoff");var F=C.siblings(),G="",M=C.parent("tr"),E=M.attr("id"),I=E+"_data",O=E+"_div",N=E+"_icon",K=C.attr("style"),H=0,J=0,L="xtable_datatitle";if($("tr#"+I).length===0){J=0;F.each(function(){G+="<div class='"+g+" xtable_datablock column"+($(this).index()+1)+"'><p class='xtable_datatitle'>"+h[J]+":</p>"+$(this).html()+"</div>\r\n";J++});H=B();G='<tr id="'+I+'" class="'+g+' datarows"><td style="'+K+'" colspan="'+H+'"><div id="'+O+'">'+G+"</div></td></tr>";M.after(G)}b();if(C.parent("tr").hasClass("dataon")&&B()<s){$("div#"+O).hide();$("tr#"+I).show();$("div#"+O).slideDown("fast",function(){$("img#"+N).attr("src","images/close_data.png").attr("title",a)})}else{if(C.parent("tr").hasClass("dataoff")||B()==s){$("div#"+O).slideUp("fast",function(){$("tr#"+I).hide();$("img#"+N).attr("src","images/open_data.png").attr("title",e)})}}}}hmWebHelp.funcs.hm_xTablesInit=function(b){var a=0;hmWebHelp.funcs.xTables={};if(b.length>0){b.each(function(){$(this).attr("id","xtable"+a);hmWebHelp.funcs.xTables[$(this).attr("id")]=new xTableConstructor($(this));a++})}};

/* Functions to enable passing alternative ContextID syntax 
   ?cshid=<number> or #cshid=<number> to the H&M Webhelp
   Copyright (c) 2021 Realworld Software Products */
    
function RWSP_DoHandleHash() {
    if ((typeof RWSP_HandleCSHID) == typeof(true)) {
        var hashParams = {};
        var e,
        a = /\+/g,
        r = /([^&;=]+)=?([^&;]*)/g,
        d = function (s) {
            return decodeURIComponent(s.replace(a, " "));
        },
        q = window.location.hash.substring(1);
        while (e = r.exec(q))
            hashParams[d(e[1])] = d(e[2]);

        var CSHIDParam = hashParams['cshid'];
        if (CSHIDParam !== undefined) {
            RWSP_DoGetTopicFromId(CSHIDParam)
        }
    }
}

function RWSP_DoHandleParam() {
    if ((typeof RWSP_HandleCSHID) == typeof(true)) {
        var URLArray = RWSP_URLToArray(window.location.href);
        var CSHIDParam = URLArray["cshid"];
        if (CSHIDParam !== undefined) {
            RWSP_DoGetTopicFromId(CSHIDParam)
        }
    }
}

function RWSP_URLToArray(url) {
    var request = {};
    var pairs = url.substring(url.indexOf('?') + 1).split('&');
    for (var i = 0; i < pairs.length; i++) {
        if (!pairs[i])
            continue;
        var pair = pairs[i].split('=');
        request[decodeURIComponent(pair[0])] = decodeURIComponent(pair[1]);
    }
    return request;
}

function RWSP_DoGetTopicFromId(TopicID) {
    if (hmContextIds == undefined) {
        console.log('No contextID definitions available');
        return;
    }
    var MatchedTopic = hmContextIds[TopicID];
    if (MatchedTopic !== undefined) {
        if (MatchedTopic == RWSP_DefaultTopic + RWSP_Extension) {
            MatchedTopic = RWSP_Mainpage;
        }
        RWSP_NewUrl(MatchedTopic);
    }
}

function RWSP_NewUrl(CidTopic) {
    var location = document.location;
    var pathname = location.pathname;
    var protocol = location.protocol;
    var pathnameTrimmed = pathname.substr(0, pathname.lastIndexOf('/') + 1);
    var newUrl;
    if (CidTopic == RWSP_Mainpage) {
        newUrl = encodeURI(protocol + location.hostname + pathnameTrimmed + RWSP_Mainpage);
    } else {
        newUrl = encodeURI(protocol + '//' + location.hostname + pathnameTrimmed + RWSP_Mainpage + '#' + CidTopic);
    }
    document.location.href = newUrl;
}

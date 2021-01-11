hmLoadTopic({
hmKeywords:"mozilla-public-license-version-2.0",
hmTitle:"XSLT Processing",
hmDescription:"For the XSLT it is recommended to use the Saxon processor for the translation. It is fast, reliable, and informative regarding any kind of error in the stylesheet. See...",
hmPrevLink:"dmdw_custom_xsl.html",
hmNextLink:"dmdw_html-output.html",
hmParentLink:"index.html",
hmBreadCrumbs:"",
hmTitlePath:"XSLT Processing",
hmHeader:"",
hmBody:"<p class=\"p_Normal\">For the XSLT it is recommended to use the Saxon processor for the translation. It is fast, reliable, and informative regarding any kind of error in the stylesheet. See <a href=\"http:\/\/www.saxonica.com\" target=\"_blank\" class=\"weblink\">http:\/\/www.saxonica.com<\/a>.<\/p>\n\r<p class=\"p_Normal\">The HE Edition is open source, under the <a href=\"https:\/\/www.mozilla.org\/en-US\/MPL\/2.0\/\" target=\"_blank\" class=\"weblink\">mozilla-public-license-version-2.0<\/a> .<\/p>\n\r<p class=\"p_Normal\">&nbsp;<\/p>\n\r<p class=\"p_Normal\">If you installed the java version of the processor, the following batch file can be used to execute the transform.<\/p>\n\r<p class=\"p_CodeExample\"><span class=\"f_CodeExample\">&nbsp;<\/span><br \/>\n\r<span class=\"f_CodeExample\" style=\"font-size: 0.73rem; color: #000000;\">@<\/span><span class=\"f_CodeExample\" style=\"font-size: 0.73rem; font-weight: bold; color: #000000;\">ECHO<\/span><span class=\"f_CodeExample\" style=\"font-size: 0.73rem; color: #000000;\"> <\/span><span class=\"f_CodeExample\" style=\"font-size: 0.73rem; font-weight: bold; color: #000000;\">OFF<\/span><br \/>\n\r<span class=\"f_CodeExample\" style=\"font-size: 0.73rem; font-style: italic; color: #000080;\">REM %1 Input file (xml)<\/span><br \/>\n\r<span class=\"f_CodeExample\" style=\"font-size: 0.73rem; font-style: italic; color: #000080;\">REM %2 XSL Stylesheet (xls)<\/span><br \/>\n\r<span class=\"f_CodeExample\" style=\"font-size: 0.73rem; font-style: italic; color: #000080;\">REM %3 Outputfile (html)<\/span><br \/>\n\r<span class=\"f_CodeExample\" style=\"font-size: 0.73rem; font-weight: bold; color: #000000;\">SET<\/span><span class=\"f_CodeExample\" style=\"font-size: 0.73rem; color: #000000;\"> XSLT_PROCESSOR=<\/span><span class=\"f_CodeExample\" style=\"font-size: 0.73rem;\">%<\/span><span class=\"f_CodeExample\" style=\"font-size: 0.73rem; color: #000000;\">~dp0saxon-he-<\/span><span class=\"f_CodeExample\" style=\"font-size: 0.73rem; color: #0000ff;\">10.2.<\/span><span class=\"f_CodeExample\" style=\"font-size: 0.73rem; color: #000000;\">jar<\/span><br \/>\n\r<span class=\"f_CodeExample\" style=\"font-size: 0.73rem; color: #000000;\">pushd <\/span><span class=\"f_CodeExample\" style=\"font-size: 0.73rem;\">%<\/span><span class=\"f_CodeExample\" style=\"font-size: 0.73rem; color: #000000;\">~dp0<\/span><br \/>\n\r<span class=\"f_CodeExample\" style=\"font-size: 0.73rem; font-weight: bold; color: #000000;\">ECHO<\/span><span class=\"f_CodeExample\" style=\"font-size: 0.73rem; color: #000000;\"> Source: <\/span><span class=\"f_CodeExample\" style=\"font-size: 0.73rem;\">%<\/span><span class=\"f_CodeExample\" style=\"font-size: 0.73rem; color: #000000;\">~dp0..\\data\\<\/span><span class=\"f_CodeExample\" style=\"font-size: 0.73rem;\">%1<\/span><br \/>\n\r<span class=\"f_CodeExample\" style=\"font-size: 0.73rem; font-weight: bold; color: #000000;\">ECHO<\/span><span class=\"f_CodeExample\" style=\"font-size: 0.73rem; color: #000000;\"> Xsl: &nbsp;  <\/span><span class=\"f_CodeExample\" style=\"font-size: 0.73rem;\">%<\/span><span class=\"f_CodeExample\" style=\"font-size: 0.73rem; color: #000000;\">~dp0..\\xsl\\<\/span><span class=\"f_CodeExample\" style=\"font-size: 0.73rem;\">%2<\/span><br \/>\n\r<span class=\"f_CodeExample\" style=\"font-size: 0.73rem; font-weight: bold; color: #000000;\">ECHO<\/span><span class=\"f_CodeExample\" style=\"font-size: 0.73rem; color: #000000;\"> Html: &nbsp; <\/span><span class=\"f_CodeExample\" style=\"font-size: 0.73rem;\">%<\/span><span class=\"f_CodeExample\" style=\"font-size: 0.73rem; color: #000000;\">~dp0..\\html\\<\/span><span class=\"f_CodeExample\" style=\"font-size: 0.73rem;\">%3<\/span><br \/>\n\r<span class=\"f_CodeExample\" style=\"font-size: 0.73rem; font-style: italic; color: #000080;\">REM<\/span><br \/>\n\r<span class=\"f_CodeExample\" style=\"font-size: 0.73rem; font-style: italic; color: #000080;\">REM Run an installed version:<\/span><br \/>\n\r<span class=\"f_CodeExample\" style=\"font-size: 0.73rem; font-style: italic; color: #000080;\">REM<\/span><br \/>\n\r<span class=\"f_CodeExample\" style=\"font-size: 0.73rem; font-style: italic; color: #000080;\">REM &quot;C:\\Program Files\\Saxonica\\SaxonHE10.2N\\bin\\Transform.exe&quot; -s:%~dp0..\\data\\%1 -xsl:%~dp0..\\xsl\\%2 -o:%~dp0..\\html\\%3<\/span><br \/>\n\r<span class=\"f_CodeExample\" style=\"font-size: 0.73rem; font-style: italic; color: #000080;\">REM<\/span><br \/>\n\r<span class=\"f_CodeExample\" style=\"font-size: 0.73rem; font-style: italic; color: #000080;\">REM Run the Java version in the module:<\/span><br \/>\n\r<span class=\"f_CodeExample\" style=\"font-size: 0.73rem; font-style: italic; color: #000080;\">REM<\/span><br \/>\n\r<span class=\"f_CodeExample\" style=\"font-size: 0.73rem; color: #000000;\">&quot;<\/span><span class=\"f_CodeExample\" style=\"font-size: 0.73rem;\">%JAVA_HOME%<\/span><span class=\"f_CodeExample\" style=\"font-size: 0.73rem; color: #000000;\">&quot;\\bin\\java.exe -cp <\/span><span class=\"f_CodeExample\" style=\"font-size: 0.73rem;\">%XSLT_PROCESSOR%<\/span><span class=\"f_CodeExample\" style=\"font-size: 0.73rem; color: #000000;\"> net.sf.saxon.Transform -s:<\/span><span class=\"f_CodeExample\" style=\"font-size: 0.73rem;\">%<\/span><span class=\"f_CodeExample\" style=\"font-size: 0.73rem; color: #000000;\">~dp0..\\data\\<\/span><span class=\"f_CodeExample\" style=\"font-size: 0.73rem;\">%1<\/span><span class=\"f_CodeExample\" style=\"font-size: 0.73rem; color: #000000;\"> -xsl:<\/span><span class=\"f_CodeExample\" style=\"font-size: 0.73rem;\">%<\/span><span class=\"f_CodeExample\" style=\"font-size: 0.73rem; color: #000000;\">~dp0..\\xsl\\<\/span><span class=\"f_CodeExample\" style=\"font-size: 0.73rem;\">%2<\/span><span class=\"f_CodeExample\" style=\"font-size: 0.73rem; color: #000000;\"> -o:<\/span><span class=\"f_CodeExample\" style=\"font-size: 0.73rem;\">%<\/span><span class=\"f_CodeExample\" style=\"font-size: 0.73rem; color: #000000;\">~dp0..\\html\\<\/span><span class=\"f_CodeExample\" style=\"font-size: 0.73rem;\">%3<\/span><br \/>\n\r<span class=\"f_CodeExample\" style=\"font-size: 0.73rem; font-style: italic; color: #000080;\">REM<\/span><br \/>\n\r<span class=\"f_CodeExample\" style=\"font-size: 0.73rem; font-style: italic; color: #000080;\">REM Open the output:<\/span><br \/>\n\r<span class=\"f_CodeExample\" style=\"font-size: 0.73rem; font-style: italic; color: #000080;\">REM<\/span><br \/>\n\r<span class=\"f_CodeExample\" style=\"font-size: 0.73rem;\">%<\/span><span class=\"f_CodeExample\" style=\"font-size: 0.73rem; color: #000000;\">~dp0..\\html\\<\/span><span class=\"f_CodeExample\" style=\"font-size: 0.73rem;\">%3<\/span><\/p>\n\r<p class=\"p_Normal\">&nbsp;<\/p>\n\r<p class=\"p_Normal\">Usage:<\/p>\n\r<p class=\"p_CodeExample\"><span class=\"f_CodeExample\" style=\"color: #000000;\">C:\\users&gt; transform.bat &nbsp;dmdw.xml &nbsp;fileset2.xsl &nbsp;output.html<\/span><\/p>\n\r<p class=\"p_Normal\">&nbsp;<\/p>\n\r<p class=\"p_Normal\">Another way is to use the &nbsp;Magik API as described in <a href=\"dmdw_writer-api.html\" class=\"topiclink\">API<\/a>.<br \/>\n\r&nbsp;<\/p>\n\r"
})
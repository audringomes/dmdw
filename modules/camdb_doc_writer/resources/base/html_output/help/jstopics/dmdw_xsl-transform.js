hmLoadTopic({
hmKeywords:"",
hmTitle:"XSLT Stylesheets",
hmDescription:"DMDW contains the following xsl version 2.0 stylesheets to to transform the dmdw xml into html.",
hmPrevLink:"dmdw_processor.html",
hmNextLink:"dmdw_fileset2_xsl.html",
hmParentLink:"index.html",
hmBreadCrumbs:"",
hmTitlePath:"XSLT Stylesheets",
hmHeader:"",
hmBody:"<p class=\"p_Normal\">DMDW contains the following xsl version 2.0 stylesheets to to transform the dmdw xml into html.<\/p>\n\r<p class=\"p_Normal\">The files can be found in <span style=\"font-weight: bold;\">ds_doc_writer\/resources\/base\/xsl:<\/span><\/p>\n\r<p class=\"p_Normal\">&nbsp;<\/p>\n\r<div style=\"text-align: left; text-indent: 0; padding: 0 0 0 0; margin: 0 0 0 0;\"><table class=\"swDefaultHeader\" >\n\r<tr class=\"swDefaultHeader\">\n\r<td class=\"swDefaultHeader\" style=\"width:10.9375rem; background-color:#ECECF0;\"><p class=\"p_Normal\">xsl-file<\/p>\n\r<\/td>\n\r<td class=\"swDefaultHeader\" style=\"width:19.0625rem; background-color:#ECECF0;\"><p class=\"p_Normal\">Purpose<\/p>\n\r<\/td>\n\r<td class=\"swDefaultHeader\" style=\"width:13.4375rem; background-color:#ECECF0;\"><p class=\"p_Normal\">Remark<\/p>\n\r<\/td>\n\r<\/tr>\n\r<tr class=\"swDefaultHeader\">\n\r<td class=\"swDefaultHeader\" style=\"width:10.9375rem;\"><p class=\"p_Normal\"><span style=\"font-weight: bold;\">Fileset1.xsl<\/span><\/p>\n\r<\/td>\n\r<td class=\"swDefaultHeader\" style=\"width:19.0625rem;\"><p class=\"p_Normal\">Main template that creates multiple html pages<\/p>\n\r<\/td>\n\r<td class=\"swDefaultHeader\" style=\"width:13.4375rem;\"><p class=\"p_Normal\">Version 1 only<\/p>\n\r<\/td>\n\r<\/tr>\n\r<tr class=\"swDefaultHeader\">\n\r<td class=\"swDefaultHeader\" style=\"width:10.9375rem;\"><p class=\"p_Normal\"><span style=\"font-weight: bold;\">Fileset2.xsl<\/span><\/p>\n\r<\/td>\n\r<td class=\"swDefaultHeader\" style=\"width:19.0625rem;\"><p class=\"p_Normal\">Main template that creates multiple html pages.<\/p>\n\r<p class=\"p_Normal\">See <a href=\"dmdw_fileset2_xsl.html\" class=\"topiclink\">FileSet2.xsl<\/a>.<\/p>\n\r<\/td>\n\r<td class=\"swDefaultHeader\" style=\"width:13.4375rem;\"><p class=\"p_Normal\">Version 2 (current)<\/p>\n\r<\/td>\n\r<\/tr>\n\r<tr class=\"swDefaultHeader\">\n\r<td class=\"swDefaultHeader\" style=\"width:10.9375rem;\"><p class=\"p_Normal\"><span style=\"font-weight: bold;\">Fileset3.xsl<\/span><\/p>\n\r<\/td>\n\r<td class=\"swDefaultHeader\" style=\"width:19.0625rem;\"><p class=\"p_Normal\">Main template that creates multiple html pages, but without dd_version prefix and \'error page\'.<\/p>\n\r<p class=\"p_Normal\">When <\/p>\n\r<\/td>\n\r<td class=\"swDefaultHeader\" style=\"width:13.4375rem;\"><br \/>\n\r<\/td>\n\r<\/tr>\n\r<tr class=\"swDefaultHeader\">\n\r<td class=\"swDefaultHeader\" style=\"width:10.9375rem;\"><p class=\"p_Normal\"><span style=\"font-weight: bold;\">ChapterTemplates.xsl<\/span><\/p>\n\r<\/td>\n\r<td class=\"swDefaultHeader\" style=\"width:19.0625rem;\"><p class=\"p_Normal\">The named templates for every kind of page, for example &quot;CollectionPages&quot;<\/p>\n\r<\/td>\n\r<td class=\"swDefaultHeader\" style=\"width:13.4375rem;\"><br \/>\n\r<\/td>\n\r<\/tr>\n\r<tr class=\"swDefaultHeader\">\n\r<td class=\"swDefaultHeader\" style=\"width:10.9375rem;\"><p class=\"p_Normal\"><span style=\"font-weight: bold;\">ProcessingTemplates.xsl<\/span><\/p>\n\r<\/td>\n\r<td class=\"swDefaultHeader\" style=\"width:19.0625rem;\"><p class=\"p_Normal\">All templates for processing the DMDW xml and svg data.<\/p>\n\r<\/td>\n\r<td class=\"swDefaultHeader\" style=\"width:13.4375rem;\"><br \/>\n\r<\/td>\n\r<\/tr>\n\r<tr class=\"swDefaultHeader\">\n\r<td class=\"swDefaultHeader\" style=\"width:10.9375rem;\"><p class=\"p_Normal\"><span style=\"font-weight: bold;\">index.xsl<\/span><\/p>\n\r<\/td>\n\r<td class=\"swDefaultHeader\" style=\"width:19.0625rem;\"><p class=\"p_Normal\">Creates the \'index page\' when multiple DMDW xml files are processed.<\/p>\n\r<\/td>\n\r<td class=\"swDefaultHeader\" style=\"width:13.4375rem;\"><br \/>\n\r<\/td>\n\r<\/tr>\n\r<tr class=\"swDefaultHeader\">\n\r<td class=\"swDefaultHeader\" style=\"width:10.9375rem;\"><p class=\"p_Normal\"><span style=\"font-weight: bold;\">Common.xsl<\/span><\/p>\n\r<\/td>\n\r<td class=\"swDefaultHeader\" style=\"width:19.0625rem;\"><p class=\"p_Normal\">Common named templates for:<\/p>\n\r<p class=\"p_Normal\">- buttons<\/p>\n\r<p class=\"p_Normal\">- head section of html pages<\/p>\n\r<p class=\"p_Normal\">- top section of pages<\/p>\n\r<p class=\"p_Normal\">- footer section of pages<\/p>\n\r<\/td>\n\r<td class=\"swDefaultHeader\" style=\"width:13.4375rem;\"><br \/>\n\r<\/td>\n\r<\/tr>\n\r<tr class=\"swDefaultHeader\">\n\r<td class=\"swDefaultHeader\" style=\"width:10.9375rem;\"><p class=\"p_Normal\"><span style=\"font-weight: bold;\">Custom.xsl<\/span><\/p>\n\r<\/td>\n\r<td class=\"swDefaultHeader\" style=\"width:19.0625rem;\"><p class=\"p_Normal\">Contains custom named templates for extra information on the type of pages<\/p>\n\r<\/td>\n\r<td class=\"swDefaultHeader\" style=\"width:13.4375rem;\"><p class=\"p_Normal\">Loaded after common<\/p>\n\r<\/td>\n\r<\/tr>\n\r<tr class=\"swDefaultHeader\">\n\r<td class=\"swDefaultHeader\" style=\"width:10.9375rem;\"><p class=\"p_Normal\"><span style=\"font-weight: bold;\">TopologyFunctions.xsl<\/span><\/p>\n\r<\/td>\n\r<td class=\"swDefaultHeader\" style=\"width:19.0625rem;\"><p class=\"p_Normal\">Special topology functions <\/p>\n\r<\/td>\n\r<td class=\"swDefaultHeader\" style=\"width:13.4375rem;\"><p class=\"p_Normal\">Version 2<\/p>\n\r<\/td>\n\r<\/tr>\n\r<tr class=\"swDefaultHeader\">\n\r<td class=\"swDefaultHeader\" style=\"width:10.9375rem;\"><p class=\"p_Normal\"><span style=\"font-weight: bold;\">SingleFile.xsl<\/span><\/p>\n\r<\/td>\n\r<td class=\"swDefaultHeader\" style=\"width:19.0625rem;\"><p class=\"p_Normal\">Transforms XML into one html page<\/p>\n\r<\/td>\n\r<td class=\"swDefaultHeader\" style=\"width:13.4375rem;\"><p class=\"p_Normal\">Obsolete<\/p>\n\r<\/td>\n\r<\/tr>\n\r<\/table>\n\r<\/div>\n\r<p class=\"p_Normal\">&nbsp;<\/p>\n\r<p class=\"p_Normal\">&nbsp;<\/p>\n\r"
})

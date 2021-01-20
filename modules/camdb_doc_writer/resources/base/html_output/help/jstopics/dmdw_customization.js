hmLoadTopic({
hmKeywords:"",
hmTitle:"Customization",
hmDescription:"Customizations can be done on several levels: Providing additional content The dm_xml_writer class can be instantiated with a \'helper class\' to provide additional content. By...",
hmPrevLink:"dmdw_getting-started.html",
hmNextLink:"dmdw_datamodel_version.html",
hmParentLink:"index.html",
hmBreadCrumbs:"",
hmTitlePath:"Customization",
hmHeader:"",
hmBody:"<p class=\"p_Normal\">Customizations can be done on several levels:<\/p>\n\r<p class=\"p_Heading3\"><span class=\"f_Heading3\">Providing&nbsp;additional&nbsp;content<\/span><\/p>\n\r<p class=\"p_Normal\">The <span style=\"font-weight: bold;\">dm_xml_writer<\/span> class can be instantiated with a \'helper class\' to provide additional content. By default this is an object of class <span style=\"font-weight: bold;\">dm_dataset_specials<\/span>. See <a href=\"dmdw_specials.html\" class=\"topiclink\">Magik &gt; Specials<\/a> for more information.<\/p>\n\r<p class=\"p_Normal\">&nbsp;<\/p>\n\r<p class=\"p_Heading3\"><span class=\"f_Heading3\">Customizing&nbsp;the&nbsp;XML&nbsp;Content<\/span><\/p>\n\r<p class=\"p_Normal\" style=\"text-indent: 0; padding-left: 1.2500rem; margin-left: 0;\"><span class=\"f_Normal\" style=\"display:inline-block;width:1.2500rem;margin-left:-1.2500rem\">1.<\/span>You can specify a <span style=\"font-weight: bold;\">product<\/span> and <span style=\"font-weight: bold;\">module<\/span> for the <a href=\"dmdw_datamodel_version.html\" class=\"topiclink\">Datamodel Version<\/a>. This should be supplied as argument to the <span style=\"font-weight: bold;\">dm_xml_writer.new()<\/span>. This datamodel property can be used to keep track of specific versions.<\/p><p class=\"p_Normal\" style=\"text-indent: 0; padding-left: 1.2500rem; margin-left: 0;\"><span class=\"f_Normal\" style=\"display:inline-block;width:1.2500rem;margin-left:-1.2500rem\">2.<\/span>Provide descriptions for common fields (see <a href=\"dmdw_common_fields.html\" class=\"topiclink\">4.2 common_fields<\/a>).<\/p><p class=\"p_Normal\" style=\"text-indent: 0; padding-left: 1.2500rem; margin-left: 0;\"><span class=\"f_Normal\" style=\"display:inline-block;width:1.2500rem;margin-left:-1.2500rem\">3.<\/span>Provide descriptions for geometry mappings (see <a href=\"dmdw_geometry_mappings.html\" class=\"topiclink\">4.3 geometry_mappings<\/a>).<\/p><p class=\"p_Normal\" style=\"text-indent: 0; padding-left: 1.2500rem; margin-left: 0;\"><span class=\"f_Normal\" style=\"display:inline-block;width:1.2500rem;margin-left:-1.2500rem\">4.<\/span>Provide descriptions for collections and fields (see <a href=\"dmdw_help_text.html\" class=\"topiclink\">Adding Descriptions<\/a>).<\/p><p class=\"p_Heading3\"><span class=\"f_Heading3\">Customizing&nbsp;the&nbsp;HTML&nbsp;output<\/span><\/p>\n\r<p class=\"p_Normal\" style=\"text-indent: 0; padding-left: 1.2500rem; margin-left: 0;\"><span class=\"f_Normal\" style=\"display:inline-block;width:1.2500rem;margin-left:-1.2500rem\">1.<\/span>Modify the xsl template(s):<\/p><p class=\"p_Normal\" style=\"text-indent: 0; padding-left: 1.6250rem; margin-left: 0;\"><span class=\"f_Normal\" style=\"font-family: \'Courier New\';display:inline-block;width:0.8125rem;margin-left:-0.8125rem\">o<\/span>Simple additions - when you use the <span style=\"font-weight: bold;\">FileSet2<\/span> XSL - can be done by filling in the named templates in <span style=\"font-weight: bold;\">Custom.xsl<\/span>. These are added to the HTML output. See <a href=\"dmdw_custom_xsl.html\" class=\"topiclink\">Custom.xsl<\/a>.<\/p><p class=\"p_Normal\" style=\"text-indent: 0; padding-left: 1.6250rem; margin-left: 0;\"><span class=\"f_Normal\" style=\"font-family: \'Courier New\';display:inline-block;width:0.8125rem;margin-left:-0.8125rem\">o<\/span>Change the way the output is created by modifying the xls templates.<\/p><p class=\"p_Normal\">&nbsp;<\/p>\n\r<p class=\"p_Normal\" style=\"text-indent: 0; padding-left: 1.2500rem; margin-left: 0;\"><span class=\"f_Normal\" style=\"display:inline-block;width:1.2500rem;margin-left:-1.2500rem\">2.<\/span>Change the styles of the HTML output.<\/p><p class=\"p_Normal\" style=\"text-indent: 0; padding-left: 1.6250rem; margin-left: 0;\"><span class=\"f_Normal\" style=\"font-family: \'Courier New\';display:inline-block;width:0.8125rem;margin-left:-0.8125rem\">o<\/span>Modify the <span style=\"font-weight: bold;\">custom.css<\/span> styles. (See <a href=\"dmdw_css.html\" class=\"topiclink\">CSS<\/a>)<\/p><p class=\"p_Normal\" style=\"text-indent: 0; padding-left: 1.6250rem; margin-left: 0;\"><span class=\"f_Normal\" style=\"font-family: \'Courier New\';display:inline-block;width:0.8125rem;margin-left:-0.8125rem\">o<\/span>Modify the other styles (layout.css and dm.css)<\/p><p class=\"p_Normal\">&nbsp;<\/p>\n\r"
})

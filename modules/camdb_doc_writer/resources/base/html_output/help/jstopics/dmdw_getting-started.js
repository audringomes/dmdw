hmLoadTopic({
hmKeywords:"",
hmTitle:"Getting started",
hmDescription:"Take the following steps:  Common Get the software from the repository;  Exporting data model to XML: Start an open smallworld session containing the basic datamodel code for",
hmPrevLink:"dmdw_release-notes.html",
hmNextLink:"dmdw_customization.html",
hmParentLink:"index.html",
hmBreadCrumbs:"",
hmTitlePath:"Getting started",
hmHeader:"",
hmBody:"<p class=\"p_Normal\">Take the following steps:<\/p>\n\r<p class=\"p_Normal\">&nbsp;<\/p>\n\r<p class=\"p_Normal\"><span style=\"font-weight: bold;\">Common<\/span><\/p>\n\r<p class=\"p_Normal\" style=\"text-indent: 0; padding-left: 1.2500rem; margin-left: 0;\"><span class=\"f_Normal\" style=\"display:inline-block;width:1.2500rem;margin-left:-1.2500rem\">1.<\/span>Get the software from the repository;<\/p><p class=\"p_Normal\">&nbsp;<\/p>\n\r<p class=\"p_Normal\"><span style=\"font-weight: bold;\">Exporting data model to XML:<\/span><\/p>\n\r<p class=\"p_Normal\" style=\"text-indent: 0; padding-left: 1.2500rem; margin-left: 0;\"><span class=\"f_Normal\" style=\"display:inline-block;width:1.2500rem;margin-left:-1.2500rem\">1.<\/span>Start an open smallworld session containing the basic datamodel code for the dataset(s);<\/p><p class=\"p_Normal\" style=\"text-indent: 0; padding-left: 1.2500rem; margin-left: 0;\"><span class=\"f_Normal\" style=\"display:inline-block;width:1.2500rem;margin-left:-1.2500rem\">2.<\/span>Add the sw_product <span style=\"font-weight: bold;\">datamodel_doc_writer<\/span> to your session;<\/p><p class=\"p_Normal\" style=\"text-indent: 0; padding-left: 1.2500rem; margin-left: 0;\"><span class=\"f_Normal\" style=\"display:inline-block;width:1.2500rem;margin-left:-1.2500rem\">3.<\/span>Load the module <span style=\"font-weight: bold;\">dm_doc_writer<\/span>;<\/p><p class=\"p_Normal\">Alternatively &nbsp;you can load <span style=\"font-weight: bold;\">load.magik<\/span> from the product root to do both 2. and 3.<\/p>\n\r<p class=\"p_Normal\" style=\"text-indent: 0; padding-left: 1.2500rem; margin-left: 0;\"><span class=\"f_Normal\" style=\"display:inline-block;width:1.2500rem;margin-left:-1.2500rem\">4.<\/span>Create a new module with the proc <span style=\"font-weight: bold;\">create_dmdw_module(parent_dir,module_name)<\/span>;<\/p><p class=\"p_Normal\" style=\"text-indent: 0; padding-left: 1.2500rem; margin-left: 0;\"><span class=\"f_Normal\" style=\"display:inline-block;width:1.2500rem;margin-left:-1.2500rem\">5.<\/span>Load the newly created module;<\/p><p class=\"p_Normal\" style=\"text-indent: 0; padding-left: 1.2500rem; margin-left: 0;\"><span class=\"f_Normal\" style=\"display:inline-block;width:1.2500rem;margin-left:-1.2500rem\">6.<\/span>copy the proc <span style=\"font-weight: bold;\">export_xml<\/span> and fill in the appropriate ace_name<\/p><p class=\"p_Normal\">&nbsp;<\/p>\n\r<p class=\"p_Normal\"><span style=\"font-weight: bold;\">Transforming into HTML<\/span><\/p>\n\r<p class=\"p_Normal\">If you plan to use XSLT, you can use the java version of Saxon-HE which is installed in <span style=\"font-weight: bold;\">dm_doc_writer\/resources\/bin<\/span>.<\/p>\n\r<p class=\"p_Normal\">There are two ways to create html from the XML and XSL sheets:<\/p>\n\r<p class=\"p_Normal\" style=\"text-indent: 0; padding-left: 1.2500rem; margin-left: 0;\"><span class=\"f_Normal\" style=\"display:inline-block;width:1.2500rem;margin-left:-1.2500rem\">1.<\/span>Using Command Line Interface (see exampe <span style=\"font-weight: bold;\">dm_doc_writer\/resources\/base\/bin\/transform.bat<\/span>) <\/p><p class=\"p_Normal\" style=\"text-indent: 0; padding-left: 1.2500rem; margin-left: 0;\"><span class=\"f_Normal\" style=\"display:inline-block;width:1.2500rem;margin-left:-1.2500rem\">2.<\/span>Use Smallworld Magik proc <span style=\"font-weight: bold;\">transform_to_fileset_html(p_module_name, p_input_file, _optional ..)<\/span><\/p><p class=\"p_Normal\">&nbsp;<\/p>\n\r<p class=\"p_Normal\">There are several levels of customization. See <a href=\"dmdw_customization.html\" class=\"topiclink\">Customization<\/a> for further details.<\/p>\n\r<p class=\"p_Normal\">&nbsp;<\/p>\n\r"
})

<?xml version="1.0" encoding="UTF-8"?>
<!-- SVN $Rev: 785 $ -->
<xsl:stylesheet 
    version="2.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:output method="html" indent="yes" name="html"/>

  <!-- this named template creates the head section of every html page.
       the PATH parameter is for the html resources (css and scripts) and
       the TITLE parameter is the document <title>
       -->
       
  <xsl:template name="HtmlHeader">
    <xsl:param name="path"/>
    <xsl:param name="title"/>
    
    <head>
      <title><xsl:value-of select="$title"/></title>
      <link rel="Stylesheet" href="{concat($path,'layout.css')}"/>
      <link rel="Stylesheet" href="{concat($path,'html.css')}"/>
      <link rel="stylesheet" href="{concat($path,'dm.css')}"/> 
      <link rel="stylesheet" href="{concat($path,'custom.css')}"/> 
      
      <script src="{concat($path,'jquery.js')}">
      </script>
      <script src="{concat($path,'filter.js')}"/>
      <script>
	function ToggleTechtop()
	{ToggleSub('techtop');}

	function ToggleDMHistory()
	{$(".dmHistory").toggle();}
	
	function ToggleDetail()
	{$(".technical").toggle();}

	function ToggleInVisField()
	{$(".VisFalse").toggle();}
	
	function ToggleMapped()
	{$(".MappedTo").toggle();}
	
	function ToggleTopology()
	{$(".TopologyList").toggle();}
	
      </script>
    </head>
  </xsl:template>
		
</xsl:stylesheet>

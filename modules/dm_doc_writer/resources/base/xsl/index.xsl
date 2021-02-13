<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    version="2.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <!-- Creates a html page with links to datamodel docs 
       See dm_xml_handler.create_index_xml() for more details -->
  
  <xsl:output method="html" indent="yes" name="html"/>

  <!-- Path to help in master (TOC) html file -->  
  <xsl:variable name="pathtohelpMaster" select="'help/index.html'"/>
  <xsl:variable name="maintitle" select="'Datamodel information'"/>
  <xsl:variable name="aps">&apos;</xsl:variable>

  <!-- This is the main template -->
  <xsl:template match="/">
    <head>
      <title><xsl:value-of select="$maintitle"/></title>
      <link rel="Stylesheet" href="layout.css"/>
      <link rel="Stylesheet" href="html.css"/>
      <link rel="stylesheet" href="dm.css"/> 
      <link rel="stylesheet" href="custom.css"/> 
    </head>

    <html>
      <body>
	<header class="float">
	  <a href="#" class="logo">
	    <img src="dmdw-logo.png"/>
	    <xsl:value-of select="$maintitle"/>
	  </a>
	</header>

	<div class="PageTitle float">Index of Datamodel Documents</div>
	
	<nav class="float" style="font-size:inherit;">
	  <table class="dmtable float IndexTable">
	    <tr>
	      <th>Source file</th>
	      <th>Datamodel HTML</th>
	    </tr>
	    <xsl:apply-templates/>
	  </table>
	</nav>
      </body>
    </html>

  </xsl:template>  

  <xsl:template match="files">
    <tr>
      <xsl:apply-templates/>
    </tr>
  </xsl:template>

  <xsl:template match="source">
    <td><xsl:value-of select="."/></td>
  </xsl:template>
  
  <xsl:template match="html">
  </xsl:template>

  <xsl:template match="pretty">
    <td>
      <a>
	<xsl:attribute name="href">
	  <xsl:value-of select="@file"/>
	</xsl:attribute>
	<xsl:value-of select="."/>
      </a>
    </td>
  </xsl:template>

</xsl:stylesheet>

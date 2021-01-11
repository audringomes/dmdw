<?xml version="1.0" encoding="UTF-8"?>
<!-- SVN $Rev: 777 $ -->
<xsl:stylesheet 
    version="2.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema">
  
  <xsl:output method="html" indent="yes" name="html"/>

  <!-- These are the templates for the top and bottom section of every page -->
  
  <!-- Title section -->
  <xsl:template name="Top">
    <xsl:param name="path"/>
    <header class="float">
      <a href="{concat($path,$filename0)}" class="logo">
	<img src="{concat($path,'dmdw-logo.png')}"/>
	<xsl:value-of select="$maintitle"/>
      </a>
    </header>
  </xsl:template>

  <!-- Footer section -->
  <xsl:template name="footer">
    <xsl:param name="helppath"/>
    <xsl:param name="topic"/>
    <xsl:variable name="currentDate" as="xs:date" select="current-date()"/>
    <footer class="float">
      <ul>
	<li><xsl:text>DD Version </xsl:text><xsl:value-of select="$ddversion"/></li>
	<li>
	  <xsl:text>DMDW &#169; Realworld Software Products </xsl:text><xsl:value-of select="year-from-date($currentDate)"/>
	</li>
	<li>
	  
	  <xsl:choose>
	    <xsl:when test="$topic=''">
	      <a href="{$helppath}" target="blank">Help</a>
	    </xsl:when>
	    <xsl:otherwise>
	      <a href="{concat($helppath,'?dmdw_',$topic,'.html')}" target="blank">Help</a>
	    </xsl:otherwise>
	  </xsl:choose> 
	  
	</li>
      </ul>
    </footer>
  </xsl:template>

</xsl:stylesheet>

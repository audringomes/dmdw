<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    version="2.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:dmdw="https://boogert-lab.nl/dmdw">
  
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
      <link rel="stylesheet" href="{concat($path,'svg.css')}"/> 
      
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
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

	function ToggleExplicitTopologyRules()
	{$(".RuleTypeexplicit").toggle();
	$(".RuleTypedefault").toggle();}
	
      </script>
    </head>
  </xsl:template>

  <!-- These are the templates for the top and bottom section of every page -->
  
  <!-- Title section -->
  <xsl:template name="Top">
    <xsl:param name="path"/>
    <header class="float">
      <a href="{concat($path,$filename0)}" class="logo">
	<img src="{concat($path,'dmdw-logo.png')}"/>
	<xsl:value-of select="$maintitle"/>
	<span class="DsName">
	  <xsl:text> </xsl:text>
	  <xsl:value-of select="$dm_external_name"/>
	</span>
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


  <!-- this named template creates the filter buttons
       -->
  <xsl:template name="Button">
    <xsl:param name="function"/>
    <xsl:param name="label"/>
    <xsl:param name="state"/>		
    <span class="CheckButton">
      <input type="checkbox" name="{$function}" onclick="{$function}">
	<xsl:if test="$state='True'">
	  <xsl:attribute name="checked">
	    <xsl:text>True</xsl:text>
	  </xsl:attribute> 
	</xsl:if>
      </input>
      <label for="{$function}">
	<span><xsl:value-of select="$label"/></span>
      </label>
    </span>
  </xsl:template>

  <xsl:template name="missing_mdm_descriptions">
    <xsl:for-each select="//mapped">
      <xsl:variable name="mdm" select="@map_discriminator_method"/>
      <xsl:choose>
	<xsl:when test="/datamodel/global_properties/geometry_mappings/method[@name=$mdm]">
	</xsl:when>
	<xsl:otherwise>
	  <div class="warning">
	    <xsl:text>No description for Map Discriminator method '</xsl:text>
	    <xsl:value-of select="@map_discriminator_method"/>
	    <xsl:text>'</xsl:text>
	  </div>
	</xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="check_schema_version">
    <xsl:variable name="xmlversion" select="/datamodel/@schema_version"/>
    <xsl:if test="$xmlversion ne $supported_schema_version">
      <div class="warning">
	<xsl:text>Warning: The template version does not match the xml schema_version! </xsl:text>
	<xsl:text> Supported version: </xsl:text>
	<xsl:value-of select="$supported_schema_version"/>
	<xsl:text> XML schema_version: </xsl:text>
	<xsl:value-of select="$xmlversion"/>
      </div>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>
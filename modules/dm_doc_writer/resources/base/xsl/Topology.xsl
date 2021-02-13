<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
	version="2.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema">
	
	<xsl:output method="html" indent="yes" name="html"/>

	<xsl:variable name="MasterTemplateVersion" select="'2.0'"/>
	<xsl:variable name="XSLTProcessor" select="'saxon-he-10.2 from Saxonica'"/>

	<xsl:include href="Common.xsl"/>
	<xsl:include href="Custom.xsl"/>
	<!-- <xsl:include href="HtmlHeader.xsl"/> -->
	<!-- <xsl:include href="TopAndFooter.xsl"/> -->
	
	<xsl:variable name="dsname" select="/datamodel/datamodel_info/dm_dataset"/>
	<xsl:variable name="ddversion" select="/datamodel/datamodel_info/dm_current_dd_version"/>
	<xsl:variable name="dm_external_name" select="/datamodel/datamodel_info/dm_external_name"/>

	<xsl:variable name="fn_prefix" select="concat($dsname,$ddversion,'_')"/>
	<xsl:variable name="subdir" select="concat($fn_prefix,'pages/')"/>

	<xsl:variable name="filename0" select="concat($dsname,$ddversion,'.html')"/>
	<xsl:variable name="master" select="concat('../',$filename0)"/>
	
	<xsl:variable name="pathtohelp" select="'../en_gb/help/index.html'"/>
	<xsl:variable name="pathtohelpMaster" select="'en_gb/help/index.html'"/>

	<xsl:variable name="path_prefix" select="concat($subdir,$dsname,$ddversion,'_')"/>
	
	<xsl:variable name="maintitle" select="concat('Datamodel information ',$dm_external_name)"/>
	
	<xsl:variable name="filename5" select="concat($path_prefix,'topology','.html')"/>

	<xsl:template match="/">
	  
	  <html>
	    
	    <xsl:call-template name="HtmlHeader">
	      <xsl:with-param name="path" select="'../'"/>
	      <xsl:with-param name="title" select="concat($dm_external_name,' - Explicit Topology Rules')"/>
	    </xsl:call-template>
	    
	    <body onload="HighlightHash()">
	      <xsl:call-template name="Top">
		<xsl:with-param name="path" select="'../'"/>
	      </xsl:call-template>
	      <div class="PageTitle float">Explicit Topology Rules</div>


	      <xsl:call-template name="ruleslegend"/>

	      <div class="container">
		<div class="navbox">
		  <xsl:apply-templates select="/datamodel/explicit_topology_rules"/>
		</div>
		<div class="elementbox">
		  <h4 id="righthead"></h4>
		  <xsl:apply-templates select="//collection2"/>
		</div>
	      </div>
	      
	      <xsl:call-template name="footer">
		<xsl:with-param name="helppath" select="$pathtohelp"/>
	      </xsl:call-template>
	      
	    </body>
	    
	  </html>
	</xsl:template>

	  
	<xsl:template match="manifold">

	  <table class="dmTable">
	    <tr class="HeadStyle">
	      <th class="name" colspan="3"><xsl:value-of select="@name"/></th>
	    </tr>
	    <xsl:apply-templates/>
	  </table>
	</xsl:template>


	<xsl:template match="collection1">
	  <xsl:variable name="aps">&apos;</xsl:variable>
	  <xsl:variable name="elemclass">fld1s</xsl:variable>	  
	  <tr class="name">

	    <td>
	      <!-- <xsl:call-template name="Button"> -->
	      <!-- 	<xsl:with-param name="function" select="'ToggleDMHistory();'"/> -->
	      <!-- 	<xsl:with-param name="label" select="''"/> -->
	      <!-- 	<xsl:with-param name="state" select="'False'"/> -->
	      <!-- </xsl:call-template> -->
	      <a name="{@name}" class="ListLink" href="#" onclick="{concat('ShowMyGeoms(',$aps,@name,$aps,',',$aps,'fld1s',$aps,')')}">
		<xsl:value-of select="@name"/>
	      </a>
	    </td>
	  </tr>
	  <tr>
	    <td>
	      <xsl:apply-templates/>
	    </td>
	  </tr>
	</xsl:template>

	<xsl:template match="field1">
	  <xsl:variable name="aps">&apos;</xsl:variable>
	  <xsl:variable name="MyDadsName">
	    <xsl:value-of select="parent::collection1/attribute::name"/>
	  </xsl:variable>
	  <div>
	    <a name="{@name}" href="#" onclick="{concat('ShowThyGeoms(',$aps,$MyDadsName,$aps,',',$aps,@name,$aps,',',$aps,'col2s',$aps,')')}">
	      <xsl:attribute name="class">
		<xsl:text>fld1s geometry </xsl:text>
		<xsl:value-of select="parent::collection1/attribute::name"/>
	      </xsl:attribute>
	      <xsl:attribute name="style">
		<xsl:text>display:none;</xsl:text>
	      </xsl:attribute>
	      <xsl:value-of select="@name"/>
	    </a>
	  </div>
	</xsl:template>

	<xsl:template match="collection2">
	  <div>
	    <xsl:attribute name="class">
	      <xsl:text>col2s name </xsl:text>
	      <xsl:value-of select="ancestor::collection1/attribute::name"/>
	      <xsl:text> </xsl:text>
	      <xsl:value-of select="parent::field1/attribute::name"/>
	    </xsl:attribute>
	    <xsl:attribute name="style">
	      <xsl:text>display:none;</xsl:text>
	    </xsl:attribute>
	    <xsl:value-of select="@name"/>
	    <div>
	      <xsl:apply-templates/>
	    </div>
	  </div>
	</xsl:template>

	<xsl:template match="field2">
	  <div class="fld2s geometry">
	    <xsl:apply-templates/>
	    <xsl:value-of select="@name"/>
	  </div>
	</xsl:template>

	<xsl:template match="rule1">
	  <span>
	    <xsl:attribute name="class">
	      <xsl:text>rule1 </xsl:text>
	      <xsl:value-of select="."/>
	    </xsl:attribute>
	    <xsl:value-of select="."/>
	  </span>
	</xsl:template>

	<xsl:template match="rule2">
	  <span>
	    <xsl:attribute name="class">
	      <xsl:text>rule2 </xsl:text>
	      <xsl:value-of select="."/>
	    </xsl:attribute>
	    <xsl:value-of select="."/>
	  </span>
	</xsl:template>

	<xsl:template name="ruleslegend">
	  <div class="float ruleslegend">
	    connect:<img src="../connect.png"/>
	    connect_ends:<img src="../connect_ends.png"/>
	    split_chain:<img src="../split_chain.png"/>
	    split_link:<img src="../split_link.png"/>
	  </div>
	</xsl:template>
	
</xsl:stylesheet>

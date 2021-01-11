<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    version="2.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:dmdw="http://realworld-systems.com">
  
  <xsl:output method="html" indent="yes" name="html"/>

  <xsl:variable name="MasterTemplateVersion" select="'2.0'"/>
  <xsl:variable name="dmdw_scheme_version" select="1.2"/>
  
  <xsl:variable name="XSLTProcessor" select="'saxon-he-10.2 from Saxonica'"/>

  <xsl:include href="Common.xsl"/>
  <xsl:include href="Custom.xsl"/>
  <!-- <xsl:include href="HtmlHeader.xsl"/> -->
  <!-- <xsl:include href="TopAndFooter.xsl"/> -->
  
  <xsl:include href="TopologyFunctions.xsl"/>
  
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
  
  <xsl:variable name="filename1" select="concat($path_prefix,'technical_details.html')"/>
  <xsl:variable name="filename2" select="concat($path_prefix,'collections.html')"/>
  <xsl:variable name="filename3" select="concat($path_prefix,'global_properties.html')"/>
  <xsl:variable name="filename4" select="concat($path_prefix,'enumerators.html')"/>
  <xsl:variable name="filename5" select="concat($path_prefix,'topology.html')"/>
  <xsl:variable name="filename5s" select="concat($path_prefix,'topology_static.html')"/>
  <xsl:variable name="filename6" select="concat($path_prefix,'soft_joins.html')"/>

  <!-- This is the main template -->
  <xsl:template match="/">
    
    <!-- A meta doc that shows the actual output file as a link -->
    
    <html>
      <xsl:call-template name="HtmlHeader">
	<xsl:with-param name="path" select="''"/>
	<xsl:with-param name="title" select="'Result'"/>
      </xsl:call-template>
      <body onload="HighlightHash()">
	<nav class="float">
	  <xsl:text>Outputfile: </xsl:text>
	  <a href="{$filename0}">	
	    <xsl:value-of select="$filename0"/>
	  </a>
	</nav>
	<div class="float">
	  <xsl:call-template name="missing_mdm_descriptions"/>
	</div>
      </body>
    </html>
    
    <!-- The master document with TOC -->
    <xsl:result-document href="{$filename0}" format="html">
      
      <html> 			
	<xsl:call-template name="HtmlHeader">
	  <xsl:with-param name="path" select="''"/>
	  <xsl:with-param name="title" select="$maintitle"/>
	</xsl:call-template>

	<body onload="HighlightHash()">

	  <xsl:call-template name="Top">
	    <xsl:with-param name="path" select="''"/>
	  </xsl:call-template>

	  <div class="PageTitle float">Table of Contents</div>
	  <nav class="float">
	    <ul>
	      <li><a href="{$filename1}">Technical Details</a></li>
	      <li><a href="{$filename3}">Global Properties</a></li>
	      <li><a href="{$filename2}">Collections</a></li>
	      <li><a href="{$filename4}">Enumerators</a></li>
	      <li><a href="{$filename5s}">Topology (static)</a></li>
	      <li><a href="{$filename5}">Topology (interactive)</a></li>
	      <xsl:if test="/datamodel/soft_joins">
		<li><a href="{$filename6}">Magik joins</a></li>
	      </xsl:if>
	    </ul>
	  </nav>

	  <xsl:call-template name="footer">
	    <xsl:with-param name="helppath" select="$pathtohelpMaster"/>
	    <xsl:with-param name="topic" select="'Pages'"/>
	  </xsl:call-template>

	</body>
      </html>
      
    </xsl:result-document>

    <!-- Technical Details Page -->
    <xsl:result-document href="{$filename1}" format="html">
      
      <html>
	<xsl:call-template name="HtmlHeader">
	  <xsl:with-param name="path" select="'../'"/>
	  <xsl:with-param name="title" select="concat($dm_external_name,' - Technical details')"/>
	</xsl:call-template>
	
	<body onload="HighlightHash()">
	  <xsl:call-template name="Top">
	    <xsl:with-param name="path" select="'../'"/>
	  </xsl:call-template>
	  <div class="PageTitle float">Technical Details</div>
	  <div class="ChapterInfo float">
	    <xsl:call-template name="technical_details_info"/>
	  </div>
	  <div id="techtop">
	    <xsl:call-template name="document_info"/>
	    <xsl:apply-templates select="/datamodel/datamodel_info"/>
	    <xsl:apply-templates select="/datamodel/software_version"/>
	    <xsl:apply-templates select="/datamodel/datamodel_history"/>
	  </div>

	  <xsl:call-template name="footer">
	    <xsl:with-param name="helppath" select="$pathtohelp"/>
	    <xsl:with-param name="topic" select="'Technical-Details'"/>	    
	  </xsl:call-template>

	</body>
      </html>
    </xsl:result-document>
    
    <!-- Collection list -->
    <xsl:result-document href="{$filename2}" format="html">
      
      <html>
	<xsl:call-template name="HtmlHeader">
	  <xsl:with-param name="path" select="'../'"/>
	  <xsl:with-param name="title" select="concat($dm_external_name,' - List of Collections')"/>
	</xsl:call-template>
	
	<body onload="HighlightHash()">
	  <xsl:call-template name="Top">
	    <xsl:with-param name="path" select="'../'"/>
	  </xsl:call-template>
	  <div class="PageTitle float">Collections by Category</div>
	  <div class="ChapterInfo float">
	    <xsl:call-template name="collections_info"/>
	  </div>
	  <xsl:call-template name="collectionlist">
	    <xsl:with-param name="path" select="''"/>
	  </xsl:call-template>

	  <xsl:call-template name="footer">
	    <xsl:with-param name="helppath" select="$pathtohelp"/>
	  </xsl:call-template>

	</body>
      </html>
    </xsl:result-document>

    <!-- Global properties -->
    <xsl:result-document href="{$filename3}" format="html">
      
      <html>
	<xsl:call-template name="HtmlHeader">
	  <xsl:with-param name="path" select="'../'"/>
	  <xsl:with-param name="title" select="concat($dm_external_name,' - Global properties')"/>
	</xsl:call-template>
	<body onload="HighlightHash()">
	  <xsl:call-template name="Top">
	    <xsl:with-param name="path" select="'../'"/>
	  </xsl:call-template>
	  <div class="PageTitle float">Global Properties</div>
	  <div class="ChapterInfo float">
	    <xsl:call-template name="global_properties_info"/>
	  </div>
	  <xsl:for-each select="datamodel/global_properties">
	    <xsl:apply-templates/>
	  </xsl:for-each>

	  <xsl:call-template name="footer">
	    <xsl:with-param name="helppath" select="$pathtohelp"/>
	    <xsl:with-param name="topic" select="'Global-Properties'"/>
	  </xsl:call-template>

	</body>
      </html>
    </xsl:result-document>

    
    <!-- Seperate Pages for the details of the collections -->
    <xsl:call-template name="CollectionPages">
      <xsl:with-param name="subdir" select="$subdir"/>	
    </xsl:call-template>

    
    <!-- Enumerator listing -->
    <xsl:result-document href="{$filename4}" format="html">
      
      <html>
	
	<xsl:call-template name="HtmlHeader">
	  <xsl:with-param name="path" select="'../'"/>
	  <xsl:with-param name="title" select="concat($dm_external_name,' - List of Enumerators')"/>
	</xsl:call-template>
	
	<body onload="HighlightHash()">

	  <xsl:call-template name="Top">
	    <xsl:with-param name="path" select="'../'"/>
	  </xsl:call-template>
	  <div class="PageTitle float">Enumerators</div>
	  <div class="ChapterInfo float">
	    <xsl:call-template name="enumerators_info"/>
	  </div>
	  
	  <div>
	    <xsl:choose>
	      <xsl:when test="count(//enumerator) gt 100">
		<xsl:call-template name="PageWithFilter">
		  <xsl:with-param name="elemclass" select="'dmEnumerator'"/>
		  <xsl:with-param name="selectList" select="datamodel/enumerators/enumerator"/>
		  <xsl:with-param name="select" select="datamodel/enumerators/enumerator"/>
		</xsl:call-template>
	      </xsl:when>
	      <xsl:otherwise>
		<xsl:for-each select="datamodel/enumerators">
		  <br></br>
		  <xsl:apply-templates/>
		</xsl:for-each>					
	      </xsl:otherwise>
	    </xsl:choose>
	  </div>
	  
	  <xsl:call-template name="footer">
	    <xsl:with-param name="helppath" select="$pathtohelp"/>
	    <xsl:with-param name="topic" select="'Enumerator_Page'"/>
	  </xsl:call-template>
	  
	</body>
      </html>
      
    </xsl:result-document>

    
    <!-- Topology Interactive -->
    <xsl:result-document href="{$filename5}" format="html">
      <html>
	
	<xsl:call-template name="HtmlHeader">
	  <xsl:with-param name="path" select="'../'"/>
	  <xsl:with-param name="title" select="concat($dm_external_name,' - Explicit Topology Rules')"/>
	</xsl:call-template>

	<body onload="HighlightHash()">
	  
	  <xsl:call-template name="Top">
	    <xsl:with-param name="path" select="'../'"/>
	  </xsl:call-template>
	  <div class="PageTitle float">Explicit Topology Rules (interactive)</div>
	  <div class="ChapterInfo float">
	    <xsl:call-template name="topology_info_interactive"/>
	  </div>
	  
	  <xsl:call-template name="CreateTopologyContentInteractive"/>
	  
	  <xsl:call-template name="footer">
	    <xsl:with-param name="helppath" select="$pathtohelp"/>
	    <xsl:with-param name="topic" select="'TopologyI'"/>
	  </xsl:call-template>

	</body>

      </html>
    </xsl:result-document>


    <!-- Topology Static -->
    <xsl:result-document href="{$filename5s}" format="html">
      <html>
	
	<xsl:call-template name="HtmlHeader">
	  <xsl:with-param name="path" select="'../'"/>
	  <xsl:with-param name="title" select="concat($dm_external_name,' - Explicit Topology Rules')"/>
	</xsl:call-template>

	<body onload="HighlightHash()">
	  
	  <xsl:call-template name="Top">
	    <xsl:with-param name="path" select="'../'"/>
	  </xsl:call-template>
	  <div class="PageTitle float">Explicit Topology Rules (static)</div>
	  <div class="ChapterInfo float">
	    <xsl:call-template name="topology_info_static"/>
	  </div>
	  
	  <xsl:call-template name="CreateTopologyContentStatic"/>
	  
	  <xsl:call-template name="footer">
	    <xsl:with-param name="helppath" select="$pathtohelp"/>
	    <xsl:with-param name="topic" select="'TopologyS'"/>
	  </xsl:call-template>

	</body>

      </html>
    </xsl:result-document>
    
    <!-- Soft joins (if any) -->
    <xsl:if test="/datamodel/soft_joins">
      <xsl:result-document href="{$filename6}" format="html">
	
	<html>
	  
	  <xsl:call-template name="HtmlHeader">
	    <xsl:with-param name="path" select="'../'"/>
	    <xsl:with-param name="title" select="concat($dm_external_name,' - Soft Joins')"/>
	  </xsl:call-template>
	  
	  <body onload="HighlightHash()">

	    <xsl:call-template name="Top">
	      <xsl:with-param name="path" select="'../'"/>
	    </xsl:call-template>
	    <div class="PageTitle float">Soft joins</div>
	    <div class="ChapterInfo float">
	      <xsl:call-template name="soft_joins_info"/>
	    </div>

	    <xsl:apply-templates select="/datamodel/soft_joins" mode="list"/>
	    
	    <xsl:call-template name="footer">
	      <xsl:with-param name="helppath" select="$pathtohelp"/>
	      <xsl:with-param name="topic" select="'SoftJoins'"/>
	    </xsl:call-template>

	  </body>

	</html>

      </xsl:result-document>			
    </xsl:if>

  </xsl:template>
  
  
  <!-- DATA PROCESSING TEMPLATES -->
  
  <xsl:template match="software_version">
    <div style="overflow-x:auto">
      <table class="dmtable float technical">
	<tr>
	  <th colspan="2"><xsl:text>Software</xsl:text></th>				
	</tr>
	<xsl:for-each select="*">
	  <tr>
	    <td><xsl:value-of select="name()"/></td>
	    <td><xsl:value-of select="."/></td>
	  </tr>
	</xsl:for-each>
	<tr>	
	  <td>Stylesheet</td>
	  <td><xsl:value-of select="$MasterTemplateVersion"/></td>
	</tr>
	<tr>
	  <td>XSLT Processor</td>
	  <td><xsl:value-of select="$XSLTProcessor"/></td>
	</tr>
      </table>
    </div>
  </xsl:template>

  
  <!-- Details of the datamodel -->
  <xsl:template match="datamodel_info">
    <div style="overflow-x:auto">
      <table class="dmTable float">
	<tr>
	  <th colspan="2">Meta Data Information</th>
	</tr>
	<xsl:apply-templates/>
      </table>
    </div>
  </xsl:template>
  
  <xsl:template match="dm_datamodel_version">
    <tr>
      <td><xsl:text>Datamodel Version: </xsl:text></td>
      <xsl:choose>
	<xsl:when test=".='Undetermined'">
	  <td><b><xsl:value-of select="."/></b></td>
	</xsl:when>
	<xsl:otherwise>
	  <td>
	    <b><xsl:value-of select="."/></b>
	    <xsl:text> based on product: '</xsl:text>
	    <b><xsl:value-of select="@dm_product_name"/></b>
	    <xsl:text>', module: '</xsl:text>
	    <b><xsl:value-of select="@dm_module_name"/></b>
	    <xsl:text>'</xsl:text>
	  </td>
	</xsl:otherwise>
      </xsl:choose>
    </tr>
  </xsl:template>
  
  <xsl:template match="dm_current_dd_version">
    <tr>
      <td><xsl:text>Current DD version: </xsl:text></td>
      <td><b><xsl:value-of select="."/></b></td>
    </tr>
  </xsl:template>

  <xsl:template match="dm_version">
  </xsl:template>
  
  <xsl:template match="dm_external_name">
    <tr>
      <td><xsl:text>Dataset External Name: </xsl:text></td>
      <td><b><xsl:value-of select="."/></b></td>
    </tr>
  </xsl:template>

  <xsl:template match="dm_dataset">
    <tr>
      <td><xsl:text>Dataset Internal Name: </xsl:text></td>
      <td><b><xsl:value-of select="."/></b></td>
    </tr>
  </xsl:template>

  <xsl:template match="dm_alternative_path_name">
    <tr>
      <td><xsl:text>Alternative Path: </xsl:text></td>
      <td><b><xsl:value-of select="."/></b></td>
    </tr>
  </xsl:template>

  <xsl:template match="dm_ace_name">
    <tr>
      <td><xsl:text>Ace used: </xsl:text></td>
      <td><b><xsl:value-of select="."/></b></td>
    </tr>
  </xsl:template>
  <xsl:template match="dm_text_translation_disabled">
    <tr>
      <td><xsl:text>Text translations disabled?: </xsl:text></td>
      <td><b><xsl:value-of select="."/></b></td>
    </tr>
  </xsl:template>

  <xsl:template match="dm_active_languages">
  </xsl:template>
  
  <xsl:template match="dm_active_language">
    <tr>
      <td><xsl:text>Active language </xsl:text></td>
      <td><b><xsl:value-of select="."/></b></td>
    </tr>
  </xsl:template>
  
  <xsl:template match="datamodel_history">
    
    <div class="buttonbar float">	
      <xsl:call-template name="Button">
	<xsl:with-param name="function" select="'ToggleDMHistory();'"/>
	<xsl:with-param name="label" select="'Datamodel History'"/>
	<xsl:with-param name="state" select="'False'"/>
      </xsl:call-template>
    </div>

    <div class="dmHistory">
      <h3 class="float">Datamodel History Table</h3>
      <div class="ChapterInfo float">
	<xsl:value-of select="datamodel_history_meta"/>
      </div>
      <xsl:for-each select="datamodel_history_record">
	<div style="overflow-x:auto">
	  <table class="dmDataModelHistory float">
	    <xsl:for-each select="*">
	      <tr>
		<xsl:attribute name="class">
		  <xsl:value-of select="concat('Key',@key)"/>
		</xsl:attribute>
		<td>
		  <xsl:value-of select="name()"/>
		</td>
		<td>
		  <xsl:value-of select="."/>
		</td>
	      </tr>
	    </xsl:for-each>
	  </table>
	</div>
      </xsl:for-each>
    </div>

  </xsl:template>
  
  <!-- START Templates for a field and the properties of a field -->

  <xsl:template match="field">
    <xsl:element name="tr">

      <xsl:attribute name="class">
	<xsl:text>Field Vis</xsl:text>
	<xsl:value-of select="@visible"/>
	<xsl:if test="@mapped_to">
	  <xsl:text> MappedTo</xsl:text>
	</xsl:if>
	<xsl:if test="@mapped">
	  <xsl:text> Mapped</xsl:text>
	</xsl:if>
      </xsl:attribute>

      <xsl:apply-templates/>

    </xsl:element>
  </xsl:template>
  
  <xsl:template match="external_name">
    <td class="name">
      <xsl:element name="div">
	<xsl:attribute name="class">
	  <xsl:value-of select="../@type"/>
	</xsl:attribute>
	<xsl:value-of select="."/>
      </xsl:element>
    </td>
  </xsl:template>

  <xsl:template match="name">
    <td class="technical"><xsl:value-of select="."/></td>
  </xsl:template>
  
  <xsl:template match="key">
    <td class="technical"><xsl:value-of select="."/></td>
  </xsl:template>

  <xsl:template match="mandatory">
    <td class="technical"><xsl:value-of select="."/></td>
  </xsl:template>

  <!-- These are not (yet) defined in the output -->
  <xsl:template match="unset_value">
  </xsl:template>
  <xsl:template match="default_value">
  </xsl:template>

  <xsl:template match="help_text">
    <!-- basically the help_text, but a couple of cases
	 override this behavior to show specific details
    -->
    <td>
      <xsl:variable name="fldname" select="parent::field/name"/>
      <xsl:variable name="globaldescription" select="/datamodel/global_properties/commonfields/category/field[@name=$fldname]/@description"/>
      
      <xsl:choose>
	
	<xsl:when test="parent::field/field_sub_type/enumerated">			
	  <xsl:text>The values of </xsl:text>
	  <xsl:value-of select="parent::field/external_name"/>
	  <xsl:text> are controlled by the enumerator </xsl:text>
	  <xsl:variable name="enu" select="parent::field/field_sub_type/enumerated/@enumerator_name"/>
	  <xsl:text> </xsl:text>
	  <span class="name technical">
	    <a class="expandlink" onclick="ToggleId('{$enu}');" title="Click to Show/Hide details">
	      <xsl:value-of select="$enu"/>
	    </a>
	  </span>
	  <xsl:apply-templates select="/datamodel/enumerators/enumerator[@name=$enu]" mode="inline"/>
	</xsl:when>
	
	<xsl:when test="parent::field/@type='geometry'">					
	  <xsl:call-template name="geomdetails"/>
	</xsl:when>
	
	<xsl:when test="parent::field/@type='join'">					
	  <xsl:value-of select="."/>
	  <xsl:text></xsl:text>
	</xsl:when>
	
	<xsl:otherwise>
	  <xsl:choose>
	    <xsl:when test="$globaldescription != ''">
	      <span class="globaldescription">
		<xsl:value-of select="$globaldescription"/>
	      </span>
	    </xsl:when>
	    <xsl:otherwise>
	      <xsl:value-of select="."/>
	    </xsl:otherwise>
	  </xsl:choose>					
	</xsl:otherwise>
	
      </xsl:choose>
    </td>
  </xsl:template>
  
  <xsl:template match="field_type">
    <td class="technical"><xsl:value-of select="@type"/></td>
  </xsl:template>
  
  <xsl:template match="field_sub_type">
    <td class="technical">
      <xsl:apply-templates/>
    </td>
  </xsl:template>
  
  <xsl:template match="enumerated">
    <xsl:value-of select="@class"/>
  </xsl:template>

  <xsl:template match="phys_type">
    <xsl:value-of select="@type"/>
  </xsl:template>

  <xsl:template match="geom_type">
    <xsl:value-of select="@type"/>
  </xsl:template>
  
  <xsl:template match="geom_type" mode="inhelptext">
  </xsl:template>
  
  <xsl:template match="inmanifold">
    <xsl:text>(</xsl:text>
    <xsl:value-of select="@name"/>
    <xsl:text>)</xsl:text>
  </xsl:template>

  <xsl:template match="inmanifold" mode="inhelptext">
    <!-- to embed topology in the geom field -->
    <xsl:text>Manifold: </xsl:text>
    <span class="name">
      <xsl:value-of select="@name"/>
    </span>
    <xsl:text> </xsl:text>
    <xsl:variable name="tabname" select="../../../@name"/>
    <xsl:variable name="fldname" select="../../name"/>
    <span class="technical">
      <a>
	<xsl:attribute name="href">
	  <xsl:value-of select="concat('../',$filename5s,'#',$tabname,'.',$fldname)"/>
	</xsl:attribute>
	<xsl:text>(Topology)</xsl:text>
	<!-- <xsl:apply-templates select="//topology_interaction[@name=$tabname][@field_name=$fldname]"/> -->
      </a>
    </span>
  </xsl:template>

  <xsl:template match="mapped">
    <xsl:text>&#187;</xsl:text>
  </xsl:template>
  
  <xsl:template match="mapped" mode="inhelptext">
    <xsl:text>Mapping method: </xsl:text>
    <xsl:call-template name="text4mdm">
      <xsl:with-param name="mdm" select="@map_discriminator_method"/>
    </xsl:call-template>
    <!-- <xsl:value-of select="@map_discriminator_method"/> -->
  </xsl:template>

  <xsl:template match="mapped_to">
  </xsl:template>

  <xsl:template match="mapped_to" mode="inhelptext">
    <xsl:text> Mapped from: </xsl:text>
    <span class="geometry">
      <xsl:value-of select="@external_name"/>
    </span>
    <xsl:text> </xsl:text>
  </xsl:template>
  
  <xsl:template match="join_type">
    <xsl:variable name="subdir"/>
    <ul>
      <xsl:for-each select="target_table">
	<xsl:variable name="filename" select="concat($fn_prefix,@name,'.html')"/>
	<li class="Join">
	  <a href="{$filename}">
	    <xsl:value-of select="@external_name"/>
	  </a>
	</li>
      </xsl:for-each>
    </ul>
  </xsl:template>
  
  <xsl:template match="logical">
    <td class="technical">Logical</td>
  </xsl:template>
  
  <!-- END Templates for the properties of a field -->
  
  <xsl:template match="enumerator" mode="inline">
    <!-- The block that can be toggled in an enumerated field -->
    <table id="{@name}" class="InlineBox" style="display:none;">
      <tr class="HeadStyle">
	<th class="name" colspan="3">
	  <xsl:value-of select="@name"/>
	</th>
      </tr>
      <tr class="HeadStyle">
	<th class="technical">Type</th>
      </tr>
      <tr class="McTableRowStyle">
	<td class="technical"><xsl:value-of select="@type"/></td>
      </tr>
      <tr>
	<td colspan="3">
	  <ul class="EnumeratorValues">
	    <xsl:apply-templates/>
	  </ul>
	</td>
      </tr>
    </table>
  </xsl:template>

  <xsl:template match="enumerator">
    <!-- a table with all properties and values -->
    <table id="{@name}">
      <xsl:attribute name="class">
	<xsl:text>float </xsl:text>
	<xsl:text>dmEnumerator</xsl:text>
	<xsl:if test="//enumerated/@enumerator_name=@name">
	  <xsl:text> Used</xsl:text>
	</xsl:if>				
      </xsl:attribute>
      <tr class="HeadStyle">
	<th class="name" colspan="3">
	  <xsl:value-of select="@name"/>
	</th>
      </tr>
      <tr class="HeadStyle">
	<th class="technical">Type</th>
	<th class="technical">Domain Class</th>
	<th class="technical">Storage Class</th>
      </tr>
      <tr class="McTableRowStyle">
	<td class="technical"><xsl:value-of select="@type"/></td>
	<td class="technical"><xsl:value-of select="@domain_class"/></td>
	<td class="technical"><xsl:value-of select="@storage_class"/></td>
      </tr>
      <tr>
	<td colspan="3">
	  <ul class="EnumeratorValues">
	    <xsl:apply-templates/>
	  </ul>
	</td>
      </tr>
    </table>
  </xsl:template>
  
  <xsl:template match="enumerator/value">
    <li class="EnumeratorValue"><xsl:value-of select="."/></li>
  </xsl:template>
  
  <xsl:template match="commonfields">
    <h3 class="float">Commonly used fields</h3>
    <xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="geometry_mappings">
    <h3 class="float">Commonly used Geometry Mappings</h3>
    <xsl:if test="count(method) gt 0 ">
      <table class="dmTable float">
	<tr class="HeadStyle">
	  <th>Name</th>
	  <th>Description</th>
	</tr>
	<xsl:for-each select="method">
	  <tr>
	    <td><xsl:value-of select="@name"/></td>
	    <td><xsl:value-of select="."/></td>
	  </tr>
	</xsl:for-each>
      </table>
    </xsl:if>
  </xsl:template>

  
  <xsl:template match="default_topology_rules">
    <h3 class="float">Default Topology Rules</h3>
    <xsl:for-each select="manifold">
      <table class="dmTable float DefaultTopRules">
	<tr>
	  <th colspan="4">
	    <xsl:text>Manifold: </xsl:text>
	    <xsl:value-of select="@name"/>
	  </th>
	</tr>
	<xsl:apply-templates select="interaction"/>				
      </table>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="interaction">
    <tr>
      <td><xsl:value-of select="@geomtype1"/></td>
      <td><xsl:value-of select="@geomtype2"/></td>
      <td><xsl:value-of select="child::rule1"/></td>
      <td><xsl:value-of select="child::rule2"/></td>
    </tr>
  </xsl:template>

  
  <xsl:template match="commonfields/category">
    <table class="dmtable float">
      <tr class="HeadStyle">
	<th class="name" colspan="3">
	  <xsl:value-of select="@name"/>
	</th>	
      </tr>
      <tr class="HeadStyle">
	<th><xsl:text>Property</xsl:text></th>
	<th class="technical"><xsl:text>Internal name</xsl:text></th>
	<th><xsl:text>Description</xsl:text></th>
      </tr>
      <xsl:for-each select="field">
	<tr>
	  <td class="name">
	    <xsl:value-of select="@external_name"/>
	  </td>
	  <td class="InternalName technical">
	    <xsl:value-of select="@name"/>
	  </td>
	  <td>
	    <xsl:value-of select="@description"/>
	  </td>
	</tr>
      </xsl:for-each>
    </table>
  </xsl:template>

  <!-- soft joins processing -->
  
  <xsl:template match="soft_join_collection">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="soft_join_collection" mode="list">

    <xsl:variable name="intname" select="@name"/>
    <div style="overflow-x:auto">
      <table class="softjoins float">
	<tr>
	  <th colspan="2">
	    <xsl:text>Soft joins of </xsl:text>
	    <span class="name">
	      <xsl:value-of select="//collection[@name=$intname]/@external_name"/>
	    </span>
	    (<xsl:value-of select="@name"/>)
	  </th>
	</tr>
	
	<xsl:apply-templates mode="list"/>
	
      </table>
    </div>
  </xsl:template>
  
  <xsl:template match="soft_join" mode="list">
    <!-- creates a table with soft joins -->
    <table class="softjoins float">
      <xsl:attribute name="id">
	<xsl:value-of select="parent::soft_join_collection/@name"/>
	<xsl:text>_</xsl:text>
	<xsl:value-of select="join_method_name"/>
      </xsl:attribute>
      <tr>
	<th class="softjoin" colspan="2">
	  <xsl:value-of select="join_name"/>
	</th>
      </tr>
      <xsl:for-each select="child::*">
	<tr>
	  <td><xsl:value-of select="name(.)"/></td>
	  <td><xsl:value-of select="."/></td>
	</tr>
      </xsl:for-each>
    </table>
  </xsl:template>

  
  <xsl:template match="soft_join">
    <!-- template that constructs a table for soft join fields of a collection -->
    
    <xsl:variable name="target_table" select="join_table"/>
    <xsl:variable name="target_url" select="concat($fn_prefix,$target_table,'.html')"/>
    <xsl:variable name="target_table_external_name" select="//collection[@name=$target_table]/@external_name"/>
    <tr class="SoftJoin VisFalse">
      <td class="name"><xsl:value-of select="join_name"/></td>
      <td class="technical"><xsl:value-of select="join_method_name"/></td>
      <td class="technical">Soft Join</td>
      <td class="technical">
	<a class="SoftJoin" href="{$target_url}">
	  <xsl:value-of select="$target_table_external_name"/>
	</a>
      </td>
      <td class="technical">False</td>
      <td class="technical">False</td>
      <td>
	<xsl:text>Returns records from </xsl:text>
	<xsl:value-of select="$target_table_external_name"/>
	<xsl:text>. See the </xsl:text>
	<a class="SoftJoin">
	  <xsl:attribute name="href">
	    <xsl:value-of select="concat($fn_prefix,'soft_joins','.html')"/>
	    <xsl:text>#</xsl:text>
	    <xsl:value-of select="parent::soft_join_collection/@name"/>
	    <xsl:text>_</xsl:text>
	    <xsl:value-of select="join_method_name"/>
	  </xsl:attribute>
	  <xsl:text>definition</xsl:text>
	</a>
      </td>
    </tr>

  </xsl:template>
  
  <!-- NAMED TEMPLATES -->
  
  <!-- Date of html and date of xml -->
  <xsl:template name="document_info">
    <xsl:variable name="currentDate" as="xs:date" select="current-date()"/>
    <div style="overflow-x:auto">
      <table class="dmtable float">
 	<tr class="Info">
	  <th colspan="2">
	    <xsl:text>Document Information</xsl:text>				
	  </th>
	</tr>
 	<tr class="Info">
	  <td>
	    <xsl:text>Document Generation Date</xsl:text>				
	  </td>
	  <td>
	    <b><xsl:value-of select="$currentDate"/></b>
	  </td>
	</tr>
 	<tr class="Info">
	  <td>
	    <xsl:text>XML Document Generation Date</xsl:text>				
	  </td>
	  <td>
	    <b><xsl:value-of select="/datamodel/@creation_date"/></b>
	  </td>
	</tr>
      </table>
    </div>
  </xsl:template>

  <xsl:template name="collectionlist">
    <xsl:param name="path"/>
    <div class="overview">
      
      <div class="buttonbar float">
	<xsl:call-template name="Button">
	  <xsl:with-param name="function" select="'ToggleDetail();'"/>
	  <xsl:with-param name="label" select="'Details'"/>
	  <xsl:with-param name="state" select="'True'"/>
	</xsl:call-template>
      </div>
      
      <xsl:for-each select="datamodel/category">
	<div style="overflow-x:auto">
	  <table class="dmTable float">
	    <tr class="HeadStyle">
	      <th class="name" colspan="3"><xsl:value-of select="@name"/></th>
	    </tr>
	    <tr class="HeadStyle">
	      <th>
		<xsl:text>Name</xsl:text>
	      </th>
	      <th class="technical">
		<xsl:text>Internal name</xsl:text>
	      </th>
	      <th>
		<xsl:text>Description</xsl:text>
	      </th>
	    </tr>
	    <xsl:for-each select="collection">
	      <xsl:variable name="filename" select="concat($fn_prefix,@name,'.html')"/>
	      <tr class="overview">
		<td class="overview_name">

		  <xsl:element name="a">
		    <xsl:attribute name="href">
		      <xsl:value-of select="$filename"/>
		    </xsl:attribute>
		    <xsl:attribute name="class">
		      <xsl:text>CollectionLink</xsl:text>
		    </xsl:attribute>
		    <xsl:value-of select="@external_name"/>
		  </xsl:element>
		  
		</td>
		<td class="InternalName technical">
		  <xsl:value-of select="@name"/>
		</td>
		<td class="overview_description">
		  <xsl:value-of select="@description"/>
		</td>
	      </tr>
	    </xsl:for-each>
	  </table>					
	</div>
      </xsl:for-each>
    </div>
  </xsl:template>
  
  <xsl:template name="CollectionPages">
    <xsl:param name="subdir"/>

    <xsl:for-each select="datamodel/category/collection">
      <xsl:variable name="filename" select="concat($path_prefix,@name,'.html')"/>
      
      <xsl:result-document href="{$filename}" format="html">
	
	<html>
	  
	  <xsl:call-template name="HtmlHeader">
	    <xsl:with-param name="path" select="'../'"/>
	    <xsl:with-param name="title" select="concat($dm_external_name,' - Collection ',@external_name)"/>
	  </xsl:call-template>

	  <body onload="HighlightHash()">
	    <xsl:call-template name="Top">
	      <xsl:with-param name="path" select="'../'"/>
	    </xsl:call-template>

	    <div class="PageTitle float">
	      <xsl:value-of select="@external_name"/>
	    </div>

	    <div class="buttonbar float">
	      <xsl:call-template name="Button">
		<xsl:with-param name="function" select="'ToggleDetail();'"/>
		<xsl:with-param name="label" select="'Technical details'"/>
		<xsl:with-param name="state" select="'True'"/>
	      </xsl:call-template>							
	      <xsl:call-template name="Button">
		<xsl:with-param name="function" select="'ToggleMapped();'"/>
		<xsl:with-param name="label" select="'Mapped fields'"/>
		<xsl:with-param name="state" select="'True'"/>
	      </xsl:call-template>
	      <!-- <xsl:call-template name="Button"> -->
	      <!--   <xsl:with-param name="function" select="'ToggleTopology();'"/> -->
	      <!--   <xsl:with-param name="label" select="'Topology'"/> -->
	      <!--   <xsl:with-param name="state" select="'True'"/> -->
	      <!-- </xsl:call-template> -->
	      <xsl:call-template name="Button">
		<xsl:with-param name="function" select="'ToggleInVisField();'"/>
		<xsl:with-param name="label" select="'Invisible fields'"/>
		<xsl:with-param name="state" select="'False'"/>
	      </xsl:call-template>
	    </div>
	    
	    <div style="overflow-x:auto">
	      <table class="dmCollection float" id="{@name}">
		<tr class="TableName">
		  <td colspan="7"><h3 class="InTable"><xsl:value-of select="@external_name"/></h3></td>
		</tr>
		<tr class="TableCategory">
		  <td colspan="7">Category: <xsl:value-of select="ancestor::category/@name"/></td>
		</tr>
		<tr>
		  <td colspan="7" class="description">
		    <xsl:value-of select="@description"/>
		  </td>
		</tr>
		<tr class="HeadStyle">
		  <th>Name</th>
		  <th class="technical">Internal name</th>
		  <th class="technical">Type</th>
		  <th class="technical">Sub type</th>
		  <th class="technical">Key?</th>
		  <th class="technical">Mandatory?</th>
		  <th>Description</th>
		</tr>

		<xsl:apply-templates/>

		<xsl:call-template name="softjoinsfor">
		  <xsl:with-param name="name">
		    <xsl:value-of select="@name"/>
		  </xsl:with-param>
		</xsl:call-template>

	      </table>
	    </div>
	    <xsl:call-template name="footer">
	      <xsl:with-param name="helppath" select="$pathtohelp"/>
	      <xsl:with-param name="topic" select="'Collection_Page'"/>

	    </xsl:call-template>
	  </body>
	</html>
      </xsl:result-document>
    </xsl:for-each>
  </xsl:template>
  

  
  <xsl:template name="geomdetails">
    <xsl:apply-templates select="parent::field/field_sub_type/*" mode="inhelptext">
    </xsl:apply-templates>
  </xsl:template>

  <xsl:template name="text4mdm">
    <xsl:param name="mdm"/>
    <xsl:variable name="mdmdesc" select="/datamodel/global_properties/geometry_mappings/method[@name=$mdm]"/>
    <xsl:choose>
      <xsl:when test="$mdmdesc != ''">
	<xsl:value-of select="concat($mdm,' (',$mdmdesc,')')"/>
      </xsl:when>
      <xsl:otherwise>
	<xsl:value-of select="concat($mdm,' [missing description]')"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="softjoinsfor">
    <xsl:param name="name"/>
    <xsl:apply-templates select="/datamodel/soft_joins/soft_join_collection[@name=$name]"/>
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

  <xsl:template name="PageWithFilter">
    <!--
	Create a page with a list that can be filtered
    -->
    <xsl:param name="elemclass"/>  <!-- the object type to select -->
    <xsl:param name="selectList"/> <!-- the list of objects -->
    <xsl:param name="select"/>     <!-- the xpath expression for the element transforms -->

    <xsl:variable name="aps">&apos;</xsl:variable>
    
    <div class="container">
      <div style="text-align: center;">  
	<input type="checkbox" id="ToggleList" name="ToggleList" onclick="{concat('ToggleElements(',$aps,$elemclass,$aps,')')}" checked="checked"/>
	<label for="ToggleList">Show all</label>
      </div>

      <div class="navbox">
	<input class="filterbutton" type="text" id="FilterItem" onkeyup="Filter()" title="Type string to filter" placeholder="Filter..."/>
	<input class="ClearFilter" type="image" onclick="ClearFilter()" title="Click to clear filter" src="../clear.png"/>
	
	<div id="ListLinks">
	  <!-- list of elements -->
	  <xsl:for-each select="$selectList">
	    <div>
	      <a name="{@name}" class="ListLink" href="#" onclick="{concat('ShowElement(',$aps,@name,$aps,',',$aps,$elemclass,$aps,')')}">
		<xsl:value-of select="@name"/>
	      </a>
	    </div>
	  </xsl:for-each>
	</div>
      </div>
      
      <div class="elementbox">
	<!-- element tables here -->
	<xsl:apply-templates select="$select"/>	
      </div>
      
    </div>		 
  </xsl:template>
  
</xsl:stylesheet>

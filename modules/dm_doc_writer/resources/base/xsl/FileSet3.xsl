<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    version="2.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:dmdw="https://boogert-lab.nl/dmdw">

  <!-- The output html filename passed as extras parameter to saxon -->
  <xsl:param name="OFileName"/>
  <!-- The name of the svg file with the graphics datamodel passed as parameter to saxon -->
  <xsl:param name="SVGName"/>
  <xsl:param name="SVGPath"/>
  
  <xsl:output method="html" indent="yes" name="html"/>

  <xsl:variable name="MasterTemplateVersion" select="'2.1'"/>

  <!-- The supported dmdw schema version -->
  <xsl:variable name="supported_schema_version" select="'2.0'"/>
  
  <xsl:variable name="XSLTProcessor" select="'saxon-he-10.2 from Saxonica'"/>
  
  <xsl:include href="Common.xsl"/>
  <xsl:include href="Custom.xsl"/>
  <xsl:include href="ProcessingTemplates.xsl"/>
  <xsl:include href="ChapterTemplates.xsl"/>
  <xsl:include href="TopologyFunctions.xsl"/>
  
  <xsl:variable name="dsname" select="/datamodel/datamodel_info/dm_dataset"/>
  <xsl:variable name="ddversion" select="/datamodel/datamodel_info/dm_current_dd_version"/>
  <xsl:variable name="dm_external_name" select="/datamodel/datamodel_info/dm_external_name"/>

  <xsl:variable name="fn_prefix" select="concat($dsname,'_')"/>
  <xsl:variable name="subdir" select="concat($fn_prefix,'pages/')"/>
  <xsl:variable name="path_prefix" select="concat($subdir,$dsname,'_')"/>

  <!-- <xsl:variable name="filename0" select="document-uri(.)"/> -->
  <xsl:variable name="filename0" select="$OFileName"/>
  <xsl:variable name="master" select="concat('../',$filename0)"/>

  <!-- Path to help in seperate html files in subdir-->  
  <xsl:variable name="pathtohelp" select="'../help/index.html'"/>
  <!-- Path to help in master (TOC) html file -->  
  <xsl:variable name="pathtohelpMaster" select="'help/index.html'"/>

  
  <xsl:variable name="maintitle" select="'Datamodel information'"/>
  
  <xsl:variable name="filename1" select="concat($path_prefix,'technical_details.html')"/>
  <xsl:variable name="filename2" select="concat($path_prefix,'collections.html')"/>
  <xsl:variable name="filename3" select="concat($path_prefix,'global_properties.html')"/>
  <xsl:variable name="filename4" select="concat($path_prefix,'enumerators.html')"/>
  <xsl:variable name="filename4s" select="concat($path_prefix,'enumerators_static.html')"/>
  <xsl:variable name="filename5" select="concat($path_prefix,'topology.html')"/>
  <xsl:variable name="filename5s" select="concat($path_prefix,'topology_static.html')"/>
  <xsl:variable name="filename6" select="concat($path_prefix,'soft_joins.html')"/>
  <xsl:variable name="filename7" select="concat($path_prefix,'dm_svg.html')"/>

  <xsl:variable name="aps">&apos;</xsl:variable>

  <!-- This is the main template -->
  <xsl:template match="/">

    <!-- Page with a Datamodel Image -->
    <xsl:if test="$SVGName">
      <xsl:result-document href="{$filename7}" format="html">
	<xsl:call-template name="SVGPage"/>
      </xsl:result-document>
    </xsl:if>

    <!-- TOC page -->
    <xsl:call-template name="TocPage"/>

    <!-- Technical details page -->
    <xsl:result-document href="{$filename1}" format="html">
      <xsl:call-template name="TechDetailsPage"/>
    </xsl:result-document>
    
    <!-- Collection list -->
    <xsl:result-document href="{$filename2}" format="html">
      <xsl:call-template name="CollectionListPage"/>	
    </xsl:result-document>

    <!-- Global properties -->
    <xsl:result-document href="{$filename3}" format="html">
      <xsl:call-template name="GlobalPropertiesPage"/>	
    </xsl:result-document>

    <!-- Seperate Pages for the details of the collections -->
    <xsl:call-template name="CollectionPages">
      <xsl:with-param name="subdir" select="$subdir"/>	
    </xsl:call-template>
    
    <!-- Enumerator listing Interactive -->
    <xsl:result-document href="{$filename4}" format="html">
      <xsl:call-template name="EnumeratorPageInteractive"/>
    </xsl:result-document>
    
    <!-- Enumerator listing Static -->
    <xsl:result-document href="{$filename4s}" format="html">
      <xsl:call-template name="EnumeratorPageStatic"/>
    </xsl:result-document>

    <!-- Topology Interactive -->
    <xsl:result-document href="{$filename5}" format="html">
      <xsl:call-template name="TopologyInteractivePage"/>
    </xsl:result-document>
    
    <!-- Topology Static -->
    <xsl:result-document href="{$filename5s}" format="html">
      <xsl:call-template name="TopologyStaticPage"/>
    </xsl:result-document>
    
    <!-- Soft joins (if any) -->
    <xsl:if test="/datamodel/soft_joins">
      <xsl:result-document href="{$filename6}" format="html">
	<xsl:call-template name="SoftJoinsPage"/>
      </xsl:result-document>			
    </xsl:if>

  </xsl:template>
    
</xsl:stylesheet>

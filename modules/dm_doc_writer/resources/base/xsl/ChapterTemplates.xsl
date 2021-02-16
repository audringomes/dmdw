<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    version="2.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:dmdw="https://boogert-lab.nl/dmdw"
    xmlns:xlink="http://www.w3.org/1999/xlink">
  
  <xsl:template name="SVGPage">
    <html>
      
      <xsl:call-template name="HtmlHeader">
	<xsl:with-param name="path" select="'../'"/>
	<xsl:with-param name="title" select="concat($dm_external_name,' ',$diagram_title)"/>
      </xsl:call-template>

      <body onload="HighlightHash()">

	<xsl:call-template name="Top">
	  <xsl:with-param name="path" select="'../'"/>
	</xsl:call-template>

	<div class="PageTitle float"><xsl:value-of select="$diagram_title"/></div>

	<div class="buttonbar float">
	  <xsl:call-template name="Button">
	    <xsl:with-param name="function" select="'ToggleCo()'"/>
	    <xsl:with-param name="label" select="'Objects'"/>
	    <xsl:with-param name="state" select="'True'"/>
	  </xsl:call-template>	  
	  <xsl:call-template name="Button">
	    <xsl:with-param name="function" select="'ToggleCrel()'"/>
	    <xsl:with-param name="label" select="'Relations'"/>
	    <xsl:with-param name="state" select="'True'"/>
	  </xsl:call-template>
	  <xsl:call-template name="Button">
	    <xsl:with-param name="function" select="'ToggleCHrel();'"/>
	    <xsl:with-param name="label" select="'Heterogeneous relations'"/>
	    <xsl:with-param name="state" select="'True'"/>
	  </xsl:call-template>
	</div>
	
	<div class="svgwrapper float">
	  <xsl:copy-of select="document($SVGPath)"/>
	</div>
	
	<xsl:call-template name="footer">
	  <xsl:with-param name="helppath" select="$pathtohelp"/>
	  <xsl:with-param name="topic" select="'SVGMap'"/>
	</xsl:call-template>

      </body>
    </html>
  </xsl:template>
    
  <xsl:template name="TocPage">
    <html> 			
      <xsl:call-template name="HtmlHeader">
	<xsl:with-param name="path" select="''"/>
	<xsl:with-param name="title" select="concat($dm_external_name,' - ',$toc_title)"/>
      </xsl:call-template>

      <body onload="HighlightHash()">

	<xsl:call-template name="Top">
	  <xsl:with-param name="path" select="''"/>
	</xsl:call-template>

	<div class="PageTitle float"><xsl:value-of select="$toc_title"/></div>
	<nav class="float">
	  <ul>
	    <li><a href="{$filename1}"><xsl:value-of select="$tech_title"/></a></li>
	    <li><a href="{$filename3}"><xsl:value-of select="$global_props_title"/></a></li>
	    <xsl:if test="$SVGName">
	      <li><a href="{$filename7}"><xsl:value-of select="$diagram_title"/></a></li>
	    </xsl:if>
	    <li><a href="{$filename2}"><xsl:value-of select="$collections_title"/></a></li>
	    <li><a href="{$filename4s}"><xsl:value-of select="$enum_static_title"/></a></li>
	    <li><a href="{$filename4}"><xsl:value-of select="$enum_interactive_title"/></a></li>
	    <li><a href="{$filename5s}"><xsl:value-of select="$topology_static_title"/></a></li>
	    <li><a href="{$filename5}"><xsl:value-of select="$topology_interactive_title"/></a></li>
	    <xsl:if test="/datamodel/soft_joins">
	      <li><a href="{$filename6}"><xsl:value-of select="$soft_joins_title"/></a></li>
	    </xsl:if>
	  </ul>
	</nav>

	<xsl:call-template name="footer">
	  <xsl:with-param name="helppath" select="$pathtohelpMaster"/>
	  <xsl:with-param name="topic" select="'Pages'"/>
	</xsl:call-template>

      </body>
    </html>
  </xsl:template>

  
  <xsl:template name="TechDetailsPage">
    <!-- Technical Details Page -->
    
    <html>
      <xsl:call-template name="HtmlHeader">
	<xsl:with-param name="path" select="'../'"/>
	<xsl:with-param name="title" select="concat($dm_external_name,' - Technical details')"/>
      </xsl:call-template>
      
      <body onload="HighlightHash()">
	<xsl:call-template name="Top">
	  <xsl:with-param name="path" select="'../'"/>
	</xsl:call-template>
	<div class="PageTitle float"><xsl:value-of select="$tech_title"/></div>
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
    
  </xsl:template>

  
  <xsl:template name="CollectionListPage">
    
    <html>
      <xsl:call-template name="HtmlHeader">
	<xsl:with-param name="path" select="'../'"/>
	<xsl:with-param name="title" select="concat($dm_external_name,' - List of Collections')"/>
      </xsl:call-template>
      
      <body onload="HighlightHash()">
	<xsl:call-template name="Top">
	  <xsl:with-param name="path" select="'../'"/>
	</xsl:call-template>
	<div class="PageTitle float"><xsl:value-of select="$collections_title"/></div>
	<div class="ChapterInfo float">
	  <xsl:call-template name="collections_info"/>
	</div>
	<xsl:call-template name="collectionlist">
	  <xsl:with-param name="path" select="''"/>
	</xsl:call-template>

	<xsl:call-template name="footer">
	  <xsl:with-param name="helppath" select="$pathtohelp"/>
	  <xsl:with-param name="topic" select="'CollectionList'"/>
	</xsl:call-template>

      </body>
    </html>
  </xsl:template>

  <xsl:template name="GlobalPropertiesPage">
    <html>
      <xsl:call-template name="HtmlHeader">
	<xsl:with-param name="path" select="'../'"/>
	<xsl:with-param name="title" select="concat($dm_external_name,' - Global properties')"/>
      </xsl:call-template>

      <body onload="HighlightHash()">
	<xsl:call-template name="Top">
	  <xsl:with-param name="path" select="'../'"/>
	</xsl:call-template>
	<div class="PageTitle float"><xsl:value-of select="$global_props_title"/></div>
	<div class="ChapterInfo float">
	  <xsl:call-template name="global_properties_info"/>
	</div>
	<xsl:for-each select="datamodel/global_properties">
	  <xsl:apply-templates/>
	</xsl:for-each>

	<xsl:call-template name="footer">
	  <xsl:with-param name="helppath" select="$pathtohelp"/>
	  <xsl:with-param name="topic" select="'Global-Properties-Page'"/>
	</xsl:call-template>
      </body>
      
    </html>
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
		<xsl:with-param name="state" select="'False'"/>
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
	      <!-- Link to diagram -->
	      <xsl:if test="$SVGName">
		<span class="Checkbutton">
		  <a class="svglink">
		    <xsl:attribute name="href" select="concat($svg_file_name,'#',@name)"/>
		    <img src="../svglink.png"/>
		    <xsl:text>Show in Diagram</xsl:text>
		  </a>
		</span>
	      </xsl:if>
	    </div>

	    <xsl:variable name="numcols" select="9"/>
	    <div style="overflow-x:auto">
	      <table class="dmCollection float" id="{@name}">
		<tr class="TableName">
		  <td colspan="{$numcols}">
		    <h3 class="InTable"><xsl:value-of select="@external_name"/></h3>
		    <div class="technical InternalColName"><xsl:value-of select="@name"/></div>
		  </td>
		</tr>
		<tr class="TableCategory">
		  <td colspan="{$numcols}">Category: <xsl:value-of select="ancestor::category/@name"/></td>
		</tr>
		<tr>
		  <td colspan="{$numcols}" class="description">
		    <xsl:value-of select="@description"/>
		  </td>
		</tr>

		<tr class="HeadStyle">
		  <th>Name</th>
		  <th class="technical">Internal name</th>
		  <th class="technical">Size</th>
		  <th class="technical">Key?</th>
		  <th class="technical">Mandatory?</th>
		  <th class="technical">Type</th>
		  <th class="technical">Unit</th>
		  <th class="technical">Sub type</th>
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

  
  <xsl:template name="EnumeratorPageInteractive">
    <html>
      
      <xsl:call-template name="HtmlHeader">
	<xsl:with-param name="path" select="'../'"/>
	<xsl:with-param name="title" select="concat($dm_external_name,' - List of Enumerators')"/>
      </xsl:call-template>
      
      <body onload="HighlightHash()">

	<xsl:call-template name="Top">
	  <xsl:with-param name="path" select="'../'"/>
	</xsl:call-template>
	<div class="PageTitle float"><xsl:value-of select="$enum_interactive_title"/></div>
	<div class="ChapterInfo float">
	  <xsl:call-template name="enumerators_info"/>
	</div>
	
	<div>
	  <xsl:call-template name="PageWithFilter">
	    <xsl:with-param name="elemclass" select="'dmEnumerator'"/>
	    <xsl:with-param name="selectList" select="datamodel/enumerators/enumerator"/>
	    <xsl:with-param name="select" select="datamodel/enumerators/enumerator"/>
	  </xsl:call-template>
	</div>
	
	<xsl:call-template name="footer">
	  <xsl:with-param name="helppath" select="$pathtohelp"/>
	  <xsl:with-param name="topic" select="'Interactive-Enumerators-Page'"/>
	</xsl:call-template>
	
      </body>
    </html>
  </xsl:template>


  <xsl:template name="EnumeratorPageStatic">
    <html>
      
      <xsl:call-template name="HtmlHeader">
	<xsl:with-param name="path" select="'../'"/>
	<xsl:with-param name="title" select="concat($dm_external_name,' - List of Enumerators')"/>
      </xsl:call-template>
      
      <body onload="HighlightHash()">

	<xsl:call-template name="Top">
	  <xsl:with-param name="path" select="'../'"/>
	</xsl:call-template>
	<div class="PageTitle float"><xsl:value-of select="$enum_static_title"/></div>
	<div class="ChapterInfo float">
	  <xsl:call-template name="enumerators_info_static"/>
	</div>
	
	<div class="container">
	  <xsl:for-each select="datamodel/enumerators">
	    <xsl:apply-templates/>
	  </xsl:for-each>
	</div>
	
	<xsl:call-template name="footer">
	  <xsl:with-param name="helppath" select="$pathtohelp"/>
	  <xsl:with-param name="topic" select="'Enumerator_Page'"/>
	</xsl:call-template>
	
      </body>
    </html>
  </xsl:template>

      
  <xsl:template name="TopologyInteractivePage">
    <html>
      
      <xsl:call-template name="HtmlHeader">
	<xsl:with-param name="path" select="'../'"/>
	<xsl:with-param name="title" select="concat($dm_external_name,' - Topology Rules')"/>
      </xsl:call-template>

      <body onload="HighlightHash()">
	
	<xsl:call-template name="Top">
	  <xsl:with-param name="path" select="'../'"/>
	</xsl:call-template>
	<div class="PageTitle float"><xsl:value-of select="$topology_interactive_title"/></div>
	<div class="ChapterInfo float">
	  <xsl:call-template name="topology_info_interactive"/>
	</div>
	
	<xsl:call-template name="CreateTopologyContentInteractive"/>
	
	<xsl:call-template name="footer">
	  <xsl:with-param name="helppath" select="$pathtohelp"/>
	  <xsl:with-param name="topic" select="'Int_Topology_Page'"/>
	</xsl:call-template>

      </body>
    </html>
  </xsl:template>

  
  <xsl:template name="TopologyStaticPage">
    <html>
      <xsl:call-template name="HtmlHeader">
	<xsl:with-param name="path" select="'../'"/>
	<xsl:with-param name="title" select="concat($dm_external_name,' - Topology Rules')"/>
      </xsl:call-template>

      <body onload="HighlightHash()">
	
	<xsl:call-template name="Top">
	  <xsl:with-param name="path" select="'../'"/>
	</xsl:call-template>
	<div class="PageTitle float"><xsl:value-of select="$topology_static_title"/></div>
	<div class="ChapterInfo float">
	  <xsl:call-template name="topology_info_static"/>
	</div>
	
	<div class="buttonbar float">
	  <xsl:call-template name="Button">
	    <xsl:with-param name="function" select="'ToggleExplicitTopologyRules();'"/>
	    <xsl:with-param name="label" select="'Explicit Rules only'"/>
	    <xsl:with-param name="state" select="'True'"/>
	  </xsl:call-template>
	</div>
	
	<xsl:call-template name="CreateTopologyContentStatic"/>
	
	<xsl:call-template name="footer">
	  <xsl:with-param name="helppath" select="$pathtohelp"/>
	  <xsl:with-param name="topic" select="'Static_Topology_Page'"/>
	</xsl:call-template>	
      </body>      
    </html>    
  </xsl:template>


  <xsl:template name="SoftJoinsPage">
    <html>
      
      <xsl:call-template name="HtmlHeader">
	<xsl:with-param name="path" select="'../'"/>
	<xsl:with-param name="title" select="concat($dm_external_name,' - Soft Joins')"/>
      </xsl:call-template>
      
      <body onload="HighlightHash()">

	<xsl:call-template name="Top">
	  <xsl:with-param name="path" select="'../'"/>
	</xsl:call-template>
	<div class="PageTitle float"><xsl:value-of select="$soft_joins_title"/></div>
	<div class="ChapterInfo float">
	  <xsl:call-template name="soft_joins_info"/>
	</div>

	<xsl:apply-templates select="/datamodel/soft_joins" mode="list"/>
	
	<xsl:call-template name="footer">
	  <xsl:with-param name="helppath" select="$pathtohelp"/>
	  <xsl:with-param name="topic" select="'SoftJoins_Page'"/>
	</xsl:call-template>

      </body>
    </html>
  </xsl:template>
  
</xsl:stylesheet>

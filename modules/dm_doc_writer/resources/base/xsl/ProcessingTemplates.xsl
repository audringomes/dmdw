<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    version="2.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:dmdw="https://boogert-lab.nl/dmdw">
  
  <!-- DATA PROCESSING TEMPLATES -->
  
  <xsl:template match="software_version">
    <div style="overflow-x:auto">
      <table class="dmTableSoft float technical">
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
      <table class="dmTableInfo float">
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
	<xsl:when test=".='0'">
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

  <xsl:template match="dm_updates">
    <tr>
      <td><xsl:text>Update file: </xsl:text></td>
      <td><b><xsl:value-of select="."/></b></td>
    </tr>
  </xsl:template>

  <xsl:template match="dm_text_translation_disabled">
    <tr>
      <td><xsl:text>Text translations disabled?</xsl:text></td>
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

  <xsl:template match="dm_include_urns">
    <tr>
      <td><xsl:text>Include URN's?</xsl:text></td>
      <td><b><xsl:value-of select="."/></b></td>
    </tr>
  </xsl:template>

  <xsl:template match="dm_expand_tables">
    <tr>
      <td><xsl:text>Include intermediate tables?</xsl:text></td>
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
	    <colgroup>
	      <col width="30%"/>
	      <col width="60%"/>
	    </colgroup>
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
      
      <xsl:attribute name="id">
	<xsl:value-of select="child::name"/>
      </xsl:attribute>

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

  <xsl:template match="used_in_join">
    <!-- To be done -->
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
  
  <xsl:template match="size">
    <td class="technical">
      <xsl:value-of select="."/>
    </td>
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

  <xsl:template match="stored_unit">
    <td class="technical"><xsl:value-of select="child::short_description"/></td>
  </xsl:template>
  
  <xsl:template match="help_text">
    <!-- basically the help_text, but a couple of cases
	 override this behavior to show specific details
    -->
    <td>
      <xsl:variable name="fldname" select="parent::field/name"/>
      <xsl:variable name="globaldescription" select="/datamodel/global_properties/commonfields/group/field[@name=$fldname]/@description"/>
      
      <xsl:choose>
	
	<xsl:when test="parent::field/sub_type/sw_field_type/enumerated">			
	  <xsl:text>The values of </xsl:text>
	  <span class="name"><xsl:value-of select="parent::field/external_name"/></span>
	  <xsl:text> are controlled by the enumerator </xsl:text>
	  <xsl:variable name="enu" select="parent::field/sub_type/sw_field_type/enumerated/@name"/>
	  <xsl:text> </xsl:text>
	  <span class="name">
	    <a class="expandlink" onclick="ToggleId('enu.{$enu}');" title="Click to Show/Hide details">
	      <xsl:value-of select="$enu"/>
	    </a>
	  </span>
	  <xsl:apply-templates select="/datamodel/enumerators/enumerator[@name=$enu]" mode="inline"/>
	</xsl:when>
	
	<xsl:when test="parent::field/@type='geometry'">					
	  <xsl:call-template name="geomdetails"/>
	</xsl:when>
	
	<xsl:when test="parent::field/@type='join'">					
	  <div><xsl:value-of select="."/></div>
	  <xsl:call-template name="joindetails"/>
	</xsl:when>
	
	<xsl:otherwise>
	  <xsl:choose>
	    <xsl:when test="$globaldescription != ''">
	      <span class="GlobalDescription">
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
  
  <xsl:template match="type">
    <td class="technical">
      <xsl:value-of select="."/>
    </td>
  </xsl:template>

  <xsl:template match="sub_type">
    <td class="technical">
      <xsl:apply-templates/>
    </td>
  </xsl:template>

  <xsl:template match="sw_field_type">
    <xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="enumerated">
    <xsl:value-of select="@class"/>
  </xsl:template>

  <xsl:template match="phys_type">
    <xsl:value-of select="@type"/>
  </xsl:template>

  <xsl:template name="joindetails">
    <!-- Named template for details in helptext -->
    <xsl:apply-templates select="parent::field/sub_type/join_details" mode="inhelptext"/>
  </xsl:template>
  
  <xsl:template match="join_details">
    <xsl:value-of select="@type"/>
  </xsl:template>

  <xsl:template match="text_join">
    <!-- nothing, we add info in description -->
  </xsl:template>
  
  <xsl:template match="join_details" mode="inhelptext">
    <xsl:apply-templates mode="inhelptext"/>
  </xsl:template>

  <xsl:template name="int_join_details">
    <div class="JoinDetails technical">
      <xsl:attribute name="id">
	<xsl:value-of select="ancestor::field/name"/>
	<xsl:text>.details</xsl:text>
      </xsl:attribute>
      <xsl:attribute name="style">
	<xsl:text>display:none;</xsl:text>
      </xsl:attribute>
      <ul class="joinDetailsList">
	<li class="joinDetailsListItem">
	  <xsl:text>Heterogeneous? </xsl:text>
	  <span class="results"><xsl:value-of select="@heterogeneous"/></span>
	</li>
	<li class="joinDetailsListItem">
	  <xsl:text>Simple result? </xsl:text>
	  <span class="results"><xsl:value-of select="@simple_result"/></span>
	</li>
	<xsl:apply-templates mode="inhelptext"/>
      </ul>
    </div>
  </xsl:template>
  
  <xsl:template match="follow" mode="inhelptext">
    <xsl:call-template name="int_join_details"/>
  </xsl:template>

  <xsl:template match="db_set_value" mode="inhelptext">
    <xsl:call-template name="int_join_details"/>
  </xsl:template>

  <xsl:template match="db_set_join" mode="inhelptext">
    <xsl:call-template name="int_join_details"/>
  </xsl:template>

  <xsl:template match="db_rope_value" mode="inhelptext">
    <xsl:call-template name="int_join_details"/>
  </xsl:template>

  <xsl:template match="db_rope_join" mode="inhelptext">
    <xsl:call-template name="int_join_details"/>
  </xsl:template>
  
  <xsl:template match="text_join" mode="inhelptext">
    <xsl:variable name="myfield" select="child::field_name"/>
    <xsl:variable name="target" select="child::text_table_name"/>
    <span class="technical">
      <xsl:text>Text joined by field </xsl:text>
      <a>
	<xsl:attribute name="href">
	  <xsl:value-of select="concat('#',$myfield)"/>
	</xsl:attribute>
	<xsl:attribute name="onclick">
	  <xsl:value-of select="concat('ToggleAndHighlightField(',$aps,$myfield,$aps,')')"/>
	</xsl:attribute>
	<xsl:value-of select="$myfield"/>
      </a>
      <xsl:text> to table </xsl:text>
      <a>
	<xsl:attribute name="href">
	  <xsl:value-of select="concat($fn_prefix,$target,'.html')"/>
	</xsl:attribute>
	<xsl:value-of select="$target"/>
      </a>
    </span>
  </xsl:template>

  <xsl:template match="result_tables" mode="inhelptext">
    <xsl:variable name="FieldName" select="ancestor::field/name"/>
    <xsl:variable name="JnDetailsId" select="concat($aps,$FieldName,'.details',$aps)"/>
    <div class="InfoIcon technical">
      <xsl:text>Result Tables: </xsl:text>
      <a href="javascript:ToggleId({$JnDetailsId})" alt="Join details" title="Show Join details">
	<img src="../information.png"/>
      </a>
    </div>
    <ul class="Join">
      <xsl:for-each select="table">
	<xsl:variable name="filename" select="concat($fn_prefix,@name,'.html')"/>
	<li class="Join">
	  <a href="{$filename}">
	    <xsl:value-of select="@external_name"/>
	  </a>
	</li>
      </xsl:for-each>
    </ul>
  </xsl:template>
  
  <xsl:template match="result_flavour" mode="inhelptext">
    <li class="joinDetailsListItem">
      <xsl:text>Result Flavour: </xsl:text>
      <span class="results"><xsl:value-of select="child::result_type"/></span>
    </li>
    <li class="joinDetailsListItem">
      <xsl:text>Ordered: </xsl:text>
      <span class="results"><xsl:value-of select="child::ordered"/></span>
    </li>
  </xsl:template>

  <xsl:template match="dd_join" mode="inhelptext">
    <xsl:variable name="a_fld" select="@name"/>
    <li class="joinDetailsListItem">
      <xsl:text>Actual join: </xsl:text>
      <span>
	<!-- do I have this join as a join field? -->
	<xsl:attribute name="class">
	  <xsl:text>dd_join results</xsl:text>
	  <xsl:if test="ancestor::collection/field[name=$a_fld]">
	    <xsl:text> dd_join_as_field</xsl:text>
	  </xsl:if>
	</xsl:attribute>
	
	<xsl:value-of select="@name"/>
	
      </span>
    </li>
    <xsl:apply-templates mode="inhelptext"/>	
  </xsl:template>

  <xsl:template match="conditions" mode="inhelptext">
    <xsl:apply-templates mode="inhelptext"/>
  </xsl:template>

  <xsl:template match="condition" mode="inhelptext">
    <xsl:variable name="filename" select="concat($fn_prefix,@target_table,'.html')"/>
    <li class="joinDetailsListItem">
      <xsl:text>Target: </xsl:text>
      <span class="results">
	<a href="{$filename}">
	  <xsl:value-of select="@target_table"/>
	</a>
      </span>
    </li>
    <li class="joinDetailsListItem">
      <xsl:text>Condition: </xsl:text>
      <span class="results">
	<span class="name"><xsl:value-of select="@field1"/></span>
	<xsl:value-of select="@operator"/>
	<span class="name"><xsl:value-of select="@field2"/></span>
      </span>
    </li>
  </xsl:template>

  
  <xsl:template match="geometry_details">
    <xsl:value-of select="@type"/>
    <xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="geometry_details" mode="inhelptext">
    <xsl:apply-templates mode="inhelptext"/>
  </xsl:template>
  
  <xsl:template match="inmanifold">
  </xsl:template>

  <xsl:template match="priority">
    <span class="priority">
      <xsl:value-of select="."/>
    </span>
  </xsl:template>
  
  <xsl:template match="priority" mode="inhelptext">
    <!-- <div class="technical"> -->
    <!--   <xsl:text>DBprio: </xsl:text> -->
    <!--   <xsl:value-of select="."/> -->
    <!-- </div> -->
  </xsl:template>

  <xsl:template match="inmanifold" mode="inhelptext">
    <!-- to show manifold and a link to topology -->
    <xsl:text>Manifold: </xsl:text>
    <span class="name">
      <xsl:value-of select="@name"/>
    </span>
    <xsl:text> </xsl:text>
    <xsl:variable name="tabname" select="ancestor::collection/@name"/>
    <xsl:variable name="fldname" select="ancestor::field/name"/>
    <span class="technical">
      <a>
	<xsl:attribute name="href">
	  <xsl:value-of select="concat('../',$filename5s,'#',$tabname,'.',$fldname)"/>
	</xsl:attribute>
	<xsl:text>Topology&#187;</xsl:text>
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
    <xsl:apply-templates mode="inhelptext"/>
  </xsl:template>

  <xsl:template match="map" mode="inhelptext">
    <div>
      <span class="mapkey"><xsl:value-of select="@key"/></span>
      <span class="mapfld"><xsl:value-of select="@fld_external_name"/></span>
    </div>
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
    
  <xsl:template match="logical">
    <td class="technical">Logical</td>
  </xsl:template>
  
  <!-- END Templates for the properties of a field -->
  
  <xsl:template match="enumerator" mode="inline">
    <!-- The block that can be toggled in an enumerated field -->
    <table id="enu.{@name}" class="InlineBox" style="display:none;">
      <tr class="HeadStyle">
	<th class="name" colspan="3">
	  <xsl:value-of select="@name"/>
	</th>
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
	<xsl:call-template name="UsedUnusedEnum">
	  <xsl:with-param name="enum" select="@name"/>
	</xsl:call-template>
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
      <tr class="HeadingFldsUsingEnum">
	<td colspan="3">
	  <xsl:text>Fields using this enumerator:</xsl:text>
	</td>
      </tr>
      <xsl:call-template name="cols4enum">
	<xsl:with-param name="enumname" select="@name"/>
      </xsl:call-template>
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

  <xsl:template match="manifold_definitions">
  </xsl:template>
  
  <xsl:template match="default_topology_rules">
    <h3 class="float">Default Topology Rules</h3>
    <xsl:for-each select="manifold">
      <xsl:variable name="curman" select="@name"/>
      <table class="dmTable float DefaultTopRules">
	<tr>
	  <th colspan="4">
	    <xsl:text>Manifold: </xsl:text>
	    <xsl:call-template name="ExternalManifoldName">
	      <xsl:with-param name="intname" select="$curman"/>
	    </xsl:call-template>
	    <span class="technical InternalMfName">
	      <xsl:text> (</xsl:text>
	      <xsl:value-of select="@name"/>
	      <xsl:text>)</xsl:text>
	    </span>
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
  
  <xsl:template match="commonfields/group">
    <table class="dmTable float">
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
      <table class="dmTableDoc float">
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
 	<tr class="Info">
	  <td>
	    <xsl:text>SVG Document</xsl:text>				
	  </td>
	  <td>
	    <b><xsl:value-of select="$SVGName"/></b>
	  </td>
	</tr>
      </table>
    </div>
  </xsl:template>

  <xsl:template name="collectionlist">
    <!-- This template creates the table with the name and description of collections,
	 grouped by category-->
    <xsl:param name="path"/>
    <div class="overview">
      
      <div class="buttonbar float">
	<xsl:call-template name="Button">
	  <xsl:with-param name="function" select="'ToggleDetail();'"/>
	  <xsl:with-param name="label" select="'Details'"/>
	  <xsl:with-param name="state" select="'True'"/>
	</xsl:call-template>
      </div>
      
      <div style="overflow-x:auto">
      <table class="dmTable float">
	
	<xsl:for-each select="datamodel/category">
	    
	  <tr class="HeadStyle Category">
	    <th class="Category name" colspan="3"><xsl:value-of select="@name"/></th>
	  </tr>
	  <tr class="HeadStyle">
	    <th class="Header">
	      <xsl:text>Name</xsl:text>
	    </th>
	    <th class="Header technical">
	      <xsl:text>Internal name</xsl:text>
	    </th>
	    <th class="Header">
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
	    
	</xsl:for-each>
      </table>
      </div>
    </div>
  </xsl:template>
  
  
  <xsl:template name="cols4enum">
    <xsl:param name="enumname"/>
    <!-- Create a list all table.fields where enumerator "enumname" is
         used -->
    <xsl:for-each select="//enumerated">
      <xsl:choose>
	<xsl:when test="@name=$enumname">

	  <xsl:variable name="target_field" select="ancestor::field/name"/>
	  <xsl:variable name="target_table" select="ancestor::collection/@name"/>
	  <xsl:variable name="target_url" select="concat($fn_prefix,$target_table,'.html#',$target_field)"/>
	  
	  <tr class="FldsUsingEnum">
	    
	    <td colspan="2">
	      <a href="{$target_url}">
		<xsl:value-of select="ancestor::field/external_name"/>
	      </a>
	    </td>

	    <td>
	      <a href="{$target_url}">
		<xsl:value-of select="ancestor::collection/@external_name"/>
	      </a>
	    </td>

	  </tr>
	  
	</xsl:when>
	<xsl:otherwise>
	</xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="geomdetails">
    <xsl:apply-templates select="parent::field/sub_type/geometry_details" mode="inhelptext">
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

  <xsl:template name="UsedUnusedEnum">
    <!-- Return ' Used' or ' NotUsed' for enumerator name enum -->
    <xsl:param name="enum"/>
    <xsl:choose>
      <xsl:when test="//enumerated/@name=$enum">
	<xsl:text> Used</xsl:text>
      </xsl:when>
      <xsl:otherwise>
	<xsl:text> NotUsed</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template name="PageWithFilter">
    <!--
	Create a page with a list that can be filtered
    -->
    <xsl:param name="elemclass"/>  <!-- the object type to select -->
    <xsl:param name="selectList"/> <!-- the list of objects -->
    <xsl:param name="select"/>     <!-- the xpath expression for the element transforms -->
    
    <div class="container">

      <xsl:call-template name="TopFilterButton">
	<xsl:with-param name="elemclass" select="$elemclass"/>
      </xsl:call-template>
      
      <div class="navbox">
	<form method="GET">
	  <input class="Filter" type="text" id="FilterItem" onkeyup="Filter()" title="Type string to filter" placeholder="Filter..."/>
	  <input class="ClearFilter" type="image" onclick="ClearFilter()" title="Click to clear filter" src="../clear.png"/>
	</form>
	
	<div id="ListLinks">
	  <!-- list of elements -->
	  <xsl:for-each select="$selectList">
	    <div>
	      <a name="{@name}" href="#" onclick="{concat('ShowElement(',$aps,@name,$aps,',',$aps,$elemclass,$aps,')')}">
		<xsl:attribute name="class">
		  
		  <xsl:text>ListLink</xsl:text>
		  <xsl:if test="$elemclass = 'dmEnumerator'">
		    <xsl:call-template name="UsedUnusedEnum">
		      <xsl:with-param name="enum" select="@name"/>
		    </xsl:call-template>
		  </xsl:if>
		  
		</xsl:attribute>
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
  
  <xsl:template name="TopFilterButton">
    <!-- Create the filterbutton at the top. Radio buttons for Enumerator Page -->
    <xsl:param name="elemclass"/>
    <div style="text-align: center;">  
      <xsl:choose>
	<xsl:when test="$elemclass = 'dmEnumerator'">
	   <span>Show</span>
	   <div style="display: inline-block;">
	     <input type="radio" checked="checked" id="all" value="all" name="show" onclick="ToggleEnums(this)"/>
	     <label for="all">All</label>
	   </div>
	   <div style="display: inline-block;">
	     <input type="radio" id="Used" value="Used" name="show" onclick="ToggleEnums(this)"/>
	     <label for="used">Used</label>    
	   </div>
	   <div style="display: inline-block;">
	     <input type="radio" id="Unused" name="show" value="NotUsed" onclick="ToggleEnums(this)"/>
	     <label for="unused">Unused</label>
	   </div>
	</xsl:when>
	<xsl:otherwise>
	  <input type="checkbox" id="ToggleList" name="ToggleList" onclick="{concat('ToggleElements(',$aps,$elemclass,$aps,')')}" checked="checked"/>
	  <label for="ToggleList">Show all</label>
	</xsl:otherwise>
      </xsl:choose>
    </div>

  </xsl:template>
  
</xsl:stylesheet>
